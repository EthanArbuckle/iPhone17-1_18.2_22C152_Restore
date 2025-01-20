@interface BRCDownloadVersion
- (BOOL)isLoser;
- (BRCDownloadVersion)initWithDocument:(id)a3 stageID:(id)a4 etag:(id)a5 isLoser:(BOOL)a6;
- (BRCProgress)progress;
- (BRFileObjectID)fileObjectID;
- (GSPermanentStorage)storage;
- (NSError)gsError;
- (id)_stageContentWithSession:(id)a3 error:(id *)a4;
- (id)_stageWithSession:(id)a3 creationInfo:(id *)a4 error:(id *)a5;
- (id)description;
- (id)secondaryRecord;
- (id)secondaryRecordID;
- (int)kind;
- (void)setProgress:(id)a3;
- (void)setSecondaryRecord:(id)a3;
@end

@implementation BRCDownloadVersion

- (int)kind
{
  return 2;
}

- (void)setProgress:(id)a3
{
}

- (BRCProgress)progress
{
  return self->super._progress;
}

- (BRCDownloadVersion)initWithDocument:(id)a3 stageID:(id)a4 etag:(id)a5 isLoser:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isFinderBookmark])
  {
    v36 = brc_bread_crumbs();
    v37 = brc_default_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      -[BRCDownloadVersion initWithDocument:stageID:etag:isLoser:]();
    }
  }
  v39.receiver = self;
  v39.super_class = (Class)BRCDownloadVersion;
  v13 = [(BRCDownload *)&v39 initWithDocument:v10 stageID:v11];
  if (v13)
  {
    v14 = [v10 clientZone];
    char v15 = [v14 isSharedZone];

    if ((v15 & 1) == 0)
    {
      uint64_t v16 = [v10 structureRecordID];
      secondaryRecordID = v13->_secondaryRecordID;
      v13->_secondaryRecordID = (CKRecordID *)v16;
    }
    v18 = [v10 currentVersion];
    uint64_t v19 = [v18 size];
    v20 = [v10 currentVersion];
    v13->super._totalSize = [v20 thumbnailSize] + v19;

    v13->_isLoser = a6;
    objc_storeStrong((id *)&v13->super._etag, a5);
    v21 = [v10 serverZone];
    v13->_sharedZone = [v21 isSharedZone];

    uint64_t v22 = [v10 clientZone];
    clientZone = v13->_clientZone;
    v13->_clientZone = (BRCClientZone *)v22;

    uint64_t v24 = [v10 fileObjectID];
    fileObjectID = v13->_fileObjectID;
    v13->_fileObjectID = (BRFileObjectID *)v24;

    v26 = [[BRCItemToPathLookup alloc] initWithItem:v10];
    v27 = [(BRCItemToPathLookup *)v26 byFileSystemID];
    if (v27)
    {
      v28 = [MEMORY[0x1E4F63BE8] manager];
      v29 = [v27 physicalURL];
      id v38 = 0;
      uint64_t v30 = [v28 permanentStorageForItemAtURL:v29 allocateIfNone:0 error:&v38];
      id v31 = v38;
      storage = v13->_storage;
      v13->_storage = (GSPermanentStorage *)v30;

      if (v13->_storage) {
        goto LABEL_15;
      }
      if (v31)
      {
        int v33 = 0;
        v34 = v31;
        goto LABEL_13;
      }
    }
    else if (v13->_storage)
    {
      id v31 = 0;
LABEL_15:
      [(BRCItemToPathLookup *)v26 closePaths];

      goto LABEL_16;
    }
    v34 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 2);
    id v31 = 0;
    int v33 = 1;
LABEL_13:
    objc_storeStrong((id *)&v13->_gsError, v34);
    if (v33) {

    }
    goto LABEL_15;
  }
LABEL_16:

  return v13;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<dl-version[%lld] %@_%@>", self->super._throttleID, self->super._itemID, self->super._etag];
}

