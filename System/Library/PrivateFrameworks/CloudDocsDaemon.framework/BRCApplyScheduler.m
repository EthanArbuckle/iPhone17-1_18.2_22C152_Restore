@interface BRCApplyScheduler
- (BOOL)_rescheduleItemsParentedToItemGlobalID:(id)a3 flags:(unsigned int)a4;
- (BOOL)canScheduleMoreJobs;
- (BOOL)startWriteCoordinationInAppLibrary:(id)a3;
- (BRCApplyScheduler)initWithAccountSession:(id)a3;
- (id)descriptionForRejectedItem:(id)a3 context:(id)a4;
- (id)descriptionForServerItem:(id)a3 context:(id)a4;
- (unint64_t)_addRanksUpToRank:(int64_t)a3 inZone:(id)a4;
- (unint64_t)_writeCoordinationCount;
- (unint64_t)recoverAndReportMissingJobs;
- (unsigned)recoverMissingJobsAndReport:(BOOL)a3;
- (void)_close;
- (void)_fixupCZMAliasTargetWithAlias:(id)a3 target:(id)a4;
- (void)_handleWatchingFaults;
- (void)_rescheduleRank:(int64_t)a3 inState:(int)a4 forZone:(id)a5;
- (void)_scheduleApplyJobWithID:(id)a3 zone:(id)a4 applyKind:(unsigned int)a5;
- (void)_setState:(int)a3 andApplyKind:(unsigned int)a4 forJobID:(id)a5;
- (void)createApplyJobFromServerItem:(id)a3 localItem:(id)a4 state:(int)a5 kind:(unsigned int)a6;
- (void)deleteExpiredJobs;
- (void)deleteNonRejectionJobsForZone:(id)a3;
- (void)describeInBuffer:(id)a3 aggregateOfJobsMatching:(id)a4 context:(id)a5;
- (void)didCompleteCrossZoneMigrationForAppLibrary:(id)a3;
- (void)didCreateMissingParentID:(id)a3 zone:(id)a4;
- (void)didMarkSyncIdleForServerRank:(int64_t)a3 zone:(id)a4;
- (void)didReparentOrKillItemID:(id)a3 parentItemID:(id)a4 zone:(id)a5;
- (void)didSyncDownZone:(id)a3 requestID:(unint64_t)a4 upToRank:(int64_t)a5 caughtUpWithServer:(BOOL)a6;
- (void)endWriteCoordinationInAppLibrary:(id)a3 rowID:(int64_t)a4;
- (void)generatedRanksForZone:(id)a3 upToRank:(int64_t)a4;
- (void)monitorFaultingForZone:(id)a3;
- (void)repopulateJobsForZone:(id)a3;
- (void)rescheduleItemRank:(int64_t)a3 zoneRowID:(id)a4 matchingState:(int)a5;
- (void)rescheduleItemsParentedToItemGlobalID:(id)a3;
- (void)rescheduleItemsRecursivelyUnderFolder:(id)a3;
- (void)rescheduleMissingTargetAliasesWithTarget:(id)a3;
- (void)resetBackoffForServerItem:(id)a3;
- (void)schedule;
- (void)setState:(int)a3 andApplyKind:(unsigned int)a4 forRank:(int64_t)a5 zoneRowID:(id)a6;
- (void)setState:(int)a3 andApplyKind:(unsigned int)a4 forServerItem:(id)a5 localItem:(id)a6;
- (void)setState:(int)a3 forRank:(int64_t)a4 zoneRowID:(id)a5;
- (void)setState:(int)a3 forServerItem:(id)a4 localItem:(id)a5;
- (void)stopMonitoringFaultingForZone:(id)a3;
@end

@implementation BRCApplyScheduler

- (BRCApplyScheduler)initWithAccountSession:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BRCApplyScheduler;
  v3 = [(BRCFSSchedulerBase *)&v9 initWithSession:a3 name:@"Apply Changes" tableName:@"client_unapplied_table"];
  if (v3)
  {
    v4 = objc_alloc_init(BRCCountedSet);
    coordinatedWriters = v3->_coordinatedWriters;
    v3->_coordinatedWriters = v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    clientZonesWatchingFaults = v3->_clientZonesWatchingFaults;
    v3->_clientZonesWatchingFaults = v6;
  }
  return v3;
}

- (id)descriptionForServerItem:(id)a3 context:(id)a4
{
  id v6 = a4;
  v7 = -[BRCApplyJobIdentifier initWithItemDBRowID:]([BRCApplyJobIdentifier alloc], "initWithItemDBRowID:", [a3 rank]);
  v8 = [(BRCFSSchedulerBase *)self descriptionForJobsMatching:v7 context:v6];

  return v8;
}

- (id)descriptionForRejectedItem:(id)a3 context:(id)a4
{
  id v6 = a4;
  v7 = -[BRCApplyJobIdentifier initWithItemDBRowID:]([BRCApplyJobIdentifier alloc], "initWithItemDBRowID:", -[a3 dbRowID]);
  v8 = [(BRCFSSchedulerBase *)self descriptionForJobsMatching:v7 context:v6];

  return v8;
}

- (void)describeInBuffer:(id)a3 aggregateOfJobsMatching:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 db];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [(BRCAccountSession *)self->super._session clientDB];
  }
  v14 = v13;

  v15 = [v9 matchingJobsWhereSQLClause];
  v16 = (void *)[v14 fetch:@"SELECT throttle_state, COUNT(*) FROM client_unapplied_table WHERE %@ AND throttle_id > 0   AND throttle_id IN (SELECT item_rank FROM server_items) GROUP BY throttle_state", v15];

  if ([v16 next])
  {
    do
    {
      uint64_t v17 = [v16 unsignedIntAtIndex:0];
      uint64_t v18 = [v16 unsignedLongAtIndex:1];
      v19 = +[BRCDumpContext stringFromThrottleState:v17 context:v10];
      [v8 appendFormat:@" %@:%lld", v19, v18];
    }
    while (([v16 next] & 1) != 0);
  }
  v20 = [v9 matchingJobsWhereSQLClause];
  v21 = (void *)[v14 numberWithSQL:@"SELECT COUNT(*) FROM client_unapplied_table WHERE %@ AND throttle_id > 0   AND throttle_id NOT IN (SELECT item_rank FROM server_items)", v20];

  if (v21) {
    [v8 appendFormat:@" expired:%@", v21];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v28 = brc_bread_crumbs();
    v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      -[BRCApplyScheduler describeInBuffer:aggregateOfJobsMatching:context:]();
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v22 = v9;
  }
  else {
    v22 = 0;
  }
  id v23 = v22;
  if ([v23 isPrivateZone])
  {
    clientZonesWatchingFaults = self->_clientZonesWatchingFaults;
    v25 = [v23 clientZone];
    v26 = [v25 asPrivateClientZone];
    LODWORD(clientZonesWatchingFaults) = [(NSMutableSet *)clientZonesWatchingFaults containsObject:v26];

    if (clientZonesWatchingFaults)
    {
      v27 = [v10 highlightedString:@" has-faulting-barriers" type:3];
      [v8 appendString:v27];
    }
  }
}

- (void)setState:(int)a3 forServerItem:(id)a4 localItem:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v8;
  id v11 = v9;
  if ([v10 isLive] && objc_msgSend(v11, "isRejected"))
  {
    v14 = brc_bread_crumbs();
    v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCApplyScheduler setState:forServerItem:localItem:]();
    }
  }
  if ([v11 isRejected]) {
    uint64_t v12 = -[v11 dbRowID];
  }
  else {
    uint64_t v12 = [v10 rank];
  }
  id v13 = [[BRCApplyJobIdentifier alloc] initWithItemDBRowID:v12];

  [(BRCFSSchedulerBase *)self setState:v6 forJobID:v13];
}

- (void)setState:(int)a3 forRank:(int64_t)a4 zoneRowID:(id)a5
{
  uint64_t v5 = *(void *)&a3;
  v7 = [[BRCApplyJobIdentifier alloc] initWithItemDBRowID:a4];
  [(BRCFSSchedulerBase *)self setState:v5 forJobID:v7];
}

- (void)rescheduleItemRank:(int64_t)a3 zoneRowID:(id)a4 matchingState:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v7 = [[BRCApplyJobIdentifier alloc] initWithItemDBRowID:a3];
  [(BRCFSSchedulerBase *)self rescheduleSuspendedJobsMatching:v7 inState:v5];
}

