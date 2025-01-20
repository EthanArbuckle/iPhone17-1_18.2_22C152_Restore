@interface BRCURLToItemLookup
+ (BOOL)supportsSecureCoding;
- ($9EE3FC84C9B3A82DF6438513DA0F9593)_pathMatchInNamespace:(SEL)a3;
- ($9EE3FC84C9B3A82DF6438513DA0F9593)byIDMatch;
- ($9EE3FC84C9B3A82DF6438513DA0F9593)byPathMatch;
- ($9EE3FC84C9B3A82DF6438513DA0F9593)faultedMatch;
- ($9EE3FC84C9B3A82DF6438513DA0F9593)reservedMatch;
- (BOOL)_appliedOrDownloadContentIfNecessary:(id)a3 si:(id)a4 applySchedulerState:(int *)a5;
- (BOOL)_applyOrDownloadThumbnailIfNecessary:(id)a3 si:(id)a4 url:(id)a5 updatedAddition:(BOOL *)a6 applySchedulerState:(int *)a7;
- (BOOL)_applyOrEvictLosersIfNecessary:(id)a3 si:(id)a4 url:(id)a5 addedLosers:(id)a6 removedLosers:(id)a7 updatedAddition:(BOOL *)a8 applySchedulerState:(int *)a9;
- (BOOL)_bounceBouncesHiddenByFault:(id)a3;
- (BOOL)_bouncePathMatchIfNecessaryWithLookup:(id)a3 localItem:(id)a4 serverItem:(id)a5 bounceNamespace:(unsigned __int8)a6 applyNamespace:(unsigned __int8)a7;
- (BOOL)_canUpdatePathMatch:(id *)a3 hasAdditionsToApply:(BOOL)a4;
- (BOOL)_removeDirectory:(id)a3 atPath:(id)a4 error:(id *)a5;
- (BOOL)copyItemAtURLToGenstore:(id)a3 forItem:(id)a4 error:(id *)a5;
- (BOOL)resolveAndKeepOpenWithError:(id *)a3;
- (BOOL)resolveParentAndKeepOpenMustExist:(BOOL)a3 errcode:(int *)a4;
- (BOOL)trashItemIfNecessary:(id)a3 atURL:(id)a4 error:(id *)a5;
- (BOOL)tryToDeleteItemInNamespace:(unsigned __int8)a3;
- (BRCAccountSession)session;
- (BRCDocumentItem)faultedLocalItem;
- (BRCLocalItem)byIDLocalItem;
- (BRCLocalItem)byPathLocalItem;
- (BRCLocalItem)parentItem;
- (BRCLocalItem)reservedLocalItem;
- (BRCPQLConnection)db;
- (BRCRelativePath)byPathRelpath;
- (BRCRelativePath)faultedRelpath;
- (BRCRelativePath)parentRelpath;
- (BRCRelativePath)relpath;
- (BRCServerItem)byIDServerItem;
- (BRCServerItem)byPathServerItem;
- (BRCServerItem)faultedServerItem;
- (BRCServerItem)reservedServerItem;
- (BRCURLToItemLookup)initWithCoder:(id)a3;
- (BRCURLToItemLookup)initWithURL:(id)a3 allowAppLibraryRoot:(BOOL)a4 session:(id)a5;
- (BRCURLToItemLookup)initWithURL:(id)a3 allowAppLibraryRoot:(BOOL)a4 session:(id)a5 db:(id)a6;
- (BRCURLToItemLookup)initWithURL:(id)a3 session:(id)a4;
- (NSString)filename;
- (NSString)parentPath;
- (NSURL)url;
- (id)description;
- (unint64_t)byIDDiffs;
- (unint64_t)byPathDiffs;
- (unint64_t)faultedDiffs;
- (unsigned)pathType;
- (void)_clearNamespace:(unsigned __int8)a3;
- (void)_fetchFaultedMatch;
- (void)_fetchIDMatch;
- (void)_fetchPathMatch;
- (void)_fetchRelPath;
- (void)_fetchReservedPathMatch;
- (void)_moveMissingItemAsideInNamespace:(unsigned __int8)a3;
- (void)clearByIDItem;
- (void)clearByPathItem;
- (void)clearFaultedItem;
- (void)clearReservedItem;
- (void)closePaths;
- (void)didApplyChangesAtPath:(id)a3 filename:(id)a4 li:(id)a5 si:(id)a6;
- (void)encodeWithCoder:(id)a3;
- (void)handleReservedPathMatchesIfNeeded;
- (void)markPathMatchLostIfLocationDoesntMatch:(id *)a3;
- (void)matchLookupItemsWithDisk;
- (void)parentItem;
- (void)refreshByIDDiffs;
- (void)refreshByPathDiffs;
- (void)refreshFaultedDiffs;
- (void)tryToUpdateItemInNamespace:(unsigned __int8)a3 withDstLookup:(id)a4;
@end

@implementation BRCURLToItemLookup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInt32:self->_hasFetched.value forKey:@"fetched"];
  [v5 encodeObject:self->_url forKey:@"url"];
  [v5 encodeObject:self->__relpath forKey:@"_relpath"];
  [v5 encodeObject:self->_parentRelpath forKey:@"parentRelpath"];
  [v5 encodeObject:self->_parentItem forKey:@"parentItemq "];
  [v5 encodeObject:self->_filename forKey:@"filename"];
  char var0 = (char)self->_hasFetched.var0;
  if ((var0 & 0x10) != 0)
  {
    [v5 encodeObject:self->_byIDLocalItem forKey:@"byIDLocalItem"];
    [v5 encodeObject:self->_byIDServerItem forKey:@"byIDServerItem"];
    [v5 encodeInt64:self->_byIDDiffs forKey:@"byIDDiffs"];
    char var0 = (char)self->_hasFetched.var0;
    if ((var0 & 4) == 0)
    {
LABEL_3:
      if ((var0 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_hasFetched.var0 & 4) == 0)
  {
    goto LABEL_3;
  }
  [v5 encodeObject:self->_byPathLocalItem forKey:@"byPathLocalItem"];
  [v5 encodeObject:self->_byPathServerItem forKey:@"byPathServerItem"];
  [v5 encodeInt64:self->_byPathDiffs forKey:@"byPathDiffs"];
  char var0 = (char)self->_hasFetched.var0;
  if ((var0 & 8) == 0)
  {
LABEL_4:
    if ((var0 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  [v5 encodeObject:self->_faultedLocalItem forKey:@"faultedLocalItem"];
  [v5 encodeObject:self->_faultedServerItem forKey:@"faultedServerItem"];
  [v5 encodeObject:self->_faultedRelpath forKey:@"faultedRelpath"];
  [v5 encodeInt64:self->_faultedDiffs forKey:@"faultedDiffs"];
  if ((*(unsigned char *)&self->_hasFetched.var0 & 0x20) != 0)
  {
LABEL_5:
    [v5 encodeObject:self->_reservedLocalItem forKey:@"reservedLocalItem"];
    [v5 encodeObject:self->_reservedServerItem forKey:@"reservedServerItem"];
  }
LABEL_6:
}

- (BRCURLToItemLookup)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCURLToItemLookup *)self init];
  if (!v5) {
    goto LABEL_7;
  }
  v5->_hasFetched.value = [v4 decodeInt32ForKey:@"fetched"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
  url = v5->_url;
  v5->_url = (NSURL *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_relpath"];
  relpath = v5->__relpath;
  v5->__relpath = (BRCRelativePath *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentRelpath"];
  parentRelpath = v5->_parentRelpath;
  v5->_parentRelpath = (BRCRelativePath *)v10;

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentItem"];
  parentItem = v5->_parentItem;
  v5->_parentItem = (BRCLocalItem *)v12;

  uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filename"];
  filename = v5->_filename;
  v5->_filename = (NSString *)v14;

  char var0 = (char)v5->_hasFetched.var0;
  if ((var0 & 0x10) != 0)
  {
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"byIDLocalItem"];
    byIDLocalItem = v5->_byIDLocalItem;
    v5->_byIDLocalItem = (BRCLocalItem *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"byIDServerItem"];
    byIDServerItem = v5->_byIDServerItem;
    v5->_byIDServerItem = (BRCServerItem *)v24;

    v5->_byIDDiffs = [v4 decodeInt64ForKey:@"byIDDiffs"];
    char var0 = (char)v5->_hasFetched.var0;
    if ((var0 & 4) == 0)
    {
LABEL_4:
      if ((var0 & 8) == 0) {
        goto LABEL_5;
      }
LABEL_10:
      uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faultedLocalItem"];
      faultedLocalItem = v5->_faultedLocalItem;
      v5->_faultedLocalItem = (BRCDocumentItem *)v30;

      uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faultedServerItem"];
      faultedServerItem = v5->_faultedServerItem;
      v5->_faultedServerItem = (BRCServerItem *)v32;

      uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faultedRelpath"];
      faultedRelpath = v5->_faultedRelpath;
      v5->_faultedRelpath = (BRCRelativePath *)v34;

      v5->_faultedDiffs = [v4 decodeInt64ForKey:@"faultedDiffs"];
      if ((*(unsigned char *)&v5->_hasFetched.var0 & 0x20) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&v5->_hasFetched.var0 & 4) == 0)
  {
    goto LABEL_4;
  }
  uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"byPathLocalItem"];
  byPathLocalItem = v5->_byPathLocalItem;
  v5->_byPathLocalItem = (BRCLocalItem *)v26;

  uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"byPathServerItem"];
  byPathServerItem = v5->_byPathServerItem;
  v5->_byPathServerItem = (BRCServerItem *)v28;

  v5->_byPathDiffs = [v4 decodeInt64ForKey:@"byPathDiffs"];
  char var0 = (char)v5->_hasFetched.var0;
  if ((var0 & 8) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((var0 & 0x20) != 0)
  {
LABEL_6:
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reservedLocalItem"];
    reservedLocalItem = v5->_reservedLocalItem;
    v5->_reservedLocalItem = (BRCLocalItem *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reservedServerItem"];
    reservedServerItem = v5->_reservedServerItem;
    v5->_reservedServerItem = (BRCServerItem *)v19;
  }
LABEL_7:

  return v5;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:1024];
  uint64_t v4 = objc_opt_class();
  id v5 = [(NSURL *)self->_url path];
  uint64_t v6 = [v5 stringByAbbreviatingWithTildeInPath];
  v7 = (void *)v6;
  if (*(unsigned char *)&self->_hasFetched.var0)
  {
    uint64_t v8 = [(BRCLocalItem *)self->_parentItem itemID];
    v9 = [v8 debugItemIDString];
    [v3 appendFormat:@"%@: %@\n parent (i:%@ n:'%@') %@", v4, v7, v9, self->_filename, self->_parentRelpath];
  }
  else
  {
    [v3 appendFormat:@"%@: %@\n parent (i:%@ n:'%@') %@", v4, v6, @"unfetched", self->_filename, self->_parentRelpath];
  }

  if ((*(unsigned char *)&self->_hasFetched.var0 & 0x10) != 0)
  {
    long long v17 = *(_OWORD *)&self->_byIDLocalItem;
    relpath = self->__relpath;
    v11 = BRCItemFieldsPrettyPrint();
    [v3 appendFormat:@"\n byID:\n  localItem:  %@\n  serverItem: %@\n  relpath:    %@\n  diffs:      %@", v17, relpath, v11];
  }
  else
  {
    [v3 appendString:@"\n byID: unfetched"];
  }
  if ((*(unsigned char *)&self->_hasFetched.var0 & 4) != 0)
  {
    long long v18 = *(_OWORD *)&self->_byPathLocalItem;
    uint64_t v12 = self->__relpath;
    v13 = BRCItemFieldsPrettyPrint();
    [v3 appendFormat:@"\n byPath:\n  localItem:  %@\n  serverItem: %@\n  relpath:    %@\n  diffs:      %@", v18, v12, v13];
  }
  else
  {
    [v3 appendString:@"\n byPath: unfetched"];
  }
  if ((*(unsigned char *)&self->_hasFetched.var0 & 8) != 0)
  {
    long long v19 = *(_OWORD *)&self->_faultedLocalItem;
    faultedRelpath = self->_faultedRelpath;
    v15 = BRCItemFieldsPrettyPrint();
    [v3 appendFormat:@"\n fault:\n  localItem:  %@\n  serverItem: %@\n  relpath:    %@\n  diffs:      %@", v19, faultedRelpath, v15];
  }
  else
  {
    [v3 appendString:@"\n fault: unfetched"];
  }
  if ((*(unsigned char *)&self->_hasFetched.var0 & 0x20) != 0) {
    [v3 appendFormat:@"\n reserved:\n  localItem:  %@\n  serverItem: %@", self->_reservedLocalItem, self->_reservedServerItem];
  }
  else {
    [v3 appendString:@"\n reserved: unfetched"];
  }
  return v3;
}

- (BRCURLToItemLookup)initWithURL:(id)a3 allowAppLibraryRoot:(BOOL)a4 session:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [v8 clientDB];
  v11 = [(BRCURLToItemLookup *)self initWithURL:v9 allowAppLibraryRoot:v5 session:v8 db:v10];

  return v11;
}

- (BRCURLToItemLookup)initWithURL:(id)a3 allowAppLibraryRoot:(BOOL)a4 session:(id)a5 db:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
    goto LABEL_22;
  }
  uint64_t v26 = brc_bread_crumbs();
  v27 = brc_default_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
    -[BRCURLToItemLookup initWithURL:allowAppLibraryRoot:session:db:].cold.5();
  }

  if (!v12)
  {
LABEL_22:
    uint64_t v28 = brc_bread_crumbs();
    v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      -[BRCURLToItemLookup initWithURL:allowAppLibraryRoot:session:db:].cold.4();
    }
  }
LABEL_3:
  v31.receiver = self;
  v31.super_class = (Class)BRCURLToItemLookup;
  id v14 = [(BRCURLToItemLookup *)&v31 init];
  if (v14)
  {
    v15 = [v11 path];
    uint64_t v16 = [v15 stringByDeletingLastPathComponent];
    long long v17 = (void *)*((void *)v14 + 10);
    *((void *)v14 + 10) = v16;

    uint64_t v18 = [v11 lastPathComponent];
    long long v19 = (void *)*((void *)v14 + 9);
    *((void *)v14 + 9) = v18;

    *((unsigned char *)v14 + 40) = a4;
    objc_storeStrong((id *)v14 + 4, a6);
    if (objc_msgSend(*((id *)v14 + 9), "br_isSideFaultName"))
    {
      *((unsigned char *)v14 + 16) |= 0x14u;
      uint64_t v30 = 0;
      v20 = (void *)_CFURLCopyLogicalNameOfPromiseAtURL();
      v21 = v20;
      if (v20)
      {
        id v22 = v20;
        v23 = *((void *)v14 + 9);
        *((void *)v14 + 9) = v22;
      }
      else
      {
        v23 = brc_bread_crumbs();
        uint64_t v24 = brc_default_log();
        if (os_log_type_enabled(v24, (os_log_type_t)0x90u)) {
          -[BRCURLToItemLookup initWithURL:allowAppLibraryRoot:session:db:](&v30);
        }
      }
    }
    else
    {
      if (*((void *)v14 + 9))
      {
LABEL_17:
        objc_storeStrong((id *)v14 + 6, a3);
        objc_storeStrong((id *)v14 + 1, a5);
        goto LABEL_18;
      }
      if ([v11 isFileReferenceURL])
      {
        v21 = brc_bread_crumbs();
        v23 = brc_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          -[BRCURLToItemLookup initWithURL:allowAppLibraryRoot:session:db:]((uint64_t)v11);
        }
      }
      else
      {
        v21 = brc_bread_crumbs();
        v23 = brc_default_log();
        if (os_log_type_enabled(v23, (os_log_type_t)0x90u)) {
          -[BRCURLToItemLookup initWithURL:allowAppLibraryRoot:session:db:]((uint64_t)v11);
        }
      }
    }

    goto LABEL_17;
  }
LABEL_18:

  return (BRCURLToItemLookup *)v14;
}

- (BRCURLToItemLookup)initWithURL:(id)a3 session:(id)a4
{
  return [(BRCURLToItemLookup *)self initWithURL:a3 allowAppLibraryRoot:0 session:a4];
}

- (BOOL)resolveAndKeepOpenWithError:(id *)a3
{
  unsigned int v9 = 0;
  BOOL v5 = 1;
  if (![(BRCURLToItemLookup *)self resolveParentAndKeepOpenMustExist:1 errcode:&v9])
  {
    if (!self->_allowAppLibraryRoot) {
      goto LABEL_8;
    }
    uint64_t v6 = [(BRCURLToItemLookup *)self relpath];
    v7 = v6;
    BOOL v5 = v6 != 0;
    if (v6)
    {
      if (!self->_allowAppLibraryRoot
        || [v6 type] != 2 && objc_msgSend(v7, "type") != 3)
      {

LABEL_8:
        if (!a3) {
          return 0;
        }
        objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", v9);
        BOOL v5 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        return v5;
      }
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

- (BOOL)resolveParentAndKeepOpenMustExist:(BOOL)a3 errcode:(int *)a4
{
  BOOL v5 = a3;
  *(unsigned char *)&self->_hasFetched.var0 |= 0x40u;
  parentPath = self->_parentPath;
  if (parentPath)
  {
    id v8 = [(BRCAccountSession *)self->_session resolvedOpenRelpathForPath:parentPath mustExist:v5 allowResolveInPkg:1 errcode:a4];
    parentRelpath = self->_parentRelpath;
    self->_parentRelpath = v8;

    if ([(BRCRelativePath *)self->_parentRelpath exists])
    {
      if (![(BRCRelativePath *)self->_parentRelpath isUnixDir])
      {
        id v11 = brc_bread_crumbs();
        id v12 = brc_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          -[BRCURLToItemLookup resolveParentAndKeepOpenMustExist:errcode:]();
        }
      }
    }
  }
  return self->_parentRelpath != 0;
}

- (void)closePaths
{
  [(BRCRelativePath *)self->__relpath close];
  [(BRCRelativePath *)self->_parentRelpath close];
  faultedRelpath = self->_faultedRelpath;
  [(BRCRelativePath *)faultedRelpath close];
}

- (BRCLocalItem)parentItem
{
  char var0 = (char)self->_hasFetched.var0;
  if ((var0 & 0x40) != 0)
  {
    if (*(unsigned char *)&self->_hasFetched.var0) {
      goto LABEL_15;
    }
  }
  else
  {
    v20 = brc_bread_crumbs();
    v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCURLToItemLookup parentItem]();
    }

    char var0 = (char)self->_hasFetched.var0;
    if (var0) {
      goto LABEL_15;
    }
  }
  parentRelpath = self->_parentRelpath;
  *(unsigned char *)&self->_hasFetched.char var0 = var0 | 1;
  if (parentRelpath)
  {
    int v5 = [(BRCRelativePath *)parentRelpath type];
    if ((v5 - 4) >= 3)
    {
      if ((v5 - 2) > 1)
      {
        v7 = brc_bread_crumbs();
        long long v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          [(BRCURLToItemLookup *)(id *)&self->_parentRelpath parentItem];
        }
      }
      else
      {
        id v14 = [(BRCRelativePath *)self->_parentRelpath appLibrary];

        if (!v14)
        {
          id v22 = brc_bread_crumbs();
          v23 = brc_default_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
            -[BRCURLToItemLookup parentItem]();
          }
        }
        v7 = [(BRCRelativePath *)self->_parentRelpath appLibrary];
        v15 = [v7 fetchRootItemInDB:self->_db];
        parentItem = self->_parentItem;
        self->_parentItem = v15;
      }
    }
    else
    {
      uint64_t v6 = [(BRCAccountSession *)self->_session globalItemByFileID:[(BRCRelativePath *)self->_parentRelpath fileID] db:self->_db];
      v7 = self->_parentItem;
      self->_parentItem = v6;
    }
  }
  else
  {
    id v8 = [(BRCURLToItemLookup *)self relpath];
    int v9 = [v8 type];

    if (v9 != 3) {
      goto LABEL_15;
    }
    v7 = [(BRCURLToItemLookup *)self relpath];
    uint64_t v10 = [v7 appLibrary];
    id v11 = [v10 defaultClientZone];
    id v12 = [v11 fetchZoneRootItemInDB:self->_db];
    id v13 = self->_parentItem;
    self->_parentItem = v12;
  }
