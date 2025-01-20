@interface BRCDownloadContent
- (BOOL)_prepareSecondStageWithSession:(id)a3 manifest:(id)a4 package:(id)a5 error:(id *)a6;
- (BOOL)_stageWithSession:(id)a3 error:(id *)a4;
- (BOOL)_stageWithSession:(id)a3 manifest:(id)a4 package:(id)a5 xattrsPackage:(id)a6 error:(id *)a7;
- (BOOL)isDocumentModifiedByOtherUser;
- (BOOL)isLoser;
- (BOOL)liveItemIsPackage;
- (BOOL)requiresTwoPhase;
- (BRCDownloadContent)initWithDocument:(id)a3 stageID:(id)a4 etagIfLoser:(id)a5 downloadKind:(int)a6;
- (NSIndexSet)desiredIndices;
- (id)description;
- (id)etagIfLoser;
- (int)kind;
- (unint64_t)liveFileID;
- (unsigned)liveDocumentID;
- (void)setProgress:(id)a3;
@end

@implementation BRCDownloadContent

- (void)setProgress:(id)a3
{
}

- (id)etagIfLoser
{
  if (self->_isLoser) {
    return self->super._etag;
  }
  else {
    return 0;
  }
}

- (int)kind
{
  return self->_kind;
}

- (BRCDownloadContent)initWithDocument:(id)a3 stageID:(id)a4 etagIfLoser:(id)a5 downloadKind:(int)a6
{
  id v10 = a3;
  v11 = (NSString *)a5;
  v40.receiver = self;
  v40.super_class = (Class)BRCDownloadContent;
  v12 = [(BRCDownload *)&v40 initWithDocument:v10 stageID:a4];
  if (v12)
  {
    uint64_t v13 = [v10 serverZone];
    zone = v12->_zone;
    v12->_zone = (BRCServerZone *)v13;

    v15 = [v10 desiredVersion];
    v12->super._totalSize = [v15 size];

    v12->_isFinderBookmark = [v10 isFinderBookmark];
    etag = v11;
    if (!v11) {
      etag = v12->super._etag;
    }
    objc_storeStrong((id *)&v12->super._etag, etag);
    v12->_isLoser = v11 != 0;
    v12->_kind = a6;
    v17 = [v10 currentVersion];
    v18 = [v10 db];
    v19 = [v17 lastEditorUserIdentityWithDB:v18];

    if (v19) {
      v12->_isDocumentModifiedByOtherUser = 1;
    }
    v20 = [v10 st];
    v21 = [v20 fileID];

    v22 = [v10 st];
    v23 = [v22 documentID];

    v12->_liveFileID = [v21 unsignedLongLongValue];
    v12->_liveDocumentID = [v23 unsignedIntValue];
    if ([v10 isFault])
    {
      v12->_liveItemIsPackage = 0;
    }
    else
    {
      v24 = [v10 currentVersion];
      char v25 = [v24 isPackage];
      if (v21) {
        BOOL v26 = v25;
      }
      else {
        BOOL v26 = 0;
      }
      if (!v23) {
        BOOL v26 = 0;
      }
      v12->_liveItemIsPackage = v26;

      if (v12->_liveItemIsPackage)
      {
        v27 = [v10 desiredVersion];
        int v28 = [v27 isPackage];

        if (v28)
        {
          v29 = [v10 serverZone];
          v30 = [v29 session];

          v31 = [v30 stageRegistry];
          v32 = [v31 createURLForDownloadWithStageID:v12->super._stageID name:@"brpackage-dlspec"];

          v33 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v32];
          if (v33)
          {
            v34 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v33 error:0];
            uint64_t v35 = [v34 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
            desiredIndices = v12->_desiredIndices;
            v12->_desiredIndices = (NSIndexSet *)v35;
          }
          if (!v12->_desiredIndices)
          {
            v37 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E4F28D60]);
            v38 = v12->_desiredIndices;
            v12->_desiredIndices = v37;

            v12->_requiresTwoPhase = 1;
          }
        }
      }
    }
  }
  return v12;
}

- (id)description
{
  if (self->_isLoser) {
    v2 = "loser";
  }
  else {
    v2 = "current";
  }
  return (id)[NSString stringWithFormat:@"<dl-content[%lld] %@_%@ %s>", self->super._throttleID, self->super._itemID, self->super._etag, v2];
}

