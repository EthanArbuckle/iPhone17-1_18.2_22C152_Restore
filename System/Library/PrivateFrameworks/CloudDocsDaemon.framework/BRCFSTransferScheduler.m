@interface BRCFSTransferScheduler
- (void)moveAppLibraryTransfers:(id)a3 toAppLibrary:(id)a4;
@end

@implementation BRCFSTransferScheduler

- (void)moveAppLibraryTransfers:(id)a3 toAppLibrary:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v26 = [(BRCAccountSession *)self->super._session clientDB];
  v25 = [(BRCFSSchedulerBase *)self tableName];
  v8 = [v7 dbRowID];
  v9 = [v7 transferSyncContext];
  v10 = [v9 contextIdentifier];
  v11 = [v6 dbRowID];
  v12 = [v6 transferSyncContext];
  v13 = [v12 contextIdentifier];
  [v26 execute:@"UPDATE %@ SET app_library_rowid = %@,transfer_queue = %@ WHERE app_library_rowid = %@ AND transfer_queue = %@", v25, v8, v10, v11, v13];

  v14 = self;
  uint64_t v15 = [v26 changes];
  v16 = [(BRCFSSchedulerBase *)self tableName];
  v17 = [v7 dbRowID];
  v18 = [v6 dbRowID];
  [v26 execute:@"UPDATE %@ SET app_library_rowid = %@ WHERE app_library_rowid = %@", v16, v17, v18];

  uint64_t v19 = [v26 changes] + v15;
  if (v19)
  {
    v20 = brc_bread_crumbs();
    v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = [(BRCFSSchedulerBase *)v14 name];
      v23 = [v6 appLibraryID];
      v24 = [v7 appLibraryID];
      *(_DWORD *)buf = 138413314;
      v28 = v22;
      __int16 v29 = 2048;
      uint64_t v30 = v19;
      __int16 v31 = 2112;
      v32 = v23;
      __int16 v33 = 2112;
      v34 = v24;
      __int16 v35 = 2112;
      v36 = v20;
      _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: moved %lld throttles from %@ to %@%@", buf, 0x34u);
    }
    [(BRCFSSchedulerBase *)v14 signal];
  }
}

@end