LABEL_15:
  uint64_t v18 = self->_parentItem;
  return v18;
}

- (void)_fetchRelPath
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] can't create the relpath to a non-existing fault%@", v2, v3, v4, v5, v6);
}

- (void)refreshByPathDiffs
{
  byPathLocalItem = self->_byPathLocalItem;
  if (byPathLocalItem)
  {
    if (self->_byPathServerItem) {
      byPathLocalItem = -[BRCLocalItem diffAgainstServerItem:](byPathLocalItem, "diffAgainstServerItem:");
    }
    else {
      byPathLocalItem = 0;
    }
  }
  self->_byPathDiffs = (unint64_t)byPathLocalItem;
}

- (void)_fetchPathMatch
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: this is going to have unexpected effect to take this branch%@", v2, v3, v4, v5, v6);
}

- ($9EE3FC84C9B3A82DF6438513DA0F9593)byPathMatch
{
  if ((*(unsigned char *)&self->_hasFetched.var0 & 4) == 0) {
    [(BRCURLToItemLookup *)self _fetchPathMatch];
  }
  retstr->char var0 = self->_byPathLocalItem;
  retstr->var1 = self->_byPathServerItem;
  retstr->var2 = self->__relpath;
  result = self->_parentRelpath;
  unint64_t byPathDiffs = self->_byPathDiffs;
  retstr->var3 = result;
  retstr->var4 = byPathDiffs;
  return result;
}

- (BRCLocalItem)byPathLocalItem
{
  if ((*(unsigned char *)&self->_hasFetched.var0 & 4) == 0) {
    [(BRCURLToItemLookup *)self _fetchPathMatch];
  }
  byPathLocalItem = self->_byPathLocalItem;
  return byPathLocalItem;
}

- (BRCRelativePath)byPathRelpath
{
  if ((*(unsigned char *)&self->_hasFetched.var0 & 4) == 0) {
    [(BRCURLToItemLookup *)self _fetchPathMatch];
  }
  relpath = self->__relpath;
  return relpath;
}

- (BRCServerItem)byPathServerItem
{
  if ((*(unsigned char *)&self->_hasFetched.var0 & 4) == 0) {
    [(BRCURLToItemLookup *)self _fetchPathMatch];
  }
  byPathServerItem = self->_byPathServerItem;
  return byPathServerItem;
}

- (unint64_t)byPathDiffs
{
  if ((*(unsigned char *)&self->_hasFetched.var0 & 4) == 0) {
    [(BRCURLToItemLookup *)self _fetchPathMatch];
  }
  return self->_byPathDiffs;
}

- (void)clearByPathItem
{
  byPathLocalItem = self->_byPathLocalItem;
  self->_byPathLocalItem = 0;

  byPathServerItem = self->_byPathServerItem;
  self->_byPathServerItem = 0;

  id v5 = [(BRCRelativePath *)self->__relpath refreshFromPathMustExist:0];
}

- (void)refreshByIDDiffs
{
  byIDLocalItem = self->_byIDLocalItem;
  if (byIDLocalItem)
  {
    if (self->_byIDServerItem) {
      byIDLocalItem = -[BRCLocalItem diffAgainstServerItem:](byIDLocalItem, "diffAgainstServerItem:");
    }
    else {
      byIDLocalItem = 0;
    }
  }
  self->_byIDDiffs = (unint64_t)byIDLocalItem;
}

- (void)_fetchIDMatch
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _allowAppLibraryRoot%@", v2, v3, v4, v5, v6);
}

- ($9EE3FC84C9B3A82DF6438513DA0F9593)byIDMatch
{
  if ((*(unsigned char *)&self->_hasFetched.var0 & 0x10) == 0) {
    [(BRCURLToItemLookup *)self _fetchIDMatch];
  }
  retstr->char var0 = self->_byIDLocalItem;
  retstr->var1 = self->_byIDServerItem;
  retstr->var2 = self->__relpath;
  result = self->_parentRelpath;
  unint64_t byIDDiffs = self->_byIDDiffs;
  retstr->var3 = result;
  retstr->var4 = byIDDiffs;
  return result;
}

- (BRCLocalItem)byIDLocalItem
{
  if ((*(unsigned char *)&self->_hasFetched.var0 & 0x10) == 0) {
    [(BRCURLToItemLookup *)self _fetchIDMatch];
  }
  byIDLocalItem = self->_byIDLocalItem;
  return byIDLocalItem;
}

- (BRCRelativePath)relpath
{
  if ((*(unsigned char *)&self->_hasFetched.var0 & 2) == 0) {
    [(BRCURLToItemLookup *)self _fetchRelPath];
  }
  relpath = self->__relpath;
  return relpath;
}

- (BRCServerItem)byIDServerItem
{
  if ((*(unsigned char *)&self->_hasFetched.var0 & 0x10) == 0) {
    [(BRCURLToItemLookup *)self _fetchIDMatch];
  }
  byIDServerItem = self->_byIDServerItem;
  return byIDServerItem;
}

- (unint64_t)byIDDiffs
{
  if ((*(unsigned char *)&self->_hasFetched.var0 & 0x10) == 0) {
    [(BRCURLToItemLookup *)self _fetchIDMatch];
  }
  return self->_byIDDiffs;
}

- (void)clearByIDItem
{
  byIDLocalItem = self->_byIDLocalItem;
  self->_byIDLocalItem = 0;

  byIDServerItem = self->_byIDServerItem;
  self->_byIDServerItem = 0;

  id v5 = [(BRCRelativePath *)self->__relpath refreshFromPathMustExist:0];
}

- (void)refreshFaultedDiffs
{
  faultedLocalItem = self->_faultedLocalItem;
  if (faultedLocalItem)
  {
    if (self->_faultedServerItem) {
      faultedLocalItem = -[BRCDocumentItem diffAgainstServerItem:](faultedLocalItem, "diffAgainstServerItem:");
    }
    else {
      faultedLocalItem = 0;
    }
  }
  self->_faultedDiffs = (unint64_t)faultedLocalItem;
}

- ($9EE3FC84C9B3A82DF6438513DA0F9593)faultedMatch
{
  if ((*(unsigned char *)&self->_hasFetched.var0 & 8) == 0) {
    [(BRCURLToItemLookup *)self _fetchFaultedMatch];
  }
  retstr->char var0 = self->_faultedLocalItem;
  retstr->var1 = self->_faultedServerItem;
  retstr->var2 = self->_faultedRelpath;
  result = self->_parentRelpath;
  unint64_t faultedDiffs = self->_faultedDiffs;
  retstr->var3 = result;
  retstr->var4 = faultedDiffs;
  return result;
}

- (void)_fetchFaultedMatch
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1D353B000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: unexpected error when resolving a path %{errno}d%@", (uint8_t *)v4, 0x12u);
}

- (BRCRelativePath)faultedRelpath
{
  if ((*(unsigned char *)&self->_hasFetched.var0 & 8) == 0) {
    [(BRCURLToItemLookup *)self _fetchFaultedMatch];
  }
  faultedRelpath = self->_faultedRelpath;
  return faultedRelpath;
}

- (BRCServerItem)faultedServerItem
{
  if ((*(unsigned char *)&self->_hasFetched.var0 & 8) == 0) {
    [(BRCURLToItemLookup *)self _fetchFaultedMatch];
  }
  faultedServerItem = self->_faultedServerItem;
  return faultedServerItem;
}

- (BRCDocumentItem)faultedLocalItem
{
  if ((*(unsigned char *)&self->_hasFetched.var0 & 8) == 0) {
    [(BRCURLToItemLookup *)self _fetchFaultedMatch];
  }
  faultedLocalItem = self->_faultedLocalItem;
  return faultedLocalItem;
}

- (unint64_t)faultedDiffs
{
  if ((*(unsigned char *)&self->_hasFetched.var0 & 8) == 0) {
    [(BRCURLToItemLookup *)self _fetchFaultedMatch];
  }
  return self->_faultedDiffs;
}

- (void)clearFaultedItem
{
  faultedLocalItem = self->_faultedLocalItem;
  self->_faultedLocalItem = 0;

  faultedServerItem = self->_faultedServerItem;
  self->_faultedServerItem = 0;

  id v5 = [(BRCRelativePath *)self->_faultedRelpath refreshFromPathMustExist:0];
}

- (unsigned)pathType
{
  uint64_t v2 = [(BRCURLToItemLookup *)self relpath];
  unsigned __int16 v3 = [v2 type];

  return v3;
}

- (void)_fetchReservedPathMatch
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] can't fetch the reserved path-match with a non-existing fault%@", v2, v3, v4, v5, v6);
}

- ($9EE3FC84C9B3A82DF6438513DA0F9593)reservedMatch
{
  if ((*(unsigned char *)&self->_hasFetched.var0 & 0x20) == 0) {
    [(BRCURLToItemLookup *)self _fetchReservedPathMatch];
  }
  retstr->char var0 = self->_reservedLocalItem;
  result = self->_reservedServerItem;
  retstr->var1 = result;
  retstr->var2 = 0;
  retstr->var3 = 0;
  retstr->var4 = 0;
  return result;
}

- (BRCLocalItem)reservedLocalItem
{
  if ((*(unsigned char *)&self->_hasFetched.var0 & 0x20) == 0) {
    [(BRCURLToItemLookup *)self _fetchReservedPathMatch];
  }
  reservedLocalItem = self->_reservedLocalItem;
  return reservedLocalItem;
}

- (BRCServerItem)reservedServerItem
{
  if ((*(unsigned char *)&self->_hasFetched.var0 & 0x20) == 0) {
    [(BRCURLToItemLookup *)self _fetchReservedPathMatch];
  }
  reservedServerItem = self->_reservedServerItem;
  return reservedServerItem;
}

- (void)clearReservedItem
{
  reservedLocalItem = self->_reservedLocalItem;
  self->_reservedLocalItem = 0;

  reservedServerItem = self->_reservedServerItem;
  self->_reservedServerItem = 0;
}

- (BRCPQLConnection)db
{
  return self->_db;
}

- (NSURL)url
{
  return self->_url;
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (BRCRelativePath)parentRelpath
{
  return self->_parentRelpath;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSString)parentPath
{
  return self->_parentPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservedServerItem, 0);
  objc_storeStrong((id *)&self->_reservedLocalItem, 0);
  objc_storeStrong((id *)&self->_faultedRelpath, 0);
  objc_storeStrong((id *)&self->_faultedServerItem, 0);
  objc_storeStrong((id *)&self->_faultedLocalItem, 0);
  objc_storeStrong((id *)&self->_byPathServerItem, 0);
  objc_storeStrong((id *)&self->_byPathLocalItem, 0);
  objc_storeStrong((id *)&self->_byIDServerItem, 0);
  objc_storeStrong((id *)&self->_byIDLocalItem, 0);
  objc_storeStrong((id *)&self->_parentPath, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_parentItem, 0);
  objc_storeStrong((id *)&self->_parentRelpath, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->__relpath, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)markPathMatchLostIfLocationDoesntMatch:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3->var0;
  id v5 = a3->var2;
  if ([v4 isLive])
  {
    if (([v5 exists] & 1) == 0)
    {
      id v12 = brc_bread_crumbs();
      id v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[BRCURLToItemLookup(BRCFSReader) markPathMatchLostIfLocationDoesntMatch:]();
      }
      goto LABEL_9;
    }
    int v6 = [v4 isDocument];
    uint64_t v7 = [v4 st];
    id v8 = v7;
    if (!v6)
    {
      long long v19 = [v7 fileID];
      uint64_t v20 = [v19 unsignedLongLongValue];
      uint64_t v21 = [v5 fileID];

      if (v20 == v21) {
        goto LABEL_10;
      }
      id v12 = brc_bread_crumbs();
      id v13 = brc_default_log();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_9;
      }
      id v14 = [v4 st];
      v15 = [v14 fileID];
      int v22 = 138412802;
      v23 = v15;
      __int16 v24 = 2048;
      *(void *)v25 = [v5 fileID];
      *(_WORD *)&v25[8] = 2112;
      *(void *)&v25[10] = v12;
      uint64_t v16 = "[DEBUG] Item file ID doesn't match: %@ != %lld%@";
      long long v17 = v13;
      uint32_t v18 = 32;
      goto LABEL_14;
    }
    int v9 = [v7 documentID];
    uint64_t v10 = [v9 unsignedLongLongValue];
    int v11 = [v5 documentID];

    if (v10 != v11)
    {
      id v12 = brc_bread_crumbs();
      id v13 = brc_default_log();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
LABEL_9:

        [v4 markLostClearGenerationID:0 backoffMode:1];
        [v4 saveToDB];
        goto LABEL_10;
      }
      id v14 = [v4 st];
      v15 = [v14 documentID];
      int v22 = 138412802;
      v23 = v15;
      __int16 v24 = 1024;
      *(_DWORD *)v25 = [v5 documentID];
      *(_WORD *)&v25[4] = 2112;
      *(void *)&v25[6] = v12;
      uint64_t v16 = "[DEBUG] Item document ID doesn't match: %@ != %u%@";
      long long v17 = v13;
      uint32_t v18 = 28;
LABEL_14:
      _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&v22, v18);

      goto LABEL_9;
    }
  }
LABEL_10:
}

- (void)handleReservedPathMatchesIfNeeded
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BRCURLToItemLookup *)self reservedLocalItem];
  id v4 = [(BRCURLToItemLookup *)self reservedServerItem];
  if (v4)
  {
    if ([v3 isBRAlias]) {
      goto LABEL_47;
    }
    id v5 = [v3 clientZone];
    if ([v5 isSharedZone])
    {
      int v6 = [v3 appLibrary];
      if (([v6 state] & 0x800) != 0)
      {

LABEL_12:
        id v14 = brc_bread_crumbs();
        v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[BRCURLToItemLookup(BRCFSReader) handleReservedPathMatchesIfNeeded]();
        }

        uint64_t v16 = [(BRCAccountSession *)self->_session applyScheduler];
        uint64_t v17 = [v4 rank];
        uint32_t v18 = [v4 serverZone];
        long long v19 = [v18 dbRowID];
        [v16 setState:22 forRank:v17 zoneRowID:v19];

        [(BRCURLToItemLookup *)self clearReservedItem];
        goto LABEL_47;
      }
      uint64_t v7 = [v4 parentZoneOnFS];
      if ([v7 isPrivateZone])
      {
        id v8 = [v4 parentZoneOnFS];
        int v9 = [v8 asPrivateZone];
        uint64_t v10 = [v9 clientZone];
        int v11 = [v10 defaultAppLibrary];
        __int16 v43 = [v11 state];

        if ((v43 & 0x800) == 0)
        {
LABEL_17:
          uint64_t v20 = [(BRCURLToItemLookup *)self byPathLocalItem];
          uint64_t v21 = v20;
          if (!v20)
          {
            uint64_t v26 = [(BRCURLToItemLookup *)self byPathRelpath];
            int v27 = [v26 exists];

            if (v27)
            {
              uint64_t v28 = brc_bread_crumbs();
              v29 = brc_default_log();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
                -[BRCURLToItemLookup(BRCFSReader) handleReservedPathMatchesIfNeeded]();
              }

              [v3 scanParentDirectory];
              uint64_t v30 = [(BRCAccountSession *)self->_session applyScheduler];
              uint64_t v31 = [v4 rank];
              uint64_t v32 = [v4 serverZone];
              v33 = [v32 dbRowID];
              [v30 setState:22 forRank:v31 zoneRowID:v33];

              [(BRCURLToItemLookup *)self clearReservedItem];
            }
            goto LABEL_46;
          }
          int v22 = [v20 st];
          unsigned int v23 = [v22 type];
          __int16 v24 = [v3 st];
          unsigned int v25 = [v24 type];
          if (v23 == v25) {
            goto LABEL_38;
          }
          if (v23 > 0xA) {
            goto LABEL_45;
          }
          if (((1 << v23) & 0x611) != 0)
          {
            if (v25 <= 0xA && ((1 << v25) & 0x611) != 0) {
              goto LABEL_38;
            }
            if (v23 - 1 >= 2)
            {
              if (v23 == 6) {
                goto LABEL_37;
              }
              if (v23 != 8) {
                goto LABEL_45;
              }
            }
          }
          else if (((1 << v23) & 0x106) == 0)
          {
            if (v23 != 6) {
              goto LABEL_45;
            }
            goto LABEL_37;
          }
          if (v25 <= 8 && ((1 << v25) & 0x106) != 0) {
            goto LABEL_38;
          }
          if (v23 != 6) {
            goto LABEL_45;
          }
LABEL_37:
          if (v25 == 6)
          {
LABEL_38:
            uint64_t v34 = [v21 clientZone];
            v35 = [v3 clientZone];
            int v36 = [v34 isEqualToClientZone:v35];

            if (v36
              && ([v3 isDirectory]
               && ![v21 isKnownByServerOrInFlight]
               || [v21 isFromInitialScan]))
            {
              memset(v44, 0, sizeof(v44));
              __brc_create_section(0, (uint64_t)"-[BRCURLToItemLookup(BRCFSReader) handleReservedPathMatchesIfNeeded]", 234, v44);
              v37 = brc_bread_crumbs();
              v38 = brc_default_log();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134218754;
                uint64_t v46 = v44[0];
                __int16 v47 = 2112;
                v48 = v21;
                __int16 v49 = 2112;
                v50 = v3;
                __int16 v51 = 2112;
                v52 = v37;
                _os_log_debug_impl(&dword_1D353B000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx detected a path-match at apply-changes time with %@\nmatching %@%@", buf, 0x2Au);
              }

              [v3 markNeedsDeleteForRescheduleOfItem:0];
              [v3 saveToDBForServerEdit:0 keepAliases:1];
              v39 = [v3 itemID];
              v40 = [(BRCURLToItemLookup *)self relpath];
              [v21 learnItemID:v39 serverItem:v4 path:v40 markLost:1];

              [v21 saveToDB];
              v41 = [v21 serverZone];
              v42 = [v41 clientZone];
              [v42 scheduleSyncUp];

              [(BRCURLToItemLookup *)self clearReservedItem];
              __brc_leave_section(v44);
            }
            goto LABEL_46;
          }
LABEL_45:

LABEL_46:
          goto LABEL_47;
        }
        goto LABEL_12;
      }
    }
    goto LABEL_17;
  }
  id v12 = brc_bread_crumbs();
  id v13 = brc_default_log();
  if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
    -[BRCURLToItemLookup(BRCFSReader) handleReservedPathMatchesIfNeeded]();
  }

  [v3 markRemovedFromFilesystemForServerEdit:0];
  [v3 saveToDB];
  [(BRCURLToItemLookup *)self clearReservedItem];