- (BOOL)_prepareSecondStageWithSession:(id)a3 manifest:(id)a4 package:(id)a5 error:(id *)a6
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v59 = a4;
  id v8 = a5;
  id v62 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v63 = v8;
  id v73 = 0;
  unint64_t v65 = [v8 itemCountWithError:&v73];
  id v9 = v73;
  id v10 = v73;
  v58 = v10;
  if (!v65 && v10)
  {
    objc_storeStrong(a6, v9);
    BOOL v11 = 0;
    goto LABEL_51;
  }
  memset(v72, 0, sizeof(v72));
  __brc_create_section(0, (uint64_t)"-[BRCDownloadContent _prepareSecondStageWithSession:manifest:package:error:]", 321, v72);
  v12 = brc_bread_crumbs();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[BRCDownloadContent _prepareSecondStageWithSession:manifest:package:error:]();
  }

  v14 = [[BRCPackageManifestReader alloc] initWithAsset:v59];
  [(BRCPackageManifestReader *)v14 setItemClass:objc_opt_class()];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  obj = v14;
  uint64_t v15 = [(BRCPackageManifestReader *)obj countByEnumeratingWithState:&v68 objects:v84 count:16];
  if (v15)
  {
    unint64_t v16 = 0;
    uint64_t v17 = *(void *)v69;
    uint64_t v60 = *MEMORY[0x1E4F59368];
    if (a6) {
      v18 = "(passed to caller)";
    }
    else {
      v18 = "(ignored by caller)";
    }
    v57 = v18;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v69 != v17) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v68 + 1) + 8 * v19);
        v21 = (void *)MEMORY[0x1D9438760]();
        if ([v20 type] == 4)
        {
LABEL_15:
          ++v16;
LABEL_22:
          int v28 = 5;
          goto LABEL_23;
        }
        if ([v20 type] != 2) {
          goto LABEL_22;
        }
        if (v16 >= v65)
        {
          v29 = brc_bread_crumbs();
          v30 = brc_default_log();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
          {
            objc_super v40 = [(BRCDownload *)self itemID];
            *(_DWORD *)buf = 138413314;
            v75 = v40;
            __int16 v76 = 2048;
            unint64_t v77 = v16;
            __int16 v78 = 2048;
            unint64_t v79 = v65;
            __int16 v80 = 2112;
            v81 = v63;
            __int16 v82 = 2112;
            v83 = v29;
            _os_log_fault_impl(&dword_1D353B000, v30, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Package inside %@ is corrupted in the cloud\nAsking for asset index out of bounds %lu vs %lu in package: %@%@", buf, 0x34u);
          }
          v31 = (void *)MEMORY[0x1E4F28C58];
          v32 = [(BRCDownload *)self itemID];
          v33 = objc_msgSend(v31, "br_errorWithDomain:code:description:", v60, 15, @"unreachable: Package inside %@ is corrupted in the cloud\nAsking for asset index out of bounds %lu vs %lu in package: %@", v32, v16, v65, v63);

          if (v33)
          {
            v34 = brc_bread_crumbs();
            uint64_t v35 = brc_default_log();
            if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 136315906;
              v75 = "-[BRCDownloadContent _prepareSecondStageWithSession:manifest:package:error:]";
              __int16 v76 = 2080;
              unint64_t v77 = (unint64_t)v57;
              __int16 v78 = 2112;
              unint64_t v79 = (unint64_t)v33;
              __int16 v80 = 2112;
              v81 = v34;
              _os_log_error_impl(&dword_1D353B000, v35, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }
          }
          if (a6) {
            objc_storeStrong(a6, v33);
          }

          if ([(BRCServerZone *)self->_zone isPrivateZone])
          {
            v36 = [(BRCServerZone *)self->_zone clientZone];
            v37 = [v36 asPrivateClientZone];
            v38 = [(BRCDownload *)self recordID];
            v39 = [v38 recordName];
            [v37 reportProblemWithType:9 recordName:v39];
          }
          int v28 = 1;
        }
        else
        {
          if (self->_liveItemIsPackage)
          {
            if (self->_liveDocumentID)
            {
              v22 = [v63 itemAtIndex:v16];
              v23 = [v61 clientDB];
              uint64_t liveDocumentID = self->_liveDocumentID;
              uint64_t v25 = [v20 path];
              BOOL v26 = [v22 signature];
              v27 = (void *)[v23 numberWithSQL:@"SELECT 1 FROM client_pkg_items WHERE item_doc_id = %u AND rel_path = %@ AND signature_or_link = %@", liveDocumentID, v25, v26];

              LOBYTE(v25) = [v27 BOOLValue];
              if (v25) {
                goto LABEL_15;
              }
            }
          }
          [v62 addIndex:v16];
          int v28 = 0;
          ++v16;
        }
LABEL_23:
        if (v28 != 5 && v28)
        {
          BOOL v11 = 0;
          v43 = obj;
          goto LABEL_49;
        }
        ++v19;
      }
      while (v15 != v19);
      uint64_t v41 = [(BRCPackageManifestReader *)obj countByEnumeratingWithState:&v68 objects:v84 count:16];
      uint64_t v15 = v41;
    }
    while (v41);
  }

  v42 = [(BRCPackageManifestReader *)obj error];

  if (v42)
  {
    BOOL v11 = 0;
  }
  else
  {
    v44 = [v61 stageRegistry];
    v43 = [v44 createURLForDownloadWithStageID:self->super._stageID name:@"brpackage-dlspec"];

    v45 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v62 requiringSecureCoding:1 error:0];
    if (([v45 writeToURL:v43 atomically:1] & 1) == 0)
    {
      v46 = brc_bread_crumbs();
      v47 = brc_default_log();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
        -[BRCDownloadContent _prepareSecondStageWithSession:manifest:package:error:]((uint64_t)v46, v47, v48, v49, v50, v51, v52, v53);
      }
    }
    v54 = brc_bread_crumbs();
    v55 = brc_default_log();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v75 = (const char *)v62;
      __int16 v76 = 2048;
      unint64_t v77 = v65;
      __int16 v78 = 2112;
      unint64_t v79 = (unint64_t)v54;
      _os_log_debug_impl(&dword_1D353B000, v55, OS_LOG_TYPE_DEBUG, "[DEBUG] Desired indices are: %@ (itemCount: %ld)%@", buf, 0x20u);
    }

    BOOL v11 = 1;
