@interface BRFileObjectID
+ (BOOL)supportsSecureCoding;
+ (BRFileObjectID)fileObjectIDWithString:(id)a3;
+ (id)fileObjectIDForURL:(id)a3 allocateDocID:(BOOL)a4 error:(id *)a5;
+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4;
+ (id)newFromSqliteValue:(sqlite3_value *)a3;
- (BOOL)isAppLibraryDocumentsFolder;
- (BOOL)isAppLibraryRoot;
- (BOOL)isCloudDocsRoot;
- (BOOL)isDocumentID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFileObjectID:(id)a3;
- (BOOL)isFolderOrAliasID;
- (BOOL)isFpfsItem;
- (BOOL)isRootContainerItem;
- (BRFileObjectID)initWithCoder:(id)a3;
- (NSNumber)documentID;
- (NSNumber)folderID;
- (NSNumber)itemDBRowID;
- (NSString)asString;
- (unint64_t)hash;
- (unint64_t)rawID;
- (unsigned)type;
- (void)asString;
- (void)documentID;
- (void)encodeWithCoder:(id)a3;
- (void)folderID;
- (void)isAppLibraryDocumentsFolder;
- (void)isAppLibraryRoot;
- (void)itemDBRowID;
- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4;
@end

@implementation BRFileObjectID

+ (BRFileObjectID)fileObjectIDWithString:(id)a3
{
  id v3 = a3;
  int v5 = BRIsFPFSEnabled(v3, v4);
  if ([v3 isEqualToString:*MEMORY[0x1E4F25C68]])
  {
    v6 = [BRDbRowObjectID alloc];
    if (v5)
    {
LABEL_3:
      uint64_t v7 = 0;
      uint64_t v8 = 0;
LABEL_31:
      v19 = [(BRDbRowObjectID *)v6 initWithRowID:v7 type:v8];
LABEL_32:
      v20 = v19;
      goto LABEL_33;
    }
LABEL_7:
    uint64_t v7 = 1;
    uint64_t v8 = 1;
    goto LABEL_31;
  }
  if (v5 && [v3 isEqualToString:*MEMORY[0x1E4F25BF0]])
  {
    v6 = [BRDbRowObjectID alloc];
    goto LABEL_7;
  }
  if (![v3 length])
  {
    if (v3) {
      char v12 = 0;
    }
    else {
      char v12 = v5;
    }
    if ((v12 & 1) == 0)
    {
      v13 = brc_bread_crumbs((uint64_t)"+[BRFileObjectID fileObjectIDWithString:]", 344);
      v14 = brc_default_log(0);
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u)) {
        +[BRFileObjectID fileObjectIDWithString:]();
      }
    }
    goto LABEL_41;
  }
  v9 = (char *)[v3 UTF8String];
  v10 = v9;
  int v11 = *v9;
  if (v11 > 104)
  {
    if (v11 > 109)
    {
      if (v11 != 110)
      {
        if (v11 == 116)
        {
          v15 = brc_bread_crumbs((uint64_t)"+[BRFileObjectID fileObjectIDWithString:]", 330);
          v16 = brc_default_log(0);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
            +[BRFileObjectID fileObjectIDWithString:]();
          }

          v6 = [BRDbRowObjectID alloc];
          goto LABEL_3;
        }
        goto LABEL_38;
      }
    }
    else
    {
      if (v11 == 105)
      {
        v19 = [[BRInodeObjectID alloc] initWithFileID:strtoull(v9 + 1, 0, 16)];
        goto LABEL_32;
      }
      if (v11 != 108) {
        goto LABEL_38;
      }
    }
LABEL_30:
    uint64_t v17 = +[BRFileObjectTypeConverter toBRFileObjectIDType:(char)v11];
    unint64_t v18 = strtoul(v10 + 1, 0, 16);
    v6 = [BRDbRowObjectID alloc];
    uint64_t v7 = v18;
    uint64_t v8 = v17;
    goto LABEL_31;
  }
  switch(v11)
  {
    case 'a':
      goto LABEL_30;
    case 'd':
      v19 = [[BRDocObjectID alloc] initWithDocID:strtoul(v9 + 1, 0, 16)];
      goto LABEL_32;
    case 'f':
      goto LABEL_30;
  }
LABEL_38:
  v22 = brc_bread_crumbs((uint64_t)"+[BRFileObjectID fileObjectIDWithString:]", 333);
  v23 = brc_default_log(0);
  if (os_log_type_enabled(v23, (os_log_type_t)0x90u)) {
    +[BRFileObjectID fileObjectIDWithString:]();
  }

LABEL_41:
  v20 = 0;
LABEL_33:

  return (BRFileObjectID *)v20;
}

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [(BRFileObjectID *)self asString];
  [v6 sqliteBind:a3 index:v4];
}