LABEL_47:
}

- (void)matchLookupItemsWithDisk
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  memset(v14, 0, sizeof(v14));
  [(BRCURLToItemLookup *)self byPathMatch];
  uint64_t v13 = 0;
  memset(v12, 0, sizeof(v12));
  [(BRCURLToItemLookup *)self faultedMatch];
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  [(BRCURLToItemLookup *)self reservedMatch];
  memset(v9, 0, sizeof(v9));
  __brc_create_section(0, (uint64_t)"-[BRCURLToItemLookup(BRCFSReader) matchLookupItemsWithDisk]", 265, v9);
  uint64_t v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v17 = v9[0];
    __int16 v18 = 2112;
    long long v19 = self;
    __int16 v20 = 2112;
    uint64_t v21 = v3;
    _os_log_debug_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx match lookup with disk %@%@", buf, 0x20u);
  }

  if (v14[0])
  {
    id v5 = brc_bread_crumbs();
    int v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCURLToItemLookup(BRCFSReader) matchLookupItemsWithDisk]();
    }

    [(BRCURLToItemLookup *)self markPathMatchLostIfLocationDoesntMatch:v14];
  }
  if (*(void *)&v12[0])
  {
    uint64_t v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCURLToItemLookup(BRCFSReader) matchLookupItemsWithDisk]();
    }

    [(BRCURLToItemLookup *)self markPathMatchLostIfLocationDoesntMatch:v12];
  }
  if (*(void *)&v10[0]) {
    [(BRCURLToItemLookup *)self handleReservedPathMatchesIfNeeded];
  }
  __brc_leave_section(v9);
  __destructor_8_s0_s8_s16_s24((uint64_t)v10);
  __destructor_8_s0_s8_s16_s24((uint64_t)v12);
  __destructor_8_s0_s8_s16_s24((uint64_t)v14);
}

- (BOOL)_bounceBouncesHiddenByFault:(id)a3
{
  return 1;
}

- (void)_clearNamespace:(unsigned __int8)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      [(BRCURLToItemLookup *)self clearFaultedItem];
    }
    else if (a3 == 2)
    {
      [(BRCURLToItemLookup *)self clearReservedItem];
    }
  }
  else
  {
    [(BRCURLToItemLookup *)self clearByPathItem];
  }
}

- ($9EE3FC84C9B3A82DF6438513DA0F9593)_pathMatchInNamespace:(SEL)a3
{
  if (a4)
  {
    if (a4 == 1)
    {
      return [(BRCURLToItemLookup *)self faultedMatch];
    }
    else if (a4 == 2)
    {
      return [(BRCURLToItemLookup *)self reservedMatch];
    }
    else
    {
      int v6 = brc_bread_crumbs();
      uint64_t v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[BRCURLToItemLookup(BRCFSWriter) _pathMatchInNamespace:]();
      }
    }
  }
  else
  {
    return [(BRCURLToItemLookup *)self byPathMatch];
  }
  return result;
}

- (void)_moveMissingItemAsideInNamespace:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if (a3)
  {
    if (a3 != 1)
    {
      if (a3 != 2) {
        return;
      }
      id v5 = brc_bread_crumbs();
      int v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[BRCURLToItemLookup(BRCFSWriter) _moveMissingItemAsideInNamespace:]();
      }
    }
    uint64_t v7 = [(BRCURLToItemLookup *)self faultedLocalItem];
  }
  else
  {
    uint64_t v7 = [(BRCURLToItemLookup *)self byPathLocalItem];
  }
  id v8 = (void *)v7;
  if (v7)
  {
    int v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCURLToItemLookup(BRCFSWriter) _moveMissingItemAsideInNamespace:]();
    }

    if ([v8 isLive]) {
      [v8 markLostClearGenerationID:0 backoffMode:1];
    }
    [v8 moveAsideLocally];
    [v8 saveToDB];
    [(BRCURLToItemLookup *)self _clearNamespace:v3];
  }
}

- (BOOL)_removeDirectory:(id)a3 atPath:(id)a4 error:(id *)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (([v8 isDirectory] & 1) == 0)
  {
    __int16 v51 = brc_bread_crumbs();
    v52 = brc_default_log();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
      -[BRCURLToItemLookup(BRCFSWriter) _removeDirectory:atPath:error:].cold.4();
    }
  }
  if (([v9 exists] & 1) == 0)
  {
    uint64_t v53 = brc_bread_crumbs();
    v54 = brc_default_log();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT)) {
      -[BRCURLToItemLookup(BRCFSWriter) _removeDirectory:atPath:error:]();
    }
  }
  if ([v9 isDocument])
  {
    v55 = brc_bread_crumbs();
    v56 = brc_default_log();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT)) {
      -[BRCURLToItemLookup(BRCFSWriter) _removeDirectory:atPath:error:]();
    }
  }
  unsigned int v63 = 0;
  id v10 = [[BRCDirectoryEnumerator alloc] initForEnumeratingBelow:v9 recursive:0 error:&v63];
  uint64_t v11 = v10;
  if (!v10)
  {
    uint64_t v21 = brc_bread_crumbs();
    uint64_t v22 = brc_default_log();
    if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v65 = v9;
      *(_WORD *)&v65[8] = 1024;
      *(_DWORD *)&v65[10] = v63;
      *(_WORD *)&v65[14] = 2112;
      *(void *)&v65[16] = v21;
      _os_log_error_impl(&dword_1D353B000, v22, (os_log_type_t)0x90u, "[ERROR] failed opening %@ for scanning %{errno}d%@", buf, 0x1Cu);
    }

    unsigned int v23 = brc_bread_crumbs();
    __int16 v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      -[BRCURLToItemLookup(BRCFSWriter) _removeDirectory:atPath:error:]();
    }

    id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", v63);
    if (v14)
    {
      unsigned int v25 = brc_bread_crumbs();
      uint64_t v26 = brc_default_log();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
      {
        uint64_t v46 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)v65 = "-[BRCURLToItemLookup(BRCFSWriter) _removeDirectory:atPath:error:]";
        *(_WORD *)&v65[8] = 2080;
        if (!a5) {
          uint64_t v46 = "(ignored by caller)";
        }
        *(void *)&v65[10] = v46;
        *(_WORD *)&v65[18] = 2112;
        *(void *)&v65[20] = v14;
        *(_WORD *)&v65[28] = 2112;
        *(void *)&v65[30] = v25;
        _os_log_error_impl(&dword_1D353B000, v26, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (!a5) {
      goto LABEL_61;
    }
    id v27 = v14;
    goto LABEL_34;
  }
  uint64_t v12 = [v10 nextObject];
  if (v12)
  {
    id v14 = (void *)v12;
    int v15 = 0;
    *(void *)&long long v13 = 138412802;
    long long v57 = v13;
    while (1)
    {
      unsigned int v62 = 0;
      if (objc_msgSend(v14, "resolveAndKeepOpenMustExist:error:", 1, &v62, v57)) {
        break;
      }
      if ([v14 isExcluded])
      {
        uint64_t v16 = brc_bread_crumbs();
        uint64_t v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v65 = v15;
          *(_WORD *)&v65[4] = 2112;
          *(void *)&v65[6] = v14;
          *(_WORD *)&v65[14] = 2112;
          *(void *)&v65[16] = v9;
          *(_WORD *)&v65[24] = 2112;
          *(void *)&v65[26] = v16;
          _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] excluded child %d: %@\nunder directory: %@%@", buf, 0x26u);
        }

        ++v15;
      }
      else
      {
        if (v62 != 2)
        {
          v41 = brc_bread_crumbs();
          v42 = brc_default_log();
          if (os_log_type_enabled(v42, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138413314;
            *(void *)v65 = v14;
            *(_WORD *)&v65[8] = 2112;
            *(void *)&v65[10] = v9;
            *(_WORD *)&v65[18] = 2112;
            *(void *)&v65[20] = v8;
            *(_WORD *)&v65[28] = 1024;
            *(_DWORD *)&v65[30] = v62;
            *(_WORD *)&v65[34] = 2112;
            *(void *)&v65[36] = v41;
            _os_log_error_impl(&dword_1D353B000, v42, (os_log_type_t)0x90u, "[ERROR] can't resolve child: %@\nunder directory:     %@\nfor directory item:  %@\n %{errno}d%@", buf, 0x30u);
          }

          objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", v62);
          uint64_t v30 = (BRCPathToItemLookup *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            __int16 v43 = brc_bread_crumbs();
            v44 = brc_default_log();
            if (os_log_type_enabled(v44, (os_log_type_t)0x90u))
            {
              __int16 v49 = "(passed to caller)";
              *(_DWORD *)buf = 136315906;
              *(void *)v65 = "-[BRCURLToItemLookup(BRCFSWriter) _removeDirectory:atPath:error:]";
              *(_WORD *)&v65[8] = 2080;
              if (!a5) {
                __int16 v49 = "(ignored by caller)";
              }
              *(void *)&v65[10] = v49;
              *(_WORD *)&v65[18] = 2112;
              *(void *)&v65[20] = v30;
              *(_WORD *)&v65[28] = 2112;
              *(void *)&v65[30] = v43;
              _os_log_error_impl(&dword_1D353B000, v44, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }
          }
          if (a5)
          {
            uint64_t v30 = v30;
            *a5 = v30;
          }
          goto LABEL_60;
        }
        __int16 v18 = brc_bread_crumbs();
        long long v19 = brc_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v57;
          *(void *)v65 = v14;
          *(_WORD *)&v65[8] = 2112;
          *(void *)&v65[10] = v9;
          *(_WORD *)&v65[18] = 2112;
          *(void *)&v65[20] = v18;
          _os_log_debug_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] child disappeared: %@\nunder directory:   %@%@", buf, 0x20u);
        }
      }
      uint64_t v20 = [v11 nextObject];

      id v14 = (void *)v20;
      if (!v20) {
        goto LABEL_28;
      }
    }
    uint64_t v30 = [[BRCPathToItemLookup alloc] initWithRelativePath:v14];
    uint64_t v31 = [(BRCPathToItemLookup *)v30 byPath];
    uint64_t v32 = brc_bread_crumbs();
    v33 = brc_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      *(void *)v65 = v8;
      *(_WORD *)&v65[8] = 2112;
      *(void *)&v65[10] = v9;
      *(_WORD *)&v65[18] = 2112;
      *(void *)&v65[20] = v30;
      *(_WORD *)&v65[28] = 2112;
      *(void *)&v65[30] = v32;
      _os_log_debug_impl(&dword_1D353B000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] can't delete directory %@\nat %@\nbecause of child %@%@", buf, 0x2Au);
    }

    if (!v31)
    {
      [v8 markLostClearGenerationID:1 backoffMode:1];
      [v8 saveToDB];
    }
    [v14 close];
    uint64_t v34 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 66);
    if (v34)
    {
      v35 = brc_bread_crumbs();
      int v36 = brc_default_log();
      if (os_log_type_enabled(v36, (os_log_type_t)0x90u))
      {
        v48 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)v65 = "-[BRCURLToItemLookup(BRCFSWriter) _removeDirectory:atPath:error:]";
        *(_WORD *)&v65[8] = 2080;
        if (!a5) {
          v48 = "(ignored by caller)";
        }
        *(void *)&v65[10] = v48;
        *(_WORD *)&v65[18] = 2112;
        *(void *)&v65[20] = v34;
        *(_WORD *)&v65[28] = 2112;
        *(void *)&v65[30] = v35;
        _os_log_error_impl(&dword_1D353B000, v36, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5) {
      *a5 = v34;
    }

LABEL_60:
    goto LABEL_61;
  }
  int v15 = 0;
LABEL_28:
  if (v63)
  {
    id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:");
    if (v14)
    {
      uint64_t v28 = brc_bread_crumbs();
      v29 = brc_default_log();
      if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
      {
        __int16 v47 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)v65 = "-[BRCURLToItemLookup(BRCFSWriter) _removeDirectory:atPath:error:]";
        *(_WORD *)&v65[8] = 2080;
        if (!a5) {
          __int16 v47 = "(ignored by caller)";
        }
        *(void *)&v65[10] = v47;
        *(_WORD *)&v65[18] = 2112;
        *(void *)&v65[20] = v14;
        *(_WORD *)&v65[28] = 2112;
        *(void *)&v65[30] = v28;
        _os_log_error_impl(&dword_1D353B000, v29, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (!a5) {
      goto LABEL_61;
    }
    id v27 = v14;
    id v14 = v27;
LABEL_34:
    *a5 = v27;
LABEL_61:

    char v37 = 0;
    goto LABEL_62;
  }
  unsigned int v62 = 0;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __65__BRCURLToItemLookup_BRCFSWriter___removeDirectory_atPath_error___block_invoke;
  v58[3] = &unk_1E699A308;
  int v61 = v15;
  id v59 = v9;
  v60 = self;
  char v37 = [v59 performOnOpenParentFileDescriptor:v58 error:&v62];
  if ((v37 & 1) == 0)
  {
    v38 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", v62);
    if (v38)
    {
      v39 = brc_bread_crumbs();
      v40 = brc_default_log();
      if (os_log_type_enabled(v40, (os_log_type_t)0x90u))
      {
        v50 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)v65 = "-[BRCURLToItemLookup(BRCFSWriter) _removeDirectory:atPath:error:]";
        *(_WORD *)&v65[8] = 2080;
        if (!a5) {
          v50 = "(ignored by caller)";
        }
        *(void *)&v65[10] = v50;
        *(_WORD *)&v65[18] = 2112;
        *(void *)&v65[20] = v38;
        *(_WORD *)&v65[28] = 2112;
        *(void *)&v65[30] = v39;
        _os_log_error_impl(&dword_1D353B000, v40, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5) {
      *a5 = v38;
    }
  }
LABEL_62:

  return v37;
}

uint64_t __65__BRCURLToItemLookup_BRCFSWriter___removeDirectory_atPath_error___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)&v23[5] = *MEMORY[0x1E4F143B8];
  if (!*(_DWORD *)(a1 + 48))
  {
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __65__BRCURLToItemLookup_BRCFSWriter___removeDirectory_atPath_error___block_invoke_cold_1(a1);
    }

    uint64_t v11 = [*(id *)(a1 + 32) filename];
    int v12 = BRCUnlinkAt(a2, v11, 128);

    if (!v12) {
      return 0;
    }
    long long v13 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      __int16 v18 = [*(id *)(a1 + 32) filename];
      int v19 = *__error();
      int v20 = 67109890;
      *(_DWORD *)uint64_t v21 = a2;
      *(_WORD *)&v21[4] = 2112;
      *(void *)&v21[6] = v18;
      __int16 v22 = 1024;
      v23[0] = v19;
      LOWORD(v23[1]) = 2112;
      *(void *)((char *)&v23[1] + 2) = v13;
      _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] rmdirat(%d, '%@') failed %{errno}d%@", (uint8_t *)&v20, 0x22u);
    }
    return *__error();
  }
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    int v17 = *(_DWORD *)(a1 + 48);
    int v20 = 138412802;
    *(void *)uint64_t v21 = v16;
    *(_WORD *)&v21[8] = 1024;
    *(_DWORD *)&v21[10] = v17;
    __int16 v22 = 2112;
    *(void *)unsigned int v23 = v4;
    _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] removing %@ and its %d excluded children%@", (uint8_t *)&v20, 0x1Cu);
  }

  int v6 = [*(id *)(*(void *)(a1 + 40) + 8) diskReclaimer];
  uint64_t v7 = [*(id *)(a1 + 32) filename];
  char v8 = [v6 renameAndUnlinkInBackgroundItemAt:a2 path:v7];

  if ((v8 & 1) == 0) {
    return *__error();
  }
  return 0;
}