LABEL_49:
  }
  __brc_leave_section(v72);
LABEL_51:

  return v11;
}

- (BOOL)_stageWithSession:(id)a3 manifest:(id)a4 package:(id)a5 xattrsPackage:(id)a6 error:(id *)a7
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v36 = a5;
  id v35 = a6;
  v14 = [v12 stageRegistry];
  v34 = [v14 createURLForDownloadWithStageID:self->super._stageID name:@"item"];
  uint64_t v15 = [v14 createURLForDownloadWithStageID:self->super._stageID name:@"brpackage-extended"];
  if (!self->_liveItemIsPackage || !self->_liveFileID)
  {
    int v17 = -1;
    goto LABEL_10;
  }
  unint64_t v16 = [v12 volume];
  int v17 = BRCOpenByID([v16 deviceID], self->_liveFileID, 33028);

  if ((v17 & 0x80000000) == 0)
  {
LABEL_10:
    v23 = [[BRCPackageManifestReader alloc] initWithAsset:v13];
    v24 = [BRCPackageManifestWriter alloc];
    uint64_t v25 = [(BRCServerZone *)self->_zone clientZone];
    BOOL v26 = [(BRCPackageManifestWriter *)v24 initWithZone:v25 stageID:self->super._stageID url:v15];

    v27 = (void *)MEMORY[0x1E4F1CB10];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __77__BRCDownloadContent__stageWithSession_manifest_package_xattrsPackage_error___block_invoke;
    v37[3] = &unk_1E6998820;
    v22 = v26;
    v38 = v22;
    v18 = v23;
    v39 = v18;
    id v40 = v36;
    id v41 = v35;
    int v45 = v17;
    id v42 = v34;
    v43 = self;
    v44 = a7;
    objc_msgSend(v27, "br_setIOPolicy:type:forBlock:", 1, 7, v37);
    int v28 = [v13 fileURL];

    if (v28)
    {
      v29 = [MEMORY[0x1E4F28CB8] defaultManager];
      v30 = [v13 fileURL];
      [v29 removeItemAtURL:v30 error:0];
    }
    v31 = [(BRCPackageManifestWriter *)v22 error];
    BOOL v21 = v31 == 0;

    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", *__error());
  v18 = (BRCPackageManifestReader *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    uint64_t v19 = brc_bread_crumbs();
    v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v33 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v47 = "-[BRCDownloadContent _stageWithSession:manifest:package:xattrsPackage:error:]";
      __int16 v48 = 2080;
      if (!a7) {
        v33 = "(ignored by caller)";
      }
      uint64_t v49 = v33;
      __int16 v50 = 2112;
      uint64_t v51 = v18;
      __int16 v52 = 2112;
      uint64_t v53 = v19;
      _os_log_debug_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (!a7)
  {
    BOOL v21 = 0;
    goto LABEL_14;
  }
  v18 = v18;
  BOOL v21 = 0;
  v22 = (BRCPackageManifestWriter *)*a7;
  *a7 = v18;
LABEL_13:

LABEL_14:
  return v21;
}

uint64_t __77__BRCDownloadContent__stageWithSession_manifest_package_xattrsPackage_error___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(unsigned int *)(a1 + 88);
  uint64_t v7 = *(void *)(a1 + 64);
  id v8 = [*(id *)(a1 + 72) recordID];
  id v9 = [v8 recordName];
  LOBYTE(v17) = *(unsigned char *)(*(void *)(a1 + 72) + 126);
  LOBYTE(v2) = [v2 stagePackageWithReader:v3 package:v4 xattrsPackage:v5 stageItemURL:v7 livefd:v6 recordName:v9 isDocumentModifiedByOtherUser:v17];

  if ((v2 & 1) == 0)
  {
    id v10 = [*(id *)(a1 + 32) error];
    if (v10)
    {
      BOOL v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = *(void *)(a1 + 80);
        *(_DWORD *)buf = 136315906;
        if (v15) {
          unint64_t v16 = "(passed to caller)";
        }
        else {
          unint64_t v16 = "(ignored by caller)";
        }
        uint64_t v19 = "-[BRCDownloadContent _stageWithSession:manifest:package:xattrsPackage:error:]_block_invoke";
        __int16 v20 = 2080;
        BOOL v21 = v16;
        __int16 v22 = 2112;
        v23 = v10;
        __int16 v24 = 2112;
        uint64_t v25 = v11;
        _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    id v13 = *(id **)(a1 + 80);
    if (v13) {
      objc_storeStrong(v13, v10);
    }
  }
  uint64_t result = *(unsigned int *)(a1 + 88);
  if ((result & 0x80000000) == 0) {
    return close(result);
  }
  return result;
}

- (BOOL)_stageWithSession:(id)a3 error:(id *)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 stageRegistry];
  p_record = &self->super._record;
  if (self->_isFinderBookmark) {
    id v9 = kBRRecordKeyFinderBookmarkContent;
  }
  else {
    id v9 = kBRRecordKeyFileContent;
  }
  uint64_t v10 = [(CKRecord *)self->super._record objectForKeyedSubscript:*v9];
  if (v10)
  {
    id v11 = (id)v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v26 = brc_bread_crumbs();
      v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        -[BRCDownloadContent _stageWithSession:error:].cold.6();
      }

      id v12 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: file content is not a CKAsset: %@", *p_record);
      if (v12)
      {
        int v28 = brc_bread_crumbs();
        v29 = brc_default_log();
        if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
        {
          v46 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          uint64_t v54 = "-[BRCDownloadContent _stageWithSession:error:]";
          __int16 v55 = 2080;
          if (!a4) {
            v46 = "(ignored by caller)";
          }
          v56 = v46;
          __int16 v57 = 2112;
          id v58 = v12;
          __int16 v59 = 2112;
          uint64_t v60 = v28;
          _os_log_error_impl(&dword_1D353B000, v29, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a4) {
        objc_storeStrong(a4, v12);
      }
      goto LABEL_87;
    }
    id v12 = [v7 createURLForDownloadWithStageID:self->super._stageID name:@"item"];
    id v13 = [v11 fileURL];

    if (v13) {
      BOOL v14 = v12 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14)
    {
      uint64_t v15 = brc_bread_crumbs();
      unint64_t v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        v47 = [v11 fileURL];
        *(_DWORD *)buf = 138412802;
        uint64_t v54 = v47;
        __int16 v55 = 2112;
        v56 = (const char *)v12;
        __int16 v57 = 2112;
        id v58 = v15;
        _os_log_fault_impl(&dword_1D353B000, v16, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: asset has a missing url (%@), or we can't compute the stage url %@%@", buf, 0x20u);
      }
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F59368];
      uint64_t v19 = [v11 fileURL];
      objc_msgSend(v17, "br_errorWithDomain:code:description:", v18, 15, @"unreachable: asset has a missing url (%@), or we can't compute the stage url %@", v19, v12);
      id v32 = (id)objc_claimAutoreleasedReturnValue();

      if (!v32) {
        goto LABEL_34;
      }
      v30 = brc_bread_crumbs();
      v31 = brc_default_log();
      if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
      {
        __int16 v20 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v54 = "-[BRCDownloadContent _stageWithSession:error:]";
        __int16 v55 = 2080;
        if (!a4) {
          __int16 v20 = "(ignored by caller)";
        }
        v56 = v20;
        __int16 v57 = 2112;
        id v58 = v32;
        __int16 v59 = 2112;
        uint64_t v60 = v30;
        _os_log_error_impl(&dword_1D353B000, v31, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    else
    {
      v30 = [MEMORY[0x1E4F28CB8] defaultManager];
      v31 = [v11 fileURL];
      id v52 = 0;
      objc_msgSend(v30, "br_forceMoveItemAtURL:toURL:error:", v31, v12, &v52);
      id v32 = v52;
    }

LABEL_34:
    if (a4) {
      objc_storeStrong(a4, v32);
    }
LABEL_86:

LABEL_87:
    BOOL v25 = 0;
    goto LABEL_88;
  }
  if (!self->_isFinderBookmark)
  {
    id v12 = [(CKRecord *)*p_record objectForKeyedSubscript:@"pkgContent"];
    id v11 = [(CKRecord *)*p_record objectForKeyedSubscript:@"pkgManifest"];
    id v32 = [(CKRecord *)*p_record objectForKeyedSubscript:@"pkgXattrs"];
    if (v12) {
      BOOL v33 = v11 == 0;
    }
    else {
      BOOL v33 = 1;
    }
    if (v33)
    {
      v34 = brc_bread_crumbs();
      id v35 = brc_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
        -[BRCDownloadContent _stageWithSession:error:].cold.4();
      }

      id v36 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: unknown type for downloaded object %@", *p_record);
      if (!v36) {
        goto LABEL_83;
      }
      v37 = brc_bread_crumbs();
      v38 = brc_default_log();
      if (!os_log_type_enabled(v38, (os_log_type_t)0x90u)) {
        goto LABEL_82;
      }
      v39 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      uint64_t v54 = "-[BRCDownloadContent _stageWithSession:error:]";
      __int16 v55 = 2080;
      if (!a4) {
        v39 = "(ignored by caller)";
      }
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v32 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            if (self->_requiresTwoPhase) {
              BOOL v41 = [(BRCDownloadContent *)self _prepareSecondStageWithSession:v6 manifest:v11 package:v12 error:a4];
            }
            else {
              BOOL v41 = [(BRCDownloadContent *)self _stageWithSession:v6 manifest:v11 package:v12 xattrsPackage:v32 error:a4];
            }
            BOOL v25 = v41;

            goto LABEL_88;
          }
          uint64_t v49 = brc_bread_crumbs();
          __int16 v50 = brc_default_log();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT)) {
            -[BRCDownloadContent _stageWithSession:error:]();
          }

          id v36 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: xattrs package is not a CKAsset: %@", *p_record);
          if (!v36) {
            goto LABEL_83;
          }
          v37 = brc_bread_crumbs();
          v38 = brc_default_log();
          if (!os_log_type_enabled(v38, (os_log_type_t)0x90u)) {
            goto LABEL_82;
          }
          v39 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          uint64_t v54 = "-[BRCDownloadContent _stageWithSession:error:]";
          __int16 v55 = 2080;
          if (!a4) {
            v39 = "(ignored by caller)";
          }
        }
        else
        {
          v44 = brc_bread_crumbs();
          int v45 = brc_default_log();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
            -[BRCDownloadContent _stageWithSession:error:]();
          }

          id v36 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: package manifest is not a CKAsset: %@", *p_record);
          if (!v36) {
            goto LABEL_83;
          }
          v37 = brc_bread_crumbs();
          v38 = brc_default_log();
          if (!os_log_type_enabled(v38, (os_log_type_t)0x90u))
          {
LABEL_82:

LABEL_83:
            if (a4) {
              objc_storeStrong(a4, v36);
            }

            goto LABEL_86;
          }
          v39 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          uint64_t v54 = "-[BRCDownloadContent _stageWithSession:error:]";
          __int16 v55 = 2080;
          if (!a4) {
            v39 = "(ignored by caller)";
          }
        }
      }
      else
      {
        id v42 = brc_bread_crumbs();
        v43 = brc_default_log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
          -[BRCDownloadContent _stageWithSession:error:]();
        }

        id v36 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: pkg content is not a CKPackage: %@", *p_record);
        if (!v36) {
          goto LABEL_83;
        }
        v37 = brc_bread_crumbs();
        v38 = brc_default_log();
        if (!os_log_type_enabled(v38, (os_log_type_t)0x90u)) {
          goto LABEL_82;
        }
        v39 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v54 = "-[BRCDownloadContent _stageWithSession:error:]";
        __int16 v55 = 2080;
        if (!a4) {
          v39 = "(ignored by caller)";
        }
      }
    }
    v56 = v39;
    __int16 v57 = 2112;
    id v58 = v36;
    __int16 v59 = 2112;
    uint64_t v60 = v37;
    _os_log_error_impl(&dword_1D353B000, v38, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    goto LABEL_82;
  }
  BOOL v21 = brc_bread_crumbs();
  __int16 v22 = brc_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
    -[BRCDownloadContent _stageWithSession:error:].cold.5();
  }

  objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: finder bookmark without content: %@", *p_record);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v23 = brc_bread_crumbs();
    __int16 v24 = brc_default_log();
    if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
    {
      __int16 v48 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      uint64_t v54 = "-[BRCDownloadContent _stageWithSession:error:]";
      __int16 v55 = 2080;
      if (!a4) {
        __int16 v48 = "(ignored by caller)";
      }
      v56 = v48;
      __int16 v57 = 2112;
      id v58 = v11;
      __int16 v59 = 2112;
      uint64_t v60 = v23;
      _os_log_error_impl(&dword_1D353B000, v24, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a4)
  {
    id v11 = v11;
    BOOL v25 = 0;
    id v12 = *a4;
    *a4 = v11;
LABEL_88:

    goto LABEL_89;
  }
  BOOL v25 = 0;
LABEL_89:

  return v25;
}

