@interface BRCPackageItem
+ (BOOL)_deleteSnapshotAtPath:(id)a3 error:(id *)a4;
+ (BOOL)_rescanDirectoryInPackage:(id)a3 error:(id *)a4;
+ (BOOL)dumpSession:(id)a3 toContext:(id)a4 db:(id)a5 error:(id *)a6;
+ (BOOL)packageChangedAtRelativePath:(id)a3;
+ (BOOL)updateSignaturesForFilesInItem:(id)a3 fromCKPackage:(id)a4 error:(id *)a5;
+ (BOOL)updateSnapshotAtPath:(id)a3 error:(id *)a4;
+ (BRCPackageItem)packageItemWithDocumentID:(unsigned int)a3 relativePath:(id)a4 db:(id)a5;
+ (id)packageItemForRelpath:(id)a3;
+ (id)packageItemsForDocumentID:(unsigned int)a3 order:(unint64_t)a4 db:(id)a5;
+ (id)packageItemsForFileObjectID:(id)a3 order:(unint64_t)a4 db:(id)a5;
+ (id)packageItemsForItem:(id)a3 order:(unint64_t)a4;
+ (int64_t)aggregatePackageSizeForPackageID:(unsigned int)a3 db:(id)a4;
+ (int64_t)largestPackageItemSizeInDocumentID:(unsigned int)a3 session:(id)a4;
- (BOOL)changedAtRelpath:(id)a3;
- (BOOL)isDirectory;
- (BOOL)isFile;
- (BOOL)isSymLink;
- (BOOL)saveToDBWithSession:(id)a3;
- (BOOL)setDirty:(BOOL)a3 session:(id)a4;
- (BRCGenerationID)generationID;
- (BRCPackageItem)initWithPBItem:(id)a3 forLocalItem:(id)a4;
- (BRCPackageItem)initWithRelativePath:(id)a3 markDirty:(BOOL)a4;
- (NSData)contentSignature;
- (NSData)quarantineInfo;
- (NSData)xattrSignature;
- (NSString)description;
- (NSString)pathInPackage;
- (NSString)symlinkContent;
- (char)mode;
- (id)initFromPQLResultSet:(id)a3 error:(id *)a4;
- (int)type;
- (int64_t)assetRank;
- (int64_t)mtime;
- (int64_t)size;
- (unint64_t)fileID;
- (unint64_t)packageDocumentID;
- (void)_setXattrs:(id)a3 stageRegistry:(id)a4;
- (void)contentSignature;
- (void)description;
- (void)symlinkContent;
@end

@implementation BRCPackageItem

- (BOOL)isFile
{
  return self->_type == 2;
}

- (BOOL)isSymLink
{
  return self->_type == 3;
}

- (BOOL)isDirectory
{
  return self->_type == 1;
}

- (NSString)symlinkContent
{
  if (![(BRCPackageItem *)self isSymLink])
  {
    v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      [(BRCPackageItem *)(uint64_t)v5 symlinkContent];
    }
  }
  symlinkContent = self->_symlinkContent;
  return symlinkContent;
}

- (NSData)contentSignature
{
  if (![(BRCPackageItem *)self isFile])
  {
    v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      [(BRCPackageItem *)(uint64_t)v5 contentSignature];
    }
  }
  contentSignature = self->_contentSignature;
  return contentSignature;
}

- (NSString)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:32];
  unint64_t packageID = self->_packageID;
  if (self->_isDirty) {
    v5 = " (dirty)";
  }
  else {
    v5 = "";
  }
  v6 = [(NSString *)self->_pathInPackage fp_obfuscatedPath];
  [v3 appendFormat:@"pkg:%lld%s p:'%@' rank:%lld ino:%lld", packageID, v5, v6, self->_assetRank, self->_fileID];

  switch(self->_type)
  {
    case 1:
      [v3 appendString:@" dir"];
      break;
    case 2:
      generationID = self->_generationID;
      int64_t mtime = self->_mtime;
      int64_t size = self->_size;
      v26[0] = 114;
      int mode = self->_mode;
      if (mode) {
        char v11 = 119;
      }
      else {
        char v11 = 45;
      }
      v26[1] = v11;
      if ((mode & 2) != 0) {
        char v12 = 120;
      }
      else {
        char v12 = 45;
      }
      v26[2] = v12;
      v26[3] = (mode << 29 >> 31) & 0x4C;
      v26[4] = 0;
      [v3 appendFormat:@" file gen:%@ size:%llu mtime:%llu mode:%s", generationID, size, mtime, v26];
      contentSignature = self->_contentSignature;
      if (contentSignature)
      {
        v14 = [(NSData *)contentSignature brc_hexadecimalString];
        [v3 appendFormat:@" sig:%@", v14];
        goto LABEL_18;
      }
      break;
    case 3:
      v14 = [(NSString *)self->_symlinkContent fp_obfuscatedPath];
      [v3 appendFormat:@" link to:'%@'", v14];
      goto LABEL_18;
    case 4:
      v14 = brc_bread_crumbs();
      v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        [(BRCPackageItem *)(uint64_t)v14 description];
      }

LABEL_18:
      break;
    default:
      break;
  }
  quarantineInfo = self->_quarantineInfo;
  if (quarantineInfo) {
    objc_msgSend(v3, "appendFormat:", @" quarantine:%u ", -[NSData br_qtnFlags](quarantineInfo, "br_qtnFlags"));
  }
  xattrSignature = self->_xattrSignature;
  if (xattrSignature)
  {
    v24 = [(NSData *)xattrSignature brc_hexadecimalString];
    [v3 appendFormat:@" xattrSig:%@", v24];
  }
  return (NSString *)v3;
}

- (void)_setXattrs:(id)a3 stageRegistry:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  objc_msgSend(v9, "brc_signature");
  uint64_t v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  xattrSignature = self->_xattrSignature;
  self->_xattrSignature = v7;

  if (v9 && v6) {
    [v6 saveXattrBlob:v9 forSignature:self->_xattrSignature error:0];
  }
}

