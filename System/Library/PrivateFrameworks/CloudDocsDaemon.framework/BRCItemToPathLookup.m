@interface BRCItemToPathLookup
+ (id)lookupForItem:(id)a3;
+ (id)lookupForServerItem:(id)a3 cleanupFaults:(BOOL)a4;
- (BOOL)_fetchByDocumentID;
- (BOOL)_fetchByFileID;
- (BOOL)_fetchByPath;
- (BOOL)computeLogicalPath:(id *)a3 physicalPath:(id *)a4 isDirectory:(BOOL *)a5;
- (BOOL)fileSystemIDMayStillExist;
- (BRCAppLibrary)coordinatedURLAppLibrary;
- (BRCItemToPathLookup)initWithItem:(id)a3;
- (BRCItemToPathLookup)initWithServerItem:(id)a3 cleanupFaults:(BOOL)a4;
- (BRCRelativePath)byFileSystemID;
- (BRCRelativePath)byPath;
- (BRCRelativePath)parentPath;
- (NSURL)coordinatedReadURL;
- (NSURL)coordinatedWriteURL;
- (id)description;
- (void)_fetchByDocumentID;
- (void)_fetchByFileID;
- (void)_fetchByPath;
- (void)_fetchParent;
- (void)closePaths;
- (void)dealloc;
@end

@implementation BRCItemToPathLookup

- (BRCItemToPathLookup)initWithItem:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRCItemToPathLookup;
  v6 = [(BRCItemToPathLookup *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_item, a3);
    uint64_t v8 = [v5 serverZone];
    serverZone = v7->_serverZone;
    v7->_serverZone = (BRCServerZone *)v8;

    if (!v7->_item)
    {
      v11 = brc_bread_crumbs();
      v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[BRCItemToPathLookup initWithItem:]();
      }
    }
    if (!v7->_serverZone)
    {
      v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BRCItemToPathLookup initWithItem:]();
      }
    }
  }

  return v7;
}

- (BRCItemToPathLookup)initWithServerItem:(id)a3 cleanupFaults:(BOOL)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BRCItemToPathLookup;
  uint64_t v8 = [(BRCItemToPathLookup *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_serverItem, a3);
    uint64_t v10 = [v7 serverZone];
    serverZone = v9->_serverZone;
    v9->_serverZone = (BRCServerZone *)v10;

    v9->_cleanupFaults = a4;
    if (!v7)
    {
      v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BRCGlobalProgress didDeleteDocument:]();
      }
    }
    if (!v9->_serverZone)
    {
      objc_super v15 = brc_bread_crumbs();
      v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[BRCItemToPathLookup initWithItem:]();
      }
    }
  }

  return v9;
}

+ (id)lookupForItem:(id)a3
{
  id v3 = a3;
  v4 = [[BRCItemToPathLookup alloc] initWithItem:v3];

  return v4;
}

+ (id)lookupForServerItem:(id)a3 cleanupFaults:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [[BRCItemToPathLookup alloc] initWithServerItem:v5 cleanupFaults:v4];

  return v6;
}

- (BRCRelativePath)parentPath
{
  if ((*(unsigned char *)&self->_fetched & 8) == 0) {
    [(BRCItemToPathLookup *)self _fetchParent];
  }
  parentPath = self->_parentPath;
  return parentPath;
}

- (BRCRelativePath)byPath
{
  if ((*(unsigned char *)&self->_fetched & 4) == 0) {
    [(BRCItemToPathLookup *)self _fetchByPath];
  }
  matchByPath = self->_matchByPath;
  return matchByPath;
}