- (BOOL)_canUpdatePathMatch:(id *)a3 hasAdditionsToApply:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a3->var0;
  char v8 = [(BRCAccountSession *)self->_session stageRegistry];
  int v47 = 0;
  if (+[BRCFSWriter _isPathMatchIdle:a3])
  {
    id v9 = [v7 st];
    id v10 = [v9 stagedFileID];

    uint64_t v11 = [v10 unsignedLongLongValue];
    if (v11)
    {
      uint64_t v12 = v11;
      if (([v7 isReserved] & 1) == 0 && (objc_msgSend(v8, "didFlushStagedFileID:", v12) & 1) == 0)
      {
        uint64_t v31 = brc_bread_crumbs();
        uint64_t v32 = brc_default_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          -[BRCURLToItemLookup(BRCFSWriter) _canUpdatePathMatch:hasAdditionsToApply:].cold.5();
        }

        v33 = [(BRCAccountSession *)self->_session applyScheduler];
        [v33 setState:20 forServerItem:a3->var1 localItem:a3->var0];

        goto LABEL_52;
      }
      if (([v8 existsInStage:v12 generationID:&v47] & 1) == 0)
      {
        uint64_t v16 = brc_bread_crumbs();
        int v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          -[BRCURLToItemLookup(BRCFSWriter) _canUpdatePathMatch:hasAdditionsToApply:].cold.4();
        }
        goto LABEL_25;
      }
      int v13 = v47;
      id v14 = [v7 st];
      int v15 = [v14 stagedGenerationID];

      if (v13 != v15)
      {
        uint64_t v16 = brc_bread_crumbs();
        int v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          int v18 = v47;
          int v19 = [v7 st];
          int v20 = [v19 stagedGenerationID];
          *(_DWORD *)buf = 138413058;
          __int16 v49 = (const char *)v7;
          __int16 v50 = 1024;
          *(_DWORD *)__int16 v51 = v18;
          *(_WORD *)&v51[4] = 1024;
          *(_DWORD *)&v51[6] = v20;
          *(_WORD *)v52 = 2112;
          *(void *)&v52[2] = v16;
          _os_log_fault_impl(&dword_1D353B000, v17, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Stage tampering - item %@ was edited in stage (%u != %u)%@", buf, 0x22u);
        }
LABEL_25:

        [v7 clearFromStage];
        [v7 saveToDB];
        goto LABEL_52;
      }
LABEL_16:
      if ([v7 isDocument])
      {
        __int16 v24 = [v7 asDocument];
        uint64_t v25 = [v24 desiredVersion];
        uint64_t v26 = (void *)v25;
        if (!v25 && !v4)
        {
          id v27 = brc_bread_crumbs();
          uint64_t v28 = brc_default_log();
          if (os_log_type_enabled(v28, (os_log_type_t)0x90u)) {
            -[BRCURLToItemLookup(BRCFSWriter) _canUpdatePathMatch:hasAdditionsToApply:]();
          }

          v29 = brc_bread_crumbs();
          uint64_t v30 = brc_default_log();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
            -[BRCURLToItemLookup(BRCFSWriter) _canUpdatePathMatch:hasAdditionsToApply:]();
          }
LABEL_51:

          goto LABEL_52;
        }
        if (v25)
        {
          v38 = [a3->var1 latestVersion];
          unint64_t v39 = [v38 diffAgainst:v26];

          if ([v24 isPausedFromSync] ? v39 & 0xFFFFFFFFFC04FFFFLL : v39)
          {
            v29 = brc_bread_crumbs();
            uint64_t v30 = brc_default_log();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              __int16 v43 = [a3->var1 latestVersion];
              v44 = BRCItemFieldsPrettyPrint();
              *(_DWORD *)buf = 138413058;
              __int16 v49 = (const char *)v26;
              __int16 v50 = 2112;
              *(void *)__int16 v51 = v43;
              *(_WORD *)&v51[8] = 2112;
              *(void *)v52 = v44;
              *(_WORD *)&v52[8] = 2112;
              uint64_t v53 = v29;
              _os_log_debug_impl(&dword_1D353B000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] staged version is stale:\nstaged: %@\nserver: %@\ndiffs:  %@%@", buf, 0x2Au);
            }
            goto LABEL_51;
          }
        }
      }
      BOOL v41 = 1;
      goto LABEL_53;
    }
    if (v10)
    {
      if (![v7 isDocument] || objc_msgSend(v7, "isReserved"))
      {
        v45 = brc_bread_crumbs();
        uint64_t v46 = brc_default_log();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
          -[BRCURLToItemLookup(BRCFSWriter) _canUpdatePathMatch:hasAdditionsToApply:]();
        }
      }
      goto LABEL_16;
    }
    if (([v7 isReserved] & 1) == 0 && (!objc_msgSend(v7, "isDocument") || v4)) {
      goto LABEL_16;
    }
    unsigned int v23 = brc_bread_crumbs();
    uint64_t v34 = brc_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      if ([v7 isReserved]) {
        v35 = "YES";
      }
      else {
        v35 = "NO";
      }
      *(_DWORD *)buf = 136315906;
      if ([v7 isDocument]) {
        int v36 = "YES";
      }
      else {
        int v36 = "NO";
      }
      __int16 v49 = v35;
      if (v4) {
        char v37 = "YES";
      }
      else {
        char v37 = "NO";
      }
      __int16 v50 = 2080;
      *(void *)__int16 v51 = v36;
      *(_WORD *)&v51[8] = 2080;
      *(void *)v52 = v37;
      *(_WORD *)&v52[8] = 2112;
      uint64_t v53 = v23;
      _os_log_impl(&dword_1D353B000, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] we probably shouldn't have asked coordination in the first place (reserved:%s document:%s additions:%s)%@", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v21 = brc_bread_crumbs();
    __int16 v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[BRCURLToItemLookup(BRCFSWriter) _canUpdatePathMatch:hasAdditionsToApply:].cold.6();
    }

    unsigned int v23 = [(BRCAccountSession *)self->_session applyScheduler];
    [v23 setState:22 forServerItem:a3->var1 localItem:a3->var0];
  }

  id v10 = 0;
LABEL_52:
  BOOL v41 = 0;
LABEL_53:

  return v41;
}

- (BOOL)_bouncePathMatchIfNecessaryWithLookup:(id)a3 localItem:(id)a4 serverItem:(id)a5 bounceNamespace:(unsigned __int8)a6 applyNamespace:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  uint64_t v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  int v15 = [(BRCAccountSession(LegacyAdditions) *)self->_session fsWriter];
  int v16 = [v15 _computeURLMatchWithLookup:v12 localItem:v13 serverItem:v14 bounceNamespace:v8 applyNamespace:v7 urlMatch:&v23];

  if (v16 == -1) {
    goto LABEL_6;
  }
  if (v16)
  {
    int v17 = [(BRCAccountSession(LegacyAdditions) *)self->_session fsWriter];
    int v18 = [v14 serverZone];
    int v19 = [v18 clientZone];
    int v20 = [v17 bouncePathMatch:&v23 toApplyServerItem:v14 clientZone:v19];

    if (v20)
    {
      [v12 _clearNamespace:v8];
      goto LABEL_5;
    }
LABEL_6:
    BOOL v21 = 0;
    goto LABEL_7;
  }
LABEL_5:
  BOOL v21 = 1;
LABEL_7:
  __destructor_8_s0_s8_s16_s24((uint64_t)&v23);

  return v21;
}

- (BOOL)copyItemAtURLToGenstore:(id)a3 forItem:(id)a4 error:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Moving item to genstore as a readonly edit for %@%@", buf, 0x16u);
  }

  id v10 = [MEMORY[0x1E4F63BE8] manager];
  uint64_t v11 = [v10 permanentStorageForItemAtURL:v41 allocateIfNone:1 error:a5];

  if (v11)
  {
    id v12 = [v6 currentVersion];
    id v13 = [v6 db];
    *((void *)&v39 + 1) = [v12 lastEditorDeviceDisplayNameWithDB:v13];

    id v14 = [v6 db];
    int v15 = [v12 lastEditorUserIdentityWithDB:v14];
    *(void *)&long long v39 = [v15 nameComponentsAcceptUnknownUser:1];

    id v37 = (id)*MEMORY[0x1E4F63BB8];
    int v16 = [v12 originalPOSIXName];
    v38 = objc_msgSend(v16, "br_pathExtension");

    int v17 = [v6 itemID];
    int v18 = [v17 itemIDString];
    int v19 = [@"roedit_" stringByAppendingString:v18];

    if ([v38 length])
    {
      uint64_t v20 = [v19 stringByAppendingPathExtension:v38];

      int v19 = (void *)v20;
    }
    BOOL v21 = [v12 originalPOSIXName];
    [v7 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F63BA8]];

    __int16 v22 = [v6 st];
    long long v23 = objc_msgSend(v12, "displayNameWithoutExtension:", objc_msgSend(v22, "isHiddenExt"));
    [v7 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F63B78]];

    [v7 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F63B88]];
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F63B80]];
    [v7 setObject:&unk_1F2B27690 forKeyedSubscript:*MEMORY[0x1E4F63B98]];
    [v7 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F63B90]];
    [v7 setObject:&unk_1F2B276A8 forKeyedSubscript:*MEMORY[0x1E4F63BA0]];
    if (v39 != 0)
    {
      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v25 = v24;
      if (*((void *)&v39 + 1)) {
        [v24 setObject:*((void *)&v39 + 1) forKeyedSubscript:*MEMORY[0x1E4F592B0]];
      }
      if ((void)v39)
      {
        uint64_t v26 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:(void)v39 requiringSecureCoding:1 error:0];
        [v25 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F592B8]];
      }
      id v27 = [v6 currentVersion];
      uint64_t v28 = [v27 ckInfo];
      v29 = [v28 etag];
      [v25 setObject:v29 forKeyedSubscript:@"etag"];

      [v7 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F63BB0]];
    }
    uint64_t v30 = [v11 prepareAdditionCreationWithItemAtURL:v41 byMoving:0 creationInfo:v7 error:a5];
    BOOL v31 = v30 != 0;
    if (v30)
    {
      dispatch_semaphore_t v32 = dispatch_semaphore_create(0);
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      uint64_t v53 = __Block_byref_object_copy__55;
      uint64_t v54 = __Block_byref_object_dispose__55;
      id v55 = 0;
      uint64_t v46 = 0;
      int v47 = &v46;
      uint64_t v48 = 0x3032000000;
      __int16 v49 = __Block_byref_object_copy__55;
      __int16 v50 = __Block_byref_object_dispose__55;
      id v51 = 0;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __73__BRCURLToItemLookup_BRCFSWriter__copyItemAtURLToGenstore_forItem_error___block_invoke;
      v42[3] = &unk_1E699BA60;
      v44 = &v46;
      v45 = buf;
      v33 = v32;
      __int16 v43 = v33;
      [v11 createAdditionStagedAtURL:v30 creationInfo:v7 completionHandler:v42];
      if (a5) {
        *a5 = (id) v47[5];
      }
      dispatch_semaphore_wait(v33, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v34 = (void *)MEMORY[0x1E4F28CA0];
      v35 = [*(id *)(*(void *)&buf[8] + 40) name];
      objc_msgSend(v34, "__itemAtURL:didGainVersionWithClientID:name:purposeID:", v41, v37, v35, 0);

      _Block_object_dispose(&v46, 8);
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

void __73__BRCURLToItemLookup_BRCFSWriter__copyItemAtURLToGenstore_forItem_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)tryToUpdateItemInNamespace:(unsigned __int8)a3 withDstLookup:(id)a4
{
  unsigned int v177 = a3;
  uint64_t v214 = *MEMORY[0x1E4F143B8];
  id v179 = a4;
  v176 = [(BRCAccountSession *)self->_session stageRegistry];
  uint64_t v202 = 0;
  long long v200 = 0u;
  long long v201 = 0u;
  [(BRCURLToItemLookup *)self _pathMatchInNamespace:v177];
  id v5 = 0;
  v181 = 0;
  if ([v5 isDocument])
  {
    id v6 = [v5 asDocument];
  }
  else
  {
    id v6 = 0;
  }
  v180 = self;
  v178 = [v6 desiredVersion];
  if (![v181 isDead])
  {
    BOOL v173 = +[BRCServerChangesApplyUtil shouldForceApplyContentForItem:v5];
    if (v173)
    {
      id v9 = brc_bread_crumbs();
      id v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:]3();
      }

      v202 &= 0x3FF0000u;
    }
    if (+[BRCFSWriter _shouldForceApplyMetadataForItem:v5])
    {
      uint64_t v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:]2();
      }

      v202 &= 0xFFFFFFFFFC04FFFFLL;
    }
    if ([v5 isReserved]) {
      goto LABEL_17;
    }
    int v25 = [v5 isLive];
    if (v202) {
      int v26 = v25;
    }
    else {
      int v26 = 0;
    }
    if (v26 == 1)
    {
      if (v6)
      {
        id v27 = [(BRCAccountSession *)self->_session fsDownloader];
        unsigned int v171 = [v27 hasAdditionsToApplyForItem:v6 serverItem:v181];

        goto LABEL_18;
      }
    }
    else
    {
      if (!v6) {
        goto LABEL_65;
      }
      int v36 = [(BRCAccountSession *)self->_session fsDownloader];
      char v37 = [v36 hasAdditionsToApplyForItem:v6 serverItem:v181];

      if (v37)
      {
        unsigned int v171 = 1;
LABEL_18:
        memset(v199, 0, sizeof(v199));
        __brc_create_section(0, (uint64_t)"-[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:]", 1047, v199);
        id v13 = brc_bread_crumbs();
        id v14 = brc_default_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v48 = v199[0];
          __int16 v49 = (__CFString *)v201;
          __int16 v50 = BRCItemFieldsPrettyPrint();
          if (v49) {
            id v51 = v49;
          }
          else {
            id v51 = &stru_1F2AC7720;
          }
          id v52 = v50;
          *(_DWORD *)buf = 134219266;
          v205 = v48;
          __int16 v206 = 2112;
          v207 = v5;
          __int16 v208 = 2112;
          *(void *)v209 = v181;
          *(_WORD *)&v209[8] = 2112;
          *(void *)&v209[10] = v51;
          __int16 v210 = 2112;
          id v211 = v52;
          __int16 v212 = 2112;
          v213 = v13;
          _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Trying to update pending-update item\nlocal  item: %@\nserver item: %@\npath       : %@\ndiffs      : %@%@", buf, 0x3Eu);
        }
        if ((v202 & 0x1000000060) == 0
          && ![v5 physicalNameNeedsRename])
        {
          int v24 = 0;
          v35 = v180;
          v175 = v180;
LABEL_44:
          if (![(BRCURLToItemLookup *)v35 _canUpdatePathMatch:&v200 hasAdditionsToApply:v171])
          {
            id v41 = brc_bread_crumbs();
            v42 = brc_default_log();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              BRCPrettyPrintEnum();
              -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:].cold.8();
            }
            goto LABEL_132;
          }
          char v38 = [v5 isReserved];
          if (v178) {
            char v39 = 1;
          }
          else {
            char v39 = v38;
          }
          if ((v39 & 1) == 0 && (v202 & 0x1FE2000) == 0)
          {
            uint64_t v169 = 0;
LABEL_85:
            if (!v173 && (([v5 isReserved] & 1) != 0 || (v202 & 0xF0007FFE) != 0))
            {
              [v5 updateStatMetadataFromServerItem:v181];
              [v5 updateItemMetadataFromServerItem:v181 appliedSharingPermission:0];
            }
            uint64_t v53 = v202;
            if ((v202 & 0x2000) != 0)
            {
              uint64_t v54 = brc_bread_crumbs();
              id v55 = brc_default_log();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v205 = v5;
                __int16 v206 = 2112;
                v207 = v181;
                __int16 v208 = 2112;
                *(void *)v209 = v54;
                _os_log_debug_impl(&dword_1D353B000, v55, OS_LOG_TYPE_DEBUG, "[DEBUG] Got an update for symlink target: %@ -> %@. Creating a new symlink in the stage directory so we can swap with the old one%@", buf, 0x20u);
              }

              uint64_t v56 = [v5 asSymlink];
              long long v57 = [v181 symlinkTarget];
              [v56 updateSymlinkTarget:v57];

              uint64_t v53 = v202;
            }
            if ((v53 & 0x1000000060) == 0
              && ([v5 isReserved] & 1) == 0
              && (![v178 isFault] || -[NSObject isFault](v5, "isFault")))
            {
              if (!v178
                || ![v5 isFault]
                || ((int v72 = [v178 isFault], !v169) ? (v73 = 1) : (v73 = v72), v73 == 1))
              {
                if (![v5 physicalNameNeedsRename])
                {
LABEL_125:
                  id v41 = [(BRCURLToItemLookup *)v175 byPathRelpath];
                  v81 = [v5 st];
                  v168 = [v81 filename];

                  v82 = [v5 st];
                  v172 = [v82 logicalName];
                  int v164 = 0;
                  v166 = 0;
                  v167 = 0;
                  v42 = 0;
                  goto LABEL_149;
                }
                v74 = [v5 st];
                v75 = [v74 physicalName];
                v76 = [v181 st];
                v77 = [v76 logicalName];
                int v78 = [v75 isEqualToString:v77];

                if (v78)
                {
                  v79 = [v181 st];
                  v80 = [v79 logicalName];
                  [v5 markRenamedUsingServerItem:v181 toRelpath:0 logicalName:v80 filename:0 origLogicalNameBeforeBounce:0 forContentApplyOnly:v173];

                  goto LABEL_125;
                }
              }
            }
            if ([v178 isFault]
              && ![(BRCURLToItemLookup *)v180 _bounceBouncesHiddenByFault:v5])
            {
              goto LABEL_104;
            }
            v58 = [(BRCAccountSession(LegacyAdditions) *)self->_session fsWriter];
            uint64_t v59 = [v58 computeSourceBounceNumberIfNecessaryWithLookup:v175 localItem:v5 serverItem:v181];

            if (v59)
            {
              v60 = [v181 st];
              int v61 = [v60 logicalName];
              [v5 bounceSourceItemWithServerLogicalName:v61 bounceNumber:v59];

              unsigned int v62 = [v5 st];
              v172 = [v62 logicalName];

              if ([v178 isFault])
              {
                v168 = [v172 br_sideFaultName];
              }
              else
              {
                v168 = v172;
              }
              v64 = [(BRCURLToItemLookup *)v175 parentRelpath];
              id v41 = [v64 pathWithChildAtPath:v168];

              if ([v178 isFault])
              {
                v65 = [v5 asDocument];
                int v66 = [v5 isOnDisk];
                v67 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v178, "size"));
                objc_msgSend(v65, "stageFaultForCreation:name:size:isPackage:", v66 ^ 1u, v172, v67, objc_msgSend(v178, "isPackage"));

                [v5 saveToDB];
                v68 = brc_bread_crumbs();
                v69 = brc_default_log();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v205 = v68;
                  _os_log_impl(&dword_1D353B000, v69, OS_LOG_TYPE_DEFAULT, "[WARNING] We're bouncing an item becoming a fault at the source which needs to be re-staged.  Bailing out early to retry%@", buf, 0xCu);
                }
