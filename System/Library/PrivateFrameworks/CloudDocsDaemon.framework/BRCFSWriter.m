@interface BRCFSWriter
+ (BOOL)_isPathMatchIdle:(id *)a3;
+ (BOOL)_shouldForceApplyMetadataForItem:(id)a3;
- (BOOL)_shouldBounceSourceItemWithLookup:(id)a3 localItem:(id)a4 serverItem:(id)a5 bounceNamespace:(unsigned __int8)a6 urlMatch:(id *)a7;
- (BOOL)applyLocalEditIfNecessaryToURL:(id)a3 forItem:(id)a4 serverItem:(id)a5 forDelete:(BOOL)a6 error:(id *)a7;
- (BOOL)bouncePathMatch:(id *)a3 toApplyServerItem:(id)a4 clientZone:(id)a5;
- (BOOL)bouncePathMatchesForLookup:(id)a3 toApplyServerItem:(id)a4 clientZone:(id)a5;
- (BOOL)isCancelled;
- (BRCAccountSession)session;
- (BRCFSWriter)initWithAccountSession:(id)a3;
- (OS_dispatch_queue)serialQueue;
- (brc_task_tracker)taskTracker;
- (id)_generateGentlePhysicalBounceNameForPathMatch:(id *)a3 dirfd:(int)a4 existingSourceLogicalName:(id)a5 lastBounceNo:(unint64_t *)a6;
- (id)bouncePath:(id)a3 forItemConflictingWithAnFSRoot:(id)a4;
- (int)_computeURLMatchWithLookup:(id)a3 localItem:(id)a4 serverItem:(id)a5 bounceNamespace:(unsigned __int8)a6 applyNamespace:(unsigned __int8)a7 urlMatch:(id *)a8;
- (unint64_t)computeSourceBounceNumberIfNecessaryWithLookup:(id)a3 localItem:(id)a4 serverItem:(id)a5;
- (unsigned)_computeDesiredVersionOptionsForDocument:(id)a3 createdReservedItem:(BOOL)a4;
- (void)_applyChangesForServerAlias:(id)a3 localAlias:(id)a4 jobID:(int64_t)a5 zone:(id)a6 diffs:(unint64_t)a7;
- (void)_handleClashingItemIfNecessary:(id)a3 parentID:(id)a4 si:(id)a5;
- (void)_scheduleActionCoordination:(id)a3 dstURL:(id)a4 action:(const char *)a5 li:(id)a6 si:(id)a7 diffs:(unint64_t)a8 hasFinished:(BOOL *)a9;
- (void)_stageCreationOfDirectory:(id)a3;
- (void)_stageCreationOfSymlink:(id)a3 forLocalItem:(id)a4;
- (void)_writeUnderCoordinationFromURL:(id)a3 toURL:(id)a4 canDelete:(BOOL)a5;
- (void)applyChangesForServerItem:(id)a3 localItem:(id)a4 rank:(int64_t)a5 zone:(id)a6 activity:(id)a7 hasFinished:(BOOL *)a8;
- (void)cancel;
- (void)close;
- (void)resume;
- (void)suspend;
- (void)writeUnderCoordinationFromURL:(id)a3 toURL:(id)a4 canDelete:(BOOL)a5;
@end

@implementation BRCFSWriter

+ (BOOL)_shouldForceApplyMetadataForItem:(id)a3
{
  id v3 = a3;
  if ([v3 isDocument])
  {
    v4 = [v3 asDocument];
    if ([v4 isShared]) {
      char v5 = [v4 isPausedFromSync];
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)_isPathMatchIdle:(id *)a3
{
  if (+[BRCServerChangesApplyUtil shouldForceApplyContentForItem:a3->var0])
  {
    v4 = brc_bread_crumbs();
    char v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      +[BRCFSWriter(Bouncing) _isPathMatchIdle:]();
    }

    goto LABEL_10;
  }
  if ([a3->var0 isDocument])
  {
    v4 = [a3->var0 asDocument];
    if ([v4 isResumingSync])
    {
      v6 = brc_bread_crumbs();
      v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        +[BRCFSWriter(Bouncing) _isPathMatchIdle:]();
      }
LABEL_9:

LABEL_10:
      return 1;
    }
    if ([v4 isPausedFromSync]
      && ([v4 localDiffs] & 0xFF007FF0047FFFLL) == 0)
    {
      v6 = brc_bread_crumbs();
      v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        +[BRCFSWriter(Bouncing) _isPathMatchIdle:]();
      }
      goto LABEL_9;
    }
  }
  if (([a3->var0 isReserved] & 1) != 0
    || [a3->var0 isIdleOrRejected] && !objc_msgSend(a3->var0, "isLost"))
  {
    return 1;
  }
  id var0 = a3->var0;
  return [var0 isShareAcceptationFault];
}

- (id)_generateGentlePhysicalBounceNameForPathMatch:(id *)a3 dirfd:(int)a4 existingSourceLogicalName:(id)a5 lastBounceNo:(unint64_t *)a6
{
  uint64_t v7 = *(void *)&a4;
  v74[3] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a3->var0;
  unint64_t v71 = 0;
  v11 = +[BRCUserDefaults defaultsForMangledID:0];
  unsigned int v12 = [v11 bounceFileMaxRetries];
  [v11 bounceFileReportInterval];
  double v14 = v13;
  v15 = [v10 st];
  v16 = [v15 logicalName];
  uint64_t v17 = objc_msgSend(v16, "br_stringByDeletingPathBounceNo:", &v71);

  v70 = (void *)v17;
  if (v17)
  {
    int v18 = [v10 isDirectoryWithPackageName];
    v19 = @"folder";
    if (!v18) {
      v19 = 0;
    }
    v69 = v19;
    unint64_t v20 = v71;
    if (!v71)
    {
      unint64_t v20 = 1;
      unint64_t v71 = 1;
    }
    v64 = v11;
    if (a6 && *a6 > v20) {
      unint64_t v71 = *a6;
    }
    v21 = 0;
    unint64_t v68 = v12;
    unint64_t v22 = 1;
    uint64_t v63 = 138412546;
    v67 = a6;
    unsigned int v65 = v7;
    while (1)
    {
      unint64_t v23 = ++v71;
      if (a6) {
        *a6 = v23;
      }
      if (v22 >= v68)
      {
        id v26 = v10;
        id v27 = v9;
        v28 = brc_bread_crumbs();
        v29 = brc_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v63;
          *(void *)v73 = v70;
          *(_WORD *)&v73[8] = 2112;
          *(void *)&v73[10] = v28;
          _os_log_fault_impl(&dword_1D353B000, v29, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Tried to bounce the file [%@] too many times. Use UUID instead.%@", buf, 0x16u);
        }

        v30 = [MEMORY[0x1E4F29128] UUID];
        v24 = [v30 UUIDString];

        uint64_t v31 = objc_msgSend(v70, "brc_representableHFSFileNameWithSuffix:addedExtension:makeDotFile:", v24, v69, 0);

        v32 = [(BRCFSWriter *)self session];
        v25 = [v32 clientState];

        v33 = [v25 objectForKeyedSubscript:@"lastReportedBounceEventTS"];
        if (!v33
          || ([MEMORY[0x1E4F1C9C8] date],
              v34 = objc_claimAutoreleasedReturnValue(),
              [v34 timeIntervalSinceDate:v33],
              double v36 = v35,
              v34,
              v36 > v14))
        {
          id v37 = +[AppTelemetryTimeSeriesEvent newFileBouncedManyTimes];
          v38 = [(BRCFSWriter *)self session];
          v39 = [v38 analyticsReporter];
          [v39 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v37];

          v40 = [MEMORY[0x1E4F1C9C8] date];
          [v25 setObject:v40 forKeyedSubscript:@"lastReportedBounceEventTS"];
        }
        v21 = (void *)v31;
        id v9 = v27;
        id v10 = v26;
        uint64_t v7 = v65;
      }
      else
      {
        v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
        objc_msgSend(v70, "br_representableHFSFileNameWithNumber:addedExtension:makeDotFile:", v24, v69, 0);
        v21 = v25 = v21;
      }

      if ([v9 isEqualToString:v21]) {
        break;
      }
      v41 = [v10 parentClientZone];
      v42 = [v10 st];
      v43 = [v42 parentID];
      int v44 = [v41 existsByParentID:v43 andCaseInsensitiveLogicalName:v21];

      if (!v44)
      {
        if ((v7 & 0x80000000) != 0)
        {
          v55 = brc_bread_crumbs();
          v56 = brc_default_log();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)v73 = v21;
            *(_WORD *)&v73[8] = 2112;
            *(void *)&v73[10] = v70;
            *(_WORD *)&v73[18] = 2112;
            v74[0] = v55;
            _os_log_debug_impl(&dword_1D353B000, v56, OS_LOG_TYPE_DEBUG, "[DEBUG] Generated bounce name: %@ for %@%@", buf, 0x20u);
          }
          goto LABEL_39;
        }
        if ([v10 isFault])
        {
          objc_msgSend(v21, "br_sideFaultName");
          id v45 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v45 = v21;
        }
        id v46 = v45;
        v47 = (const char *)[v46 fileSystemRepresentation];
        int v53 = BRCOpenAt(v7, v47, 32772, v48, v49, v50, v51, v52, v63);
        int v54 = v53;
        if (v53 < 0)
        {
          if (*__error() == 2)
          {
            v57 = brc_bread_crumbs();
            v58 = brc_default_log();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138413058;
              *(void *)v73 = v21;
              *(_WORD *)&v73[8] = 2112;
              *(void *)&v73[10] = v70;
              *(_WORD *)&v73[18] = 1024;
              LODWORD(v74[0]) = v7;
              WORD2(v74[0]) = 2112;
              *(void *)((char *)v74 + 6) = v57;
              _os_log_debug_impl(&dword_1D353B000, v58, OS_LOG_TYPE_DEBUG, "[DEBUG] Generated bounce name: %@ for %@ in %d%@", buf, 0x26u);
            }

            goto LABEL_47;
          }
        }
        else
        {
          close(v53);
        }

        if (*__error() != 17 && *__error() != 21 && *__error() != 20 && v54 < 0)
        {
          int v59 = *__error();
          v60 = brc_bread_crumbs();
          v61 = brc_default_log();
          if (os_log_type_enabled(v61, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v73 = v7;
            *(_WORD *)&v73[4] = 2112;
            *(void *)&v73[6] = v21;
            *(_WORD *)&v73[14] = 1024;
            *(_DWORD *)&v73[16] = v59;
            LOWORD(v74[0]) = 2112;
            *(void *)((char *)v74 + 2) = v60;
            _os_log_error_impl(&dword_1D353B000, v61, (os_log_type_t)0x90u, "[ERROR] openat(%d, %@) %{errno}d%@", buf, 0x22u);
          }

          id v46 = 0;
          *__error() = v59;
LABEL_47:
          v11 = v64;
          goto LABEL_48;
        }
      }
      ++v22;
      a6 = v67;
    }
    v55 = brc_bread_crumbs();
    v56 = brc_default_log();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSWriter(Bouncing) _generateGentlePhysicalBounceNameForPathMatch:dirfd:existingSourceLogicalName:lastBounceNo:]();
    }
LABEL_39:

    v11 = v64;
    if (![v10 isFault]) {
      goto LABEL_49;
    }
    objc_msgSend(v21, "br_sideFaultName");
    id v46 = (id)objc_claimAutoreleasedReturnValue();
LABEL_48:

    v21 = v46;
  }
  else
  {
    v21 = 0;
  }
LABEL_49:

  return v21;
}

- (BOOL)bouncePathMatchesForLookup:(id)a3 toApplyServerItem:(id)a4 clientZone:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  memset(v20, 0, sizeof(v20));
  if (!v8)
  {
    uint64_t v19 = 0;
    LOBYTE(v11) = 1;
    long long v17 = 0uLL;
    long long v18 = 0uLL;
LABEL_13:
    BOOL v15 = v11;
    goto LABEL_14;
  }
  [v8 faultedMatch];
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  [v8 byPathMatch];
  if (*(void *)&v20[0]) {
    BOOL v11 = [(BRCFSWriter *)self bouncePathMatch:v20 toApplyServerItem:v9 clientZone:v10];
  }
  else {
    BOOL v11 = 1;
  }
  if (!(void)v17) {
    goto LABEL_13;
  }
  uint64_t v12 = [*(id *)&v20[0] dbRowID];
  uint64_t v13 = [(id)v17 dbRowID];
  BOOL v14 = v12 == v13;
  BOOL v15 = v12 == v13 && v11;
  if (!v14 && v11) {
    BOOL v15 = [(BRCFSWriter *)self bouncePathMatch:&v17 toApplyServerItem:v9 clientZone:v10];
  }