- (void)_setState:(int)a3 andApplyKind:(unsigned int)a4 forJobID:(id)a5
{
  if (a5)
  {
    uint64_t v5 = *(void *)&a4;
    session = self->super._session;
    id v9 = a5;
    id v10 = [(BRCAccountSession *)session clientDB];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__BRCApplyScheduler__setState_andApplyKind_forJobID___block_invoke;
    v13[3] = &unk_1E6995FD8;
    v13[4] = self;
    int v14 = a3;
    int v15 = v5;
    id v11 = (void *)MEMORY[0x1D94389C0](v13);
    uint64_t v12 = [v9 matchingJobsWhereSQLClause];

    [v10 execute:@"UPDATE client_unapplied_table   SET throttle_state = call_block(%@, next_retry_stamp, apply_kind), apply_kind = %u WHERE %@", v11, v5, v12];
    if (a3 <= 0) {
      [(BRCFSSchedulerBase *)self checkIfHasWork];
    }
  }
}

void __53__BRCApplyScheduler__setState_andApplyKind_forJobID___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  int v7 = sqlite3_value_int(a4[1]);
  if (*(_DWORD *)(a1 + 40) == 1) {
    [*(id *)(a1 + 32) signalWithDeadline:sqlite3_value_int64(*a4)];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 88) count]) {
    BOOL v8 = v7 == 1;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8 && (*(_DWORD *)(a1 + 44) != 1 || *(_DWORD *)(a1 + 40) != 1)) {
    [*(id *)(a1 + 32) signal];
  }
  int v9 = *(_DWORD *)(a1 + 40);
  sqlite3_result_int(a2, v9);
}

- (void)setState:(int)a3 andApplyKind:(unsigned int)a4 forServerItem:(id)a5 localItem:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = v10;
  id v13 = v11;
  if ([v12 isLive] && objc_msgSend(v13, "isRejected"))
  {
    v16 = brc_bread_crumbs();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCApplyScheduler setState:forServerItem:localItem:]();
    }
  }
  if ([v13 isRejected]) {
    uint64_t v14 = -[v13 dbRowID];
  }
  else {
    uint64_t v14 = [v12 rank];
  }
  int v15 = [[BRCApplyJobIdentifier alloc] initWithItemDBRowID:v14];

  [(BRCApplyScheduler *)self _setState:v8 andApplyKind:v7 forJobID:v15];
}

- (void)setState:(int)a3 andApplyKind:(unsigned int)a4 forRank:(int64_t)a5 zoneRowID:(id)a6
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  int v9 = [[BRCApplyJobIdentifier alloc] initWithItemDBRowID:a5];
  [(BRCApplyScheduler *)self _setState:v7 andApplyKind:v6 forJobID:v9];
}

- (void)resetBackoffForServerItem:(id)a3
{
  v4 = -[BRCApplyJobIdentifier initWithItemDBRowID:]([BRCApplyJobIdentifier alloc], "initWithItemDBRowID:", [a3 rank]);
  v5.receiver = self;
  v5.super_class = (Class)BRCApplyScheduler;
  [(BRCFSSchedulerBase *)&v5 resetBackoffForJobWithID:v4];
}

- (void)createApplyJobFromServerItem:(id)a3 localItem:(id)a4 state:(int)a5 kind:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  unint64_t v10 = (unint64_t)a3;
  unint64_t v11 = (unint64_t)a4;
  if (!(v10 | v11))
  {
    v39 = self;
    v40 = brc_bread_crumbs();
    v41 = brc_default_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
      -[BRCApplyScheduler createApplyJobFromServerItem:localItem:state:kind:]();
    }

    self = v39;
  }
  id v12 = [(id)v10 serverZone];
  id v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [(id)v11 serverZone];
  }
  int v15 = v14;

  v16 = [v15 metadataSyncContext];
  id v17 = (id)v10;
  id v18 = (id)v11;
  if ([v17 isLive] && objc_msgSend(v18, "isRejected"))
  {
    id v42 = v18;
    v43 = brc_bread_crumbs();
    v44 = brc_default_log();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
      -[BRCApplyScheduler setState:forServerItem:localItem:]();
    }

    id v18 = v42;
  }
  v19 = v15;
  uint64_t v20 = v7;
  v21 = v18;
  if ([v18 isRejected]) {
    uint64_t v22 = -[v18 dbRowID];
  }
  else {
    uint64_t v22 = [v17 rank];
  }
  id v23 = [[BRCApplyJobIdentifier alloc] initWithItemDBRowID:v22];
  v45 = v21;

  v47 = v17;
  v46 = v16;
  v24 = [v16 applyThrottle];
  v25 = objc_msgSend(MEMORY[0x1E4FBA908], "rawInjection:length:", "apply_kind, zone_rowid", 22);
  v26 = (void *)MEMORY[0x1E4FBA8F8];
  v27 = [v19 dbRowID];
  v28 = [v26 formatInjection:@"%u, %@", v6, v27];
  v29 = (void *)MEMORY[0x1E4FBA8F8];
  v48 = v19;
  uint64_t v30 = [v19 dbRowID];
  uint64_t v31 = v6;
  v32 = (void *)v30;
  v33 = [v29 formatInjection:@"apply_kind = %u, zone_rowid = %@", v31, v30];
  int v34 = [(BRCFSSchedulerBase *)self insertOrUpdateJobID:v23 throttle:v24 withState:v20 insertedSQLColumn:v25 insertedSQLValues:v28 updatedSQLValues:v33 error:0];
  v35 = self;
  int v36 = v34;
  uint64_t v38 = v37;

  if (v36 == 1) {
    [(BRCFSSchedulerBase *)v35 signalWithDeadline:v38];
  }
}

- (void)didCreateMissingParentID:(id)a3 zone:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  session = self->super._session;
  id v8 = a4;
  int v9 = [(BRCAccountSession *)session clientDB];
  unint64_t v10 = brc_bread_crumbs();
  unint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[BRCApplyScheduler didCreateMissingParentID:zone:]();
  }

  id v12 = [v8 dbRowID];
  id v13 = [v8 dbRowID];

  [v9 execute:@"UPDATE client_unapplied_table    SET throttle_state = 1  WHERE zone_rowid = %@     AND throttle_state IN (21, 16)    AND throttle_id IN (SELECT item_rank FROM server_items                        WHERE zone_rowid = %@ AND item_parent_id = %@)", v12, v13, v6];
  uint64_t v14 = [v9 changes];
  if ([v6 isDocumentsFolder])
  {
    [v9 execute:@"UPDATE client_unapplied_table    SET throttle_state = 1  WHERE throttle_state IN (21, 16)    AND throttle_id IN (SELECT item_rank FROM server_items WHERE (item_sharing_options & 4) != 0 AND item_id_is_shared_root(item_parent_id))"];
    v14 += [v9 changes];
  }
  if (v14)
  {
    int v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      uint64_t v22 = v15;
      _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes: retrying %lld suspended throttles (missing parent found: %@)%@", buf, 0x20u);
    }

    [(BRCFSSchedulerBase *)self signal];
  }
}

- (void)didReparentOrKillItemID:(id)a3 parentItemID:(id)a4 zone:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(BRCAccountSession *)self->super._session clientDB];
  id v12 = [v10 dbRowID];
  id v13 = [v10 dbRowID];
  uint64_t v14 = [v10 dbRowID];
  [v11 execute:@"WITH RECURSIVE  reschedulable_items (item_rank, item_id) AS(   SELECT si.item_rank, si.item_id      FROM server_items AS si     WHERE si.zone_rowid = %@       AND si.item_type IN (0, 9, 10, 4) AND NOT EXISTS (SELECT 1 FROM client_items AS ci         WHERE ci.item_parent_zone_rowid = %@ AND ci.item_parent_id = si.item_id           AND ci.item_state IN (0, -1)   ) ) UPDATE client_unapplied_table    SET throttle_state = 1  WHERE zone_rowid = %@     AND throttle_state = 25    AND throttle_id IN (SELECT item_rank FROM reschedulable_items WHERE item_id = %@)", v12, v13, v14, v9];

  uint64_t v15 = [v11 changes];
  if (v15)
  {
    uint64_t v16 = v15;
    id v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      uint64_t v26 = v16;
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2112;
      id v30 = v9;
      __int16 v31 = 2112;
      v32 = v17;
      __int16 v19 = "[DEBUG] Apply Changes: retrying %lld suspended throttles (child %@ of %@ killed or reparented)%@";
LABEL_9:
      _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, v19, buf, 0x2Au);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  id v20 = [v10 dbRowID];
  __int16 v21 = [v10 dbRowID];
  uint64_t v22 = [v10 dbRowID];
  [v11 execute:@"WITH RECURSIVE  reschedulable_items (throttle_id, item_id) AS(   SELECT -pi.rowid, pi.item_id      FROM client_items AS pi     WHERE pi.zone_rowid = %@       AND pi.item_type IN (0, 9, 10, 4) AND NOT EXISTS (SELECT 1 FROM client_items AS ci         WHERE ci.item_parent_zone_rowid = %@ AND ci.item_parent_id = pi.item_id           AND ci.item_state IN (0, -1)   ) ) UPDATE client_unapplied_table    SET throttle_state = 1  WHERE zone_rowid = %@     AND throttle_state = 25    AND throttle_id IN (SELECT throttle_id FROM reschedulable_items WHERE item_id = %@)", v20, v21, v22, v9];

  uint64_t v23 = [v11 changes];
  if (v23)
  {
    uint64_t v24 = v23;
    id v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      uint64_t v26 = v24;
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2112;
      id v30 = v9;
      __int16 v31 = 2112;
      v32 = v17;
      __int16 v19 = "[DEBUG] Apply Changes: retrying %lld suspended rejected throttles (child %@ of %@ killed or reparented)%@";
      goto LABEL_9;
    }