LABEL_128:

                v166 = 0;
                v167 = 0;
                unsigned int v63 = 0;
                v42 = 0;
                goto LABEL_129;
              }
              if (([v41 resolveMustExist:0 error:0] & 1) == 0)
              {
                v68 = brc_bread_crumbs();
                v69 = brc_default_log();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v205 = v41;
                  __int16 v206 = 2112;
                  v207 = v68;
                  _os_log_impl(&dword_1D353B000, v69, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to resolve bounced path %@%@", buf, 0x16u);
                }
                goto LABEL_128;
              }
              v70 = brc_bread_crumbs();
              v71 = brc_default_log();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v205 = v168;
                __int16 v206 = 2112;
                v207 = v70;
                _os_log_impl(&dword_1D353B000, v71, OS_LOG_TYPE_DEFAULT, "[WARNING] Bouncing the source item because it's a shared to me top level item to %@%@", buf, 0x16u);
              }

LABEL_148:
              v42 = (id)v201;
              v166 = [v42 filename];
              v82 = [v5 st];
              v167 = [v82 logicalName];
              int v164 = 1;
LABEL_149:

              v88 = [v6 uploadError];
              int v89 = objc_msgSend(v88, "br_isCloudDocsErrorCode:", 43);

              if (v89)
              {
                if (v181) {
                  v90 = v181;
                }
                else {
                  v90 = v6;
                }
                if (([v90 sharingOptions] & 0x20) == 0)
                {
                  v91 = [(BRCAccountSession(LegacyAdditions) *)self->_session fsWriter];
                  v92 = [v41 physicalURL];
                  v93 = [v5 asDocument];
                  int v94 = [v91 applyLocalEditIfNecessaryToURL:v92 forItem:v93 serverItem:v181 forDelete:0 error:0];

                  if (v94)
                  {
                    v95 = brc_bread_crumbs();
                    v96 = brc_default_log();
                    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG)) {
                      -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:]();
                    }

                    unsigned int v63 = 0;
                    goto LABEL_129;
                  }
                }
                if (v169)
                {
                  if (([v5 isFault] & 1) == 0
                    && ([v181 sharingOptions] & 0x20) != 0)
                  {
                    v161 = [v5 asDocument];
                    v158 = [v161 uploadError];
                    v97 = [v158 userInfo];
                    v98 = [v97 objectForKeyedSubscript:@"inode"];
                    v99 = [v5 st];
                    v100 = [v99 fileID];
                    LODWORD(v157) = [v98 isEqual:v100];

                    if (v157)
                    {
                      v101 = [(BRCURLToItemLookup *)v175 url];
                      v102 = [v5 asDocument];
                      id v198 = 0;
                      BOOL v103 = [(BRCURLToItemLookup *)v180 copyItemAtURLToGenstore:v101 forItem:v102 error:&v198];
                      unsigned int v63 = v198;

                      if (!v103)
                      {
                        v104 = brc_bread_crumbs();
                        v105 = brc_default_log();
                        if (os_log_type_enabled(v105, (os_log_type_t)0x90u)) {
                          -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:].cold.5();
                        }

                        goto LABEL_129;
                      }
LABEL_187:
                      v120 = [(BRCAccountSession *)self->_session volume];
                      if ([v120 hasRenameSwap]
                        && ([v5 isReserved] & 1) == 0)
                      {

                        if ((v164 & 1) == 0)
                        {
                          v134 = [v5 st];
                          uint64_t v135 = [v134 fileID];
                          -[NSObject applyMetadataOnFileID:liveFD:sharingOptions:](v5, "applyMetadataOnFileID:liveFD:sharingOptions:", v169, [(id)v135 unsignedLongLongValue], -[NSObject sharingOptions](v181, "sharingOptions"));

                          v197 = v63;
                          LOBYTE(v135) = [v176 makeItemLive:v5 fromStage:v169 bySwappingWith:(void)v201 fileName:v168 error:&v197];
                          v136 = v197;

                          unsigned int v63 = v136;
                          if ((v135 & 1) == 0)
                          {
                            v137 = brc_bread_crumbs();
                            v138 = brc_default_log();
                            if (os_log_type_enabled(v138, (os_log_type_t)0x90u))
                            {
                              *(_DWORD *)buf = 138413314;
                              v205 = v5;
                              __int16 v206 = 2112;
                              v207 = v201;
                              __int16 v208 = 2112;
                              *(void *)v209 = v168;
                              *(_WORD *)&v209[8] = 2112;
                              *(void *)&v209[10] = v136;
                              __int16 v210 = 2112;
                              id v211 = v137;
                              _os_log_error_impl(&dword_1D353B000, v138, (os_log_type_t)0x90u, "[ERROR] Failed to unstage %@ [%@] to %@: %@%@", buf, 0x34u);
                            }

                            goto LABEL_129;
                          }
                          goto LABEL_219;
                        }
                      }
                      else
                      {
                      }
                      if (([v5 isReserved] & 1) == 0)
                      {
                        v196 = v63;
                        char v121 = [v176 moveOldVersionFromPath:(void)v201 error:&v196];
                        v122 = v196;

                        unsigned int v63 = v122;
                        if ((v121 & 1) == 0)
                        {
                          v139 = brc_bread_crumbs();
                          v140 = brc_default_log();
                          if (os_log_type_enabled(v140, (os_log_type_t)0x90u))
                          {
                            *(_DWORD *)buf = 138412802;
                            v205 = v201;
                            __int16 v206 = 2112;
                            v207 = v122;
                            __int16 v208 = 2112;
                            *(void *)v209 = v139;
                            _os_log_error_impl(&dword_1D353B000, v140, (os_log_type_t)0x90u, "[ERROR] Failed to move %@ to graveyard: %@%@", buf, 0x20u);
                          }

                          goto LABEL_129;
                        }
                      }
                      if (v164
                        && ([v5 isReserved] & 1) == 0
                        && [v5 isDocument])
                      {
                        v163 = [v5 st];
                        v160 = [v163 documentID];
                        uint64_t v123 = [v160 unsignedIntValue];
                        v124 = [v5 st];
                        v125 = [v124 fileID];
                        objc_msgSend(v176, "transferDocumentID:fromOldVersionStage:toStage:", v123, objc_msgSend(v125, "unsignedLongLongValue"), v169);
                      }
                      v126 = [v5 st];
                      uint64_t v127 = [v126 fileID];
                      -[NSObject applyMetadataOnFileID:liveFD:sharingOptions:](v5, "applyMetadataOnFileID:liveFD:sharingOptions:", v169, [(id)v127 unsignedLongLongValue], -[NSObject sharingOptions](v181, "sharingOptions"));

                      v195 = v63;
                      LOBYTE(v127) = [v176 moveFromStage:v169 toPath:v41 fileName:v168 error:&v195];
                      v128 = v195;

                      unsigned int v63 = v128;
                      if ((v127 & 1) == 0)
                      {
                        v132 = brc_bread_crumbs();
                        v133 = brc_default_log();
                        if (os_log_type_enabled(v133, (os_log_type_t)0x90u))
                        {
                          *(_DWORD *)buf = 138413314;
                          v205 = v5;
                          __int16 v206 = 2112;
                          v207 = v41;
                          __int16 v208 = 2112;
                          *(void *)v209 = v168;
                          *(_WORD *)&v209[8] = 2112;
                          *(void *)&v209[10] = v128;
                          __int16 v210 = 2112;
                          id v211 = v132;
                          _os_log_error_impl(&dword_1D353B000, v133, (os_log_type_t)0x90u, "[ERROR] Failed to unstage %@ [%@] to %@: %@%@", buf, 0x34u);
                        }

                        [v5 markReserved];
                        [v5 saveToDB];
                        if ([v128 br_isPOSIXErrorCode:17]) {
                          [v5 scanParentDirectory];
                        }
                        goto LABEL_129;
                      }
                      if (([v5 isReserved] & 1) == 0)
                      {
                        uint64_t v129 = [(id)v201 fileID];
                        char v130 = [v178 isFault];
                        if (v130)
                        {
                          v131 = 0;
                        }
                        else
                        {
                          v131 = [v5 itemID];
                        }
                        [v176 moveFromStageToGraveyard:v129 forItemID:v131];
                        if ((v130 & 1) == 0) {
                      }
                        }
                      if (((v24 | v164 ^ 1) & 1) == 0 && v42)
                      {
                        +[BRCFileCoordinator itemAtPath:v42 logicalFilename:v167 didMoveToPath:v41 logicalFilename:v172 hasContentUpdate:1];
                        v141 = brc_bread_crumbs();
                        v142 = brc_default_log();
                        if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138413314;
                          v205 = v42;
                          __int16 v206 = 2112;
                          v207 = v166;
                          __int16 v208 = 2112;
                          *(void *)v209 = v41;
                          *(_WORD *)&v209[8] = 2112;
                          *(void *)&v209[10] = v168;
                          __int16 v210 = 2112;
                          id v211 = v141;
                          _os_log_debug_impl(&dword_1D353B000, v142, OS_LOG_TYPE_DEBUG, "[DEBUG] renamed from %@ (%@)\n        to %@ (%@)%@", buf, 0x34u);
                        }
LABEL_224:

                        if (v164) {
                          [v5 markRenamedUsingServerItem:v181 toRelpath:v41 logicalName:v172 filename:v168 origLogicalNameBeforeBounce:0 forContentApplyOnly:v173];
                        }
                        [v5 markLiveFromStageWithPath:v41];
                        goto LABEL_227;
                      }
LABEL_219:
                      if ([v5 isReserved]) {
                        +[BRCFileCoordinator itemDidAppearAtPath:v41 logicalFilename:v172];
                      }
                      else {
                        +[BRCFileCoordinator itemDidChangeAtPath:v41 logicalFilename:v172];
                      }
                      v141 = brc_bread_crumbs();
                      v142 = brc_default_log();
                      if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG)) {
                        -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:].cold.4();
                      }
                      goto LABEL_224;
                    }
                    v118 = brc_bread_crumbs();
                    v119 = brc_default_log();
                    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG)) {
                      -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:].cold.6();
                    }
                  }
LABEL_186:
                  unsigned int v63 = 0;
                  goto LABEL_187;
                }
              }
              else if (v169)
              {
                goto LABEL_186;
              }
              if (!v164)
              {
                if ((v202 & 0x40000000) != 0 && [v5 isDirectory]) {
                  [v5 markLostWhenReplacedByItem:0];
                }
                uint64_t v112 = [(id)v201 fileID];
                v113 = [v5 st];
                v114 = [v113 fileID];
                -[NSObject applyMetadataOnFileID:liveFD:sharingOptions:](v5, "applyMetadataOnFileID:liveFD:sharingOptions:", v112, [v114 unsignedLongLongValue], -[NSObject sharingOptions](v181, "sharingOptions"));

                goto LABEL_182;
              }
              if (v24)
              {
LABEL_181:
                uint64_t v115 = objc_msgSend((id)v201, "fileID", v157);
                v116 = [v5 st];
                v117 = [v116 fileID];
                -[NSObject applyMetadataOnFileID:liveFD:sharingOptions:](v5, "applyMetadataOnFileID:liveFD:sharingOptions:", v115, [v117 unsignedLongLongValue], -[NSObject sharingOptions](v181, "sharingOptions"));

                [v5 markRenamedUsingServerItem:v181 toRelpath:v41 logicalName:v172 filename:v168 origLogicalNameBeforeBounce:0 forContentApplyOnly:v173];
LABEL_182:
                [v5 markMetadataLive];
                unsigned int v63 = 0;
LABEL_227:
                uint64_t v143 = [v5 sharingOptions];
                if (([v181 sharingOptions] ^ v143) == 0x20) {
                  [v5 updateItemMetadataFromServerItem:v181 appliedSharingPermission:1];
                }
                if (!v173) {
                  [v5 updateStructuralCKInfoFromServerItem:v181];
                }
                [(BRCURLToItemLookup *)v175 didApplyChangesAtPath:v41 filename:v168 li:v5 si:v181];
                [v5 setOrRemoveSpotlightAttributeAt:v41];
                v144 = brc_bread_crumbs();
                v145 = brc_default_log();
                if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG)) {
                  -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:]();
                }

                if (v6)
                {
                  memset(v186, 0, sizeof(v186));
                  __brc_create_section(0, (uint64_t)"-[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:]", 1376, v186);
                  v146 = brc_bread_crumbs();
                  v147 = brc_default_log();
                  if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v153 = v186[0];
                    v154 = [v5 itemID];
                    *(_DWORD *)buf = 134218498;
                    v205 = v153;
                    __int16 v206 = 2112;
                    v207 = v154;
                    __int16 v208 = 2112;
                    *(void *)v209 = v146;
                    _os_log_debug_impl(&dword_1D353B000, v147, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx rewriting all aliases pointing to %@%@", buf, 0x20u);
                  }
                  v174 = v63;
                  long long v184 = 0u;
                  long long v185 = 0u;
                  long long v182 = 0u;
                  long long v183 = 0u;
                  v148 = [v6 reverseAliasEnumerator];
                  uint64_t v149 = [v148 countByEnumeratingWithState:&v182 objects:v203 count:16];
                  if (v149)
                  {
                    uint64_t v150 = *(void *)v183;
                    do
                    {
                      for (uint64_t i = 0; i != v149; ++i)
                      {
                        if (*(void *)v183 != v150) {
                          objc_enumerationMutation(v148);
                        }
                        v152 = *(void **)(*((void *)&v182 + 1) + 8 * i);
                        [v152 rewriteOrDeleteAliasOnDiskWithTarget:v6];
                        [v152 saveToDB];
                      }
                      uint64_t v149 = [v148 countByEnumeratingWithState:&v182 objects:v203 count:16];
                    }
                    while (v149);
                  }

                  unsigned int v63 = v174;
                  if ([v6 isResumingSync]) {
                    [v6 resumeSyncComplete];
                  }
                  __brc_leave_section(v186);
                }
                goto LABEL_129;
              }
              LODWORD(v186[0]) = 0;
              v187[0] = MEMORY[0x1E4F143A8];
              v187[1] = 3221225472;
              v187[2] = __76__BRCURLToItemLookup_BRCFSWriter__tryToUpdateItemInNamespace_withDstLookup___block_invoke;
              v187[3] = &unk_1E699BA88;
              v162 = v42;
              v188 = v162;
              v106 = v41;
              v189 = v106;
              v107 = v166;
              v190 = v107;
              v165 = v168;
              v191 = v165;
              id v108 = v167;
              id v192 = v108;
              v159 = v172;
              v193 = v159;
              uint64_t v194 = 0;
              [v106 performOnOpenParentFileDescriptor:v187 error:v186];
              int v109 = v186[0];
              id v157 = v108;
              if (LODWORD(v186[0]))
              {
                v170 = brc_bread_crumbs();
                v110 = brc_default_log();
                if (os_log_type_enabled(v110, (os_log_type_t)0x90u))
                {
                  v111 = v107;
                  *(_DWORD *)buf = 138413058;
                  v205 = v106;
                  __int16 v206 = 2112;
                  v207 = v165;
                  __int16 v208 = 1024;
                  *(_DWORD *)v209 = v186[0];
                  *(_WORD *)&v209[4] = 2112;
                  *(void *)&v209[6] = v170;
                  _os_log_error_impl(&dword_1D353B000, v110, (os_log_type_t)0x90u, "[ERROR] failed renaming to %@ (name:'%@') %{errno}d%@", buf, 0x26u);
                  goto LABEL_179;
                }
              }
              else
              {
                v170 = brc_bread_crumbs();
                v110 = brc_default_log();
                if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138413314;
                  v205 = v162;
                  __int16 v206 = 2112;
                  v111 = v107;
                  v207 = v107;
                  __int16 v208 = 2112;
                  *(void *)v209 = v106;
                  *(_WORD *)&v209[8] = 2112;
                  *(void *)&v209[10] = v165;
                  __int16 v210 = 2112;
                  id v211 = v170;
                  _os_log_debug_impl(&dword_1D353B000, v110, OS_LOG_TYPE_DEBUG, "[DEBUG] renamed from %@ (name:'%@')\n        to %@ (name:'%@')%@", buf, 0x34u);
LABEL_179:

                  if (v109)
                  {
                    unsigned int v63 = 0;
                    v42 = v162;
                    v172 = v159;
                    v166 = v111;
                    v167 = v157;
                    v168 = v165;
                    id v41 = v106;
                    goto LABEL_129;
                  }
                  goto LABEL_181;
                }
              }
              v111 = v107;
              goto LABEL_179;
            }
            if (![(BRCURLToItemLookup *)v180 _bouncePathMatchIfNecessaryWithLookup:v175 localItem:v5 serverItem:v181 bounceNamespace:1 applyNamespace:v177]|| ![(BRCURLToItemLookup *)v180 _bouncePathMatchIfNecessaryWithLookup:v175 localItem:v5 serverItem:v181 bounceNamespace:0 applyNamespace:v177])
            {
LABEL_104:
              v166 = 0;
              v167 = 0;
              v172 = 0;
              unsigned int v63 = 0;
              v168 = 0;
              v42 = 0;
              id v41 = 0;
LABEL_129:
              if (-[NSObject br_isPOSIXErrorCode:](v63, "br_isPOSIXErrorCode:", 1, v157))
              {
                v83 = [(BRCAccountSession *)self->_session applyScheduler];
                [v83 setState:18 forServerItem:v181 localItem:v5];
              }
              [(BRCURLToItemLookup *)v180 _clearNamespace:v177];

LABEL_132:
              v180 = v175;
LABEL_133:

              v175 = v180;
LABEL_134:

              __brc_leave_section(v199);
              v180 = v175;
              goto LABEL_135;
            }
            if ([v178 isFault]) {
              [(BRCURLToItemLookup *)v175 faultedRelpath];
            }
            else {
            id v41 = [(BRCURLToItemLookup *)v175 byPathRelpath];
            }

            if (v173)
            {
              v87 = [v5 st];
              v172 = [v87 logicalName];
            }
            else
            {
              v87 = [v5 computedDestinationFilenameFromServerItem:v181];
              v172 = v87;
            }

            if (v178)
            {
              if ([v178 isFault])
              {
LABEL_142:
                v168 = [v172 br_sideFaultName];
                goto LABEL_148;
              }
            }
            else if ([v5 isFault])
            {
              goto LABEL_142;
            }
            if ([v181 isDirectory]
              && objc_msgSend(0, "br_isPackageRoot"))
            {
              v168 = [v172 br_representableDirectoryName];
            }
            else
            {
              v172 = v172;
              v168 = v172;
            }
            goto LABEL_148;
          }
          v40 = [v5 st];
          id v41 = [v40 stagedFileID];

          uint64_t v169 = [v41 unsignedLongLongValue];
          if (v169 && ([v176 didFlushStagedFileID:v169] & 1) == 0)
          {
            v44 = brc_bread_crumbs();
            v45 = brc_default_log();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v205 = v44;
              _os_log_impl(&dword_1D353B000, v45, OS_LOG_TYPE_DEFAULT, "[WARNING] the staged fileID isn't yet flushed%@", buf, 0xCu);
            }

            if (!v178 || v41) {
              goto LABEL_76;
            }
          }
          else if (!v178 || v41)
          {
            if (v6 && !v169) {
              [v6 updateVersionMetadataFromServerItem:v181 preventVersionDiffs:0];
            }

            goto LABEL_85;
          }
          uint64_t v46 = brc_bread_crumbs();
          int v47 = brc_default_log();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v205 = v46;
            _os_log_impl(&dword_1D353B000, v47, OS_LOG_TYPE_DEFAULT, "[WARNING] nothing to do at that path, will need a new coordination%@", buf, 0xCu);
          }