LABEL_14:
  __destructor_8_s0_s8_s16_s24((uint64_t)&v17);
  __destructor_8_s0_s8_s16_s24((uint64_t)v20);

  return v15;
}

- (BOOL)bouncePathMatch:(id *)a3 toApplyServerItem:(id)a4 clientZone:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3->var2;
  id v13 = a3->var0;
  BOOL v14 = v13;
  int v51 = 0;
  if (!v13)
  {
    long long v17 = brc_bread_crumbs();
    long long v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSWriter(Bouncing) bouncePathMatch:toApplyServerItem:clientZone:].cold.4();
    }

    if ([v12 type] == 6 || objc_msgSend(v12, "type") == 4)
    {
      uint64_t v19 = objc_msgSend(v11, "itemByFileID:", objc_msgSend(v12, "parentFileID"));
      unint64_t v20 = v19;
      if (v19)
      {
        if (([v19 isLost] & 1) == 0)
        {
          uint64_t v21 = brc_bread_crumbs();
          unint64_t v22 = brc_default_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
            -[BRCFSWriter(Bouncing) bouncePathMatch:toApplyServerItem:clientZone:]();
          }

          [v20 markLostClearGenerationID:1 backoffMode:1];
          [v20 saveToDB];
        }
      }
      else
      {
        uint64_t v31 = brc_bread_crumbs();
        v32 = brc_default_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          -[BRCFSWriter(Bouncing) bouncePathMatch:toApplyServerItem:clientZone:]();
        }

        v33 = [v12 appLibrary];
        v34 = [v33 fsEventsMonitor];

        [v34 resetWithReason:@"no parent while bouncing path"];
      }
      goto LABEL_45;
    }
    double v35 = brc_bread_crumbs();
    double v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSWriter(Bouncing) bouncePathMatch:toApplyServerItem:clientZone:]();
    }

    unint64_t v20 = [(BRCFSWriter *)self session];
    id v37 = [v20 fsReader];
    [v37 fseventAtPath:v12 flags:0];
    goto LABEL_44;
  }
  int v15 = [v13 needsSyncUp];
  if (!v15)
  {
    if ([v14 isDocument]) {
      goto LABEL_17;
    }
LABEL_32:
    int v28 = 0;
    goto LABEL_33;
  }
  char v5 = [v11 session];
  v6 = [v5 syncUpScheduler];
  if ([v6 jobStateFor:v14] == 52)
  {
    id v44 = v10;
    id v45 = v12;
    id v16 = v11;

LABEL_21:
    v29 = brc_bread_crumbs();
    v30 = brc_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSWriter(Bouncing) bouncePathMatch:toApplyServerItem:clientZone:].cold.7();
    }

    int v28 = 1;
    goto LABEL_24;
  }
  if (([v14 isDocument] & 1) == 0)
  {

    goto LABEL_32;
  }
LABEL_17:
  id v23 = v11;
  v24 = self;
  id v44 = v10;
  id v45 = v12;
  id v16 = v23;
  v25 = [v14 asDocument];
  id v26 = [v25 uploadError];
  int v27 = objc_msgSend(v26, "br_isCloudDocsErrorCode:", 43);

  if (v15)
  {

    self = v24;
    if (v27) {
      goto LABEL_21;
    }
  }
  else
  {
    self = v24;
    if (v27) {
      goto LABEL_21;
    }
  }
  int v28 = 0;
LABEL_24:
  id v11 = v16;
  id v10 = v44;
  id v12 = v45;
LABEL_33:
  char v38 = [v14 isKnownByServer];
  if ((v28 & 1) == 0 && v10 && (v38 & 1) == 0)
  {
    v39 = brc_bread_crumbs();
    v40 = brc_default_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSWriter(Bouncing) bouncePathMatch:toApplyServerItem:clientZone:].cold.6(v10, (uint64_t)v39, v40);
    }

    unint64_t v20 = [(BRCFSWriter *)self session];
    v41 = [v20 applyScheduler];
    [v41 setState:22 forServerItem:v10 localItem:0];

    goto LABEL_45;
  }
  if (((v28 | [v14 isFault] ^ 1) & 1) == 0
    && !+[BRCFSWriter _isPathMatchIdle:a3])
  {
    unint64_t v20 = brc_bread_crumbs();
    id v37 = brc_default_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSWriter(Bouncing) bouncePathMatch:toApplyServerItem:clientZone:].cold.5();
    }
LABEL_44:

LABEL_45:
    char v42 = 0;
    goto LABEL_46;
  }
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke;
  v46[3] = &unk_1E699BA10;
  id v47 = v14;
  uint64_t v48 = self;
  uint64_t v50 = a3;
  id v49 = v12;
  char v42 = [v49 performOnOpenParentFileDescriptor:v46 error:&v51];

  unint64_t v20 = v47;
LABEL_46:

  return v42;
}

uint64_t __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke(id *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  v4 = a1 + 4;
  char v5 = [a1[4] st];
  v6 = [v5 logicalName];

  uint64_t v78 = 0;
  uint64_t v7 = [v4[1] _generateGentlePhysicalBounceNameForPathMatch:v4[3] dirfd:a2 existingSourceLogicalName:0 lastBounceNo:&v78];
  [*v4 beginBounceAndSaveToDBWithBounceNumber:v78];
  id v8 = [*v4 st];
  id v9 = [v8 logicalName];

  if (!v9 || [v6 isEqualToString:v9])
  {
    v66 = brc_bread_crumbs();
    v67 = brc_default_log();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT)) {
      __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_6();
    }
  }
  if ([*v4 isFault])
  {
    id v10 = [*v4 st];
    id v11 = [v10 stagedFileID];

    if (!v11)
    {
      unint64_t v68 = brc_bread_crumbs();
      v69 = brc_default_log();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT)) {
        __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_5();
      }
    }
    id v12 = [v3[5] session];
    id v13 = [v12 stageRegistry];

    id v14 = v3[6];
    id v77 = 0;
    char v15 = [v13 moveOldVersionFromPath:v14 error:&v77];
    id v16 = v77;
    long long v17 = v16;
    if (v15)
    {
      v70 = v16;
      unint64_t v71 = v6;
      v73 = v7;
      v74 = v3;
      v72 = v9;
      long long v18 = [*v4 st];
      uint64_t v19 = [v18 documentID];
      uint64_t v20 = [v19 unsignedIntValue];
      uint64_t v21 = [*v4 st];
      unint64_t v22 = [v21 fileID];
      id v23 = v13;
      uint64_t v24 = [v22 longLongValue];
      v25 = [*v4 st];
      id v26 = [v25 stagedFileID];
      LOBYTE(v24) = objc_msgSend(v23, "transferDocumentID:fromOldVersionStage:toStage:", v20, v24, objc_msgSend(v26, "longLongValue"));

      if ((v24 & 1) == 0)
      {
        id v13 = v23;
        char v42 = brc_bread_crumbs();
        v43 = brc_default_log();
        v33 = v70;
        v6 = v71;
        uint64_t v7 = v73;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
          __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_3();
        }

        id v3 = v74;
        [v74[4] markNeedsDeleteForRescheduleOfItem:*((void *)v74[7] + 1)];
        [v74[4] saveToDB];
        goto LABEL_19;
      }
      int v27 = [v74[4] st];
      int v28 = [v27 stagedFileID];
      uint64_t v29 = [v28 longLongValue];
      id v30 = v74[6];
      id v76 = v70;
      uint64_t v7 = v73;
      char v31 = [v23 moveFromStage:v29 toPath:v30 fileName:v73 error:&v76];
      id v32 = v76;

      id v13 = v23;
      if (v31)
      {
        v33 = v32;
        v6 = v71;
        id v3 = v74;
LABEL_19:
        id v9 = v72;
        if ([*v4 isShared] && (objc_msgSend(*v4, "sharingOptions") & 4) != 0)
        {
          id v44 = [v3[6] physicalURL];
          id v45 = [v44 URLByDeletingLastPathComponent];
          id v46 = [v45 URLByAppendingPathComponent:v7];

          id v47 = [v3[4] clientZone];
          char v48 = [v47 isPrivateZone];

          if (v48)
          {
            id v49 = 0;
          }
          else
          {
            uint64_t v52 = [*v4 ownerKey];
            int v53 = [*v4 db];
            int v54 = +[BRCAccountSession userIdentityForKey:v52 db:v53];

            v6 = v71;
            v55 = [v54 nameComponentsAcceptUnknownUser:1];
            id v49 = objc_msgSend(v55, "br_formattedName");
          }
          v56 = [*v4 collaborationIdentifierIfComputable];
          char v57 = BRCSetAllShareAttributesAtURL(v46);

          if ((v57 & 1) == 0)
          {
            int v58 = *__error();
            int v59 = brc_bread_crumbs();
            v60 = brc_default_log();
            if (os_log_type_enabled(v60, (os_log_type_t)0x90u))
            {
              [v46 path];
              unsigned int v65 = v75 = v59;
              *(_DWORD *)buf = 138412802;
              id v80 = v65;
              __int16 v81 = 1024;
              int v82 = v58;
              __int16 v83 = 2112;
              v84 = v75;
              _os_log_error_impl(&dword_1D353B000, v60, (os_log_type_t)0x90u, "[ERROR] could not set share attributes for share at path: %@ %{errno}d%@", buf, 0x1Cu);

              int v59 = v75;
            }

            *__error() = v58;
          }

          id v9 = v72;
          uint64_t v7 = v73;
        }

        goto LABEL_36;
      }
      uint64_t v50 = brc_bread_crumbs();
      int v51 = brc_default_log();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
        __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_2();
      }

      v6 = v71;
      if (objc_msgSend(v32, "br_isPOSIXErrorCode:", 17)) {
        [*v4 scanParentDirectory];
      }
      [v74[4] markNeedsDeleteForRescheduleOfItem:*((void *)v74[7] + 1)];
      long long v17 = v32;
      id v9 = v72;
    }
    else
    {
      v40 = brc_bread_crumbs();
      v41 = brc_default_log();
      if (os_log_type_enabled(v41, (os_log_type_t)0x90u)) {
        __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_4();
      }

      [*v4 markBounceFailed];
    }
    [*v4 saveToDB];

    uint64_t v36 = 0xFFFFFFFFLL;
    goto LABEL_39;
  }
  v34 = [v3[6] filename];
  int v35 = BRCRenameAt(a2, v34, a2, v7, 0);

  if ((v35 & 0x80000000) == 0)
  {
LABEL_36:
    +[BRCFileCoordinator itemAtPath:v3[6] origLogicalName:v6 didBounceToNewLogicalName:v9];
    v61 = brc_bread_crumbs();
    v62 = brc_default_log();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
      __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_1();
    }

    [*v4 markBounceFinished];
    [*v4 saveToDB];
    uint64_t v36 = 0;
    goto LABEL_39;
  }
  uint64_t v36 = *__error();
  int v37 = *__error();
  char v38 = brc_bread_crumbs();
  v39 = brc_default_log();
  if (os_log_type_enabled(v39, (os_log_type_t)0x90u))
  {
    id v64 = *v4;
    *(_DWORD *)buf = 138412802;
    id v80 = v64;
    __int16 v81 = 1024;
    int v82 = v37;
    __int16 v83 = 2112;
    v84 = v38;
    _os_log_error_impl(&dword_1D353B000, v39, (os_log_type_t)0x90u, "[ERROR] Failed rename for bouncing %@ %{errno}d%@", buf, 0x1Cu);
  }

  *__error() = v37;
  [*v4 markBounceFailed];
  [*v4 saveToDB];
LABEL_39:

  return v36;
}

- (id)bouncePath:(id)a3 forItemConflictingWithAnFSRoot:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v31 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  int v28 = __Block_byref_object_copy__55;
  uint64_t v29 = __Block_byref_object_dispose__55;
  id v30 = 0;
  id v8 = [BRCRelativePath alloc];
  uint64_t v9 = [v6 parentFileID];
  id v10 = [v6 session];
  id v11 = [(BRCRelativePath *)v8 initWithFileID:v9 session:v10];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67__BRCFSWriter_Bouncing__bouncePath_forItemConflictingWithAnFSRoot___block_invoke;
  v19[3] = &unk_1E699BA38;
  uint64_t v24 = &v25;
  id v12 = v7;
  id v20 = v12;
  id v13 = v6;
  id v21 = v13;
  unint64_t v22 = self;
  id v14 = v11;
  id v23 = v14;
  if (![(BRCRelativePath *)v14 performOnOpenFileDescriptor:v19 error:&v31])
  {
    char v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      id v33 = v13;
      __int16 v34 = 1024;
      int v35 = v31;
      __int16 v36 = 2112;
      int v37 = v15;
      _os_log_error_impl(&dword_1D353B000, v16, (os_log_type_t)0x90u, "[ERROR] can't bounce %@ %{errno}d%@", buf, 0x1Cu);
    }
  }
  id v17 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v17;
}