LABEL_6:

    [(BRCFSSchedulerBase *)self signal];
  }
}

- (void)didCompleteCrossZoneMigrationForAppLibrary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(BRCAccountSession *)self->super._session clientDB];
  id v6 = [(BRCAccountSession *)self->super._session cloudDocsClientZone];
  uint64_t v7 = [v6 dbRowID];

  id v8 = [v4 rootItemID];
  [v5 execute:@"UPDATE client_unapplied_table    SET throttle_state = 1  WHERE zone_rowid = %@     AND throttle_state = %u    AND throttle_id IN (SELECT item_rank FROM server_items                        WHERE zone_rowid = %@ AND item_parent_id = %@)", v7, 27, v7, v8];
  uint64_t v9 = [v5 changes];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = [v4 logName];
      *(_DWORD *)buf = 134218498;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v13;
      __int16 v18 = 2112;
      __int16 v19 = v11;
      _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes: retrying %lld suspended throttles (appLibrary completed migration: %@)%@", buf, 0x20u);
    }
    [(BRCFSSchedulerBase *)self signal];
  }
}

- (void)_rescheduleRank:(int64_t)a3 inState:(int)a4 forZone:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  uint64_t v9 = [(BRCAccountSession *)self->super._session clientDB];
  if ((int)v5 <= 1)
  {
    id v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCApplyScheduler _rescheduleRank:inState:forZone:]();
    }
  }
  uint64_t v10 = [v8 dbRowID];
  [v9 execute:@"UPDATE client_unapplied_table SET throttle_state = 1 WHERE throttle_state = %u AND zone_rowid = %@ AND throttle_id = %llu", v5, v10, a3];

  if ([v9 changes])
  {
    unint64_t v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[BRCApplyScheduler _rescheduleRank:inState:forZone:]();
    }

    [(BRCFSSchedulerBase *)self signal];
  }
}

- (void)didMarkSyncIdleForServerRank:(int64_t)a3 zone:(id)a4
{
}

- (void)_fixupCZMAliasTargetWithAlias:(id)a3 target:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v30 = v6;
    __int16 v31 = 2112;
    id v32 = v7;
    __int16 v33 = 2112;
    int v34 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Target zone was moved to clouddocs.  Fixing up alias %@ pointing to %@%@", buf, 0x20u);
  }

  [v6 learnTarget:v7];
  uint64_t v10 = [v6 st];
  unint64_t v11 = [v10 fileID];

  uint64_t v26 = v11;
  if (v11)
  {
    id v12 = -[BRCRelativePath initWithFileID:session:]([BRCRelativePath alloc], "initWithFileID:session:", [v11 longLongValue], self->super._session);
    if ([(BRCRelativePath *)v12 resolveMustExist:1 error:0])
    {
      if (v12)
      {
        id v13 = [(BRCRelativePath *)v12 appLibrary];
        uint64_t v14 = [[BRCRelativePath alloc] initWithFileID:[(BRCRelativePath *)v12 parentFileID] session:self->super._session];

        [0 resolveAndKeepOpenMustExist:1 error:0];
        uint64_t v15 = 0;
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  __int16 v16 = [[BRCItemToPathLookup alloc] initWithItem:v6];
  uint64_t v15 = [(BRCItemToPathLookup *)v16 parentPath];
  [v15 resolveAndKeepOpenMustExist:1 error:0];
  id v13 = [v15 appLibrary];
  [(BRCItemToPathLookup *)v16 closePaths];

  uint64_t v14 = 0;
LABEL_9:
  id v17 = [[BRCBookmark alloc] initWithTarget:v7 owningAppLibrary:v13 path:0 session:self->super._session];
  id v28 = 0;
  BOOL v18 = [(BRCBookmark *)v17 resolveWithError:&v28];
  id v19 = v28;
  if (v18)
  {
    if (v14) {
      [(BRCRelativePath *)v14 filename];
    }
    else {
    uint64_t v22 = +[BRCBookmark createName];
    }
    id v27 = v19;
    uint64_t v20 = [(BRCBookmark *)v17 writeUnderParent:v15 name:v22 error:&v27];
    id v23 = v27;

    if (v20)
    {
      [v6 updateFromFSAtPath:v20];
      [v6 markNeedsUploadOrSyncingUpWithAliasTarget:v7];
      [v6 saveToDB];
    }
    else
    {
      uint64_t v24 = brc_bread_crumbs();
      v25 = brc_default_log();
      if (os_log_type_enabled(v25, (os_log_type_t)0x90u)) {
        -[BRCApplyScheduler _fixupCZMAliasTargetWithAlias:target:]();
      }
    }
    id v19 = v23;
  }
  else
  {
    uint64_t v20 = brc_bread_crumbs();
    __int16 v21 = brc_default_log();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u)) {
      -[BRCApplyScheduler _fixupCZMAliasTargetWithAlias:target:]();
    }
  }
  [v15 close];
}

- (void)rescheduleMissingTargetAliasesWithTarget:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isSharedToMeTopLevelItem] & 1) == 0)
  {
    uint64_t v5 = [v4 serverZone];
    id v6 = [v4 unsaltedBookmarkData];
    id v7 = [v4 appLibrary];
    id v8 = [v7 mangledID];
    uint64_t v9 = +[BRCUserDefaults defaultsForMangledID:v8];
    int v10 = [v9 shouldFixupTargetCZMAliases];

    if (v10)
    {
      if ([v5 isSharedZone])
      {
        unint64_t v11 = [v5 zoneName];
        id v12 = (void *)*MEMORY[0x1E4F59418];
        if ([v11 isEqualToString:*MEMORY[0x1E4F59418]])
        {
          int v13 = [v6 hasPrefix:v12];

          if (v13)
          {
            v39 = v5;
            uint64_t v14 = objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v12, "length"));
            uint64_t v38 = objc_msgSend(v14, "br_stringByBackslashEscapingCharactersInString:", @"\\_%");
            uint64_t v15 = objc_msgSend(@"%", "stringByAppendingString:");
            __int16 v16 = [(BRCAccountSession *)self->super._session clientDB];
            uint64_t v37 = (void *)v15;
            id v17 = (void *)[v16 fetch:@"SELECT item_rank, zone_rowid, item_id, item_alias_target FROM server_items WHERE item_alias_target LIKE %@ ESCAPE '\\' AND item_type = 3", v15];

            if ([v17 next])
            {
              do
              {
                uint64_t v18 = [v17 longLongAtIndex:0];
                id v19 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v17, "longLongAtIndex:", 1));
                uint64_t v20 = [v17 objectOfClass:objc_opt_class() atIndex:2];
                __int16 v21 = [v17 stringAtIndex:3];
                uint64_t v22 = [(BRCAccountSession *)self->super._session serverZoneByRowID:v19];
                if (([v21 isEqualToString:v6] & 1) == 0)
                {
                  __int16 v33 = [v22 clientZone];
                  __int16 v31 = [v33 itemByItemID:v20];
                  uint64_t v35 = [v31 asBRAlias];

                  if (v35)
                  {
                    int v34 = brc_bread_crumbs();
                    id v32 = brc_default_log();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      v41 = v35;
                      __int16 v42 = 2112;
                      v43 = v34;
                      _os_log_impl(&dword_1D353B000, v32, OS_LOG_TYPE_DEFAULT, "[WARNING] Strange, the alias %@ is already local.  Allowing it anyway%@", buf, 0x16u);
                    }
                  }
                  else
                  {
                    int v36 = [v22 clientZone];
                    int v34 = [v36 serverItemByItemID:v20];

                    id v32 = [v34 newLocalItemWithServerZone:v39 dbRowID:0];
                    uint64_t v35 = [v32 asBRAlias];
                  }

                  [(BRCApplyScheduler *)self _fixupCZMAliasTargetWithAlias:v35 target:v4];
                }
                [(BRCApplyScheduler *)self _rescheduleRank:v18 inState:24 forZone:v22];
              }
              while (([v17 next] & 1) != 0);
            }

            uint64_t v5 = v39;