- (BOOL)requiresTwoPhase
{
  return self->_requiresTwoPhase;
}

- (BOOL)liveItemIsPackage
{
  return self->_liveItemIsPackage;
}

- (unsigned)liveDocumentID
{
  return self->_liveDocumentID;
}

- (NSIndexSet)desiredIndices
{
  return self->_desiredIndices;
}

- (unint64_t)liveFileID
{
  return self->_liveFileID;
}

- (BOOL)isLoser
{
  return self->_isLoser;
}

- (BOOL)isDocumentModifiedByOtherUser
{
  return self->_isDocumentModifiedByOtherUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredIndices, 0);
  objc_storeStrong((id *)&self->_zone, 0);
}

- (void)_prepareSecondStageWithSession:(uint64_t)a3 manifest:(uint64_t)a4 package:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_prepareSecondStageWithSession:manifest:package:error:.cold.2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx computing desired packages indices%@", v1, 0x16u);
}

- (void)_stageWithSession:error:.cold.1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: xattrs package is not a CKAsset: %@%@");
}

- (void)_stageWithSession:error:.cold.2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: package manifest is not a CKAsset: %@%@");
}

- (void)_stageWithSession:error:.cold.3()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: pkg content is not a CKPackage: %@%@");
}

- (void)_stageWithSession:error:.cold.4()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: unknown type for downloaded object %@%@");
}

- (void)_stageWithSession:error:.cold.5()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: finder bookmark without content: %@%@");
}

- (void)_stageWithSession:error:.cold.6()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: file content is not a CKAsset: %@%@");
}

@end