- (BRCPackageItem)initWithPBItem:(id)a3 forLocalItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)BRCPackageItem;
  uint64_t v8 = [(BRCPackageItem *)&v36 init];
  if (v8)
  {
    id v9 = [v7 st];
    uint64_t v10 = [v9 documentID];
    v8->_unint64_t packageID = [v10 unsignedLongLongValue];

    char v11 = [v6 item];
    uint64_t v12 = [v11 path];
    pathInPackage = v8->_pathInPackage;
    v8->_pathInPackage = (NSString *)v12;

    v8->_fileID = [v6 fileID];
    v14 = [v6 item];
    uint64_t v15 = [v14 quarantineInfo];
    quarantineInfo = v8->_quarantineInfo;
    v8->_quarantineInfo = (NSData *)v15;

    uint64_t v17 = [v6 item];
    v8->_int type = [v17 type];

    int type = v8->_type;
    if (type == 4)
    {
      v32 = v8;
      uint64_t v8 = 0;
      goto LABEL_14;
    }
    if (type == 3)
    {
      uint64_t v19 = [v6 item];
      uint64_t v20 = [v19 symlinkContent];
      symlinkContent = v8->_symlinkContent;
      v8->_symlinkContent = (NSString *)v20;

      int type = v8->_type;
    }
    if (type == 2)
    {
      v8->_int mode = 0;
      v22 = [v6 item];
      int v23 = [v22 isWritable];

      if (v23) {
        v8->_mode |= 1u;
      }
      v24 = [v6 item];
      int v25 = [v24 isExecutable];

      if (v25) {
        v8->_mode |= 2u;
      }
      v26 = -[BRCGenerationID initWithFSGenerationID:]([BRCGenerationID alloc], "initWithFSGenerationID:", [v6 generationID]);
      generationID = v8->_generationID;
      v8->_generationID = v26;

      v8->_int64_t size = [v6 size];
      v28 = [v6 item];
      v8->_int64_t mtime = [v28 mtime];

      v29 = [v6 item];
      uint64_t v30 = [v29 signature];
      contentSignature = v8->_contentSignature;
      v8->_contentSignature = (NSData *)v30;
    }
    if ([v6 hasXattrs])
    {
      v32 = [v6 xattrs];
      v33 = [v7 session];
      v34 = [v33 stageRegistry];
      [(BRCPackageItem *)v8 _setXattrs:v32 stageRegistry:v34];

LABEL_14:
    }
  }

  return v8;
}

+ (id)packageItemsForItem:(id)a3 order:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412802;
    id v16 = v6;
    __int16 v17 = 2048;
    uint64_t v18 = [v6 dbRowID];
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] calling packageItemsForItem %@ item_rowid %llu%@", (uint8_t *)&v15, 0x20u);
  }

  id v9 = [v6 st];
  uint64_t v10 = [v9 documentID];
  uint64_t v11 = [v10 unsignedIntValue];
  uint64_t v12 = [v6 db];
  v13 = [a1 packageItemsForDocumentID:v11 order:a4 db:v12];

  return v13;
}

+ (id)packageItemsForFileObjectID:(id)a3 order:(unint64_t)a4 db:(id)a5
{
  id v8 = a5;
  id v9 = objc_msgSend(a1, "packageItemsForDocumentID:order:db:", objc_msgSend(a3, "rawID"), a4, v8);

  return v9;
}

- (int)type
{
  return self->_type;
}

- (int64_t)assetRank
{
  return self->_assetRank;
}

- (unint64_t)packageDocumentID
{
  return self->_packageID;
}

- (unint64_t)fileID
{
  return self->_fileID;
}

- (BRCGenerationID)generationID
{
  return self->_generationID;
}

- (NSString)pathInPackage
{
  return self->_pathInPackage;
}

- (int64_t)mtime
{
  return self->_mtime;
}

- (char)mode
{
  return self->_mode;
}

- (int64_t)size
{
  return self->_size;
}

- (NSData)quarantineInfo
{
  return self->_quarantineInfo;
}

- (NSData)xattrSignature
{
  return self->_xattrSignature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xattrSignature, 0);
  objc_storeStrong((id *)&self->_quarantineInfo, 0);
  objc_storeStrong((id *)&self->_contentSignature, 0);
  objc_storeStrong((id *)&self->_symlinkContent, 0);
  objc_storeStrong((id *)&self->_pathInPackage, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
}

- (BRCPackageItem)initWithRelativePath:(id)a3 markDirty:(BOOL)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRCPackageItem;
  id v7 = [(BRCPackageItem *)&v21 init];
  if (v7)
  {
    id v8 = [v6 pathOfPackageRoot];
    v7->_unint64_t packageID = [v8 documentID];

    uint64_t v9 = [v6 pathRelativeToPackageRoot];
    pathInPackage = v7->_pathInPackage;
    v7->_pathInPackage = (NSString *)v9;

    v7->_fileID = [v6 fileID];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __66__BRCPackageItem_LegacyAdditions__initWithRelativePath_markDirty___block_invoke;
    v19[3] = &unk_1E6994A60;
    uint64_t v11 = v7;
    uint64_t v20 = v11;
    [v6 performOnOpenFileDescriptor:v19 error:0];
    if ([v6 isUnixDir])
    {
      v11->_int type = 1;
    }
    else
    {
      if ([v6 isSymLink])
      {
        v11->_int type = 3;
        uint64_t v12 = [v6 symlinkContent];
        symlinkContent = v11->_symlinkContent;
        v11->_symlinkContent = (NSString *)v12;
LABEL_13:

        goto LABEL_14;
      }
      v11->_int type = 2;
      v11->_int mode = 0;
      if ([v6 isWritable]) {
        v11->_mode |= 1u;
      }
      if ([v6 isExecutable] && objc_msgSend(v6, "isFile")) {
        v11->_mode |= 2u;
      }
      uint64_t v14 = [v6 generationID];
      generationID = v11->_generationID;
      v11->_generationID = (BRCGenerationID *)v14;

      v11->_int64_t size = [v6 size];
      v11->_int64_t mtime = [v6 modificationTime];
      v11->_isDirty = a4;
    }
    symlinkContent = [v6 xattrs];
    id v16 = [v6 session];
    __int16 v17 = [v16 stageRegistry];
    [(BRCPackageItem *)v11 _setXattrs:symlinkContent stageRegistry:v17];

    goto LABEL_13;
  }
LABEL_14:

  return v7;
}

uint64_t __66__BRCPackageItem_LegacyAdditions__initWithRelativePath_markDirty___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = BRCCopyFakeQuarantineInfo(a2, 0);
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 88);
  *(void *)(v4 + 88) = v3;

  return 0;
}