LABEL_76:
          if (v171 && ([v5 isReserved] & 1) == 0)
          {
            if ([v5 diffAgainstOriginalItem])
            {
              v155 = brc_bread_crumbs();
              v156 = brc_default_log();
              if (os_log_type_enabled(v156, OS_LOG_TYPE_FAULT)) {
                -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:].cold.7();
              }
            }
            [(BRCURLToItemLookup *)v180 didApplyChangesAtPath:(void)v201 filename:0 li:v5 si:v181];
          }
          goto LABEL_134;
        }
        int v15 = [v179 filename];
        int v16 = [v181 st];
        int v17 = [v16 representableName];
        if ([v15 isEqualToString:v17])
        {
          int v18 = [v179 parentItem];
          int v19 = [v18 itemID];
          uint64_t v20 = [v181 parentItemIDOnFS];
          int v21 = [v19 isEqualToItemID:v20];

          if (v21)
          {
            v175 = (BRCURLToItemLookup *)v179;

            __int16 v22 = brc_bread_crumbs();
            long long v23 = brc_default_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              v84 = [(BRCURLToItemLookup *)v175 url];
              v85 = [v84 path];
              v86 = [v85 stringByAbbreviatingWithTildeInPath];
              *(_DWORD *)buf = 138412546;
              v205 = v86;
              __int16 v206 = 2112;
              v207 = v22;
              _os_log_debug_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Item is pending-rename to %@%@", buf, 0x16u);
            }
            int v24 = 0;
LABEL_39:

            v35 = v180;
            goto LABEL_44;
          }
        }
        else
        {
        }
        if ((v202 & 0x20) == 0)
        {
          uint64_t v28 = [v5 st];
          v29 = [v28 rawBouncedLogicalName];
          if (v29)
          {
            uint64_t v30 = [v5 st];
            BOOL v31 = [v30 logicalName];
            dispatch_semaphore_t v32 = [v181 st];
            v33 = [v32 logicalName];
            int v34 = [v31 isEqualToString:v33];

            if (v34)
            {
              __int16 v22 = brc_bread_crumbs();
              long long v23 = brc_default_log();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
                -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:]0();
              }
              int v24 = 1;
              v175 = v180;
              goto LABEL_39;
            }
          }
          else
          {
          }
        }
        id v41 = brc_bread_crumbs();
        v42 = brc_default_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
          -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:].cold.9();
        }
        goto LABEL_133;
      }
      if (!v178 || (int v43 = -[NSObject isFault](v5, "isFault"), v43 == [v178 isFault]))
      {
LABEL_65:
        if (([v5 physicalNameNeedsRename] & 1) == 0)
        {
          id v7 = brc_bread_crumbs();
          uint64_t v8 = brc_default_log();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            BRCPrettyPrintEnum();
            -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:]1();
          }
          goto LABEL_7;
        }
      }
    }
LABEL_17:
    unsigned int v171 = 0;
    goto LABEL_18;
  }
  id v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    BRCPrettyPrintEnum();
    -[BRCURLToItemLookup(BRCFSWriter) tryToUpdateItemInNamespace:withDstLookup:]();
  }
LABEL_7:

LABEL_135:
  __destructor_8_s0_s8_s16_s24((uint64_t)&v200);
}

uint64_t __76__BRCURLToItemLookup_BRCFSWriter__tryToUpdateItemInNamespace_withDstLookup___block_invoke(uint64_t a1, int a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) parentFileID];
  if (v4 != [*(id *)(a1 + 40) parentFileID])
  {
    *(_DWORD *)buf = 0;
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    int v15 = __76__BRCURLToItemLookup_BRCFSWriter__tryToUpdateItemInNamespace_withDstLookup___block_invoke_61;
    int v16 = &unk_1E69983D0;
    id v17 = *(id *)(a1 + 48);
    int v20 = a2;
    id v18 = *(id *)(a1 + 56);
    id v19 = *(id *)(a1 + 32);
    [v8 performOnOpenParentFileDescriptor:&v13 error:buf];
    uint64_t v7 = *(unsigned int *)buf;

    if (v7) {
      return v7;
    }
LABEL_7:
    +[BRCFileCoordinator itemAtPath:logicalFilename:didMoveToPath:logicalFilename:hasContentUpdate:](BRCFileCoordinator, "itemAtPath:logicalFilename:didMoveToPath:logicalFilename:hasContentUpdate:", *(void *)(a1 + 32), *(void *)(a1 + 64), *(void *)(a1 + 40), *(void *)(a1 + 72), *(void *)(a1 + 80) != 0, v13, v14, v15, v16);
    return 0;
  }
  if (!BRCRenameAt(a2, *(void **)(a1 + 48), a2, *(void **)(a1 + 56), 0)) {
    goto LABEL_7;
  }
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    int v12 = *__error();
    *(_DWORD *)buf = 67110402;
    int v22 = a2;
    __int16 v23 = 2112;
    uint64_t v24 = v11;
    __int16 v25 = 1024;
    int v26 = a2;
    __int16 v27 = 2112;
    uint64_t v28 = v10;
    __int16 v29 = 1024;
    int v30 = v12;
    __int16 v31 = 2112;
    dispatch_semaphore_t v32 = v5;
    _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] renameat(%d, '%@', %d, '%@') failed %{errno}d%@", buf, 0x32u);
  }

  return *__error();
}

uint64_t __76__BRCURLToItemLookup_BRCFSWriter__tryToUpdateItemInNamespace_withDstLookup___block_invoke_61(uint64_t a1, int a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t result = BRCRenameAt(a2, *(void **)(a1 + 32), *(_DWORD *)(a1 + 56), *(void **)(a1 + 40), 0);
  if (result)
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = [*(id *)(a1 + 48) absolutePath];
      int v8 = *(_DWORD *)(a1 + 56);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = *__error();
      v11[0] = 67110402;
      v11[1] = a2;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 1024;
      int v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 1024;
      int v19 = v10;
      __int16 v20 = 2112;
      int v21 = v5;
      _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] renameat(%d, '%@', %d, '%@') failed %{errno}d%@", (uint8_t *)v11, 0x32u);
    }
    return *__error();
  }
  return result;
}

- (BOOL)trashItemIfNecessary:(id)a3 atURL:(id)a4 error:(id *)a5
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  char v121 = v7;
  if ([v7 isDocument] && objc_msgSend(v7, "isOnDisk"))
  {
    v110 = a5;
    v113 = v8;
    if (([v7 needsReading] & 1) == 0
      && ([v7 needsUpload] & 1) == 0
      && ([v7 localDiffs] & 0x180000) == 0)
    {
      uint64_t v9 = [(BRCAccountSession *)self->_session syncUpScheduler];
      uint64_t v10 = [v9 inFlightDiffsForItem:v7] & 0x180000;

      if (!v10)
      {
        id v55 = [v7 asDocument];
        uint64_t v56 = [v55 currentVersion];
        long long v57 = [v56 uploadError];
        if ((objc_msgSend(v57, "br_isCloudDocsErrorCode:", 43) & 1) == 0)
        {

          goto LABEL_70;
        }
        v58 = [v121 session];
        uint64_t v59 = [v58 fsWriter];
        v60 = [v121 asDocument];
        int v61 = [v59 applyLocalEditIfNecessaryToURL:v113 forItem:v60 serverItem:0 forDelete:1 error:0];

        if (!v61)
        {
LABEL_70:
          char v49 = 0;
LABEL_71:
          id v8 = v113;
          goto LABEL_72;
        }
        unsigned int v62 = brc_bread_crumbs();
        unsigned int v63 = brc_default_log();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v128 = (const char *)v121;
          __int16 v129 = 2112;
          *(void *)char v130 = v62;
          _os_log_impl(&dword_1D353B000, v63, OS_LOG_TYPE_DEFAULT, "[WARNING] Applying readonly edit to move to trash for %@%@", buf, 0x16u);
        }

        id v7 = v121;
      }
    }
    uint64_t v11 = [v7 appLibrary];
    __int16 v12 = [v11 containerMetadata];
    uint64_t v13 = [v12 trashURL];

    if (v13)
    {
      memset(v126, 0, sizeof(v126));
      __brc_create_section(0, (uint64_t)"-[BRCURLToItemLookup(BRCFSWriter) trashItemIfNecessary:atURL:error:]", 1419, v126);
      __int16 v14 = brc_bread_crumbs();
      int v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v52 = v126[0];
        uint64_t v53 = [v121 appLibrary];
        uint64_t v54 = [v53 appLibraryID];
        *(_DWORD *)buf = 134219010;
        v128 = (const char *)v52;
        __int16 v129 = 2112;
        *(void *)char v130 = v113;
        *(_WORD *)&v130[8] = 2112;
        *(void *)&v130[10] = v54;
        __int16 v131 = 2112;
        v132 = v13;
        __int16 v133 = 2112;
        v134 = v14;
        _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx trash item at %@ in %@ to %@%@", buf, 0x34u);
      }
      if (([v121 sharingOptions] & 4) != 0)
      {
        v116 = 0;
        __int16 v50 = 0;
        __int16 v31 = 0;
      }
      else
      {
        __int16 v16 = objc_msgSend(MEMORY[0x1E4F1A2F8], "brc_fetchShareIDWithSharedItem:", v121);
        uint64_t v17 = [v121 clientZone];
        __int16 v18 = objc_msgSend(v16, "brc_shareItemID");
        v114 = [v17 itemByItemID:v18];
        v119 = v16;

        if (v114)
        {
          int v19 = [v114 st];
          __int16 v20 = [v19 logicalNameWithoutLocalBounce];

          int v21 = NSString;
          uint64_t v22 = [v114 itemID];
          __int16 v23 = [v22 itemIDString];
          uint64_t v24 = [v114 clientZone];
          __int16 v25 = [v24 mangledID];
          int v26 = [v114 clientZone];
          __int16 v27 = [v26 session];
          uint64_t v28 = [v27 accountDSID];
          v116 = [v21 bookmarkDataWithItemResolutionString:v23 serverZoneMangledID:v25 saltAccountDSID:v28];

          __int16 v29 = objc_msgSend(v20, "brc_representableHFSFileNameWithSuffix:addedExtension:makeDotFile:", 0, 0, 0);

          id v30 = v13;
          uint64_t v13 = [v30 URLByAppendingPathComponent:v29];
          __int16 v31 = v30;

          unint64_t v125 = 0;
          dispatch_semaphore_t v32 = objc_msgSend(v29, "br_stringByDeletingPathBounceNo:", &v125);
          uint64_t v33 = v125;
          if (v125 <= 1) {
            uint64_t v33 = 1;
          }
          unint64_t v125 = v33;
          unint64_t v34 = v33 + 1;
          if (v33 + 1 >= (unint64_t)(v33 + 1000))
          {
            uint64_t v48 = v29;
          }
          else
          {
            while (1)
            {
              id v35 = v13;
              int v36 = (const char *)[v35 fileSystemRepresentation];
              int v42 = BRCOpenAt(0xFFFFFFFFLL, v36, 33028, v37, v38, v39, v40, v41, v108);
              if (v42 < 0) {
                break;
              }
              int v43 = [v35 path];
              v44 = BRCGetXattrValueForKeyOnFD(v42, v43, @"com.apple.clouddocs.private.recovered-bookmark#N");

              close(v42);
              if ([v44 isEqualToString:v116])
              {
                v64 = brc_bread_crumbs();
                v65 = brc_default_log();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
                  -[BRCURLToItemLookup(BRCFSWriter) trashItemIfNecessary:atURL:error:]();
                }

                break;
              }
              v45 = brc_bread_crumbs();
              uint64_t v46 = brc_default_log();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v128 = (const char *)v44;
                __int16 v129 = 2112;
                *(void *)char v130 = v116;
                *(_WORD *)&v130[8] = 2112;
                *(void *)&v130[10] = v45;
                _os_log_debug_impl(&dword_1D353B000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] Existing folder doesn't have the trash bookmark set, trying the next path (%@ vs %@)%@", buf, 0x20u);
              }

              int v47 = [NSNumber numberWithUnsignedInteger:v34];
              uint64_t v48 = objc_msgSend(v32, "br_representableHFSFileNameWithNumber:addedExtension:makeDotFile:", v47, 0, 0);

              uint64_t v13 = [v31 URLByAppendingPathComponent:v48];

              ++v34;
              __int16 v29 = v48;
              if (v34 >= v125 + 1000) {
                goto LABEL_36;
              }
            }
            uint64_t v48 = v29;
            uint64_t v13 = v35;
          }
LABEL_36:
        }
        else
        {
          uint64_t v48 = brc_bread_crumbs();
          id v51 = brc_default_log();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
            -[BRCURLToItemLookup(BRCFSWriter) trashItemIfNecessary:atURL:error:]();
          }

          v116 = 0;
          __int16 v31 = 0;
        }

        __int16 v50 = v114;
      }
      int v66 = objc_msgSend(v113, "br_logicalURL");
      v111 = [MEMORY[0x1E4F28CB8] defaultManager];
      v67 = [v66 lastPathComponent];
      id v124 = 0;
      unint64_t v125 = 0;
      v120 = objc_msgSend(v67, "br_stringByDeletingPathBounceNo:andPathExtension:", &v125, &v124);
      id v118 = v124;
      if (!v125) {
        unint64_t v125 = 1;
      }
      id v123 = 0;
      char v68 = [v111 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:&v123];
      id v109 = v123;
      uint64_t v115 = v50;
      uint64_t v112 = v31;
      if ((v68 & 1) == 0)
      {
        v69 = brc_bread_crumbs();
        v70 = brc_default_log();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          v71 = [v13 path];
          *(_DWORD *)buf = 138412802;
          v128 = v71;
          __int16 v129 = 2112;
          *(void *)char v130 = v109;
          *(_WORD *)&v130[8] = 2112;
          *(void *)&v130[10] = v69;
          _os_log_impl(&dword_1D353B000, v70, OS_LOG_TYPE_DEFAULT, "[WARNING] can't create %@: %@%@", buf, 0x20u);
        }
      }
      if (v116)
      {
        id v72 = v13;
        int v73 = (const char *)[v72 fileSystemRepresentation];
        int v79 = BRCOpenAt(0xFFFFFFFFLL, v73, 33028, v74, v75, v76, v77, v78, v108);
        if (v79 < 0)
        {
          int v85 = *__error();
          v86 = brc_bread_crumbs();
          v87 = brc_default_log();
          if (os_log_type_enabled(v87, (os_log_type_t)0x90u))
          {
            v106 = [v72 path];
            *(_DWORD *)buf = 138412802;
            v128 = v106;
            __int16 v129 = 1024;
            *(_DWORD *)char v130 = v85;
            *(_WORD *)&v130[4] = 2112;
            *(void *)&v130[6] = v86;
            _os_log_error_impl(&dword_1D353B000, v87, (os_log_type_t)0x90u, "[ERROR] Failed to open the trash URL to set the recovery xattr at %@ %{errno}d%@", buf, 0x1Cu);
          }
          *__error() = v85;
        }
        else
        {
          v80 = [v72 path];
          BOOL v81 = BRCSetXattrValueForKeyOnFD(v79, v80, @"com.apple.clouddocs.private.recovered-bookmark#N", v116);

          if (!v81)
          {
            int v82 = *__error();
            v83 = brc_bread_crumbs();
            v84 = brc_default_log();
            if (os_log_type_enabled(v84, (os_log_type_t)0x90u))
            {
              v107 = [v72 path];
              *(_DWORD *)buf = 138412802;
              v128 = v107;
              __int16 v129 = 1024;
              *(_DWORD *)char v130 = v82;
              *(_WORD *)&v130[4] = 2112;
              *(void *)&v130[6] = v83;
              _os_log_error_impl(&dword_1D353B000, v84, (os_log_type_t)0x90u, "[ERROR] Failed to set the recovery xattr at %@ %{errno}d%@", buf, 0x1Cu);
            }
            *__error() = v82;
          }
          close(v79);
          __int16 v31 = v112;
        }
      }
      if (v31)
      {
        v88 = [(BRCAccountSession(LegacyAdditions) *)self->_session fsReader];
        [v88 fseventOnURL:v31 dbFlags:0];
      }
      int v89 = [(BRCAccountSession(LegacyAdditions) *)self->_session fsReader];
      [v89 fseventOnURL:v13 dbFlags:16];

      v90 = 0;
      uint64_t v91 = *MEMORY[0x1E4F281F8];
      while (1)
      {
        v92 = [MEMORY[0x1E4F28CB8] defaultManager];
        v93 = [v13 URLByAppendingPathComponent:v67];
        id v122 = v90;
        char v49 = objc_msgSend(v92, "br_movePromisedItemAtURL:toURL:error:", v66, v93, &v122);
        id v94 = v122;

        if (v49)
        {
          id v99 = [v13 URLByAppendingPathComponent:v67];
          v100 = [(BRCAccountSession(LegacyAdditions) *)self->_session fsReader];
          v101 = objc_msgSend(v99, "br_physicalURL");
          [v100 fseventOnURL:v101 dbFlags:0];

          goto LABEL_68;
        }
        v95 = [v94 domain];
        if (![v95 isEqualToString:v91]) {
          break;
        }
        BOOL v96 = [v94 code] == 516;

        if (!v96) {
          goto LABEL_63;
        }
        ++v125;
        v97 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
        uint64_t v98 = objc_msgSend(v120, "br_representableHFSFileNameWithNumber:addedExtension:makeDotFile:", v97, v118, 0);

        v67 = (void *)v98;
        v90 = v94;
      }

