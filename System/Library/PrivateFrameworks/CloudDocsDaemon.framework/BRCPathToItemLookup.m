@interface BRCPathToItemLookup
+ (id)lookupForRelativePath:(id)a3;
- (BOOL)_fetchByDocumentID:(BOOL)a3;
- (BOOL)_fetchByFileID:(BOOL)a3;
- (BOOL)_fetchByPath;
- (BOOL)_fetchClientZone;
- (BOOL)_shareIDMatchesParent:(id)a3;
- (BRCClientZone)clientZone;
- (BRCDirectoryItem)parentItem;
- (BRCDocumentItem)byDocumentID;
- (BRCDocumentItem)byDocumentIDGlobally;
- (BRCLocalItem)byFileID;
- (BRCLocalItem)byFileIDGlobally;
- (BRCLocalItem)byPath;
- (BRCPQLConnection)db;
- (BRCPathToItemLookup)initWithRelativePath:(id)a3;
- (BRCPathToItemLookup)initWithRelativePath:(id)a3 db:(id)a4;
- (BRCRelativePath)relpathOfFSEvent;
- (BRCRelativePath)relpathOfItem;
- (BRCServerItem)serverByPath;
- (id)_byPathWithLastPathComponent:(id)a3;
- (id)_resolveClientZoneWhileFetchingFileID:(BOOL)a3 fetchindDocID:(BOOL)a4;
- (id)description;
- (void)parentItem;
- (void)setByDocumentID:(id)a3;
- (void)setByFileID:(id)a3;
@end

@implementation BRCPathToItemLookup

- (BRCPathToItemLookup)initWithRelativePath:(id)a3 db:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BRCPathToItemLookup;
  v9 = [(BRCPathToItemLookup *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_relpathOfFSEvent, a3);
    if ([v7 isInPackage])
    {
      v11 = [v7 pathOfPackageRoot];
    }
    else
    {
      v11 = (BRCRelativePath *)v7;
    }
    pathOfItem = v10->_pathOfItem;
    v10->_pathOfItem = v11;

    objc_storeStrong((id *)&v10->_db, a4);
  }

  return v10;
}

- (BRCPathToItemLookup)initWithRelativePath:(id)a3
{
  id v4 = a3;
  v5 = [v4 appLibrary];
  v6 = [v5 db];
  id v7 = [(BRCPathToItemLookup *)self initWithRelativePath:v4 db:v6];

  return v7;
}

+ (id)lookupForRelativePath:(id)a3
{
  id v3 = a3;
  id v4 = [[BRCPathToItemLookup alloc] initWithRelativePath:v3];

  return v4;
}

- (void)setByFileID:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_fetched)
  {
    v13 = brc_bread_crumbs();
    objc_super v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCPathToItemLookup setByFileID:]();
    }
  }
  v6 = [v5 st];
  id v7 = [v6 fileID];
  uint64_t v8 = [v7 unsignedLongLongValue];
  unint64_t v9 = [(BRCRelativePath *)self->_pathOfItem fileID];

  if (v8 != v9)
  {
    v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCPathToItemLookup setByFileID:]();
    }
  }
  objc_storeStrong((id *)&self->_matchByFileIDGlobally, a3);
  *(unsigned char *)&self->_fetched |= 1u;
  v10 = [(BRCLocalItem *)self->_matchByFileIDGlobally clientZone];
  v11 = [(BRCPathToItemLookup *)self clientZone];
  int v12 = [v10 isEqualToClientZone:v11];

  if (v12) {
    objc_storeStrong((id *)&self->_matchByFileID, a3);
  }
}