- (id)_stageContentWithSession:(id)a3 error:(id *)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 stageRegistry];
  v8 = [v7 createURLForDownloadWithStageID:self->super._stageID name:@"item"];
  p_record = &self->super._record;
  id v10 = [(CKRecord *)self->super._record objectForKeyedSubscript:@"pkgSignature"];

  record = self->super._record;
  if (!v10)
  {
    v23 = [(CKRecord *)record objectForKeyedSubscript:@"fileContent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v24 = [v23 fileURL];

      if (v24)
      {
        v25 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v26 = [v23 fileURL];
        v27 = a4;
        id v28 = v6;
        v29 = (void *)v26;
        char v30 = [v25 moveItemAtURL:v26 toURL:v8 error:v27];

        id v6 = v28;
        if (v30) {
          goto LABEL_4;
        }
        goto LABEL_27;
      }
      id v38 = v6;
      objc_super v39 = brc_bread_crumbs();
      v40 = brc_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        v45 = [(CKRecord *)*p_record debugDescription];
        *(_DWORD *)buf = 138412802;
        v52 = (const char *)v23;
        __int16 v53 = 2112;
        v54 = v45;
        __int16 v55 = 2112;
        id v56 = v39;
        _os_log_fault_impl(&dword_1D353B000, v40, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: no fileURL for %@ in %@%@", buf, 0x20u);
      }
      v41 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v42 = *MEMORY[0x1E4F59368];
      v43 = [(CKRecord *)*p_record debugDescription];
      objc_msgSend(v41, "br_errorWithDomain:code:description:", v42, 15, @"unreachable: no fileURL for %@ in %@", v23, v43);
      id v33 = (id)objc_claimAutoreleasedReturnValue();

      id v6 = v38;
      if (!v33)
      {
LABEL_24:
        if (a4)
        {
          id v33 = v33;
          *a4 = v33;
        }

LABEL_27:
        id v22 = 0;
        goto LABEL_28;
      }
      v34 = v8;
      v35 = brc_bread_crumbs();
      v36 = brc_default_log();
      if (!os_log_type_enabled(v36, (os_log_type_t)0x90u))
      {
LABEL_23:

        v8 = v34;
        goto LABEL_24;
      }
      v37 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v52 = "-[BRCDownloadVersion _stageContentWithSession:error:]";
      __int16 v53 = 2080;
      if (!a4) {
        v37 = "(ignored by caller)";
      }
    }
    else
    {
      id v31 = brc_bread_crumbs();
      v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        -[BRCDownloadVersion _stageContentWithSession:error:](&self->super._record);
      }

      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: There should be a file content property in %@", *p_record);
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      if (!v33) {
        goto LABEL_24;
      }
      v34 = v8;
      v35 = brc_bread_crumbs();
      v36 = brc_default_log();
      if (!os_log_type_enabled(v36, (os_log_type_t)0x90u)) {
        goto LABEL_23;
      }
      v37 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v52 = "-[BRCDownloadVersion _stageContentWithSession:error:]";
      __int16 v53 = 2080;
      if (!a4) {
        v37 = "(ignored by caller)";
      }
    }
    v54 = v37;
    __int16 v55 = 2112;
    id v56 = v33;
    __int16 v57 = 2112;
    v58 = v35;
    _os_log_error_impl(&dword_1D353B000, v36, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    goto LABEL_23;
  }
  v47 = a4;
  uint64_t v12 = [(CKRecord *)record objectForKeyedSubscript:@"pkgManifest"];
  v13 = [(CKRecord *)*p_record objectForKeyedSubscript:@"pkgContent"];
  v14 = [(CKRecord *)*p_record objectForKeyedSubscript:@"pkgXattrs"];
  v49 = v7;
  char v15 = [v7 createURLForDownloadWithStageID:self->super._stageID name:@"brpackage-extended"];
  id v50 = v6;
  char v16 = ![(CKRecord *)*p_record brc_currentUserOwnsLastEditorDeviceWithSessionContext:v6];
  v48 = (void *)v12;
  v17 = [[BRCPackageManifestReader alloc] initWithAsset:v12];
  v18 = [[BRCPackageManifestWriter alloc] initWithZone:self->_clientZone stageID:self->super._stageID url:v15];
  uint64_t v19 = [(BRCDownload *)self recordID];
  v20 = [v19 recordName];
  LOBYTE(v46) = v16;
  BOOL v21 = [(BRCPackageManifestWriter *)v18 stagePackageWithReader:v17 package:v13 xattrsPackage:v14 stageItemURL:v8 livefd:0xFFFFFFFFLL recordName:v20 isDocumentModifiedByOtherUser:v46];

  if (v21)
  {

    v7 = v49;
    id v6 = v50;
LABEL_4:
    id v22 = v8;
    goto LABEL_28;
  }
  if (v47)
  {
    id *v47 = [(BRCPackageManifestWriter *)v18 error];
  }

  id v22 = 0;
  v7 = v49;
  id v6 = v50;
