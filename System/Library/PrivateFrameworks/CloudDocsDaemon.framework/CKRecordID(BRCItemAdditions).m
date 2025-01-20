@interface CKRecordID(BRCItemAdditions)
+ (uint64_t)newFromSqliteStatement:()BRCItemAdditions atIndex:;
+ (uint64_t)newFromSqliteValue:()BRCItemAdditions;
- (BOOL)brc_isZoneRootRecordID;
- (BRCItemID)_itemIDWithLibraryRowID:()BRCItemAdditions session:;
- (id)brc_appLibraryDocumentsZoneName;
- (id)brc_appLibraryRootZoneName;
- (id)brc_itemIDWithSession:()BRCItemAdditions;
- (uint64_t)brc_isAppLibraryDocumentsRecordID;
- (uint64_t)brc_isAppLibraryRootRecordID;
- (uint64_t)brc_itemType;
- (uint64_t)locateSideCarServerZone:()BRCItemAdditions withSession:;
- (void)brc_appLibraryDocumentsZoneName;
- (void)brc_appLibraryRootZoneName;
- (void)brc_itemIDWithSession:()BRCItemAdditions error:;
- (void)brc_itemType;
- (void)sqliteBind:()BRCItemAdditions index:;
@end

@implementation CKRecordID(BRCItemAdditions)

- (void)sqliteBind:()BRCItemAdditions index:
{
  id v6 = [a1 sqliteRepresentation];
  sqlite3_bind_text(a3, a4, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

+ (uint64_t)newFromSqliteValue:()BRCItemAdditions
{
  if (sqlite3_value_type(a3) == 3)
  {
    v4 = [NSString stringWithUTF8String:sqlite3_value_text(a3)];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1A2F8]) initWithSqliteRepresentation:v4];

    return v5;
  }
  else
  {
    if (sqlite3_value_type(a3) != 5)
    {
      v7 = brc_bread_crumbs();
      v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        +[CKRecordID(BRCItemAdditions) newFromSqliteValue:]();
      }
    }
    return 0;
  }
}

+ (uint64_t)newFromSqliteStatement:()BRCItemAdditions atIndex:
{
  if (sqlite3_column_type(a3, iCol) == 3)
  {
    id v6 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(a3, iCol));
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1A2F8]) initWithSqliteRepresentation:v6];

    return v7;
  }
  else
  {
    if (sqlite3_column_type(a3, iCol) != 5)
    {
      v9 = brc_bread_crumbs();
      v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        +[CKRecordID(BRCItemAdditions) newFromSqliteStatement:atIndex:]();
      }
    }
    return 0;
  }
}

- (uint64_t)brc_isAppLibraryRootRecordID
{
  v1 = [a1 recordName];
  uint64_t v2 = [v1 hasPrefix:@"directory/appData_"];

  return v2;
}

- (id)brc_appLibraryRootZoneName
{
  if ((objc_msgSend(a1, "brc_isAppLibraryRootRecordID") & 1) == 0)
  {
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[CKRecordID(BRCItemAdditions) brc_appLibraryRootZoneName]();
    }
  }
  uint64_t v2 = [a1 recordName];
  v3 = [v2 substringFromIndex:objc_msgSend(@"directory/appData_", "length")];

  return v3;
}

- (uint64_t)brc_isAppLibraryDocumentsRecordID
{
  v1 = [a1 recordName];
  uint64_t v2 = [v1 hasPrefix:@"directory/appDocuments_"];

  return v2;
}

- (id)brc_appLibraryDocumentsZoneName
{
  if ((objc_msgSend(a1, "brc_isAppLibraryDocumentsRecordID") & 1) == 0)
  {
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[CKRecordID(BRCItemAdditions) brc_appLibraryDocumentsZoneName]();
    }
  }
  uint64_t v2 = [a1 recordName];
  v3 = [v2 substringFromIndex:objc_msgSend(@"directory/appDocuments_", "length")];

  return v3;
}