- (void)setByDocumentID:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_fetched & 2) != 0)
  {
    v13 = brc_bread_crumbs();
    objc_super v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCPathToItemLookup setByDocumentID:]();
    }
  }
  if (([v5 isDocument] & 1) == 0)
  {
    v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCPathToItemLookup setByDocumentID:]();
    }
  }
  v6 = [v5 st];
  id v7 = [v6 documentID];
  uint64_t v8 = [v7 unsignedLongLongValue];
  unsigned int v9 = [(BRCRelativePath *)self->_pathOfItem documentID];

  if (v8 != v9)
  {
    v17 = brc_bread_crumbs();
    v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BRCPathToItemLookup setByDocumentID:]();
    }
  }
  objc_storeStrong((id *)&self->_matchByDocumentIDGlobally, a3);
  *(unsigned char *)&self->_fetched |= 2u;
  v10 = [(BRCLocalItem *)self->_matchByDocumentIDGlobally clientZone];
  v11 = [(BRCPathToItemLookup *)self clientZone];
  int v12 = [v10 isEqualToClientZone:v11];

  if (v12) {
    objc_storeStrong((id *)&self->_matchByDocumentID, a3);
  }
}

- (BRCDirectoryItem)parentItem
{
  char fetched = (char)self->_fetched;
  if ((fetched & 8) == 0)
  {
    pathOfItem = self->_pathOfItem;
    *(unsigned char *)&self->_char fetched = fetched | 8;
    switch([(BRCRelativePath *)pathOfItem type])
    {
      case 3u:
        id v5 = [(BRCRelativePath *)self->_pathOfItem appLibrary];
        v6 = [v5 defaultClientZone];
        id v7 = [v6 fetchZoneRootItemInDB:self->_db];
        goto LABEL_10;
      case 4u:
        id v5 = [(BRCRelativePath *)self->_pathOfItem session];
        v6 = [v5 cloudDocsClientZone];
        v10 = [v6 defaultAppLibrary];
        v11 = [v10 fetchRootItemInDB:self->_db];
        parentItem = self->_parentItem;
        self->_parentItem = v11;

        goto LABEL_11;
      case 5u:
        id v5 = [(BRCRelativePath *)self->_pathOfItem appLibrary];
        v13 = [v5 fetchRootItemInDB:self->_db];
        objc_super v14 = self->_parentItem;
        self->_parentItem = v13;

        goto LABEL_12;
      case 6u:
        id v5 = [(BRCRelativePath *)self->_pathOfItem session];
        v6 = objc_msgSend(v5, "globalItemByFileID:db:", -[BRCRelativePath parentFileID](self->_pathOfItem, "parentFileID"), self->_db);
        id v7 = [v6 asDirectory];
LABEL_10:
        v15 = self->_parentItem;
        self->_parentItem = v7;

LABEL_11:
LABEL_12:

        break;
      default:
        uint64_t v8 = brc_bread_crumbs();
        unsigned int v9 = brc_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          [(BRCPathToItemLookup *)(id *)&self->_pathOfItem parentItem];
        }

        break;
    }
  }
  v16 = self->_parentItem;
  return v16;
}

- (BRCLocalItem)byFileID
{
  if ((*(unsigned char *)&self->_fetched & 1) == 0) {
    [(BRCPathToItemLookup *)self _fetchByFileID:0];
  }
  matchByFileID = self->_matchByFileID;
  return matchByFileID;
}

- (BRCLocalItem)byFileIDGlobally
{
  if ((*(unsigned char *)&self->_fetched & 1) == 0) {
    [(BRCPathToItemLookup *)self _fetchByFileID:1];
  }
  matchByFileIDGlobally = self->_matchByFileIDGlobally;
  return matchByFileIDGlobally;
}

- (BRCDocumentItem)byDocumentID
{
  if ((*(unsigned char *)&self->_fetched & 2) == 0) {
    [(BRCPathToItemLookup *)self _fetchByDocumentID:0];
  }
  matchByDocumentID = self->_matchByDocumentID;
  return matchByDocumentID;
}

- (BRCDocumentItem)byDocumentIDGlobally
{
  if ((*(unsigned char *)&self->_fetched & 2) == 0) {
    [(BRCPathToItemLookup *)self _fetchByDocumentID:1];
  }
  matchByDocumentIDGlobally = self->_matchByDocumentIDGlobally;
  return matchByDocumentIDGlobally;
}

