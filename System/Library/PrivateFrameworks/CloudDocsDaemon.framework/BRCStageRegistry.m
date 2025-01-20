@interface BRCStageRegistry
+ (BOOL)applySharingReadonlyACLsToFD:(int)a3 statInfo:(id)a4 version:(id)a5 clientZone:(id)a6 sharingOptions:(unint64_t)a7;
+ (unsigned)computeItemModeFromStatInfo:(id)a3 isPackage:(BOOL)a4;
+ (void)migrateStageToVersion2_0WithSession:(id)a3;
- (BOOL)_flockToMakeLiveAtPath:(id)a3 error:(id *)a4;
- (BOOL)_graveyardAt:(int)a3 path:(id)a4 forItemID:(id)a5;
- (BOOL)_hasActiveUploadWithStageID:(id)a3;
- (BOOL)_hasContentsInPath:(id)a3;
- (BOOL)copyPackageFileWithPackageFd:(int)a3 toStageFd:(int)a4 relpath:(id)a5;
- (BOOL)didFlushStagedFileID:(unint64_t)a3;
- (BOOL)existsInOldVersionStageOrGraveyard:(unint64_t)a3;
- (BOOL)existsInStage:(unint64_t)a3 generationID:(unsigned int *)a4;
- (BOOL)isCancelled;
- (BOOL)makeDirectoryInStageGatherFileID:(unint64_t *)a3 generationID:(unsigned int *)a4 error:(id *)a5;
- (BOOL)makeItemLive:(id)a3 fromStage:(unint64_t)a4 bySwappingWith:(id)a5 fileName:(id)a6 error:(id *)a7;
- (BOOL)makeSideFaultInStageGatherFileID:(unint64_t *)a3 generationID:(unsigned int *)a4 documentID:(unsigned int *)a5 properties:(id)a6 inAppLibrary:(id)a7 forCreation:(BOOL)a8 error:(id *)a9;
- (BOOL)makeSymlinkWithTarget:(id)a3 inStageGatherFileID:(unint64_t *)a4 generationID:(unsigned int *)a5 error:(id *)a6;
- (BOOL)moveFromStage:(unint64_t)a3 toPath:(id)a4 fileName:(id)a5 error:(id *)a6;
- (BOOL)moveFromStageToGraveyard:(unint64_t)a3 forItemID:(id)a4;
- (BOOL)moveOldVersionFromPath:(id)a3 error:(id *)a4;
- (BOOL)moveToGraveyardFromPath:(id)a3 forItemID:(id)a4 error:(id *)a5;
- (BOOL)pendingFetchRecordDirExistsInStageWithStartingChangeToken:(id)a3 recordZoneID:(id)a4;
- (BOOL)rememberStagedDownloadWithID:(id)a3 gatherFileID:(unint64_t *)a4 generationID:(unsigned int *)a5 documentID:(unsigned int *)a6 appLibrary:(id)a7 error:(id *)a8;
- (BOOL)saveXattrAtURL:(id)a3 forSignature:(id)a4 error:(id *)a5;
- (BOOL)saveXattrBlob:(id)a3 forSignature:(id)a4 error:(id *)a5;
- (BOOL)transferDocumentID:(unsigned int)a3 fromOldVersionStage:(unint64_t)a4 toStage:(unint64_t)a5;
- (BRCStageRegistry)initWithAccountSession:(id)a3;
- (id)_anchorNameForChangeToken:(id)a3 recordZoneID:(id)a4;
- (id)_anchorNameForRecordID:(id)a3;
- (id)_anchorNamePrefixForRecordZoneID:(id)a3;
- (id)_pathForDirIndex:(unsigned __int8)a3;
- (id)_pathInStage:(unint64_t)a3 index:(unsigned __int8 *)a4 generationID:(unsigned int *)a5;
- (id)createURLForDownloadWithStageID:(id)a3 name:(id)a4;
- (id)createURLForThumbnailUploadWithStageID:(id)a3;
- (id)createURLForUploadWithStageID:(id)a3 name:(id)a4;
- (id)loadXattrBlobForSignature:(id)a3 error:(id *)a4;
- (id)makeNonLocalVersionSideFaultWithAdditionName:(id)a3 clientZone:(id)a4 statInfo:(id)a5 version:(id)a6 sharingOptions:(unint64_t)a7 error:(id *)a8;
- (id)nonLocalFaultURLForAdditionName:(id)a3;
- (id)pendingDeltaFetchRecordDirWithStartingChangeToken:(id)a3 recordZoneID:(id)a4;
- (id)pendingListRecordDirWithStartingChangeToken:(id)a3;
- (id)urlForXattrSignature:(id)a3;
- (int)_openStageDirectory:(unsigned __int8)a3;
- (int)_performInStageDirectory:(unsigned __int8)a3 block:(id)a4;
- (int)deviceID;
- (int64_t)_garbageCollectDeltaSyncDatabases;
- (int64_t)_garbageCollectDownloads;
- (int64_t)_garbageCollectFaults;
- (int64_t)_garbageCollectOldVersions;
- (int64_t)_garbageCollectPackages;
- (int64_t)_garbageCollectQBSDatabases;
- (int64_t)_garbageCollectSpace:(int64_t)a3;
- (int64_t)_garbageCollectUploadThumbnailsIncludingActiveUploads:(BOOL)a3;
- (int64_t)_garbageCollectUploads;
- (int64_t)_garbageCollectUploadsIncludingActiveUploads:(BOOL)a3;
- (int64_t)_purgeSpaceUnderQueue:(int64_t)a3 withUrgency:(int)a4;
- (int64_t)_removeUnusedXattrBlobs;
- (int64_t)garbageCollectSpace:(int64_t)a3;
- (int64_t)purgableSpace;
- (int64_t)purgeGraveyardSpace:(int64_t)a3 withUrgency:(int)a4;
- (int64_t)purgeSpace:(int64_t)a3 withUrgency:(int)a4;
- (unint64_t)_processPendingListDatabaseObjects:(id)a3;
- (void)_fileIDMightHaveBeenUnlocked:(id)a3;
- (void)_updatePersistedStateWithLatestGCStartTime:(int64_t)a3;
- (void)_watchLockedRelpath:(id)a3;
- (void)applyMetadataOnFileDescriptor:(int)a3 liveFileDescriptor:(int)a4 itemID:(id)a5 clientZone:(id)a6 statInfo:(id)a7 version:(id)a8 sharingOptions:(unint64_t)a9;
- (void)associateDownloadStageID:(id)a3 withOperation:(id)a4;
- (void)associateSyncUpStageID:(id)a3 withOperation:(id)a4;
- (void)cancel;
- (void)cleanupStagedDownloadWithID:(id)a3 forItemID:(id)a4;
- (void)cleanupStagedSyncUpWithID:(id)a3;
- (void)cleanupStagedUploadWithID:(id)a3;
- (void)close;
- (void)disarmLockedTestTimer;
- (void)forgetWatchedLockedFileID:(id)a3;
- (void)forgetWatchedLockedFileIDsForAppLibrary:(id)a3;
- (void)lowDiskStatusChangedForDevice:(int)a3 hasEnoughSpace:(BOOL)a4;
- (void)open;
- (void)purgableSpace;
- (void)purgeAllUploads;
- (void)removeDatabaseObjectsForZone:(id)a3;
- (void)resume;
- (void)willFlushAllStagedFileIDs;
@end

@implementation BRCStageRegistry

- (BRCStageRegistry)initWithAccountSession:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BRCStageRegistry;
  v6 = [(BRCStageRegistry *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    unflushedStagedFileIDs = v7->_unflushedStagedFileIDs;
    v7->_unflushedStagedFileIDs = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    watchedLockedFileIDs = v7->_watchedLockedFileIDs;
    v7->_watchedLockedFileIDs = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeUploadStageIDs = v7->_activeUploadStageIDs;
    v7->_activeUploadStageIDs = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeDownloadStageIDs = v7->_activeDownloadStageIDs;
    v7->_activeDownloadStageIDs = v14;

    uint64_t v16 = brc_task_tracker_create("com.apple.brc.stage");
    tracker = v7->_tracker;
    v7->_tracker = (brc_task_tracker *)v16;

    v18 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(v18, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.brc.stage", v19);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v20;
  }
  return v7;
}

- (id)_pathForDirIndex:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if (_pathForDirIndex__once != -1) {
    dispatch_once(&_pathForDirIndex__once, &__block_literal_global_34);
  }
  session = self->_session;
  if (v3 == 3) {
    [(BRCAccountSession *)session cacheDirPath];
  }
  else {
  v6 = [(BRCAccountSession *)session sessionDirPath];
  }
  v7 = (void *)_pathForDirIndex__dirsMapping;
  v8 = [NSNumber numberWithUnsignedChar:v3];
  v9 = [v7 objectForKey:v8];
  v10 = [v6 stringByAppendingPathComponent:v9];

  return v10;
}

void __37__BRCStageRegistry__pathForDirIndex___block_invoke()
{
  v3[10] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F2B26FB8;
  v2[1] = &unk_1F2B26FD0;
  v3[0] = @"v";
  v3[1] = @"g";
  v2[2] = &unk_1F2B26FE8;
  v2[3] = &unk_1F2B27000;
  v3[2] = @"d";
  v3[3] = @"u";
  v2[4] = &unk_1F2B27018;
  v2[5] = &unk_1F2B27030;
  v3[4] = @"s";
  v3[5] = @"l";
  v2[6] = &unk_1F2B27048;
  v2[7] = &unk_1F2B27060;
  v3[6] = @"t";
  v3[7] = @"x";
  v2[8] = &unk_1F2B27078;
  v2[9] = &unk_1F2B27090;
  v3[8] = @"f";
  v3[9] = @"r";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:10];
  v1 = (void *)_pathForDirIndex__dirsMapping;
  _pathForDirIndex__dirsMapping = v0;
}

- (void)open
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _deviceID != 0%@", v2, v3, v4, v5, v6);
}

void __24__BRCStageRegistry_open__block_invoke()
{
  uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  uint64_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.brc.stage.backup-exclusion-queue", v0);

  uint64_t v2 = (void *)open_backupExclusionQueue;
  open_backupExclusionQueue = (uint64_t)v1;
}

uint64_t __24__BRCStageRegistry_open__block_invoke_2(uint64_t a1)
{
  dispatch_queue_t v1 = open_backupExclusionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__BRCStageRegistry_open__block_invoke_3;
  block[3] = &unk_1E6993698;
  id v4 = *(id *)(a1 + 32);
  dispatch_async(v1, block);

  return 0;
}

void __24__BRCStageRegistry_open__block_invoke_3(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) lastPathComponent];
  int v3 = [v2 isEqualToString:@"x"];

  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(a1 + 32)];
  uint64_t v5 = v4;
  uint64_t v6 = *MEMORY[0x1E4F1C630];
  if (v3)
  {
    id v16 = 0;
    char v7 = [v4 setResourceValue:MEMORY[0x1E4F1CC28] forKey:v6 error:&v16];
    id v8 = v16;

    if ((v7 & 1) == 0)
    {
      v9 = brc_bread_crumbs();
      v10 = brc_default_log();
      if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v18 = v11;
        __int16 v19 = 2112;
        id v20 = v8;
        __int16 v21 = 2112;
        v22 = v9;
        v12 = "[ERROR] Unable to include '%@' in backups: %@%@";
LABEL_10:
        _os_log_error_impl(&dword_1D353B000, v10, (os_log_type_t)0x90u, v12, buf, 0x20u);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    id v15 = 0;
    int v13 = [v4 setResourceValue:MEMORY[0x1E4F1CC38] forKey:v6 error:&v15];
    id v8 = v15;

    if ((v13 & 1) == 0)
    {
      v9 = brc_bread_crumbs();
      v10 = brc_default_log();
      if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v18 = v14;
        __int16 v19 = 2112;
        id v20 = v8;
        __int16 v21 = 2112;
        v22 = v9;
        v12 = "[ERROR] Unable to exclude '%@' from backups: %@%@";
        goto LABEL_10;
      }
LABEL_7:
    }
  }
}

- (int)_openStageDirectory:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  memset(&v93, 0, sizeof(v93));
  uint64_t v5 = &self->super.isa + a3;
  Class v7 = v5[2];
  uint64_t v6 = (id *)(v5 + 2);
  id v8 = v7;
  v9 = (const char *)[(objc_class *)v8 fileSystemRepresentation];
  int v15 = BRCOpenAt(0xFFFFFFFFLL, v9, 33028, v10, v11, v12, v13, v14, v90);
  if (v15 < 0)
  {
    if (*__error() == 2) {
      goto LABEL_103;
    }
    int v48 = *__error();
    v49 = brc_bread_crumbs();
    v50 = brc_default_log();
    if (os_log_type_enabled(v50, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v95 = v8;
      *(_WORD *)&v95[8] = 1024;
      *(_DWORD *)&v95[10] = v48;
      *(_WORD *)&v95[14] = 2112;
      *(void *)&v95[16] = v49;
      _os_log_error_impl(&dword_1D353B000, v50, (os_log_type_t)0x90u, "[ERROR] open('%@') failed %{errno}d%@", buf, 0x1Cu);
    }

    *__error() = v48;
  }
  else
  {
    int v16 = v15;
    if ((fstat(v15, &v93) & 0x80000000) == 0)
    {
      if ((v93.st_mode & 0xF000) == 0x4000)
      {
        if (v93.st_dev == self->_deviceID)
        {
LABEL_114:
          uint64_t v79 = v3;
          v80 = [(BRCStageRegistry *)self _pathForDirIndex:v3];

          objc_storeStrong(v6, v80);
          self->_stageDirectoryFileID[v79] = v93.st_ino;
          id v8 = (objc_class *)v80;
          goto LABEL_155;
        }
        v17 = brc_bread_crumbs();
        uint64_t v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = aPcDBLSW[(unint64_t)v93.st_mode >> 12];
          if ((v93.st_mode & 0x100) != 0) {
            int v20 = 114;
          }
          else {
            int v20 = 45;
          }
          if ((v93.st_mode & 0x80) != 0) {
            int v21 = 119;
          }
          else {
            int v21 = 45;
          }
          if ((v93.st_mode & 0x40) != 0) {
            int v22 = 120;
          }
          else {
            int v22 = 45;
          }
          if ((v93.st_mode & 0x20) != 0) {
            int v23 = 114;
          }
          else {
            int v23 = 45;
          }
          if ((v93.st_mode & 0x10) != 0) {
            int v24 = 119;
          }
          else {
            int v24 = 45;
          }
          if ((v93.st_mode & 8) != 0) {
            int v25 = 120;
          }
          else {
            int v25 = 45;
          }
          if ((v93.st_mode & 4) != 0) {
            int v26 = 114;
          }
          else {
            int v26 = 45;
          }
          if ((v93.st_mode & 2) != 0) {
            int v27 = 119;
          }
          else {
            int v27 = 45;
          }
          if (v93.st_mode) {
            int v28 = 120;
          }
          else {
            int v28 = 45;
          }
          *(_DWORD *)buf = 138417666;
          *(void *)v95 = v8;
          *(_WORD *)&v95[8] = 1024;
          *(_DWORD *)&v95[10] = v93.st_dev;
          *(_WORD *)&v95[14] = 2048;
          *(void *)&v95[16] = v93.st_ino;
          *(_WORD *)&v95[24] = 1024;
          *(_DWORD *)&v95[26] = v19;
          __int16 v96 = 1024;
          int v97 = v20;
          __int16 v98 = 1024;
          int v99 = v21;
          __int16 v100 = 1024;
          int v101 = v22;
          __int16 v102 = 1024;
          int v103 = v23;
          __int16 v104 = 1024;
          int v105 = v24;
          __int16 v106 = 1024;
          int v107 = v25;
          __int16 v108 = 1024;
          int v109 = v26;
          __int16 v110 = 1024;
          int v111 = v27;
          __int16 v112 = 1024;
          int v113 = v28;
          __int16 v114 = 1024;
          int st_nlink = v93.st_nlink;
          __int16 v116 = 1024;
          uid_t st_uid = v93.st_uid;
          __int16 v118 = 1024;
          gid_t st_gid = v93.st_gid;
          __int16 v120 = 2048;
          __darwin_time_t tv_sec = v93.st_atimespec.tv_sec;
          __int16 v122 = 2048;
          __darwin_time_t v123 = v93.st_mtimespec.tv_sec;
          __int16 v124 = 2048;
          __darwin_time_t v125 = v93.st_ctimespec.tv_sec;
          __int16 v126 = 2048;
          off_t st_size = v93.st_size;
          __int16 v128 = 1024;
          __uint32_t st_flags = v93.st_flags;
          __int16 v130 = 2112;
          *(void *)v131 = v17;
          _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] '%@' is not on the same volume as the root deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u atime:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x%@", buf, 0xA2u);
        }

        close(v16);
        v29 = v8;
        if (unlink((const char *)[(objc_class *)v29 fileSystemRepresentation]) < 0
          && *__error() != 2)
        {
          int v30 = *__error();
          v31 = brc_bread_crumbs();
          v32 = brc_default_log();
          if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
          {
            dev_t st_dev = v93.st_dev;
            int v34 = aPcDBLSW[(unint64_t)v93.st_mode >> 12];
            if ((v93.st_mode & 0x100) != 0) {
              int v35 = 114;
            }
            else {
              int v35 = 45;
            }
            int v36 = v93.st_nlink;
            if ((v93.st_mode & 0x80) != 0) {
              int v37 = 119;
            }
            else {
              int v37 = 45;
            }
            uid_t v38 = v93.st_uid;
            gid_t v39 = v93.st_gid;
            if ((v93.st_mode & 0x40) != 0) {
              int v40 = 120;
            }
            else {
              int v40 = 45;
            }
            if ((v93.st_mode & 0x20) != 0) {
              int v41 = 114;
            }
            else {
              int v41 = 45;
            }
            if ((v93.st_mode & 0x10) != 0) {
              int v42 = 119;
            }
            else {
              int v42 = 45;
            }
            if ((v93.st_mode & 8) != 0) {
              int v43 = 120;
            }
            else {
              int v43 = 45;
            }
            if ((v93.st_mode & 4) != 0) {
              int v44 = 114;
            }
            else {
              int v44 = 45;
            }
            if ((v93.st_mode & 2) != 0) {
              int v45 = 119;
            }
            else {
              int v45 = 45;
            }
            __uint32_t v46 = v93.st_flags;
            if (v93.st_mode) {
              int v47 = 120;
            }
            else {
              int v47 = 45;
            }
LABEL_151:
            *(_DWORD *)buf = 138417922;
            *(void *)v95 = v29;
            *(_WORD *)&v95[8] = 1024;
            *(_DWORD *)&v95[10] = st_dev;
            *(_WORD *)&v95[14] = 2048;
            *(void *)&v95[16] = v93.st_ino;
            *(_WORD *)&v95[24] = 1024;
            *(_DWORD *)&v95[26] = v34;
            __int16 v96 = 1024;
            int v97 = v35;
            __int16 v98 = 1024;
            int v99 = v37;
            __int16 v100 = 1024;
            int v101 = v40;
            __int16 v102 = 1024;
            int v103 = v41;
            __int16 v104 = 1024;
            int v105 = v42;
            __int16 v106 = 1024;
            int v107 = v43;
            __int16 v108 = 1024;
            int v109 = v44;
            __int16 v110 = 1024;
            int v111 = v45;
            __int16 v112 = 1024;
            int v113 = v47;
            __int16 v114 = 1024;
            int st_nlink = v36;
            __int16 v116 = 1024;
            uid_t st_uid = v38;
            __int16 v118 = 1024;
            gid_t st_gid = v39;
            __int16 v120 = 2048;
            __darwin_time_t tv_sec = v93.st_atimespec.tv_sec;
            __int16 v122 = 2048;
            __darwin_time_t v123 = v93.st_mtimespec.tv_sec;
            __int16 v124 = 2048;
            __darwin_time_t v125 = v93.st_ctimespec.tv_sec;
            __int16 v126 = 2048;
            off_t st_size = v93.st_size;
            __int16 v128 = 1024;
            __uint32_t st_flags = v46;
            __int16 v130 = 1024;
            *(_DWORD *)v131 = v30;
            *(_WORD *)&v131[4] = 2112;
            *(void *)&v131[6] = v31;
            v81 = "[ERROR] unlink('%@') failed deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u a"
                  "time:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x %{errno}d%@";
            v85 = v32;
            uint32_t v86 = 168;
            goto LABEL_152;
          }
          goto LABEL_153;
        }
      }
      else
      {
        v54 = brc_bread_crumbs();
        v55 = brc_default_log();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          int v56 = aPcDBLSW[(unint64_t)v93.st_mode >> 12];
          if ((v93.st_mode & 0x100) != 0) {
            int v57 = 114;
          }
          else {
            int v57 = 45;
          }
          if ((v93.st_mode & 0x80) != 0) {
            int v58 = 119;
          }
          else {
            int v58 = 45;
          }
          if ((v93.st_mode & 0x40) != 0) {
            int v59 = 120;
          }
          else {
            int v59 = 45;
          }
          if ((v93.st_mode & 0x20) != 0) {
            int v60 = 114;
          }
          else {
            int v60 = 45;
          }
          if ((v93.st_mode & 0x10) != 0) {
            int v61 = 119;
          }
          else {
            int v61 = 45;
          }
          if ((v93.st_mode & 8) != 0) {
            int v62 = 120;
          }
          else {
            int v62 = 45;
          }
          if ((v93.st_mode & 4) != 0) {
            int v63 = 114;
          }
          else {
            int v63 = 45;
          }
          if ((v93.st_mode & 2) != 0) {
            int v64 = 119;
          }
          else {
            int v64 = 45;
          }
          if (v93.st_mode) {
            int v65 = 120;
          }
          else {
            int v65 = 45;
          }
          *(_DWORD *)buf = 138417666;
          *(void *)v95 = v8;
          *(_WORD *)&v95[8] = 1024;
          *(_DWORD *)&v95[10] = v93.st_dev;
          *(_WORD *)&v95[14] = 2048;
          *(void *)&v95[16] = v93.st_ino;
          *(_WORD *)&v95[24] = 1024;
          *(_DWORD *)&v95[26] = v56;
          __int16 v96 = 1024;
          int v97 = v57;
          __int16 v98 = 1024;
          int v99 = v58;
          __int16 v100 = 1024;
          int v101 = v59;
          __int16 v102 = 1024;
          int v103 = v60;
          __int16 v104 = 1024;
          int v105 = v61;
          __int16 v106 = 1024;
          int v107 = v62;
          __int16 v108 = 1024;
          int v109 = v63;
          __int16 v110 = 1024;
          int v111 = v64;
          __int16 v112 = 1024;
          int v113 = v65;
          __int16 v114 = 1024;
          int st_nlink = v93.st_nlink;
          __int16 v116 = 1024;
          uid_t st_uid = v93.st_uid;
          __int16 v118 = 1024;
          gid_t st_gid = v93.st_gid;
          __int16 v120 = 2048;
          __darwin_time_t tv_sec = v93.st_atimespec.tv_sec;
          __int16 v122 = 2048;
          __darwin_time_t v123 = v93.st_mtimespec.tv_sec;
          __int16 v124 = 2048;
          __darwin_time_t v125 = v93.st_ctimespec.tv_sec;
          __int16 v126 = 2048;
          off_t st_size = v93.st_size;
          __int16 v128 = 1024;
          __uint32_t st_flags = v93.st_flags;
          __int16 v130 = 2112;
          *(void *)v131 = v54;
          _os_log_impl(&dword_1D353B000, v55, OS_LOG_TYPE_DEFAULT, "[WARNING] '%@' is not a directory deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u atime:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x%@", buf, 0xA2u);
        }

        close(v16);
        v29 = v8;
        if (unlink((const char *)[(objc_class *)v29 fileSystemRepresentation]) < 0
          && *__error() != 2)
        {
          int v30 = *__error();
          v31 = brc_bread_crumbs();
          v32 = brc_default_log();
          if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
          {
            dev_t st_dev = v93.st_dev;
            int v34 = aPcDBLSW[(unint64_t)v93.st_mode >> 12];
            if ((v93.st_mode & 0x100) != 0) {
              int v35 = 114;
            }
            else {
              int v35 = 45;
            }
            int v36 = v93.st_nlink;
            if ((v93.st_mode & 0x80) != 0) {
              int v37 = 119;
            }
            else {
              int v37 = 45;
            }
            uid_t v38 = v93.st_uid;
            gid_t v39 = v93.st_gid;
            if ((v93.st_mode & 0x40) != 0) {
              int v40 = 120;
            }
            else {
              int v40 = 45;
            }
            if ((v93.st_mode & 0x20) != 0) {
              int v41 = 114;
            }
            else {
              int v41 = 45;
            }
            if ((v93.st_mode & 0x10) != 0) {
              int v42 = 119;
            }
            else {
              int v42 = 45;
            }
            if ((v93.st_mode & 8) != 0) {
              int v43 = 120;
            }
            else {
              int v43 = 45;
            }
            if ((v93.st_mode & 4) != 0) {
              int v44 = 114;
            }
            else {
              int v44 = 45;
            }
            if ((v93.st_mode & 2) != 0) {
              int v45 = 119;
            }
            else {
              int v45 = 45;
            }
            __uint32_t v46 = v93.st_flags;
            if (v93.st_mode) {
              int v47 = 120;
            }
            else {
              int v47 = 45;
            }
            goto LABEL_151;
          }
LABEL_153:

          *__error() = v30;
LABEL_154:
          int v16 = -1;
          id v8 = v29;
          goto LABEL_155;
        }
      }
