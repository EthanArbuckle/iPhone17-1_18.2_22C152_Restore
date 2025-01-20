@interface BRCLocalVersion
- (BOOL)isMissingUploadsWithDiffs:(unint64_t)a3 isDocumentSyncPaused:(BOOL)a4 isDocumentResumingSync:(BOOL)a5;
- (BOOL)shouldRecreateUploadJobGivenDiffs:(unint64_t)a3;
- (BRCItemGlobalID)previousItemGlobalID;
- (BRCLocalVersion)initWithLocalVersion:(id)a3;
- (BRCLocalVersion)initWithVersion:(id)a3;
- (CKRecord)uploadedAssets;
- (NSError)uploadError;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithContext:(id)a3;
- (id)initForPackage:(BOOL)a3;
- (id)initFromResultSet:(id)a3 pos:(int)a4;
- (id)isPackageObj;
- (id)sizeObj;
- (unint64_t)diffAgainstLocalVersion:(id)a3;
- (void)_clearSignatures:(unint64_t)a3 isPackage:(BOOL)a4;
- (void)clearUploadedAssets;
- (void)setPreviousItemGlobalID:(id)a3;
- (void)setUploadError:(id)a3;
- (void)setUploadedAssets:(id)a3;
- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4;
- (void)updateFromFSAtPath:(id)a3 filenameOverride:(id)a4;
- (void)updateLocationAndMetaFromFSAtPath:(id)a3 updateFilename:(BOOL)a4 filenameOverride:(id)a5;
- (void)updateServerFieldsFromVersion:(id)a3;
@end

@implementation BRCLocalVersion

- (id)initFromResultSet:(id)a3 pos:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BRCLocalVersion;
  v7 = [(BRCVersion *)&v22 initFromResultSet:v6 pos:v4];
  if (v7)
  {
    uint64_t v8 = (v4 + 12);
    uint64_t v9 = (v4 + 13);
    uint64_t v10 = [v6 unarchivedObjectOfClass:objc_opt_class() atIndex:v8];
    v11 = (void *)v7[15];
    v7[15] = v10;

    if (_allowedClassesForErrors_once != -1) {
      dispatch_once(&_allowedClassesForErrors_once, &__block_literal_global_19);
    }
    id v12 = (id)_allowedClassesForErrors_allowedClasses;
    uint64_t v13 = [v6 unarchivedObjectOfClasses:v12 atIndex:v9];
    v14 = (void *)v7[16];
    v7[16] = v13;

    uint64_t v15 = [v6 objectOfClass:objc_opt_class() atIndex:(v9 + 1)];
    uint64_t v16 = [v6 numberAtIndex:(v9 + 2)];
    v17 = (void *)v16;
    if (v15 && v16)
    {
      v18 = [[BRCItemGlobalID alloc] initWithZoneRowID:v16 itemID:v15];
      v19 = (void *)v7[17];
      v7[17] = v18;
    }
    else
    {
      if (!(v15 | v16))
      {
LABEL_12:

        goto LABEL_13;
      }
      v19 = brc_bread_crumbs();
      v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v24 = v15;
        __int16 v25 = 2112;
        v26 = v17;
        __int16 v27 = 2112;
        v28 = v19;
        _os_log_fault_impl(&dword_1D353B000, v20, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Item has only one of the itemID %@ and zoneRowID %@ fields%@", buf, 0x20u);
      }
    }
    goto LABEL_12;
  }
LABEL_13:

  return v7;
}

- (void)updateFromFSAtPath:(id)a3 filenameOverride:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isFile])
  {
    self->super._size = [v6 size];
  }
  else
  {
    if (([v6 isPackageRoot] & 1) == 0)
    {
      v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[BRCLocalVersion(LegacyAdditions) updateFromFSAtPath:filenameOverride:]();
      }
    }
    uint64_t v8 = [v6 documentID];
    uint64_t v9 = [v6 session];
    uint64_t v10 = [v9 clientDB];
    self->super._size = +[BRCPackageItem aggregatePackageSizeForPackageID:v8 db:v10];
  }
  [(BRCLocalVersion *)self updateLocationAndMetaFromFSAtPath:v6 updateFilename:1 filenameOverride:v7];
}

- (void)updateLocationAndMetaFromFSAtPath:(id)a3 updateFilename:(BOOL)a4 filenameOverride:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v6)
  {
    uint64_t v10 = v8;
    if (!v8)
    {
      uint64_t v10 = [v11 filename];
    }
    objc_storeStrong((id *)&self->super._originalPOSIXName, v10);
    if (!v9) {
  }
    }
  self->super._mtime = [v11 modificationTime];
}