- (BRCServerItem)serverByPath
{
  if ((*(unsigned char *)&self->_fetched & 0x20) == 0)
  {
    *(unsigned char *)&self->_fetched |= 0x20u;
    id v3 = [(BRCPathToItemLookup *)self parentItem];

    if (v3)
    {
      id v4 = [(BRCPathToItemLookup *)self parentItem];
      id v5 = [v4 clientZone];

      if ([(BRCRelativePath *)self->_pathOfItem type] - 4 <= 2)
      {
        v6 = [(BRCLocalItem *)self->_parentItem itemID];
        id v7 = [(BRCRelativePath *)self->_pathOfItem filename];
        uint64_t v8 = [v5 serverItemByParentID:v6 andLogicalName:v7 db:self->_db];
        serverByPath = self->_serverByPath;
        self->_serverByPath = v8;
      }
    }
  }
  v10 = self->_serverByPath;
  return v10;
}

- (BRCLocalItem)byPath
{
  if ((*(unsigned char *)&self->_fetched & 4) == 0) {
    [(BRCPathToItemLookup *)self _fetchByPath];
  }
  matchByPath = self->_matchByPath;
  return matchByPath;
}

- (BOOL)_fetchByPath
{
  *(unsigned char *)&self->_fetched |= 4u;
  id v3 = [(BRCRelativePath *)self->_pathOfItem filename];
  id v4 = [(BRCPathToItemLookup *)self _byPathWithLastPathComponent:v3];
  matchByPath = self->_matchByPath;
  self->_matchByPath = v4;

  return self->_matchByPath != 0;
}

- (id)_byPathWithLastPathComponent:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCPathToItemLookup *)self parentItem];

  if (!v5)
  {
    objc_super v14 = 0;
    goto LABEL_21;
  }
  matchByFileID = self->_matchByFileID;
  if (!matchByFileID) {
    goto LABEL_10;
  }
  id v7 = [(BRCLocalItem *)matchByFileID st];
  uint64_t v8 = [v7 parentID];
  unsigned int v9 = [(BRCLocalItem *)self->_parentItem itemID];
  if (![v8 isEqualToItemID:v9])
  {
LABEL_9:

    goto LABEL_10;
  }
  v10 = [(BRCLocalItem *)self->_matchByFileID st];
  v11 = [v10 filename];
  if (![v11 isEqualToString:v4])
  {

    goto LABEL_9;
  }
  unint64_t v12 = [(BRCLocalItem *)self->_matchByFileID diffAgainstOriginalItem] & 0x1000000060;

  if (!v12)
  {
    v13 = (BRCDocumentItem *)self->_matchByFileID;
LABEL_15:
    objc_super v14 = v13;
    goto LABEL_21;
  }
LABEL_10:
  matchByDocumentID = self->_matchByDocumentID;
  if (!matchByDocumentID) {
    goto LABEL_18;
  }
  v16 = [(BRCLocalItem *)matchByDocumentID st];
  v17 = [v16 parentID];
  v18 = [(BRCLocalItem *)self->_parentItem itemID];
  if (![v17 isEqualToItemID:v18]) {
    goto LABEL_17;
  }
  v19 = [(BRCLocalItem *)self->_matchByDocumentID st];
  v20 = [v19 filename];
  if (![v20 isEqualToString:v4])
  {

LABEL_17:
    goto LABEL_18;
  }
  unint64_t v21 = [(BRCLocalItem *)self->_matchByDocumentID diffAgainstOriginalItem] & 0x1000000060;

  if (v21)
  {
    v13 = self->_matchByDocumentID;
    goto LABEL_15;
  }