- (BOOL)computeLogicalPath:(id *)a3 physicalPath:(id *)a4 isDirectory:(BOOL *)a5
{
  p_item = &self->_item;
  if ([(BRCLocalItem *)self->_item isFSRoot])
  {
    uint64_t v10 = [(BRCLocalItem *)*p_item asFSRoot];
    v11 = [v10 appLibrary];
    v12 = [v11 absolutePath];

    BOOL v13 = v12 != 0;
    if (v12)
    {
      if (a5) {
        *a5 = 1;
      }
      if (a3) {
        objc_storeStrong(a3, v12);
      }
    }
    else
    {
      v21 = brc_bread_crumbs();
      v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        -[BRCItemToPathLookup computeLogicalPath:physicalPath:isDirectory:]();
      }
    }
LABEL_26:
    v25 = 0;
    v26 = 0;
    goto LABEL_27;
  }
  p_serverItem = &self->_serverItem;
  if ([(BRCServerItem *)self->_serverItem isFSRoot])
  {
    objc_super v15 = [(BRCServerItem *)*p_serverItem appLibraryForRootItem];
    v16 = [v15 absolutePath];

    BOOL v13 = v16 != 0;
    if (v16)
    {
      if (a5) {
        *a5 = 1;
      }
      if (a3) {
        objc_storeStrong(a3, v16);
      }
    }
    else
    {
      v23 = brc_bread_crumbs();
      v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[BRCItemToPathLookup computeLogicalPath:physicalPath:isDirectory:]();
      }
    }
    goto LABEL_26;
  }
  if (*p_item)
  {
    BOOL v17 = [(BRCLocalItem *)*p_item isDirectoryWithPackageName];
    v18 = *p_item;
    if (!v17)
    {
      if ([(BRCLocalItem *)v18 isFault] || [(BRCLocalItem *)*p_item isReserved])
      {
        v19 = [(BRCLocalItem *)*p_item st];
        uint64_t v20 = [v19 logicalName];
LABEL_32:
        v25 = (void *)v20;

        if ([(BRCLocalItem *)*p_item isDirectory]) {
          goto LABEL_33;
        }
        p_serverItem = (BRCServerItem **)p_item;
LABEL_35:
        char v29 = [(BRCServerItem *)*p_serverItem isPackage];
        goto LABEL_36;
      }
      v18 = *p_item;
    }
    v19 = [(BRCLocalItem *)v18 st];
    uint64_t v20 = [v19 filename];
    goto LABEL_32;
  }
  v28 = [(BRCServerItem *)*p_serverItem st];
  v25 = [v28 representableName];

  if (![(BRCServerItem *)*p_serverItem isDirectory]) {
    goto LABEL_35;
  }
LABEL_33:
  char v29 = 1;
LABEL_36:
  v30 = [(BRCItemToPathLookup *)self parentPath];
  v26 = [v30 absolutePath];

  if (a5) {
    *a5 = v29;
  }
  if (v26)
  {
    if (a3)
    {
      v31 = [v26 stringByAppendingPathComponent:v25];
      id v32 = *a3;
      *a3 = v31;
    }
    if (a4 && [(BRCLocalItem *)*p_item isFault])
    {
      v33 = [(BRCLocalItem *)*p_item st];
      v34 = [v33 filename];
      v35 = [v26 stringByAppendingPathComponent:v34];
      id v36 = *a4;
      *a4 = v35;
    }
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_27:

  return v13;
}

- (NSURL)coordinatedWriteURL
{
  id v6 = 0;
  id v7 = 0;
  unsigned __int8 v5 = 0;
  v2 = 0;
  if ([(BRCItemToPathLookup *)self computeLogicalPath:&v7 physicalPath:&v6 isDirectory:&v5])
  {
    v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:v5];
    if (v6)
    {
      id v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:v5];
      _CFURLPromiseSetPhysicalURL();
    }
  }

  return (NSURL *)v2;
}

- (NSURL)coordinatedReadURL
{
  if (!self->_item)
  {
    uint64_t v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCItemToPathLookup initWithItem:]();
    }
  }
  id v3 = [(BRCItemToPathLookup *)self byFileSystemID];
  if ([(BRCLocalItem *)self->_item isFault])
  {
    BOOL v4 = [(BRCLocalItem *)self->_item st];
    unsigned __int8 v5 = [v4 logicalName];
    id v6 = [v3 logicalURLWithLogicalName:v5];
  }
  else
  {
    id v6 = [v3 logicalURLWithLogicalName:0];
  }

  return (NSURL *)v6;
}

- (BRCAppLibrary)coordinatedURLAppLibrary
{
  v2 = [(BRCItemToPathLookup *)self byFileSystemID];
  id v3 = [v2 appLibrary];

  return (BRCAppLibrary *)v3;
}