LABEL_28:

  return v22;
}

- (id)_stageWithSession:(id)a3 creationInfo:(id *)a4 error:(id *)a5
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 clientDB];
  v8 = [v7 serialQueue];
  dispatch_assert_queue_not_V2(v8);

  v9 = [v6 serverDB];
  id v10 = [v9 serialQueue];
  dispatch_assert_queue_not_V2(v10);

  id v11 = self->_secondaryRecord;
  uint64_t v12 = self->super._record;
  uint64_t v119 = 0;
  v120 = &v119;
  uint64_t v121 = 0x3032000000;
  v122 = __Block_byref_object_copy__34;
  v123 = __Block_byref_object_dispose__34;
  id v124 = 0;
  uint64_t v113 = 0;
  v114 = &v113;
  uint64_t v115 = 0x3032000000;
  v116 = __Block_byref_object_copy__34;
  v117 = __Block_byref_object_dispose__34;
  id v118 = 0;
  memset(v112, 0, sizeof(v112));
  __brc_create_section(0, (uint64_t)"-[BRCDownloadVersion _stageWithSession:creationInfo:error:]", 247, v112);
  v13 = brc_bread_crumbs();
  v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int64_t throttleID = self->super._throttleID;
    *(_DWORD *)buf = 134218754;
    *(void *)&uint8_t buf[4] = v112[0];
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = throttleID;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = self;
    *(_WORD *)v128 = 2112;
    *(void *)&v128[2] = v13;
    _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Downloader[%lld] staging %@%@", buf, 0x2Au);
  }

  if (!v12)
  {
    v76 = brc_bread_crumbs();
    v77 = brc_default_log();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
      -[BRCDownloadVersion _stageWithSession:creationInfo:error:].cold.4();
    }
  }
  char v15 = [(CKRecord *)v12 recordID];
  char v16 = [v15 zoneID];
  v17 = [v16 ownerName];
  if ([v17 isEqualToString:*MEMORY[0x1E4F19C08]])
  {
    BOOL v18 = self->_secondaryRecord == 0;

    if (!v18) {
      goto LABEL_10;
    }
    char v15 = brc_bread_crumbs();
    char v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCDownloadVersion _stageWithSession:creationInfo:error:]();
    }
  }
  else
  {
  }