- (BOOL)brc_isZoneRootRecordID
{
  v1 = [a1 recordName];
  BOOL v4 = 0;
  if ([v1 hasPrefix:@"directory/"])
  {
    uint64_t v2 = [v1 substringFromIndex:objc_msgSend(@"directory/", "length")];
    char v3 = [v2 isEqualToString:@"root"];

    if (v3) {
      BOOL v4 = 1;
    }
  }

  return v4;
}

- (BRCItemID)_itemIDWithLibraryRowID:()BRCItemAdditions session:
{
  uint64_t v6 = a3;
  id v7 = a4;
  v8 = [a1 recordName];
  if ([v8 hasPrefix:@"directory/appDocuments_"])
  {
    v9 = [v8 substringFromIndex:objc_msgSend(@"directory/appDocuments_", "length")];
    v10 = [v7 appLibraryByID:v9];
    uint64_t v11 = [v10 dbRowID];

    if (v11)
    {
      v12 = [[BRCItemID alloc] initAsDocumentsWithAppLibraryRowID:v11];
    }
    else
    {
      v32 = brc_bread_crumbs();
      v33 = brc_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        -[CKRecordID(BRCItemAdditions) _itemIDWithLibraryRowID:session:]();
      }

      v12 = 0;
    }

    uint64_t v6 = v11;
    goto LABEL_28;
  }
  if ([v8 hasPrefix:@"directory/appData_"])
  {
    v13 = [v8 substringFromIndex:objc_msgSend(@"directory/appData_", "length")];
    v14 = [v7 appLibraryByID:v13];
    if (!v14)
    {
      v34 = brc_bread_crumbs();
      v35 = brc_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
        -[BRCItemID(CKConversions) structureRecordIDForItemType:zone:aliasTargetZoneIsShared:]();
      }
    }
    v15 = [v14 rootItemID];
LABEL_8:
    v12 = v15;
LABEL_26:

    goto LABEL_27;
  }
  if ([v8 hasPrefix:@"directory/"])
  {
    v13 = [a1 zoneID];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithRecordZoneID:v13];
    if ([v14 isShared])
    {
      v16 = [v7 clientZoneByMangledID:v14];
      uint64_t v17 = [v16 dbRowID];
    }
    else
    {
      uint64_t v17 = 0;
    }
    v19 = [v8 substringFromIndex:objc_msgSend(@"directory/", "length")];
    v20 = v19;
    if (!(v6 | v17)
      && (([v19 isEqualToString:BRCItemIDZoneRoot] & 1) != 0
       || [v20 isEqualToString:BRCItemIDDocuments]))
    {
      v21 = brc_bread_crumbs();
      v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        -[CKRecordID(BRCItemAdditions) _itemIDWithLibraryRowID:session:]();
      }
    }
    v12 = [[BRCItemID alloc] initWithString:v20 libraryRowID:v6 sharedZoneRowID:v17];

    goto LABEL_26;
  }
  if ([v8 hasPrefix:@"documentStructure/"])
  {
    v18 = @"documentStructure/";
LABEL_22:
    v13 = objc_msgSend(v8, "substringFromIndex:", -[__CFString length](v18, "length"));
    v23 = [[BRCItemID alloc] initWithUUIDString:v13];
LABEL_23:
    v12 = v23;
LABEL_27:

    goto LABEL_28;
  }
  if ([v8 hasPrefix:@"documentContent/"])
  {
    v18 = @"documentContent/";
    goto LABEL_22;
  }
  if ([v8 hasPrefix:@"alias/"])
  {
    v13 = [v8 substringFromIndex:objc_msgSend(@"alias/", "length")];
    if (!v6)
    {
      v25 = brc_bread_crumbs();
      v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        -[CKRecordID(BRCItemAdditions) _itemIDWithLibraryRowID:session:]();
      }
    }
    goto LABEL_38;
  }
  if ([v8 hasPrefix:@"shareAlias/"])
  {
    v13 = [v8 substringFromIndex:objc_msgSend(@"shareAlias/", "length")];
LABEL_38:
    v23 = [[BRCItemID alloc] initWithAliasUUID:v13];
    goto LABEL_23;
  }
  if ([v8 hasPrefix:@"symlink/"])
  {
    v18 = @"symlink/";
    goto LABEL_22;
  }
  if ([v8 hasPrefix:@"finderBookmark/"])
  {
    v18 = @"finderBookmark/";
    goto LABEL_22;
  }
  if ([v8 hasPrefix:@"ppm_"])
  {
    v27 = [a1 recordName];
    v13 = [v27 componentsSeparatedByString:@"/"];

    if ([v13 count] != 2)
    {
      v30 = brc_bread_crumbs();
      v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
        -[CKRecordID(BRCItemAdditions) _itemIDWithLibraryRowID:session:].cold.5();
      }

      v12 = 0;
      goto LABEL_27;
    }
    v14 = [v13 lastObject];
    v15 = [[BRCItemID alloc] initWithUUIDString:v14];
    goto LABEL_8;
  }
  v28 = brc_bread_crumbs();
  v29 = brc_default_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
    -[CKRecordID(BRCItemAdditions) _itemIDWithLibraryRowID:session:].cold.6();
  }

  v12 = 0;