LABEL_18:
  if ([(BRCRelativePath *)self->_pathOfItem type] == 3)
  {
    v22 = [(BRCRelativePath *)self->_pathOfItem appLibrary];
    char v23 = [v22 isiCloudDesktopAppLibrary];

    if ((v23 & 1) == 0)
    {
      v27 = brc_bread_crumbs();
      v28 = brc_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        -[BRCPathToItemLookup _byPathWithLastPathComponent:]();
      }
    }
  }
  v24 = [(BRCLocalItem *)self->_parentItem clientZone];
  v25 = [(BRCLocalItem *)self->_parentItem itemID];
  objc_super v14 = [v24 itemByParentID:v25 andPhysicalName:v4 db:self->_db];

LABEL_21:
  return v14;
}

- (BOOL)_fetchByFileID:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)&self->_fetched |= 1u;
  BOOL v5 = [(BRCRelativePath *)self->_pathOfItem exists];
  if (v5)
  {
    v6 = [(BRCLocalItem *)self->_matchByDocumentID st];
    id v7 = [v6 fileID];
    uint64_t v8 = [v7 unsignedLongLongValue];
    if (v8 == [(BRCRelativePath *)self->_pathOfItem fileID])
    {
      unint64_t v9 = [(BRCLocalItem *)self->_matchByDocumentID diffAgainstOriginalItem];

      if ((v9 & 0x400000000) == 0)
      {
        matchByDocumentID = self->_matchByDocumentID;
LABEL_9:
        objc_storeStrong((id *)&self->_matchByFileID, matchByDocumentID);
        objc_storeStrong((id *)&self->_matchByFileIDGlobally, self->_matchByFileID);
LABEL_19:
        LOBYTE(v5) = 1;
        return v5;
      }
    }
    else
    {
    }
    v11 = [(BRCLocalItem *)self->_matchByPath st];
    unint64_t v12 = [v11 fileID];
    uint64_t v13 = [v12 unsignedLongLongValue];
    if (v13 == [(BRCRelativePath *)self->_pathOfItem fileID])
    {
      unint64_t v14 = [(BRCLocalItem *)self->_matchByPath diffAgainstOriginalItem];

      if ((v14 & 0x400000000) == 0)
      {
        matchByDocumentID = (BRCDocumentItem *)self->_matchByPath;
        goto LABEL_9;
      }
    }
    else
    {
    }
    v15 = [(BRCRelativePath *)self->_pathOfItem session];
    objc_msgSend(v15, "globalItemByFileID:db:", -[BRCRelativePath fileID](self->_pathOfItem, "fileID"), self->_db);
    v16 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
    matchByFileIDGlobally = self->_matchByFileIDGlobally;
    self->_matchByFileIDGlobally = v16;

    v18 = [(BRCPathToItemLookup *)self _resolveClientZoneWhileFetchingFileID:1 fetchindDocID:0];
    clientZone = self->_clientZone;
    self->_clientZone = v18;

    *(unsigned char *)&self->_fetched |= 0x80u;
    v20 = [(BRCLocalItem *)self->_matchByFileIDGlobally clientZone];
    if ([v20 isEqualToClientZone:self->_clientZone]
      && [(BRCPathToItemLookup *)self _shareIDMatchesParent:self->_matchByFileIDGlobally])
    {
      unint64_t v21 = self->_matchByFileIDGlobally;
    }
    else
    {
      unint64_t v21 = 0;
    }
    objc_storeStrong((id *)&self->_matchByFileID, v21);

    if (self->_matchByFileID || v3 && self->_matchByFileIDGlobally)
    {
      v22 = brc_bread_crumbs();
      char v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = self->_matchByFileIDGlobally;
        unint64_t v25 = [(BRCRelativePath *)self->_pathOfItem fileID];
        int v27 = 138412802;
        v28 = v24;
        __int16 v29 = 2048;
        unint64_t v30 = v25;
        __int16 v31 = 2112;
        v32 = v22;
        _os_log_debug_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] looked up %@ by fileID:%llu%@", (uint8_t *)&v27, 0x20u);
      }

      goto LABEL_19;
    }
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)_fetchByDocumentID:(BOOL)a3
{
  BOOL v3 = a3;
  *(unsigned char *)&self->_fetched |= 2u;
  BOOL v5 = [(BRCRelativePath *)self->_pathOfItem exists];
  if (v5)
  {
    BOOL v5 = [(BRCRelativePath *)self->_pathOfItem isDocument];
    if (v5)
    {
      if ([(BRCLocalItem *)self->_matchByFileID isDocument]
        && ![(BRCLocalItem *)self->_matchByFileID isReserved])
      {
        v6 = [(BRCLocalItem *)self->_matchByFileID st];
        id v7 = [v6 documentID];
        uint64_t v8 = [v7 unsignedLongLongValue];
        if (v8 == [(BRCRelativePath *)self->_pathOfItem documentID])
        {
          unint64_t v9 = [(BRCLocalItem *)self->_matchByFileID diffAgainstOriginalItem];

          if ((v9 & 0x200000000) == 0)
          {
            matchByFileID = self->_matchByFileID;
LABEL_14:
            v15 = [(BRCLocalItem *)matchByFileID asDocument];
            matchByDocumentID = self->_matchByDocumentID;
            self->_matchByDocumentID = v15;

            objc_storeStrong((id *)&self->_matchByDocumentIDGlobally, self->_matchByDocumentID);
            LOBYTE(v5) = 1;
            return v5;
          }
        }
        else
        {
        }
      }
      if ([(BRCLocalItem *)self->_matchByPath isDocument]
        && ![(BRCLocalItem *)self->_matchByPath isReserved])
      {
        v11 = [(BRCLocalItem *)self->_matchByPath st];
        unint64_t v12 = [v11 documentID];
        uint64_t v13 = [v12 unsignedLongLongValue];
        if (v13 == [(BRCRelativePath *)self->_pathOfItem documentID])
        {
          unint64_t v14 = [(BRCLocalItem *)self->_matchByPath diffAgainstOriginalItem];

          if ((v14 & 0x200000000) == 0)
          {
            matchByFileID = self->_matchByPath;
            goto LABEL_14;
          }
        }
        else
        {
        }
      }
      v17 = [(BRCRelativePath *)self->_pathOfItem session];
      objc_msgSend(v17, "globalItemByDocumentID:db:", -[BRCRelativePath documentID](self->_pathOfItem, "documentID"), self->_db);
      v18 = (BRCDocumentItem *)objc_claimAutoreleasedReturnValue();
      matchByDocumentIDGlobally = self->_matchByDocumentIDGlobally;
      self->_matchByDocumentIDGlobally = v18;

      v20 = [(BRCPathToItemLookup *)self _resolveClientZoneWhileFetchingFileID:0 fetchindDocID:1];
      clientZone = self->_clientZone;
      self->_clientZone = v20;

      *(unsigned char *)&self->_fetched |= 0x80u;
      v22 = [(BRCLocalItem *)self->_matchByDocumentIDGlobally clientZone];
      if ([v22 isEqualToClientZone:self->_clientZone]
        && [(BRCPathToItemLookup *)self _shareIDMatchesParent:self->_matchByDocumentIDGlobally])
      {
        char v23 = self->_matchByDocumentIDGlobally;
      }
      else
      {
        char v23 = 0;
      }
      objc_storeStrong((id *)&self->_matchByDocumentID, v23);

      v24 = self->_matchByDocumentID;
      LOBYTE(v5) = v24 != 0;
      if (!v24 && v3) {
        LOBYTE(v5) = self->_matchByDocumentIDGlobally != 0;
      }
    }
  }
  return v5;
}