LABEL_10:
  uint64_t v19 = [(CKRecord *)v12 etag];
  char v20 = [v19 isEqualToString:self->super._etag];

  if ((v20 & 1) == 0)
  {
    v78 = brc_bread_crumbs();
    v79 = brc_default_log();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT)) {
      -[BRCDownloadVersion _stageWithSession:creationInfo:error:]();
    }
  }
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x2020000000;
  char v111 = 1;
  uint64_t v102 = 0;
  v103 = &v102;
  uint64_t v104 = 0x3032000000;
  v105 = __Block_byref_object_copy__34;
  v106 = __Block_byref_object_dispose__34;
  id v107 = 0;
  BOOL v21 = [v6 serverDB];
  id v22 = [v21 serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__BRCDownloadVersion__stageWithSession_creationInfo_error___block_invoke;
  block[3] = &unk_1E6998848;
  v98 = &v113;
  v84 = v11;
  v94 = v84;
  v95 = self;
  id v23 = v6;
  id v96 = v23;
  v99 = &v102;
  v100 = &v108;
  uint64_t v24 = v12;
  v97 = v24;
  v101 = &v119;
  dispatch_sync(v22, block);

  if (!*((unsigned char *)v109 + 24))
  {
    id v48 = (id)v103[5];
    if (v48)
    {
      v49 = brc_bread_crumbs();
      id v50 = brc_default_log();
      if (os_log_type_enabled(v50, (os_log_type_t)0x90u))
      {
        v74 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[BRCDownloadVersion _stageWithSession:creationInfo:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a5) {
          v74 = "(ignored by caller)";
        }
        *(void *)&buf[14] = v74;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v48;
        *(_WORD *)v128 = 2112;
        *(void *)&v128[2] = v49;
        _os_log_error_impl(&dword_1D353B000, v50, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5) {
      *a5 = v48;
    }

    goto LABEL_30;
  }
  v25 = brc_bread_crumbs();
  uint64_t v26 = brc_default_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v70 = v114[5];
    uint64_t v71 = v120[5];
    v72 = [(CKRecord *)v84 debugDescription];
    v73 = [(CKRecord *)v24 debugDescription];
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v70;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v71;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v72;
    *(_WORD *)v128 = 2112;
    *(void *)&v128[2] = v73;
    *(_WORD *)&v128[10] = 2112;
    *(void *)&v128[12] = v25;
    _os_log_debug_impl(&dword_1D353B000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] received version %@ %@\n%@\n%@%@", buf, 0x34u);
  }
  v27 = [(BRCDownloadVersion *)self _stageContentWithSession:v23 error:a5];
  if (!v27)
  {
LABEL_30:
    id v28 = 0;
    v51 = 0;
    goto LABEL_49;
  }
  id v28 = v27;
  v29 = (const char *)[v28 fileSystemRepresentation];
  int v35 = BRCOpenAt(0xFFFFFFFFLL, v29, 33028, v30, v31, v32, v33, v34, v80);
  if (v35 < 0)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    int v52 = *__error();
    __int16 v53 = brc_bread_crumbs();
    v54 = brc_default_log();
    if (os_log_type_enabled(v54, (os_log_type_t)0x90u))
    {
      v75 = [v28 path];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v75;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v52;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v53;
      _os_log_error_impl(&dword_1D353B000, v54, (os_log_type_t)0x90u, "[ERROR] Can't open %@ to set metadata %{errno}d%@", buf, 0x1Cu);
    }
    v51 = 0;
    *__error() = v52;
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__34;
    *(void *)v128 = __Block_byref_object_dispose__34;
    *(void *)&v128[8] = 0;
    v36 = [v23 clientDB];
    v37 = [v36 serialQueue];
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __59__BRCDownloadVersion__stageWithSession_creationInfo_error___block_invoke_77;
    v86[3] = &unk_1E6998870;
    id v38 = v23;
    int v92 = v35;
    id v87 = v38;
    v88 = self;
    v89 = &v113;
    v90 = &v119;
    v91 = buf;
    dispatch_sync(v37, v86);

    close(v35);
    v81 = [(CKRecord *)v24 objectForKeyedSubscript:@"thumb1024"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v39 = [v81 fileURL];
      BOOL v40 = v39 == 0;

      if (!v40)
      {
        v41 = (void *)MEMORY[0x1E4F3A6A8];
        uint64_t v125 = *MEMORY[0x1E4F1C500];
        uint64_t v42 = [v81 fileURL];
        v126 = v42;
        v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1];
        v44 = [(CKRecord *)v24 objectForKeyedSubscript:@"thumbQLMetadata"];
        LOBYTE(v41) = [v41 associateThumbnailImagesDictionary:v43 serializedQuickLookMetadata:v44 withImmutableDocument:1 atURL:v28 error:a5];

        if ((v41 & 1) == 0)
        {
          v45 = brc_bread_crumbs();
          uint64_t v46 = brc_default_log();
          if (os_log_type_enabled(v46, (os_log_type_t)0x90u)) {
            -[BRCDownloadVersion _stageWithSession:creationInfo:error:]();
          }
        }
      }
    }
    if (-[CKRecord brc_currentUserOwnsLastEditorDeviceWithSessionContext:](self->super._record, "brc_currentUserOwnsLastEditorDeviceWithSessionContext:", v38, v81))
    {
      uint64_t v47 = [(CKRecord *)self->super._record brc_lastEditorDeviceName];
    }
    else
    {
      uint64_t v47 = 0;
    }
    uint64_t v55 = [*(id *)(*(void *)&buf[8] + 40) nameComponents];
    id v56 = (void *)v120[5];
    itemID = self->super._itemID;
    v58 = [(CKRecord *)self->super._record recordID];
    uint64_t v59 = [v58 zoneID];
    v60 = [v56 additionNameForItemID:itemID zoneID:v59];

    v61 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:5];
    v62 = [(id)v120[5] originalPOSIXName];
    [v61 setObject:v62 forKeyedSubscript:*MEMORY[0x1E4F63BA8]];

    v63 = objc_msgSend((id)v120[5], "displayNameWithoutExtension:", objc_msgSend((id)v114[5], "isHiddenExt"));
    [v61 setObject:v63 forKeyedSubscript:*MEMORY[0x1E4F63B78]];

    [v61 setObject:v60 forKeyedSubscript:*MEMORY[0x1E4F63B88]];
    [v61 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F63B80]];
    [v61 setObject:&unk_1F2B270A8 forKeyedSubscript:*MEMORY[0x1E4F63B98]];
    uint64_t v64 = *MEMORY[0x1E4F63B90];
    if (self->_isLoser)
    {
      [v61 setObject:*MEMORY[0x1E4F63BD0] forKeyedSubscript:v64];
    }
    else
    {
      [v61 setObject:*MEMORY[0x1E4F63BB8] forKeyedSubscript:v64];
      [v61 setObject:&unk_1F2B270C0 forKeyedSubscript:*MEMORY[0x1E4F63BA0]];
    }
    if (v47 | v55)
    {
      id v65 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v66 = v65;
      if (v47) {
        [v65 setObject:v47 forKeyedSubscript:*MEMORY[0x1E4F592B0]];
      }
      if (v55)
      {
        v67 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v55 requiringSecureCoding:1 error:0];
        [v66 setObject:v67 forKeyedSubscript:*MEMORY[0x1E4F592B8]];
      }
      [v61 setObject:v66 forKeyedSubscript:*MEMORY[0x1E4F63BB0]];
    }
    if (a4) {
      objc_storeStrong(a4, v61);
    }
    v51 = [(GSPermanentStorage *)self->_storage prepareAdditionCreationWithItemAtURL:v28 byMoving:1 creationInfo:v61 error:a5];

    _Block_object_dispose(buf, 8);
  }