uint64_t __67__BRCFSWriter_Bouncing__bouncePath_forItemConflictingWithAnFSRoot___block_invoke(uint64_t a1, uint64_t a2, __n128 a3)
{
  v4 = 0;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v31 = 0;
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
LABEL_2:
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = objc_msgSend(*(id *)(a1 + 32), "st", *(_OWORD *)&v27);
    id v7 = [v6 logicalName];
    +[BRCFileCoordinator itemAtPath:v5 origLogicalName:v7 didBounceToNewLogicalName:v4];

    id v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __67__BRCFSWriter_Bouncing__bouncePath_forItemConflictingWithAnFSRoot___block_invoke_cold_2();
    }

    uint64_t v10 = 0;
  }
  else
  {
    v4 = 0;
    id v13 = (id *)(a1 + 40);
    int v14 = 1002;
    a3.n128_u64[0] = 138412802;
    __n128 v27 = a3;
    while (1)
    {
      uint64_t v30 = 0;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v28 = (unint64_t)*(id *)(a1 + 32);
      long long v29 = (unint64_t)*(id *)(a1 + 40);
      uint64_t v30 = 0;
      uint64_t v15 = [*(id *)(a1 + 48) _generateGentlePhysicalBounceNameForPathMatch:&v28 dirfd:a2 existingSourceLogicalName:0 lastBounceNo:&v31];

      v4 = (void *)v15;
      if (!--v14) {
        break;
      }
      id v16 = [*v13 filename];
      int v17 = BRCRenameAt(a2, v16, a2, v4, 0);

      if (v17 < 0)
      {
        int v21 = *__error();
        unint64_t v22 = brc_bread_crumbs();
        id v23 = brc_default_log();
        if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
        {
          id v24 = *v13;
          *(_DWORD *)buf = v27.n128_u32[0];
          id v33 = v24;
          __int16 v34 = 1024;
          int v35 = v21;
          __int16 v36 = 2112;
          int v37 = v22;
          _os_log_error_impl(&dword_1D353B000, v23, (os_log_type_t)0x90u, "[ERROR] Failed rename for bouncing %@ %{errno}d%@", buf, 0x1Cu);
        }

        *__error() = v21;
      }
      else
      {
        uint64_t v18 = [*(id *)(a1 + 56) pathWithChildAtPath:v4];
        uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
        id v20 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = v18;
      }
      __destructor_8_s0_s8_s16_s24((uint64_t)&v28);
      if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
        goto LABEL_2;
      }
    }
    uint64_t v25 = brc_bread_crumbs();
    id v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      __67__BRCFSWriter_Bouncing__bouncePath_forItemConflictingWithAnFSRoot___block_invoke_cold_1();
    }

    __destructor_8_s0_s8_s16_s24((uint64_t)&v28);
    uint64_t v10 = 35;
  }

  return v10;
}

- (int)_computeURLMatchWithLookup:(id)a3 localItem:(id)a4 serverItem:(id)a5 bounceNamespace:(unsigned __int8)a6 applyNamespace:(unsigned __int8)a7 urlMatch:(id *)a8
{
  int v36 = a7;
  uint64_t v8 = a6;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v38 = a5;
  uint64_t v41 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  if (v8 != 1)
  {
    if (v11)
    {
      [v11 byPathMatch];
      goto LABEL_7;
    }
LABEL_6:
    uint64_t v43 = 0;
    memset(buf, 0, sizeof(buf));
    goto LABEL_7;
  }
  if (!v11) {
    goto LABEL_6;
  }
  [v11 faultedMatch];
LABEL_7:
  __move_assignment_8_8_s0_s8_s16_s24_t32w8((uint64_t)&v39, (uint64_t *)buf);
  if (!(void)v39) {
    goto LABEL_29;
  }
  id v13 = [v12 itemID];
  int v14 = [(id)v39 itemID];
  if ([v13 isEqualToItemID:v14])
  {
    uint64_t v15 = [v12 clientZone];
    id v16 = [v15 dbRowID];
    int v17 = [(id)v39 clientZone];
    uint64_t v18 = [v17 dbRowID];
    char v19 = objc_msgSend(v16, "br_isEqualToNumber:", v18);

    if (v19) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  if (objc_msgSend(v11, "tryToDeleteItemInNamespace:", v8, self))
  {
LABEL_29:
    int v20 = 0;
    goto LABEL_30;
  }
  if ([(id)v40 exists])
  {
    __copy_assignment_8_8_s0_s8_s16_s24_t32w8((uint64_t)a8, (uint64_t)&v39);
    int v20 = 1;
    goto LABEL_30;
  }
  [v11 _moveMissingItemAsideInNamespace:v8];
  if ([v12 isDocument])
  {
    int v21 = [v12 asDocument];
  }
  else
  {
    int v21 = 0;
  }
  if (v36 != 2) {
    goto LABEL_28;
  }
  int v22 = [v21 isPackage] ^ 1;
  if (v8) {
    LOBYTE(v22) = 1;
  }
  if ((v22 & 1) != 0
    || ![(id)v39 isDirectory]
    || ![(id)v40 exists])
  {
LABEL_28:

    goto LABEL_29;
  }
  id v23 = [v38 serverZone];
  id v24 = [v23 clientZone];
  char v25 = [v35 bouncePathMatch:&v39 toApplyServerItem:v38 clientZone:v24];

  if (v25)
  {
    id v26 = brc_bread_crumbs();
    __n128 v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      long long v28 = [(id)v40 filename];
      long long v29 = [(id)v39 st];
      uint64_t v30 = [v29 filename];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v28;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v30;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v26;
      _os_log_impl(&dword_1D353B000, v27, OS_LOG_TYPE_DEFAULT, "[NOTICE] Bounced transmogrifiable %@ to %@%@", buf, 0x20u);
    }
    goto LABEL_28;
  }
  id v32 = brc_bread_crumbs();
  id v33 = brc_default_log();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v39;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v32;
    _os_log_impl(&dword_1D353B000, v33, OS_LOG_TYPE_DEFAULT, "[NOTICE] Failed to bounce transmogrifiable %@%@", buf, 0x16u);
  }

  int v20 = -1;
LABEL_30:
  __destructor_8_s0_s8_s16_s24((uint64_t)&v39);

  return v20;
}

- (BOOL)_shouldBounceSourceItemWithLookup:(id)a3 localItem:(id)a4 serverItem:(id)a5 bounceNamespace:(unsigned __int8)a6 urlMatch:(id *)a7
{
  uint64_t v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if ([v13 isSharedToMeTopLevelItem]) {
    BOOL v15 = [(BRCFSWriter *)self _computeURLMatchWithLookup:v12 localItem:v13 serverItem:v14 bounceNamespace:v8 applyNamespace:0 urlMatch:a7] != 0;
  }
  else {
    BOOL v15 = 0;
  }

  return v15;
}

- (unint64_t)computeSourceBounceNumberIfNecessaryWithLookup:(id)a3 localItem:(id)a4 serverItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v26 = 0u;
  long long v27 = 0u;
  if ([(BRCFSWriter *)self _shouldBounceSourceItemWithLookup:v8 localItem:v9 serverItem:v10 bounceNamespace:1 urlMatch:&v26]|| [(BRCFSWriter *)self _shouldBounceSourceItemWithLookup:v8 localItem:v9 serverItem:v10 bounceNamespace:0 urlMatch:&v26])
  {
    id v11 = [v8 filename];
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v25 = 0;
    id v21 = 0;
    id v12 = (id)objc_msgSend(v11, "br_stringByDeletingPathBounceNo:andPathExtension:", &v25, &v21);
    id v13 = v21;
    if (![*((id *)&v27 + 1) resolveMustExist:1 error:0]) {
      goto LABEL_6;
    }
    id v14 = (void *)*((void *)&v27 + 1);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3254779904;
    v17[2] = __93__BRCFSWriter_Bouncing__computeSourceBounceNumberIfNecessaryWithLookup_localItem_serverItem___block_invoke;
    v17[3] = &unk_1F2AC6C40;
    v17[4] = self;
    __copy_constructor_8_8_s0_s8_s16_s24_t32w8(v20, (uint64_t)&v26);
    id v18 = v9;
    char v19 = &v22;
    LODWORD(v14) = [v14 performOnOpenFileDescriptor:v17 error:0];

    __destructor_8_s0_s8_s16_s24((uint64_t)v20);
    if (v14) {
      unint64_t v15 = v23[3];
    }
    else {
LABEL_6:
    }
      unint64_t v15 = 0;

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    unint64_t v15 = 0;
  }
  __destructor_8_s0_s8_s16_s24((uint64_t)&v26);

  return v15;
}

uint64_t __93__BRCFSWriter_Bouncing__computeSourceBounceNumberIfNecessaryWithLookup_localItem_serverItem___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 56;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) st];
  id v7 = [v6 logicalName];
  id v8 = (id)[v5 _generateGentlePhysicalBounceNameForPathMatch:v4 dirfd:a2 existingSourceLogicalName:v7 lastBounceNo:*(void *)(*(void *)(a1 + 48) + 8) + 24];

  return 0;
}

- (void)_stageCreationOfDirectory:(id)a3
{
  id v4 = a3;
  unsigned int v12 = 0;
  uint64_t v11 = 0;
  uint64_t v5 = [(BRCAccountSession *)self->_session stageRegistry];
  id v10 = 0;
  char v6 = [v5 makeDirectoryInStageGatherFileID:&v11 generationID:&v12 error:&v10];
  id v7 = v10;

  if (v6)
  {
    [v4 markStagedWithFileID:v11 generationID:v12];
  }
  else
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
      -[BRCFSWriter _stageCreationOfDirectory:]();
    }
  }
}

- (void)_stageCreationOfSymlink:(id)a3 forLocalItem:(id)a4
{
  id v6 = a4;
  unsigned int v17 = 0;
  uint64_t v16 = 0;
  session = self->_session;
  id v8 = a3;
  id v9 = [(BRCAccountSession *)session stageRegistry];
  id v10 = [v8 symlinkTarget];

  id v15 = 0;
  char v11 = [v9 makeSymlinkWithTarget:v10 inStageGatherFileID:&v16 generationID:&v17 error:&v15];
  id v12 = v15;

  if (v11)
  {
    [v6 markStagedWithFileID:v16 generationID:v17];
  }
  else
  {
    id v13 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u)) {
      -[BRCFSWriter _stageCreationOfSymlink:forLocalItem:]();
    }
  }
}