- (BRCRelativePath)byFileSystemID
{
  item = self->_item;
  if (!item) {
    item = self->_serverItem;
  }
  id v4 = item;
  if ([v4 isDocument])
  {
    if ((*(unsigned char *)&self->_fetched & 2) == 0) {
      [(BRCItemToPathLookup *)self _fetchByDocumentID];
    }
    uint64_t v5 = 48;
  }
  else
  {
    if ((*(unsigned char *)&self->_fetched & 1) == 0) {
      [(BRCItemToPathLookup *)self _fetchByFileID];
    }
    uint64_t v5 = 40;
  }
  id v6 = (BRCRelativePath *)*(id *)((char *)&self->super.isa + v5);

  return v6;
}

- (BOOL)fileSystemIDMayStillExist
{
  id v3 = [(BRCItemToPathLookup *)self byFileSystemID];
  BOOL v4 = ([v3 exists] & 1) != 0 || self->_fileSystemIDMayStillExist;

  return v4;
}

- (void)_fetchParent
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: asked the parent of a root item%@", v2, v3, v4, v5, v6);
}

- (BOOL)_fetchByFileID
{
  *(unsigned char *)&self->_fetched |= 1u;
  uint64_t v3 = [(BRCLocalItem *)self->_item st];
  uint64_t v4 = [v3 fileID];
  uint64_t v5 = [v4 unsignedLongLongValue];

  if (!v5) {
    return 0;
  }
  if ([(BRCRelativePath *)self->_matchByPath exists]
    && [(BRCRelativePath *)self->_matchByPath fileID] == v5)
  {
    matchByPath = self->_matchByPath;
LABEL_8:
    id v7 = matchByPath;
    matchByFileID = self->_matchByFileID;
    self->_matchByFileID = v7;
    goto LABEL_11;
  }
  if ([(BRCRelativePath *)self->_matchByDocumentID exists]
    && [(BRCRelativePath *)self->_matchByDocumentID fileID] == v5)
  {
    matchByPath = self->_matchByDocumentID;
    goto LABEL_8;
  }
  uint64_t v10 = [BRCRelativePath alloc];
  matchByFileID = [(BRCServerZone *)self->_serverZone session];
  v11 = [(BRCRelativePath *)v10 initWithFileID:v5 session:matchByFileID];
  v12 = self->_matchByFileID;
  self->_matchByFileID = v11;

LABEL_11:
  int v28 = 0;
  p_matchByFileID = &self->_matchByFileID;
  BOOL v9 = 1;
  if (![(BRCRelativePath *)self->_matchByFileID resolveAndKeepOpenMustExist:1 error:&v28])
  {
    if ([(BRCRelativePath *)*p_matchByFileID isUnresolvableDueToProtection])
    {
      v14 = brc_bread_crumbs();
      objc_super v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[BRCItemToPathLookup _fetchByFileID]();
      }

      self->_fileSystemIDMayStillExist = 1;
    }
    v16 = [(BRCLocalItem *)self->_item st];
    BOOL v17 = [v16 stagedFileID];

    if (-[BRCLocalItem fromReadOnlyDB](self->_item, "fromReadOnlyDB") && [v17 longLongValue])
    {
      v18 = [BRCRelativePath alloc];
      uint64_t v19 = [v17 longLongValue];
      uint64_t v20 = [(BRCServerZone *)self->_serverZone session];
      v21 = [(BRCRelativePath *)v18 initWithFileID:v19 session:v20];
      v22 = self->_matchByFileID;
      self->_matchByFileID = v21;

      if ([(BRCRelativePath *)self->_matchByFileID resolveAndKeepOpenMustExist:1 error:&v28])
      {
        brc_bread_crumbs();
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        v24 = brc_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          -[BRCItemToPathLookup _fetchByFileID]();
        }

        BOOL v9 = 1;
        goto LABEL_27;
      }
      if ([(BRCRelativePath *)*p_matchByFileID isUnresolvableDueToProtection])
      {
        v25 = brc_bread_crumbs();
        v26 = brc_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[BRCItemToPathLookup _fetchByFileID]();
        }

        self->_fileSystemIDMayStillExist = 1;
      }
    }
    BOOL v9 = 0;
    id v23 = *p_matchByFileID;
    *p_matchByFileID = 0;
LABEL_27:
  }
  return v9;
}