LABEL_23:

            goto LABEL_24;
          }
        }
        else
        {
        }
      }
      if ([v5 isSharedZone])
      {
        id v23 = [v5 zoneName];
        int v24 = [v23 isEqualToString:*MEMORY[0x1E4F59418]];

        if (v24)
        {
          v25 = brc_bread_crumbs();
          uint64_t v26 = brc_default_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
            -[BRCApplyScheduler rescheduleMissingTargetAliasesWithTarget:]();
          }
        }
      }
    }
    id v27 = [(BRCAccountSession *)self->super._session clientDB];
    uint64_t v14 = (void *)[v27 fetch:@"SELECT item_rank, zone_rowid FROM server_items WHERE item_alias_target = %@ AND item_type = 3", v6];

    if ([v14 next])
    {
      do
      {
        uint64_t v28 = [v14 longLongAtIndex:0];
        __int16 v29 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v14, "longLongAtIndex:", 1));
        id v30 = [(BRCAccountSession *)self->super._session serverZoneByRowID:v29];
        [(BRCApplyScheduler *)self _rescheduleRank:v28 inState:24 forZone:v30];
      }
      while (([v14 next] & 1) != 0);
    }
    goto LABEL_23;
  }
LABEL_24:
}

- (void)rescheduleItemsParentedToItemGlobalID:(id)a3
{
}

- (BOOL)_rescheduleItemsParentedToItemGlobalID:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [v6 itemID];
  id v8 = [v6 zoneRowID];
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v9 = [(BRCAccountSession *)self->super._session clientDB];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__BRCApplyScheduler__rescheduleItemsParentedToItemGlobalID_flags___block_invoke;
  v14[3] = &unk_1E6996000;
  id v10 = v7;
  id v15 = v10;
  id v19 = &v20;
  id v11 = v8;
  id v16 = v11;
  id v17 = self;
  id v12 = v6;
  id v18 = v12;
  [v9 performWithFlags:v4 action:v14];

  LOBYTE(v4) = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&v20, 8);

  return v4;
}

uint64_t __66__BRCApplyScheduler__rescheduleItemsParentedToItemGlobalID_flags___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([*(id *)(a1 + 32) isNonDesktopRoot] & 1) == 0)
  {
    [v3 execute:@"UPDATE client_items SET item_type = 0 WHERE item_id = %@ AND zone_rowid = %@ AND item_type = 9 AND (SELECT 1 FROM server_items AS si               WHERE client_items.item_id = si.item_id                AND client_items.zone_rowid = si.zone_rowid                AND si.item_type = 0 LIMIT 1)", *(void *)(a1 + 32), *(void *)(a1 + 40)];
    if (![v3 changes])
    {
      id v10 = brc_bread_crumbs();
      id v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __66__BRCApplyScheduler__rescheduleItemsParentedToItemGlobalID_flags___block_invoke_cold_2();
      }
      goto LABEL_14;
    }
    [v3 execute:@"UPDATE item_recursive_properties SET item_type = 0, dir_faults_count = dir_faults_count - 1 WHERE item_id = %@ AND zone_rowid = %@", *(void *)(a1 + 32), *(void *)(a1 + 40)];
    uint64_t v4 = [*(id *)(*(void *)(a1 + 48) + 8) serverZoneByRowID:*(void *)(a1 + 40)];
    uint64_t v5 = [v4 clientZone];
    [v5 scheduleSyncUp];

    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __66__BRCApplyScheduler__rescheduleItemsParentedToItemGlobalID_flags___block_invoke_cold_3();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  [v3 execute:@"UPDATE client_unapplied_table SET throttle_state = 1 WHERE throttle_state != 0 AND throttle_id IN (SELECT item_rank FROM server_items WHERE item_parent_id = %@ AND zone_rowid = %@)", *(void *)(a1 + 32), *(void *)(a1 + 40)];
  if (![v3 changes])
  {
    id v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __66__BRCApplyScheduler__rescheduleItemsParentedToItemGlobalID_flags___block_invoke_cold_1();
    }
LABEL_14:

    goto LABEL_15;
  }
  id v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = [v3 changes];
    uint64_t v14 = [*(id *)(a1 + 32) debugItemIDString];
    *(_DWORD *)buf = 134218498;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    id v18 = v14;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes: Rescheduled %lld items which were blocked for greediness when listing folder %@%@", buf, 0x20u);
  }
  [*(id *)(a1 + 48) signal];
LABEL_15:

  return 1;
}

- (void)rescheduleItemsRecursivelyUnderFolder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCAccountSession *)self->super._session clientDB];
  id v6 = [(BRCAccountSession *)self->super._session clientTruthWorkloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__BRCApplyScheduler_rescheduleItemsRecursivelyUnderFolder___block_invoke;
  block[3] = &unk_1E6993600;
  id v10 = v5;
  id v11 = v4;
  id v12 = self;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __59__BRCApplyScheduler_rescheduleItemsRecursivelyUnderFolder___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__BRCApplyScheduler_rescheduleItemsRecursivelyUnderFolder___block_invoke_2;
  v5[3] = &unk_1E6993A88;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 performWithFlags:8 action:v5];
}

uint64_t __59__BRCApplyScheduler_rescheduleItemsRecursivelyUnderFolder___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v5 = [v4 rescheduleItemsRecursivelyBatchSize];

  id v6 = [*(id *)(a1 + 32) zoneRowID];
  uint64_t v7 = [*(id *)(a1 + 32) itemID];
  unint64_t v23 = v5;
  int v24 = v3;
  id v8 = (void *)[v3 fetch:@"WITH RECURSIVE item_children_with_faults (item_id, zone_rowid, item_type) AS(    SELECT item_id, zone_rowid, item_type FROM item_recursive_properties     WHERE zone_rowid = %@ AND item_parent_id = %@ AND item_type IN (0, 9, 10)       AND dir_faults_count > 0 AND NOT item_id_is_documents(item_id)  UNION ALL     SELECT ip.item_id, ip.zone_rowid, ip.item_type FROM item_recursive_properties AS ip     INNER JOIN item_children_with_faults AS p     WHERE ip.item_parent_id = p.item_id       AND ip.zone_rowid = p.zone_rowid       AND ip.item_type IN (0, 9, 10)       AND ip.dir_faults_count > 0) SELECT item_id, zone_rowid FROM item_children_with_faults AS ic WHERE ic.item_type = 9 LIMIT %lld", v6, v7, v5];

  unint64_t v9 = 0;
  if ([v8 next])
  {
    unint64_t v9 = 0;
    while (1)
    {
      id v10 = (void *)MEMORY[0x1D9438760]();
      id v11 = [v8 objectOfClass:objc_opt_class() atIndex:0];
      id v12 = [v8 objectOfClass:objc_opt_class() atIndex:1];
      uint64_t v13 = [[BRCItemGlobalID alloc] initWithZoneRowID:v12 itemID:v11];
      uint64_t v14 = brc_bread_crumbs();
      id v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v26 = v13;
        __int16 v27 = 2112;
        uint64_t v28 = v14;
        _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] Rescheduling items at a flat level under %@%@", buf, 0x16u);
      }

      uint64_t v16 = [*(id *)(*(void *)(a1 + 40) + 8) applyScheduler];
      char v17 = [v16 _rescheduleItemsParentedToItemGlobalID:v13 flags:0];

      if ((v17 & 1) == 0) {
        break;
      }

      ++v9;
      if (![v8 next]) {
        goto LABEL_7;
      }
    }
    uint64_t v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      __59__BRCApplyScheduler_rescheduleItemsRecursivelyUnderFolder___block_invoke_2_cold_1();
    }
  }
  else
  {
LABEL_7:
    id v18 = *(id **)(a1 + 40);
    if (v9 >= v23)
    {
      [v18 rescheduleItemsRecursivelyUnderFolder:*(void *)(a1 + 32)];
    }
    else
    {
      __int16 v19 = [v18[1] applyScheduler];
      [v19 _rescheduleItemsParentedToItemGlobalID:*(void *)(a1 + 32) flags:0];
    }
  }

  return 1;
}