LABEL_103:
      v29 = v8;
      if (mkdir((const char *)[(objc_class *)v29 fileSystemRepresentation], 0x1EDu) < 0
        && *__error() != 17)
      {
        if (*__error() != 2)
        {
          int v30 = *__error();
          v31 = brc_bread_crumbs();
          v32 = brc_default_log();
          if (!os_log_type_enabled(v32, (os_log_type_t)0x90u)) {
            goto LABEL_153;
          }
          *(_DWORD *)buf = 138412802;
          *(void *)v95 = v29;
          *(_WORD *)&v95[8] = 1024;
          *(_DWORD *)&v95[10] = v30;
          *(_WORD *)&v95[14] = 2112;
          *(void *)&v95[16] = v31;
          v81 = "[ERROR] mkdir('%@') failed %{errno}d%@";
          goto LABEL_122;
        }
        v66 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v92 = 0;
        char v67 = [v66 createDirectoryAtPath:v29 withIntermediateDirectories:1 attributes:0 error:&v92];
        id v68 = v92;

        if ((v67 & 1) == 0)
        {
          v88 = brc_bread_crumbs();
          v89 = brc_default_log();
          if (os_log_type_enabled(v89, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)v95 = v29;
            *(_WORD *)&v95[8] = 2112;
            *(void *)&v95[10] = v68;
            *(_WORD *)&v95[18] = 2112;
            *(void *)&v95[20] = v88;
            _os_log_error_impl(&dword_1D353B000, v89, (os_log_type_t)0x90u, "[ERROR] mkdir('%@') withIntermediateDirectories failed: %@%@", buf, 0x20u);
          }

          goto LABEL_154;
        }
      }
      v29 = v29;
      v69 = (const char *)[(objc_class *)v29 fileSystemRepresentation];
      int v75 = BRCOpenAt(0xFFFFFFFFLL, v69, 33028, v70, v71, v72, v73, v74, v91);
      if ((v75 & 0x80000000) == 0)
      {
        int v16 = v75;
        if (fstat(v75, &v93) < 0)
        {
          int v82 = *__error();
          v83 = brc_bread_crumbs();
          v84 = brc_default_log();
          if (os_log_type_enabled(v84, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)v95 = v29;
            *(_WORD *)&v95[8] = 1024;
            *(_DWORD *)&v95[10] = v82;
            *(_WORD *)&v95[14] = 2112;
            *(void *)&v95[16] = v83;
            _os_log_error_impl(&dword_1D353B000, v84, (os_log_type_t)0x90u, "[ERROR] fstat('%@') failed %{errno}d%@", buf, 0x1Cu);
          }

          *__error() = v82;
          close(v16);
          goto LABEL_154;
        }
        if (fcntl(v16, 64, 3))
        {
          int v76 = *__error();
          v77 = brc_bread_crumbs();
          v78 = brc_default_log();
          if (os_log_type_enabled(v78, (os_log_type_t)0x90u)) {
            [(BRCStageRegistry *)(uint64_t)v77 _openStageDirectory:v78];
          }

          *__error() = v76;
        }
        goto LABEL_114;
      }
      int v30 = *__error();
      v31 = brc_bread_crumbs();
      v32 = brc_default_log();
      if (!os_log_type_enabled(v32, (os_log_type_t)0x90u)) {
        goto LABEL_153;
      }
      *(_DWORD *)buf = 138412802;
      *(void *)v95 = v29;
      *(_WORD *)&v95[8] = 1024;
      *(_DWORD *)&v95[10] = v30;
      *(_WORD *)&v95[14] = 2112;
      *(void *)&v95[16] = v31;
      v81 = "[ERROR] open('%@') failed %{errno}d%@";
LABEL_122:
      v85 = v32;
      uint32_t v86 = 28;
LABEL_152:
      _os_log_error_impl(&dword_1D353B000, v85, (os_log_type_t)0x90u, v81, buf, v86);
      goto LABEL_153;
    }
    int v51 = *__error();
    v52 = brc_bread_crumbs();
    v53 = brc_default_log();
    if (os_log_type_enabled(v53, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v95 = v16;
      *(_WORD *)&v95[4] = 2112;
      *(void *)&v95[6] = v8;
      *(_WORD *)&v95[14] = 1024;
      *(_DWORD *)&v95[16] = v51;
      *(_WORD *)&v95[20] = 2112;
      *(void *)&v95[22] = v52;
      _os_log_error_impl(&dword_1D353B000, v53, (os_log_type_t)0x90u, "[ERROR] fstat(%d) '%@' failed %{errno}d%@", buf, 0x22u);
    }

    *__error() = v51;
    close(v16);
  }
  int v16 = -1;
LABEL_155:

  return v16;
}

- (int)_performInStageDirectory:(unsigned __int8)a3 block:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v6 = (uint64_t (**)(id, void))a4;
  uint64_t v7 = [(BRCStageRegistry *)self _openStageDirectory:v4];
  if ((v7 & 0x80000000) != 0)
  {
    int v9 = -1;
  }
  else
  {
    int v8 = v7;
    int v9 = v6[2](v6, v7);
    int v10 = *__error();
    close(v8);
    *__error() = v10;
  }

  return v9;
}

- (BOOL)copyPackageFileWithPackageFd:(int)a3 toStageFd:(int)a4 relpath:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__BRCStageRegistry_copyPackageFileWithPackageFd_toStageFd_relpath___block_invoke;
  v12[3] = &unk_1E6998358;
  id v13 = v8;
  int v14 = a3;
  int v15 = a4;
  id v9 = v8;
  int v10 = [(BRCStageRegistry *)self _performInStageDirectory:3 block:v12];

  return v10 >= 0;
}

uint64_t __67__BRCStageRegistry_copyPackageFileWithPackageFd_toStageFd_relpath___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v5 = [v4 UUIDString];

  uint64_t v6 = *(unsigned int *)(a1 + 40);
  uint64_t v7 = (const char *)[*(id *)(a1 + 32) fileSystemRepresentation];
  int v13 = BRCOpenAt(v6, v7, 33028, v8, v9, v10, v11, v12, v42);
  if (v13 < 0)
  {
    int v28 = *__error();
    v31 = brc_bread_crumbs();
    v32 = brc_default_log();
    if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
    {
      int v38 = *(_DWORD *)(a1 + 40);
      uint64_t v39 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 67109890;
      int v44 = v38;
      __int16 v45 = 2112;
      *(void *)__uint32_t v46 = v39;
      *(_WORD *)&v46[8] = 1024;
      *(_DWORD *)int v47 = v28;
      *(_WORD *)&v47[4] = 2112;
      *(void *)&v47[6] = v31;
      _os_log_error_impl(&dword_1D353B000, v32, (os_log_type_t)0x90u, "[ERROR] BRCOpenAt(%d, %@, O_RDONLY) failed %{errno}d%@", buf, 0x22u);
    }

    goto LABEL_17;
  }
  int v14 = v13;
  id v15 = v5;
  int v16 = (const char *)[v15 fileSystemRepresentation];
  int v22 = BRCOpenAt(a2, v16, 2822, v17, v18, v19, v20, v21, 0x1B0u);
  if (v22 < 0)
  {
    int v33 = *__error();
    int v34 = brc_bread_crumbs();
    int v35 = brc_default_log();
    if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 67109890;
      int v44 = a2;
      __int16 v45 = 2112;
      *(void *)__uint32_t v46 = v15;
      *(_WORD *)&v46[8] = 1024;
      *(_DWORD *)int v47 = v33;
      *(_WORD *)&v47[4] = 2112;
      *(void *)&v47[6] = v34;
      _os_log_error_impl(&dword_1D353B000, v35, (os_log_type_t)0x90u, "[ERROR] BRCOpenAt(%d, %@, O_CREAT|O_RDWR|O_EXCL) %{errno}d%@", buf, 0x22u);
    }

    *__error() = v33;
    int v28 = *__error();
    close(v14);
    goto LABEL_18;
  }
  int v23 = v22;
  int v24 = fcopyfile(v14, v22, 0, 8u);
  int v25 = *__error();
  close(v14);
  *__error() = v25;
  int v26 = *__error();
  close(v23);
  *__error() = v26;
  if (v24 < 0)
  {
    int v28 = *__error();
    v31 = brc_bread_crumbs();
    int v36 = brc_default_log();
    if (os_log_type_enabled(v36, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 67109890;
      int v44 = v14;
      __int16 v45 = 1024;
      *(_DWORD *)__uint32_t v46 = v23;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = v28;
      *(_WORD *)int v47 = 2112;
      *(void *)&v47[2] = v31;
      _os_log_error_impl(&dword_1D353B000, v36, (os_log_type_t)0x90u, "[ERROR] fcopyfile(%d, %d, NULL, COPYFILE_DATA) %{errno}d%@", buf, 0x1Eu);
    }

LABEL_17:
LABEL_18:
    *__error() = v28;
    uint64_t v27 = 0xFFFFFFFFLL;
    goto LABEL_19;
  }
  uint64_t v27 = 0;
  if ((BRCRenameAt(a2, v15, *(_DWORD *)(a1 + 44), *(void **)(a1 + 32), 0) & 0x80000000) != 0)
  {
    int v28 = *__error();
    v29 = brc_bread_crumbs();
    int v30 = brc_default_log();
    if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
    {
      int v40 = *(_DWORD *)(a1 + 44);
      uint64_t v41 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 67110402;
      int v44 = a2;
      __int16 v45 = 2112;
      *(void *)__uint32_t v46 = v15;
      *(_WORD *)&v46[8] = 1024;
      *(_DWORD *)int v47 = v40;
      *(_WORD *)&v47[4] = 2112;
      *(void *)&v47[6] = v41;
      __int16 v48 = 1024;
      int v49 = v28;
      __int16 v50 = 2112;
      int v51 = v29;
      _os_log_error_impl(&dword_1D353B000, v30, (os_log_type_t)0x90u, "[ERROR] BRCRenameAt(%d, %@, %d, %@, 0) %{errno}d%@", buf, 0x32u);
    }

    goto LABEL_18;
  }
LABEL_19:

  return v27;
}

- (id)_pathInStage:(unint64_t)a3 index:(unsigned __int8 *)a4 generationID:(unsigned int *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  uint64_t v9 = BRCOpenByID(self->_deviceID, a3, 2129924);
  if ((v9 & 0x80000000) != 0)
  {
    id v15 = brc_bread_crumbs();
    int v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[BRCStageRegistry _pathInStage:index:generationID:]((uint64_t)v15, a3, v16);
    }

    id v12 = 0;
    goto LABEL_14;
  }
  int v10 = v9;
  id v21 = 0;
  int v11 = _fstatItem(v9, &v22, a5, 0, 0, &v21);
  id v12 = v21;
  close(v10);
  if (v11 < 0)
  {
LABEL_14:
    uint64_t v19 = 0;
    goto LABEL_15;
  }
  if (v22 != a3)
  {
    uint64_t v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v24 = v22;
      __int16 v25 = 2048;
      unint64_t v26 = a3;
      __int16 v27 = 2112;
      int v28 = v17;
      _os_log_fault_impl(&dword_1D353B000, v18, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: returnedFileID(%llu) != fileID(%llu)%@", buf, 0x20u);
    }

    goto LABEL_14;
  }
  uint64_t v13 = 0;
  stageDirectoryPath = self->_stageDirectoryPath;
  while (![v12 hasPrefix:stageDirectoryPath[v13]])
  {
    if (++v13 == 10) {
      goto LABEL_14;
    }
  }
  *a4 = v13;
  id v12 = v12;
  uint64_t v19 = v12;
LABEL_15:

  return v19;
}

- (void)associateSyncUpStageID:(id)a3 withOperation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->_activeUploadStageIDs;
  objc_sync_enter(v8);
  if ([(NSMutableSet *)self->_activeUploadStageIDs containsObject:v6])
  {
    objc_sync_exit(v8);
  }
  else
  {
    [(NSMutableSet *)self->_activeUploadStageIDs addObject:v6];
    objc_sync_exit(v8);

    uint64_t v9 = [v7 completionBlock];
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__BRCStageRegistry_associateSyncUpStageID_withOperation___block_invoke;
    v10[3] = &unk_1E6998380;
    objc_copyWeak(&v13, &location);
    uint64_t v8 = v9;
    id v12 = v8;
    id v11 = v6;
    [v7 setCompletionBlock:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __57__BRCStageRegistry_associateSyncUpStageID_withOperation___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1D9438760]();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained[22];
    objc_sync_enter(v5);
    [v4[22] removeObject:*(void *)(a1 + 32)];
    objc_sync_exit(v5);

    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
    [v4 cleanupStagedSyncUpWithID:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }
}

- (id)_anchorNamePrefixForRecordZoneID:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F594E8];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithRecordZoneID:v4];

  uint64_t v6 = [v5 mangledIDString];
  uint64_t v7 = [v6 stringByAppendingString:@":"];

  return v7;
}

- (id)_anchorNameForChangeToken:(id)a3 recordZoneID:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(BRCStageRegistry *)self _anchorNamePrefixForRecordZoneID:a4];
  uint64_t v8 = [v6 hash];

  uint64_t v9 = objc_msgSend(v7, "stringByAppendingFormat:", @"%llx", v8);

  return v9;
}

- (id)_anchorNameForRecordID:(id)a3
{
  id v3 = a3;
  id v4 = [v3 recordName];
  id v5 = [v3 zoneID];
  uint64_t v6 = [v5 zoneName];
  uint64_t v7 = [v4 stringByAppendingPathComponent:v6];

  uint64_t v8 = [v3 zoneID];
  uint64_t v9 = [v8 ownerName];
  LOBYTE(v6) = [v9 isEqualToString:*MEMORY[0x1E4F19C08]];

  if ((v6 & 1) == 0)
  {
    int v10 = [v3 zoneID];
    id v11 = [v10 ownerName];
    uint64_t v12 = [v7 stringByAppendingFormat:@":%@", v11];

    uint64_t v7 = (void *)v12;
  }
  id v13 = [v7 stringByReplacingOccurrencesOfString:@"/" withString:@":"];

  return v13;
}

- (id)pendingListRecordDirWithStartingChangeToken:(id)a3
{
  id v4 = [(BRCStageRegistry *)self _anchorNameForRecordID:a3];
  id v5 = [(NSString *)self->_stageDirectoryPath[7] stringByAppendingPathComponent:v4];
  uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:1];

  return v6;
}

- (id)pendingDeltaFetchRecordDirWithStartingChangeToken:(id)a3 recordZoneID:(id)a4
{
  id v5 = [(BRCStageRegistry *)self _anchorNameForChangeToken:a3 recordZoneID:a4];
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_stageDirectoryPath[6] stringByAppendingPathComponent:v5];
    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:1];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)createURLForUploadWithStageID:(id)a3 name:(id)a4
{
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__BRCStageRegistry_createURLForUploadWithStageID_name___block_invoke;
  v12[3] = &unk_1E6994A60;
  id v13 = v6;
  id v7 = v6;
  id v8 = a4;
  [(BRCStageRegistry *)self _performInStageDirectory:5 block:v12];
  uint64_t v9 = [(NSString *)self->_stageDirectoryPath[5] stringByAppendingFormat:@"/%@/%@", v7, v8];

  int v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:0];

  return v10;
}

uint64_t __55__BRCStageRegistry_createURLForUploadWithStageID_name___block_invoke(uint64_t a1, int a2)
{
  return 0;
}

- (id)createURLForThumbnailUploadWithStageID:(id)a3
{
  id v3 = [NSString stringWithFormat:@"%@/%@", self->_stageDirectoryPath[8], a3];
  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:0];

  return v4;
}

- (BOOL)pendingFetchRecordDirExistsInStageWithStartingChangeToken:(id)a3 recordZoneID:(id)a4
{
  id v5 = [(BRCStageRegistry *)self _anchorNameForChangeToken:a3 recordZoneID:a4];
  id v6 = [(NSString *)self->_stageDirectoryPath[6] stringByAppendingPathComponent:v5];
  if (!self->_stageDirectoryPath[6])
  {
    int v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCStageRegistry pendingFetchRecordDirExistsInStageWithStartingChangeToken:recordZoneID:]();
    }
  }
  id v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
  char v8 = [v7 checkResourceIsReachableAndReturnError:0];

  return v8;
}

- (void)cleanupStagedSyncUpWithID:(id)a3
{
  id v5 = [(NSString *)self->_stageDirectoryPath[5] stringByAppendingPathComponent:a3];
  id v4 = [(BRCAccountSession *)self->_session diskReclaimer];
  [v4 renameAndUnlinkInBackgroundItemAt:0xFFFFFFFFLL path:v5];
}

- (void)cleanupStagedUploadWithID:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v4 = [(NSString *)self->_stageDirectoryPath[5] stringByAppendingPathComponent:a3];
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  v9[0] = v4;
  v9[1] = @"ckpackage";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v7 = [v5 fileURLWithPathComponents:v6];

  [MEMORY[0x1E4F1A250] destroyAnchorAndPackageAnchoredAtURL:v7];
  char v8 = [(BRCAccountSession *)self->_session diskReclaimer];
  [v8 renameAndUnlinkInBackgroundItemAt:0xFFFFFFFFLL path:v4];
}

- (id)createURLForDownloadWithStageID:(id)a3 name:(id)a4
{
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__BRCStageRegistry_createURLForDownloadWithStageID_name___block_invoke;
  v12[3] = &unk_1E6994A60;
  id v13 = v6;
  id v7 = v6;
  id v8 = a4;
  [(BRCStageRegistry *)self _performInStageDirectory:4 block:v12];
  uint64_t v9 = [(NSString *)self->_stageDirectoryPath[4] stringByAppendingFormat:@"/%@/%@", v7, v8];

  int v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:0];

  return v10;
}

uint64_t __57__BRCStageRegistry_createURLForDownloadWithStageID_name___block_invoke(uint64_t a1, int a2)
{
  return 0;
}

- (BOOL)rememberStagedDownloadWithID:(id)a3 gatherFileID:(unint64_t *)a4 generationID:(unsigned int *)a5 documentID:(unsigned int *)a6 appLibrary:(id)a7 error:(id *)a8
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  __int16 v25 = __103__BRCStageRegistry_rememberStagedDownloadWithID_gatherFileID_generationID_documentID_appLibrary_error___block_invoke;
  unint64_t v26 = &unk_1E69983A8;
  id v14 = v13;
  id v27 = v14;
  int v28 = a4;
  uint64_t v29 = a5;
  int v30 = a6;
  int v15 = [(BRCStageRegistry *)self _performInStageDirectory:4 block:&v23];
  if (v15 < 0)
  {
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno", v23, v24, v25, v26);
    if (v18)
    {
      uint64_t v19 = brc_bread_crumbs();
      uint64_t v20 = brc_default_log();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      {
        uint64_t v22 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v32 = "-[BRCStageRegistry rememberStagedDownloadWithID:gatherFileID:generationID:documentID:appLibrary:error:]";
        __int16 v33 = 2080;
        if (!a8) {
          uint64_t v22 = "(ignored by caller)";
        }
        int v34 = v22;
        __int16 v35 = 2112;
        int v36 = v18;
        __int16 v37 = 2112;
        int v38 = v19;
        _os_log_error_impl(&dword_1D353B000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a8) {
      *a8 = v18;
    }

    id v17 = v27;
  }
  else
  {

    unflushedStagedFileIDs = self->_unflushedStagedFileIDs;
    objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *a4, v23, v24, v25, v26);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    [(NSMutableSet *)unflushedStagedFileIDs addObject:v17];
  }

  return v15 >= 0;
}