+ (BOOL)_rescanDirectoryInPackage:(id)a3 error:(id *)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isPackageRoot] & 1) == 0 && (objc_msgSend(v4, "isInPackage") & 1) == 0)
  {
    v45 = brc_bread_crumbs();
    v46 = brc_default_log();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
      +[BRCPackageItem(LegacyAdditions) _rescanDirectoryInPackage:error:].cold.4();
    }
  }
  unsigned int v53 = 0;
  id v5 = [[BRCDirectoryEnumerator alloc] initForEnumeratingBelow:v4 recursive:1 error:&v53];
  if (!v5)
  {
    if (v53 == 45)
    {
      brc_bread_crumbs();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      v28 = brc_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        +[BRCPackageItem(LegacyAdditions) _rescanDirectoryInPackage:error:]();
      }

      BOOL v29 = 1;
    }
    else
    {
      uint64_t v30 = brc_bread_crumbs();
      v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        +[BRCPackageItem(LegacyAdditions) _rescanDirectoryInPackage:error:]();
      }

      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", v53);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v32 = brc_bread_crumbs();
        v33 = brc_default_log();
        if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
        {
          v44 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v55 = "+[BRCPackageItem(LegacyAdditions) _rescanDirectoryInPackage:error:]";
          __int16 v56 = 2080;
          if (!a4) {
            v44 = "(ignored by caller)";
          }
          id v57 = (id)v44;
          __int16 v58 = 2112;
          id v59 = v8;
          __int16 v60 = 2112;
          v61 = v32;
          _os_log_error_impl(&dword_1D353B000, v33, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a4)
      {
        id v8 = v8;
        BOOL v29 = 0;
        *a4 = v8;
      }
      else
      {
        BOOL v29 = 0;
      }
    }
    goto LABEL_48;
  }
  id v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[BRCPackageItem(LegacyAdditions) _rescanDirectoryInPackage:error:]();
  }

  v48 = v4;
  id v8 = [v4 session];
  uint64_t v9 = 0;
  v50 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = "+[BRCPackageItem(LegacyAdditions) _rescanDirectoryInPackage:error:]";
  do
  {
    uint64_t v12 = v10;
    uint64_t v10 = [v5 nextObject];

    if (!v10) {
      break;
    }
    v13 = (void *)MEMORY[0x1D9438760]();
    int __errnum = 0;
    if ([v10 resolveAndKeepOpenMustExist:1 error:&__errnum])
    {
      uint64_t v14 = [[BRCPackageItem alloc] initWithRelativePath:v10 markDirty:0];
      if ([v10 documentID])
      {
        int v15 = v11;
        id v16 = brc_bread_crumbs();
        __int16 v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v55 = (const char *)v10;
          __int16 v56 = 2112;
          id v57 = v16;
          _os_log_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Package items are not supposed to have documentID, but %@ does, cleaning up!%@", buf, 0x16u);
        }
        id v18 = v8;

        __int16 v19 = v50;
        if (!v50)
        {
          __int16 v19 = [MEMORY[0x1E4F63BE8] manager];
        }
        uint64_t v20 = [v10 physicalURL];
        v50 = v19;
        id v51 = v9;
        char v21 = [v19 deallocateDocumentIDOfItemAtURL:v20 error:&v51];
        id v22 = v51;

        if ((v21 & 1) == 0)
        {
          int v25 = brc_bread_crumbs();
          v26 = brc_default_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          {
            v27 = [v48 physicalURL];
            v47 = [v27 path];
            *(_DWORD *)buf = 138412802;
            v55 = v47;
            __int16 v56 = 2112;
            id v57 = v22;
            __int16 v58 = 2112;
            id v59 = v25;
            _os_log_fault_impl(&dword_1D353B000, v26, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to deallocate documentID at %@: %@%@", buf, 0x20u);
          }
          int v24 = 1;
          uint64_t v9 = v22;
          id v8 = v18;
          uint64_t v11 = v15;
          goto LABEL_22;
        }
        uint64_t v9 = v22;
        id v8 = v18;
        uint64_t v11 = v15;
      }
      [(BRCPackageItem *)v14 saveToDBWithSession:v8];
      [v10 close];
    }
    else
    {
      if (__errnum != 45)
      {
        v34 = brc_bread_crumbs();
        v35 = brc_default_log();
        if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
        {
          v43 = strerror(__errnum);
          *(_DWORD *)buf = 138412802;
          v55 = (const char *)v10;
          __int16 v56 = 2080;
          id v57 = v43;
          __int16 v58 = 2112;
          id v59 = v34;
          _os_log_error_impl(&dword_1D353B000, v35, (os_log_type_t)0x90u, "[ERROR] can't snapshot package item at %@: %s%@", buf, 0x20u);
        }

        uint64_t v36 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 16);

        uint64_t v9 = (void *)v36;
        break;
      }
      brc_bread_crumbs();
      uint64_t v14 = (BRCPackageItem *)objc_claimAutoreleasedReturnValue();
      int v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v55 = (const char *)v10;
        __int16 v56 = 2112;
        id v57 = v14;
        _os_log_debug_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring excluded package item at %@%@", buf, 0x16u);
      }
    }
    int v24 = 0;
LABEL_22:
  }
  while (!v24);
  if (v9)
  {
    id v37 = v9;
    v38 = a4;
    goto LABEL_43;
  }
  id v37 = 0;
  BOOL v29 = 1;
  v38 = a4;
  if (v53)
  {
    if (v53 != 45)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:");
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      if (v37)
      {
LABEL_43:
        v39 = brc_bread_crumbs();
        v40 = brc_default_log();
        if (os_log_type_enabled(v40, (os_log_type_t)0x90u))
        {
          v42 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v55 = "+[BRCPackageItem(LegacyAdditions) _rescanDirectoryInPackage:error:]";
          __int16 v56 = 2080;
          if (!v38) {
            v42 = "(ignored by caller)";
          }
          id v57 = (id)v42;
          __int16 v58 = 2112;
          id v59 = v37;
          __int16 v60 = 2112;
          v61 = v39;
          _os_log_error_impl(&dword_1D353B000, v40, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

        BOOL v29 = 0;
      }
    }
  }
  if (v38) {
    id *v38 = v37;
  }

  id v4 = v48;
LABEL_48:

  return v29;
}

+ (BOOL)_deleteSnapshotAtPath:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 appLibrary];
  id v7 = [v6 db];

  if ((objc_msgSend(v7, "execute:", @"DELETE FROM client_pkg_sizes WHERE item_doc_id = %u", objc_msgSend(v5, "documentID")) & 1) == 0)
  {
    id v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      int v16 = [v5 documentID];
      __int16 v17 = [v7 lastError];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)id v22 = v16;
      *(_WORD *)&v22[4] = 2112;
      *(void *)&v22[6] = v17;
      *(_WORD *)&v22[14] = 2112;
      *(void *)&v22[16] = v8;
      _os_log_error_impl(&dword_1D353B000, v9, (os_log_type_t)0x90u, "[ERROR] Could not delete package size aggregate entry for document %u: %@%@", buf, 0x1Cu);
    }
  }
  char v10 = objc_msgSend(v7, "execute:", @"DELETE FROM client_pkg_items WHERE item_doc_id = %u", objc_msgSend(v5, "documentID"));
  if ((v10 & 1) == 0)
  {
    id v11 = [v7 lastError];
    if (v11)
    {
      v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        id v18 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)id v22 = "+[BRCPackageItem(LegacyAdditions) _deleteSnapshotAtPath:error:]";
        *(_WORD *)&v22[8] = 2080;
        if (!a4) {
          id v18 = "(ignored by caller)";
        }
        *(void *)&v22[10] = v18;
        *(_WORD *)&v22[18] = 2112;
        *(void *)&v22[20] = v11;
        __int16 v23 = 2112;
        int v24 = v13;
        _os_log_error_impl(&dword_1D353B000, v14, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4)
    {
      id v11 = v11;
      *a4 = v11;
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG) && [v7 changes] >= 1)
  {
    brc_bread_crumbs();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = [v7 changes];
      int v20 = [v5 documentID];
      *(_DWORD *)buf = 134218498;
      *(void *)id v22 = v19;
      *(_WORD *)&v22[8] = 1024;
      *(_DWORD *)&v22[10] = v20;
      *(_WORD *)&v22[14] = 2112;
      *(void *)&v22[16] = v11;
      _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] removed %lld items in pkg:%u%@", buf, 0x1Cu);
    }