- (id)isPackageObj
{
  v2 = NSNumber;
  BOOL v3 = [(BRCVersion *)self isPackage];
  return (id)[v2 numberWithBool:v3];
}

- (id)sizeObj
{
  return (id)[NSNumber numberWithLongLong:self->super._size];
}

- (id)descriptionWithContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCLocalVersion;
  v5 = [(BRCVersion *)&v10 descriptionWithContext:v4];
  BOOL v6 = (void *)[v5 mutableCopy];

  uploadError = self->_uploadError;
  if (uploadError)
  {
    id v8 = +[BRCDumpContext stringFromError:uploadError context:v4];
    [v6 appendFormat:@" ul-error:%@", v8];
  }
  if (self->_uploadedAssets) {
    [v6 appendString:@" uploaded-assets"];
  }
  if (self->_previousItemGlobalID) {
    [v6 appendFormat:@" prev-item:%@", self->_previousItemGlobalID];
  }

  return v6;
}

- (unint64_t)diffAgainstLocalVersion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BRCVersion *)self diffAgainst:v4];
  if ((v5 & 0x1000000000000) != 0) {
    goto LABEL_7;
  }
  BOOL v6 = (void *)v4[15];
  id v7 = self->_uploadedAssets;
  id v8 = v6;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  uint64_t v9 = v8;
  if (!v8)
  {

    goto LABEL_14;
  }
  char v10 = [(CKRecord *)v7 isEqual:v8];

  if (v10)
  {
LABEL_7:
    if ((v5 & 0x2000000000000) != 0) {
      goto LABEL_18;
    }
LABEL_8:
    id v11 = (void *)v4[16];
    id v12 = self->_uploadError;
    uint64_t v13 = v11;
    if (v12 == v13)
    {

      goto LABEL_18;
    }
    v14 = v13;
    if (v13)
    {
      char v15 = [(NSError *)v12 isEqual:v13];

      if (v15) {
        goto LABEL_18;
      }
    }
    else
    {
    }
    v5 |= 0x2000000000000uLL;
    goto LABEL_18;
  }
LABEL_14:
  v5 |= 0x1000000000000uLL;
  if ((v5 & 0x2000000000000) == 0) {
    goto LABEL_8;
  }
LABEL_18:
  if ((v5 & 0x4000000000000) == 0)
  {
    uint64_t v16 = (void *)v4[17];
    v17 = self->_previousItemGlobalID;
    v18 = v16;
    if (v17 == v18)
    {
    }
    else
    {
      v19 = v18;
      if (v18)
      {
        BOOL v20 = [(BRCItemGlobalID *)v17 isEqual:v18];

        if (v20) {
          goto LABEL_26;
        }
      }
      else
      {
      }
      v5 |= 0x4000000000000uLL;
    }
  }
LABEL_26:

  return v5;
}

- (id)initForPackage:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BRCLocalVersion;
  id v4 = [(BRCLocalVersion *)&v7 init];
  unint64_t v5 = v4;
  if (v4) {
    [(BRCLocalVersion *)v4 _clearSignatures:3 isPackage:v3];
  }
  return v5;
}

- (BRCLocalVersion)initWithVersion:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BRCLocalVersion;
  return [(BRCVersion *)&v4 initWithVersion:a3];
}

- (BRCLocalVersion)initWithLocalVersion:(id)a3
{
  objc_super v4 = (id *)a3;
  unint64_t v5 = [(BRCLocalVersion *)self initWithVersion:v4];
  if (v5)
  {
    uint64_t v6 = [v4[15] copy];
    uploadedAssets = v5->_uploadedAssets;
    v5->_uploadedAssets = (CKRecord *)v6;

    uint64_t v8 = [v4[16] copy];
    uploadError = v5->_uploadError;
    v5->_uploadError = (NSError *)v8;

    uint64_t v10 = [v4[17] copy];
    previousItemGlobalID = v5->_previousItemGlobalID;
    v5->_previousItemGlobalID = (BRCItemGlobalID *)v10;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithLocalVersion:self];
}

- (BOOL)shouldRecreateUploadJobGivenDiffs:(unint64_t)a3
{
  return (a3 & 0x4000C007A0000) != 0;
}