+ (id)newFromSqliteValue:(sqlite3_value *)a3
{
  id v3 = (void *)[NSString newFromSqliteValue:a3];
  uint64_t v4 = [(id)objc_opt_class() fileObjectIDWithString:v3];

  return v4;
}

+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4
{
  uint64_t v4 = (void *)[NSString newFromSqliteStatement:a3 atIndex:*(void *)&a4];
  int v5 = [(id)objc_opt_class() fileObjectIDWithString:v4];

  return v5;
}

+ (id)fileObjectIDForURL:(id)a3 allocateDocID:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v35 = 0;
  uint64_t v8 = *MEMORY[0x1E4F1C658];
  id v34 = 0;
  char v9 = [v7 getResourceValue:&v35 forKey:v8 error:&v34];
  id v10 = v35;
  id v11 = v34;
  char v12 = v11;
  if ((v9 & 1) == 0)
  {
    if (objc_msgSend(v11, "br_isCocoaErrorCode:", 260))
    {
      if (a5)
      {
        id v13 = v12;
LABEL_33:
        v27 = 0;
        *a5 = v13;
        goto LABEL_39;
      }
      goto LABEL_34;
    }
    v14 = brc_bread_crumbs((uint64_t)"+[BRFileObjectID fileObjectIDForURL:allocateDocID:error:]", 379);
    v15 = brc_default_log(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [v7 path];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v14;
      _os_log_impl(&dword_19ED3F000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] can't get whether %@ is a package: %@%@", buf, 0x20u);
    }
  }
  id v17 = v7;
  int v18 = open((const char *)[v17 fileSystemRepresentation], 2129924);
  if (v18 < 0)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
LABEL_34:
    v27 = 0;
    goto LABEL_39;
  }
  int v19 = v18;
  uint64_t v33 = 0;
  long long v32 = xmmword_19EDD6890;
  uint64_t v44 = 0;
  long long v43 = 0u;
  memset(buf, 0, sizeof(buf));
  if (fgetattrlist(v18, &v32, buf, 0x38uLL, 0x20u) < 0)
  {
LABEL_28:
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_30:
    close(v19);
    goto LABEL_34;
  }
  while (1)
  {
    __int16 v20 = WORD2(v43);
    int v21 = WORD2(v43) & 0xF000;
    if (v21 != 0x4000) {
      break;
    }
    if (([v10 BOOLValue] & 1) == 0)
    {
      __int16 v20 = WORD2(v43);
      goto LABEL_16;
    }
LABEL_24:
    if (HIDWORD(v43) || !v6 || fchflags(v19, WORD4(v43) | 0x40))
    {
      close(v19);
      v28 = [BRDocObjectID alloc];
      uint64_t v29 = [(BRDocObjectID *)v28 initWithDocID:HIDWORD(v43)];
      goto LABEL_38;
    }
    long long v32 = xmmword_19EDD6890;
    uint64_t v33 = 0;
    uint64_t v44 = 0;
    long long v43 = 0u;
    memset(buf, 0, sizeof(buf));
    if (fgetattrlist(v19, &v32, buf, 0x38uLL, 0x20u) < 0) {
      goto LABEL_28;
    }
  }
  if (v21 == 0x8000)
  {
    if ((char)buf[12] < 0)
    {
      if (fgetxattr(v19, "com.apple.clouddocs.security", 0, 0, 0, 0) != -1) {
        goto LABEL_37;
      }
      if (*__error() != 93)
      {
        v23 = brc_bread_crumbs((uint64_t)"+[BRFileObjectID fileObjectIDForURL:allocateDocID:error:]", 419);
        v24 = brc_default_log(1);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = [v17 fileSystemRepresentation];
          int v26 = *__error();
          *(_DWORD *)v36 = 136315650;
          uint64_t v37 = v25;
          __int16 v38 = 1024;
          int v39 = v26;
          __int16 v40 = 2112;
          v41 = v23;
          _os_log_impl(&dword_19ED3F000, v24, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't read xattr at '%s' %{errno}d%@", v36, 0x1Cu);
        }
      }
    }
    goto LABEL_24;
  }
  if (v21 == 40960) {
    goto LABEL_37;
  }
LABEL_16:
  int v22 = v20 & 0xF000;
  if (v22 == 0x8000) {
    goto LABEL_24;
  }
  if (v22 != 0x4000) {
    goto LABEL_30;
  }
LABEL_37:
  close(v19);
  v30 = [BRInodeObjectID alloc];
  uint64_t v29 = [(BRInodeObjectID *)v30 initWithFileID:v44];
LABEL_38:
  v27 = (void *)v29;
LABEL_39:

  return v27;
}

- (BOOL)isFolderOrAliasID
{
  return 0;
}

- (BOOL)isDocumentID
{
  return 0;
}