LABEL_28:

  return v12;
}

- (id)brc_itemIDWithSession:()BRCItemAdditions
{
  id v4 = a3;
  id v10 = 0;
  uint64_t v5 = objc_msgSend(a1, "brc_itemIDWithSession:error:", v4, &v10);
  if (!v5 && v10)
  {
    abc_report_panic_with_signature();
    [NSString stringWithFormat:@"brc_itemIDWithSession: are not supposed to trigger an error: %@", v10];
    objc_claimAutoreleasedReturnValue();
    id v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) _startWatcher]();
    }

    brc_append_system_info_to_message();
    v9 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
    __assert_rtn("-[CKRecordID(BRCItemAdditions) brc_itemIDWithSession:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/sync/records/CKRecord+BRCItemAdditions.m", 716, v9);
  }

  return v5;
}

- (void)brc_itemIDWithSession:()BRCItemAdditions error:
{
  id v6 = a3;
  id v7 = [a1 zoneID];
  v8 = [v7 zoneName];
  if ([v8 isEqualToString:*MEMORY[0x1E4F596D8]])
  {
    v9 = 0;
    goto LABEL_5;
  }
  id v10 = [v7 ownerName];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F19C08]];

  if (!v11)
  {
    v9 = 0;
    goto LABEL_7;
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithRecordZoneID:v7];
  v9 = [v6 appLibraryByMangledID:v8];
  v12 = [v9 dbRowID];

  if (v12)
  {
LABEL_5:

LABEL_7:
    v8 = [v9 dbRowID];
    a4 = [a1 _itemIDWithLibraryRowID:v8 session:v6];
    goto LABEL_8;
  }
  if (!v9)
  {
    if (!a4) {
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 1004, @"Can't find appLibrary corresponding to zoneID %@", v7, v16);
    goto LABEL_14;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 1004, @"Found appLibrary %@ with invalid dbRowID for zoneID %@", v9, v7);
    uint64_t v14 = LABEL_14:;
    v15 = *a4;
    *a4 = (void *)v14;

    a4 = 0;
  }
LABEL_8:

  return a4;
}