- (BRCClientZone)clientZone
{
  if ((*(unsigned char *)&self->_fetched & 0x80000000) == 0) {
    [(BRCPathToItemLookup *)self _fetchClientZone];
  }
  clientZone = self->_clientZone;
  return clientZone;
}

- (id)_resolveClientZoneWhileFetchingFileID:(BOOL)a3 fetchindDocID:(BOOL)a4
{
  if ((*(unsigned char *)&self->_fetched & 0x80000000) == 0)
  {
    BOOL v5 = a4;
    id v7 = [(BRCPathToItemLookup *)self db];
    [v7 assertOnQueue];

    if ([(BRCRelativePath *)self->_pathOfItem type] == 2
      || [(BRCRelativePath *)self->_pathOfItem type] == 1)
    {
      uint64_t v8 = [(BRCRelativePath *)self->_pathOfItem appLibrary];
      unint64_t v9 = [v8 defaultClientZone];
LABEL_5:
      v10 = v9;
LABEL_6:

      goto LABEL_8;
    }
    if (![(BRCRelativePath *)self->_pathOfItem exists]) {
      goto LABEL_23;
    }
    if ([(BRCRelativePath *)self->_pathOfItem isDocument])
    {
      if (v5)
      {
        unint64_t v12 = self->_matchByDocumentIDGlobally;
      }
      else
      {
        unint64_t v12 = [(BRCPathToItemLookup *)self byDocumentIDGlobally];
      }
    }
    else
    {
      if (![(BRCRelativePath *)self->_pathOfItem isUnixDir]) {
        goto LABEL_23;
      }
      if (!a3)
      {
        v15 = [(BRCPathToItemLookup *)self byFileIDGlobally];
        uint64_t v8 = [v15 asDirectory];

        goto LABEL_20;
      }
      unint64_t v12 = [(BRCLocalItem *)self->_matchByFileIDGlobally asDirectory];
    }
    uint64_t v8 = v12;
LABEL_20:
    if ((*(unsigned char *)&self->_fetched & 0x80000000) != 0)
    {
      unint64_t v9 = self->_clientZone;
      goto LABEL_5;
    }
    if ([v8 isSharedToMeTopLevelItem]) {
      goto LABEL_24;
    }

LABEL_23:
    uint64_t v8 = [(BRCPathToItemLookup *)self parentItem];
    uint64_t v13 = [v8 clientZone];

    if (!v13)
    {
      unint64_t v14 = [(BRCRelativePath *)self->_pathOfItem appLibrary];
      v10 = [v14 defaultClientZone];

      goto LABEL_6;
    }
LABEL_24:
    unint64_t v9 = [v8 clientZone];
    goto LABEL_5;
  }
  v10 = self->_clientZone;
LABEL_8:
  return v10;
}