- (void)repopulateJobsForZone:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCAccountSession *)self->super._session clientDB];
  id v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BRCApplyScheduler repopulateJobsForZone:]();
  }

  id v8 = [v4 dbRowID];
  unint64_t v9 = [v4 dbRowID];
  [v5 execute:@"INSERT OR REPLACE INTO client_unapplied_table(zone_rowid, throttle_id, throttle_state, apply_kind) SELECT %@, -rowid, 1, %u FROM client_items WHERE zone_rowid = %@ AND item_localsyncupstate = 1", v8, 0, v9];

  id v10 = [v4 dbRowID];
  id v11 = [v4 dbRowID];
  [v5 execute:@"INSERT OR REPLACE INTO client_unapplied_table(zone_rowid, throttle_id, throttle_state, apply_kind) SELECT %@, item_rank, 1, %u FROM server_items WHERE zone_rowid = %@", v10, 1, v11];
}

- (void)schedule
{
  id v3 = +[BRCUserDefaults defaultsForMangledID:0];
  int v4 = [v3 writerApplyBatchSize];
  int v5 = [v3 applySchedulerJobMaxRetriesBeforeAssert];
  id v6 = [(BRCAccountSession *)self->super._session clientDB];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__BRCApplyScheduler_schedule__block_invoke;
  v7[3] = &unk_1E6996050;
  v7[4] = self;
  int v8 = v4;
  int v9 = v5;
  [v6 groupInTransaction:v7];
}

uint64_t __29__BRCApplyScheduler_schedule__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned int *)(a1 + 40);
  int v4 = objc_msgSend(MEMORY[0x1E4FBA908], "rawInjection:length:", "throttle_id, zone_rowid, apply_kind, retry_count", 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__BRCApplyScheduler_schedule__block_invoke_2;
  v6[3] = &unk_1E6996028;
  v6[4] = *(void *)(a1 + 32);
  int v7 = *(_DWORD *)(a1 + 44);
  [v2 scheduleWithBatchSize:v3 whereSQLClause:0 columns:v4 actionHandler:v6];

  if ([*(id *)(*(void *)(a1 + 32) + 88) count]) {
    [*(id *)(a1 + 32) _handleWatchingFaults];
  }
  return 1;
}

void __29__BRCApplyScheduler_schedule__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (a3 + 1);
  id v6 = a2;
  int v7 = [v6 numberAtIndex:v5];
  int v8 = [*(id *)(*(void *)(a1 + 32) + 8) serverZoneByRowID:v7];
  int v9 = -[BRCApplyJobIdentifier initWithItemDBRowID:]([BRCApplyJobIdentifier alloc], "initWithItemDBRowID:", [v6 unsignedLongLongAtIndex:a3]);
  uint64_t v10 = [v6 unsignedIntAtIndex:(a3 + 2)];
  id v11 = [v6 numberAtIndex:(a3 + 3)];

  if ([v11 longLongValue] >= *(unsigned int *)(a1 + 40))
  {
    id v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      uint64_t v14 = [(BRCApplyJobIdentifier *)v9 rank];
      id v15 = [*(id *)(a1 + 32) tableName];
      int v16 = 134218754;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      __int16 v19 = v15;
      __int16 v20 = 2048;
      uint64_t v21 = [v11 longLongValue];
      __int16 v22 = 2112;
      unint64_t v23 = v12;
      _os_log_fault_impl(&dword_1D353B000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Apply Changes for rank %lld in table %@ seems to keep failing. retry_count: %lld%@", (uint8_t *)&v16, 0x2Au);
    }
  }
  [*(id *)(a1 + 32) _scheduleApplyJobWithID:v9 zone:v8 applyKind:v10];
}

- (void)_scheduleApplyJobWithID:(id)a3 zone:(id)a4 applyKind:(unsigned int)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 clientZone];
  if ([v8 serverItemRank])
  {
    uint64_t v11 = objc_msgSend(v10, "serverItemByRank:", objc_msgSend(v8, "serverItemRank"));
  }
  else
  {
    uint64_t v11 = 0;
  }
  if ([v8 rejectedRowID])
  {
    uint64_t v12 = objc_msgSend(v10, "itemByRowID:", objc_msgSend(v8, "rejectedRowID"));
  }
  else
  {
    uint64_t v13 = [(id)v11 itemID];
    uint64_t v12 = [v10 itemByItemID:v13];
  }
  uint64_t v39 = [v8 rank];
  uint64_t v14 = _os_activity_create(&dword_1D353B000, "apply-changes", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  if (!v9)
  {
    int v34 = brc_bread_crumbs();
    uint64_t v35 = brc_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
      -[BRCApplyScheduler _scheduleApplyJobWithID:zone:applyKind:]();
    }
  }
  memset(v50, 0, sizeof(v50));
  __brc_create_section(1, (uint64_t)"-[BRCApplyScheduler _scheduleApplyJobWithID:zone:applyKind:]", 704, v50);
  id v15 = brc_bread_crumbs();
  int v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v38 = v9;
    uint64_t v17 = self;
    __int16 v18 = v14;
    __int16 v19 = v10;
    uint64_t v20 = v50[0];
    uint64_t v21 = BRCPrettyPrintEnum();
    *(_DWORD *)buf = 134219266;
    uint64_t v53 = v20;
    __int16 v54 = 2112;
    id v55 = v8;
    __int16 v56 = 2080;
    uint64_t v57 = v21;
    __int16 v58 = 2112;
    uint64_t v59 = v11;
    __int16 v60 = 2112;
    uint64_t v61 = v12;
    __int16 v62 = 2112;
    v63 = v15;
    _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx Apply Changes[%@]: attempting to apply %s\n  server item: %@\n  local item:  %@%@", buf, 0x3Eu);
    uint64_t v10 = v19;
    uint64_t v14 = v18;
    self = v17;
    id v9 = v38;
  }

  if (!a5)
  {
    if (v11)
    {
      int v36 = brc_bread_crumbs();
      uint64_t v37 = brc_default_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
        -[BRCApplyScheduler _scheduleApplyJobWithID:zone:applyKind:]();
      }
    }
    if (v12)
    {
      if ([(id)v12 isRejected])
      {
        uint64_t v11 = 0;
LABEL_21:
        __int16 v22 = [(BRCAccountSession *)self->super._session clientDB];
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __60__BRCApplyScheduler__scheduleApplyJobWithID_zone_applyKind___block_invoke;
        v40[3] = &unk_1E6996078;
        id v41 = (id)v12;
        id v42 = v8;
        v43 = self;
        id v44 = v9;
        uint64_t v11 = (uint64_t)(id)v11;
        id v45 = (id)v11;
        v46 = v14;
        [v22 groupInBatch:v40];

        goto LABEL_31;
      }
      uint64_t v47 = 0;
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      __brc_create_section(0, (uint64_t)"-[BRCApplyScheduler _scheduleApplyJobWithID:zone:applyKind:]", 723, &v47);
      unint64_t v23 = brc_bread_crumbs();
      uint64_t v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v53 = v47;
        __int16 v54 = 2112;
        id v55 = v8;
        __int16 v56 = 2112;
        uint64_t v57 = (uint64_t)v23;
        _os_log_debug_impl(&dword_1D353B000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Apply Changes[%@]: deleting rejected action with a non-rejected local item%@", buf, 0x20u);
      }
LABEL_30:

      [(BRCFSSchedulerBase *)self deleteJobsMatching:v8];
      __brc_leave_section(&v47);
      uint64_t v11 = 0;
      goto LABEL_31;
    }
LABEL_22:
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCApplyScheduler _scheduleApplyJobWithID:zone:applyKind:]", 720, &v47);
    unint64_t v23 = brc_bread_crumbs();
    uint64_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v53 = v47;
      __int16 v54 = 2112;
      id v55 = v8;
      __int16 v56 = 2112;
      uint64_t v57 = (uint64_t)v23;
      _os_log_debug_impl(&dword_1D353B000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Apply Changes[%@]: deleting action without local and server item%@", buf, 0x20u);
    }
    goto LABEL_30;
  }
  if (a5 != 1 || !v12)
  {
    if (v12 | v11) {
      goto LABEL_19;
    }
    goto LABEL_22;
  }
  [(id)v12 isReserved];
LABEL_19:
  if (!v11 || [(id)v11 rank] == v39) {
    goto LABEL_21;
  }
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCApplyScheduler _scheduleApplyJobWithID:zone:applyKind:]", 726, &v47);
  v25 = brc_bread_crumbs();
  uint64_t v26 = brc_default_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = v12;
    id v28 = v9;
    uint64_t v29 = self;
    id v30 = v14;
    __int16 v31 = v10;
    uint64_t v32 = v47;
    uint64_t v33 = [(id)v11 rank];
    *(_DWORD *)buf = 134219010;
    uint64_t v53 = v32;
    __int16 v54 = 2112;
    id v55 = v8;
    __int16 v56 = 2048;
    uint64_t v57 = v33;
    __int16 v58 = 2048;
    uint64_t v59 = v39;
    __int16 v60 = 2112;
    uint64_t v61 = (uint64_t)v25;
    _os_log_debug_impl(&dword_1D353B000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Apply Changes[%@]: deleting useless action %lld vs %lld%@", buf, 0x34u);
    uint64_t v10 = v31;
    uint64_t v14 = v30;
    self = v29;
    id v9 = v28;
    uint64_t v12 = v27;
  }

  [(BRCFSSchedulerBase *)self deleteJobsMatching:v8];
  __brc_leave_section(&v47);