LABEL_16:
  }

  return v10;
}

+ (BOOL)updateSnapshotAtPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (([v5 isDocument] & 1) == 0)
  {
    uint64_t v9 = brc_bread_crumbs();
    char v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      +[BRCPackageItem(LegacyAdditions) updateSnapshotAtPath:error:]();
    }
  }
  if [v5 exists] && (objc_msgSend(v5, "isPackageRoot"))
  {
    if (!+[BRCPackageItem _deleteSnapshotAtPath:v5 error:a4])
    {
      BOOL v7 = 0;
      goto LABEL_8;
    }
    BOOL v6 = +[BRCPackageItem _rescanDirectoryInPackage:v5 error:a4];
  }
  else
  {
    BOOL v6 = +[BRCPackageItem _deleteSnapshotAtPath:v5 error:a4];
  }
  BOOL v7 = v6;
LABEL_8:

  return v7;
}

- (BOOL)changedAtRelpath:(id)a3
{
  id v4 = a3;
  if ([v4 exists] && objc_msgSend(v4, "fileID") == self->_fileID)
  {
    switch(self->_type)
    {
      case 1:
        LODWORD(self) = [v4 isUnixDir] ^ 1;
        goto LABEL_20;
      case 2:
        if (![v4 isFile]) {
          break;
        }
        int64_t size = self->_size;
        if (size != [v4 size]) {
          break;
        }
        int v6 = [v4 isWritable];
        int v7 = [v4 isExecutable];
        id v8 = [v4 generationID];
        int v9 = [v8 isEqualToGenerationID:self->_generationID orSignature:self->_contentSignature];

        if (!v9) {
          break;
        }
        int v10 = v6 | 2;
        if (!v7) {
          int v10 = v6;
        }
        LOBYTE(self) = self->_mode != v10;
        goto LABEL_20;
      case 3:
        if (![v4 isSymLink]) {
          break;
        }
        self = (BRCPackageItem *)self->_symlinkContent;
        id v11 = [v4 symlinkContent];
        LODWORD(self) = [(BRCPackageItem *)self isEqualToString:v11] ^ 1;

        goto LABEL_20;
      case 4:
        uint64_t v12 = brc_bread_crumbs();
        v13 = brc_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          -[BRCPackageItem(LegacyAdditions) changedAtRelpath:]();
        }

        goto LABEL_16;
      default:
LABEL_16:
        uint64_t v14 = brc_bread_crumbs();
        int v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          -[BRCPackageItem(LegacyAdditions) changedAtRelpath:]();
        }

        break;
    }
  }
  LOBYTE(self) = 1;
LABEL_20:

  return (char)self;
}

- (BOOL)setDirty:(BOOL)a3 session:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_isDirty == a3) {
    return 1;
  }
  BOOL v5 = a3;
  id v7 = a4;
  id v8 = brc_bread_crumbs();
  int v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = @"NO";
    *(_DWORD *)buf = 138412802;
    if (v5) {
      uint64_t v12 = @"YES";
    }
    uint64_t v14 = v12;
    __int16 v15 = 2112;
    int v16 = self;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Updating dirty status to %@ for %@%@", buf, 0x20u);
  }

  self->_isDirty = v5;
  int v10 = [v7 clientDB];

  char v4 = [v10 execute:@"UPDATE client_pkg_items SET is_dirty = %d WHERE item_doc_id = %llu AND rel_path = %@", self->_isDirty, self->_packageID, self->_pathInPackage];
  return v4;
}

+ (BOOL)packageChangedAtRelativePath:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isInPackage])
  {
    char v4 = [v3 pathOfPackageRoot];
    int v55 = [v4 documentID];
  }
  else
  {
    int v55 = [v3 documentID];
  }
  int __errnum = 0;
  memset(v56, 0, sizeof(v56));
  __brc_create_section(0, (uint64_t)"+[BRCPackageItem(LegacyAdditions) packageChangedAtRelativePath:]", 287, v56);
  BOOL v5 = brc_bread_crumbs();
  int v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    *(void *)id v59 = v56[0];
    *(_WORD *)&v59[8] = 1024;
    *(_DWORD *)&v59[10] = v55;
    *(_WORD *)&v59[14] = 2112;
    *(void *)&v59[16] = v3;
    *(_WORD *)&v59[24] = 2112;
    *(void *)&v59[26] = v5;
    _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx diffing package documentID:%u at %@%@", buf, 0x26u);
  }

  if (([v3 isInPackage] & 1) == 0 && (objc_msgSend(v3, "isPackageRoot") & 1) == 0)
  {
    v50 = brc_bread_crumbs();
    id v51 = brc_default_log();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
      +[BRCPackageItem(LegacyAdditions) packageChangedAtRelativePath:]();
    }
  }
  if (![v3 isInPackage])
  {
    v13 = [[BRCDirectoryEnumerator alloc] initForEnumeratingBelow:v3 recursive:1 error:&__errnum];
    char v14 = 0;
    __int16 v15 = 0;
    for (i = 0; ; i = v18)
    {
      if (v14) {
        goto LABEL_74;
      }
      int v16 = [(BRCPackageItem *)v13 nextObject];

      if (!v16)
      {
        BOOL v12 = __errnum != 0;
        if (__errnum)
        {
          __int16 v15 = brc_bread_crumbs();
          uint64_t v36 = brc_default_log();
          if (os_log_type_enabled(v36, (os_log_type_t)0x90u))
          {
            id v37 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", __errnum);
            *(_DWORD *)buf = 138412802;
            *(void *)id v59 = v3;
            *(_WORD *)&v59[8] = 2112;
            *(void *)&v59[10] = v37;
            *(_WORD *)&v59[18] = 2112;
            *(void *)&v59[20] = v15;
            _os_log_error_impl(&dword_1D353B000, v36, (os_log_type_t)0x90u, "[ERROR] Failed iterating with directory enumerator at path %@: (%@)%@", buf, 0x20u);
          }
        }
        else
        {
          __int16 v15 = brc_bread_crumbs();
          uint64_t v36 = brc_default_log();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
            +[BRCPackageItem(LegacyAdditions) packageChangedAtRelativePath:]();
          }
        }

        goto LABEL_75;
      }
      __int16 v15 = v16;
      __int16 v17 = (void *)MEMORY[0x1D9438760]();
      if ([v16 resolveAndKeepOpenMustExist:0 error:&__errnum]) {
        break;
      }
      if (__errnum == 45)
      {
        __int16 v23 = brc_bread_crumbs();
        int v24 = brc_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)id v59 = v16;
          *(_WORD *)&v59[8] = 2112;
          *(void *)&v59[10] = v23;
          _os_log_debug_impl(&dword_1D353B000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring excluded package item at %@%@", buf, 0x16u);
        }

        char v14 = 0;
        int __errnum = 0;
      }
      else
      {
        uint64_t v25 = brc_bread_crumbs();
        v26 = brc_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          v27 = strerror(__errnum);
          *(_DWORD *)buf = 138413058;
          *(void *)id v59 = v16;
          *(_WORD *)&v59[8] = 2080;
          *(void *)&v59[10] = v27;
          *(_WORD *)&v59[18] = 2112;
          *(void *)&v59[20] = a1;
          *(_WORD *)&v59[28] = 2112;
          *(void *)&v59[30] = v25;
          _os_log_debug_impl(&dword_1D353B000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] can't read package item at %@: %s - not matching %@%@", buf, 0x2Au);
        }

        char v14 = 1;
      }
      id v18 = i;