LABEL_63:
      id v99 = v94;
      if (v99)
      {
        v102 = brc_bread_crumbs();
        BOOL v103 = brc_default_log();
        if (os_log_type_enabled(v103, (os_log_type_t)0x90u))
        {
          v105 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v128 = "-[BRCURLToItemLookup(BRCFSWriter) trashItemIfNecessary:atURL:error:]";
          __int16 v129 = 2080;
          if (!v110) {
            v105 = "(ignored by caller)";
          }
          *(void *)char v130 = v105;
          *(_WORD *)&v130[8] = 2112;
          *(void *)&v130[10] = v99;
          __int16 v131 = 2112;
          v132 = v102;
          _os_log_error_impl(&dword_1D353B000, v103, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (v110)
      {
        id v99 = v99;
        id *v110 = v99;
      }
LABEL_68:

      __brc_leave_section(v126);
      goto LABEL_71;
    }
    goto LABEL_70;
  }
  char v49 = 0;
LABEL_72:

  return v49;
}

- (BOOL)tryToDeleteItemInNamespace:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  uint64_t v57 = 0;
  long long v55 = 0u;
  long long v56 = 0u;
  -[BRCURLToItemLookup _pathMatchInNamespace:](self, "_pathMatchInNamespace:");
  id v5 = 0;
  id v6 = 0;
  unsigned int v54 = 0;
  if (!v5 || ([v5 isAlmostDead] & 1) != 0 || (objc_msgSend(v6, "isLive") & 1) != 0) {
    goto LABEL_4;
  }
  uint64_t v9 = [v5 clientZone];
  if ([v9 isPrivateZone])
  {
    char v10 = [v5 isLost];

    if (v10) {
      goto LABEL_4;
    }
  }
  else
  {
  }
  if (![v5 isShareAcceptationFault]
    || ([v5 isRejected] & 1) != 0
    || [v6 isDead])
  {
    memset(v53, 0, sizeof(v53));
    __brc_create_section(0, (uint64_t)"-[BRCURLToItemLookup(BRCFSWriter) tryToDeleteItemInNamespace:]", 1543, v53);
    uint64_t v11 = brc_bread_crumbs();
    __int16 v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = (__CFString *)v56;
      if (!(void)v56) {
        uint64_t v33 = &stru_1F2AC7720;
      }
      *(_DWORD *)buf = 134219010;
      uint64_t v59 = v53[0];
      __int16 v60 = 2112;
      *(void *)int v61 = v5;
      *(_WORD *)&v61[8] = 2112;
      *(void *)&v61[10] = v6;
      __int16 v62 = 2112;
      unsigned int v63 = v33;
      __int16 v64 = 2112;
      v65 = v11;
      _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Trying to delete pending-delete item\nlocal  item: %@\nserver item: %@\npath       : %@%@", buf, 0x34u);
    }

    if (+[BRCFSWriter _isPathMatchIdle:&v55]) {
      goto LABEL_27;
    }
    int v13 = [v5 isSharedToMeTopLevelItem];
    if ([v5 isSharedToMeChildItem])
    {
      __int16 v14 = objc_msgSend(MEMORY[0x1E4F1A2F8], "brc_fetchShareIDWithSharedItem:", v5);
      int v15 = objc_msgSend(v14, "brc_shareItemID");
      __int16 v16 = [v5 clientZone];
      uint64_t v17 = [v16 serverItemByItemID:v15];

      if (v17)
      {
        char v18 = [v17 isDead];

        if (v18) {
          goto LABEL_24;
        }
LABEL_20:
        int v19 = brc_bread_crumbs();
        __int16 v20 = brc_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[BRCURLToItemLookup(BRCFSWriter) _canUpdatePathMatch:hasAdditionsToApply:].cold.6();
        }
        goto LABEL_22;
      }
    }
    else if (!v13)
    {
      goto LABEL_20;
    }
LABEL_24:
    uint64_t v22 = brc_bread_crumbs();
    __int16 v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v59 = (uint64_t)v22;
      _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] Shared to me item isn't idle but continuing with deletion anyway%@", buf, 0xCu);
    }

LABEL_27:
    if ([v5 isReserved])
    {
LABEL_28:
      id v21 = 0;
      goto LABEL_29;
    }
    if ([v5 isFault])
    {
      __int16 v29 = (void *)v56;
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3254779904;
      v51[2] = __62__BRCURLToItemLookup_BRCFSWriter__tryToDeleteItemInNamespace___block_invoke;
      v51[3] = &__block_descriptor_72_e8_32n23_8_8_s0_s8_s16_s24_t32w8_e8_i12__0i8l;
      __copy_constructor_8_8_s0_s8_s16_s24_t32w8(v52, (uint64_t)&v55);
      [v29 performOnOpenParentFileDescriptor:v51 error:&v54];
      if (!v54)
      {
        __destructor_8_s0_s8_s16_s24((uint64_t)v52);
        goto LABEL_28;
      }
      id v30 = brc_bread_crumbs();
      __int16 v31 = brc_default_log();
      if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v59 = v56;
        __int16 v60 = 1024;
        *(_DWORD *)int v61 = v54;
        *(_WORD *)&v61[4] = 2112;
        *(void *)&v61[6] = v30;
        _os_log_error_impl(&dword_1D353B000, v31, (os_log_type_t)0x90u, "[ERROR] failed removing fault at '%@' %{errno}d%@", buf, 0x1Cu);
      }

      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", v54);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      __destructor_8_s0_s8_s16_s24((uint64_t)v52);
      goto LABEL_64;
    }
    if (([v5 isDocument] & 1) != 0 || objc_msgSend(v5, "isSymLink"))
    {
      if (v3)
      {
        dispatch_semaphore_t v32 = 0;
      }
      else
      {
        unint64_t v34 = [(BRCURLToItemLookup *)self url];
        id v50 = 0;
        BOOL v35 = [(BRCURLToItemLookup *)self trashItemIfNecessary:v5 atURL:v34 error:&v50];
        id v21 = v50;

        if (v35)
        {
          int v36 = brc_bread_crumbs();
          uint64_t v37 = brc_default_log();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
            -[BRCURLToItemLookup(BRCFSWriter) tryToDeleteItemInNamespace:]();
          }

          [(BRCURLToItemLookup *)self _clearNamespace:0];
          goto LABEL_36;
        }
        dispatch_semaphore_t v32 = v21;
      }
      int v42 = [(BRCAccountSession *)self->_session stageRegistry];
      uint64_t v43 = v56;
      v44 = [v5 itemID];
      id v49 = v32;
      char v45 = [v42 moveToGraveyardFromPath:v43 forItemID:v44 error:&v49];
      id v21 = v49;

      if (v45)
      {
LABEL_29:
        if (([v5 isReserved] & 1) == 0)
        {
          uint64_t v24 = v56;
          __int16 v25 = [v5 st];
          int v26 = [v25 logicalName];
          +[BRCFileCoordinator itemDidDisappearAtPath:v24 logicalFilename:v26];
        }
        if (v6) {
          [v5 updateStructuralCKInfoFromServerItem:v6];
        }
        [v5 markRemovedFromFilesystemForServerEdit:1];
        [(BRCURLToItemLookup *)self didApplyChangesAtPath:(void)v56 filename:0 li:v5 si:v6];
        __int16 v27 = brc_bread_crumbs();
        uint64_t v28 = brc_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[BRCURLToItemLookup(BRCFSWriter) tryToDeleteItemInNamespace:]();
        }

        [(BRCURLToItemLookup *)self _clearNamespace:v3];
LABEL_36:
        BOOL v7 = 1;
LABEL_68:
        __brc_leave_section(v53);

        goto LABEL_5;
      }
      uint64_t v46 = brc_bread_crumbs();
      int v47 = brc_default_log();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v59 = (uint64_t)v21;
        __int16 v60 = 2112;
        *(void *)int v61 = v5;
        *(_WORD *)&v61[8] = 2112;
        *(void *)&v61[10] = v46;
        _os_log_impl(&dword_1D353B000, v47, OS_LOG_TYPE_DEFAULT, "[WARNING] failed moving to graveyard with error %@: %@%@", buf, 0x20u);
      }

      goto LABEL_64;
    }
    if ([(id)v56 exists])
    {
      id v48 = 0;
      BOOL v38 = [(BRCURLToItemLookup *)self _removeDirectory:v5 atPath:(void)v56 error:&v48];
      id v21 = v48;
      if (v38) {
        goto LABEL_29;
      }
      uint64_t v39 = brc_bread_crumbs();
      uint64_t v40 = brc_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v41 = [(id)v56 absolutePath];
        *(_DWORD *)buf = 138412802;
        uint64_t v59 = (uint64_t)v41;
        __int16 v60 = 2112;
        *(void *)int v61 = v21;
        *(_WORD *)&v61[8] = 2112;
        *(void *)&v61[10] = v39;
        _os_log_impl(&dword_1D353B000, v40, OS_LOG_TYPE_DEFAULT, "[WARNING] failed removing dir at '%@': %@%@", buf, 0x20u);
      }
LABEL_64:
      if (!objc_msgSend(v21, "br_isPOSIXErrorCode:", 1))
      {
LABEL_67:
        BOOL v7 = 0;
        goto LABEL_68;
      }
      int v19 = [(BRCAccountSession *)self->_session applyScheduler];
      [v19 setState:18 forServerItem:v6 localItem:v5];
LABEL_66:

      goto LABEL_67;
    }
    int v19 = brc_bread_crumbs();
    __int16 v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v59 = (uint64_t)v5;
      __int16 v60 = 2112;
      *(void *)int v61 = v19;
      _os_log_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't remove an non-existant path for %@%@", buf, 0x16u);
    }
LABEL_22:

    id v21 = 0;
    goto LABEL_66;
  }
LABEL_4:
  BOOL v7 = 0;
LABEL_5:

  __destructor_8_s0_s8_s16_s24((uint64_t)&v55);
  return v7;
}

uint64_t __62__BRCURLToItemLookup_BRCFSWriter__tryToDeleteItemInNamespace___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = [*(id *)(a1 + 48) filename];
  int v4 = BRCUnlinkAt(a2, v3, 0);

  uint64_t result = 0;
  if (v4 < 0) {
    return *__error();
  }
  return result;
}

- (BOOL)_applyOrDownloadThumbnailIfNecessary:(id)a3 si:(id)a4 url:(id)a5 updatedAddition:(BOOL *)a6 applySchedulerState:(int *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  int v15 = [(BRCAccountSession *)self->_session fsDownloader];
  __int16 v16 = [v12 desiredVersion];
  if (![v16 wantsThumbnail]) {
    goto LABEL_7;
  }
  BOOL v35 = a6;
  uint64_t v17 = [v12 liveThumbnailSignature];
  char v18 = [v16 thumbnailSignature];
  id v19 = v17;
  id v20 = v18;
  if (v19 == v20)
  {

    goto LABEL_7;
  }
  id v21 = v20;
  uint64_t v33 = a7;
  if (v20)
  {
    char v22 = [v19 isEqual:v20];

    if ((v22 & 1) == 0) {
      goto LABEL_10;
    }
LABEL_7:
    char v23 = 1;
    goto LABEL_8;
  }

LABEL_10:
  __int16 v25 = objc_msgSend(v12, "orig", v33);
  int v26 = [v25 isReserved];

  if (v26)
  {
    if ([v12 isOnDisk] && objc_msgSend(v16, "wantsThumbnail")) {
      [v15 scheduleThumbnailDownloadForItem:v12 serverItem:v13 applySchedulerState:v34];
    }
LABEL_20:
    char v23 = 0;
    goto LABEL_8;
  }
  if (![v15 applyThumbnailToItem:v12 serverItem:v13 atURL:v14 applySchedulerState:v34])
  {
    if ([v16 wantsThumbnail])
    {
      dispatch_semaphore_t v32 = [(BRCAccountSession *)self->_session fsDownloader];
      [v32 scheduleThumbnailDownloadForItem:v12 serverItem:v13 applySchedulerState:v34];
    }
    goto LABEL_20;
  }
  char v23 = 1;
  BOOL *v35 = 1;
  __int16 v27 = [v12 liveThumbnailSignature];
  uint64_t v28 = [v16 thumbnailSignature];
  id v29 = v27;
  id v30 = v28;
  __int16 v31 = v30;
  if (v29 != v30)
  {
    if (v30) {
      char v23 = [v29 isEqual:v30];
    }
    else {
      char v23 = 0;
    }
  }

LABEL_8:
  return v23;
}

- (BOOL)_applyOrEvictLosersIfNecessary:(id)a3 si:(id)a4 url:(id)a5 addedLosers:(id)a6 removedLosers:(id)a7 updatedAddition:(BOOL *)a8 applySchedulerState:(int *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = [(BRCAccountSession *)self->_session fsDownloader];
  if ([v15 isFault]
    && ([v15 desiredVersion],
        id v21 = objc_claimAutoreleasedReturnValue(),
        char v22 = [v21 wantsContent],
        v21,
        (v22 & 1) == 0))
  {
    [v20 evictLosersOnItem:v15 atURL:v17 applySchedulerState:a9];
  }
  else if ([v20 applyLosersToItem:v15 serverItem:v16 atURL:v17 applySchedulerState:a9 addedLosers:v18 removedLosers:v19])
  {
    *a8 = 1;
  }
  BOOL v23 = *a9 == 0;

  return v23;
}

- (BOOL)_appliedOrDownloadContentIfNecessary:(id)a3 si:(id)a4 applySchedulerState:(int *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  char v10 = [v8 desiredVersion];
  uint64_t v11 = [v10 downloadError];
  if (v11)
  {
    id v12 = (void *)v11;
    id v13 = [v10 downloadError];
    if (objc_msgSend(v13, "brc_isOutOfSpaceError"))
    {
    }
    else
    {
      id v14 = [v9 latestVersion];
      int v15 = [v10 isEtagEqual:v14];

      if (v15)
      {
        id v16 = brc_bread_crumbs();
        id v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = 138412290;
          BOOL v35 = v16;
          _os_log_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] there is a download error, marking item applied and waiting for subsequent updates%@", (uint8_t *)&v34, 0xCu);
        }

        *a5 = 0;
        goto LABEL_18;
      }
    }
  }
  id v18 = [v8 currentVersion];
  id v19 = [v9 latestVersion];
  if ([v18 isEtagEqual:v19]) {
    char v20 = 1;
  }
  else {
    char v20 = [v8 isPausedFromSync];
  }

  if ([v8 isFault] && objc_msgSend(v10, "wantsContent"))
  {
    if ([v10 isFault])
    {
      id v21 = brc_bread_crumbs();
      char v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        -[BRCURLToItemLookup(BRCFSWriter) _appliedOrDownloadContentIfNecessary:si:applySchedulerState:]();
      }

      objc_msgSend(v10, "setOptions:", objc_msgSend(v10, "options") & 0xFFFFFFFELL);
    }
LABEL_19:
    if (!v10)
    {
      BOOL v23 = 0;
      int v30 = 1;
      goto LABEL_24;
    }
    uint64_t v24 = [v8 st];
    __int16 v25 = [v24 stagedFileID];

    if (v25)
    {
      int v26 = [(BRCAccountSession *)self->_session stageRegistry];
      __int16 v27 = [v8 st];
      uint64_t v28 = [v27 stagedFileID];
      int v29 = objc_msgSend(v26, "didFlushStagedFileID:", objc_msgSend(v28, "unsignedLongLongValue"));

      if (v29)
      {
        BOOL v23 = 0;
        int v30 = 20;
LABEL_24:
        *a5 = v30;
        goto LABEL_33;
      }
      *a5 = 1;
      __int16 v31 = brc_bread_crumbs();
      dispatch_semaphore_t v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        -[BRCURLToItemLookup(BRCFSWriter) _appliedOrDownloadContentIfNecessary:si:applySchedulerState:]();
      }
    }
    else
    {
      if ([v10 wantsContent])
      {
        *a5 = 23;
        __int16 v31 = [(BRCAccountSession *)self->_session fsDownloader];
        [v31 scheduleContentDownloadForItem:v8 serverItem:v9 options:0 etagIfLoser:0 stageFileName:0 error:0];
LABEL_32:

        BOOL v23 = 0;
        goto LABEL_33;
      }
      __int16 v31 = brc_bread_crumbs();
      dispatch_semaphore_t v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        -[BRCURLToItemLookup(BRCFSWriter) _appliedOrDownloadContentIfNecessary:si:applySchedulerState:]();
      }
    }

    goto LABEL_32;
  }
  if ((v20 & 1) == 0) {
    goto LABEL_19;
  }
LABEL_18:
  BOOL v23 = 1;
LABEL_33:

  return v23;
}