- (BOOL)applyLocalEditIfNecessaryToURL:(id)a3 forItem:(id)a4 serverItem:(id)a5 forDelete:(BOOL)a6 error:(id *)a7
{
  v72[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = v13;
  if (a6) {
    goto LABEL_6;
  }
  if (!v13) {
    id v13 = v12;
  }
  if (([v13 sharingOptions] & 0x20) == 0
    && ([v12 currentVersion],
        id v15 = objc_claimAutoreleasedReturnValue(),
        [v15 uploadError],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = objc_msgSend(v16, "br_isCloudDocsErrorCode:", 43),
        v16,
        v15,
        v17))
  {
LABEL_6:
    id v18 = [MEMORY[0x1E4F63BE8] manager];
    char v19 = [v18 permanentStorageForItemAtURL:v11 allocateIfNone:0 error:a7];

    if (v19)
    {
      int v20 = [v12 currentVersion];
      id v21 = [v20 originalPOSIXName];
      uint64_t v22 = objc_msgSend(v21, "br_pathExtension");

      id v23 = [v12 itemID];
      uint64_t v24 = [v23 itemIDString];
      uint64_t v25 = [@"roedit_" stringByAppendingString:v24];

      if ([v22 length])
      {
        uint64_t v26 = [v25 stringByAppendingPathExtension:v22];

        uint64_t v25 = (void *)v26;
      }
      id v27 = (id)*MEMORY[0x1E4F63BB8];
      [v19 additionWithName:v25 inNameSpace:v27 error:a7];
      v61 = v27;
      v62 = (char *)objc_claimAutoreleasedReturnValue();
      if (v62)
      {
        char v57 = v25;
        brc_bread_crumbs();
        long long v28 = (char *)objc_claimAutoreleasedReturnValue();
        long long v29 = brc_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v64 = v62;
          __int16 v65 = 2112;
          v66 = v28;
          _os_log_impl(&dword_1D353B000, v29, OS_LOG_TYPE_DEFAULT, "[WARNING] Found readonly edit we need to make live: %@%@", buf, 0x16u);
        }

        uint64_t v30 = [v12 st];
        uint64_t v31 = [v30 logicalName];
        uint64_t v32 = objc_msgSend(v31, "br_pathExtension");

        id v33 = [MEMORY[0x1E4F29128] UUID];
        __int16 v34 = [v33 UUIDString];

        v56 = (void *)v32;
        if (v32)
        {
          uint64_t v35 = [v34 stringByAppendingPathExtension:v32];

          __int16 v34 = (void *)v35;
        }
        int v58 = v22;
        uint64_t v36 = *MEMORY[0x1E4F63B90];
        v71[0] = *MEMORY[0x1E4F63B88];
        v71[1] = v36;
        v72[0] = v34;
        v72[1] = v27;
        int v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:2];
        int v38 = objc_msgSend(v19, "replaceDocumentWithContentsOfAddition:preservingCurrentVersionWithCreationInfo:createdAddition:error:", v62);
        id v59 = 0;
        id v60 = 0;
        if (v38)
        {
          long long v39 = brc_bread_crumbs();
          long long v40 = brc_default_log();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
            -[BRCFSWriter applyLocalEditIfNecessaryToURL:forItem:serverItem:forDelete:error:]();
          }

          uint64_t v41 = [v62 userInfo];
          char v42 = [v41 objectForKeyedSubscript:@"etag"];

          if (v42)
          {
            brc_bread_crumbs();
            uint64_t v43 = (char *)objc_claimAutoreleasedReturnValue();
            uint64_t v44 = brc_default_log();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              id v64 = v42;
              __int16 v65 = 2112;
              v66 = (const char *)v12;
              __int16 v67 = 2112;
              unint64_t v68 = v43;
              _os_log_impl(&dword_1D353B000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] Overriding etag to original value %@ for %@%@", buf, 0x20u);
            }

            id v45 = [v12 currentVersion];
            id v46 = [v45 ckInfo];
            [v46 setEtag:v42];
          }
          [v12 markNeedsReading];
          [v12 saveToDB];
        }
        else
        {
          uint64_t v50 = brc_bread_crumbs();
          int v51 = brc_default_log();
          if (os_log_type_enabled(v51, (os_log_type_t)0x90u)) {
            -[BRCFSWriter applyLocalEditIfNecessaryToURL:forItem:serverItem:forDelete:error:]();
          }

          char v42 = (char *)v60;
          if (v42)
          {
            v55 = brc_bread_crumbs();
            uint64_t v52 = brc_default_log();
            if (os_log_type_enabled(v52, (os_log_type_t)0x90u))
            {
              int v54 = "(passed to caller)";
              *(_DWORD *)buf = 136315906;
              id v64 = "-[BRCFSWriter applyLocalEditIfNecessaryToURL:forItem:serverItem:forDelete:error:]";
              __int16 v65 = 2080;
              if (!a7) {
                int v54 = "(ignored by caller)";
              }
              v66 = v54;
              __int16 v67 = 2112;
              unint64_t v68 = v42;
              __int16 v69 = 2112;
              v70 = v55;
              _os_log_error_impl(&dword_1D353B000, v52, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }
          }
          if (a7)
          {
            char v42 = v42;
            *a7 = v42;
          }
        }
        uint64_t v22 = v58;

        uint64_t v25 = v57;
      }
      else
      {
        brc_bread_crumbs();
        id v47 = (char *)objc_claimAutoreleasedReturnValue();
        char v48 = brc_default_log();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v64 = (const char *)v12;
          __int16 v65 = 2112;
          v66 = v47;
          _os_log_impl(&dword_1D353B000, v48, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find addition for %@, clearing upload error%@", buf, 0x16u);
        }

        id v49 = [v12 currentVersion];
        [v49 setUploadError:0];

        [v12 saveToDB];
        LOBYTE(v38) = 0;
      }
    }
    else
    {
      LOBYTE(v38) = 0;
    }
  }
  else
  {
    LOBYTE(v38) = 0;
  }

  return v38;
}

- (void)_applyChangesForServerAlias:(id)a3 localAlias:(id)a4 jobID:(int64_t)a5 zone:(id)a6 diffs:(unint64_t)a7
{
  char v7 = a7;
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v110 = a6;
  id v13 = [(BRCAccountSession *)self->_session applyScheduler];
  int v119 = 2;
  if ([v11 isLive])
  {
    id v14 = [v11 aliasTargetClientZone];
    id v15 = [v14 serverZone];

    if ([v15 isSharedZone])
    {
      uint64_t v16 = [v15 clientZone];
      int v17 = [v11 aliasTargetItemID];
      id v18 = [v16 serverItemByItemID:v17];

      if (v18)
      {
        char v19 = [v15 clientZone];
        int v20 = [v11 aliasTargetItemID];
        id v21 = [v19 itemByItemID:v20];

        [v13 setState:1 forServerItem:v18 localItem:v21];
      }
      uint64_t v22 = [v110 dbRowID];
      [v13 setState:0 forRank:a5 zoneRowID:v22];

LABEL_11:
      uint64_t v25 = 0;
      goto LABEL_12;
    }
  }
  if ([v12 isLost])
  {
    id v23 = brc_bread_crumbs();
    uint64_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v23;
      _os_log_impl(&dword_1D353B000, v24, OS_LOG_TYPE_DEFAULT, "[WARNING] Retry later, the alias is lost%@", buf, 0xCu);
    }

    goto LABEL_11;
  }
  if (![v12 isLive])
  {
    uint64_t v25 = 0;
    if (![v11 isLive]) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
  uint64_t v26 = [BRCRelativePath alloc];
  id v27 = [v12 st];
  long long v28 = [v27 fileID];
  uint64_t v29 = [v28 unsignedLongLongValue];
  uint64_t v30 = [v12 session];
  uint64_t v25 = [(BRCRelativePath *)v26 initWithFileID:v29 session:v30];

  if ([(BRCRelativePath *)v25 resolveMustExist:1 error:&v119])
  {
    uint64_t v31 = [(BRCRelativePath *)v25 parentFileID];
    uint64_t v32 = [v12 parentFileID];
    BOOL v33 = v31 == [v32 unsignedLongLongValue];

    if (v33)
    {
      if (([v11 isLive] & 1) == 0)
      {
        if (v25)
        {
          v111[0] = MEMORY[0x1E4F143A8];
          v111[1] = 3221225472;
          v111[2] = __71__BRCFSWriter__applyChangesForServerAlias_localAlias_jobID_zone_diffs___block_invoke_113;
          v111[3] = &unk_1E6994A60;
          uint64_t v25 = v25;
          v112 = v25;
          if ([(BRCRelativePath *)v25 performOnOpenParentFileDescriptor:v111 error:&v119])
          {

            __int16 v34 = brc_bread_crumbs();
            uint64_t v35 = brc_default_log();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
              -[BRCFSWriter _applyChangesForServerAlias:localAlias:jobID:zone:diffs:].cold.7();
            }

            [v12 markDead];
            [v12 saveToDBForServerEdit:1 keepAliases:0];
            uint64_t v36 = [v110 dbRowID];
            [v13 setState:0 forRank:a5 zoneRowID:v36];
          }
          else
          {
            v70 = brc_bread_crumbs();
            unint64_t v71 = brc_default_log();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG)) {
              -[BRCFSWriter _applyChangesForServerAlias:localAlias:jobID:zone:diffs:].cold.8();
            }
          }
        }
        goto LABEL_12;
      }
LABEL_23:
      if (v12 && (v7 & 0x62) == 0)
      {
        if (v7)
        {
          int v37 = brc_bread_crumbs();
          int v38 = brc_default_log();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
            +[BRCServerChangesApplyUtil handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:]();
          }

          [v12 updateStructuralCKInfoFromServerItem:v11];
          [v12 saveToDBForServerEdit:1 keepAliases:0];
        }
        long long v39 = brc_bread_crumbs();
        long long v40 = brc_default_log();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
          -[BRCFSWriter _applyChangesForServerAlias:localAlias:jobID:zone:diffs:]();
        }

        uint64_t v41 = [v110 dbRowID];
        [v13 setState:0 forRank:a5 zoneRowID:v41];

        goto LABEL_12;
      }
      v108 = [v11 parentLocalItemOnFS];
      if (!v108)
      {
        v98 = brc_bread_crumbs();
        v99 = brc_default_log();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_FAULT)) {
          -[BRCFSWriter _applyChangesForServerAlias:localAlias:jobID:zone:diffs:].cold.6();
        }
      }
      uint64_t v44 = [BRCRelativePath alloc];
      id v45 = [v108 fileID];
      v107 = -[BRCRelativePath initWithFileID:session:](v44, "initWithFileID:session:", [v45 unsignedLongLongValue], self->_session);

      if (![(BRCRelativePath *)v107 resolveAndKeepOpenMustExist:1 error:&v119])
      {
        int v54 = brc_bread_crumbs();
        v55 = brc_default_log();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v12;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v119;
          *(_WORD *)&buf[18] = 2112;
          *(void *)&buf[20] = v54;
          _os_log_debug_impl(&dword_1D353B000, v55, OS_LOG_TYPE_DEBUG, "[DEBUG] unable to relocate parent of %@: %{errno}d%@", buf, 0x1Cu);
        }

        goto LABEL_73;
      }
      if ([v12 isLive])
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        *(void *)&buf[24] = __Block_byref_object_copy__55;
        *(void *)v121 = __Block_byref_object_dispose__55;
        *(void *)&v121[8] = 0;
        v115[0] = MEMORY[0x1E4F143A8];
        v115[1] = 3221225472;
        v115[2] = __71__BRCFSWriter__applyChangesForServerAlias_localAlias_jobID_zone_diffs___block_invoke;
        v115[3] = &unk_1E699BAD8;
        v116 = v107;
        v117 = v25;
        v118 = buf;
        if ([(BRCRelativePath *)v117 performOnOpenParentFileDescriptor:v115 error:&v119])
        {
          uint64_t v46 = *(void *)(*(void *)&buf[8] + 40);
          id v47 = [v11 st];
          char v48 = [v47 logicalName];
          id v49 = [*(id *)(*(void *)&buf[8] + 40) filename];
          [v12 markRenamedUsingServerItem:v11 toRelpath:v46 logicalName:v48 filename:v49 origLogicalNameBeforeBounce:0 forContentApplyOnly:0];

          int v50 = 0;
          int v51 = "updated";
        }
        else
        {
          id v47 = brc_bread_crumbs();
          char v48 = brc_default_log();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
            -[BRCFSWriter _applyChangesForServerAlias:localAlias:jobID:zone:diffs:]();
          }
          int v51 = 0;
          int v50 = 20;
        }

        _Block_object_dispose(buf, 8);
        if (v50) {
          goto LABEL_72;
        }
        __int16 v69 = v12;
        goto LABEL_68;
      }
      v101 = +[BRCBookmark createName];
      v56 = objc_msgSend(v11, "newLocalItemWithServerZone:dbRowID:", v110, objc_msgSend(v12, "dbRowID"));
      v102 = [v56 asBRAlias];

      char v57 = [v11 st];
      v104 = [v57 _aliasTargetMangledID];

      v105 = [(BRCAccountSession *)self->_session clientZoneByMangledID:v104];
      if (!v105 && [v104 isShared])
      {
        int v58 = brc_bread_crumbs();
        id v59 = brc_default_log();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
          -[BRCFSWriter _applyChangesForServerAlias:localAlias:jobID:zone:diffs:].cold.5();
        }

        id v60 = [(BRCAccountSession *)self->_session containerScheduler];
        [v60 scheduleSyncDownForSharedDatabaseImmediately:0];
      }
      v61 = [v11 st];
      v103 = [v61 _aliasTargetItemID];

      v62 = [v105 itemByItemID:v103];
      v106 = [v62 asDocument];

      uint64_t v63 = [v106 asShareableItem];
      if (v63 && ([v106 isDead] & 1) == 0)
      {
        char v76 = [v106 isReserved];

        if ((v76 & 1) == 0)
        {
          id v77 = [v106 appLibrary];
          uint64_t v78 = [v102 appLibrary];
          if ([v77 isEqualToAppLibrary:v78])
          {
            char v79 = [v102 isSharedToMe];

            if ((v79 & 1) == 0)
            {
              id v80 = brc_bread_crumbs();
              __int16 v81 = brc_default_log();
              if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138413058;
                *(void *)&uint8_t buf[4] = v106;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v102;
                *(_WORD *)&buf[22] = 2048;
                *(void *)&buf[24] = a5;
                *(_WORD *)v121 = 2112;
                *(void *)&v121[2] = v80;
                _os_log_debug_impl(&dword_1D353B000, v81, OS_LOG_TYPE_DEBUG, "[DEBUG] Target %@ is in the same app library as %@ postponing rank: %lld%@", buf, 0x2Au);
              }

              v66 = [(BRCAccountSession *)self->_session applyScheduler];
              __int16 v67 = [v110 dbRowID];
              [(BRCBookmark *)v66 setState:19 forRank:a5 zoneRowID:v67];
              goto LABEL_57;
            }
          }
          else
          {
          }
          [v102 learnTarget:v106];
          int v82 = [BRCBookmark alloc];
          __int16 v83 = [v102 appLibrary];
          v84 = [v105 session];
          v66 = [(BRCBookmark *)v82 initWithTarget:v106 owningAppLibrary:v83 path:0 session:v84];

          id v114 = 0;
          BOOL v85 = [(BRCBookmark *)v66 resolveWithError:&v114];
          id v86 = v114;
          __int16 v67 = v86;
          if (v85)
          {
            id v113 = v86;
            uint64_t v87 = [(BRCBookmark *)v66 writeUnderParent:v107 name:v101 error:&v113];
            id v100 = v113;

            if (v87)
            {
              [v102 updateFromFSAtPath:v87];
              v88 = [v106 session];
              v89 = [v88 fsUploader];
              [v89 addAliasItem:v102 toUploadingItem:v106];

              int v68 = 0;
              int v51 = "created";
              __int16 v67 = (void *)v87;
            }
            else
            {
              v96 = brc_bread_crumbs();
              v97 = brc_default_log();
              if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG)) {
                -[BRCFSWriter _applyChangesForServerAlias:localAlias:jobID:zone:diffs:].cold.4();
              }

              int v51 = 0;
              int v68 = 20;
              __int16 v67 = v100;
            }
            goto LABEL_58;
          }
          v90 = brc_bread_crumbs();
          v91 = brc_default_log();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v67;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v106;
            *(_WORD *)&buf[22] = 2112;
            *(void *)&buf[24] = v90;
            _os_log_debug_impl(&dword_1D353B000, v91, OS_LOG_TYPE_DEBUG, "[DEBUG] Grabbing the bookmark data fails with: %@\nMarking the target lost: %@%@", buf, 0x20u);
          }

          [v106 markLostClearGenerationID:0 backoffMode:1];