- (BOOL)_fetchByPath
{
  v47[2] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)&self->_fetched |= 4u;
  uint64_t v3 = [(BRCItemToPathLookup *)self parentPath];

  if (!v3) {
    return 0;
  }
  p_matchByFileID = &self->_matchByFileID;
  if ([(BRCRelativePath *)self->_matchByFileID parentFileID] == self->_parentFileID)
  {
    uint64_t v5 = [(BRCRelativePath *)self->_matchByFileID filename];
    uint8_t v6 = [(BRCLocalItem *)self->_item st];
    id v7 = [v6 filename];
    char v8 = [v5 isEqualToString:v7];

    if (v8) {
      goto LABEL_6;
    }
  }
  p_matchByFileID = &self->_matchByDocumentID;
  if ([(BRCRelativePath *)self->_matchByDocumentID parentFileID] == self->_parentFileID)
  {
    BOOL v9 = [(BRCRelativePath *)self->_matchByDocumentID filename];
    uint64_t v10 = [(BRCLocalItem *)self->_item st];
    v11 = [v10 filename];
    int v12 = [v9 isEqualToString:v11];

    if (v12)
    {
LABEL_6:
      BOOL v13 = *p_matchByFileID;
      matchByPath = self->_matchByPath;
      self->_matchByPath = v13;
    }
  }
  int v41 = 0;
  p_matchByPath = &self->_matchByPath;
  objc_super v15 = self->_matchByPath;
  if (!v15)
  {
    item = self->_item;
    if (item)
    {
      uint64_t v19 = [(BRCLocalItem *)item st];
      uint64_t v20 = [v19 filename];
    }
    else
    {
      v21 = [(BRCServerItem *)self->_serverItem st];
      id v22 = [v21 logicalName];
      uint64_t v23 = [v22 fileSystemRepresentation];

      objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", v23);
      uint64_t v20 = (BRCRelativePath *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)
        || ([(BRCServerItem *)self->_serverItem st],
            id v36 = objc_claimAutoreleasedReturnValue(),
            [v36 logicalName],
            v37 = objc_claimAutoreleasedReturnValue(),
            char v38 = [(BRCRelativePath *)v20 isEqualToString:v37],
            v37,
            v36,
            (v38 & 1) != 0))
      {
LABEL_16:
        v24 = [(BRCRelativePath *)self->_parentPath pathWithChildAtPath:v20];
        v25 = self->_matchByPath;
        self->_matchByPath = v24;

        BOOL v17 = [(BRCRelativePath *)self->_matchByPath resolveAndKeepOpenMustExist:0 error:&v41];
        if (!v17)
        {
          if ([(BRCRelativePath *)*p_matchByPath isUnresolvableDueToProtection])
          {
            v26 = brc_bread_crumbs();
            v27 = brc_default_log();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
              -[BRCItemToPathLookup _fetchByPath]();
            }

            self->_fileSystemIDMayStillExist = 1;
          }
          else
          {
            int v28 = brc_bread_crumbs();
            char v29 = brc_default_log();
            if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
            {
              parentPath = self->_parentPath;
              v35 = self->_matchByPath;
              *(_DWORD *)buf = 138413058;
              v43 = parentPath;
              __int16 v44 = 2112;
              v45 = v35;
              __int16 v46 = 1024;
              LODWORD(v47[0]) = v41;
              WORD2(v47[0]) = 2112;
              *(void *)((char *)v47 + 6) = v28;
              _os_log_error_impl(&dword_1D353B000, v29, (os_log_type_t)0x90u, "[ERROR] parent %@ exists, but failed resolving child %@ %{errno}d%@", buf, 0x26u);
            }

            if (v41 != 45)
            {
              v30 = brc_bread_crumbs();
              v31 = brc_default_log();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
                [(BRCItemToPathLookup *)&v41 _fetchByPath];
              }
            }
          }
          id v32 = *p_matchByPath;
          *p_matchByPath = 0;
        }
        goto LABEL_28;
      }
      uint64_t v19 = brc_bread_crumbs();
      v39 = brc_default_log();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        serverItem = self->_serverItem;
        *(_DWORD *)buf = 138412802;
        v43 = v20;
        __int16 v44 = 2112;
        v45 = serverItem;
        __int16 v46 = 2112;
        v47[0] = v19;
        _os_log_debug_impl(&dword_1D353B000, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] sanitized server filename to %@ for %@%@", buf, 0x20u);
      }
    }
    goto LABEL_16;
  }
  if (![(BRCRelativePath *)v15 resolveAndKeepOpenMustExist:0 error:&v41])
  {
    BOOL v17 = 0;
    uint64_t v20 = *p_matchByPath;
    *p_matchByPath = 0;
LABEL_28:

    return v17;
  }
  return 1;
}