LABEL_31:
  __brc_leave_section(v50);
  os_activity_scope_leave(&state);
}

void __60__BRCApplyScheduler__scheduleApplyJobWithID_zone_applyKind___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) appLibrary];
  int v3 = [v2 isCoordinationPendingForItem:*(void *)(a1 + 32)];

  if (v3)
  {
    int v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __60__BRCApplyScheduler__scheduleApplyJobWithID_zone_applyKind___block_invoke_cold_1(a1, (uint64_t)v4, v5);
    }

    [*(id *)(a1 + 48) setState:26 forJobID:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    id v8 = [*(id *)(a1 + 56) metadataSyncContext];
    id v9 = [v8 applyThrottle];
    [v6 postponeJobID:v7 withThrottle:v9];

    char v11 = 0;
    uint64_t v10 = [*(id *)(*(void *)(a1 + 48) + 8) fsWriter];
    objc_msgSend(v10, "applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:", *(void *)(a1 + 64), *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "rank"), *(void *)(a1 + 56), *(void *)(a1 + 72), &v11);
  }
}

- (void)_handleWatchingFaults
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v40 = [(BRCAccountSession *)self->super._session clientDB];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  int v4 = self->_clientZonesWatchingFaults;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v50 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if ([v9 isSyncBlocked]) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v6);
  }

  uint64_t v39 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  int v36 = self;
  obuint64_t j = self->_clientZonesWatchingFaults;
  uint64_t v10 = [(NSMutableSet *)obj countByEnumeratingWithState:&v45 objects:v58 count:16];
  char v11 = (void *)v40;
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v46;
    uint64_t v37 = *MEMORY[0x1E4F592A8];
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v45 + 1) + 8 * j);
        int v16 = [v15 mangledID];
        uint64_t v17 = +[BRCUserDefaults defaultsForMangledID:v16];
        uint64_t v18 = [v17 applyCountToSignalFaultsLive];

        __int16 v19 = [v15 dbRowID];
        uint64_t v20 = (void *)[v11 numberWithSQL:@"SELECT 1 FROM client_unapplied_table WHERE zone_rowid = %@ AND throttle_state = 1 AND apply_kind = %d AND retry_count < %lld LIMIT 1", v19, 1, v18];

        if (([v20 BOOLValue] & 1) == 0)
        {
          uint64_t v21 = [v15 dbRowID];
          __int16 v22 = (void *)[v11 numberWithSQL:@"SELECT 1 FROM client_unapplied_table WHERE zone_rowid = %@ AND throttle_state = 1 AND apply_kind = %d LIMIT 1", v21, 1];

          if ([v22 BOOLValue])
          {
            unint64_t v23 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", v37, 41, @"apply is failing");
            uint64_t v24 = [v15 mangledID];
            [v39 setObject:v23 forKeyedSubscript:v24];

            char v11 = (void *)v40;
          }
          [v3 addObject:v15];
        }
      }
      uint64_t v12 = [(NSMutableSet *)obj countByEnumeratingWithState:&v45 objects:v58 count:16];
    }
    while (v12);
  }

  [(NSMutableSet *)v36->_clientZonesWatchingFaults minusSet:v3];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v25 = v3;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v57 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v42;
    uint64_t v29 = *MEMORY[0x1E4F592A8];
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v42 != v28) {
          objc_enumerationMutation(v25);
        }
        __int16 v31 = *(void **)(*((void *)&v41 + 1) + 8 * k);
        if ([v31 isSyncBlocked])
        {
          uint64_t v32 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", v29, 12, @"sync is blocked for client zone: %@", v31);
          [v31 signalFaultingWatchersWithError:v32];
        }
        else
        {
          uint64_t v32 = [v31 mangledID];
          uint64_t v33 = [v39 objectForKeyedSubscript:v32];
          [v31 signalFaultingWatchersWithError:v33];

          char v11 = (void *)v40;
        }

        int v34 = brc_bread_crumbs();
        uint64_t v35 = brc_default_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          __int16 v54 = v31;
          __int16 v55 = 2112;
          __int16 v56 = v34;
          _os_log_debug_impl(&dword_1D353B000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] Signalled faulting-barrier waiters for %@%@", buf, 0x16u);
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v41 objects:v57 count:16];
    }
    while (v27);
  }
}

- (void)deleteExpiredJobs
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Apply Changes: Cleaned up %lld stale throttles%@");
}

- (unint64_t)_addRanksUpToRank:(int64_t)a3 inZone:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(BRCAccountSession *)self->super._session clientDB];
  int64_t v8 = [v6 lastInsertedRank];
  if (v8 >= a3)
  {
    uint64_t v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[BRCApplyScheduler _addRanksUpToRank:inZone:]();
    }
    unint64_t v13 = 0;
  }
  else
  {
    int64_t v9 = v8;
    uint64_t v10 = [v6 dbRowID];
    char v11 = [v6 dbRowID];
    int v12 = [v7 executeWithSlowStatementRadar:@"<rdar://problem/23822933>", @"INSERT OR IGNORE INTO client_unapplied_table (zone_rowid, throttle_id, throttle_state, retry_count, last_try_stamp, next_retry_stamp, expire_stamp, apply_kind) SELECT %@, item_rank, 1, 0, 0, 0, 0, %u  FROM server_items WHERE zone_rowid = %@ AND item_rank >= %lld AND item_rank < %lld", v10, 1, v11, v9, a3 sql];

    if (v12)
    {
      unint64_t v13 = [v7 changes];
    }
    else
    {
      int v16 = brc_bread_crumbs();
      uint64_t v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[BRCApplyScheduler _addRanksUpToRank:inZone:]();
      }

      unint64_t v13 = 0;
    }
    uint64_t v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int64_t v19 = a3 - 1;
      uint64_t v20 = [v6 zoneName];
      *(_DWORD *)buf = 134219010;
      int64_t v22 = v9;
      __int16 v23 = 2048;
      int64_t v24 = v19;
      __int16 v25 = 2112;
      uint64_t v26 = v20;
      __int16 v27 = 2048;
      unint64_t v28 = v13;
      __int16 v29 = 2112;
      id v30 = v14;
      _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes [%lld .. %lld]: in %@, %llu ranks inserted%@", buf, 0x34u);
    }
  }

  return v13;
}

- (void)generatedRanksForZone:(id)a3 upToRank:(int64_t)a4
{
  id v7 = [a3 clientZone];
  unint64_t v6 = [(BRCApplyScheduler *)self _addRanksUpToRank:a4 inZone:v7];
  [v7 listedUpToRank:a4];
  if (v6) {
    [(BRCFSSchedulerBase *)self signal];
  }
}

- (void)didSyncDownZone:(id)a3 requestID:(unint64_t)a4 upToRank:(int64_t)a5 caughtUpWithServer:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  memset(v20, 0, sizeof(v20));
  __brc_create_section(0, (uint64_t)"-[BRCApplyScheduler didSyncDownZone:requestID:upToRank:caughtUpWithServer:]", 900, v20);
  char v11 = brc_bread_crumbs();
  int v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int64_t v19 = "NO";
    *(_DWORD *)buf = 134219266;
    if (v6) {
      int64_t v19 = "YES";
    }
    uint64_t v22 = v20[0];
    __int16 v23 = 2048;
    unint64_t v24 = a4;
    __int16 v25 = 2112;
    uint64_t v26 = self;
    __int16 v27 = 2048;
    int64_t v28 = a5;
    __int16 v29 = 2080;
    id v30 = v19;
    __int16 v31 = 2112;
    uint64_t v32 = v11;
    _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx did sync down requestID:%llu, applying server truth on %@. maxRank [%lld] caughtUp [%s]%@", buf, 0x3Eu);
  }

  unint64_t v13 = [v10 clientZone];
  unint64_t v14 = [(BRCApplyScheduler *)self _addRanksUpToRank:a5 inZone:v13];
  id v15 = [v10 changeState];
  int v16 = [v15 lastSyncDownDate];
  [v13 didSyncDownRequestID:a4 maxApplyRank:a5 caughtUpWithServer:v6 syncDownDate:v16];

  [(BRCFSSchedulerBase *)self rescheduleSuspendedJobsMatching:v10 inState:25];
  [(BRCFSSchedulerBase *)self rescheduleSuspendedJobsMatching:v10 inState:16];
  [(BRCFSSchedulerBase *)self rescheduleSuspendedJobsMatching:v10 inState:21];
  [(BRCFSSchedulerBase *)self rescheduleSuspendedJobsMatching:v10 inState:26];
  if (v14
    || [v13 isPrivateZone]
    && (clientZonesWatchingFaults = self->_clientZonesWatchingFaults,
        [v13 asPrivateClientZone],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        LODWORD(clientZonesWatchingFaults) = [(NSMutableSet *)clientZonesWatchingFaults containsObject:v18], v18, clientZonesWatchingFaults))
  {
    [(BRCFSSchedulerBase *)self signal];
  }

  __brc_leave_section(v20);
}