LABEL_57:
          int v51 = 0;
          int v68 = 20;
LABEL_58:

          if (v68 == 20)
          {
            id v12 = v102;
LABEL_72:
            [(BRCRelativePath *)v107 close];
LABEL_73:

            goto LABEL_12;
          }
          __int16 v69 = v102;
LABEL_68:
          v72 = v69;
          objc_msgSend(v69, "updateStructuralCKInfoFromServerItem:", v11, v100);
          [v72 saveToDBForServerEdit:1 keepAliases:0];
          v73 = brc_bread_crumbs();
          v74 = brc_default_log();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = v51;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v72;
            *(_WORD *)&buf[22] = 2112;
            *(void *)&buf[24] = v73;
            _os_log_debug_impl(&dword_1D353B000, v74, OS_LOG_TYPE_DEBUG, "[DEBUG] Item %s successfully: %@%@", buf, 0x20u);
          }

          v75 = [v110 dbRowID];
          [v13 setState:0 forRank:a5 zoneRowID:v75];

          id v12 = v72;
          goto LABEL_72;
        }
      }
      else
      {
      }
      id v64 = brc_bread_crumbs();
      __int16 v65 = brc_default_log();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        v92 = [v102 targetItemID];
        if (v105) {
          v93 = "";
        }
        else {
          v93 = "unknown ";
        }
        uint64_t v94 = (uint64_t)v105;
        if (!v105)
        {
          uint64_t v63 = [v11 st];
          uint64_t v94 = [v63 _aliasTargetMangledID];
        }
        *(_DWORD *)buf = 138413314;
        *(void *)&uint8_t buf[4] = v92;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v93;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v94;
        *(_WORD *)v121 = 2048;
        *(void *)&v121[2] = a5;
        *(_WORD *)&v121[10] = 2112;
        *(void *)&v121[12] = v64;
        v95 = (void *)v94;
        _os_log_debug_impl(&dword_1D353B000, v65, OS_LOG_TYPE_DEBUG, "[DEBUG] Target %@ doesn't exist in %scontainer %@, postponing rank: %lld%@", buf, 0x34u);
        if (!v105)
        {
        }
      }

      v66 = [(BRCAccountSession *)self->_session applyScheduler];
      __int16 v67 = [v110 dbRowID];
      [(BRCBookmark *)v66 setState:24 forRank:a5 zoneRowID:v67];
      goto LABEL_57;
    }
    uint64_t v52 = brc_bread_crumbs();
    int v53 = brc_default_log();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSWriter _applyChangesForServerAlias:localAlias:jobID:zone:diffs:].cold.9();
    }

    if (([v12 isLost] & 1) == 0)
    {
      [v12 markLostClearGenerationID:0 backoffMode:1];
      [v12 saveToDB];
    }
  }
  else
  {
    char v42 = brc_bread_crumbs();
    uint64_t v43 = brc_default_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v119;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v42;
      _os_log_debug_impl(&dword_1D353B000, v43, OS_LOG_TYPE_DEBUG, "[DEBUG] unable to relocate %@: %{errno}d%@", buf, 0x1Cu);
    }

    [v12 markLostClearGenerationID:0 backoffMode:0];
    [v12 saveToDB];
  }
LABEL_12:
}

uint64_t __71__BRCFSWriter__applyChangesForServerAlias_localAlias_jobID_zone_diffs___block_invoke(uint64_t a1, int a2)
{
  unsigned int v13 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__BRCFSWriter__applyChangesForServerAlias_localAlias_jobID_zone_diffs___block_invoke_2;
  v8[3] = &unk_1E699BAB0;
  int v12 = a2;
  id v3 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  [v3 performOnOpenFileDescriptor:v8 error:&v13];
  uint64_t v6 = v13;

  return v6;
}

uint64_t __71__BRCFSWriter__applyChangesForServerAlias_localAlias_jobID_zone_diffs___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v4 = *(_DWORD *)(a1 + 56);
  uint64_t v5 = [*(id *)(a1 + 32) filename];
  uint64_t v6 = [*(id *)(a1 + 32) filename];
  int v7 = BRCRenameAt(v4, v5, a2, v6, 0);

  if (v7 < 0) {
    return *__error();
  }
  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = [*(id *)(a1 + 32) pathRelativeToRoot];
    int v17 = [*(id *)(a1 + 40) pathRelativeToRoot];
    unsigned int v18 = 138412802;
    char v19 = v16;
    __int16 v20 = 2112;
    id v21 = v17;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Reparented alias from %@ to %@%@", (uint8_t *)&v18, 0x20u);
  }
  id v10 = *(void **)(a1 + 40);
  uint64_t v11 = [*(id *)(a1 + 32) filename];
  uint64_t v12 = [v10 pathWithChildAtPath:v11];
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  unsigned int v18 = 0;
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) resolveMustExist:1 error:&v18])return 0; {
  else
  }
    return v18;
}

uint64_t __71__BRCFSWriter__applyChangesForServerAlias_localAlias_jobID_zone_diffs___block_invoke_113(uint64_t a1, int a2)
{
  id v3 = [*(id *)(a1 + 32) filename];
  int v4 = BRCUnlinkAt(a2, v3, 0);

  uint64_t result = 0;
  if (v4 < 0) {
    return *__error();
  }
  return result;
}

- (unsigned)_computeDesiredVersionOptionsForDocument:(id)a3 createdReservedItem:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 asDocument];
  int v7 = [v6 desiredVersion];
  if ([v6 isReserved])
  {
    if (v4)
    {
      if ([v6 shouldBeGreedy]) {
        int v8 = 3;
      }
      else {
        int v8 = 1;
      }
    }
    else
    {
      if (!v7)
      {
        uint64_t v12 = brc_bread_crumbs();
        uint64_t v13 = brc_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          -[BRCFSWriter _computeDesiredVersionOptionsForDocument:createdReservedItem:]();
        }
      }
      int v8 = [v7 options] | 1;
    }
  }
  else if (v7)
  {
    int v8 = [v7 options];
  }
  else if ([v6 isFault])
  {
    int v8 = 1;
  }
  else
  {
    int v8 = 2;
  }
  if ([v6 shouldAutomaticallyDownloadThumbnail])
  {
    id v9 = [v5 appLibrary];
    int v10 = [v9 shouldEvictUploadedItems];

    if (!v10) {
      v8 |= 4u;
    }
  }

  return v8 & 0xFFFFFFF7;
}

- (void)_scheduleActionCoordination:(id)a3 dstURL:(id)a4 action:(const char *)a5 li:(id)a6 si:(id)a7 diffs:(unint64_t)a8 hasFinished:(BOOL *)a9
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  uint64_t v16 = (char *)a6;
  id v17 = a7;
  if (!v14)
  {
    uint64_t v26 = brc_bread_crumbs();
    id v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSWriter _scheduleActionCoordination:dstURL:action:li:si:diffs:hasFinished:]();
    }
    goto LABEL_11;
  }
  unsigned int v18 = [v15 path];
  char v19 = [v14 path];
  int v20 = [v18 isEqualToString:v19];

  if (v20)
  {

    id v21 = brc_bread_crumbs();
    __int16 v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSWriter _scheduleActionCoordination:dstURL:action:li:si:diffs:hasFinished:]();
    }

    id v15 = 0;
  }
  id v23 = [v15 path];
  uint64_t v24 = [v14 path];
  uint64_t v25 = objc_msgSend(v23, "br_pathRelativeToPath:", v24);

  if (v25)
  {
    uint64_t v26 = brc_bread_crumbs();
    id v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      long long v28 = [v15 path];
      uint64_t v29 = [v14 path];
      *(_DWORD *)buf = 138413058;
      char v57 = v16;
      __int16 v58 = 2112;
      id v59 = v28;
      __int16 v60 = 2112;
      id v61 = v29;
      __int16 v62 = 2112;
      uint64_t v63 = v26;
      _os_log_impl(&dword_1D353B000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] Retrying item because we are trying to rename it into itself: %@ '%@' vs '%@'%@", buf, 0x2Au);
    }
LABEL_11:

    goto LABEL_12;
  }
  if (v15 && [v16 isReserved])
  {
    brc_bread_crumbs();
    uint64_t v30 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      char v57 = v16;
      __int16 v58 = 2112;
      id v59 = v30;
      _os_log_impl(&dword_1D353B000, v31, OS_LOG_TYPE_DEFAULT, "[WARNING] Reserved item needs rename %@.  Re-staging to make live again%@", buf, 0x16u);
    }

    [v16 markNeedsDeleteForRescheduleOfItem:v17];
    [v16 saveToDB];
  }
  else
  {
    int v53 = a5;
    uint64_t v32 = [v16 appLibrary];
    BOOL v33 = [v32 defaultClientZone];
    __int16 v34 = [v33 defaultAppLibrary];

    int v54 = v34;
    uint64_t v52 = [v34 coordinatorForItem:v16 forRead:0];
    *a9 = 0;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __81__BRCFSWriter__scheduleActionCoordination_dstURL_action_li_si_diffs_hasFinished___block_invoke;
    v55[3] = &unk_1E699BB00;
    v55[4] = self;
    uint64_t v35 = (void *)MEMORY[0x1D94389C0](v55);
    if (v15)
    {
      uint64_t v36 = brc_bread_crumbs();
      int v37 = brc_default_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        id v49 = [v14 path];
        char v48 = [v15 path];
        int v50 = BRCItemFieldsPrettyPrint();
        *(_DWORD *)buf = 136316674;
        char v57 = v53;
        __int16 v58 = 2112;
        id v59 = v16;
        __int16 v60 = 2112;
        id v61 = v17;
        __int16 v62 = 2112;
        uint64_t v63 = v49;
        __int16 v64 = 2112;
        __int16 v65 = v48;
        __int16 v66 = 2112;
        __int16 v67 = v50;
        __int16 v68 = 2112;
        __int16 v69 = v36;
        _os_log_debug_impl(&dword_1D353B000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] found item needing %s:\n  client item: %@\n  server item: %@\n  src path   : %@\n  dst path   : %@\n  diffs      : %@%@", buf, 0x48u);
      }
      int v38 = [v16 st];
      long long v39 = [v38 stagedFileID];
      long long v40 = [(BRCFSWriter *)self serialQueue];
      taskTracker = self->_taskTracker;
      char v42 = v52;
      [v52 scheduleRenameOfItemAtURL:v14 toItemAtURL:v15 contentUpdate:v39 != 0 queue:v40 taskTracker:taskTracker accessor:v35];
    }
    else
    {
      uint64_t v43 = brc_bread_crumbs();
      uint64_t v44 = brc_default_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        int v51 = [v14 path];
        id v47 = BRCItemFieldsPrettyPrint();
        *(_DWORD *)buf = 136316418;
        char v57 = v53;
        __int16 v58 = 2112;
        id v59 = v16;
        __int16 v60 = 2112;
        id v61 = v17;
        __int16 v62 = 2112;
        uint64_t v63 = v51;
        __int16 v64 = 2112;
        __int16 v65 = v47;
        __int16 v66 = 2112;
        __int16 v67 = v43;
        _os_log_debug_impl(&dword_1D353B000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] found item needing %s:\n  client item: %@\n  server item: %@\n  path       : %@\n  diffs      : %@%@", buf, 0x3Eu);
      }
      char v45 = [v17 isLive];
      int v38 = [(BRCFSWriter *)self serialQueue];
      uint64_t v46 = self->_taskTracker;
      char v42 = v52;
      if (v45) {
        [v52 scheduleUpdateOfItemAtURL:v14 queue:v38 taskTracker:v46 accessor:v35];
      }
      else {
        [v52 scheduleDeleteOfItemAtURL:v14 queue:v38 taskTracker:v46 accessor:v35];
      }
    }
  }