LABEL_49:

  _Block_object_dispose(&v102, 8);
  _Block_object_dispose(&v108, 8);
  __brc_leave_section(v112);

  _Block_object_dispose(&v113, 8);
  _Block_object_dispose(&v119, 8);

  return v51;
}

void __59__BRCDownloadVersion__stageWithSession_creationInfo_error___block_invoke(void *a1)
{
  v3 = (id *)(a1 + 4);
  v2 = (void *)a1[4];
  if (v2)
  {
    uint64_t v4 = *(void *)(a1[8] + 8) + 40;
    uint64_t v5 = a1[6];
    uint64_t v6 = *(void *)(a1[5] + 32);
    uint64_t v7 = *(void *)(a1[9] + 8);
    id obj = *(id *)(v7 + 40);
    char v8 = [v2 deserializeStatInfo:v4 serverMetrics:0 itemID:v6 session:v5 error:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    if ((v8 & 1) == 0)
    {
      v27 = brc_bread_crumbs();
      id v28 = brc_default_log();
      if (os_log_type_enabled(v28, (os_log_type_t)0x90u)) {
        __59__BRCDownloadVersion__stageWithSession_creationInfo_error___block_invoke_cold_1(v3);
      }
      goto LABEL_14;
    }
    id v10 = (id *)(a1 + 7);
    v9 = (void *)a1[7];
    uint64_t v11 = a1[4];
    uint64_t v12 = *(void *)(a1[11] + 8);
    v14 = *(void **)(v12 + 40);
    v13 = (id *)(v12 + 40);
    id v31 = v14;
    if (v11)
    {
      int v15 = 0;
      char v16 = 0;
      v17 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    id v10 = (id *)(a1 + 7);
    v9 = (void *)a1[7];
    uint64_t v18 = *(void *)(a1[11] + 8);
    uint64_t v19 = *(void **)(v18 + 40);
    v13 = (id *)(v18 + 40);
    id v31 = v19;
  }
  uint64_t v20 = *(void *)(a1[8] + 8);
  BOOL v21 = *(void **)(v20 + 40);
  v17 = (id *)(v20 + 40);
  id v30 = v21;
  char v16 = &v30;
  int v15 = 1;
LABEL_7:
  uint64_t v22 = *(void *)(a1[5] + 112);
  uint64_t v23 = *(void *)(a1[9] + 8);
  v25 = *(void **)(v23 + 40);
  uint64_t v24 = (id *)(v23 + 40);
  id v29 = v25;
  char v26 = [v9 deserializeVersion:&v31 fakeStatInfo:v16 contentBoundaryKey:0 clientZone:v22 error:&v29];
  objc_storeStrong(v13, v31);
  if (v15) {
    objc_storeStrong(v17, v30);
  }
  objc_storeStrong(v24, v29);
  if ((v26 & 1) == 0)
  {
    v27 = brc_bread_crumbs();
    id v28 = brc_default_log();
    if (os_log_type_enabled(v28, (os_log_type_t)0x90u)) {
      __59__BRCDownloadVersion__stageWithSession_creationInfo_error___block_invoke_cold_1(v10);
    }
LABEL_14:

    *(unsigned char *)(*(void *)(a1[10] + 8) + 24) = 0;
  }
}

void __59__BRCDownloadVersion__stageWithSession_creationInfo_error___block_invoke_77(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) stageRegistry];
  [v2 applyMetadataOnFileDescriptor:*(unsigned int *)(a1 + 72) liveFileDescriptor:0xFFFFFFFFLL itemID:*(void *)(*(void *)(a1 + 40) + 32) clientZone:*(void *)(*(void *)(a1 + 40) + 112) statInfo:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) version:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) sharingOptions:0];

  v3 = objc_opt_class();
  id v9 = [*(id *)(*(void *)(a1 + 40) + 56) lastModifiedUserRecordID];
  uint64_t v4 = [v9 recordName];
  uint64_t v5 = [*(id *)(a1 + 32) clientDB];
  uint64_t v6 = [v3 userIdentityForName:v4 db:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  char v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)secondaryRecordID
{
  return self->_secondaryRecordID;
}