uint64_t __103__BRCStageRegistry_rememberStagedDownloadWithID_gatherFileID_generationID_documentID_appLibrary_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) stringByAppendingPathComponent:@"item"];
  id v5 = (const char *)[v4 fileSystemRepresentation];
  uint64_t v11 = BRCOpenAt(a2, v5, 33028, v6, v7, v8, v9, v10, v19[0]);
  if ((v11 & 0x80000000) != 0)
  {
    int v15 = *__error();
    int v16 = brc_bread_crumbs();
    id v17 = brc_default_log();
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
    {
      v19[0] = 67109890;
      v19[1] = a2;
      __int16 v20 = 2112;
      id v21 = v4;
      __int16 v22 = 1024;
      int v23 = v15;
      __int16 v24 = 2112;
      __int16 v25 = v16;
      _os_log_error_impl(&dword_1D353B000, v17, (os_log_type_t)0x90u, "[ERROR] openat(%d, '%@') failed %{errno}d%@", (uint8_t *)v19, 0x22u);
    }

    *__error() = v15;
    uint64_t v13 = 0xFFFFFFFFLL;
  }
  else
  {
    int v12 = v11;
    uint64_t v13 = _fstatItem(v11, *(void **)(a1 + 40), *(_DWORD **)(a1 + 48), *(_DWORD **)(a1 + 56), 0, 0);
    int v14 = *__error();
    close(v12);
    *__error() = v14;
  }

  return v13;
}

- (void)cleanupStagedDownloadWithID:(id)a3 forItemID:(id)a4
{
  id v8 = a4;
  uint64_t v6 = [(NSString *)self->_stageDirectoryPath[4] stringByAppendingPathComponent:a3];
  if (!v8
    || ![(BRCStageRegistry *)self _graveyardAt:0xFFFFFFFFLL path:v6 forItemID:v8])
  {
    uint64_t v7 = [(BRCAccountSession *)self->_session diskReclaimer];
    [v7 renameAndUnlinkInBackgroundItemAt:0xFFFFFFFFLL path:v6];
  }
}

- (BOOL)_graveyardAt:(int)a3 path:(id)a4 forItemID:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  BOOL lowDiskSpace = self->_lowDiskSpace;
  memset(&v25, 0, sizeof(v25));
  if (!v9
    || lowDiskSpace
    || (id v11 = v8,
        !fstatat(v6, (const char *)[v11 fileSystemRepresentation], &v25, 32))
    && (off_t st_size = v25.st_size, (v25.st_size & 0xF000) == 0x8000)
    && (+[BRCUserDefaults defaultsForMangledID:0],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v13 minFileSizeForGraveyard],
        v13,
        st_size <= v14))
  {
    id v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109634;
      int v27 = v6;
      __int16 v28 = 2112;
      id v29 = v8;
      __int16 v30 = 2112;
      v31 = v17;
      _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] deleting (%d, '%@') asynchronously%@", buf, 0x1Cu);
    }

    int v16 = [(BRCAccountSession *)self->_session diskReclaimer];
    char v15 = [v16 renameAndUnlinkInBackgroundItemAt:v6 path:v8];
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __48__BRCStageRegistry__graveyardAt_path_forItemID___block_invoke;
    v20[3] = &unk_1E69983D0;
    id v21 = v9;
    __int16 v22 = self;
    int v24 = v6;
    id v23 = v11;
    char v15 = [(BRCStageRegistry *)self _performInStageDirectory:3 block:v20] == 0;

    int v16 = v21;
  }

  return v15;
}

uint64_t __48__BRCStageRegistry__graveyardAt_path_forItemID___block_invoke(uint64_t a1, uint64_t a2)
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) itemIDString];
  id v5 = [*(id *)(*(void *)(a1 + 40) + 8) diskReclaimer];
  [v5 renameAndUnlinkInBackgroundItemAt:a2 path:v4];

  if ((BRCRenameAt(*(_DWORD *)(a1 + 56), *(void **)(a1 + 48), a2, v4, 0) & 0x80000000) != 0)
  {
    brc_bread_crumbs();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v17 = *(_DWORD *)(a1 + 56);
      uint64_t v18 = *(void *)(a1 + 48);
      int v19 = *__error();
      int v20 = 67110402;
      *(_DWORD *)id v21 = v17;
      *(_WORD *)&v21[4] = 2112;
      *(void *)&v21[6] = v18;
      __int16 v22 = 1024;
      *(_DWORD *)id v23 = a2;
      *(_WORD *)&v23[4] = 2112;
      *(void *)&v23[6] = v4;
      *(_WORD *)&v23[14] = 1024;
      *(_DWORD *)&v23[16] = v19;
      LOWORD(v24[0]) = 2112;
      *(void *)((char *)v24 + 2) = v6;
      _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] renameat(%d, '%@', %d, '%@') failed %{errno}d%@", (uint8_t *)&v20, 0x32u);
    }
    uint64_t v12 = 0xFFFFFFFFLL;
  }
  else
  {
    id v6 = [*(id *)(*(void *)(a1 + 40) + 40) stringByAppendingPathComponent:v4];
    if (chflags((const char *)[v6 fileSystemRepresentation], 0) < 0)
    {
      int v7 = *__error();
      id v8 = brc_bread_crumbs();
      id v9 = brc_default_log();
      if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      {
        int v20 = 138412802;
        *(void *)id v21 = v6;
        *(_WORD *)&v21[8] = 1024;
        *(_DWORD *)&v21[10] = v7;
        __int16 v22 = 2112;
        *(void *)id v23 = v8;
        _os_log_error_impl(&dword_1D353B000, v9, (os_log_type_t)0x90u, "[ERROR] failed removing documentID for %@ %{errno}d%@", (uint8_t *)&v20, 0x1Cu);
      }

      *__error() = v7;
    }
    uint64_t v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = *(_DWORD *)(a1 + 56);
      uint64_t v15 = *(void *)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 32);
      int v20 = 67110146;
      *(_DWORD *)id v21 = v14;
      *(_WORD *)&v21[4] = 2112;
      *(void *)&v21[6] = v15;
      __int16 v22 = 2112;
      *(void *)id v23 = v6;
      *(_WORD *)&v23[8] = 2112;
      *(void *)&v23[10] = v16;
      *(_WORD *)&v23[18] = 2112;
      v24[0] = v10;
      _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] moved (%d, '%@') to the graveyard at '%@' for %@%@", (uint8_t *)&v20, 0x30u);
    }

    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)moveFromStageToGraveyard:(unint64_t)a3 forItemID:(id)a4
{
  id v6 = a4;
  unsigned __int8 v11 = 0;
  int v7 = [(BRCStageRegistry *)self _pathInStage:a3 index:&v11 generationID:0];
  BOOL v9 = v7
    && (v11 <= 4u ? (BOOL v8 = ((1 << v11) & 0x15) == 0) : (BOOL v8 = 1), !v8)
    && [(BRCStageRegistry *)self _graveyardAt:0xFFFFFFFFLL path:v7 forItemID:v6];

  return v9;
}

- (BOOL)existsInStage:(unint64_t)a3 generationID:(unsigned int *)a4
{
  char v10 = 0;
  if (!a3)
  {
    int v7 = brc_bread_crumbs();
    BOOL v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCStageRegistry existsInStage:generationID:]();
    }

    if (a4)
    {
      BOOL v6 = 0;
      *a4 = 0;
      return v6;
    }
    return 0;
  }
  id v5 = [(BRCStageRegistry *)self _pathInStage:a3 index:&v10 generationID:a4];
  if (!v5) {
    return 0;
  }
  BOOL v6 = (v10 & 0xFB) == 0;

  return v6;
}

- (int64_t)_purgeSpaceUnderQueue:(int64_t)a3 withUrgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  int64_t v7 = -[BRCStageRegistry garbageCollectSpace:](self, "garbageCollectSpace:");
  if (v7 < a3 && (int)v4 <= 4)
  {
    do
    {
      BOOL v8 = (void *)MEMORY[0x1D9438760]();
      v7 += [(BRCStageRegistry *)self purgeGraveyardSpace:a3 - v7 withUrgency:v4];
      if (v4 == -2) {
        break;
      }
      if (v7 >= a3) {
        break;
      }
      BOOL v9 = (int)v4 <= 3;
      uint64_t v4 = (v4 + 1);
    }
    while (v9);
  }
  return v7;
}

- (int64_t)purgeSpace:(int64_t)a3 withUrgency:(int)a4
{
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__BRCStageRegistry_purgeSpace_withUrgency___block_invoke;
  v7[3] = &unk_1E69983F8;
  v7[4] = self;
  v7[5] = &v9;
  v7[6] = a3;
  int v8 = a4;
  dispatch_sync(queue, v7);
  int64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __43__BRCStageRegistry_purgeSpace_withUrgency___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _purgeSpaceUnderQueue:*(void *)(a1 + 48) withUrgency:*(unsigned int *)(a1 + 56)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)lowDiskStatusChangedForDevice:(int)a3 hasEnoughSpace:(BOOL)a4
{
  if (a4)
  {
    self->_BOOL lowDiskSpace = 0;
  }
  else if (!self->_lowDiskSpace)
  {
    self->_BOOL lowDiskSpace = 1;
    queue = self->_queue;
    tracker = self->_tracker;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__BRCStageRegistry_lowDiskStatusChangedForDevice_hasEnoughSpace___block_invoke;
    v6[3] = &unk_1E6993698;
    v6[4] = self;
    brc_task_tracker_async_with_logs(tracker, queue, v6, 0);
  }
}

uint64_t __65__BRCStageRegistry_lowDiskStatusChangedForDevice_hasEnoughSpace___block_invoke(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __65__BRCStageRegistry_lowDiskStatusChangedForDevice_hasEnoughSpace___block_invoke_cold_1();
  }

  return [*(id *)(a1 + 32) _purgeSpaceUnderQueue:0x7FFFFFFFFFFFFFFFLL withUrgency:3];
}

- (int64_t)purgableSpace
{
  v23[2] = *(char **)MEMORY[0x1E4F143B8];
  uint64_t v2 = self->_stageDirectoryPath[3];
  v23[0] = (char *)[(NSString *)v2 fileSystemRepresentation];
  v23[1] = 0;
  id v3 = fts_open(v23, 16, 0);
  off_t value = 0;
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = fts_read(v3);
    if (v5)
    {
      BOOL v6 = v5;
      int64_t v7 = 0;
      do
      {
        switch(v6->fts_info)
        {
          case 1u:
            if (v6->fts_level == 1)
            {
              if (getxattr(v6->fts_path, "com.apple.bird.graveyard.size#N", &value, 8uLL, 0, 0) == 8)
              {
                v7 += value;
                fts_set(v4, v6, 4);
              }
              else
              {
                off_t value = 0;
              }
            }
            break;
          case 6u:
            if (v6->fts_level != 1) {
              break;
            }
            setxattr(v6->fts_path, "com.apple.bird.graveyard.size#N", &value, 8uLL, 0, 0);
            off_t st_size = value;
LABEL_11:
            v7 += st_size;
            break;
          case 7u:
          case 0xAu:
            int v11 = *__error();
            uint64_t v12 = brc_bread_crumbs();
            uint64_t v13 = brc_default_log();
            if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
            {
              fts_path = v6->fts_path;
              *(_DWORD *)buf = 136315650;
              uint64_t v18 = fts_path;
              __int16 v19 = 1024;
              int v20 = v11;
              __int16 v21 = 2112;
              __int16 v22 = v12;
              _os_log_error_impl(&dword_1D353B000, v13, (os_log_type_t)0x90u, "[ERROR] fts_read() failed for path %s %{errno}d%@", buf, 0x1Cu);
            }

            *__error() = v11;
            goto LABEL_23;
          case 8u:
            off_t st_size = v6->fts_statp->st_size;
            if (v6->fts_level == 1) {
              goto LABEL_11;
            }
            value += st_size;
            break;
          default:
            break;
        }
        BOOL v6 = fts_read(v4);
      }
      while (v6);
    }
    else
    {
      int64_t v7 = 0;
    }
LABEL_23:
    fts_close(v4);
  }
  else
  {
    uint64_t v9 = brc_bread_crumbs();
    char v10 = brc_default_log();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u)) {
      [(BRCStageRegistry *)(uint64_t)v2 purgableSpace];
    }

    int64_t v7 = 0;
  }

  return v7;
}

- (int64_t)purgeGraveyardSpace:(int64_t)a3 withUrgency:(int)a4
{
  BOOL v6 = self->_stageDirectoryPath[3];
  uint64_t v22 = 0;
  v23[0] = &v22;
  v23[1] = 0x2020000000;
  v23[2] = 0;
  time_t v7 = time(0);
  uint64_t v8 = 0;
  switch(a4)
  {
    case -2:
    case 1:
      uint64_t v9 = +[BRCUserDefaults defaultsForMangledID:0];
      [v9 graveyardAgeDeltaInLowUrgency];
      goto LABEL_5;
    case 2:
      uint64_t v9 = +[BRCUserDefaults defaultsForMangledID:0];
      [v9 graveyardAgeDeltaInMedUrgency];
LABEL_5:
      uint64_t v8 = (uint64_t)v10;

      break;
    case 3:
    case 4:
      uint64_t v8 = 0x8000000000000000;
      break;
    default:
      break;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__BRCStageRegistry_purgeGraveyardSpace_withUrgency___block_invoke;
  v16[3] = &unk_1E6998420;
  int v11 = v6;
  int v17 = v11;
  uint64_t v18 = &v22;
  int64_t v19 = a3;
  time_t v20 = v7;
  uint64_t v21 = v8;
  BRCRemoveFolderInAutoreleasepool(v11, v16, 1, 0);
  uint64_t v12 = brc_bread_crumbs();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[BRCStageRegistry purgeGraveyardSpace:withUrgency:]((uint64_t)v23);
  }

  int64_t v14 = *(void *)(v23[0] + 24);
  _Block_object_dispose(&v22, 8);

  return v14;
}

uint64_t __52__BRCStageRegistry_purgeGraveyardSpace_withUrgency___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  int64_t v5 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", a2);
  BOOL v6 = objc_msgSend(v5, "br_pathRelativeToPath:", a1[4]);
  time_t v7 = [v6 pathComponents];
  if ([v5 isEqualToString:a1[4]])
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = [v7 count];
    uint64_t v10 = *(void *)(a1[5] + 8);
    uint64_t v11 = *(void *)(v10 + 24);
    if (v9 != 1) {
      goto LABEL_7;
    }
    if (v11 >= a1[6])
    {
      uint64_t v8 = 2;
      goto LABEL_9;
    }
    if (a1[7] - *(void *)(a3 + 48) < a1[8])
    {
      uint64_t v8 = 1;
    }
    else
    {
LABEL_7:
      uint64_t v8 = 0;
      *(void *)(v10 + 24) = v11 + *(void *)(a3 + 96);
    }
  }
LABEL_9:

  return v8;
}

- (int64_t)_garbageCollectPackages
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  char v6 = 0;
  uint64_t v2 = [MEMORY[0x1E4F1A250] clientPackageDatabaseDirectory];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__BRCStageRegistry__garbageCollectPackages__block_invoke;
  v4[3] = &unk_1E6998448;
  v4[4] = v5;
  [MEMORY[0x1E4F1A250] gcPackagesInDirectory:v2 dbInUseBlock:v4];

  _Block_object_dispose(v5, 8);
  return 0;
}

uint64_t __43__BRCStageRegistry__garbageCollectPackages__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = v5;
  int v7 = 0;
  uint64_t v8 = *(void *)v15;
  uint64_t v9 = *MEMORY[0x1E4F1A650];
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) objectForKeyedSubscript:v9];
      if (v11) {
        v7 |= [MEMORY[0x1E4F1A250] anchorExistsForArchiverInfo:v11];
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v6);
  if (v7)
  {
    uint64_t v12 = 1;
  }
  else
  {
LABEL_12:
    uint64_t v12 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }

  return v12;
}

- (int64_t)_garbageCollectUploads
{
  return [(BRCStageRegistry *)self _garbageCollectUploadsIncludingActiveUploads:0];
}

- (void)purgeAllUploads
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Purging all uploads and live items%@", v2, v3, v4, v5, v6);
}

- (BOOL)_hasActiveUploadWithStageID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_activeUploadStageIDs;
  objc_sync_enter(v5);
  char v6 = [(NSMutableSet *)self->_activeUploadStageIDs containsObject:v4];
  objc_sync_exit(v5);

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v13 = 0;
    long long v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    uint64_t v8 = [(BRCAccountSession *)self->_session clientDB];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__BRCStageRegistry__hasActiveUploadWithStageID___block_invoke;
    v10[3] = &unk_1E6996E08;
    id v11 = v4;
    uint64_t v12 = &v13;
    [v8 performWithFlags:1 action:v10];

    BOOL v7 = *((unsigned char *)v14 + 24) != 0;
    _Block_object_dispose(&v13, 8);
  }

  return v7;
}

uint64_t __48__BRCStageRegistry__hasActiveUploadWithStageID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 numberWithSQL:@"SELECT 1 FROM client_uploads WHERE transfer_stage = %@", *(void *)(a1 + 32)];
  if ([v3 BOOLValue]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }

  return 1;
}

- (int64_t)_garbageCollectUploadsIncludingActiveUploads:(BOOL)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v5 = self->_stageDirectoryPath[5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__BRCStageRegistry__garbageCollectUploadsIncludingActiveUploads___block_invoke;
  void v9[3] = &unk_1E6998470;
  char v6 = v5;
  BOOL v13 = a3;
  uint64_t v10 = v6;
  id v11 = self;
  uint64_t v12 = &v14;
  BRCRemoveFolderInAutoreleasepool(v6, v9, 1, 0);
  int64_t v7 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __65__BRCStageRegistry__garbageCollectUploadsIncludingActiveUploads___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", a2);
  char v6 = objc_msgSend(v5, "br_pathRelativeToPath:", *(void *)(a1 + 32));
  int64_t v7 = [v6 pathComponents];
  uint64_t v8 = [v7 count];

  if (v8 == 1)
  {
    uint64_t v9 = [v6 lastPathComponent];
    if (!*(unsigned char *)(a1 + 56) && ([*(id *)(a1 + 40) _hasActiveUploadWithStageID:v9] & 1) != 0)
    {

LABEL_8:
      uint64_t v14 = 1;
      goto LABEL_12;
    }
  }
  uint64_t v10 = [v6 lastPathComponent];
  int v11 = [v10 isEqualToString:@"ckpackage"];

  if (v11)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1A250];
    BOOL v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:0];
    [v12 destroyAnchorAndPackageAnchoredAtURL:v13];

    goto LABEL_8;
  }
  uint64_t v15 = brc_bread_crumbs();
  uint64_t v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    __65__BRCStageRegistry__garbageCollectUploadsIncludingActiveUploads___block_invoke_cold_1((uint64_t)v5);
  }

  uint64_t v14 = 0;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += *(void *)(a3 + 96);
LABEL_12:

  return v14;
}

- (int64_t)_garbageCollectFaults
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v3 = self->_stageDirectoryPath[0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__BRCStageRegistry__garbageCollectFaults__block_invoke;
  v7[3] = &unk_1E69984C0;
  id v4 = v3;
  uint64_t v8 = v4;
  uint64_t v9 = self;
  uint64_t v10 = &v11;
  BRCRemoveFolderInAutoreleasepool(v4, v7, 1, 0);
  int64_t v5 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t __41__BRCStageRegistry__garbageCollectFaults__block_invoke(uint64_t a1, const char *a2, uint64_t a3)
{
  if (!strcmp((const char *)[*(id *)(a1 + 32) fileSystemRepresentation], a2)) {
    return 0;
  }
  if (!a3) {
    return 1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  int64_t v5 = [*(id *)(*(void *)(a1 + 40) + 8) clientDB];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__BRCStageRegistry__garbageCollectFaults__block_invoke_2;
  v10[3] = &unk_1E6998498;
  void v10[4] = &v11;
  v10[5] = a3;
  [v5 performWithFlags:1 action:v10];

  uint64_t v6 = *((unsigned int *)v12 + 6);
  if (!v6)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += *(void *)(a3 + 96);
    int64_t v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __41__BRCStageRegistry__garbageCollectFaults__block_invoke_cold_1(a3);
    }

    uint64_t v6 = *((unsigned int *)v12 + 6);
  }
  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __41__BRCStageRegistry__garbageCollectFaults__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "numberWithSQL:", @"SELECT 1 FROM client_items WHERE item_staged_file_id = %lld", *(void *)(*(void *)(a1 + 40) + 8));

  if (v3) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return 0;
}

- (int64_t)_garbageCollectDownloads
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v3 = self->_stageDirectoryPath[4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__BRCStageRegistry__garbageCollectDownloads__block_invoke;
  v7[3] = &unk_1E69984C0;
  id v4 = v3;
  uint64_t v8 = v4;
  uint64_t v9 = self;
  uint64_t v10 = &v11;
  BRCRemoveFolderInAutoreleasepool(v4, v7, 1, 0);
  int64_t v5 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t __44__BRCStageRegistry__garbageCollectDownloads__block_invoke(void *a1, uint64_t a2, int *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int64_t v5 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", a2);
  uint64_t v6 = objc_msgSend(v5, "br_pathRelativeToPath:", a1[4]);
  int64_t v7 = [v6 pathComponents];
  uint64_t v8 = [v7 count];

  if (v8 == 1)
  {
    uint64_t v23 = 0;
    int v24 = &v23;
    uint64_t v25 = 0x2020000000;
    int v26 = 0;
    id v9 = v6;
    id v10 = *(id *)(a1[5] + 184);
    objc_sync_enter(v10);
    char v11 = [*(id *)(a1[5] + 184) containsObject:v9];
    objc_sync_exit(v10);

    if (v11)
    {
      uint64_t v12 = 1;
    }
    else
    {
      uint64_t v13 = [*(id *)(a1[5] + 8) clientDB];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __44__BRCStageRegistry__garbageCollectDownloads__block_invoke_2;
      v20[3] = &unk_1E6996E08;
      id v14 = v9;
      id v21 = v14;
      uint64_t v22 = &v23;
      [v13 performWithFlags:1 action:v20];

      uint64_t v12 = *((unsigned int *)v24 + 6);
      if (!v12)
      {
        uint64_t v15 = brc_bread_crumbs();
        uint64_t v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          int v18 = *a3;
          uint64_t v19 = *((void *)a3 + 1);
          *(_DWORD *)buf = 138413058;
          id v28 = v14;
          __int16 v29 = 1024;
          int v30 = v18;
          __int16 v31 = 2048;
          uint64_t v32 = v19;
          __int16 v33 = 2112;
          int v34 = v15;
          _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] removing staged file for download: %@ device:%d ino:%lld%@", buf, 0x26u);
        }

        uint64_t v12 = *((unsigned int *)v24 + 6);
      }
    }
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    uint64_t v12 = 0;
    *(void *)(*(void *)(a1[6] + 8) + 24) += *((void *)a3 + 12);
  }

  return v12;
}

uint64_t __44__BRCStageRegistry__garbageCollectDownloads__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 numberWithSQL:@"SELECT 1 FROM client_downloads WHERE transfer_stage = %@", *(void *)(a1 + 32)];
  if ([v3 BOOLValue]) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }

  return 1;
}