LABEL_12:
}

uint64_t __81__BRCFSWriter__scheduleActionCoordination_dstURL_action_li_si_diffs_hasFinished___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) writeUnderCoordinationFromURL:a2 toURL:a3 canDelete:a4];
}

- (void)_handleClashingItemIfNecessary:(id)a3 parentID:(id)a4 si:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 st];
  uint64_t v12 = [v11 logicalName];
  uint64_t v13 = [v8 reservedItemByParentID:v9 andLogicalName:v12];

  if (v13)
  {
    id v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSWriter _handleClashingItemIfNecessary:parentID:si:]();
    }

    long long v27 = 0u;
    long long v28 = 0u;
    id v16 = v13;
    uint64_t v25 = 0;
    id v26 = v16;
    id v17 = [(BRCFSWriter *)self _generateGentlePhysicalBounceNameForPathMatch:&v26 dirfd:0xFFFFFFFFLL existingSourceLogicalName:0 lastBounceNo:&v25];
    if (!v25)
    {
      id v21 = brc_bread_crumbs();
      __int16 v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        -[BRCFSWriter _handleClashingItemIfNecessary:parentID:si:]();
      }
    }
    objc_msgSend(v16, "bounceReservedItemWithBounceNumber:");
    unsigned int v18 = [v16 st];
    char v19 = [v18 filename];
    char v20 = [v17 isEqualToString:v19];

    if ((v20 & 1) == 0)
    {
      id v23 = brc_bread_crumbs();
      uint64_t v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[BRCFSWriter _handleClashingItemIfNecessary:parentID:si:]();
      }
    }
    [v16 saveToDB];

    __destructor_8_s0_s8_s16_s24((uint64_t)&v26);
  }
}

- (void)applyChangesForServerItem:(id)a3 localItem:(id)a4 rank:(int64_t)a5 zone:(id)a6 activity:(id)a7 hasFinished:(BOOL *)a8
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  int64_t v14 = (int64_t)a4;
  id v15 = a6;
  id v135 = a7;
  id v16 = [v15 clientZone];
  v137 = [(BRCAccountSession *)self->_session applyScheduler];
  uint64_t v142 = [(id)v14 diffAgainstServerItem:v13];
  memset(v141, 0, sizeof(v141));
  __brc_create_section(0, (uint64_t)"-[BRCFSWriter applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:]", 2382, v141);
  id v17 = brc_bread_crumbs();
  unsigned int v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    id v133 = v15;
    uint64_t v36 = v16;
    int v37 = self;
    uint64_t v38 = v141[0];
    long long v39 = BRCItemFieldsPrettyPrint();
    if (v14) {
      long long v40 = "existing";
    }
    else {
      long long v40 = "new";
    }
    id v41 = v39;
    *(_DWORD *)buf = 134219266;
    v144 = (BRCFSWriter *)v38;
    __int16 v145 = 2048;
    int64_t v146 = a5;
    __int16 v147 = 2080;
    v148 = v40;
    __int16 v149 = 2112;
    id v150 = v13;
    __int16 v151 = 2112;
    id v152 = v41;
    __int16 v153 = 2112;
    v154 = v17;
    _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Apply Changes[%lld]: %s item: %@\n diffs: %@%@", buf, 0x3Eu);

    self = v37;
    id v16 = v36;
    id v15 = v133;
  }
  if (!((unint64_t)v13 | v14))
  {
    v116 = brc_bread_crumbs();
    v117 = brc_default_log();
    if (os_log_type_enabled(v117, OS_LOG_TYPE_FAULT)) {
      -[BRCFSWriter applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:].cold.5();
    }
  }
  if (!v16)
  {
    brc_bread_crumbs();
    char v19 = (char *)objc_claimAutoreleasedReturnValue();
    char v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v144 = (BRCFSWriter *)v13;
      __int16 v145 = 2112;
      int64_t v146 = v14;
      __int16 v147 = 2112;
      v148 = v19;
      _os_log_fault_impl(&dword_1D353B000, v20, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: no client zone when applying %@ and %@%@", buf, 0x20u);
    }
  }
  *a8 = 1;
  BOOL v21 = +[BRCServerChangesApplyUtil deletingShareRoot:v13 localItem:v14];
  LOBYTE(v122) = v21;
  if (+[BRCServerChangesApplyUtil checkEarlyExitsPriorToApplying:v14 si:v13 rank:a5 scheduler:v137 zone:v15 session:self->_session isDeleteOfShareRoot:v122 diffs:v142 clientZone:v16])
  {
    goto LABEL_11;
  }
  if (([(id)v14 isBRAlias] & 1) != 0 || objc_msgSend(v13, "isBRAlias"))
  {
    __int16 v22 = [(id)v14 asBRAlias];
    [(BRCFSWriter *)self _applyChangesForServerAlias:v13 localAlias:v22 jobID:a5 zone:v15 diffs:v142];

LABEL_11:
    id v23 = 0;
    uint64_t v24 = 0;
    goto LABEL_12;
  }
  if (![v13 isLive])
  {
    if (+[BRCServerChangesApplyUtil handleApplyChangesForUnliveServerItem:v14 isDeleteOfShareRoot:v21 rank:a5 scheduler:v137 zone:v15 session:self->_session])
    {
      goto LABEL_11;
    }
    uint64_t v35 = +[BRCItemToPathLookup lookupForItem:v14];
    uint64_t v24 = [v35 coordinatedWriteURL];
    [v35 closePaths];

    id v23 = 0;
    v132 = "delete";
    goto LABEL_132;
  }
  char v140 = 0;
  if ([(id)v14 isShareAcceptationFault])
  {
    uint64_t v25 = [(id)v14 asShareAcceptationFault];
    [v25 markNeedsTransformIntoNormalFault];

    char v140 = 1;
  }
  if ([v13 isDirectoryFault])
  {
    id v26 = [v13 itemID];
    if ([v26 isDocumentsFolder])
    {
      long long v27 = [(id)v14 appLibrary];
      BOOL v28 = ([v27 state] & 0x4000000) == 0;

      if (v28) {
        goto LABEL_23;
      }
      uint64_t v29 = [(id)v14 appLibrary];
      [v29 clearStateBits:0x4000000];

      id v26 = brc_bread_crumbs();
      uint64_t v30 = brc_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSWriter applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:].cold.4();
      }
    }
  }