- (BOOL)_fetchByDocumentID
{
  *(unsigned char *)&self->_fetched |= 2u;
  if (![(BRCLocalItem *)self->_item isDocument] || [(BRCLocalItem *)self->_item isReserved])
  {
    LOBYTE(v3) = 0;
    return v3;
  }
  uint64_t v5 = [(BRCLocalItem *)self->_item st];
  uint8_t v6 = [v5 documentID];
  int v3 = [v6 unsignedIntValue];

  if (!v3) {
    return v3;
  }
  self->_fileSystemIDMayStillExist = 1;
  if ((*(unsigned char *)&self->_fetched & 1) == 0) {
    [(BRCItemToPathLookup *)self _fetchByFileID];
  }
  p_matchByFileID = &self->_matchByFileID;
  if ([(BRCRelativePath *)self->_matchByFileID isDocument]) {
    goto LABEL_9;
  }
  matchByDocumentID = [(BRCItemToPathLookup *)self byPath];
  if (![matchByDocumentID exists])
  {
LABEL_14:

    goto LABEL_15;
  }
  p_matchByFileID = &self->_matchByPath;
  BOOL v10 = [(BRCRelativePath *)self->_matchByPath isDocument];

  if (v10)
  {
LABEL_9:
    if ([(BRCRelativePath *)*p_matchByFileID documentID] != v3) {
      goto LABEL_15;
    }
    char v8 = *p_matchByFileID;
    matchByDocumentID = self->_matchByDocumentID;
    self->_matchByDocumentID = v8;
    goto LABEL_14;
  }
LABEL_15:
  p_matchByDocumentID = &self->_matchByDocumentID;
  v11 = self->_matchByDocumentID;
  if (v11)
  {
    int v32 = 0;
    LOBYTE(v3) = [(BRCRelativePath *)v11 resolveAndKeepOpenMustExist:0 error:&v32];
    if ((v3 & 1) == 0)
    {
      if ([(BRCRelativePath *)*p_matchByDocumentID isUnresolvableDueToProtection])
      {
        BOOL v13 = brc_bread_crumbs();
        v14 = brc_default_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[BRCItemToPathLookup _fetchByDocumentID]();
        }

        self->_fileSystemIDMayStillExist = 1;
      }
      objc_super v15 = *p_matchByDocumentID;
      *p_matchByDocumentID = 0;
    }
  }
  else
  {
    v16 = [(BRCServerZone *)self->_serverZone session];
    BOOL v17 = [v16 volume];
    [v17 deviceID];
    uint64_t v18 = GSLibraryResolveDocumentId2();

    if (v18
      && ([(BRCLocalItem *)self->_item st],
          uint64_t v20 = objc_claimAutoreleasedReturnValue(),
          [v20 fileID],
          v21 = objc_claimAutoreleasedReturnValue(),
          uint64_t v22 = [v21 unsignedLongLongValue],
          v21,
          v20,
          v18 != v22))
    {
      v24 = [BRCRelativePath alloc];
      v25 = [(BRCServerZone *)self->_serverZone session];
      v26 = [(BRCRelativePath *)v24 initWithFileID:v18 session:v25];
      v27 = self->_matchByDocumentID;
      self->_matchByDocumentID = v26;

      int v31 = 0;
      if ([(BRCRelativePath *)self->_matchByDocumentID resolveAndKeepOpenMustExist:1 error:&v31]&& [(BRCRelativePath *)*p_matchByDocumentID documentID] == v3)
      {
        char v19 = 1;
      }
      else
      {
        if ([(BRCRelativePath *)*p_matchByDocumentID isUnresolvableDueToProtection])
        {
          int v28 = brc_bread_crumbs();
          char v29 = brc_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            -[BRCItemToPathLookup _fetchByDocumentID]();
          }

          self->_fileSystemIDMayStillExist = 1;
        }
        v30 = *p_matchByDocumentID;
        *p_matchByDocumentID = 0;

        char v19 = 0;
      }
      char v23 = 1;
    }
    else
    {
      char v23 = 0;
    }
    LOBYTE(v3) = v23 & v19;
  }
  return v3;
}