- (int64_t)_garbageCollectDeltaSyncDatabases
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v3 = objc_opt_new();
  id v4 = [(BRCAccountSession *)self->_session serverDB];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__BRCStageRegistry__garbageCollectDeltaSyncDatabases__block_invoke;
  v8[3] = &unk_1E6998018;
  v8[4] = self;
  id v5 = v3;
  id v9 = v5;
  id v10 = &v11;
  [v4 performWithFlags:1 action:v8];

  int64_t v6 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __53__BRCStageRegistry__garbageCollectDeltaSyncDatabases__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__BRCStageRegistry__garbageCollectDeltaSyncDatabases__block_invoke_2;
  v13[3] = &unk_1E6998308;
  v13[4] = v2;
  id v14 = *(id *)(a1 + 40);
  [v3 enumerateServerZones:v13];
  id v4 = *(id *)(*(void *)(a1 + 32) + 64);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__BRCStageRegistry__garbageCollectDeltaSyncDatabases__block_invoke_3;
  void v9[3] = &unk_1E69984C0;
  id v10 = v4;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v11 = v5;
  uint64_t v12 = v6;
  id v7 = v4;
  BRCRemoveFolderInAutoreleasepool(v7, v9, 1, 0);

  return 1;
}

uint64_t __53__BRCStageRegistry__garbageCollectDeltaSyncDatabases__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 changeState];
  uint64_t v6 = [v5 changeToken];
  id v7 = [v4 zoneID];

  uint64_t v8 = [v3 _anchorNameForChangeToken:v6 recordZoneID:v7];

  [*(id *)(a1 + 40) addObject:v8];
  return 1;
}

uint64_t __53__BRCStageRegistry__garbageCollectDeltaSyncDatabases__block_invoke_3(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 1;
  }
  id v5 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", a2);
  uint64_t v6 = objc_msgSend(v5, "br_pathRelativeToPath:", a1[4]);
  id v7 = [v6 pathComponents];
  if ([v7 count] == 1
    && (uint64_t v8 = (void *)a1[5],
        [v7 objectAtIndexedSubscript:0],
        id v9 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v8) = [v8 containsObject:v9],
        v9,
        (v8 & 1) != 0))
  {
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
    *(void *)(*(void *)(a1[6] + 8) + 24) += *(void *)(a3 + 96);
  }

  return v10;
}

- (int64_t)_garbageCollectQBSDatabases
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v3 = self->_session;
  id v4 = [(BRCAccountSession *)v3 serverDB];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__BRCStageRegistry__garbageCollectQBSDatabases__block_invoke;
  v8[3] = &unk_1E6998510;
  uint64_t v10 = &v11;
  v8[4] = self;
  id v5 = v3;
  id v9 = v5;
  [v4 performWithFlags:1 action:v8];

  int64_t v6 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __47__BRCStageRegistry__garbageCollectQBSDatabases__block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__BRCStageRegistry__garbageCollectQBSDatabases__block_invoke_2;
  v4[3] = &unk_1E69984E8;
  uint64_t v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v2 _processPendingListDatabaseObjects:v4];

  return 1;
}

BOOL __47__BRCStageRegistry__garbageCollectQBSDatabases__block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = [*(id *)(a1 + 32) serverZoneByName:v8 ownerName:a4];
  uint64_t v10 = [v9 zoneID];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    uint64_t v12 = [v9 zoneID];
    uint64_t v10 = (void *)[v11 initWithRecordName:v7 zoneID:v12];

    uint64_t v13 = objc_msgSend(v10, "brc_itemIDWithSession:", *(void *)(a1 + 32));
    uint64_t v14 = (void *)v13;
    if (v9 && v10 && v13)
    {
      uint64_t v15 = [v9 clientZone];
      uint64_t v16 = [*(id *)(a1 + 32) serverDB];
      int v17 = [v15 serverItemTypeByItemID:v14 db:v16];

      BOOL v18 = (v17 - 9) < 2;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  uint64_t v19 = brc_bread_crumbs();
  time_t v20 = brc_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    int v22 = 138412802;
    id v23 = v7;
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    int v27 = v19;
    _os_log_fault_impl(&dword_1D353B000, v20, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to parse record name %@ or zone %@%@", (uint8_t *)&v22, 0x20u);
  }

  BOOL v18 = 0;
LABEL_10:

  return v18;
}

- (int64_t)_garbageCollectOldVersions
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v3 = self->_session;
  id v4 = self->_stageDirectoryPath[2];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__BRCStageRegistry__garbageCollectOldVersions__block_invoke;
  void v9[3] = &unk_1E69984C0;
  id v5 = v4;
  uint64_t v10 = v5;
  int64_t v6 = v3;
  id v11 = v6;
  uint64_t v12 = &v13;
  BRCRemoveFolderInAutoreleasepool(v5, v9, 1, 0);
  int64_t v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __46__BRCStageRegistry__garbageCollectOldVersions__block_invoke(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 1;
  }
  id v5 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", a2);
  int64_t v6 = objc_msgSend(v5, "br_pathRelativeToPath:", *(void *)(a1 + 32));
  int64_t v7 = [v6 pathComponents];
  if ([v7 count] == 1)
  {
    uint64_t v39 = 0;
    int v40 = &v39;
    uint64_t v41 = 0x2020000000;
    int v42 = 0;
    id v8 = [*(id *)(a1 + 40) clientTruthWorkloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__BRCStageRegistry__garbageCollectOldVersions__block_invoke_2;
    block[3] = &unk_1E6995850;
    id v9 = *(id *)(a1 + 40);
    __int16 v37 = &v39;
    int v38 = a3;
    id v36 = v9;
    dispatch_async_and_wait(v8, block);

    uint64_t v10 = *((unsigned int *)v40 + 6);
    if (!v10)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += *((void *)a3 + 12);
      id v11 = brc_bread_crumbs();
      uint64_t v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v14 = *a3;
        uint64_t v15 = *((void *)a3 + 1);
        unint64_t v16 = *((unsigned __int16 *)a3 + 2);
        int v17 = aPcDBLSW[v16 >> 12];
        if ((v16 & 0x100) != 0) {
          int v18 = 114;
        }
        else {
          int v18 = 45;
        }
        int v19 = *((unsigned __int16 *)a3 + 3);
        if ((v16 & 0x80) != 0) {
          int v20 = 119;
        }
        else {
          int v20 = 45;
        }
        int v21 = a3[4];
        int v22 = a3[5];
        if ((v16 & 0x40) != 0) {
          int v23 = 120;
        }
        else {
          int v23 = 45;
        }
        uint64_t v24 = *((void *)a3 + 4);
        if ((v16 & 0x20) != 0) {
          int v25 = 114;
        }
        else {
          int v25 = 45;
        }
        uint64_t v26 = *((void *)a3 + 6);
        if ((v16 & 0x10) != 0) {
          int v27 = 119;
        }
        else {
          int v27 = 45;
        }
        uint64_t v28 = *((void *)a3 + 8);
        if ((v16 & 8) != 0) {
          int v29 = 120;
        }
        else {
          int v29 = 45;
        }
        if ((v16 & 4) != 0) {
          int v30 = 114;
        }
        else {
          int v30 = 45;
        }
        uint64_t v31 = *((void *)a3 + 12);
        if ((v16 & 2) != 0) {
          int v32 = 119;
        }
        else {
          int v32 = 45;
        }
        int v33 = a3[29];
        *(_DWORD *)buf = 67114242;
        if (v16) {
          int v34 = 120;
        }
        else {
          int v34 = 45;
        }
        int v44 = v14;
        __int16 v45 = 2048;
        uint64_t v46 = v15;
        __int16 v47 = 1024;
        int v48 = v17;
        __int16 v49 = 1024;
        int v50 = v18;
        __int16 v51 = 1024;
        int v52 = v20;
        __int16 v53 = 1024;
        int v54 = v23;
        __int16 v55 = 1024;
        int v56 = v25;
        __int16 v57 = 1024;
        int v58 = v27;
        __int16 v59 = 1024;
        int v60 = v29;
        __int16 v61 = 1024;
        int v62 = v30;
        __int16 v63 = 1024;
        int v64 = v32;
        __int16 v65 = 1024;
        int v66 = v34;
        __int16 v67 = 1024;
        int v68 = v19;
        __int16 v69 = 1024;
        int v70 = v21;
        __int16 v71 = 1024;
        int v72 = v22;
        __int16 v73 = 2048;
        uint64_t v74 = v24;
        __int16 v75 = 2048;
        uint64_t v76 = v26;
        __int16 v77 = 2048;
        uint64_t v78 = v28;
        __int16 v79 = 2048;
        uint64_t v80 = v31;
        __int16 v81 = 1024;
        int v82 = v33;
        __int16 v83 = 2112;
        v84 = v11;
        _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] removing deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u atime:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x%@", buf, 0x98u);
      }

      uint64_t v10 = *((unsigned int *)v40 + 6);
    }

    _Block_object_dispose(&v39, 8);
  }
  else
  {
    uint64_t v10 = 0;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += *((void *)a3 + 12);
  }

  return v10;
}

uint64_t __46__BRCStageRegistry__garbageCollectOldVersions__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__BRCStageRegistry__garbageCollectOldVersions__block_invoke_3;
  v3[3] = &unk_1E6998538;
  long long v4 = *(_OWORD *)(a1 + 40);
  return [v1 enumeratePrivateServerZones:v3];
}

BOOL __46__BRCStageRegistry__garbageCollectOldVersions__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 clientZone];
  long long v4 = [v3 itemByFileID:*(void *)(*(void *)(a1 + 40) + 8)];

  if (v4) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return v4 == 0;
}

- (unint64_t)_processPendingListDatabaseObjects:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  id v5 = self->_stageDirectoryPath[7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__BRCStageRegistry__processPendingListDatabaseObjects___block_invoke;
  v10[3] = &unk_1E6998560;
  int64_t v6 = v5;
  id v11 = v6;
  uint64_t v13 = &v14;
  id v7 = v4;
  id v12 = v7;
  BRCRemoveFolderInAutoreleasepool(v6, v10, 1, 0);
  unint64_t v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __55__BRCStageRegistry__processPendingListDatabaseObjects___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v5 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", a2);
    int64_t v6 = objc_msgSend(v5, "br_pathRelativeToPath:", a1[4]);
    id v7 = [v6 pathComponents];
    if ([v7 count] != 1)
    {
      uint64_t v10 = 0;
      *(void *)(*(void *)(a1[6] + 8) + 24) += *(void *)(a3 + 96);
LABEL_16:

      return v10;
    }
    unint64_t v8 = [v6 componentsSeparatedByString:@":"];
    if ([v8 count] == 3)
    {
      int v19 = v5;
      id v9 = (id)*MEMORY[0x1E4F19C08];
    }
    else
    {
      if ([v8 count] != 4)
      {
        uint64_t v16 = brc_bread_crumbs();
        uint64_t v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          __55__BRCStageRegistry__processPendingListDatabaseObjects___block_invoke_cold_1((uint64_t)v6);
        }

        uint64_t v10 = 0;
        *(void *)(*(void *)(a1[6] + 8) + 24) += *(void *)(a3 + 96);
        goto LABEL_15;
      }
      int v19 = v5;
      id v9 = [v8 lastObject];
    }
    id v11 = v9;
    id v12 = [v8 objectAtIndexedSubscript:2];
    uint64_t v13 = [v8 objectAtIndexedSubscript:0];
    uint64_t v14 = [v8 objectAtIndexedSubscript:1];
    uint64_t v15 = [v13 stringByAppendingPathComponent:v14];

    uint64_t v10 = (*(uint64_t (**)(void))(a1[5] + 16))();
    if (!v10) {
      *(void *)(*(void *)(a1[6] + 8) + 24) += *(void *)(a3 + 96);
    }

    id v5 = v19;
LABEL_15:

    goto LABEL_16;
  }
  return 1;
}

- (void)removeDatabaseObjectsForZone:(id)a3
{
  id v4 = a3;
  id v5 = [v4 zoneID];
  int64_t v6 = [(BRCStageRegistry *)self _anchorNamePrefixForRecordZoneID:v5];

  id v7 = self->_stageDirectoryPath[6];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__BRCStageRegistry_removeDatabaseObjectsForZone___block_invoke;
  v13[3] = &unk_1E6998588;
  uint64_t v14 = v7;
  id v15 = v6;
  id v8 = v6;
  id v9 = v7;
  BRCRemoveFolderInAutoreleasepool(v9, v13, 1, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__BRCStageRegistry_removeDatabaseObjectsForZone___block_invoke_2;
  v11[3] = &unk_1E69984E8;
  id v12 = v4;
  id v10 = v4;
  [(BRCStageRegistry *)self _processPendingListDatabaseObjects:v11];
}

uint64_t __49__BRCStageRegistry_removeDatabaseObjectsForZone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 1;
  }
  id v4 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", a2);
  id v5 = objc_msgSend(v4, "br_pathRelativeToPath:", *(void *)(a1 + 32));
  int64_t v6 = [v5 pathComponents];
  id v7 = [v6 firstObject];
  if ([v7 hasPrefix:*(void *)(a1 + 40)])
  {

    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = [v5 length] != 0;
  }
  return v8;
}

uint64_t __49__BRCStageRegistry_removeDatabaseObjectsForZone___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = [v7 zoneName];
  LOBYTE(v7) = [v9 isEqualToString:v8];

  if (v7)
  {
    id v10 = [*(id *)(a1 + 32) ownerName];
    id v11 = v10;
    if (!v10) {
      id v10 = (void *)*MEMORY[0x1E4F19C08];
    }
    int v12 = [v10 isEqualToString:v6];

    uint64_t v13 = v12 ^ 1u;
  }
  else
  {

    uint64_t v13 = 1;
  }

  return v13;
}

- (BOOL)_hasContentsInPath:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v4 enumeratorAtURL:v3 includingPropertiesForKeys:0 options:5 errorHandler:&__block_literal_global_141];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(v3, "br_isParentOfURL:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

uint64_t __39__BRCStageRegistry__hasContentsInPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
  {
    int v9 = 138412802;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_error_impl(&dword_1D353B000, v7, (os_log_type_t)0x90u, "[ERROR] Failed checking contents at %@ - %@%@", (uint8_t *)&v9, 0x20u);
  }

  return 1;
}

- (int64_t)_removeUnusedXattrBlobs
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  time_t v3 = time(0);
  id v4 = +[BRCUserDefaults defaultsForMangledID:0];
  [v4 xattrAgeDelta];
  double v6 = v5;

  uint64_t v7 = self->_session;
  if ([(BRCStageRegistry *)self _hasContentsInPath:self->_stageDirectoryPath[6]])
  {
    brc_bread_crumbs();
    id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    int v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v25 = v8;
      id v10 = "[WARNING] Skipping xattr check because we're in the middle of fetching delta change records%@";
LABEL_7:
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
    }
  }
  else
  {
    if (![(BRCStageRegistry *)self _hasContentsInPath:self->_stageDirectoryPath[7]])
    {
      id v12 = self->_stageDirectoryPath[9];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __43__BRCStageRegistry__removeUnusedXattrBlobs__block_invoke;
      v14[3] = &unk_1E69985B0;
      id v8 = v12;
      uint64_t v15 = v8;
      time_t v18 = v3;
      uint64_t v19 = (uint64_t)v6;
      uint64_t v16 = v7;
      uint64_t v17 = &v20;
      BRCRemoveFolderInAutoreleasepool(v8, v14, 1, 0);
      int64_t v11 = v21[3];

      int v9 = v15;
      goto LABEL_10;
    }
    brc_bread_crumbs();
    id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    int v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v25 = v8;
      id v10 = "[WARNING] Skipping xattr check because we're in the middle of fetching item records%@";
      goto LABEL_7;
    }
  }
  int64_t v11 = 0;
LABEL_10:

  _Block_object_dispose(&v20, 8);
  return v11;
}

uint64_t __43__BRCStageRegistry__removeUnusedXattrBlobs__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 1;
  }
  double v5 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", a2);
  double v6 = objc_msgSend(v5, "br_pathRelativeToPath:", *(void *)(a1 + 32));
  uint64_t v7 = [v6 pathComponents];
  if ([v6 length])
  {
    if (*(void *)(a1 + 56) - *(void *)(a3 + 48) >= *(void *)(a1 + 64))
    {
      if ([v7 count] != 1)
      {
        uint64_t v16 = brc_bread_crumbs();
        uint64_t v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          __43__BRCStageRegistry__removeUnusedXattrBlobs__block_invoke_cold_1();
        }
      }
      int v9 = [v7 firstObject];
      id v10 = objc_msgSend(v9, "brc_dataFromHexidecimalString");
      if (v10)
      {
        uint64_t v22 = 0;
        uint64_t v23 = &v22;
        uint64_t v24 = 0x2020000000;
        char v25 = 0;
        int64_t v11 = [*(id *)(a1 + 40) clientTruthWorkloop];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __43__BRCStageRegistry__removeUnusedXattrBlobs__block_invoke_142;
        block[3] = &unk_1E6996D20;
        id v19 = *(id *)(a1 + 40);
        id v12 = v10;
        id v20 = v12;
        int v21 = &v22;
        dispatch_async_and_wait(v11, block);

        if (*((unsigned char *)v23 + 24))
        {
          uint64_t v8 = 1;
        }
        else
        {
          __int16 v13 = brc_bread_crumbs();
          uint64_t v14 = brc_default_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v27 = v12;
            __int16 v28 = 2112;
            int v29 = v13;
            _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Removing unused xattr signature %@%@", buf, 0x16u);
          }

          uint64_t v8 = 0;
          *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += *(void *)(a3 + 96);
        }

        _Block_object_dispose(&v22, 8);
      }
      else
      {
        uint64_t v8 = 1;
      }
    }
    else
    {
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __43__BRCStageRegistry__removeUnusedXattrBlobs__block_invoke_142(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) clientDB];
  id v8 = (id)[v2 numberWithSQL:@"SELECT EXISTS (SELECT 1 FROM client_pkg_items WHERE xattrs = %@)", *(void *)(a1 + 40)];

  if ([v8 BOOLValue])
  {
    time_t v3 = v8;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) clientDB];
    double v5 = (void *)[v4 numberWithSQL:@"SELECT EXISTS (SELECT 1 FROM client_items WHERE item_xattr_signature = %@ OR version_xattr_signature = %@ LIMIT 1)", *(void *)(a1 + 40), *(void *)(a1 + 40)];

    if ([v5 BOOLValue])
    {
      time_t v3 = v5;
    }
    else
    {
      double v6 = [*(id *)(a1 + 32) clientDB];
      id v9 = (id)[v6 numberWithSQL:@"SELECT EXISTS (SELECT 1 FROM server_items WHERE item_xattr_signature = %@ OR version_xattr_signature = %@ LIMIT 1)", *(void *)(a1 + 40), *(void *)(a1 + 40)];

      int v7 = [v9 BOOLValue];
      time_t v3 = v9;
      if (!v7) {
        goto LABEL_7;
      }
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_7:
}

- (int64_t)_garbageCollectUploadThumbnailsIncludingActiveUploads:(BOOL)a3
{
  double v5 = brc_bread_crumbs();
  double v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCStageRegistry _garbageCollectUploadThumbnailsIncludingActiveUploads:](a3);
  }

  int v7 = self->_stageDirectoryPath[8];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__BRCStageRegistry__garbageCollectUploadThumbnailsIncludingActiveUploads___block_invoke;
  v11[3] = &unk_1E69985D8;
  uint64_t v14 = v17;
  id v8 = v7;
  BOOL v16 = a3;
  id v12 = v8;
  __int16 v13 = self;
  uint64_t v15 = &v19;
  BRCRemoveFolderInAutoreleasepool(v8, v11, 1, 0);
  int64_t v9 = v20[3];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

uint64_t __74__BRCStageRegistry__garbageCollectUploadThumbnailsIncludingActiveUploads___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    double v6 = [NSString stringWithUTF8String:a2];
    int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

    if (v7)
    {
      uint64_t result = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      return result;
    }
  }
  if (!a3) {
    return 1;
  }
  if (!*(unsigned char *)(a1 + 64))
  {
    int64_t v9 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", a2);
    id v10 = objc_msgSend(v9, "br_pathRelativeToPath:", *(void *)(a1 + 32));
    int64_t v11 = [v10 pathComponents];
    uint64_t v12 = [v11 count];

    if (v12 == 1)
    {
      __int16 v13 = [v10 lastPathComponent];
      char v14 = [*(id *)(a1 + 40) _hasActiveUploadWithStageID:v13];

      if (v14)
      {

        return 1;
      }
    }
  }
  uint64_t result = 0;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += *(void *)(a3 + 96);
  return result;
}

- (int64_t)_garbageCollectSpace:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int64_t v5 = [(BRCStageRegistry *)self _garbageCollectPackages];
  int64_t v6 = [(BRCStageRegistry *)self _garbageCollectUploads] + v5;
  int64_t v7 = [(BRCStageRegistry *)self _garbageCollectFaults];
  int64_t v8 = v6 + v7 + [(BRCStageRegistry *)self _garbageCollectDownloads];
  int64_t v9 = [(BRCStageRegistry *)self _garbageCollectDeltaSyncDatabases];
  int64_t v10 = v9 + [(BRCStageRegistry *)self _garbageCollectQBSDatabases];
  int64_t v11 = v8 + v10 + [(BRCStageRegistry *)self _removeUnusedXattrBlobs];
  int64_t v12 = v11
      + [(BRCStageRegistry *)self _garbageCollectUploadThumbnailsIncludingActiveUploads:0];
  if (v12 < a3) {
    [(BRCStageRegistry *)self _garbageCollectOldVersions];
  }
  return v12;
}

- (int64_t)garbageCollectSpace:(int64_t)a3
{
  time_t v5 = time(0);
  int64_t v6 = brc_bread_crumbs();
  int64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(BRCStageRegistry *)(uint64_t)v6 garbageCollectSpace:v7];
  }

  int64_t v8 = [(BRCStageRegistry *)self _garbageCollectSpace:a3];
  [(BRCStageRegistry *)self _updatePersistedStateWithLatestGCStartTime:v5];
  return v8;
}

- (void)_updatePersistedStateWithLatestGCStartTime:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  time_t v5 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__BRCStageRegistry__updatePersistedStateWithLatestGCStartTime___block_invoke;
  v6[3] = &unk_1E6995308;
  v6[4] = self;
  void v6[5] = a3;
  dispatch_async_and_wait(v5, v6);
}

void __63__BRCStageRegistry__updatePersistedStateWithLatestGCStartTime___block_invoke(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  time_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __63__BRCStageRegistry__updatePersistedStateWithLatestGCStartTime___block_invoke_cold_1(a1, (uint64_t)v2, v3);
  }

  id v4 = [[BRCStagePersistedState alloc] initWithLatestGCStartTime:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(a1 + 32);
  int64_t v6 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v4;

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(v7 + 224);
  int64_t v9 = [*(id *)(v7 + 8) clientState];
  [v9 setObject:v8 forKeyedSubscript:@"stage"];

  int64_t v10 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
  [v10 forceBatchStart];
}