LABEL_46:
    }
    id v18 = +[BRCPackageItem packageItemForRelpath:v16];

    if (v18)
    {
      if (![v18 changedAtRelpath:v16])
      {
        char v14 = 0;
LABEL_45:
        [v15 close];
        goto LABEL_46;
      }
      uint64_t v19 = brc_bread_crumbs();
      int v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        char v21 = "dead";
        if ([v16 exists])
        {
          if ([v16 isFile]) {
            char v21 = "file";
          }
          else {
            char v21 = "directory";
          }
        }
        id v22 = [v16 pathRelativeToPackageRoot];
        *(_DWORD *)buf = 136316418;
        *(void *)id v59 = v21;
        *(_WORD *)&v59[8] = 2112;
        *(void *)&v59[10] = v22;
        *(_WORD *)&v59[18] = 1024;
        *(_DWORD *)&v59[20] = v55;
        *(_WORD *)&v59[24] = 2112;
        *(void *)&v59[26] = v15;
        *(_WORD *)&v59[34] = 2112;
        *(void *)&v59[36] = v18;
        __int16 v60 = 2112;
        v61 = v19;
        _os_log_debug_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] %s at '%@' in package with documentID:%u doesn't match\n    %@\n    %@%@", buf, 0x3Au);
      }
    }
    else
    {
      if (![v16 exists])
      {
        uint64_t v19 = brc_bread_crumbs();
        int v20 = brc_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          int v32 = [v16 isFile];
          uint64_t v33 = [v16 pathRelativeToPackageRoot];
          v34 = (void *)v33;
          *(_DWORD *)buf = 136316162;
          v35 = "directory";
          if (v32) {
            v35 = "file";
          }
          *(void *)id v59 = v35;
          *(_WORD *)&v59[8] = 2112;
          *(void *)&v59[10] = v33;
          *(_WORD *)&v59[18] = 1024;
          *(_DWORD *)&v59[20] = v55;
          *(_WORD *)&v59[24] = 2112;
          *(void *)&v59[26] = v15;
          *(_WORD *)&v59[34] = 2112;
          *(void *)&v59[36] = v19;
          _os_log_debug_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] %s at '%@' in package with documentID:%u is missing in snapshot and on disk\n    %@%@", buf, 0x30u);
        }
        char v14 = 0;
        goto LABEL_44;
      }
      uint64_t v19 = brc_bread_crumbs();
      int v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        int v28 = [v16 isFile];
        uint64_t v29 = [v16 pathRelativeToPackageRoot];
        uint64_t v30 = (void *)v29;
        *(_DWORD *)buf = 136316162;
        v31 = "directory";
        if (v28) {
          v31 = "file";
        }
        *(void *)id v59 = v31;
        *(_WORD *)&v59[8] = 2112;
        *(void *)&v59[10] = v29;
        *(_WORD *)&v59[18] = 1024;
        *(_DWORD *)&v59[20] = v55;
        *(_WORD *)&v59[24] = 2112;
        *(void *)&v59[26] = v15;
        *(_WORD *)&v59[34] = 2112;
        *(void *)&v59[36] = v19;
        _os_log_debug_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] %s at '%@' in package with documentID:%u is missing in snapshot\n    %@%@", buf, 0x30u);
      }
    }
    char v14 = 1;
LABEL_44:

    goto LABEL_45;
  }
  i = +[BRCPackageItem packageItemForRelpath:v3];
  if (!i)
  {
    if (([v3 exists] & 1) == 0)
    {
      brc_bread_crumbs();
      v13 = (BRCPackageItem *)objc_claimAutoreleasedReturnValue();
      __int16 v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v48 = [v3 pathRelativeToPackageRoot];
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)id v59 = v55;
        *(_WORD *)&v59[4] = 2112;
        *(void *)&v59[6] = v48;
        *(_WORD *)&v59[14] = 2112;
        *(void *)&v59[16] = v13;
        _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] no package item for documentID:%u at '%@' already gone from disk%@", buf, 0x1Cu);
      }
      i = 0;
      goto LABEL_70;
    }
    id v38 = v3;
    if (([v38 isInPackage] & 1) == 0)
    {
      v52 = brc_bread_crumbs();
      unsigned int v53 = brc_default_log();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT)) {
        +[BRCPackageItem(LegacyAdditions) packageChangedAtRelativePath:]();
      }
    }
    v39 = [v38 appLibrary];
    v40 = [v39 db];
    v41 = [v38 pathOfPackageRoot];
    uint64_t v42 = [v41 documentID];
    v43 = [v38 pathRelativeToPackageRoot];

    v44 = [v43 stringByDeletingLastPathComponent];
    v45 = (void *)[v40 fetch:@"SELECT file_id FROM client_pkg_items WHERE item_doc_id = %u AND rel_path = %@ AND is_dirty IS NULL", v42, v44];

    if ([v45 next])
    {
      [v45 close];

      v13 = [[BRCPackageItem alloc] initWithRelativePath:v38 markDirty:1];
      __int16 v15 = [v38 session];
      [(BRCPackageItem *)v13 saveToDBWithSession:v15];
    }
    else
    {

      brc_bread_crumbs();
      v13 = (BRCPackageItem *)objc_claimAutoreleasedReturnValue();
      __int16 v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v49 = [v38 pathRelativeToPackageRoot];
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)id v59 = v55;
        *(_WORD *)&v59[4] = 2112;
        *(void *)&v59[6] = v49;
        *(_WORD *)&v59[14] = 2112;
        *(void *)&v59[16] = v13;
        _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] no package item for documentID:%u at '%@', will be scanned%@", buf, 0x1Cu);
      }
    }
    i = 0;