- (uint64_t)brc_itemType
{
  v1 = [a1 recordName];
  if ([v1 hasPrefix:@"directory/"])
  {
    char v2 = 0;
  }
  else if (([v1 hasPrefix:@"documentStructure/"] & 1) != 0 {
         || ([v1 hasPrefix:@"documentContent/"] & 1) != 0)
  }
  {
    char v2 = 1;
  }
  else if (([v1 hasPrefix:@"alias/"] & 1) != 0 {
         || ([v1 hasPrefix:@"shareAlias/"] & 1) != 0)
  }
  {
    char v2 = 3;
  }
  else if ([v1 hasPrefix:@"symlink/"])
  {
    char v2 = 5;
  }
  else if ([v1 hasPrefix:@"finderBookmark/"])
  {
    char v2 = 6;
  }
  else
  {
    id v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[CKRecordID(BRCItemAdditions) brc_itemType]();
    }

    char v2 = -1;
  }

  return v2;
}

- (uint64_t)locateSideCarServerZone:()BRCItemAdditions withSession:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a1 recordName];
  v8 = [v7 substringFromIndex:objc_msgSend(@"ppm_", "length") - 1];
  v9 = [v8 pathComponents];

  id v10 = [v9 objectAtIndexedSubscript:0];
  int v11 = [v9 objectAtIndexedSubscript:1];
  v12 = [v6 sharedServerZoneRowIDsByOwnerNamePrefix:v10];
  if ([v12 count])
  {
    v13 = [[BRCItemID alloc] initWithUUIDString:v11];
    uint64_t v14 = [v6 serverDB];
    v15 = (void *)[v14 fetch:@"SELECT zone_rowid FROM server_items WHERE item_id = %@", v13];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v29 = v15;
    uint64_t v16 = [v15 enumerateObjectsOfClass:objc_opt_class()];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      v27 = a3;
      v28 = v13;
      uint64_t v19 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          if ([v12 containsObject:v21])
          {
            v23 = [v6 serverZoneByRowID:v21];
            uint64_t v24 = [v23 asSharedZone];

            v25 = *v27;
            void *v27 = (void *)v24;

            uint64_t v22 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v18) {
          continue;
        }
        break;
      }
      uint64_t v22 = 0;
LABEL_12:
      v13 = v28;
    }
    else
    {
      uint64_t v22 = 0;
    }
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

+ (void)newFromSqliteValue:()BRCItemAdditions .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: sqlite3_value_type(value) == SQLITE_NULL%@", v2, v3, v4, v5, v6);
}

+ (void)newFromSqliteStatement:()BRCItemAdditions atIndex:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: sqlite3_column_type(stmt, index) == SQLITE_NULL%@", v2, v3, v4, v5, v6);
}

- (void)brc_appLibraryRootZoneName
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.brc_isAppLibraryRootRecordID%@", v2, v3, v4, v5, v6);
}

- (void)brc_appLibraryDocumentsZoneName
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.brc_isAppLibraryDocumentsRecordID%@", v2, v3, v4, v5, v6);
}

- (void)_itemIDWithLibraryRowID:()BRCItemAdditions session:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: libraryRowID%@", v2, v3, v4, v5, v6);
}

- (void)_itemIDWithLibraryRowID:()BRCItemAdditions session:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: libraryRowID || sharedZoneRowID || !([identifier isEqualToString:BRCItemIDZoneRoot] || [identifier isEqualToString:BRCItemIDDocuments])%@", v2, v3, v4, v5, v6);
}

- (void)_itemIDWithLibraryRowID:()BRCItemAdditions session:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Corrupt side car file%@", v2, v3, v4, v5, v6);
}

- (void)_itemIDWithLibraryRowID:()BRCItemAdditions session:.cold.6()
{
  OUTLINED_FUNCTION_8();
  [v0 UTF8String];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5(&dword_1D353B000, v1, v2, "[CRIT] UNREACHABLE: attempt to extract an itemID from '%s'%@", v3, v4, v5, v6, v7);
}

- (void)brc_itemType
{
  OUTLINED_FUNCTION_8();
  [v0 UTF8String];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5(&dword_1D353B000, v1, v2, "[CRIT] UNREACHABLE: attempt to extract an itemType from '%s'%@", v3, v4, v5, v6, v7);
}

@end