+ (void)migrateStageToVersion2_0WithSession:(id)a3
{
  time_t v3 = [a3 sessionDirPath];
  id v4 = [v3 stringByAppendingPathComponent:@"i"];

  BRCRemoveFolder(v4, 0, 0, 0);
}

- (void)close
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] closing%@", v2, v3, v4, v5, v6);
}

void __25__BRCStageRegistry_close__block_invoke(uint64_t a1)
{
  id v4 = +[BRCSystemResourcesManager manager];
  [v4 removeLowDiskObserver:*(void *)(a1 + 32) forDevice:*(unsigned int *)(*(void *)(a1 + 32) + 256)];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 224);
  *(void *)(v2 + 224) = 0;
}

uint64_t __25__BRCStageRegistry_close__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) forgetWatchedLockedFileIDsForAppLibrary:0];
}

- (void)disarmLockedTestTimer
{
  lockedTestTimer = self->_lockedTestTimer;
  if (lockedTestTimer)
  {
    dispatch_source_cancel(lockedTestTimer);
    id v4 = self->_lockedTestTimer;
    self->_lockedTestTimer = 0;
  }
}

- (void)resume
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: minDelta >= 0%@", v2, v3, v4, v5, v6);
}

void __26__BRCStageRegistry_resume__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 224))
  {
    uint8_t v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __26__BRCStageRegistry_resume__block_invoke_cold_2();
    }

    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v3 = +[BRCPersistedState loadFromClientStateInSession:*(void *)(v2 + 8)];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 224);
  *(void *)(v4 + 224) = v3;

  if (!*(void *)(*(void *)(a1 + 32) + 224))
  {
    uint64_t v8 = brc_bread_crumbs();
    int64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __26__BRCStageRegistry_resume__block_invoke_cold_1();
    }
  }
}

void __26__BRCStageRegistry_resume__block_invoke_160(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 224) timeSinceLatestGCStartTime];
  if (v2 <= *(void *)(a1 + 48))
  {
    uint64_t v5 = brc_bread_crumbs();
    uint8_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 134218498;
      uint64_t v10 = v2;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      char v14 = v5;
      _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] skipping GC at startup after %lld seconds; %@%@",
        (uint8_t *)&v9,
        0x20u);
    }
  }
  else
  {
    uint64_t v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 134218498;
      uint64_t v10 = v2;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      char v14 = v3;
      _os_log_debug_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] running GC at startup after %lld seconds; %@%@",
        (uint8_t *)&v9,
        0x20u);
    }

    [*(id *)(a1 + 32) garbageCollectSpace:0x7FFFFFFFFFFFFFFFLL];
  }
}

void __26__BRCStageRegistry_resume__block_invoke_168(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (xpc_activity_should_defer(v3))
    {
      if (xpc_activity_set_state(v3, 3)) {
        goto LABEL_13;
      }
      uint64_t v5 = brc_bread_crumbs();
      uint8_t v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v5;
        _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state%@", buf, 0xCu);
      }
    }
    if (xpc_activity_get_state(v3) == 2)
    {
      uint64_t v7 = WeakRetained[30];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __26__BRCStageRegistry_resume__block_invoke_169;
      block[3] = &unk_1E6993F70;
      uint64_t v8 = *(void *)(a1 + 48);
      void block[4] = WeakRetained;
      uint64_t v13 = v8;
      id v12 = *(id *)(a1 + 32);
      dispatch_sync(v7, block);
      if (!xpc_activity_set_state(v3, 5))
      {
        int v9 = brc_bread_crumbs();
        uint64_t v10 = brc_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v15 = v9;
          _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to set the xpc state to done%@", buf, 0xCu);
        }
      }
    }
  }
LABEL_13:
}

void __26__BRCStageRegistry_resume__block_invoke_169(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[BRCAccountsManager sharedManager];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) accountHandler];
  uint64_t v4 = [v3 acAccountID];
  uint64_t v5 = [v2 personaIdentifierForACAccountID:v4];

  if ([v5 isEqualToString:@"__defaultPersonaID__"]) {
    uint8_t v6 = 0;
  }
  else {
    uint8_t v6 = v5;
  }
  id v7 = v6;
  id v8 = v5;
  if (!v7)
  {
    if (_block_invoke___personaOnceToken_1 != -1) {
      dispatch_once(&_block_invoke___personaOnceToken_1, &__block_literal_global_175);
    }
    id v8 = (id)_block_invoke___personalPersona_1;
  }
  int v9 = [MEMORY[0x1E4FB36F8] sharedManager];
  uint64_t v10 = [v9 currentPersona];

  id v31 = 0;
  id v11 = [v10 userPersonaUniqueString];
  id v12 = v11;
  if (v11 == v8 || ([v11 isEqualToString:v8] & 1) != 0)
  {
    uint64_t v13 = 0;
    goto LABEL_11;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v30 = 0;
    uint64_t v19 = (void *)[v10 copyCurrentPersonaContextWithError:&v30];
    id v20 = v30;
    id v21 = v31;
    id v31 = v19;

    if (v20)
    {
      uint64_t v22 = brc_bread_crumbs();
      uint64_t v23 = brc_default_log();
      if (os_log_type_enabled(v23, (os_log_type_t)0x90u)) {
        -[BRCContainerScheduler syncContextDidBecomeForeground:]((uint64_t)v20);
      }
    }
    uint64_t v13 = [v10 generateAndRestorePersonaContextWithPersonaUniqueString:v8];

    if (v13)
    {
      uint64_t v24 = brc_bread_crumbs();
      char v25 = brc_default_log();
      if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v33 = (uint64_t)v5;
        __int16 v34 = 2112;
        uint64_t v35 = v13;
        __int16 v36 = 2112;
        __int16 v37 = v24;
        _os_log_error_impl(&dword_1D353B000, v25, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_35:
    }
  }
  else
  {
    if (!v7 && ([v10 isDataSeparatedPersona] & 1) == 0)
    {
      uint64_t v24 = brc_bread_crumbs();
      char v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        __br_notify_register_dispatch_block_invoke_cold_4();
      }
      uint64_t v13 = 0;
      goto LABEL_35;
    }
    uint64_t v26 = brc_bread_crumbs();
    id v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      __br_notify_register_dispatch_block_invoke_cold_3();
    }

    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  }
LABEL_11:
  uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 224) timeSinceLatestGCStartTime];
  if (v14 >= *(void *)(a1 + 48))
  {
    uint64_t v17 = brc_bread_crumbs();
    char v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      int v29 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      uint64_t v33 = v14;
      __int16 v34 = 2112;
      uint64_t v35 = v29;
      __int16 v36 = 2112;
      __int16 v37 = v17;
      _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] running GC in XPC activity after %lld seconds; %@%@",
        buf,
        0x20u);
    }

    [*(id *)(a1 + 32) garbageCollectSpace:0x7FFFFFFFFFFFFFFFLL];
  }
  else
  {
    uint64_t v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      __int16 v28 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      uint64_t v33 = v14;
      __int16 v34 = 2112;
      uint64_t v35 = v28;
      __int16 v36 = 2112;
      __int16 v37 = v15;
      _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] skipping GC in XPC activity after %lld seconds; %@%@",
        buf,
        0x20u);
    }
  }
  _BRRestorePersona();
}

void __26__BRCStageRegistry_resume__block_invoke_2()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  uint64_t v1 = (void *)_block_invoke___personalPersona_1;
  _block_invoke___personalPersona_1 = v0;
}

- (void)cancel
{
  self->_isCancelled = 1;
  brc_task_tracker_cancel(self->_tracker);
}

+ (unsigned)computeItemModeFromStatInfo:(id)a3 isPackage:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  unsigned int v6 = [v5 type];
  unsigned int v7 = (v6 < 0xB) & (0x611u >> v6);
  if ([v5 type] == 5) {
    __int16 v8 = -24284;
  }
  else {
    __int16 v8 = 292;
  }
  if ((v7 & 1) != 0 || v4)
  {
    unsigned __int16 v9 = v8 | 0x49;
LABEL_12:
    v9 |= 0x92u;
    goto LABEL_13;
  }
  if (([v5 mode] & 2) != 0) {
    unsigned __int16 v9 = v8 | 0x49;
  }
  else {
    unsigned __int16 v9 = v8;
  }
  if ([v5 mode]) {
    goto LABEL_12;
  }
LABEL_13:

  return v9;
}

- (BOOL)saveXattrAtURL:(id)a3 forSignature:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8)
  {
    unsigned __int16 v9 = [(BRCStageRegistry *)self urlForXattrSignature:a4];
    if ([v9 checkResourceIsReachableAndReturnError:0])
    {
      id v10 = 0;
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v24 = 0;
      char v17 = [v16 moveItemAtURL:v8 toURL:v9 error:&v24];
      id v18 = v24;
      id v10 = v24;

      if ((v17 & 1) == 0)
      {
        id v10 = v10;
        if (v10)
        {
          uint64_t v19 = brc_bread_crumbs();
          id v20 = brc_default_log();
          if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
          {
            uint64_t v23 = "(passed to caller)";
            *(_DWORD *)buf = 136315906;
            uint64_t v26 = "-[BRCStageRegistry saveXattrAtURL:forSignature:error:]";
            __int16 v27 = 2080;
            if (!a5) {
              uint64_t v23 = "(ignored by caller)";
            }
            __int16 v28 = v23;
            __int16 v29 = 2112;
            id v30 = v10;
            __int16 v31 = 2112;
            int v32 = v19;
            _os_log_error_impl(&dword_1D353B000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          }
        }
        if (a5) {
          objc_storeStrong(a5, v18);
        }

        BOOL v15 = 0;
        goto LABEL_19;
      }
    }
    BOOL v15 = 1;
  }
  else
  {
    id v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BRCStageRegistry saveXattrAtURL:forSignature:error:]();
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: Asked to save xattr without url");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      uint64_t v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        uint64_t v22 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v26 = "-[BRCStageRegistry saveXattrAtURL:forSignature:error:]";
        __int16 v27 = 2080;
        if (!a5) {
          uint64_t v22 = "(ignored by caller)";
        }
        __int16 v28 = v22;
        __int16 v29 = 2112;
        id v30 = v10;
        __int16 v31 = 2112;
        int v32 = v13;
        _os_log_error_impl(&dword_1D353B000, v14, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (!a5)
    {
      BOOL v15 = 0;
      goto LABEL_20;
    }
    id v10 = v10;
    BOOL v15 = 0;
    unsigned __int16 v9 = *a5;
    *a5 = v10;
  }
LABEL_19:

LABEL_20:
  return v15;
}

- (BOOL)saveXattrBlob:(id)a3 forSignature:(id)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8 && a4)
  {
    unsigned __int16 v9 = [(BRCStageRegistry *)self urlForXattrSignature:a4];
    id v36 = 0;
    char v10 = [v8 writeToURL:v9 options:2 error:&v36];
    id v11 = v36;
    id v12 = v11;
    if (v10)
    {
LABEL_4:
      BOOL v13 = 1;
LABEL_32:

      goto LABEL_33;
    }
    if (objc_msgSend(v11, "br_isCocoaErrorCode:", 516))
    {
      brc_bread_crumbs();
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v13 = 1;
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[BRCStageRegistry saveXattrBlob:forSignature:error:](v9);
      }
      goto LABEL_30;
    }
    if ((objc_msgSend(v12, "br_isCocoaErrorCode:", 4) & 1) != 0
      || objc_msgSend(v12, "br_isCocoaErrorCode:", 260))
    {
      id v20 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v21 = [v9 URLByDeletingLastPathComponent];
      id v35 = v12;
      char v22 = [v20 createDirectoryAtURL:v21 withIntermediateDirectories:1 attributes:0 error:&v35];
      id v23 = v35;

      if (v22)
      {
      }
      else
      {
        char v24 = objc_msgSend(v23, "br_isCocoaErrorCode:", 516);

        if ((v24 & 1) == 0)
        {
          id v18 = v23;
          if (v18)
          {
            __int16 v29 = brc_bread_crumbs();
            id v30 = brc_default_log();
            if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
            {
              uint64_t v33 = "(passed to caller)";
              *(_DWORD *)buf = 136315906;
              uint64_t v38 = "-[BRCStageRegistry saveXattrBlob:forSignature:error:]";
              __int16 v39 = 2080;
              if (!a5) {
                uint64_t v33 = "(ignored by caller)";
              }
              int v40 = v33;
              __int16 v41 = 2112;
              id v42 = v18;
              __int16 v43 = 2112;
              int v44 = v29;
              _os_log_error_impl(&dword_1D353B000, v30, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }
          }
          if (a5) {
            goto LABEL_29;
          }
          goto LABEL_38;
        }
      }
      id v34 = v23;
      char v25 = [v8 writeToURL:v9 options:2 error:&v34];
      id v12 = v34;

      if (v25) {
        goto LABEL_4;
      }
      if (objc_msgSend(v12, "br_isCocoaErrorCode:", 516))
      {
        brc_bread_crumbs();
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v13 = 1;
        uint64_t v19 = brc_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[BRCStageRegistry saveXattrBlob:forSignature:error:](v9);
        }
        goto LABEL_30;
      }
    }
    id v18 = v12;
    if (v18)
    {
      uint64_t v26 = brc_bread_crumbs();
      __int16 v27 = brc_default_log();
      if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
      {
        int v32 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v38 = "-[BRCStageRegistry saveXattrBlob:forSignature:error:]";
        __int16 v39 = 2080;
        if (!a5) {
          int v32 = "(ignored by caller)";
        }
        int v40 = v32;
        __int16 v41 = 2112;
        id v42 = v18;
        __int16 v43 = 2112;
        int v44 = v26;
        _os_log_error_impl(&dword_1D353B000, v27, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5)
    {
LABEL_29:
      id v18 = v18;
      BOOL v13 = 0;
      uint64_t v19 = *a5;
      *a5 = v18;
      id v12 = v18;
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
LABEL_38:
    BOOL v13 = 0;
    id v12 = v18;
    goto LABEL_31;
  }
  uint64_t v14 = brc_bread_crumbs();
  BOOL v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
    -[BRCStageRegistry saveXattrBlob:forSignature:error:]();
  }

  objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: Asked to save xattr without signature or data");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    uint64_t v16 = brc_bread_crumbs();
    char v17 = brc_default_log();
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
    {
      __int16 v31 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      uint64_t v38 = "-[BRCStageRegistry saveXattrBlob:forSignature:error:]";
      __int16 v39 = 2080;
      if (!a5) {
        __int16 v31 = "(ignored by caller)";
      }
      int v40 = v31;
      __int16 v41 = 2112;
      id v42 = v12;
      __int16 v43 = 2112;
      int v44 = v16;
      _os_log_error_impl(&dword_1D353B000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a5)
  {
    id v12 = v12;
    BOOL v13 = 0;
    unsigned __int16 v9 = *a5;
    *a5 = v12;
    goto LABEL_32;
  }
  BOOL v13 = 0;
LABEL_33:

  return v13;
}

- (id)loadXattrBlobForSignature:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v5 = -[BRCStageRegistry urlForXattrSignature:](self, "urlForXattrSignature:");
    id v19 = 0;
    unsigned int v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v5 options:1 error:&v19];
    id v7 = v19;
    id v8 = v19;
    id v9 = v8;
    if (!v6)
    {
      id v9 = v8;
      if (v9)
      {
        char v10 = brc_bread_crumbs();
        id v11 = brc_default_log();
        if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
        {
          id v18 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          id v21 = "-[BRCStageRegistry loadXattrBlobForSignature:error:]";
          __int16 v22 = 2080;
          if (!a4) {
            id v18 = "(ignored by caller)";
          }
          id v23 = v18;
          __int16 v24 = 2112;
          id v25 = v9;
          __int16 v26 = 2112;
          __int16 v27 = v10;
          _os_log_error_impl(&dword_1D353B000, v11, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a4) {
        objc_storeStrong(a4, v7);
      }
    }
    goto LABEL_16;
  }
  id v12 = brc_bread_crumbs();
  BOOL v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    -[BRCStageRegistry loadXattrBlobForSignature:error:]();
  }

  objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: Asked for xattr without signature");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    uint64_t v14 = brc_bread_crumbs();
    BOOL v15 = brc_default_log();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    {
      char v17 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      id v21 = "-[BRCStageRegistry loadXattrBlobForSignature:error:]";
      __int16 v22 = 2080;
      if (!a4) {
        char v17 = "(ignored by caller)";
      }
      id v23 = v17;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      __int16 v27 = v14;
      _os_log_error_impl(&dword_1D353B000, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a4)
  {
    id v9 = v9;
    unsigned int v6 = 0;
    id v5 = *a4;
    *a4 = v9;
LABEL_16:

    goto LABEL_17;
  }
  unsigned int v6 = 0;
LABEL_17:

  return v6;
}

- (id)urlForXattrSignature:(id)a3
{
  if (a3)
  {
    BOOL v4 = self->_stageDirectoryPath[9];
    id v5 = objc_msgSend(a3, "brc_hexadecimalString");
    unsigned int v6 = [(NSString *)v4 stringByAppendingPathComponent:v5];

    id v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
  }
  else
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCStageRegistry loadXattrBlobForSignature:error:]();
    }

    id v7 = 0;
  }
  return v7;
}

- (int)deviceID
{
  return self->_deviceID;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_persistedState, 0);
  objc_storeStrong((id *)&self->_flushingQueue, 0);
  objc_storeStrong((id *)&self->_lockedTestTimer, 0);
  objc_storeStrong((id *)&self->_watchedLockedFileIDs, 0);
  objc_storeStrong((id *)&self->_unflushedStagedFileIDs, 0);
  objc_storeStrong((id *)&self->_activeDownloadStageIDs, 0);
  objc_storeStrong((id *)&self->_activeUploadStageIDs, 0);
  for (uint64_t i = 88; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)associateDownloadStageID:(id)a3 withOperation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_activeDownloadStageIDs;
  objc_sync_enter(v8);
  if ([(NSMutableSet *)self->_activeDownloadStageIDs containsObject:v6])
  {
    objc_sync_exit(v8);
  }
  else
  {
    [(NSMutableSet *)self->_activeDownloadStageIDs addObject:v6];
    objc_sync_exit(v8);

    id v9 = [v7 completionBlock];
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76__BRCStageRegistry_LegacyAdditions__associateDownloadStageID_withOperation___block_invoke;
    v10[3] = &unk_1E6998380;
    objc_copyWeak(&v13, &location);
    id v8 = v9;
    id v12 = v8;
    id v11 = v6;
    [v7 setCompletionBlock:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __76__BRCStageRegistry_LegacyAdditions__associateDownloadStageID_withOperation___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v4 = WeakRetained[23];
    objc_sync_enter(v4);
    [v7[23] removeObject:*(void *)(a1 + 32)];
    objc_sync_exit(v4);

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
    [v7 cleanupStagedDownloadWithID:*(void *)(a1 + 32) forItemID:0];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (!v6) {
      goto LABEL_8;
    }
    id v7 = 0;
    (*(void (**)(void))(v6 + 16))();
  }
  uint64_t v3 = v7;
LABEL_8:
}

- (id)nonLocalFaultURLForAdditionName:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(a3, "br_sideFaultName");
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
  v9[0] = self->_stageDirectoryPath[1];
  v9[1] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v7 = [v5 fileURLWithPathComponents:v6];

  return v7;
}

- (id)makeNonLocalVersionSideFaultWithAdditionName:(id)a3 clientZone:(id)a4 statInfo:(id)a5 version:(id)a6 sharingOptions:(unint64_t)a7 error:(id *)a8
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = [v15 db];
  [v18 assertOnQueue];

  [v17 originalPOSIXName];
  objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v17, "size"));
  [v17 isPackage];
  Properties = (void *)_CFURLPromiseCreateProperties();
  uint64_t v43 = 0;
  int v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = __Block_byref_object_copy__45;
  __int16 v47 = __Block_byref_object_dispose__45;
  id v48 = [(BRCStageRegistry *)self nonLocalFaultURLForAdditionName:v14];
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  int v40 = __Block_byref_object_copy__45;
  __int16 v41 = __Block_byref_object_dispose__45;
  id v42 = 0;
  id v20 = (void *)v44[5];
  id v36 = 0;
  char SideFault = _makeSideFault(v20, Properties, &v36);
  id v22 = v36;

  if (SideFault)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __131__BRCStageRegistry_LegacyAdditions__makeNonLocalVersionSideFaultWithAdditionName_clientZone_statInfo_version_sharingOptions_error___block_invoke;
    v29[3] = &unk_1E699A268;
    uint64_t v33 = &v43;
    id v34 = &v37;
    v29[4] = self;
    id v30 = v15;
    id v31 = v16;
    id v32 = v17;
    unint64_t v35 = a7;
    [(BRCStageRegistry *)self _performInStageDirectory:1 block:v29];
    id v23 = (id)v38[5];
    if (v23)
    {
      __int16 v24 = brc_bread_crumbs();
      id v25 = brc_default_log();
      if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
      {
        uint64_t v28 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        int v50 = "-[BRCStageRegistry(LegacyAdditions) makeNonLocalVersionSideFaultWithAdditionName:clientZone:statInfo:versi"
              "on:sharingOptions:error:]";
        __int16 v51 = 2080;
        if (!a8) {
          uint64_t v28 = "(ignored by caller)";
        }
        int v52 = v28;
        __int16 v53 = 2112;
        id v54 = v23;
        __int16 v55 = 2112;
        int v56 = v24;
        _os_log_error_impl(&dword_1D353B000, v25, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a8) {
      *a8 = v23;
    }

    id v26 = (id)v44[5];
  }
  else if (objc_msgSend(v22, "br_isCocoaErrorCode:", 516))
  {
    id v26 = (id)v44[5];
  }
  else
  {
    id v26 = 0;
    if (a8) {
      *a8 = v22;
    }
  }

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  return v26;
}