- (void)didApplyChangesAtPath:(id)a3 filename:(id)a4 li:(id)a5 si:(id)a6
{
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  id v124 = a3;
  id v125 = a4;
  id v13 = a5;
  id v14 = a6;
  v128 = self;
  char v121 = [(BRCAccountSession *)self->_session fsDownloader];
  if (v14) {
    int v15 = [v14 isDead];
  }
  else {
    int v15 = 1;
  }
  char v139 = 0;
  v126 = objc_opt_new();
  uint64_t v127 = objc_opt_new();
  memset(v138, 0, sizeof(v138));
  __brc_create_section(0, (uint64_t)"-[BRCURLToItemLookup(BRCFSWriter) didApplyChangesAtPath:filename:li:si:]", 1737, v138);
  id v16 = brc_bread_crumbs();
  id v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v141 = v138[0];
    __int16 v142 = 2112;
    id v143 = v13;
    __int16 v144 = 2112;
    uint64_t v145 = (uint64_t)v16;
    _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx did apply changes for %@%@", buf, 0x20u);
  }

  if (v15)
  {
    int v18 = [v13 isDead];
LABEL_44:
    id v123 = 0;
    uint64_t v42 = v18 ^ 1u;
    goto LABEL_88;
  }
  if (([v13 isDocument] & 1) == 0)
  {
    int v24 = [v13 isSharedToMeTopLevelItem];
    if (v24)
    {
      id v122 = [v13 st];
      v119 = [v122 ckInfo];
      id v6 = [v119 etag];
      if (v6)
      {
        int v25 = 0;
      }
      else
      {
        v117 = [v14 st];
        id v8 = [v117 ckInfo];
        BOOL v7 = [v8 etag];
        if (!v7)
        {

          id v6 = 0;
          int v18 = 1;
LABEL_43:

          goto LABEL_44;
        }
        id v6 = 0;
        int v25 = 1;
      }
    }
    else
    {
      int v25 = 0;
    }
    int v26 = [v13 st];
    __int16 v27 = [v14 st];
    int v18 = [v26 isEtagEqual:v27];

    if (v25)
    {

      if ((v24 & 1) == 0) {
        goto LABEL_44;
      }
    }
    else if (!v24)
    {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  id v19 = [v13 asDocument];
  char v20 = [v19 desiredVersion];
  uint64_t v137 = 0;
  unsigned int v136 = 0;
  if (!v125
    || ([v124 filename],
        id v21 = objc_claimAutoreleasedReturnValue(),
        char v22 = [v125 isEqualToString:v21],
        v21,
        (v22 & 1) != 0))
  {
    id v123 = [v124 physicalURL];
    BOOL v23 = [(BRCURLToItemLookup *)v128 _applyOrDownloadThumbnailIfNecessary:v19 si:v14 url:v123 updatedAddition:&v139 applySchedulerState:(char *)&v137 + 4];
    goto LABEL_23;
  }
  uint64_t v28 = [v124 absolutePath];
  int v29 = [v28 stringByDeletingLastPathComponent];

  int v30 = [v29 stringByAppendingPathComponent:v125];
  if (!v30)
  {
    uint64_t v37 = [v124 absolutePath];
    BOOL v38 = v37 == 0;

    if (v38)
    {
      uint64_t v39 = brc_bread_crumbs();
      uint64_t v40 = brc_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v141 = (uint64_t)v124;
        __int16 v142 = 2112;
        id v143 = v125;
        __int16 v144 = 2112;
        uint64_t v145 = (uint64_t)v39;
        uint64_t v41 = "[CRIT] UNREACHABLE: Can't compose absolute path for %@ and filename %@ because path.absolutePath is nil%@";
        goto LABEL_155;
      }
    }
    else
    {
      uint64_t v39 = brc_bread_crumbs();
      uint64_t v40 = brc_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v141 = (uint64_t)v124;
        __int16 v142 = 2112;
        id v143 = v125;
        __int16 v144 = 2112;
        uint64_t v145 = (uint64_t)v39;
        uint64_t v41 = "[CRIT] UNREACHABLE: Can't compose absolute path for %@ and filename %@%@";
LABEL_155:
        _os_log_fault_impl(&dword_1D353B000, v40, OS_LOG_TYPE_FAULT, v41, buf, 0x20u);
      }
    }

    goto LABEL_120;
  }
  id v123 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v30 isDirectory:0];

  BOOL v23 = [(BRCURLToItemLookup *)v128 _applyOrDownloadThumbnailIfNecessary:v19 si:v14 url:v123 updatedAddition:&v139 applySchedulerState:(char *)&v137 + 4];
LABEL_23:
  BOOL v120 = v23;
  BOOL v118 = [(BRCURLToItemLookup *)v128 _appliedOrDownloadContentIfNecessary:v19 si:v14 applySchedulerState:&v136];
  BOOL v116 = [(BRCURLToItemLookup *)v128 _applyOrEvictLosersIfNecessary:v19 si:v14 url:v123 addedLosers:v126 removedLosers:v127 updatedAddition:&v139 applySchedulerState:&v137];
  if ([v20 wantsContent])
  {
    int v115 = [v19 isOnDisk];
  }
  else
  {
    int v31 = [v20 isFault];
    int v115 = v31 ^ [v19 isFault] ^ 1;
  }
  int v32 = [v19 isSharedToMeTopLevelItem];
  if (v32)
  {
    v114 = [v19 st];
    v113 = [v114 ckInfo];
    id v17 = [v113 etag];
    if (v17)
    {
      int v33 = 0;
    }
    else
    {
      v111 = [v14 st];
      uint64_t v112 = [v111 ckInfo];
      v110 = [v112 etag];
      if (!v110)
      {

        id v17 = 0;
        int v36 = 1;
        goto LABEL_46;
      }
      id v17 = 0;
      int v33 = 1;
    }
  }
  else
  {
    int v33 = 0;
  }
  int v34 = [v19 st];
  BOOL v35 = [v14 st];
  int v36 = [v34 isEtagEqual:v35];

  if (v33)
  {

    if ((v32 & 1) == 0) {
      goto LABEL_47;
    }
LABEL_46:

    goto LABEL_47;
  }
  if (v32) {
    goto LABEL_46;
  }
LABEL_47:
  uint64_t v43 = brc_bread_crumbs();
  v44 = brc_default_log();
  int v45 = v120 & v115 & v118;
  int v18 = v45 & v36 & v116;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
  {
    BOOL v96 = "no";
    *(_DWORD *)buf = 136317442;
    if (v18) {
      v97 = "yes";
    }
    else {
      v97 = "no";
    }
    uint64_t v141 = (uint64_t)v97;
    __int16 v142 = 2080;
    if (v120) {
      uint64_t v98 = "yes";
    }
    else {
      uint64_t v98 = "no";
    }
    id v143 = (id)v98;
    __int16 v144 = 2080;
    if (v115) {
      id v99 = "yes";
    }
    else {
      id v99 = "no";
    }
    uint64_t v145 = (uint64_t)v99;
    if (v118) {
      v100 = "yes";
    }
    else {
      v100 = "no";
    }
    __int16 v146 = 2080;
    if (v36) {
      v101 = "yes";
    }
    else {
      v101 = "no";
    }
    v147 = v100;
    if (v116) {
      BOOL v96 = "yes";
    }
    __int16 v148 = 2080;
    uint64_t v149 = v101;
    __int16 v150 = 2080;
    v151 = v96;
    __int16 v152 = 2112;
    uint64_t v153 = v20;
    __int16 v154 = 2112;
    id v155 = v19;
    __int16 v156 = 2112;
    id v157 = v14;
    __int16 v158 = 2112;
    v159 = v43;
    _os_log_debug_impl(&dword_1D353B000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] item application status\n applied: %s\n   thumbnail: %s\n       fault: %s\n     content: %s\n   structure: %s\n      losers: %s\n\n  desired: %@\n  current: %@\n   server: %@\n%@", buf, 0x66u);
  }

  if (v45)
  {
    [v19 clearDesiredVersion];
    uint64_t v46 = v20;
    char v20 = 0;
  }
  else
  {
    brc_bread_crumbs();
    int v47 = (char *)objc_claimAutoreleasedReturnValue();
    id v48 = brc_default_log();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      v102 = @"yes";
      if (v120) {
        BOOL v103 = @"no";
      }
      else {
        BOOL v103 = @"yes";
      }
      *(_DWORD *)buf = 138413058;
      uint64_t v141 = (uint64_t)v103;
      if (v115) {
        v104 = @"no";
      }
      else {
        v104 = @"yes";
      }
      __int16 v142 = 2112;
      id v143 = v104;
      __int16 v144 = 2112;
      if (v118) {
        v102 = @"no";
      }
      uint64_t v145 = (uint64_t)v102;
      __int16 v146 = 2112;
      v147 = v47;
      _os_log_debug_impl(&dword_1D353B000, v48, OS_LOG_TYPE_DEBUG, "[DEBUG] Not fully applied: wantsThumb:%@ wantsFault:%@ wantsContent:%@%@", buf, 0x2Au);
    }

    if (!v20 || ([v20 wantsContent] & 1) != 0 || (objc_msgSend(v20, "wantsThumbnail") & 1) != 0) {
      goto LABEL_55;
    }
    uint64_t v46 = brc_bread_crumbs();
    id v109 = brc_default_log();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_FAULT)) {
      -[BRCURLToItemLookup(BRCFSWriter) didApplyChangesAtPath:filename:li:si:].cold.9();
    }
  }
LABEL_55:
  if (HIDWORD(v137))
  {
    id v49 = brc_bread_crumbs();
    id v50 = brc_default_log();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
      -[BRCURLToItemLookup(BRCFSWriter) didApplyChangesAtPath:filename:li:si:].cold.8();
    }

    uint64_t v42 = HIDWORD(v137);
    if (v120)
    {
      id v51 = brc_bread_crumbs();
      uint64_t v52 = brc_default_log();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
        -[BRCURLToItemLookup(BRCFSWriter) didApplyChangesAtPath:filename:li:si:].cold.7();
      }
    }
  }
  else
  {
    uint64_t v42 = 0;
  }
  if (v137)
  {
    uint64_t v53 = brc_bread_crumbs();
    unsigned int v54 = brc_default_log();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
      -[BRCURLToItemLookup(BRCFSWriter) didApplyChangesAtPath:filename:li:si:].cold.6();
    }

    unsigned int v55 = v137;
    if (v137 != 1 && v42 != 0) {
      unsigned int v55 = v42;
    }
    if (v42 == 1) {
      uint64_t v42 = 1;
    }
    else {
      uint64_t v42 = v55;
    }
    if (v116)
    {
      v105 = brc_bread_crumbs();
      v106 = brc_default_log();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT)) {
        -[BRCURLToItemLookup(BRCFSWriter) didApplyChangesAtPath:filename:li:si:].cold.5();
      }
    }
  }
  if (v136)
  {
    uint64_t v57 = brc_bread_crumbs();
    v58 = brc_default_log();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
      -[BRCURLToItemLookup(BRCFSWriter) didApplyChangesAtPath:filename:li:si:].cold.4();
    }

    unsigned int v59 = v136;
    if (v136 != 1 && v42 != 0) {
      unsigned int v59 = v42;
    }
    if (v42 == 1) {
      uint64_t v42 = 1;
    }
    else {
      uint64_t v42 = v59;
    }
    if (v118)
    {
      v107 = brc_bread_crumbs();
      unsigned __int16 v108 = brc_default_log();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_FAULT)) {
        -[BRCURLToItemLookup(BRCFSWriter) didApplyChangesAtPath:filename:li:si:]();
      }
    }
  }

LABEL_88:
  if (v139)
  {
    int v61 = brc_bread_crumbs();
    __int16 v62 = brc_default_log();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
      -[BRCURLToItemLookup(BRCFSWriter) didApplyChangesAtPath:filename:li:si:]();
    }

    [v13 markForceNotify];
  }
  brc_bread_crumbs();
  unsigned int v63 = (char *)objc_claimAutoreleasedReturnValue();
  __int16 v64 = brc_default_log();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    if ([v13 isRejected]) {
      uint64_t v91 = -[v13 dbRowID];
    }
    else {
      uint64_t v91 = [v14 rank];
    }
    v93 = [v13 itemID];
    id v94 = [v93 debugItemIDString];
    uint64_t v95 = BRCPrettyPrintEnum();
    *(_DWORD *)buf = 134218754;
    uint64_t v141 = v91;
    __int16 v142 = 2112;
    id v143 = v94;
    __int16 v144 = 2080;
    uint64_t v145 = v95;
    __int16 v146 = 2112;
    v147 = v63;
    _os_log_debug_impl(&dword_1D353B000, v64, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes[%lld]: %@ state becomes %s%@", buf, 0x2Au);
  }
  v65 = [v13 st];
  uint64_t v66 = [v65 fileID];

  v67 = [(BRCAccountSession *)v128->_session applyScheduler];
  char v68 = v67;
  if (v66) {
    uint64_t v69 = 2;
  }
  else {
    uint64_t v69 = 1;
  }
  [v67 setState:v42 andApplyKind:v69 forServerItem:v14 localItem:v13];

  if (!v18)
  {
    brc_bread_crumbs();
    int v73 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v74 = brc_default_log();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    {
      [v13 diffAgainstServerItem:v14];
      BRCItemFieldsPrettyPrint();
      id v92 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      uint64_t v141 = (uint64_t)v13;
      __int16 v142 = 2112;
      id v143 = v14;
      __int16 v144 = 2112;
      uint64_t v145 = (uint64_t)v92;
      __int16 v146 = 2112;
      v147 = v73;
      _os_log_debug_impl(&dword_1D353B000, v74, OS_LOG_TYPE_DEBUG, "[DEBUG] we still have unapplied changes:\n  client item: %@\n  server item: %@\n  diffs: %@%@", buf, 0x2Au);
    }
    goto LABEL_107;
  }
  if ([v13 isDead])
  {
    v70 = [v13 clientZone];
    objc_msgSend(v70, "didApplyTombstoneForRank:", objc_msgSend(v14, "rank"));

    if ([v13 isSharedToMeTopLevelItem])
    {
      v71 = brc_bread_crumbs();
      id v72 = brc_default_log();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG)) {
        -[BRCURLToItemLookup(BRCFSWriter) didApplyChangesAtPath:filename:li:si:]();
      }

      int v73 = [v13 asSharedToMeTopLevelItem];
      [v73 insertTombstoneAliasRecordInZone:0];
      goto LABEL_107;
    }
  }
  else if ([v13 isDocument])
  {
    int v73 = [v13 asDocument];
    [v121 cancelAndCleanupItemDownloads:v73];
LABEL_107:
  }
  char v20 = [(BRCAccountSession *)v128->_session clientDB];
  v133[0] = MEMORY[0x1E4F143A8];
  v133[1] = 3221225472;
  v133[2] = __72__BRCURLToItemLookup_BRCFSWriter__didApplyChangesAtPath_filename_li_si___block_invoke;
  v133[3] = &unk_1E6993C00;
  id v75 = v13;
  id v134 = v75;
  char v135 = v139;
  v129[0] = MEMORY[0x1E4F143A8];
  v129[1] = 3221225472;
  v129[2] = __72__BRCURLToItemLookup_BRCFSWriter__didApplyChangesAtPath_filename_li_si___block_invoke_2;
  v129[3] = &unk_1E6993FC0;
  id v130 = v126;
  id v19 = v123;
  id v131 = v19;
  id v132 = v127;
  [v20 performWithFlags:0 action:v133 whenFlushed:v129];
  if ([v75 isOnDisk])
  {
    uint64_t v76 = [v75 clientZone];
    uint64_t v77 = [v75 itemID];
    uint64_t v78 = [v76 popOnDiskBlockForItemID:v77];

    if (v78) {
      v78[2](v78, [v75 isOnDisk]);
    }
  }
  if ([v75 isDocument])
  {
    int v79 = [v75 asDocument];
    int v80 = [v79 hasLocalContent];

    if (v80)
    {
      BOOL v81 = [v75 clientZone];
      int v82 = [v75 itemID];
      v83 = [v81 popDownloadedBlockForItemID:v82];

      if (v83) {
        ((void (**)(void, id))v83)[2](v83, v75);
      }
    }
  }
  if ([v75 isShared])
  {
    v84 = objc_msgSend(MEMORY[0x1E4F1A2F8], "brc_fetchShareIDWithSharedItem:", v75);
    int v85 = [BRCItemGlobalID alloc];
    v86 = [v75 clientZone];
    v87 = [v86 dbRowID];
    v88 = objc_msgSend(v84, "brc_shareItemID");
    int v89 = [(BRCItemGlobalID *)v85 initWithZoneRowID:v87 itemID:v88];

    v90 = [(BRCAccountSession *)v128->_session analyticsReporter];
    [v90 didApplyItemInsideSharedItemID:v89];
  }
LABEL_120:

  __brc_leave_section(v138);
}

uint64_t __72__BRCURLToItemLookup_BRCFSWriter__didApplyChangesAtPath_filename_li_si___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) clientZone];
  id v5 = [v4 parentsOfCZMFaults];
  id v6 = [*(id *)(a1 + 32) itemID];
  BOOL v7 = [v5 objectForKeyedSubscript:v6];

  if (v7) {
    [*(id *)(a1 + 32) markLostWhenReplacedByItem:0];
  }
  [*(id *)(a1 + 32) saveToDBForServerEdit:1 keepAliases:0];
  if (*(unsigned char *)(a1 + 40)) {
    [v3 flushToMakeEditsVisibleToIPCReaders];
  }

  return 1;
}

void __72__BRCURLToItemLookup_BRCFSWriter__didApplyChangesAtPath_filename_li_si___block_invoke_2(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v33;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v33 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = *(void **)(*((void *)&v32 + 1) + 8 * v6);
        id v8 = brc_bread_crumbs();
        id v9 = brc_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          id v14 = [v7 name];
          *(_DWORD *)buf = 138412546;
          BOOL v38 = v14;
          __int16 v39 = 2112;
          uint64_t v40 = v8;
          _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Found loser (sending didGainVersion %@)%@", buf, 0x16u);
        }
        char v10 = (void *)MEMORY[0x1E4F28CA0];
        uint64_t v11 = *(void *)(a1 + 40);
        id v12 = [v7 nameSpace];
        id v13 = [v7 name];
        objc_msgSend(v10, "__itemAtURL:didGainVersionWithClientID:name:purposeID:", v11, v12, v13, 0);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v4);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v15 = *(id *)(a1 + 48);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        char v20 = *(void **)(*((void *)&v28 + 1) + 8 * v19);
        id v21 = brc_bread_crumbs();
        char v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          __int16 v27 = [v20 name];
          *(_DWORD *)buf = 138412546;
          BOOL v38 = v27;
          __int16 v39 = 2112;
          uint64_t v40 = v21;
          _os_log_debug_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Removed loser (sending didLoseVersion %@)%@", buf, 0x16u);
        }
        BOOL v23 = (void *)MEMORY[0x1E4F28CA0];
        uint64_t v24 = *(void *)(a1 + 40);
        int v25 = [v20 nameSpace];
        int v26 = [v20 name];
        objc_msgSend(v23, "__itemAtURL:didLoseVersionWithClientID:name:purposeID:", v24, v25, v26, 0);

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v17);
  }
}

- (void)initWithURL:(void *)a1 allowAppLibraryRoot:session:db:.cold.1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v1, v2, "[ERROR] can't extract logical name from fault name; %@%@",
    (void)v3,
    DWORD2(v3));
}

- (void)initWithURL:(uint64_t)a1 allowAppLibraryRoot:session:db:.cold.2(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_3_1();
  _os_log_debug_impl(&dword_1D353B000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] can't extract filename from %@%@", (uint8_t *)&v2, 0x16u);
}

- (void)initWithURL:(uint64_t)a1 allowAppLibraryRoot:session:db:.cold.3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v1, v2, "[ERROR] can't extract filename from %@%@", (void)v3, DWORD2(v3));
}

- (void)initWithURL:allowAppLibraryRoot:session:db:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: session%@", v2, v3, v4, v5, v6);
}

- (void)initWithURL:allowAppLibraryRoot:session:db:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: url%@", v2, v3, v4, v5, v6);
}

- (void)resolveParentAndKeepOpenMustExist:errcode:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !_parentRelpath.exists || _parentRelpath.isUnixDir%@", v2, v3, v4, v5, v6);
}

- (void)parentItem
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _hasFetched.parentPath%@", v2, v3, v4, v5, v6);
}

void __65__BRCURLToItemLookup_BRCFSWriter___removeDirectory_atPath_error___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] removing empty directory  %@%@", (void)v3, DWORD2(v3));
}

@end