- (void)_close
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_applyCountReachedMax)
  {
    coordinatedWriters = self->_coordinatedWriters;
    self->_coordinatedWriters = 0;

    self->_applyCountReachedMax = 0;
    [(BRCFSSchedulerBase *)self resume];
  }
  int v4 = self->_clientZonesWatchingFaults;
  clientZonesWatchingFaults = self->_clientZonesWatchingFaults;
  self->_clientZonesWatchingFaults = 0;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v6 = v4;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        int v12 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorLoggedOut");
        [v11 signalFaultingWatchersWithError:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v13.receiver = self;
  v13.super_class = (Class)BRCApplyScheduler;
  [(BRCFSSchedulerBase *)&v13 _close];
}

- (unsigned)recoverMissingJobsAndReport:(BOOL)a3
{
  BOOL v45 = a3;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  int v4 = [(BRCAccountSession *)self->super._session clientDB];
  uint64_t v5 = (void *)[v4 fetch:@"SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_doc_id, ci.item_file_id, ci.item_generation, ci.item_localname, ci.item_processing_stamp, ci.item_staged_file_id, ci.item_staged_generation, ci.item_bouncedname, ci.item_scope, ci.item_tmpbounceno, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.desired_version, ci.item_live_conflict_loser_etags, ci.item_thumb_live_signature, ci.item_thumb_greedy, ci.version_block_sync_until_bundle_id, ci.version_block_sync_until_timestamp FROM client_items AS ci WHERE ci.item_localsyncupstate = 1 AND ci.item_localsyncupstate != 0 AND NOT EXISTS (SELECT 1 FROM client_unapplied_table AS cu WHERE cu.throttle_id = ci.rowid AND cu.throttle_state != 0)"];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __49__BRCApplyScheduler_recoverMissingJobsAndReport___block_invoke;
  v52[3] = &unk_1E6994120;
  long long v48 = self;
  v52[4] = self;
  long long v44 = v5;
  obuint64_t j = [v5 enumerateObjects:v52];
  uint64_t v6 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unsigned int v46 = 0;
    uint64_t v8 = *(void *)v54;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v54 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v53 + 1) + 8 * v9);
        char v11 = (void *)MEMORY[0x1D9438760]();
        if (([v10 isRejected] & 1) == 0)
        {
          uint64_t v19 = brc_bread_crumbs();
          uint64_t v20 = brc_default_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v58 = v19;
            _os_log_fault_impl(&dword_1D353B000, v20, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: li.isRejected%@", buf, 0xCu);
          }
        }
        int v12 = [v10 clientZone];
        objc_super v13 = [v10 itemID];
        long long v14 = [v12 serverItemByItemID:v13];

        if ([v14 isLive])
        {
          long long v15 = brc_bread_crumbs();
          long long v16 = brc_default_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            __int16 v58 = v10;
            __int16 v59 = 2112;
            uint64_t v60 = v14;
            __int16 v61 = 2112;
            __int16 v62 = v15;
            _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Rejected item %@ was remotely revived by %@.  Updating as such%@", buf, 0x20u);
          }

          [v10 markRejectedItemRemotelyRevived];
          [v10 saveToDB];
        }
        else
        {
          long long v17 = brc_bread_crumbs();
          uint64_t v18 = brc_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            __int16 v58 = v10;
            __int16 v59 = 2112;
            uint64_t v60 = v17;
            _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Rejected item %@ doesn't have an apply job.  Re-creating the apply job%@", buf, 0x16u);
          }

          [(BRCApplyScheduler *)v48 createApplyJobFromServerItem:v14 localItem:v10 state:1 kind:0];
        }

        ++v9;
      }
      while (v7 != v9);
      v46 += v7;
      uint64_t v21 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
      uint64_t v7 = v21;
    }
    while (v21);
  }
  else
  {
    unsigned int v46 = 0;
  }

  uint64_t v22 = objc_opt_new();
  p_isa = (id *)&v48->super.super.isa;
  session = v48->super._session;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __49__BRCApplyScheduler_recoverMissingJobsAndReport___block_invoke_148;
  uint64_t v50[3] = &unk_1E6994878;
  id v25 = v22;
  id v51 = v25;
  [(BRCAccountSession *)session enumeratePrivateClientZones:v50];
  uint64_t v26 = [(BRCAccountSession *)v48->super._session clientDB];
  long long v47 = v25;
  __int16 v27 = (void *)[v26 fetchWithSlowStatementRadar:@"expected full table scan", @"SELECT si.item_rank, si.zone_rowid FROM server_items AS si LEFT JOIN client_items AS ci ON ci.item_id = si.item_id AND ci.zone_rowid = si.zone_rowid WHERE si.item_state = 0 AND si.item_type != 3 AND si.item_rank IS NOT NULL AND (NOT ckinfo_etags_are_equal(si.version_ckinfo, ci.version_ckinfo) OR (NOT ckinfo_etags_are_equal(si.item_stat_ckinfo, ci.item_stat_ckinfo) AND NOT (si.item_sharing_options & 4 != 0 AND %@ != (SELECT cz.zone_owner FROM client_zones AS cz WHERE cz.rowid = si.zone_rowid))) OR ci.rowid IS NULL) AND NOT indexset_contains(%p, si.zone_rowid) AND NOT EXISTS (SELECT 1 FROM client_unapplied_table AS cu WHERE cu.throttle_id = si.item_rank AND cu.throttle_state != 0)", *MEMORY[0x1E4F19C08], v25 sql];

  if ([v27 next])
  {
    do
    {
      int64_t v28 = (void *)MEMORY[0x1D9438760]();
      uint64_t v29 = [v27 longLongAtIndex:0];
      id v30 = [v27 numberAtIndex:1];
      __int16 v31 = [p_isa[1] serverZoneByRowID:v30];
      uint64_t v32 = [v31 clientZone];

      uint64_t v33 = [v32 serverItemByRank:v29];
      int v34 = [v33 itemID];
      uint64_t v35 = [v32 itemByItemID:v34];

      int v36 = brc_bread_crumbs();
      uint64_t v37 = brc_default_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v58 = v33;
        __int16 v59 = 2112;
        uint64_t v60 = v36;
        _os_log_impl(&dword_1D353B000, v37, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ is missing an apply throttle%@", buf, 0x16u);
      }

      if (v35) {
        uint64_t v38 = 2;
      }
      else {
        uint64_t v38 = 1;
      }
      p_isa = (id *)&v48->super.super.isa;
      [(BRCApplyScheduler *)v48 createApplyJobFromServerItem:v33 localItem:v35 state:1 kind:v38];
      ++v46;
    }
    while (([v27 next] & 1) != 0);
  }
  if (v46)
  {
    uint64_t v39 = brc_bread_crumbs();
    uint64_t v40 = brc_default_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      [(BRCApplyScheduler *)(uint64_t)v39 recoverMissingJobsAndReport:v40];
    }

    [p_isa signal];
  }
  if (v45)
  {
    id v41 = +[AppTelemetryTimeSeriesEvent newMissingApplyJobEventWithNumberMissing:v46];
    long long v42 = [p_isa[1] analyticsReporter];
    [v42 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v41];
  }
  return v46;
}

id __49__BRCApplyScheduler_recoverMissingJobsAndReport___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = a2;
  uint64_t v6 = [v4 clientDB];
  uint64_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

uint64_t __49__BRCApplyScheduler_recoverMissingJobsAndReport___block_invoke_148(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSyncBlocked])
  {
    int v4 = *(void **)(a1 + 32);
    id v5 = [v3 dbRowID];
    objc_msgSend(v4, "addIndex:", objc_msgSend(v5, "unsignedIntegerValue"));
  }
  return 1;
}

- (unint64_t)recoverAndReportMissingJobs
{
  return [(BRCApplyScheduler *)self recoverMissingJobsAndReport:1];
}