uint64_t __131__BRCStageRegistry_LegacyAdditions__makeNonLocalVersionSideFaultWithAdditionName_clientZone_statInfo_version_sharingOptions_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) lastPathComponent];
  uint64_t v5 = (const char *)[v4 fileSystemRepresentation];
  uint64_t v11 = BRCOpenAt(a2, v5, 33028, v6, v7, v8, v9, v10, v21);
  if ((v11 & 0x80000000) != 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
    uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    int v16 = *__error();
    id v17 = brc_bread_crumbs();
    id v18 = brc_default_log();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      id v20 = [v4 lastPathComponent];
      *(_DWORD *)buf = 67109890;
      int v23 = a2;
      __int16 v24 = 2112;
      id v25 = v20;
      __int16 v26 = 1024;
      int v27 = v16;
      __int16 v28 = 2112;
      __int16 v29 = v17;
      _os_log_error_impl(&dword_1D353B000, v18, (os_log_type_t)0x90u, "[ERROR] openat(%d, '%@') failed %{errno}d%@", buf, 0x22u);
    }
    *__error() = v16;
  }
  else
  {
    int v12 = v11;
    [*(id *)(a1 + 32) applyMetadataOnFileDescriptor:v11 liveFileDescriptor:0xFFFFFFFFLL itemID:0 clientZone:*(void *)(a1 + 40) statInfo:*(void *)(a1 + 48) version:*(void *)(a1 + 56) sharingOptions:*(void *)(a1 + 80)];
    close(v12);
  }

  return 0;
}

- (BOOL)makeSideFaultInStageGatherFileID:(unint64_t *)a3 generationID:(unsigned int *)a4 documentID:(unsigned int *)a5 properties:(id)a6 inAppLibrary:(id)a7 forCreation:(BOOL)a8 error:(id *)a9
{
  v56[2] = *MEMORY[0x1E4F143B8];
  id v15 = a6;
  id v16 = a7;
  id v17 = [MEMORY[0x1E4F29128] UUID];
  id v18 = [v17 UUIDString];

  id v19 = (void *)MEMORY[0x1E4F1CB10];
  v56[0] = self->_stageDirectoryPath[0];
  v56[1] = v18;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  unsigned __int16 v21 = [v19 fileURLWithPathComponents:v20];

  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  uint64_t v45 = __Block_byref_object_copy__45;
  uint64_t v46 = __Block_byref_object_dispose__45;
  id v47 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __136__BRCStageRegistry_LegacyAdditions__makeSideFaultInStageGatherFileID_generationID_documentID_properties_inAppLibrary_forCreation_error___block_invoke;
  v34[3] = &unk_1E699A290;
  id v22 = v21;
  id v35 = v22;
  id v23 = v15;
  id v36 = v23;
  uint64_t v38 = &v42;
  id v24 = v18;
  id v37 = v24;
  uint64_t v39 = a3;
  int v40 = a4;
  __int16 v41 = a5;
  int v25 = [(BRCStageRegistry *)self _performInStageDirectory:0 block:v34];
  if (v25 < 0)
  {
    __int16 v28 = (void *)v43[5];
    if (v28)
    {
      id v29 = v28;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
LABEL_9:
        if (a9) {
          *a9 = v29;
        }

        id v27 = v35;
        goto LABEL_12;
      }
    }
    uint64_t v30 = brc_bread_crumbs();
    id v31 = brc_default_log();
    if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
    {
      uint64_t v33 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      __int16 v49 = "-[BRCStageRegistry(LegacyAdditions) makeSideFaultInStageGatherFileID:generationID:documentID:properties:inAp"
            "pLibrary:forCreation:error:]";
      __int16 v50 = 2080;
      if (!a9) {
        uint64_t v33 = "(ignored by caller)";
      }
      __int16 v51 = v33;
      __int16 v52 = 2112;
      id v53 = v29;
      __int16 v54 = 2112;
      __int16 v55 = v30;
      _os_log_error_impl(&dword_1D353B000, v31, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

    goto LABEL_9;
  }

  if (!a8)
  {
    unflushedStagedFileIDs = self->_unflushedStagedFileIDs;
    id v27 = [NSNumber numberWithUnsignedLongLong:*a3];
    [(NSMutableSet *)unflushedStagedFileIDs addObject:v27];
LABEL_12:
  }
  _Block_object_dispose(&v42, 8);

  return v25 >= 0;
}

uint64_t __136__BRCStageRegistry_LegacyAdditions__makeSideFaultInStageGatherFileID_generationID_documentID_properties_inAppLibrary_forCreation_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v6 + 40);
  int SideFault = _makeSideFault(v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!SideFault) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = (const char *)[*(id *)(a1 + 48) fileSystemRepresentation];
  uint64_t v14 = BRCOpenAt(a2, v8, 33028, v9, v10, v11, v12, v13, v22);
  if ((v14 & 0x80000000) != 0)
  {
    int v17 = *__error();
    id v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      uint64_t v21 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 67109890;
      int v25 = a2;
      __int16 v26 = 2112;
      uint64_t v27 = v21;
      __int16 v28 = 1024;
      int v29 = v17;
      __int16 v30 = 2112;
      id v31 = v18;
      _os_log_error_impl(&dword_1D353B000, v19, (os_log_type_t)0x90u, "[ERROR] openat(%d, '%@') failed %{errno}d%@", buf, 0x22u);
    }

    uint64_t v16 = 0xFFFFFFFFLL;
  }
  else
  {
    int v15 = v14;
    uint64_t v16 = _fstatItem(v14, *(void **)(a1 + 64), *(_DWORD **)(a1 + 72), *(_DWORD **)(a1 + 80), 0, 0);
    int v17 = *__error();
    close(v15);
  }
  *__error() = v17;
  return v16;
}

- (BOOL)existsInOldVersionStageOrGraveyard:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v10 = 0;
  if (a3)
  {
    id v4 = [(BRCStageRegistry *)self _pathInStage:a3 index:&v10 generationID:0];
    BOOL v5 = 0;
    if (v4 && (v10 & 0xFE) == 2)
    {
      uint64_t v6 = brc_bread_crumbs();
      uint64_t v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        if (v10 == 3) {
          uint64_t v9 = "graveyard";
        }
        else {
          uint64_t v9 = "old versions stage";
        }
        unint64_t v12 = a3;
        __int16 v13 = 2080;
        uint64_t v14 = v9;
        __int16 v15 = 2112;
        uint64_t v16 = v6;
        _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] fileID:%llu is in the %s%@", buf, 0x20u);
      }

      BOOL v5 = 1;
    }
  }
  else
  {
    id v4 = 0;
    BOOL v5 = 0;
  }

  return v5;
}

- (void)willFlushAllStagedFileIDs
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_unflushedStagedFileIDs count])
  {
    memset(v9, 0, sizeof(v9));
    __brc_create_section(0, (uint64_t)"-[BRCStageRegistry(LegacyAdditions) willFlushAllStagedFileIDs]", 198, v9);
    uint64_t v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = v9[0];
      uint64_t v8 = [(NSMutableSet *)self->_unflushedStagedFileIDs count];
      *(_DWORD *)buf = 134218498;
      uint64_t v11 = v7;
      __int16 v12 = 2048;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      __int16 v15 = v3;
      _os_log_debug_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx kicking apply changes: %ld unflushed staged file IDs%@", buf, 0x20u);
    }

    [(NSMutableSet *)self->_unflushedStagedFileIDs removeAllObjects];
    BOOL v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [(BRCAccountSession *)v5->_session applyScheduler];
    [v6 rescheduleSuspendedJobsMatching:0 inState:20];

    objc_sync_exit(v5);
    __brc_leave_section(v9);
  }
}

- (void)_fileIDMightHaveBeenUnlocked:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 unsignedLongLongValue];
  memset(v8, 0, sizeof(v8));
  __brc_create_section(0, (uint64_t)"-[BRCStageRegistry(LegacyAdditions) _fileIDMightHaveBeenUnlocked:]", 212, v8);
  uint64_t v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v10 = v8[0];
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    __int16 v14 = v6;
    _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx file %llu might have been unlocked%@", buf, 0x20u);
  }

  [(BRCStageRegistry *)self forgetWatchedLockedFileID:v4];
  __brc_leave_section(v8);
}

- (void)_watchLockedRelpath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCAccountSession *)self->_session clientDB];
  [v5 assertOnQueue];

  uint64_t v6 = (void *)[v4 fileID];
  watchedLockedFileIDs = self->_watchedLockedFileIDs;
  uint64_t v8 = [NSNumber numberWithUnsignedLongLong:v6];
  uint64_t v9 = [(NSMutableDictionary *)watchedLockedFileIDs objectForKeyedSubscript:v8];

  if (!v9)
  {
    unsigned int v10 = BRCOpenByID(self->_deviceID, (uint64_t)v6, 33028);
    if ((v10 & 0x80000000) != 0)
    {
      int v23 = *__error();
      id v24 = brc_bread_crumbs();
      int v25 = brc_default_log();
      if (os_log_type_enabled(v25, (os_log_type_t)0x90u)) {
        -[BRCStageRegistry(LegacyAdditions) _watchLockedRelpath:]();
      }

      *__error() = v23;
    }
    else
    {
      uintptr_t v11 = v10;
      uint64_t v12 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
      dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F144A8], v11, 0x141uLL, v12);

      objc_initWeak(&location, self);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __57__BRCStageRegistry_LegacyAdditions___watchLockedRelpath___block_invoke;
      v26[3] = &unk_1E699A2B8;
      objc_copyWeak(v27, &location);
      v27[1] = v6;
      __int16 v14 = v13;
      uint64_t v15 = v26;
      uint64_t v16 = v14;
      uint64_t v17 = v15;
      id v18 = v17;
      id v19 = v17;
      if (*MEMORY[0x1E4F59658])
      {
        id v19 = ((void (*)(void *))*MEMORY[0x1E4F59658])(v17);
      }
      dispatch_block_t v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v19);
      dispatch_source_set_event_handler(v16, v20);

      dispatch_resume(v16);
      uint64_t v21 = self->_watchedLockedFileIDs;
      unsigned __int16 v22 = [NSNumber numberWithUnsignedLongLong:v6];
      [(NSMutableDictionary *)v21 setObject:v16 forKeyedSubscript:v22];

      objc_destroyWeak(v27);
      objc_destroyWeak(&location);
    }
  }
}

void __57__BRCStageRegistry_LegacyAdditions___watchLockedRelpath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  [WeakRetained _fileIDMightHaveBeenUnlocked:v2];
}

- (BOOL)_flockToMakeLiveAtPath:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [v6 flock:6];
  if ((v7 & 1) == 0)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
    if (v8)
    {
      uint64_t v9 = brc_bread_crumbs();
      unsigned int v10 = brc_default_log();
      if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      {
        dispatch_block_t v20 = "(passed to caller)";
        *(_DWORD *)uint64_t v21 = 136315906;
        *(void *)&v21[4] = "-[BRCStageRegistry(LegacyAdditions) _flockToMakeLiveAtPath:error:]";
        *(_WORD *)&v21[12] = 2080;
        if (!a4) {
          dispatch_block_t v20 = "(ignored by caller)";
        }
        *(void *)&unsigned char v21[14] = v20;
        *(_WORD *)&v21[22] = 2112;
        *(void *)&v21[24] = v8;
        __int16 v22 = 2112;
        int v23 = v9;
        _os_log_error_impl(&dword_1D353B000, v10, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v21, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v8;
    }

    uintptr_t v11 = -[BRCAccountSession globalItemByFileID:](self->_session, "globalItemByFileID:", [v6 fileID]);
    uint64_t v12 = [v11 clientZone];
    dispatch_source_t v13 = [v11 itemID];
    __int16 v14 = [v12 serverItemByItemID:v13];

    if (v14)
    {
      uint64_t v15 = [(BRCAccountSession *)self->_session applyScheduler];
      [v15 setState:29 forServerItem:v14 localItem:v11];
    }
    -[BRCStageRegistry _watchLockedRelpath:](self, "_watchLockedRelpath:", v6, *(_OWORD *)v21);
    uint64_t v16 = brc_bread_crumbs();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = *__error();
      *(_DWORD *)uint64_t v21 = 138412802;
      *(void *)&v21[4] = v6;
      *(_WORD *)&v21[12] = 1024;
      *(_DWORD *)&unsigned char v21[14] = v18;
      *(_WORD *)&v21[18] = 2112;
      *(void *)&v21[20] = v16;
      _os_log_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Abort making live: unable to flock %@ %{errno}d%@", v21, 0x1Cu);
    }
  }
  return v7;
}

- (BOOL)makeItemLive:(id)a3 fromStage:(unint64_t)a4 bySwappingWith:(id)a5 fileName:(id)a6 error:(id *)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  char v38 = 0;
  unsigned int v37 = 0;
  uint64_t v15 = [(BRCStageRegistry *)self _pathInStage:a4 index:&v38 generationID:0];
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 70);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      dispatch_block_t v20 = brc_bread_crumbs();
      uint64_t v21 = brc_default_log();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      {
        __int16 v28 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        int v40 = "-[BRCStageRegistry(LegacyAdditions) makeItemLive:fromStage:bySwappingWith:fileName:error:]";
        __int16 v41 = 2080;
        if (!a7) {
          __int16 v28 = "(ignored by caller)";
        }
        uint64_t v42 = v28;
        __int16 v43 = 2112;
        id v44 = v16;
        __int16 v45 = 2112;
        uint64_t v46 = v20;
        _os_log_error_impl(&dword_1D353B000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a7) {
      goto LABEL_7;
    }
    goto LABEL_12;
  }
  if ((v38 & 0xFB) != 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 70);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      uint64_t v17 = brc_bread_crumbs();
      int v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        uint64_t v27 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        int v40 = "-[BRCStageRegistry(LegacyAdditions) makeItemLive:fromStage:bySwappingWith:fileName:error:]";
        __int16 v41 = 2080;
        if (!a7) {
          uint64_t v27 = "(ignored by caller)";
        }
        uint64_t v42 = v27;
        __int16 v43 = 2112;
        id v44 = v16;
        __int16 v45 = 2112;
        uint64_t v46 = v17;
        _os_log_error_impl(&dword_1D353B000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a7)
    {
LABEL_7:
      id v16 = v16;
      BOOL v19 = 0;
      *a7 = v16;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v19 = 0;
    goto LABEL_13;
  }
  if (![(BRCStageRegistry *)self _flockToMakeLiveAtPath:v13 error:a7])
  {
    BOOL v19 = 0;
    goto LABEL_14;
  }
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  uint64_t v32 = __90__BRCStageRegistry_LegacyAdditions__makeItemLive_fromStage_bySwappingWith_fileName_error___block_invoke;
  uint64_t v33 = &unk_1E699A2E0;
  id v34 = v15;
  id v35 = v14;
  unint64_t v36 = a4;
  if ([v13 performOnOpenParentFileDescriptor:&v30 error:&v37])
  {

    uint64_t v23 = objc_msgSend(v13, "fileID", v30, v31, v32, v33);
    id v16 = [v12 itemID];
    [(BRCStageRegistry *)self moveFromStageToGraveyard:v23 forItemID:v16];
    BOOL v19 = 1;
  }
  else
  {
    uint64_t v24 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", v37, v30, v31, v32, v33);
    if (v24)
    {
      int v25 = brc_bread_crumbs();
      __int16 v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        int v29 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        int v40 = "-[BRCStageRegistry(LegacyAdditions) makeItemLive:fromStage:bySwappingWith:fileName:error:]";
        __int16 v41 = 2080;
        if (!a7) {
          int v29 = "(ignored by caller)";
        }
        uint64_t v42 = v29;
        __int16 v43 = 2112;
        id v44 = v24;
        __int16 v45 = 2112;
        uint64_t v46 = v25;
        _os_log_debug_impl(&dword_1D353B000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a7) {
      *a7 = v24;
    }

    BOOL v19 = 0;
    id v16 = v34;
  }
LABEL_13:

LABEL_14:
  return v19;
}

uint64_t __90__BRCStageRegistry_LegacyAdditions__makeItemLive_fromStage_bySwappingWith_fileName_error___block_invoke(uint64_t a1, int a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((BRCRenameAt(-1, *(void **)(a1 + 32), a2, *(void **)(a1 + 40), 2u) & 0x80000000) != 0)
  {
    char v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      int v15 = *__error();
      int v16 = 138413570;
      uint64_t v17 = v12;
      __int16 v18 = 1024;
      *(_DWORD *)BOOL v19 = a2;
      *(_WORD *)&v19[4] = 2112;
      *(void *)&v19[6] = v13;
      *(_WORD *)&v19[14] = 2048;
      *(void *)&v19[16] = v14;
      *(_WORD *)&v19[24] = 1024;
      *(_DWORD *)&v19[26] = v15;
      __int16 v20 = 2112;
      uint64_t v21 = v7;
      _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] renameat(-1, '%@', %d, '%@', RENAME_SWAP) failed for fileID=%llu,  %{errno}d%@", (uint8_t *)&v16, 0x36u);
    }

    return *__error();
  }
  else
  {
    id v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      int v16 = 138413058;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      *(void *)BOOL v19 = v10;
      *(_WORD *)&v19[8] = 2048;
      *(void *)&v19[10] = v11;
      *(_WORD *)&v19[18] = 2112;
      *(void *)&v19[20] = v4;
      _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] swapped '%@' and '%@' fileID=%llu%@", (uint8_t *)&v16, 0x2Au);
    }

    return 0;
  }
}

- (BOOL)moveOldVersionFromPath:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  char v7 = [(BRCAccountSession *)self->_session clientDB];
  [v7 assertOnQueue];

  unsigned int v35 = 0;
  uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v9 = [v8 UUIDString];

  if (([v6 exists] & 1) == 0)
  {
    int v15 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 22);
    if (v15)
    {
      int v16 = brc_bread_crumbs();
      uint64_t v17 = brc_default_log();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        uint64_t v24 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        unsigned int v37 = "-[BRCStageRegistry(LegacyAdditions) moveOldVersionFromPath:error:]";
        __int16 v38 = 2080;
        if (!a4) {
          uint64_t v24 = "(ignored by caller)";
        }
        uint64_t v39 = v24;
        __int16 v40 = 2112;
        __int16 v41 = v15;
        __int16 v42 = 2112;
        __int16 v43 = v16;
        _os_log_error_impl(&dword_1D353B000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v15;
    }

    brc_bread_crumbs();
    __int16 v18 = (char *)objc_claimAutoreleasedReturnValue();
    BOOL v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      unsigned int v37 = v6;
      __int16 v38 = 2112;
      uint64_t v39 = v18;
      _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Abort making live: path doesn't exist %@%@", buf, 0x16u);
    }

    goto LABEL_22;
  }
  if (![(BRCStageRegistry *)self _flockToMakeLiveAtPath:v6 error:a4])
  {
LABEL_22:
    BOOL v14 = 0;
    goto LABEL_23;
  }
  if (!v6)
  {
    __int16 v26 = brc_bread_crumbs();
    uint64_t v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader fseventAtPath:flags:unresolvedLastPathComponent:]();
    }
  }
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  uint64_t v30 = __66__BRCStageRegistry_LegacyAdditions__moveOldVersionFromPath_error___block_invoke;
  uint64_t v31 = &unk_1E699A330;
  uint64_t v32 = self;
  uint64_t v10 = v6;
  uint64_t v33 = v10;
  id v11 = v9;
  id v34 = v11;
  if (([v10 performOnOpenParentFileDescriptor:&v28 error:&v35] & 1) == 0)
  {
    __int16 v20 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", v35, v28, v29, v30, v31, v32);
    if (v20)
    {
      uint64_t v21 = brc_bread_crumbs();
      uint64_t v22 = brc_default_log();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        int v25 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        unsigned int v37 = "-[BRCStageRegistry(LegacyAdditions) moveOldVersionFromPath:error:]";
        __int16 v38 = 2080;
        if (!a4) {
          int v25 = "(ignored by caller)";
        }
        uint64_t v39 = v25;
        __int16 v40 = 2112;
        __int16 v41 = v20;
        __int16 v42 = 2112;
        __int16 v43 = v21;
        _os_log_error_impl(&dword_1D353B000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v20;
    }

    goto LABEL_22;
  }

  uint64_t v12 = brc_bread_crumbs();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    unsigned int v37 = v10;
    __int16 v38 = 2112;
    uint64_t v39 = (const char *)v11;
    __int16 v40 = 2112;
    __int16 v41 = v12;
    _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] moved from %@\nto '%@' in old version stage%@", buf, 0x20u);
  }

  BOOL v14 = 1;
LABEL_23:

  return v14;
}

uint64_t __66__BRCStageRegistry_LegacyAdditions__moveOldVersionFromPath_error___block_invoke(uint64_t a1, int a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__BRCStageRegistry_LegacyAdditions__moveOldVersionFromPath_error___block_invoke_2;
  v6[3] = &unk_1E699A308;
  int v9 = a2;
  uint64_t v3 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  if (([v3 _performInStageDirectory:2 block:v6] & 0x80000000) != 0) {
    uint64_t v4 = *__error();
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __66__BRCStageRegistry_LegacyAdditions__moveOldVersionFromPath_error___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v4 = *(_DWORD *)(a1 + 48);
  uint64_t v5 = [*(id *)(a1 + 32) filename];
  int v6 = BRCRenameAt(v4, v5, a2, *(void **)(a1 + 40), 0);

  uint64_t result = 0;
  if (v6 < 0)
  {
    id v8 = brc_bread_crumbs();
    int v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = *(_DWORD *)(a1 + 48);
      id v11 = [*(id *)(a1 + 32) filename];
      uint64_t v12 = *(void *)(a1 + 40);
      int v13 = *__error();
      v14[0] = 67110402;
      v14[1] = v10;
      __int16 v15 = 2112;
      int v16 = v11;
      __int16 v17 = 1024;
      int v18 = a2;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      __int16 v21 = 1024;
      int v22 = v13;
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] renameat(%d, '%@', %d, '%@') failed %{errno}d%@", (uint8_t *)v14, 0x32u);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

- (void)forgetWatchedLockedFileID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCAccountSession *)self->_session clientDB];
  [v5 assertOnQueue];

  int v6 = [(NSMutableDictionary *)self->_watchedLockedFileIDs objectForKeyedSubscript:v4];
  if (v6)
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCStageRegistry(LegacyAdditions) forgetWatchedLockedFileID:]();
    }

    int v9 = -[BRCAccountSession globalItemByFileID:](self->_session, "globalItemByFileID:", [v4 unsignedLongLongValue]);
    int v10 = [v9 clientZone];
    id v11 = [v9 itemID];
    uint64_t v12 = [v10 serverItemByItemID:v11];

    if (v12)
    {
      int v13 = [(BRCAccountSession *)self->_session applyScheduler];
      [v13 setState:1 forServerItem:v12 localItem:v9];
    }
    dispatch_source_cancel(v6);
    int handle = dispatch_source_get_handle(v6);
    close(handle);
    [(NSMutableDictionary *)self->_watchedLockedFileIDs setObject:0 forKeyedSubscript:v4];
  }
}