- (NSNumber)folderID
{
  v2 = brc_bread_crumbs((uint64_t)"-[BRFileObjectID folderID]", 480);
  id v3 = brc_default_log(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRFileObjectID folderID]();
  }

  return 0;
}

- (NSNumber)documentID
{
  v2 = brc_bread_crumbs((uint64_t)"-[BRFileObjectID documentID]", 486);
  id v3 = brc_default_log(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRFileObjectID documentID]();
  }

  return 0;
}

- (NSNumber)itemDBRowID
{
  v2 = brc_bread_crumbs((uint64_t)"-[BRFileObjectID itemDBRowID]", 492);
  id v3 = brc_default_log(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRFileObjectID itemDBRowID]();
  }

  return 0;
}

- (NSString)asString
{
  v2 = brc_bread_crumbs((uint64_t)"-[BRFileObjectID asString]", 499);
  id v3 = brc_default_log(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRFileObjectID asString]();
  }

  return 0;
}

- (unint64_t)rawID
{
  v2 = brc_bread_crumbs((uint64_t)"-[BRFileObjectID rawID]", 505);
  id v3 = brc_default_log(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRFileObjectID asString]();
  }

  return 0;
}

- (unsigned)type
{
  return 5;
}

- (BOOL)isCloudDocsRoot
{
  return [(BRFileObjectID *)self type] == 1 && [(BRFileObjectID *)self rawID] == 1;
}

- (BOOL)isRootContainerItem
{
  return [(BRFileObjectID *)self type] == 0;
}

- (BOOL)isFpfsItem
{
  v2 = brc_bread_crumbs((uint64_t)"-[BRFileObjectID isFpfsItem]", 526);
  id v3 = brc_default_log(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRFileObjectID asString]();
  }

  return 0;
}

- (BOOL)isAppLibraryRoot
{
  if ((BRIsFPFSEnabled(self, a2) & 1) == 0)
  {
    id v3 = brc_bread_crumbs((uint64_t)"-[BRFileObjectID isAppLibraryRoot]", 533);
    uint64_t v4 = brc_default_log(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[BRFileObjectID isAppLibraryRoot]();
    }
  }
  return [(BRFileObjectID *)self type] == 1;
}

- (BOOL)isAppLibraryDocumentsFolder
{
  if ((BRIsFPFSEnabled(self, a2) & 1) == 0)
  {
    id v3 = brc_bread_crumbs((uint64_t)"-[BRFileObjectID isAppLibraryDocumentsFolder]", 542);
    uint64_t v4 = brc_default_log(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[BRFileObjectID isAppLibraryDocumentsFolder]();
    }
  }
  return [(BRFileObjectID *)self type] == 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = brc_bread_crumbs((uint64_t)"-[BRFileObjectID encodeWithCoder:]", 557);
  uint64_t v4 = brc_default_log(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    int v5 = 138412290;
    BOOL v6 = v3;
    _os_log_fault_impl(&dword_19ED3F000, v4, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: implemented in subclass%@", (uint8_t *)&v5, 0xCu);
  }
}

- (BRFileObjectID)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = brc_bread_crumbs((uint64_t)"-[BRFileObjectID initWithCoder:]", 562);
  int v5 = brc_default_log(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_fault_impl(&dword_19ED3F000, v5, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: implemented in subclass%@", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (BOOL)isEqualToFileObjectID:(id)a3
{
  id v4 = a3;
  if (v4 && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    uint64_t v7 = [v4 rawID];
    BOOL v6 = v7 == [(BRFileObjectID *)self rawID];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BRFileObjectID *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(BRFileObjectID *)self isEqualToFileObjectID:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_opt_class();
  BOOL v4 = v3 == objc_opt_class();
  unint64_t v5 = [(BRFileObjectID *)self rawID];
  return v4 ^ HIDWORD(v5) ^ v5;
}

+ (void)fileObjectIDWithString:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19ED3F000, v0, v1, "[ERROR] invalid string for fileObjectID: %@%@");
}

+ (void)fileObjectIDWithString:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: NSFileProviderRootContainerItemIdentifier should have special behavior while building fileObjectIDWithString%@", v2, v3, v4, v5, v6);
}

- (void)folderID
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: asked the folderID of a document%@", v2, v3, v4, v5, v6);
}

- (void)documentID
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: asked the documentID of a folder%@", v2, v3, v4, v5, v6);
}

- (void)itemDBRowID
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: asked the item db rowid of an item which isn't in the client_items%@", v2, v3, v4, v5, v6);
}

- (void)asString
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: you should subclass%@", v2, v3, v4, v5, v6);
}

- (void)isAppLibraryRoot
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: IsAppLibraryRoot called on non-fpfs code%@", v2, v3, v4, v5, v6);
}

- (void)isAppLibraryDocumentsFolder
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: isAppLibraryDocumentsFolder called on non-fpfs code%@", v2, v3, v4, v5, v6);
}

@end