- (void)deleteNonRejectionJobsForZone:(id)a3
{
  session = self->super._session;
  id v5 = a3;
  uint64_t v6 = [(BRCAccountSession *)session clientDB];
  uint64_t v7 = [v5 matchingJobsWhereSQLClause];

  [v6 execute:@"DELETE FROM client_unapplied_table WHERE %@ AND throttle_id > 0", v7];
  uint64_t v8 = [(BRCAccountSession *)self->super._session clientDB];
  uint64_t v9 = [v8 changes];

  if (v9 >= 1)
  {
    uint64_t v10 = brc_bread_crumbs();
    char v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BRCApplyScheduler deleteNonRejectionJobsForZone:]();
    }

    [(BRCFSSchedulerBase *)self checkIfHasWork];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientZonesWatchingFaults, 0);
  objc_storeStrong((id *)&self->_coordinatedWriters, 0);
}

- (unint64_t)_writeCoordinationCount
{
  v2 = +[BRCUserDefaults defaultsForMangledID:0];
  unint64_t v3 = (int)[v2 writerMaxConcurrentIOs];

  return v3;
}

- (BOOL)canScheduleMoreJobs
{
  return !self->_applyCountReachedMax;
}

- (BOOL)startWriteCoordinationInAppLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCAccountSession *)self->super._session clientDB];
  [v5 assertOnQueue];

  if (self->_applyCountReachedMax)
  {
LABEL_7:
    BOOL v7 = 0;
    goto LABEL_8;
  }
  unint64_t v6 = [(BRCCountedSet *)self->_coordinatedWriters totalCount];
  if (v6 >= [(BRCApplyScheduler *)self _writeCoordinationCount])
  {
    uint64_t v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCApplyScheduler(LegacyAdditions) startWriteCoordinationInAppLibrary:]((id *)&self->_coordinatedWriters);
    }

    self->_applyCountReachedMax = 1;
    [(BRCFSSchedulerBase *)self suspend];
    goto LABEL_7;
  }
  [(BRCCountedSet *)self->_coordinatedWriters addObject:v4];
  BOOL v7 = 1;
LABEL_8:

  return v7;
}

- (void)endWriteCoordinationInAppLibrary:(id)a3 rowID:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(BRCAccountSession *)self->super._session clientDB];
  [v7 assertOnQueue];

  uint64_t v8 = [v6 itemByRowID:a4];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 clientZone];
    char v11 = [v9 itemID];
    uint64_t v12 = [v10 serverRankByItemID:v11];

    objc_super v13 = [v6 db];
    [v13 execute:@"UPDATE client_unapplied_table   SET throttle_os_activity_scope_state_s state = 1 WHERE throttle_os_activity_scope_state_s state = 26   AND throttle_id IN(%llu, %lld)", v12, -objc_msgSend(v9, "dbRowID")];

    long long v14 = [v6 db];
    uint64_t v15 = [v14 changes];

    if (v15)
    {
      long long v16 = brc_bread_crumbs();
      long long v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[BRCApplyScheduler(LegacyAdditions) endWriteCoordinationInAppLibrary:rowID:].cold.4();
      }

      [(BRCFSSchedulerBase *)self signal];
    }
    else
    {
      uint64_t v18 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[BRCApplyScheduler(LegacyAdditions) endWriteCoordinationInAppLibrary:rowID:]();
      }
    }
  }
  p_coordinatedWriters = &self->_coordinatedWriters;
  if ([(BRCCountedSet *)self->_coordinatedWriters containsObject:v6])
  {
    [(BRCCountedSet *)*p_coordinatedWriters removeObject:v6];
    if (self->_applyCountReachedMax)
    {
      unint64_t v21 = [(BRCCountedSet *)*p_coordinatedWriters totalCount];
      if (v21 < [(BRCApplyScheduler *)self _writeCoordinationCount] >> 1)
      {
        uint64_t v22 = brc_bread_crumbs();
        __int16 v23 = brc_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          -[BRCApplyScheduler(LegacyAdditions) endWriteCoordinationInAppLibrary:rowID:]((id *)&self->_coordinatedWriters);
        }

        self->_applyCountReachedMax = 0;
        [(BRCFSSchedulerBase *)self resume];
      }
    }
  }
  else
  {
    unint64_t v24 = brc_bread_crumbs();
    id v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      -[BRCApplyScheduler(LegacyAdditions) endWriteCoordinationInAppLibrary:rowID:]();
    }
  }
}

- (void)monitorFaultingForZone:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCAccountSession *)self->super._session clientDB];
  [v5 assertOnQueue];

  if (([(NSMutableSet *)self->_clientZonesWatchingFaults containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)self->_clientZonesWatchingFaults addObject:v4];
    [(BRCFSSchedulerBase *)self signal];
    id v6 = brc_bread_crumbs();
    BOOL v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[BRCApplyScheduler(LegacyAdditions) monitorFaultingForZone:]();
    }
  }
}

- (void)stopMonitoringFaultingForZone:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCAccountSession *)self->super._session clientDB];
  [v5 assertOnQueue];

  [(NSMutableSet *)self->_clientZonesWatchingFaults removeObject:v4];
  id v6 = brc_bread_crumbs();
  BOOL v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BRCApplyScheduler(LegacyAdditions) stopMonitoringFaultingForZone:]();
  }
}

- (void)describeInBuffer:aggregateOfJobsMatching:context:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [matchingQuery isKindOfClass:[BRCServerZone class]]%@", v2, v3, v4, v5, v6);
}

- (void)setState:forServerItem:localItem:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !si.isLive || !li.isRejected%@", v2, v3, v4, v5, v6);
}

- (void)createApplyJobFromServerItem:localItem:state:kind:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: serverItem || localItem%@", v2, v3, v4, v5, v6);
}

- (void)didCreateMissingParentID:zone:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Apply Changes: (missing parent found: %@)%@");
}

- (void)_rescheduleRank:inState:forZone:.cold.1()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Apply Changes: retrying suspended rank %lld%@");
}

- (void)_rescheduleRank:inState:forZone:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: state >= BRCJobStateSuspendedBase%@", v2, v3, v4, v5, v6);
}

- (void)_fixupCZMAliasTargetWithAlias:target:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] failed writing alias bookmark data - %@%@");
}

- (void)_fixupCZMAliasTargetWithAlias:target:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Failed resolving the bookmark target - %@%@");
}

- (void)rescheduleMissingTargetAliasesWithTarget:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !shouldFixup || !serverZone.isSharedZone || ![serverZone.zoneName isEqualToString:BRUbiquitousDefaultContainerID]%@", v2, v3, v4, v5, v6);
}

void __66__BRCApplyScheduler__rescheduleItemsParentedToItemGlobalID_flags___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [*v0 debugItemIDString];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v2, v3, "[DEBUG] Apply Changes: No unscheduled items parented to %@%@", v4, v5, v6, v7, v8);
}

void __66__BRCApplyScheduler__rescheduleItemsParentedToItemGlobalID_flags___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [*v0 debugItemIDString];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v2, v3, "[DEBUG] No point in rescheduling items under %@ because we can't make it a non-fault%@", v4, v5, v6, v7, v8);
}

void __66__BRCApplyScheduler__rescheduleItemsParentedToItemGlobalID_flags___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [*(id *)(v0 + 56) itemID];
  uint64_t v2 = [v1 debugItemIDString];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v3, v4, "[DEBUG] Updated %@ to be a non-fault%@", v5, v6, v7, v8, v9);
}

void __59__BRCApplyScheduler_rescheduleItemsRecursivelyUnderFolder___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't reschedule flat items under %@%@", v1, 0x16u);
}

- (void)repopulateJobsForZone:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Apply Changes: repopulating throttles for zone:%@%@");
}

- (void)_scheduleApplyJobWithID:zone:applyKind:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: si == nil%@", v2, v3, v4, v5, v6);
}

- (void)_scheduleApplyJobWithID:zone:applyKind:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: zone%@", v2, v3, v4, v5, v6);
}

void __60__BRCApplyScheduler__scheduleApplyJobWithID_zone_applyKind___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_1D353B000, a2, a3, "[DEBUG] Apply Changes[%@]: Suspending action until the coordination callback%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_addRanksUpToRank:inZone:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 lastError];
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: failed to insert into client_unapplied_commands: %@%@", v3, 0x16u);
}

- (void)_addRanksUpToRank:inZone:.cold.2()
{
  OUTLINED_FUNCTION_8();
  id v1 = [v0 zoneName];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v2, v3, "[DEBUG] Apply Changes [] in %@, 0 ranks inserted%@", v4, v5, v6, v7, v8);
}

- (void)recoverMissingJobsAndReport:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes: Rescheduled %u throttles missing from the apply table%@", (uint8_t *)v3, 0x12u);
}

- (void)deleteNonRejectionJobsForZone:.cold.1()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Apply Changes: Deleted %llu non-rejection jobs%@");
}

@end