- (BOOL)_shareIDMatchesParent:(id)a3
{
  id v4 = a3;
  if ([v4 isSharedToMeChildItem])
  {
    BOOL v5 = objc_msgSend(MEMORY[0x1E4F1A2F8], "brc_fetchShareIDWithSharedItem:", v4);
    uint64_t v6 = [(BRCPathToItemLookup *)self parentItem];
    if (v6)
    {
      id v7 = (void *)v6;
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1A2F8], "brc_fetchShareIDWithSharedItem:", v6);
      if (v8)
      {
        unint64_t v9 = [v5 recordName];
        v10 = [v8 recordName];
        char v11 = [v9 isEqualToString:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (BOOL)_fetchClientZone
{
  BOOL v3 = [(BRCPathToItemLookup *)self _resolveClientZoneWhileFetchingFileID:0 fetchindDocID:0];
  clientZone = self->_clientZone;
  self->_clientZone = v3;

  *(unsigned char *)&self->_fetched |= 0x80u;
  return self->_clientZone != 0;
}

- (id)description
{
  BOOL v3 = NSString;
  pathOfItem = self->_pathOfItem;
  BOOL v5 = [(BRCRelativePath *)pathOfItem root];
  char fetched = (char)self->_fetched;
  if ((fetched & 8) != 0)
  {
    id v7 = [(BRCLocalItem *)self->_parentItem itemID];
    char v8 = (char)self->_fetched;
    if ((v8 & 4) != 0)
    {
LABEL_3:
      matchByPath = self->_matchByPath;
      if (v8) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    id v7 = @"unfetched";
    char v8 = (char)self->_fetched;
    if ((v8 & 4) != 0) {
      goto LABEL_3;
    }
  }
  matchByPath = (BRCLocalItem *)@"unfetched";
  if (v8)
  {
LABEL_4:
    matchByFileID = self->_matchByFileID;
    if ((v8 & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  matchByFileID = (BRCLocalItem *)@"unfetched";
  if ((v8 & 2) != 0)
  {
LABEL_5:
    matchByDocumentID = self->_matchByDocumentID;
    if ((v8 & 0x40) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    packageItem = (BRCPackageItem *)@"unfetched";
    if ((v8 & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  matchByDocumentID = (BRCDocumentItem *)@"unfetched";
  if ((v8 & 0x40) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  packageItem = self->_packageItem;
  if ((v8 & 0x10) != 0)
  {
LABEL_7:
    serverByPath = self->_serverByPath;
    goto LABEL_14;
  }
LABEL_13:
  serverByPath = (BRCServerItem *)@"unfetched";
LABEL_14:
  unint64_t v14 = [v3 stringWithFormat:@"\n  itemPath:          %@\n  rootPath:          %@\n  parentID:          %@\n  matchByPath:       %@\n  matchByFileID:     %@\n  matchByDocumentID: %@\n  packageItem:       %@\n  serverItemByPath:  %@", pathOfItem, v5, v7, matchByPath, matchByFileID, matchByDocumentID, packageItem, serverByPath];
  if ((fetched & 8) != 0) {

  }
  return v14;
}

- (BRCRelativePath)relpathOfItem
{
  return self->_pathOfItem;
}

- (BRCRelativePath)relpathOfFSEvent
{
  return self->_relpathOfFSEvent;
}

- (BRCPQLConnection)db
{
  return self->_db;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_matchByDocumentIDGlobally, 0);
  objc_storeStrong((id *)&self->_matchByFileIDGlobally, 0);
  objc_storeStrong((id *)&self->_parentItem, 0);
  objc_storeStrong((id *)&self->_packageItem, 0);
  objc_storeStrong((id *)&self->_serverByPath, 0);
  objc_storeStrong((id *)&self->_matchByPath, 0);
  objc_storeStrong((id *)&self->_matchByDocumentID, 0);
  objc_storeStrong((id *)&self->_matchByFileID, 0);
  objc_storeStrong((id *)&self->_relpathOfFSEvent, 0);
  objc_storeStrong((id *)&self->_pathOfItem, 0);
}

- (void)setByFileID:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: matchByFileID.st.fileID.unsignedLongLongValue == _pathOfItem.fileID%@", v2, v3, v4, v5, v6);
}

- (void)setByFileID:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !_fetched.byFileID%@", v2, v3, v4, v5, v6);
}

- (void)setByDocumentID:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: matchByDocumentID.st.documentID.unsignedLongLongValue == _pathOfItem.documentID%@", v2, v3, v4, v5, v6);
}

- (void)setByDocumentID:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: matchByDocumentID.isDocument%@", v2, v3, v4, v5, v6);
}

- (void)setByDocumentID:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !_fetched.byDocumentID%@", v2, v3, v4, v5, v6);
}

- (void)parentItem
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*a1 type];
  BRCPrettyPrintEnum();
  OUTLINED_FUNCTION_3_0();
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_1D353B000, a3, OS_LOG_TYPE_FAULT, "[CRIT] API MISUSE: lookups should not be used on paths of type: %s%@", v5, 0x16u);
}

- (void)_byPathWithLastPathComponent:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _pathOfItem.appLibrary.isiCloudDesktopAppLibrary%@", v2, v3, v4, v5, v6);
}

@end