- (void)closePaths
{
  [(BRCRelativePath *)self->_matchByFileID close];
  matchByFileID = self->_matchByFileID;
  self->_matchByFileID = 0;

  [(BRCRelativePath *)self->_matchByPath close];
  matchByPath = self->_matchByPath;
  self->_matchByPath = 0;

  [(BRCRelativePath *)self->_matchByDocumentID close];
  matchByDocumentID = self->_matchByDocumentID;
  self->_matchByDocumentID = 0;

  [(BRCRelativePath *)self->_parentPath close];
  uint8_t v6 = self->_matchByPath;
  self->_matchByPath = 0;

  self->_fetched = 0;
}

- (void)dealloc
{
  [(BRCItemToPathLookup *)self closePaths];
  v3.receiver = self;
  v3.super_class = (Class)BRCItemToPathLookup;
  [(BRCItemToPathLookup *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  item = self->_item;
  serverItem = self->_serverItem;
  char fetched = (char)self->_fetched;
  if ((fetched & 8) != 0)
  {
    id v7 = [NSNumber numberWithUnsignedLongLong:self->_parentFileID];
    char v8 = (char)self->_fetched;
    if ((v8 & 8) != 0)
    {
      parentPath = self->_parentPath;
      if ((*(unsigned char *)&self->_fetched & 4) == 0) {
        goto LABEL_10;
      }
    }
    else
    {
      parentPath = (BRCRelativePath *)@"unfetched";
      if ((*(unsigned char *)&self->_fetched & 4) == 0) {
        goto LABEL_10;
      }
    }
LABEL_6:
    matchByPath = self->_matchByPath;
    if ((v8 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  id v7 = @"unfetched";
  char v8 = (char)self->_fetched;
  parentPath = (BRCRelativePath *)@"unfetched";
  if ((v8 & 4) != 0) {
    goto LABEL_6;
  }
LABEL_10:
  matchByPath = (BRCRelativePath *)@"unfetched";
  if ((v8 & 1) == 0)
  {
LABEL_11:
    matchByFileID = (BRCRelativePath *)@"unfetched";
    if ((v8 & 2) == 0) {
      goto LABEL_12;
    }
LABEL_8:
    matchByDocumentID = self->_matchByDocumentID;
    goto LABEL_13;
  }
LABEL_7:
  matchByFileID = self->_matchByFileID;
  if ((v8 & 2) != 0) {
    goto LABEL_8;
  }
LABEL_12:
  matchByDocumentID = (BRCRelativePath *)@"unfetched";
LABEL_13:
  BOOL v13 = [(BRCServerZone *)self->_serverZone clientZone];
  v14 = [v3 stringWithFormat:@"\n  localItem:         %@\n  serverItem:        %@\n  parentFileID:      %@\n  parentPath:        %@\n  matchByPath:       %@\n  matchByFileID:     %@\n  matchByDocumentID: %@\n  container:         %@", item, serverItem, v7, parentPath, matchByPath, matchByFileID, matchByDocumentID, v13];

  if ((fetched & 8) != 0) {
  return v14;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchByPath, 0);
  objc_storeStrong((id *)&self->_matchByDocumentID, 0);
  objc_storeStrong((id *)&self->_matchByFileID, 0);
  objc_storeStrong((id *)&self->_parentPath, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_serverItem, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (void)initWithItem:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _serverZone%@", v2, v3, v4, v5, v6);
}

- (void)initWithItem:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _item%@", v2, v3, v4, v5, v6);
}

- (void)computeLogicalPath:physicalPath:isDirectory:.cold.1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: there should be a logical path for %@%@");
}

- (void)_fetchByFileID
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Can't resolve by fileID for %@ due to content protection%@");
}

- (void)_fetchByPath
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1D353B000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: failed resolving child %{errno}d%@", (uint8_t *)v4, 0x12u);
}

- (void)_fetchByDocumentID
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Can't fetch by documentID due to file protection for %@%@");
}

@end