- (id)secondaryRecord
{
  return self->_secondaryRecord;
}

- (void)setSecondaryRecord:(id)a3
{
}

- (BOOL)isLoser
{
  return self->_isLoser;
}

- (GSPermanentStorage)storage
{
  return self->_storage;
}

- (NSError)gsError
{
  return self->_gsError;
}

- (BRFileObjectID)fileObjectID
{
  return self->_fileObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileObjectID, 0);
  objc_storeStrong((id *)&self->_gsError, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_secondaryRecord, 0);
  objc_storeStrong((id *)&self->_secondaryRecordID, 0);
}

- (void)initWithDocument:stageID:etag:isLoser:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !item.isFinderBookmark%@", v2, v3, v4, v5, v6);
}

- (void)_stageContentWithSession:(void *)a1 error:.cold.1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v1, v2, "[CRIT] UNREACHABLE: There should be a file content property in %@%@", (void)v3, DWORD2(v3));
}

- (void)_stageWithSession:creationInfo:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] Failed to attach thumbnail to version%@", v1, 0xCu);
}

- (void)_stageWithSession:creationInfo:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [vRecord.etag isEqualToString:_etag]%@", v2, v3, v4, v5, v6);
}

- (void)_stageWithSession:creationInfo:error:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: ![vRecord.recordID.zoneID.ownerName isEqualToString:CKCurrentUserDefaultName] || _secondaryRecord%@", v2, v3, v4, v5, v6);
}

- (void)_stageWithSession:creationInfo:error:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: vRecord%@", v2, v3, v4, v5, v6);
}

void __59__BRCDownloadVersion__stageWithSession_creationInfo_error___block_invoke_cold_1(id *a1)
{
  uint64_t v1 = [*a1 debugDescription];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] Can't deserialize %@%@", v4, v5, v6, v7, v8);
}

@end