- (void)forgetWatchedLockedFileIDsForAppLibrary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(BRCAccountSession *)self->_session clientDB];
  [v5 assertOnQueue];

  int v6 = (void *)[(NSMutableDictionary *)self->_watchedLockedFileIDs copy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v13 = -[BRCAccountSession globalItemByFileID:](self->_session, "globalItemByFileID:", objc_msgSend(v12, "unsignedLongLongValue", (void)v16));
        BOOL v14 = v13;
        if (!v4
          || ([v13 appLibrary],
              id v15 = (id)objc_claimAutoreleasedReturnValue(),
              v15,
              v15 == v4))
        {
          [(BRCStageRegistry *)self forgetWatchedLockedFileID:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (BOOL)moveFromStage:(unint64_t)a3 toPath:(id)a4 fileName:(id)a5 error:(id *)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  char v34 = 0;
  unsigned int v33 = 0;
  uint64_t v12 = [(BRCStageRegistry *)self _pathInStage:a3 index:&v34 generationID:0];
  int v13 = v12;
  if (!v12)
  {
    BOOL v14 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 70);
    if (v14)
    {
      id v15 = brc_bread_crumbs();
      long long v16 = brc_default_log();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      {
        long long v17 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        unint64_t v36 = "-[BRCStageRegistry(LegacyAdditions) moveFromStage:toPath:fileName:error:]";
        __int16 v37 = 2080;
        if (!a6) {
          long long v17 = "(ignored by caller)";
        }
        goto LABEL_25;
      }
LABEL_10:
    }
LABEL_11:
    if (a6) {
      *a6 = v14;
    }

    char v18 = 0;
    goto LABEL_22;
  }
  if ((v34 & 0xFB) != 0)
  {
    BOOL v14 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 70);
    if (v14)
    {
      id v15 = brc_bread_crumbs();
      long long v16 = brc_default_log();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      {
        long long v17 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        unint64_t v36 = "-[BRCStageRegistry(LegacyAdditions) moveFromStage:toPath:fileName:error:]";
        __int16 v37 = 2080;
        if (!a6) {
          long long v17 = "(ignored by caller)";
        }
LABEL_25:
        __int16 v38 = v17;
        __int16 v39 = 2112;
        __int16 v40 = v14;
        __int16 v41 = 2112;
        __int16 v42 = v15;
        _os_log_error_impl(&dword_1D353B000, v16, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  __int16 v26 = __73__BRCStageRegistry_LegacyAdditions__moveFromStage_toPath_fileName_error___block_invoke;
  uint64_t v27 = &unk_1E699A358;
  uint64_t v28 = self;
  id v29 = v12;
  id v30 = v11;
  unint64_t v32 = a3;
  id v31 = v10;
  char v18 = [v31 performOnOpenParentFileDescriptor:&v24 error:&v33];
  if ((v18 & 1) == 0)
  {
    long long v19 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", v33, v24, v25, v26, v27, v28, v29, v30);
    if (v19)
    {
      uint64_t v20 = brc_bread_crumbs();
      uint64_t v21 = brc_default_log();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      {
        __int16 v23 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        unint64_t v36 = "-[BRCStageRegistry(LegacyAdditions) moveFromStage:toPath:fileName:error:]";
        __int16 v37 = 2080;
        if (!a6) {
          __int16 v23 = "(ignored by caller)";
        }
        __int16 v38 = v23;
        __int16 v39 = 2112;
        __int16 v40 = v19;
        __int16 v41 = 2112;
        __int16 v42 = v20;
        _os_log_error_impl(&dword_1D353B000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a6) {
      *a6 = v19;
    }
  }
LABEL_22:

  return v18;
}

uint64_t __73__BRCStageRegistry_LegacyAdditions__moveFromStage_toPath_fileName_error___block_invoke(uint64_t a1, int a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) volume];
  if ([v4 hasRenameExcl]) {
    unsigned int v5 = 4;
  }
  else {
    unsigned int v5 = 0;
  }

  if ((BRCRenameAt(-1, *(void **)(a1 + 40), a2, *(void **)(a1 + 48), v5) & 0x80000000) != 0)
  {
    uint64_t v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 64);
      int v17 = *__error();
      int v18 = 138413826;
      uint64_t v19 = v14;
      __int16 v20 = 1024;
      *(_DWORD *)uint64_t v21 = a2;
      *(_WORD *)&v21[4] = 2112;
      *(void *)&v21[6] = v15;
      *(_WORD *)&unsigned char v21[14] = 1024;
      *(_DWORD *)&v21[16] = v5;
      *(_WORD *)int v22 = 2048;
      *(void *)&v22[2] = v16;
      __int16 v23 = 1024;
      int v24 = v17;
      __int16 v25 = 2112;
      __int16 v26 = v9;
      _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] renameatx_np(-1, '%@', %d, '%@', %u) failed for fileID=%llu,  %{errno}d%@", (uint8_t *)&v18, 0x3Cu);
    }

    return *__error();
  }
  else
  {
    int v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = [*(id *)(a1 + 56) parentFileID];
      int v18 = 138413058;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      *(void *)uint64_t v21 = v12;
      *(_WORD *)&v21[8] = 2048;
      *(void *)&v21[10] = v13;
      *(_WORD *)&v21[18] = 2112;
      *(void *)int v22 = v6;
      _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] renamed from '%@' to '%@' in parentFileID:%llu%@", (uint8_t *)&v18, 0x2Au);
    }

    return 0;
  }
}

- (BOOL)moveToGraveyardFromPath:(id)a3 forItemID:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unsigned int v29 = 0;
  if (!v8)
  {
    __int16 v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader fseventAtPath:flags:unresolvedLastPathComponent:]();
    }
  }
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  int v24 = __77__BRCStageRegistry_LegacyAdditions__moveToGraveyardFromPath_forItemID_error___block_invoke;
  __int16 v25 = &unk_1E699A330;
  id v10 = v8;
  id v26 = v10;
  uint64_t v27 = self;
  id v11 = v9;
  id v28 = v11;
  char v12 = [v10 performOnOpenParentFileDescriptor:&v22 error:&v29];
  if (v12)
  {

    brc_bread_crumbs();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v31 = (const char *)v10;
      __int16 v32 = 2112;
      unsigned int v33 = (const char *)v11;
      __int16 v34 = 2112;
      id v35 = v13;
      _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] moved from %@\nto '%@' in graveyard%@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", v29, v22, v23, v24, v25);
    if (v15)
    {
      uint64_t v16 = brc_bread_crumbs();
      int v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v19 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        id v31 = "-[BRCStageRegistry(LegacyAdditions) moveToGraveyardFromPath:forItemID:error:]";
        __int16 v32 = 2080;
        if (!a5) {
          uint64_t v19 = "(ignored by caller)";
        }
        unsigned int v33 = v19;
        __int16 v34 = 2112;
        id v35 = v15;
        __int16 v36 = 2112;
        __int16 v37 = v16;
        _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5) {
      *a5 = v15;
    }

    id v13 = v26;
  }

  return v12;
}

uint64_t __77__BRCStageRegistry_LegacyAdditions__moveToGraveyardFromPath_forItemID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (([*(id *)(a1 + 32) exists] & 1) == 0)
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __77__BRCStageRegistry_LegacyAdditions__moveToGraveyardFromPath_forItemID_error___block_invoke_cold_2();
    }

    return 0;
  }
  if (![*(id *)(a1 + 32) isBusy])
  {
    id v9 = *(void **)(a1 + 40);
    id v10 = [*(id *)(a1 + 32) filename];
    char v11 = [v9 _graveyardAt:a2 path:v10 forItemID:*(void *)(a1 + 48)];

    if ((v11 & 1) == 0) {
      return *__error();
    }
    return 0;
  }
  id v4 = brc_bread_crumbs();
  unsigned int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __77__BRCStageRegistry_LegacyAdditions__moveToGraveyardFromPath_forItemID_error___block_invoke_cold_1();
  }

  return 16;
}

- (BOOL)transferDocumentID:(unsigned int)a3 fromOldVersionStage:(unint64_t)a4 toStage:(unint64_t)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v33 = 0;
  int v32 = 0;
  uint64_t v9 = BRCOpenByID(self->_deviceID, a4, 33028);
  if ((v9 & 0x80000000) != 0)
  {
    uint64_t v16 = brc_bread_crumbs();
    int v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v27 = *__error();
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)id v35 = a3;
      *(_WORD *)&v35[4] = 2048;
      *(void *)&v35[6] = a4;
      __int16 v36 = 2048;
      *(void *)__int16 v37 = a5;
      *(_WORD *)&v37[8] = 1024;
      *(_DWORD *)&v37[10] = v27;
      *(_WORD *)&v37[14] = 2112;
      *(void *)&v37[16] = v16;
      _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] can't open src to transfer documentID:%u from fileID:%llu to fileID:%llu %{errno}d%@", buf, 0x2Cu);
    }

    return 0;
  }
  int v10 = v9;
  if ((_fstatItem(v9, 0, 0, &v32, &v33, 0) & 0x80000000) != 0)
  {
LABEL_23:
    close(v10);
    return 0;
  }
  if (v33 != self->_stageDirectoryFileID[2])
  {
    int v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = v33;
      int v21 = *__error();
      *(_DWORD *)buf = 134219266;
      *(void *)id v35 = v20;
      *(_WORD *)&v35[8] = 1024;
      *(_DWORD *)&v35[10] = a3;
      __int16 v36 = 2048;
      *(void *)__int16 v37 = a4;
      *(_WORD *)&v37[8] = 2048;
      *(void *)&v37[10] = a5;
      *(_WORD *)&v37[18] = 1024;
      *(_DWORD *)&v37[20] = v21;
      __int16 v38 = 2112;
      __int16 v39 = v18;
      uint64_t v22 = "[DEBUG] src parentFileID:%llu not in graveyard, can't transfer documentID:%u from fileID:%llu to fileID:%llu %{errno}d%@";
      uint64_t v23 = v19;
      uint32_t v24 = 54;
LABEL_21:
      _os_log_debug_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEBUG, v22, buf, v24);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  if (v32 != a3)
  {
    int v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219010;
      *(void *)id v35 = a4;
      *(_WORD *)&v35[8] = 1024;
      *(_DWORD *)&v35[10] = a3;
      __int16 v36 = 1024;
      *(_DWORD *)__int16 v37 = v32;
      *(_WORD *)&v37[4] = 2048;
      *(void *)&v37[6] = a5;
      *(_WORD *)&v37[14] = 2112;
      *(void *)&v37[16] = v18;
      uint64_t v22 = "[DEBUG] documentID mismatch on fileID:%llu (expected:%u actual:%u) not transferring to fileID:%llu%@";
LABEL_20:
      uint64_t v23 = v19;
      uint32_t v24 = 44;
      goto LABEL_21;
    }
LABEL_22:

    goto LABEL_23;
  }
  uint64_t v11 = BRCOpenByID(self->_deviceID, a5, 33028);
  int v31 = v11;
  if ((v11 & 0x80000000) != 0)
  {
    int v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      int v25 = *__error();
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)id v35 = a3;
      *(_WORD *)&v35[4] = 2048;
      *(void *)&v35[6] = a4;
      __int16 v36 = 2048;
      *(void *)__int16 v37 = a5;
      *(_WORD *)&v37[8] = 1024;
      *(_DWORD *)&v37[10] = v25;
      *(_WORD *)&v37[14] = 2112;
      *(void *)&v37[16] = v18;
      uint64_t v22 = "[DEBUG] can't open dst to transfer documentID:%u from fileID:%llu to fileID:%llu %{errno}d%@";
      goto LABEL_20;
    }
    goto LABEL_22;
  }
  int v12 = v11;
  if ((_fstatItem(v11, 0, 0, 0, &v33, 0) & 0x80000000) != 0)
  {
    int v26 = v12;
LABEL_29:
    close(v26);
    goto LABEL_23;
  }
  if (ffsctl(v10, 0x80046820uLL, &v31, 0) < 0)
  {
    int v28 = *__error();
    unsigned int v29 = brc_bread_crumbs();
    id v30 = brc_default_log();
    if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)id v35 = a3;
      *(_WORD *)&v35[4] = 2048;
      *(void *)&v35[6] = a4;
      __int16 v36 = 2048;
      *(void *)__int16 v37 = a5;
      *(_WORD *)&v37[8] = 1024;
      *(_DWORD *)&v37[10] = v28;
      *(_WORD *)&v37[14] = 2112;
      *(void *)&v37[16] = v29;
      _os_log_error_impl(&dword_1D353B000, v30, (os_log_type_t)0x90u, "[ERROR] failed transferring documentID:%u from fileID:%llu to fileID:%llu %{errno}d%@", buf, 0x2Cu);
    }

    *__error() = v28;
    int v26 = v31;
    goto LABEL_29;
  }
  id v13 = brc_bread_crumbs();
  uint64_t v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)id v35 = a3;
    *(_WORD *)&v35[4] = 2048;
    *(void *)&v35[6] = a4;
    __int16 v36 = 2048;
    *(void *)__int16 v37 = a5;
    *(_WORD *)&v37[8] = 2112;
    *(void *)&v37[10] = v13;
    _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] transferred documentID:%u from fileID:%llu to fileID:%llu%@", buf, 0x26u);
  }

  close(v31);
  close(v10);
  return 1;
}

- (BOOL)didFlushStagedFileID:(unint64_t)a3
{
  if (!a3)
  {
    id v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCStageRegistry(LegacyAdditions) didFlushStagedFileID:]();
    }
  }
  unflushedStagedFileIDs = self->_unflushedStagedFileIDs;
  int v6 = [NSNumber numberWithUnsignedLongLong:a3];
  LOBYTE(unflushedStagedFileIDs) = [(NSMutableSet *)unflushedStagedFileIDs containsObject:v6] ^ 1;

  return (char)unflushedStagedFileIDs;
}

- (BOOL)makeDirectoryInStageGatherFileID:(unint64_t *)a3 generationID:(unsigned int *)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89__BRCStageRegistry_LegacyAdditions__makeDirectoryInStageGatherFileID_generationID_error___block_invoke;
  v12[3] = &__block_descriptor_48_e8_i12__0i8l;
  void v12[4] = a3;
  v12[5] = a4;
  int v6 = [(BRCStageRegistry *)self _performInStageDirectory:0 block:v12];
  if (v6 < 0)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
    if (v7)
    {
      id v8 = brc_bread_crumbs();
      uint64_t v9 = brc_default_log();
      if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      {
        uint64_t v11 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v14 = "-[BRCStageRegistry(LegacyAdditions) makeDirectoryInStageGatherFileID:generationID:error:]";
        __int16 v15 = 2080;
        if (!a5) {
          uint64_t v11 = "(ignored by caller)";
        }
        uint64_t v16 = v11;
        __int16 v17 = 2112;
        int v18 = v7;
        __int16 v19 = 2112;
        uint64_t v20 = v8;
        _os_log_error_impl(&dword_1D353B000, v9, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5) {
      *a5 = v7;
    }
  }
  return v6 >= 0;
}

uint64_t __89__BRCStageRegistry_LegacyAdditions__makeDirectoryInStageGatherFileID_generationID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F29128] UUID];
  unsigned int v5 = [v4 UUIDString];

  if ((BRCMkdirAt(a2, v5, 493) & 0x80000000) != 0)
  {
    int v17 = *__error();
    int v18 = brc_bread_crumbs();
    __int16 v19 = brc_default_log();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      int v24 = 67109890;
      int v25 = a2;
      __int16 v26 = 2112;
      id v27 = v5;
      __int16 v28 = 1024;
      int v29 = v17;
      __int16 v30 = 2112;
      int v31 = v18;
      _os_log_error_impl(&dword_1D353B000, v19, (os_log_type_t)0x90u, "[ERROR] mkdirat(%d, '%@') failed %{errno}d%@", (uint8_t *)&v24, 0x22u);
    }

    *__error() = v17;
    goto LABEL_10;
  }
  id v6 = v5;
  id v7 = (const char *)[v6 fileSystemRepresentation];
  uint64_t v13 = BRCOpenAt(a2, v7, 33028, v8, v9, v10, v11, v12, v24);
  if ((v13 & 0x80000000) != 0)
  {
    int v20 = *__error();
    uint64_t v21 = brc_bread_crumbs();
    uint64_t v22 = brc_default_log();
    if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
    {
      int v24 = 67109890;
      int v25 = a2;
      __int16 v26 = 2112;
      id v27 = v6;
      __int16 v28 = 1024;
      int v29 = v20;
      __int16 v30 = 2112;
      int v31 = v21;
      _os_log_error_impl(&dword_1D353B000, v22, (os_log_type_t)0x90u, "[ERROR] openat(%d, '%@') failed %{errno}d%@", (uint8_t *)&v24, 0x22u);
    }

    *__error() = v20;
LABEL_10:
    uint64_t v15 = 0xFFFFFFFFLL;
    goto LABEL_11;
  }
  int v14 = v13;
  uint64_t v15 = _fstatItem(v13, *(void **)(a1 + 32), *(_DWORD **)(a1 + 40), 0, 0, 0);
  int v16 = *__error();
  close(v14);
  *__error() = v16;
LABEL_11:

  return v15;
}

- (BOOL)makeSymlinkWithTarget:(id)a3 inStageGatherFileID:(unint64_t *)a4 generationID:(unsigned int *)a5 error:(id *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __98__BRCStageRegistry_LegacyAdditions__makeSymlinkWithTarget_inStageGatherFileID_generationID_error___block_invoke;
  v18[3] = &unk_1E699A3A0;
  id v11 = v10;
  id v19 = v11;
  int v20 = a4;
  uint64_t v21 = a5;
  int v12 = [(BRCStageRegistry *)self _performInStageDirectory:0 block:v18];
  if (v12 < 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
    if (v13)
    {
      int v14 = brc_bread_crumbs();
      uint64_t v15 = brc_default_log();
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      {
        int v17 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v23 = "-[BRCStageRegistry(LegacyAdditions) makeSymlinkWithTarget:inStageGatherFileID:generationID:error:]";
        __int16 v24 = 2080;
        if (!a6) {
          int v17 = "(ignored by caller)";
        }
        int v25 = v17;
        __int16 v26 = 2112;
        id v27 = v13;
        __int16 v28 = 2112;
        int v29 = v14;
        _os_log_error_impl(&dword_1D353B000, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a6) {
      *a6 = v13;
    }
  }
  return v12 >= 0;
}

uint64_t __98__BRCStageRegistry_LegacyAdditions__makeSymlinkWithTarget_inStageGatherFileID_generationID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F29128] UUID];
  unsigned int v5 = [v4 UUIDString];

  if ((BRCSymlinkAt(*(void **)(a1 + 32), a2, v5) & 0x80000000) != 0)
  {
    int v17 = *__error();
    int v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      int v24 = 138413314;
      *(void *)int v25 = v23;
      *(_WORD *)&v25[8] = 1024;
      *(_DWORD *)&v25[10] = a2;
      __int16 v26 = 2112;
      *(void *)id v27 = v5;
      *(_WORD *)&v27[8] = 1024;
      *(_DWORD *)&v27[10] = v17;
      __int16 v28 = 2112;
      int v29 = v18;
      _os_log_error_impl(&dword_1D353B000, v19, (os_log_type_t)0x90u, "[ERROR] symlinkat('%@', %d, '%@') failed %{errno}d%@", (uint8_t *)&v24, 0x2Cu);
    }

    goto LABEL_10;
  }
  id v6 = v5;
  id v7 = (const char *)[v6 fileSystemRepresentation];
  uint64_t v13 = BRCOpenAt(a2, v7, 32772, v8, v9, v10, v11, v12, v24);
  if ((v13 & 0x80000000) != 0)
  {
    int v17 = *__error();
    int v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
    {
      int v24 = 67109890;
      *(_DWORD *)int v25 = a2;
      *(_WORD *)&v25[4] = 2112;
      *(void *)&v25[6] = v6;
      __int16 v26 = 1024;
      *(_DWORD *)id v27 = v17;
      *(_WORD *)&v27[4] = 2112;
      *(void *)&v27[6] = v20;
      _os_log_error_impl(&dword_1D353B000, v21, (os_log_type_t)0x90u, "[ERROR] openat(%d, '%@') failed %{errno}d%@", (uint8_t *)&v24, 0x22u);
    }

LABEL_10:
    *__error() = v17;
    uint64_t v15 = 0xFFFFFFFFLL;
    goto LABEL_11;
  }
  int v14 = v13;
  uint64_t v15 = _fstatItem(v13, *(void **)(a1 + 40), *(_DWORD **)(a1 + 48), 0, 0, 0);
  int v16 = *__error();
  close(v14);
  *__error() = v16;
LABEL_11:

  return v15;
}

- (void)applyMetadataOnFileDescriptor:(int)a3 liveFileDescriptor:(int)a4 itemID:(id)a5 clientZone:(id)a6 statInfo:(id)a7 version:(id)a8 sharingOptions:(unint64_t)a9
{
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  id v138 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  int v17 = self;
  id v18 = [(BRCAccountSession *)self->_session clientDB];
  [v18 assertOnQueue];

  if (!v14)
  {
    id v19 = brc_bread_crumbs();
    int v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      v155.dev_t st_dev = 138412802;
      *(void *)&v155.st_mode = v15;
      WORD2(v155.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&v155.st_ino + 6) = (__darwin_ino64_t)v16;
      HIWORD(v155.st_gid) = 2112;
      *(void *)&v155.st_rdev = v19;
      _os_log_fault_impl(&dword_1D353B000, v20, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: nil client zone when applying %@ and %@%@", (uint8_t *)&v155, 0x20u);
    }
  }
  int v154 = 0;
  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  long long v149 = 0u;
  uint64_t v21 = 0;
  unsigned int v22 = [v15 type] + 1;
  unsigned int fd = a3;
  if (v22 > 0xB)
  {
    int v23 = 0;
  }
  else if (((1 << v22) & 0x38C) != 0)
  {
    int v23 = [v16 isPackage];
    uint64_t v21 = 1;
  }
  else if (((1 << v22) & 0xC22) != 0)
  {
    uint64_t v21 = 0;
    int v23 = 1;
  }
  else
  {
    int v23 = 0;
    if (!v22)
    {
      int v29 = brc_bread_crumbs();
      uint64_t v30 = brc_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:]3();
      }

      uint64_t v21 = 0;
      int v23 = 0;
    }
  }
  int v154 = 0;
  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  long long v149 = 0u;
  v148[1] = 0;
  v148[2] = 0;
  v148[0] = 0x2560000000005;
  *(void *)&long long v149 = [v15 birthtime];
  *(void *)&long long v151 = time(0);
  if (v16) {
    time_t v24 = [v16 mtime];
  }
  else {
    time_t v24 = time(0);
  }
  *(void *)&long long v150 = v24;
  v139 = v16;
  if (((v21 | v23 ^ 1) & 1) == 0
    && (![v15 state] || objc_msgSend(v15, "state") == -1))
  {
    memset(&v155.st_blksize, 0, 32);
    if (a4 >= 0) {
      int v25 = a4;
    }
    else {
      int v25 = a3;
    }
    memset(&v155, 0, 112);
    if (fstat(v25, &v155))
    {
      int v26 = *__error();
      id v27 = brc_bread_crumbs();
      __int16 v28 = brc_default_log();
      if (os_log_type_enabled(v28, (os_log_type_t)0x90u)) {
        -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:]2();
      }

      *__error() = v26;
    }
    else
    {
      __darwin_time_t tv_sec = v155.st_birthtimespec.tv_sec;
      if (BRCIsBusyDate(v155.st_birthtimespec.tv_sec)) {
        *(void *)&long long v149 = tv_sec;
      }
    }
  }
  if (a4 >= 0) {
    int v32 = a4;
  }
  else {
    int v32 = fd;
  }
  fgetxattr(v32, "com.apple.FinderInfo", &v152, 0x20uLL, 0, 0);
  int v33 = [v15 isHiddenExt];
  __int16 v34 = [v15 logicalName];
  id v35 = objc_msgSend(v34, "br_pathExtension");
  int v36 = [v35 isEqualToString:@"app"];

  if (v36 | v33) {
    char v37 = 16;
  }
  else {
    char v37 = 0;
  }
  BYTE9(v152) = BYTE9(v152) & 0xEF | v37;
  __int16 v38 = [v15 finderTags];
  uint64_t v39 = [v38 length];

  if (v39)
  {
    if ((BYTE9(v152) & 0xE) != 0) {
      goto LABEL_41;
    }
    char v40 = BYTE9(v152) & 0xF1 | 2;
  }
  else
  {
    if (![v14 isPrivateZone]) {
      goto LABEL_41;
    }
    char v40 = BYTE9(v152) & 0xF1;
  }
  BYTE9(v152) = v40;