LABEL_74:
    BOOL v12 = 1;
    goto LABEL_75;
  }
  if (([v3 resolveAndKeepOpenMustExist:1 error:&__errnum] & 1) == 0)
  {
    brc_bread_crumbs();
    v13 = (BRCPackageItem *)objc_claimAutoreleasedReturnValue();
    __int16 v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v46 = [v3 pathRelativeToPackageRoot];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)id v59 = v55;
      *(_WORD *)&v59[4] = 2112;
      *(void *)&v59[6] = v46;
      *(_WORD *)&v59[14] = 2112;
      *(void *)&v59[16] = v13;
      _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] unable to reopen path for documentID:%u at '%@'%@", buf, 0x1Cu);
    }
    goto LABEL_74;
  }
  if (i[104] || [i changedAtRelpath:v3])
  {
    id v8 = brc_bread_crumbs();
    int v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)id v59 = i;
      *(_WORD *)&v59[8] = 2112;
      *(void *)&v59[10] = v3;
      *(_WORD *)&v59[18] = 2112;
      *(void *)&v59[20] = v8;
      _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ doesn't match path %@%@", buf, 0x20u);
    }

    int v10 = [v3 session];
    [i setDirty:1 session:v10];

    char v11 = 1;
  }
  else
  {
    char v11 = 0;
  }
  [v3 close];
  if ((v11 & 1) == 0)
  {
    brc_bread_crumbs();
    v13 = (BRCPackageItem *)objc_claimAutoreleasedReturnValue();
    __int16 v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)id v59 = i;
      *(_WORD *)&v59[8] = 2112;
      *(void *)&v59[10] = v3;
      *(_WORD *)&v59[18] = 2112;
      *(void *)&v59[20] = v13;
      _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ matches path %@%@", buf, 0x20u);
    }
LABEL_70:
    BOOL v12 = 0;
LABEL_75:

    goto LABEL_76;
  }
  BOOL v12 = 1;
LABEL_76:
  __brc_leave_section(v56);

  return v12;
}

+ (BRCPackageItem)packageItemWithDocumentID:(unsigned int)a3 relativePath:(id)a4 db:(id)a5
{
  BOOL v5 = (void *)[a5 fetchObject:&__block_literal_global_63, @"SELECT item_doc_id, rel_path, item_type, asset_rank, file_id, is_dirty, quarantine_info, xattrs, signature_or_link, generation, size, mode, mtime FROM client_pkg_items WHERE item_doc_id = %u AND rel_path = %@", *(void *)&a3, a4 sql];
  return (BRCPackageItem *)v5;
}

id __77__BRCPackageItem_LegacyAdditions__packageItemWithDocumentID_relativePath_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v5 = [[BRCPackageItem alloc] initFromPQLResultSet:v4 error:a3];

  return v5;
}

+ (id)packageItemForRelpath:(id)a3
{
  id v4 = a3;
  if ([v4 isPackageRoot])
  {
    uint64_t v5 = [v4 documentID];
  }
  else
  {
    int v6 = [v4 pathOfPackageRoot];
    uint64_t v5 = [v6 documentID];
  }
  id v7 = [v4 pathRelativeToPackageRoot];
  id v8 = [v4 session];
  int v9 = [v8 clientDB];
  int v10 = [a1 packageItemWithDocumentID:v5 relativePath:v7 db:v9];

  return v10;
}

+ (int64_t)largestPackageItemSizeInDocumentID:(unsigned int)a3 session:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v5 = [a4 clientDB];
  int v6 = objc_msgSend(v5, "fetchObjectOfClass:sql:", objc_opt_class(), @"SELECT largest_file_size FROM client_pkg_sizes WHERE item_doc_id = %u", v4);

  int64_t v7 = [v6 unsignedLongLongValue];
  return v7;
}

+ (id)packageItemsForDocumentID:(unsigned int)a3 order:(unint64_t)a4 db:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = v7;
  if (a4 == 1)
  {
    int v9 = @"SELECT item_doc_id, rel_path, item_type, asset_rank, file_id, is_dirty, quarantine_info, xattrs, signature_or_link, generation, size, mode, mtime FROM client_pkg_items WHERE item_doc_id = %u ORDER BY asset_rank";
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    int v9 = @"SELECT item_doc_id, rel_path, item_type, asset_rank, file_id, is_dirty, quarantine_info, xattrs, signature_or_link, generation, size, mode, mtime FROM client_pkg_items WHERE item_doc_id = %u ORDER BY rel_path";
LABEL_5:
    int v10 = objc_msgSend(v7, "fetch:", v9, v6);
    goto LABEL_7;
  }
  int v10 = 0;
LABEL_7:
  char v11 = [v10 enumerateObjects:&__block_literal_global_37];

  return v11;
}

id __70__BRCPackageItem_LegacyAdditions__packageItemsForDocumentID_order_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v5 = [[BRCPackageItem alloc] initFromPQLResultSet:v4 error:a3];

  return v5;
}

+ (int64_t)aggregatePackageSizeForPackageID:(unsigned int)a3 db:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a4, "numberWithSQL:", @"SELECT aggregate_size FROM client_pkg_sizes WHERE item_doc_id = %u", *(void *)&a3);
  if (v5)
  {
    uint64_t v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      char v11 = v5;
      __int16 v12 = 1024;
      unsigned int v13 = a3;
      __int16 v14 = 2112;
      __int16 v15 = v6;
      _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] aggregate size is %@ for documentID:%u%@", buf, 0x1Cu);
    }

    int64_t v8 = [v5 unsignedLongLongValue];
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (id)initFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRCPackageItem;
  uint64_t v6 = [(BRCPackageItem *)&v21 init];
  if (v6)
  {
    v6->_unint64_t packageID = [v5 longLongAtIndex:0];
    uint64_t v7 = [v5 stringAtIndex:1];
    pathInPackage = v6->_pathInPackage;
    v6->_pathInPackage = (NSString *)v7;

    v6->_int type = [v5 intAtIndex:2];
    v6->_assetRank = [v5 longLongAtIndex:3];
    v6->_fileID = [v5 longLongAtIndex:4];
    v6->_isDirty = [v5 BOOLAtIndex:5];
    uint64_t v9 = [v5 dataAtIndex:6];
    quarantineInfo = v6->_quarantineInfo;
    v6->_quarantineInfo = (NSData *)v9;

    uint64_t v11 = [v5 dataAtIndex:7];
    xattrSignature = v6->_xattrSignature;
    v6->_xattrSignature = (NSData *)v11;

    int type = v6->_type;
    if (type == 2)
    {
      uint64_t v16 = [v5 dataAtIndex:8];
      contentSignature = v6->_contentSignature;
      v6->_contentSignature = (NSData *)v16;

      uint64_t v18 = [v5 objectOfClass:objc_opt_class() atIndex:9];
      generationID = v6->_generationID;
      v6->_generationID = (BRCGenerationID *)v18;

      v6->_int64_t size = [v5 unsignedLongLongAtIndex:10];
      v6->_int mode = [v5 intAtIndex:11];
      v6->_int64_t mtime = [v5 longLongAtIndex:12];
    }
    else if (type == 3)
    {
      uint64_t v14 = [v5 stringAtIndex:8];
      symlinkContent = v6->_symlinkContent;
      v6->_symlinkContent = (NSString *)v14;
    }
  }

  return v6;
}