- (BOOL)isMissingUploadsWithDiffs:(unint64_t)a3 isDocumentSyncPaused:(BOOL)a4 isDocumentResumingSync:(BOOL)a5
{
  BOOL v5 = a5;
  if ([(NSData *)self->super._contentSignature brc_signatureIsPendingPlaceHolder])
  {
    uint64_t v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalVersion isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:].cold.8();
    }

    if (!a4 && !v5) {
      return 1;
    }
    id v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalVersion isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:].cold.7();
    }
  }
  if ([(NSData *)self->super._thumbnailSignature brc_signatureIsPendingPlaceHolder])
  {
    uint64_t v13 = brc_bread_crumbs();
    v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalVersion isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:].cold.6();
    }

    if (!a4 && !v5) {
      return 1;
    }
    char v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalVersion isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:].cold.5();
    }
  }
  if ((a3 & 0x200000) != 0 && self->super._xattrSignature)
  {
    v17 = brc_bread_crumbs();
    v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalVersion isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:].cold.4();
    }

    if (!a4 && !v5) {
      return 1;
    }
    v19 = brc_bread_crumbs();
    BOOL v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalVersion isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:]();
    }
  }
  if ((a3 & 0x1000000000000) != 0 && !self->_uploadedAssets)
  {
    objc_super v22 = brc_bread_crumbs();
    v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalVersion isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:]();
    }
  }
  else
  {
    if ((a3 & 0x2000000000000) == 0 || self->_uploadError) {
      return 0;
    }
    objc_super v22 = brc_bread_crumbs();
    v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocalVersion isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:]();
    }
  }

  return 1;
}

- (void)_clearSignatures:(unint64_t)a3 isPackage:(BOOL)a4
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F1C9B8], "brc_pendingPlaceholderForPackage:", a4);
    uint64_t v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    contentSignature = self->super._contentSignature;
    self->super._contentSignature = v6;
  }
  if ((a3 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E4F1C9B8], "brc_pendingPlaceholderForPackage:", 0, a4);
    uint64_t v8 = (NSData *)objc_claimAutoreleasedReturnValue();
    thumbnailSignature = self->super._thumbnailSignature;
    self->super._thumbnailSignature = v8;
  }
  else if (!a3 && !self->_uploadedAssets && !self->_uploadError)
  {
    return;
  }
  uploadedAssets = self->_uploadedAssets;
  self->_uploadedAssets = 0;

  uploadError = self->_uploadError;
  self->_uploadError = 0;
}

- (void)clearUploadedAssets
{
  uploadedAssets = self->_uploadedAssets;
  self->_uploadedAssets = 0;

  uploadError = self->_uploadError;
  self->_uploadError = 0;
}

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  sqlite3_bind_blob(a3, a4, (const void *)[v6 bytes], objc_msgSend(v6, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)updateServerFieldsFromVersion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 conflictLoserEtags];
  conflictLoserEtags = self->super._conflictLoserEtags;
  self->super._conflictLoserEtags = v5;

  objc_super v7 = [v4 lastEditorDeviceOrUserRowID];
  [(BRCVersion *)self setLastEditorDeviceOrUserRowID:v7];

  id v8 = [v4 lastEditorDeviceName];

  [(BRCVersion *)self setLastEditorDeviceName:v8];
}

- (CKRecord)uploadedAssets
{
  return self->_uploadedAssets;
}

- (void)setUploadedAssets:(id)a3
{
}

- (NSError)uploadError
{
  return self->_uploadError;
}

- (void)setUploadError:(id)a3
{
}

- (BRCItemGlobalID)previousItemGlobalID
{
  return self->_previousItemGlobalID;
}

- (void)setPreviousItemGlobalID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousItemGlobalID, 0);
  objc_storeStrong((id *)&self->_uploadError, 0);
  objc_storeStrong((id *)&self->_uploadedAssets, 0);
}

- (void)isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] we're a document with an upload error change%@", v2, v3, v4, v5, v6);
}

- (void)isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] we're a document with an uploaded asset change%@", v2, v3, v4, v5, v6);
}

- (void)isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Document is sync paused or resuming sync -> ignore xattr change%@", v2, v3, v4, v5, v6);
}

- (void)isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] we're a document with an xattr change%@", v2, v3, v4, v5, v6);
}

- (void)isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Document is sync paused or resuming sync -> ignore the missing thumbnail signature%@", v2, v3, v4, v5, v6);
}

- (void)isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:.cold.6()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] we're a document missing a thumbnail signature%@", v2, v3, v4, v5, v6);
}

- (void)isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:.cold.7()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Document is sync paused or resuming sync -> ignore the missing content signature%@", v2, v3, v4, v5, v6);
}

- (void)isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:.cold.8()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] we're a document missing a content signature%@", v2, v3, v4, v5, v6);
}

@end