LABEL_41:
  if ((v21 & v23) == 1) {
    BYTE8(v152) |= 0x20u;
  }
  if ([v15 type] == 6) {
    BYTE8(v152) |= 0x80u;
  }
  int v154 = +[BRCStageRegistry computeItemModeFromStatInfo:v15 isPackage:v21 & v23];
  if (fcntl(fd, 64, 3))
  {
    int v41 = *__error();
    __int16 v42 = brc_bread_crumbs();
    uint64_t v43 = brc_default_log();
    if (os_log_type_enabled(v43, (os_log_type_t)0x90u)) {
      -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:]1();
    }

    *__error() = v41;
  }
  uint64_t v44 = [v14 mangledID];
  __int16 v45 = +[BRCUserDefaults defaultsForMangledID:v44];

  v140 = v45;
  if ([v15 type] == 4)
  {
    int v46 = [v45 stageFSRootUmask];
  }
  else if ((v23 & 1) != 0 || [v139 isPackage])
  {
    int v46 = [v45 stageDirectoryUmask];
  }
  else
  {
    int v46 = [v45 stageFileUmask];
  }
  v154 &= ~v46;
  uint64_t v47 = [v15 trashPutBackPath];
  id v48 = [v47 pathComponents];
  int v49 = [v48 containsObject:@".Trash"];

  uint64_t v50 = fd;
  if (v49)
  {
    __int16 v51 = brc_bread_crumbs();
    __int16 v52 = brc_default_log();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
      -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:].cold.8(v15, (uint64_t)v51, v52);
    }
LABEL_65:

    goto LABEL_66;
  }
  id v53 = [v15 trashPutBackPath];
  int v54 = brc_set_or_remove_xattr(fd, "com.apple.trash.put-back.path#PS", (char *)[v53 fileSystemRepresentation]);

  if (v54)
  {
    __int16 v55 = brc_bread_crumbs();
    int v56 = brc_default_log();
    if (os_log_type_enabled(v56, (os_log_type_t)0x90u)) {
      -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:]0();
    }
  }
  uint64_t v57 = [v15 trashPutBackParentID];
  id v58 = [v57 zoneUniqueItemIDStringWithSession:v17->_session];
  int v59 = brc_set_or_remove_xattr(fd, "com.apple.trash.put-back.icloud-parent-id#PS", (char *)[v58 UTF8String]);

  if (v59)
  {
    __int16 v51 = brc_bread_crumbs();
    __int16 v52 = brc_default_log();
    if (os_log_type_enabled(v52, (os_log_type_t)0x90u)) {
      -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:].cold.9();
    }
    goto LABEL_65;
  }
LABEL_66:
  if ([v15 favoriteRank])
  {
    int v60 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v15, "favoriteRank"));
    id v61 = [v60 stringValue];
    int v62 = brc_set_or_remove_xattr(fd, "com.apple.favorite-rank.number#PS", (char *)[v61 UTF8String]);

    if (!v62) {
      goto LABEL_68;
    }
  }
  else if (!brc_set_or_remove_xattr(fd, "com.apple.favorite-rank.number#PS", 0))
  {
LABEL_68:
    if ((a9 & 4) == 0) {
      goto LABEL_76;
    }
    goto LABEL_74;
  }
  __int16 v63 = brc_bread_crumbs();
  int v64 = brc_default_log();
  if (os_log_type_enabled(v64, (os_log_type_t)0x90u)) {
    -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:].cold.7();
  }

  if ((a9 & 4) == 0) {
    goto LABEL_76;
  }
LABEL_74:
  if ([v14 isSharedZone])
  {
    __int16 v65 = NSString;
    int v66 = [v138 itemIDString];
    __int16 v67 = [v14 serverZone];
    int v68 = [v65 bookmarkDataWithItemResolutionString:v66 serverZone:v67];

    goto LABEL_77;
  }
LABEL_76:
  int v68 = 0;
LABEL_77:
  id v134 = v68;
  __int16 v69 = (char *)[v134 UTF8String];
  if (brc_set_or_remove_xattr(fd, "com.apple.clouddocs.private.share-bookmark#B", v69))
  {
    if (!v69) {
      brc_set_or_remove_xattr_data(fd, "com.apple.finder.copy.preserveinbackups.com.apple.clouddocs.private.share-bookmark#N", 0, 0);
    }
    int v70 = brc_bread_crumbs();
    __int16 v71 = brc_default_log();
    if (os_log_type_enabled(v71, (os_log_type_t)0x90u)) {
      -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:].cold.6();
    }
  }
  if ([v15 lastUsedTime])
  {
    *(void *)&v155.dev_t st_dev = 0;
    v155.st_ino = 0;
    *(void *)&v155.dev_t st_dev = [v15 lastUsedTime];
    v155.st_ino = 0;
    if ((MEMORY[0x1D9437710](fd, 0, &v155) & 0x80000000) == 0) {
      goto LABEL_92;
    }
    int v72 = brc_bread_crumbs();
    __int16 v73 = brc_default_log();
    if (os_log_type_enabled(v73, (os_log_type_t)0x90u)) {
      -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:].cold.5();
    }
    goto LABEL_91;
  }
  if (fremovexattr(fd, "com.apple.lastuseddate#PS", 0) < 0 && *__error() != 93)
  {
    int v72 = brc_bread_crumbs();
    __int16 v73 = brc_default_log();
    if (os_log_type_enabled(v73, (os_log_type_t)0x90u)) {
      -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:].cold.4();
    }
LABEL_91:
  }
LABEL_92:
  id v137 = v14;
  id v147 = 0;
  BOOL v74 = +[BRFieldXattrBlob removeXattrsOnFD:fd includingContentRelated:v21 error:&v147];
  id v75 = v147;
  if (!v74)
  {
    uint64_t v76 = brc_bread_crumbs();
    __int16 v77 = brc_default_log();
    if (os_log_type_enabled(v77, (os_log_type_t)0x90u)) {
      -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:]();
    }
  }
  uint64_t v78 = [(BRCAccountSession *)v17->_session stageRegistry];
  __int16 v79 = [v15 lazyXattrWithStageRegistry:v78];

  if (v79)
  {
    uint64_t v80 = [[BRFieldXattrBlob alloc] initWithData:v79];
    id v146 = v75;
    BOOL v81 = [(BRFieldXattrBlob *)v80 applyToFileDescriptor:fd error:&v146];
    id v82 = v146;

    if (!v81)
    {
      __int16 v83 = brc_bread_crumbs();
      v84 = brc_default_log();
      if (os_log_type_enabled(v84, (os_log_type_t)0x90u))
      {
        v136 = [v15 xattrSignature];
        __int16 v128 = objc_msgSend(v136, "brc_hexadecimalString");
        v155.dev_t st_dev = 138412802;
        *(void *)&v155.st_mode = v128;
        WORD2(v155.st_ino) = 2112;
        *(__darwin_ino64_t *)((char *)&v155.st_ino + 6) = (__darwin_ino64_t)v82;
        HIWORD(v155.st_gid) = 2112;
        *(void *)&v155.st_rdev = v83;
        _os_log_error_impl(&dword_1D353B000, v84, (os_log_type_t)0x90u, "[ERROR] Unable to set structural xattrs for signature %@: %@%@", (uint8_t *)&v155, 0x20u);
      }
      uint64_t v50 = fd;
    }
  }
  else
  {
    uint64_t v80 = 0;
    id v82 = v75;
  }
  uint64_t v85 = [(BRCAccountSession *)v17->_session stageRegistry];
  uint32_t v86 = v139;
  v87 = [v139 lazyXattrWithStageRegistry:v85];

  if (v87)
  {
    v88 = [[BRFieldXattrBlob alloc] initWithData:v87];

    id v145 = v82;
    BOOL v89 = [(BRFieldXattrBlob *)v88 applyToFileDescriptor:v50 error:&v145];
    id v135 = v145;

    unsigned __int16 v90 = v138;
    if (v89)
    {
      unsigned __int16 v91 = v137;
    }
    else
    {
      id v92 = brc_bread_crumbs();
      stat v93 = brc_default_log();
      unsigned __int16 v91 = v137;
      if (os_log_type_enabled(v93, (os_log_type_t)0x90u))
      {
        v129 = [v139 xattrSignature];
        __int16 v130 = objc_msgSend(v129, "brc_hexadecimalString");
        v155.dev_t st_dev = 138412802;
        *(void *)&v155.st_mode = v130;
        WORD2(v155.st_ino) = 2112;
        *(__darwin_ino64_t *)((char *)&v155.st_ino + 6) = (__darwin_ino64_t)v135;
        HIWORD(v155.st_gid) = 2112;
        *(void *)&v155.st_rdev = v92;
        _os_log_error_impl(&dword_1D353B000, v93, (os_log_type_t)0x90u, "[ERROR] Unable to set structural xattrs for signature %@: %@%@", (uint8_t *)&v155, 0x20u);

        uint32_t v86 = v139;
      }
    }
  }
  else
  {
    v88 = v80;
    id v135 = v82;
    unsigned __int16 v91 = v137;
    unsigned __int16 v90 = v138;
  }
  v94 = [v15 finderTags];
  uint64_t v95 = [v94 length];

  if (v95)
  {
    __int16 v96 = [BRFieldFinderTags alloc];
    int v97 = [v15 finderTags];
    __int16 v98 = [(BRFieldFinderTags *)v96 initWithData:v97];

    int v99 = (void *)MEMORY[0x1E4F28DB0];
    __int16 v100 = [(BRFieldFinderTags *)v98 tags];
    int v101 = [v99 archivedDataWithRootObject:v100 requiringSecureCoding:1 error:0];

    id v102 = v101;
    brc_set_or_remove_xattr_data(v50, "com.apple.metadata:_kMDItemUserTags", (const void *)[v102 bytes], objc_msgSend(v102, "length"));
  }
  else
  {
    fremovexattr(v50, "com.apple.metadata:_kMDItemUserTags", 0);
  }
  uint64_t v103 = [v140 maxPreservedXattrBlobSize];
  if ((a4 & 0x80000000) == 0)
  {
    ssize_t v104 = v103;
    if (v103)
    {
      v133 = v87;
      id v144 = 0;
      int v105 = (void *)[(id)objc_opt_new() initWithFD:a4 sizeLimit:v103 syncable:0 error:&v144];
      id v106 = v144;
      v131 = v105;
      uint64_t v132 = v88;
      if (v105)
      {
        id v107 = v105;
        __int16 v108 = (const char **)[v107 structuralXattrNamesBegin];
        unsigned int v109 = [v107 structuralXattrNamesCount];
        if (v109)
        {
          uint64_t v110 = v109;
          do
          {
            int v111 = v106;
            __int16 v112 = *v108;
            id v143 = v106;
            int v113 = BRCGetXattrValue(a4, v112, v104, &v143);
            id v106 = v143;

            if (v113)
            {
              __int16 v114 = *v108;
              id v115 = v113;
              if (fsetxattr(fd, v114, (const void *)[v115 bytes], objc_msgSend(v115, "length"), 0, 2)
                && *__error() != 17)
              {
                int v116 = *__error();
                v117 = brc_bread_crumbs();
                __int16 v118 = brc_default_log();
                if (os_log_type_enabled(v118, (os_log_type_t)0x90u))
                {
                  __int16 v122 = *v108;
                  v155.dev_t st_dev = 136315650;
                  *(void *)&v155.st_mode = v122;
                  WORD2(v155.st_ino) = 1024;
                  *(_DWORD *)((char *)&v155.st_ino + 6) = v116;
                  HIWORD(v155.st_uid) = 2112;
                  *(void *)&v155.gid_t st_gid = v117;
                  _os_log_error_impl(&dword_1D353B000, v118, (os_log_type_t)0x90u, "[ERROR] fsetxattr(%s) failed %{errno}d%@", (uint8_t *)&v155, 0x1Cu);
                }

                *__error() = v116;
              }
            }
            else
            {
              v119 = brc_bread_crumbs();
              __int16 v120 = brc_default_log();
              if (os_log_type_enabled(v120, (os_log_type_t)0x90u))
              {
                v121 = *v108;
                v155.dev_t st_dev = 136315650;
                *(void *)&v155.st_mode = v121;
                WORD2(v155.st_ino) = 2112;
                *(__darwin_ino64_t *)((char *)&v155.st_ino + 6) = (__darwin_ino64_t)v106;
                HIWORD(v155.st_gid) = 2112;
                *(void *)&v155.st_rdev = v119;
                _os_log_error_impl(&dword_1D353B000, v120, (os_log_type_t)0x90u, "[ERROR] cannot read xattr '%s': %@%@", (uint8_t *)&v155, 0x20u);
              }
            }
            ++v108;
            --v110;
          }
          while (v110);
        }
      }
      else
      {
        __darwin_time_t v123 = brc_bread_crumbs();
        __int16 v124 = brc_default_log();
        if (os_log_type_enabled(v124, (os_log_type_t)0x90u)) {
          -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:]();
        }
      }
      unsigned __int16 v91 = v137;
      unsigned __int16 v90 = v138;
      uint32_t v86 = v139;
      uint64_t v50 = fd;
      v88 = v132;
      v87 = v133;
    }
  }
  if (BRCFSetAttrList(v50, v148, &v149, 0x54uLL))
  {
    int v125 = *__error();
    __int16 v126 = brc_bread_crumbs();
    v127 = brc_default_log();
    if (os_log_type_enabled(v127, (os_log_type_t)0x90u)) {
      -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:]();
    }

    *__error() = v125;
  }
  +[BRCStageRegistry applySharingReadonlyACLsToFD:v50 statInfo:v15 version:v86 clientZone:v91 sharingOptions:a9];
}

+ (BOOL)applySharingReadonlyACLsToFD:(int)a3 statInfo:(id)a4 version:(id)a5 clientZone:(id)a6 sharingOptions:(unint64_t)a7
{
  char v7 = a7;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  unsigned int v13 = [a4 type];
  if (v13 <= 0xA && ((1 << v13) & 0x611) != 0)
  {
    if (([v12 isPrivateZone] & 1) == 0) {
      goto LABEL_4;
    }
LABEL_29:
    BOOL v28 = 1;
    goto LABEL_30;
  }
  int v23 = [v11 contentSignature];
  if ((objc_msgSend(v23, "brc_signatureIsPackage") & 1) == 0)
  {

    goto LABEL_29;
  }
  char v24 = [v12 isPrivateZone];

  if (v24) {
    goto LABEL_29;
  }
LABEL_4:
  id v14 = acl_init(0);
  acl_t acl_p = v14;
  if ((v7 & 0x20) == 0)
  {
    if (acl_set_fd_np(a3, v14, ACL_TYPE_EXTENDED))
    {
      int v15 = *__error();
      id v16 = brc_bread_crumbs();
      int v17 = brc_default_log();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u)) {
        +[BRCStageRegistry(LegacyAdditions) applySharingReadonlyACLsToFD:statInfo:version:clientZone:sharingOptions:]();
      }

      *__error() = v15;
      free(v14);
      goto LABEL_25;
    }
    goto LABEL_28;
  }
  memset(&v32, 0, sizeof(v32));
  memset(uu, 0, sizeof(uu));
  int v31 = 0;
  if (getgrnam_r("everyone", &v32, v34, 0x400uLL, &v31) || !v31)
  {
    int v25 = *__error();
    int v26 = brc_bread_crumbs();
    id v27 = brc_default_log();
    if (os_log_type_enabled(v27, (os_log_type_t)0x90u)) {
      +[BRCStageRegistry(LegacyAdditions) applySharingReadonlyACLsToFD:statInfo:version:clientZone:sharingOptions:]();
    }

    *__error() = v25;
    acl_t v22 = v14;
  }
  else
  {
    mbr_gid_to_uuid(v31->gr_gid, uu);
    acl_entry_t entry_d = 0;
    acl_create_entry_np(&acl_p, &entry_d, 0);
    if ((v7 & 4) != 0) {
      acl_permset_mask_t v18 = 4;
    }
    else {
      acl_permset_mask_t v18 = 36;
    }
    acl_set_permset_mask_np(entry_d, v18);
    acl_set_tag_type(entry_d, ACL_EXTENDED_DENY);
    acl_set_qualifier(entry_d, uu);
    if (!acl_set_fd_np(a3, acl_p, ACL_TYPE_EXTENDED))
    {
      id v14 = acl_p;
LABEL_28:
      acl_free(v14);
      goto LABEL_29;
    }
    int v19 = *__error();
    int v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u)) {
      +[BRCStageRegistry(LegacyAdditions) applySharingReadonlyACLsToFD:statInfo:version:clientZone:sharingOptions:]();
    }

    *__error() = v19;
    acl_t v22 = acl_p;
  }
  acl_free(v22);
LABEL_25:
  BOOL v28 = 0;
LABEL_30:

  return v28;
}

- (void)_openStageDirectory:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D353B000, log, (os_log_type_t)0x90u, "[ERROR] Can't set data protection %{errno}d%@", (uint8_t *)v3, 0x12u);
}

- (void)_pathInStage:(uint64_t)a1 index:(uint64_t)a2 generationID:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  __error();
  int v6 = 134218498;
  uint64_t v7 = a2;
  OUTLINED_FUNCTION_6_4();
  uint64_t v8 = a1;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] can't open by fileID:%llu %{errno}d%@", (uint8_t *)&v6, 0x1Cu);
}

- (void)pendingFetchRecordDirExistsInStageWithStartingChangeToken:recordZoneID:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _stageDirectoryPath[kBRCStageDirectoryForPendingFetchStream] != nil%@", v2, v3, v4, v5, v6);
}

- (void)existsInStage:generationID:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] fileID:0 doesn't exist in stage (metadata-only update)%@", v2, v3, v4, v5, v6);
}

void __65__BRCStageRegistry_lowDiskStatusChangedForDevice_hasEnoughSpace___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] running GC because we are in low disk space%@", v2, v3, v4, v5, v6);
}

- (void)purgableSpace
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  __error();
  int v6 = 138412802;
  uint64_t v7 = a1;
  OUTLINED_FUNCTION_6_4();
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1D353B000, a3, (os_log_type_t)0x90u, "[ERROR] fts_open(%@) failed %{errno}d%@", (uint8_t *)&v6, 0x1Cu);
}

- (void)purgeGraveyardSpace:(uint64_t)a1 withUrgency:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *(void *)(*(void *)a1 + 24);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Collected %lld bytes from purging the graveyard%@", (void)v3, DWORD2(v3));
}

void __65__BRCStageRegistry__garbageCollectUploadsIncludingActiveUploads___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] removing staged file for upload: %@%@", (void)v3, DWORD2(v3));
}

void __41__BRCStageRegistry__garbageCollectFaults__block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 8);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] removing staged file with id %llu%@", (void)v3, DWORD2(v3));
}

void __55__BRCStageRegistry__processPendingListDatabaseObjects___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_3_1();
  _os_log_fault_impl(&dword_1D353B000, v1, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Unexpected record name %@%@", (uint8_t *)&v2, 0x16u);
}

void __43__BRCStageRegistry__removeUnusedXattrBlobs__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: components.count == 1%@", v2, v3, v4, v5, v6);
}

- (void)_garbageCollectUploadThumbnailsIncludingActiveUploads:(char)a1 .cold.1(char a1)
{
  uint64_t v1 = "YES";
  if ((a1 & 1) == 0) {
    uint64_t v1 = "NO";
  }
  LODWORD(v4) = 136315394;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v2, v3, "[DEBUG] _garbageCollectUploadThumbnailsIncludingActiveUploads: [%s]%@", (void)v4, DWORD2(v4));
}

- (void)garbageCollectSpace:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)os_log_t v3 = 134218242;
  *(void *)&void v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_1(&dword_1D353B000, a2, a3, "[DEBUG] starting garbage collection at %ld%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __63__BRCStageRegistry__updatePersistedStateWithLatestGCStartTime___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 224);
  if (v4) {
    uint64_t v4 = *(void *)(v4 + 16);
  }
  int v5 = 134218498;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] latest GC:%ld; previous GC:%ld%@",
    (uint8_t *)&v5,
    0x20u);
}

void __26__BRCStageRegistry_resume__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _persistedState%@", v2, v3, v4, v5, v6);
}

void __26__BRCStageRegistry_resume__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !_persistedState%@", v2, v3, v4, v5, v6);
}

- (void)saveXattrAtURL:forSignature:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Asked to save xattr without url%@", v2, v3, v4, v5, v6);
}

- (void)saveXattrBlob:(void *)a1 forSignature:error:.cold.1(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v2, v3, "[DEBUG] Saving an xattr signature that already exists! %@%@", v4, v5, v6, v7, v8);
}

- (void)saveXattrBlob:forSignature:error:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Asked to save xattr without signature or data%@", v2, v3, v4, v5, v6);
}

- (void)loadXattrBlobForSignature:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Asked for xattr without signature%@", v2, v3, v4, v5, v6);
}

void __77__BRCStageRegistry_LegacyAdditions__moveToGraveyardFromPath_forItemID_error___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Failing the move to graveyard because the item is busy%@", v1, 0xCu);
}

void __77__BRCStageRegistry_LegacyAdditions__moveToGraveyardFromPath_forItemID_error___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Making the move to the graveyard succeed even though the file doesn't exists anymore%@", v1, 0xCu);
}

@end