+ (BOOL)updateSignaturesForFilesInItem:(id)a3 fromCKPackage:(id)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v27 = a4;
  uint64_t v7 = [v6 session];
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v10 = [v6 st];
  uint64_t v11 = [v10 documentID];

  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 1;
  __int16 v12 = [v7 clientDB];
  v13 = (void *)[v12 fetch:@"SELECT asset_rank, generation  FROM client_pkg_items WHERE item_doc_id = %@ AND item_int type = %d", v11, 2];
  while (1)
  {

    if (![v13 next]) {
      break;
    }
    __int16 v12 = [v13 numberAtIndex:0];
    uint64_t v14 = [v13 objectOfClass:objc_opt_class() atIndex:1];
    __int16 v15 = [v14 signature];
    if (v15) {
      [v9 setObject:v15 forKeyedSubscript:v12];
    }
    objc_msgSend(v8, "addIndex:", objc_msgSend(v12, "unsignedIntegerValue"));
  }
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = 0;
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__51;
  v41 = __Block_byref_object_dispose__51;
  id v42 = 0;
  uint64_t v16 = [v27 itemCount];
  if (v16 == [v8 count])
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke;
    v28[3] = &unk_1E699B718;
    id v29 = v27;
    v34 = v43;
    id v30 = v9;
    id v31 = v6;
    v35 = &v44;
    uint64_t v36 = &v37;
    id v32 = v7;
    id v33 = v11;
    [v8 enumerateIndexesUsingBlock:v28];

    __int16 v17 = v29;
  }
  else
  {
    uint64_t v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      uint64_t v24 = [v27 itemCount];
      uint64_t v25 = [v8 count];
      *(_DWORD *)buf = 134218498;
      uint64_t v49 = v24;
      __int16 v50 = 2048;
      uint64_t v51 = v25;
      __int16 v52 = 2112;
      unsigned int v53 = v18;
      _os_log_fault_impl(&dword_1D353B000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: wrong number of items in package. pkg [%lu] assetRanks [%lu]%@", buf, 0x20u);
    }

    *((unsigned char *)v45 + 24) = 0;
    uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F19C40] code:17 userInfo:0];
    __int16 v17 = (void *)v38[5];
    v38[5] = v20;
  }

  int v21 = *((unsigned __int8 *)v45 + 24);
  if (a5 && !*((unsigned char *)v45 + 24))
  {
    *a5 = (id) v38[5];
    int v21 = *((unsigned __int8 *)v45 + 24);
  }
  BOOL v22 = v21 != 0;
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(&v44, 8);

  return v22;
}

void __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1D9438760]();
  uint64_t v7 = *(void **)(a1 + 32);
  ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  id v8 = objc_msgSend(v7, "itemAtIndex:");
  id v9 = *(void **)(a1 + 40);
  int v10 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];

  __int16 v12 = brc_bread_crumbs();
  unsigned int v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v29 = [v8 signature];
    *(_DWORD *)buf = 134218754;
    v34 = a2;
    __int16 v35 = 2112;
    uint64_t v36 = v29;
    __int16 v37 = 2112;
    id v38 = v8;
    __int16 v39 = 2112;
    v40 = v12;
    _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Learning signature for rank %ld, signature:%@, asset %@%@", buf, 0x2Au);
  }
  uint64_t v14 = [v8 signature];

  if (v14)
  {
    if (!v11) {
      goto LABEL_6;
    }
  }
  else
  {
    id v31 = brc_bread_crumbs();
    id v32 = brc_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
      __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke_cold_2();
    }

    if (!v11) {
      goto LABEL_6;
    }
  }
  __int16 v15 = [v8 signature];
  char v16 = [v11 isEqualToData:v15];

  if ((v16 & 1) == 0)
  {
    uint64_t v25 = brc_bread_crumbs();
    v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      id v30 = [*(id *)(a1 + 48) itemID];
      *(_DWORD *)buf = 138412802;
      v34 = v30;
      __int16 v35 = 2048;
      uint64_t v36 = a2;
      __int16 v37 = 2112;
      id v38 = v25;
      _os_log_debug_impl(&dword_1D353B000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] Failing updates of signatures for item %@ because pkg item with rank %lu changed%@", buf, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    *a3 = 1;
    uint64_t v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F19C40] code:17 userInfo:0];
    uint64_t v28 = *(void *)(*(void *)(a1 + 88) + 8);
    __int16 v23 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;
    goto LABEL_13;
  }
LABEL_6:
  __int16 v17 = [*(id *)(a1 + 56) clientDB];
  uint64_t v18 = [v8 signature];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v17 execute:@"UPDATE client_pkg_items SET signature_or_link = %@ WHERE item_doc_id = %@ AND asset_rank = %ld", v18, *(void *)(a1 + 64), a2];

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    *a3 = 1;
    uint64_t v19 = [*(id *)(a1 + 56) clientDB];
    uint64_t v20 = [v19 lastError];
    uint64_t v21 = *(void *)(*(void *)(a1 + 88) + 8);
    BOOL v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    __int16 v23 = brc_bread_crumbs();
    uint64_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke_cold_1();
    }

LABEL_13:
  }
}

- (BOOL)saveToDBWithSession:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_assetRank)
  {
    id v5 = +[BRCPersistedState loadFromClientStateInSession:v4];
    self->_assetRank = [v5 allocatePackageItemRank];
  }
  switch(self->_type)
  {
    case 1:
      id v6 = v37;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      uint64_t v7 = __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_2;
      goto LABEL_7;
    case 2:
      id v6 = v38;
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      uint64_t v7 = __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke;
      goto LABEL_7;
    case 3:
      id v6 = v36;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      uint64_t v7 = __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_3;
LABEL_7:
      v6[2] = v7;
      v6[3] = &unk_1E699B740;
      v6[4] = self;
      id v8 = (uint64_t (**)(void, void, void))MEMORY[0x1D94389C0]();
      if (!v8) {
        goto LABEL_8;
      }
      goto LABEL_11;
    case 4:
      uint64_t v28 = brc_bread_crumbs();
      id v29 = brc_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v40 = self;
        __int16 v41 = 2112;
        id v42 = v28;
        _os_log_impl(&dword_1D353B000, v29, OS_LOG_TYPE_DEFAULT, "[NOTICE] Ignoring tombstone pkg item %@%@", buf, 0x16u);
      }

      brc_bread_crumbs();
      id v8 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BRCPackageItem(DatabaseMethods) saveToDBWithSession:].cold.4();
      }
      BOOL v16 = 1;
      goto LABEL_24;
    default:
LABEL_8:
      id v9 = brc_bread_crumbs();
      int v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[BRCPackageItem(DatabaseMethods) saveToDBWithSession:]();
      }

      id v8 = 0;