LABEL_23:
  if ([(id)v14 physicalNameNeedsRename]) {
    v142 |= 0x40uLL;
  }
  if (+[BRCServerChangesApplyUtil handleEtagsChangesOnly:v14 si:v13 rank:a5 scheduler:v137 zone:v15 diffs:&v142 needsSave:&v140])
  {
    goto LABEL_11;
  }
  if (v14 && ![(id)v14 isDead])
  {
    uint64_t v62 = 0;
  }
  else
  {
    uint64_t v31 = [v13 parentZoneOnFS];
    v128 = [v31 clientZone];

    if (v128)
    {
      uint64_t v32 = [v13 parentItemIDOnFS];
      [(BRCFSWriter *)self _handleClashingItemIfNecessary:v128 parentID:v32 si:v13];
      BOOL v33 = +[BRCServerChangesApplyUtil handleNonRevivedItemIfNecessary:v14 si:v13 rank:a5 scheduler:v137 zone:v15 hasInitialScanItemTypeMismatch:0];

      __int16 v34 = v128;
      if (v33)
      {
LABEL_30:

        goto LABEL_11;
      }
    }
    v134 = objc_msgSend(v13, "newLocalItemWithServerZone:dbRowID:", v15, objc_msgSend((id)v14, "dbRowID"));

    [v134 markReserved];
    char v42 = [v134 orig];
    [v42 markReserved];

    char v140 = 1;
    if ([v134 isDirectoryWithPackageName])
    {
      [v134 bouncePhysicalNameToRepresentableName];
      brc_bread_crumbs();
      uint64_t v43 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v44 = brc_default_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        char v45 = [v134 st];
        uint64_t v46 = [v45 physicalName];
        *(_DWORD *)buf = 138412802;
        v144 = (BRCFSWriter *)v13;
        __int16 v145 = 2112;
        int64_t v146 = (int64_t)v46;
        __int16 v147 = 2112;
        v148 = v43;
        _os_log_impl(&dword_1D353B000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] Found directory %@ that has a package name, bounced name to %@%@", buf, 0x20u);
      }
      id v47 = [v134 session];
      char v48 = [v47 itemTransmogrifier];
      id v49 = [v134 asDirectory];
      [v48 scheduleBouncedDirectoryRename:v49];
    }
    if ([v134 isSharedToMeTopLevelItem])
    {
      int v50 = [v13 asSharedItem];
      v124 = [v50 fallbackParentAppLibraryOnFS];

      v125 = [v124 defaultClientZone];
      int v51 = [v134 asShareableItem];
      v123 = [v51 unsaltedBookmarkData];

      uint64_t v52 = [v125 serverAliasByUnsaltedBookmarkData:v123];
      LODWORD(v51) = v52 == 0;

      if (v51)
      {
        brc_bread_crumbs();
        int v53 = (BRCFSWriter *)objc_claimAutoreleasedReturnValue();
        int v54 = brc_default_log();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v144 = v53;
          _os_log_impl(&dword_1D353B000, v54, OS_LOG_TYPE_DEFAULT, "[WARNING] No alias pointing to new item shared container, forcing sync down on private container%@", buf, 0xCu);
        }

        v55 = [v125 serverZone];
        char v56 = [v55 state];

        if ((v56 & 4) != 0)
        {
          [v125 scheduleSyncDown];
        }
        else
        {
          char v57 = [v13 itemGlobalID];
          __int16 v58 = [v125 serverZone];
          id v59 = +[BRCItemID shareAliasRecordIDFromTargetItemID:v57 zone:v58 hasDerivedShareAlias:0];

          __int16 v60 = [v125 locateRecordIfNecessaryForRecordID:v59 isUserWaiting:0];
          v138[0] = MEMORY[0x1E4F143A8];
          v138[1] = 3221225472;
          v138[2] = __82__BRCFSWriter_applyChangesForServerItem_localItem_rank_zone_activity_hasFinished___block_invoke;
          v138[3] = &unk_1E69967D0;
          id v61 = v59;
          id v139 = v61;
          [v60 addLocateRecordCompletionBlock:v138];
        }
      }
    }
    brc_bread_crumbs();
    uint64_t v63 = (char *)objc_claimAutoreleasedReturnValue();
    __int16 v64 = brc_default_log();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    {
      v106 = @"revived";
      *(_DWORD *)buf = 138412802;
      if (!v14) {
        v106 = @"new";
      }
      v144 = (BRCFSWriter *)v106;
      __int16 v145 = 2112;
      int64_t v146 = (int64_t)v134;
      __int16 v147 = 2112;
      v148 = v63;
      _os_log_debug_impl(&dword_1D353B000, v64, OS_LOG_TYPE_DEBUG, "[DEBUG] Created reservation for %@ item: %@%@", buf, 0x20u);
    }

    uint64_t v62 = 1;
    int64_t v14 = (int64_t)v134;
  }
  if (+[BRCServerChangesApplyUtil shouldForceApplyContentForItem:v14])
  {
    __int16 v65 = brc_bread_crumbs();
    __int16 v66 = brc_default_log();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSWriter applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:]();
    }

    char v67 = v142 & 0x9F;
    v142 &= 0xFFFFFFFFFFFFFF9FLL;
  }
  else
  {
    char v67 = v142;
  }
  __int16 v68 = "reparent";
  if ((v67 & 0x20) == 0) {
    __int16 v68 = "rename";
  }
  uint64_t v69 = v67 & 0x60;
  uint64_t v70 = "update";
  if (v69) {
    uint64_t v70 = v68;
  }
  uint64_t v129 = v69;
  v132 = v70;
  if ([v13 isLive] && objc_msgSend((id)v14, "isRejected"))
  {
    unint64_t v71 = brc_bread_crumbs();
    v72 = brc_default_log();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v144 = self;
      __int16 v145 = 2112;
      int64_t v146 = (int64_t)v71;
      _os_log_impl(&dword_1D353B000, v72, OS_LOG_TYPE_DEFAULT, "[WARNING] Rejected item was revived.  Marking sync as idle to apply server version for %@%@", buf, 0x16u);
    }

    [(id)v14 markRejectedItemRemotelyRevived];
    char v140 = 1;
  }
  if ([(id)v14 isDirectory])
  {
    if (v129)
    {
      v73 = [v13 st];
      v74 = [v73 logicalName];
      int v75 = objc_msgSend(v74, "br_isPackageRoot");

      if (v75)
      {
        brc_bread_crumbs();
        char v76 = (char *)objc_claimAutoreleasedReturnValue();
        id v77 = brc_default_log();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v78 = [v13 st];
          char v79 = [v78 logicalName];
          *(_DWORD *)buf = 138412802;
          v144 = (BRCFSWriter *)v14;
          __int16 v145 = 2112;
          int64_t v146 = (int64_t)v79;
          __int16 v147 = 2112;
          v148 = v76;
          _os_log_impl(&dword_1D353B000, v77, OS_LOG_TYPE_DEFAULT, "[WARNING] Renaming %@ to %@ which has a package name%@", buf, 0x20u);
        }
        id v80 = [(id)v14 session];
        __int16 v81 = [v80 itemTransmogrifier];
        int v82 = [(id)v14 asDirectory];
        [v81 scheduleBouncedDirectoryRename:v82];
      }
    }
    if ([(id)v14 isReserved])
    {
      __int16 v83 = [(id)v14 st];
      v84 = [v83 stagedFileID];
      BOOL v85 = v84 == 0;

      if (v85)
      {
        [(BRCFSWriter *)self _stageCreationOfDirectory:v14];
        char v140 = 1;
      }
      v132 = "creation";
    }
    id v86 = [v13 st];
    int v87 = [v86 type];
    v88 = [(id)v14 st];
    if (v87 == [v88 type])
    {
    }
    else
    {
      v95 = [v13 st];
      unsigned int v96 = [v95 type];
      if (v96 <= 0xA && ((1 << v96) & 0x611) != 0)
      {
        v97 = [(id)v14 st];
        unsigned int v98 = [v97 type];
        if (v98 <= 0xA && ((1 << v98) & 0x611) != 0)
        {
          v99 = [(id)v14 st];
          BOOL v126 = [v99 type] == 4;

          if (v126) {
            goto LABEL_116;
          }
          id v100 = [(id)v14 st];
          v101 = [v13 st];
          objc_msgSend(v100, "setType:", objc_msgSend(v101, "type"));

          char v140 = 1;
          id v86 = brc_bread_crumbs();
          v102 = brc_default_log();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v144 = (BRCFSWriter *)v13;
            __int16 v145 = 2112;
            int64_t v146 = v14;
            __int16 v147 = 2112;
            v148 = (const char *)v86;
            _os_log_impl(&dword_1D353B000, v102, OS_LOG_TYPE_DEFAULT, "[WARNING] Updating item type from server item %@ for %@%@", buf, 0x20u);
          }
        }
        else
        {
        }
      }
      else
      {
      }
    }
  }
  else
  {
    if ([(id)v14 isSymLink])
    {
      if ([(id)v14 isReserved])
      {
        v89 = [(id)v14 st];
        v90 = [v89 stagedFileID];
        BOOL v91 = v90 == 0;

        if (!v91)
        {
          v132 = "creation";
          goto LABEL_116;
        }
        v105 = [(id)v14 asSymlink];
        [(BRCFSWriter *)self _stageCreationOfSymlink:v13 forLocalItem:v105];

        char v140 = 1;
        v104 = "creation";
      }
      else
      {
        if ((v142 & 0x2000) == 0) {
          goto LABEL_116;
        }
        v103 = [(id)v14 asSymlink];
        [(BRCFSWriter *)self _stageCreationOfSymlink:v13 forLocalItem:v103];

        char v140 = 1;
        v104 = "update";
      }
      v132 = v104;
LABEL_117:
      [(id)v14 saveToDBForServerEdit:1 keepAliases:0];
      goto LABEL_118;
    }
    if (![(id)v14 isDocument]) {
      goto LABEL_116;
    }
    __int16 v34 = [(id)v14 asDocument];
    if ([v34 isReserved]) {
      v92 = "creation";
    }
    else {
      v92 = v132;
    }
    uint64_t v93 = [(BRCFSWriter *)self _computeDesiredVersionOptionsForDocument:v14 createdReservedItem:v62];
    if ([v34 updateDesiredVersionWithServerItem:v13 diffs:v142 options:v93 needsSave:&v140] != 1)
    {
      if (v140) {
        [v34 saveToDBForServerEdit:1 keepAliases:0];
      }
      goto LABEL_30;
    }
    if ([v34 isReserved])
    {
      id v86 = v34;
      int v94 = 1;
    }
    else
    {
      int v94 = [v34 isFault];
      id v86 = v34;
    }
    v107 = "eviction";
    if ((v93 & 1) == 0) {
      v107 = "making live";
    }
    if (((v93 & 1) == 0) != v94) {
      v108 = v92;
    }
    else {
      v108 = v107;
    }
    v132 = v108;
  }

LABEL_116:
  if (v140) {
    goto LABEL_117;
  }
LABEL_118:
  v109 = +[BRCItemToPathLookup lookupForItem:v14];
  uint64_t v24 = [v109 coordinatedWriteURL];
  if (v129)
  {
    id v110 = +[BRCItemToPathLookup lookupForServerItem:v13 cleanupFaults:0];
    id v23 = [v110 coordinatedWriteURL];
    [v110 closePaths];
  }
  else
  {
    id v23 = 0;
  }
  [v109 closePaths];
  if (v129 && !v23)
  {
    v111 = brc_bread_crumbs();
    v112 = brc_default_log();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSWriter applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:]();
    }

    id v23 = 0;
    goto LABEL_12;
  }
  if (v23)
  {
    id v113 = [v23 lastPathComponent];
    id v114 = [(id)v14 computedDestinationFilenameFromServerItem:v13];
    char v130 = [v113 isEqualToString:v114];

    if ((v130 & 1) == 0)
    {
      brc_bread_crumbs();
      v131 = (char *)objc_claimAutoreleasedReturnValue();
      v115 = brc_default_log();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_FAULT))
      {
        v127 = v115;
        v118 = [v23 lastPathComponent];
        id v119 = [(id)v14 computedDestinationFilenameFromServerItem:v13];
        *(_DWORD *)buf = 138412802;
        v144 = v118;
        __int16 v145 = 2112;
        int64_t v146 = (int64_t)v119;
        __int16 v147 = 2112;
        v148 = v131;
        _os_log_fault_impl(&dword_1D353B000, v127, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: dst %@ isn't equal to computed %@%@", buf, 0x20u);

        v115 = v127;
      }
    }
  }

LABEL_132:
  if ([(id)v14 isDead])
  {
    v120 = brc_bread_crumbs();
    v121 = brc_default_log();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_FAULT)) {
      -[BRCFSWriter applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:]();
    }
  }
  [(BRCFSWriter *)self _scheduleActionCoordination:v24 dstURL:v23 action:v132 li:v14 si:v13 diffs:v142 hasFinished:a8];
LABEL_12:
  __brc_leave_section(v141);
}

void __82__BRCFSWriter_applyChangesForServerItem_localItem_rank_zone_activity_hasFinished___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = @"fail";
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138413058;
    if (a2) {
      id v8 = @"success";
    }
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] Fetch share alias for share alias record ID [%@]: %@ with error %@%@", (uint8_t *)&v10, 0x2Au);
  }
}

- (void)_writeUnderCoordinationFromURL:(id)a3 toURL:(id)a4 canDelete:(BOOL)a5
{
  BOOL v60 = a5;
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(BRCAccountSession *)self->_session clientDB];
  char v10 = [v9 isBatchSuspended];

  if ((v10 & 1) == 0)
  {
    int v50 = brc_bread_crumbs();
    int v51 = brc_default_log();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader lookupAndReadItemUnderCoordinationAtURL:]();
    }
  }
  if (v8)
  {
    uint64_t v11 = [(BRCAccountSession(LegacyAdditions) *)self->_session fsReader];
    __int16 v12 = [v11 lookupAndReadItemUnderCoordinationAtURL:v8];

    if (!v12)
    {
      id v13 = brc_bread_crumbs();
      __int16 v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSWriter _writeUnderCoordinationFromURL:toURL:canDelete:].cold.5(v8, (uint64_t)v13, v14);
      }

      [0 closePaths];
      __int16 v12 = 0;
      id v8 = 0;
    }
  }
  else
  {
    __int16 v12 = 0;
  }
  id v15 = [(BRCAccountSession(LegacyAdditions) *)self->_session fsReader];
  __int16 v16 = [v15 lookupAndReadItemUnderCoordinationAtURL:v7];

  if (v16)
  {
    if (v12)
    {
      id v17 = [v16 parentRelpath];
      uint64_t v18 = +[BRCPathToItemLookup lookupForRelativePath:v17];
      id v61 = [v18 clientZone];
      char v19 = [v12 parentRelpath];
      char v20 = +[BRCPathToItemLookup lookupForRelativePath:v19];
      uint64_t v62 = [v20 clientZone];

      if (v61 != v62)
      {
        BOOL v21 = [v16 byIDServerItem];
        __int16 v22 = v21;
        if (v21)
        {
          id v23 = v21;
        }
        else
        {
          id v23 = [v16 faultedServerItem];
        }
        id v26 = v23;

        if (([v26 isSharedToMeTopLevelItem] & 1) != 0
          || ([v26 clientZone],
              uint64_t v29 = objc_claimAutoreleasedReturnValue(),
              int v30 = [v29 isEqualToClientZone:v62],
              v29,
              v30))
        {
          BOOL v28 = brc_bread_crumbs();
          uint64_t v31 = brc_default_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
            -[BRCFSWriter _writeUnderCoordinationFromURL:toURL:canDelete:].cold.4();
          }

          long long v27 = v8;
        }
        else
        {
          brc_bread_crumbs();
          uint64_t v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
          BOOL v33 = brc_default_log();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v65 = (uint64_t)v61;
            __int16 v66 = 2112;
            char v67 = v62;
            __int16 v68 = 2112;
            uint64_t v69 = v32;
            _os_log_debug_impl(&dword_1D353B000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] Ignoring destination part of coordination: URLs don't point to the same container: %@ != %@%@", buf, 0x20u);
          }

          [v12 closePaths];
          __int16 v12 = 0;
          long long v27 = 0;
          BOOL v28 = v8;
        }
        id v8 = v7;
LABEL_32:

        id v7 = v8;
        goto LABEL_33;
      }
      uint64_t v62 = v61;
    }
    else
    {
      id v61 = 0;
      uint64_t v62 = 0;
    }
    long long v27 = v8;