LABEL_11:
      uint64_t v11 = [v4 clientDB];
      uint64_t v12 = [v11 sqliteErrorHandler];

      unsigned int v13 = [v4 clientDB];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_81;
      v34[3] = &unk_1E6994208;
      uint64_t v14 = (id)v12;
      __int16 v35 = v14;
      LOBYTE(v12) = ((uint64_t (**)(void, void *, void *))v8)[2](v8, v13, v34);

      if (v12) {
        goto LABEL_12;
      }
      uint64_t v18 = [v4 clientDB];
      uint64_t v19 = [v18 lastError];
      int v20 = [v19 isSqliteErrorCode:19];

      if (!v20) {
        goto LABEL_18;
      }
      uint64_t v21 = brc_bread_crumbs();
      BOOL v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v40 = self;
        __int16 v41 = 2112;
        id v42 = v21;
        _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEFAULT, "[NOTICE] Overriding an already declared item %@%@", buf, 0x16u);
      }

      __int16 v23 = [v4 clientDB];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_83;
      v32[3] = &unk_1E6999E50;
      v32[4] = self;
      id v33 = v8;
      int v24 = [v23 groupInTransaction:v32];

      if (v24)
      {
LABEL_12:
        __int16 v15 = brc_bread_crumbs();
        BOOL v16 = 1;
        __int16 v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[BRCPackageItem(DatabaseMethods) saveToDBWithSession:]();
        }
      }
      else
      {
LABEL_18:
        uint64_t v25 = brc_bread_crumbs();
        v26 = brc_default_log();
        if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
        {
          id v30 = [v4 clientDB];
          id v31 = [v30 lastError];
          *(_DWORD *)buf = 138412802;
          v40 = self;
          __int16 v41 = 2112;
          id v42 = v31;
          __int16 v43 = 2112;
          uint64_t v44 = v25;
          _os_log_error_impl(&dword_1D353B000, v26, (os_log_type_t)0x90u, "[ERROR] failed to save item %@ to DB: %@%@", buf, 0x20u);
        }
        __int16 v15 = brc_bread_crumbs();
        __int16 v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          -[BRCPackageItem(DatabaseMethods) saveToDBWithSession:]();
        }
        BOOL v16 = 0;
      }

LABEL_24:
      return v16;
  }
}

uint64_t __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  if (!*(unsigned char *)(v3 + 104)) {
    uint64_t v4 = 0;
  }
  return [a2 executeWithErrorHandler:a3, @"INSERT INTO client_pkg_items (item_doc_id, rel_path, item_type, asset_rank, file_id, is_dirty, quarantine_info, xattrs, signature_or_link, generation, size, mode, mtime) VALUES (%llu, %@, %u, %llu, %llu, %@, %@, %@, %@, %@, %llu, %u, %llu)", *(void *)(v3 + 8), *(void *)(v3 + 32), *(unsigned int *)(v3 + 56), *(void *)(v3 + 64), *(void *)(v3 + 16), v4, *(void *)(v3 + 88), *(void *)(v3 + 96), *(void *)(v3 + 80), *(void *)(v3 + 24), *(void *)(v3 + 48), *(char *)(v3 + 60), *(void *)(v3 + 40) sql];
}

uint64_t __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  if (!*(unsigned char *)(v3 + 104)) {
    uint64_t v4 = 0;
  }
  return [a2 executeWithErrorHandler:a3, @"INSERT INTO client_pkg_items (item_doc_id, rel_path, item_type, asset_rank, file_id, is_dirty, quarantine_info, xattrs) VALUES (%llu, %@, %u, %llu, %llu, %@, %@, %@)", *(void *)(v3 + 8), *(void *)(v3 + 32), *(unsigned int *)(v3 + 56), *(void *)(v3 + 64), *(void *)(v3 + 16), v4, *(void *)(v3 + 88), *(void *)(v3 + 96) sql];
}

uint64_t __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  if (!*(unsigned char *)(v3 + 104)) {
    uint64_t v4 = 0;
  }
  return [a2 executeWithErrorHandler:a3, @"INSERT INTO client_pkg_items (item_doc_id, rel_path, item_type, asset_rank, file_id, is_dirty, quarantine_info, xattrs, signature_or_link) VALUES (%llu, %@, %u, %llu, %llu, %@, %@, %@, %@)", *(void *)(v3 + 8), *(void *)(v3 + 32), *(unsigned int *)(v3 + 56), *(void *)(v3 + 64), *(void *)(v3 + 16), v4, *(void *)(v3 + 88), *(void *)(v3 + 96), *(void *)(v3 + 72) sql];
}

void __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_81(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (([v8 isSqliteErrorCode:19] & 1) == 0)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v10, v7, v8);
    }
  }
}

uint64_t __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_83(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 execute:@"DELETE FROM client_pkg_items WHERE item_doc_id = %llu AND rel_path = %@", *(void *)(*(void *)(a1 + 32) + 8), *(void *)(*(void *)(a1 + 32) + 32)])uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))(); {
  else
  }
    uint64_t v4 = 0;

  return v4;
}

+ (BOOL)dumpSession:(id)a3 toContext:(id)a4 db:(id)a5 error:(id *)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void *)[v11 fetch:@"SELECT item_doc_id, rel_path, item_type, asset_rank, file_id, is_dirty, quarantine_info, xattrs, signature_or_link, generation, size, mode, mtime  FROM client_pkg_items  ORDER BY item_doc_id, rel_path"];
  [v10 writeLineWithFormat:@"client_pkg_items"];
  [v10 writeLineWithFormat:@"================"];
  if ([v12 next])
  {
    do
    {
      unsigned int v13 = (void *)MEMORY[0x1D9438760]();
      id v14 = [[BRCPackageItem alloc] initFromPQLResultSet:v12 error:0];
      [v10 writeLineWithFormat:@"%@", v14];
    }
    while (([v12 next] & 1) != 0);
  }
  [v10 writeLineWithFormat:&stru_1F2AC7720];
  __int16 v15 = [v12 error];

  if (v15)
  {
    BOOL v16 = [v12 error];
    if (v16)
    {
      __int16 v17 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        int v20 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        BOOL v22 = "+[BRCPackageItem(DatabaseMethods) dumpSession:toContext:db:error:]";
        __int16 v23 = 2080;
        if (!a6) {
          int v20 = "(ignored by caller)";
        }
        int v24 = v20;
        __int16 v25 = 2112;
        v26 = v16;
        __int16 v27 = 2112;
        uint64_t v28 = v17;
        _os_log_error_impl(&dword_1D353B000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a6) {
      *a6 = v16;
    }
  }
  return v15 == 0;
}

- (void)symlinkContent
{
}

- (void)contentSignature
{
}

- (void)description
{
}

void __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: updating asset signature should work%@", v2, v3, v4, v5, v6);
}

void __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: cpi.signature%@", v2, v3, v4, v5, v6);
}

@end