LABEL_33:
    memset(v63, 0, sizeof(v63));
    __brc_create_section(0, (uint64_t)"-[BRCFSWriter _writeUnderCoordinationFromURL:toURL:canDelete:]", 2667, v63);
    __int16 v34 = brc_bread_crumbs();
    uint64_t v35 = brc_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      char v42 = @", deleting";
      if (!v60) {
        char v42 = &stru_1F2AC7720;
      }
      uint64_t v57 = v63[0];
      __int16 v58 = v42;
      if (v27) {
        uint64_t v43 = @", renaming";
      }
      else {
        uint64_t v43 = &stru_1F2AC7720;
      }
      uint64_t v44 = @"\n from ";
      if (!v27) {
        uint64_t v44 = @"\n at ";
      }
      v55 = v43;
      char v56 = v44;
      id v59 = [v7 path];
      int v54 = [v59 stringByAbbreviatingWithTildeInPath];
      char v45 = @"\n   to ";
      if (!v27) {
        char v45 = &stru_1F2AC7720;
      }
      int v53 = v45;
      uint64_t v46 = [v27 path];
      uint64_t v47 = [v46 stringByAbbreviatingWithTildeInPath];
      char v48 = (void *)v47;
      uint64_t v52 = v46;
      if (v47) {
        id v49 = (__CFString *)v47;
      }
      else {
        id v49 = &stru_1F2AC7720;
      }
      *(_DWORD *)buf = 134220290;
      uint64_t v65 = v57;
      __int16 v66 = 2112;
      char v67 = v55;
      __int16 v68 = 2112;
      uint64_t v69 = v58;
      __int16 v70 = 2112;
      unint64_t v71 = v56;
      __int16 v72 = 2112;
      v73 = v54;
      __int16 v74 = 2112;
      int v75 = v53;
      __int16 v76 = 2112;
      id v77 = v49;
      __int16 v78 = 2112;
      char v79 = v16;
      __int16 v80 = 2112;
      __int16 v81 = v12;
      __int16 v82 = 2112;
      __int16 v83 = v34;
      _os_log_debug_impl(&dword_1D353B000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx acquired coordination for (writing%@%@)%@%@%@%@\nsource lookup: %@\ndestination lookup: %@\n%@", buf, 0x66u);
    }
    unint64_t v36 = [(BRCAccountSession *)self->_session availableDiskSpaceUsingCache:0];
    if (v60)
    {
      [v16 tryToDeleteItemInNamespace:2];
      [v16 tryToDeleteItemInNamespace:1];
      [v16 tryToDeleteItemInNamespace:0];
    }
    else
    {
      [v16 tryToUpdateItemInNamespace:0 withDstLookup:v12];
      [v16 tryToUpdateItemInNamespace:1 withDstLookup:v12];
      [v16 tryToUpdateItemInNamespace:2 withDstLookup:v12];
      [v12 tryToUpdateItemInNamespace:0 withDstLookup:0];
      [v12 tryToUpdateItemInNamespace:1 withDstLookup:0];
      [v12 tryToUpdateItemInNamespace:2 withDstLookup:0];
    }
    objc_msgSend(v16, "closePaths", v52);
    [v12 closePaths];
    unint64_t v37 = [(BRCAccountSession *)self->_session availableDiskSpaceUsingCache:0];
    unint64_t v38 = v36 - v37;
    if (v36 > v37)
    {
      long long v39 = brc_bread_crumbs();
      long long v40 = brc_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        +[BRCDumpContext stringFromByteCount:v38 showActualByteCount:0 suffix:0 context:0];
        objc_claimAutoreleasedReturnValue();
        -[BRCFSWriter _writeUnderCoordinationFromURL:toURL:canDelete:]();
      }

      id v41 = [(BRCAccountSession *)self->_session fsDownloader];
      [v41 rescheduleJobsForPendingDiskSpaceWithAvailableSpace:v37];
    }
    __brc_leave_section(v63);

    id v8 = v27;
    goto LABEL_42;
  }
  [0 closePaths];
  if (v12)
  {
    uint64_t v24 = brc_bread_crumbs();
    uint64_t v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSWriter _writeUnderCoordinationFromURL:toURL:canDelete:](v7, (uint64_t)v24, v25);
    }

    id v26 = v12;
    id v61 = 0;
    uint64_t v62 = 0;
    __int16 v12 = 0;
    long long v27 = 0;
    BOOL v28 = v7;
    __int16 v16 = v26;
    goto LABEL_32;
  }
  __int16 v16 = brc_bread_crumbs();
  __int16 v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[BRCFSWriter _writeUnderCoordinationFromURL:toURL:canDelete:](v7, (uint64_t)v16, v12);
  }
LABEL_42:
}

- (void)writeUnderCoordinationFromURL:(id)a3 toURL:(id)a4 canDelete:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (a5 || (uint64_t v10 = 4, v8) && v9) {
    uint64_t v10 = 20;
  }
  uint64_t v11 = [(BRCAccountSession *)self->_session clientDB];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__BRCFSWriter_writeUnderCoordinationFromURL_toURL_canDelete___block_invoke;
  v14[3] = &unk_1E699BB28;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  BOOL v17 = a5;
  id v12 = v9;
  id v13 = v8;
  [v11 performWithFlags:v10 action:v14];
}

uint64_t __61__BRCFSWriter_writeUnderCoordinationFromURL_toURL_canDelete___block_invoke(uint64_t a1)
{
  return 1;
}

- (BRCFSWriter)initWithAccountSession:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRCFSWriter;
  uint64_t v6 = [(BRCFSWriter *)&v21 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    id v8 = [(BRCAccountSession *)v7->_session clientDB];
    id v9 = v8;
    if (!v8
      || ([v8 serialQueue], uint64_t v10 = objc_claimAutoreleasedReturnValue(), v10, !v10))
    {
      uint64_t v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[BRCFSWriter initWithAccountSession:]();
      }
    }
    id v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    __int16 v14 = [(BRCAccountSession *)v7->_session clientTruthWorkloop];
    id v15 = dispatch_queue_attr_make_with_autorelease_frequency(v13, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create_with_target_V2("com.apple.brc.fs.writer", v15, v14);

    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v16;

    atomic_store(1u, (unsigned int *)&v7->_suspendCount);
    dispatch_suspend((dispatch_object_t)v7->_serialQueue);
    uint64_t v18 = brc_task_tracker_create("com.apple.brc.fs.writer");
    taskTracker = v7->_taskTracker;
    v7->_taskTracker = (brc_task_tracker *)v18;
  }
  return v7;
}

- (void)close
{
  if (atomic_load_explicit(&self->_suspendCount, memory_order_acquire)) {
    dispatch_resume((dispatch_object_t)self->_serialQueue);
  }
  taskTracker = self->_taskTracker;
  brc_task_tracker_wait((uint64_t)taskTracker);
}

- (void)suspend
{
  if (!atomic_fetch_add(&self->_suspendCount, 1u)) {
    dispatch_suspend((dispatch_object_t)self->_serialQueue);
  }
}

- (void)resume
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: suspendCount >= 0%@", v2, v3, v4, v5, v6);
}

- (void)cancel
{
  self->_isCancelled = 1;
  brc_task_tracker_cancel(self->_taskTracker);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (brc_task_tracker)taskTracker
{
  return self->_taskTracker;
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskTracker, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Successfully bounced item %@%@", (void)v3, DWORD2(v3));
}

void __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Failed to move from fault stage to live %@%@");
}

void __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Failed to transfer docID to staged item%@", v2, v3, v4, v5, v6);
}

void __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] Failed to move the existing fault to old version stage for bounce%@", v1, 0xCu);
}

void __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: item.st.stagedFileID != nil%@", v2, v3, v4, v5, v6);
}

void __70__BRCFSWriter_Bouncing__bouncePathMatch_toApplyServerItem_clientZone___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: newLogicalName && ![origLogicalName isEqualToString:newLogicalName]%@", v2, v3, v4, v5, v6);
}

void __67__BRCFSWriter_Bouncing__bouncePath_forItemConflictingWithAnFSRoot___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v1, v2, "[CRIT] UNREACHABLE: giving up bouncing %@%@", (void)v3, DWORD2(v3));
}

void __67__BRCFSWriter_Bouncing__bouncePath_forItemConflictingWithAnFSRoot___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Successfully bounced path %@%@", (void)v3, DWORD2(v3));
}

- (void)_stageCreationOfDirectory:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Unable to stage directory: %@%@");
}

- (void)_stageCreationOfSymlink:forLocalItem:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Unable to stage symlink: %@%@");
}

- (void)applyLocalEditIfNecessaryToURL:forItem:serverItem:forDelete:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Successfully restored readonly edit creating version with existing edit %@%@");
}

- (void)applyLocalEditIfNecessaryToURL:forItem:serverItem:forDelete:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Failed to restore readonly edit - %@%@");
}

- (void)_applyChangesForServerAlias:localAlias:jobID:zone:diffs:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Remove rank for alias with no real changes: %@%@");
}

- (void)_applyChangesForServerAlias:localAlias:jobID:zone:diffs:.cold.3()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_13_1(&dword_1D353B000, v0, v1, "[DEBUG] unable to rename alias %{errno}d%@");
}

- (void)_applyChangesForServerAlias:localAlias:jobID:zone:diffs:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Failed to make the bookmark live: %@%@");
}

- (void)_applyChangesForServerAlias:localAlias:jobID:zone:diffs:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] syncing down shared database because %@ points to an unknown container%@");
}

- (void)_applyChangesForServerAlias:localAlias:jobID:zone:diffs:.cold.6()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: parentItem%@", v2, v3, v4, v5, v6);
}

- (void)_applyChangesForServerAlias:localAlias:jobID:zone:diffs:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Item deleted successfully: %@%@");
}

- (void)_applyChangesForServerAlias:localAlias:jobID:zone:diffs:.cold.8()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_13_1(&dword_1D353B000, v0, v1, "[DEBUG] unable to delete alias %{errno}d%@");
}

- (void)_applyChangesForServerAlias:localAlias:jobID:zone:diffs:.cold.9()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] unable to rename because alias has local unprocessed rename%@", v2, v3, v4, v5, v6);
}

- (void)_computeDesiredVersionOptionsForDocument:createdReservedItem:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: dv%@", v2, v3, v4, v5, v6);
}

- (void)_scheduleActionCoordination:dstURL:action:li:si:diffs:hasFinished:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Retrying item since we can't resolve its live path: %@%@");
}

- (void)_scheduleActionCoordination:dstURL:action:li:si:diffs:hasFinished:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] ignoring dst url because it is the same as the item url%@", v2, v3, v4, v5, v6);
}

- (void)_handleClashingItemIfNecessary:parentID:si:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [bounce isEqualToString:clash.st.filename]%@", v2, v3, v4, v5, v6);
}

- (void)_handleClashingItemIfNecessary:parentID:si:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: bounceNumber%@", v2, v3, v4, v5, v6);
}

- (void)_handleClashingItemIfNecessary:parentID:si:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Found clashing reserved item, probably pending rename, bouncing it%@", v2, v3, v4, v5, v6);
}

- (void)applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !li.isDead%@", v2, v3, v4, v5, v6);
}

- (void)applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Retrying item since we can't resolve its destination path: %@%@");
}

- (void)applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Not requesting rename on %@ where we're only applying content diffs%@");
}

- (void)applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Clearing the listed docs bit on the documents folder because the documents folder is a dir-fault%@", v2, v3, v4, v5, v6);
}

- (void)applyChangesForServerItem:localItem:rank:zone:activity:hasFinished:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: li || si%@", v2, v3, v4, v5, v6);
}

- (void)_writeUnderCoordinationFromURL:(void *)a1 toURL:(uint64_t)a2 canDelete:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 path];
  uint64_t v5 = [v4 stringByAbbreviatingWithTildeInPath];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, a3, v6, "[DEBUG] Ignoring coordination: failed resolving %@%@", v7);
}

- (void)_writeUnderCoordinationFromURL:toURL:canDelete:.cold.2()
{
  OUTLINED_FUNCTION_12_2();
  uint64_t v1 = (void *)v0;
  OUTLINED_FUNCTION_7(v0, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v6, v4, "[DEBUG] we just freed %@ when applying changes: scheduling download throttles%@", v5);
}

- (void)_writeUnderCoordinationFromURL:(void *)a1 toURL:(uint64_t)a2 canDelete:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 path];
  uint64_t v5 = [v4 stringByAbbreviatingWithTildeInPath];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, a3, v6, "[DEBUG] Ignoring source part of coordination: failed resolving %@%@", v7);
}

- (void)_writeUnderCoordinationFromURL:toURL:canDelete:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] granting cross-zone coordination request: moving a shared document%@", v2, v3, v4, v5, v6);
}

- (void)_writeUnderCoordinationFromURL:(void *)a1 toURL:(uint64_t)a2 canDelete:(NSObject *)a3 .cold.5(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 path];
  uint64_t v5 = [v4 stringByAbbreviatingWithTildeInPath];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, a3, v6, "[DEBUG] Ignoring destination part of coordination: failed resolving %@%@", v7);
}

- (void)initWithAccountSession:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: db && db.serialQueue%@", v2, v3, v4, v5, v6);
}

@end