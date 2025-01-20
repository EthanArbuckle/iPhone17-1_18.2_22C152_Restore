@interface BCSLinkItemPersistentStore
+ (const)debugQueueName;
- (BCSLinkItemPersistentStore)init;
- (const)schema;
- (id)databasePath;
- (id)itemMatching:(id)a3;
- (int64_t)schemaVersion;
- (void)_executeDeleteSQLQuery:(void *)result;
- (void)deleteExpiredItemsOfType:(int64_t)a3;
- (void)deleteItemMatching:(id)a3;
- (void)deleteItemsOfType:(int64_t)a3;
- (void)deleteLinkItemsWithBundleID:(id)a3;
- (void)schemaVersionWillChangeForDatabase:(sqlite3 *)a3 fromSchemaVersion:(int64_t)a4 toSchemaVersion:(int64_t)a5;
- (void)updateItem:(id)a3 withItemIdentifier:(id)a4;
@end

@implementation BCSLinkItemPersistentStore

- (BCSLinkItemPersistentStore)init
{
  if (self)
  {
    v2.receiver = self;
    v2.super_class = (Class)BCSLinkItemPersistentStore;
    self = [(BCSPersistentStore *)&v2 init];
    if (self) {
      self->_schemaVersion = 3;
    }
  }
  return self;
}

+ (const)debugQueueName
{
  return "com.apple.businesschat.persistentStore.linkItems";
}

- (id)databasePath
{
  if (![(id)databasePath_databasePath length])
  {
    objc_super v2 = +[BCSPathProvider sharedInstance];
    v3 = [v2 documentsURL];
    v4 = [v3 path];

    uint64_t v5 = [v4 stringByAppendingPathComponent:@"link_items.db"];
    v6 = (void *)databasePath_databasePath;
    databasePath_databasePath = v5;
  }
  v7 = (void *)databasePath_databasePath;

  return v7;
}

- (int64_t)schemaVersion
{
  return self->_schemaVersion;
}

- (void)schemaVersionWillChangeForDatabase:(sqlite3 *)a3 fromSchemaVersion:(int64_t)a4 toSchemaVersion:(int64_t)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "-[BCSLinkItemPersistentStore schemaVersionWillChangeForDatabase:fromSchemaVersion:toSchemaVersion:]";
    __int16 v14 = 2048;
    int64_t v15 = a4;
    __int16 v16 = 2048;
    int64_t v17 = a5;
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s schema version will change from '%ld' to '%ld', dropping link_items table", buf, 0x20u);
  }

  ppStmt = 0;
  if (!sqlite3_prepare_v2(a3, "DROP TABLE IF EXISTS link_items", -1, &ppStmt, 0))
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      v9 = ABSLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = sqlite3_errmsg(a3);
        *(_DWORD *)buf = 136315138;
        v13 = v10;
        _os_log_error_impl(&dword_2154F4000, v9, OS_LOG_TYPE_ERROR, "error while dropping link_items table: %s", buf, 0xCu);
      }
    }
    sqlite3_finalize(ppStmt);
  }
}

- (const)schema
{
  return "create table if not exists link_items (full_hash_string text primary key, link_url_string text, bundle_id_strin"
         "g text, hero_image_url_string text, icon_image_url_string text, redirect_url_string text, action integer, expir"
         "ation_date double, content_item_models blob, is_powered_by int, map_icon_style_attributes blob, map_item_muid blob)";
}

- (id)itemMatching:(id)a3
{
  v60[1] = *MEMORY[0x263EF8340];
  v4 = (id *)a3;
  if ([v4 type] != 2 || self == 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = NSString;
    if (v4) {
      v8 = (void *)[v4[1] copy];
    }
    else {
      v8 = 0;
    }
    [v7 stringWithFormat:@"SELECT link_url_string, bundle_id_string, hero_image_url_string, icon_image_url_string, redirect_url_string, action, expiration_date, content_item_models, is_powered_by, map_icon_style_attributes, map_item_muid FROM link_items WHERE full_hash_string = \"%@\"", v8];
    id v9 = objc_claimAutoreleasedReturnValue();
    v10 = (const char *)[v9 UTF8String];

    [(BCSPersistentStore *)self beginBatch];
    ppStmt = 0;
    v6 = 0;
    if (!sqlite3_prepare_v2([(BCSPersistentStore *)self openedDatabase], v10, -1, &ppStmt, 0))
    {
      if (sqlite3_step(ppStmt) == 100)
      {
        v11 = ppStmt;
        v58[0] = MEMORY[0x263EF8330];
        v58[1] = 3221225472;
        v58[2] = __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke;
        v58[3] = &__block_descriptor_40_e18___NSString_12__0i8l;
        v58[4] = ppStmt;
        v12 = (void *)MEMORY[0x2166BDB40](v58);
        v56[0] = MEMORY[0x263EF8330];
        v56[1] = 3221225472;
        v56[2] = __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_2;
        v56[3] = &unk_264248BB0;
        id v13 = v12;
        id v57 = v13;
        uint64_t v14 = MEMORY[0x2166BDB40](v56);
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        v55[2] = __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_3;
        v55[3] = &__block_descriptor_40_e30___NSObject_20__0__NSArray_8i16l;
        v55[4] = v11;
        int64_t v15 = (void *)MEMORY[0x2166BDB40](v55);
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_32;
        v53[3] = &unk_264248BF8;
        id v16 = v15;
        id v54 = v16;
        uint64_t v17 = MEMORY[0x2166BDB40](v53);
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_35;
        v51[3] = &unk_264248C20;
        id v18 = v16;
        id v52 = v18;
        v45 = (void (**)(void, void, void))MEMORY[0x2166BDB40](v51);
        v49[0] = MEMORY[0x263EF8330];
        v49[1] = 3221225472;
        v49[2] = __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_38;
        v49[3] = &unk_264248C48;
        id v38 = v18;
        id v50 = v38;
        v36 = (void (**)(void, void))MEMORY[0x2166BDB40](v49);
        v48[0] = MEMORY[0x263EF8330];
        v48[1] = 3221225472;
        v48[2] = __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_41;
        v48[3] = &__block_descriptor_40_e16___NSDate_12__0i8l;
        v48[4] = v11;
        uint64_t v19 = MEMORY[0x2166BDB40](v48);
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_2_44;
        v47[3] = &__block_descriptor_40_e8_B12__0i8l;
        v47[4] = v11;
        v20 = (uint64_t (**)(void, void))MEMORY[0x2166BDB40](v47);
        v44 = (*(void (**)(uint64_t, void))(v14 + 16))(v14, 0);
        v43 = (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
        v42 = (*((void (**)(id, uint64_t))v13 + 2))(v13, 2);
        v34 = (*((void (**)(id, uint64_t))v13 + 2))(v13, 3);
        v40 = (void *)v14;
        v21 = (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, 4);
        uint64_t v33 = sqlite3_column_int(v11, 5);
        v37 = (void *)v19;
        v41 = (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v19, 6);
        v60[0] = objc_opt_class();
        v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:1];
        v39 = (void *)v17;
        uint64_t v23 = (*(void (**)(uint64_t, void *, uint64_t))(v17 + 16))(v17, v22, 7);

        LOBYTE(v22) = v20[2](v20, 8);
        v59[0] = objc_opt_class();
        v59[1] = objc_opt_class();
        v59[2] = objc_opt_class();
        v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:3];
        v25 = ((void (**)(void, void *, uint64_t))v45)[2](v45, v24, 9);

        v26 = v36[2](v36, 10);
        v35 = (void *)v23;
        v32 = (void *)v23;
        v27 = v21;
        id v28 = -[BCSLinkItemModel initWithLinkURL:bundleID:heroImageURLString:iconImageURLString:redirectURL:action:mapIconStyleAttributes:mapItemMUID:businessLinkContentItemModels:isPoweredBy:]([BCSLinkItemModel alloc], v44, v43, v42, v34, v21, v33, v25, v26, v32, (char)v22);
        if (v28)
        {
          v29 = [BCSLinkItem alloc];
          v30 = objc_alloc_init(BCSLocaleHelper);
          v6 = [(BCSLinkItem *)v29 initWithLinkItemModel:v28 expirationDate:v41 localeHelper:v30];
        }
        else
        {
          v6 = 0;
        }
      }
      else
      {
        v6 = 0;
      }
      sqlite3_finalize(ppStmt);
    }
    [(BCSPersistentStore *)self endBatch];
  }

  return v6;
}

- (void)updateItem:(id)a3 withItemIdentifier:(id)a4
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v67 = a3;
  id v6 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (self && (isKindOfClass & 1) != 0)
  {
    id v8 = v6;
    id v9 = v67;
    [(BCSPersistentStore *)self beginBatch];
    [(BCSLinkItemPersistentStore *)self deleteItemMatching:v8];
    id v10 = v9;
    id v65 = v8;
    [(BCSPersistentStore *)self beginBatch];
    ppStmt = 0;
    v11 = (void *)MEMORY[0x263F08910];
    uint64_t v12 = [v10 model];
    id v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = *(void **)(v12 + 88);
    }
    else {
      uint64_t v14 = 0;
    }
    id v15 = v14;
    id v66 = [v11 archivedDataWithRootObject:v15 requiringSecureCoding:1 error:0];

    id v16 = [v10 model];
    uint64_t v17 = [v16 mapIconStyleAttributes];
    if (v17)
    {
      id v18 = (void *)MEMORY[0x263F08910];
      uint64_t v19 = [v10 model];
      v20 = [v19 mapIconStyleAttributes];
      v21 = [v18 archivedDataWithRootObject:v20 requiringSecureCoding:1 error:0];
    }
    else
    {
      v21 = 0;
    }

    v22 = [v10 model];
    uint64_t v23 = [v22 mapItemMUID];
    if (v23)
    {
      v24 = (void *)MEMORY[0x263F08910];
      v25 = [v10 model];
      v26 = [v25 mapItemMUID];
      v27 = [v24 archivedDataWithRootObject:v26 requiringSecureCoding:1 error:0];
    }
    else
    {
      v27 = 0;
    }
    id v28 = v65;

    if (!sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), (const char *)objc_msgSend(@"INSERT INTO link_items (full_hash_string, link_url_string, bundle_id_string, hero_image_url_string, icon_image_url_string, redirect_url_string, action, expiration_date, content_item_models, is_powered_by, map_icon_style_attributes, map_item_muid) VALUES (?,?,?,?,?,?,?,?,?,?, ?, ?)", "UTF8String"), -1, &ppStmt, 0))
    {
      v29 = [v65 itemIdentifier];
      objc_opt_class();
      char v30 = objc_opt_isKindOfClass();

      if (v30)
      {
        v31 = [v65 itemIdentifier];
        v32 = ppStmt;
        id v64 = v31;
        sqlite3_bind_text(v32, 1, (const char *)[v64 UTF8String], -1, 0);
        uint64_t v33 = ppStmt;
        v34 = [v10 model];
        v35 = [v34 linkURL];
        id v36 = [v35 absoluteString];
        sqlite3_bind_text(v33, 2, (const char *)[v36 UTF8String], -1, 0);

        v37 = ppStmt;
        id v38 = [v10 model];
        id v39 = [v38 bundleID];
        sqlite3_bind_text(v37, 3, (const char *)[v39 UTF8String], -1, 0);

        v40 = ppStmt;
        v41 = [v10 model];
        id v42 = [v41 heroImageURLString];
        sqlite3_bind_text(v40, 4, (const char *)[v42 UTF8String], -1, 0);

        v43 = ppStmt;
        v44 = [v10 model];
        id v45 = [v44 iconImageURLString];
        sqlite3_bind_text(v43, 5, (const char *)[v45 UTF8String], -1, 0);

        v46 = ppStmt;
        v47 = [v10 model];
        v48 = [v47 redirectURL];
        id v49 = [v48 absoluteString];
        sqlite3_bind_text(v46, 6, (const char *)[v49 UTF8String], -1, 0);

        sqlite3_bind_int(ppStmt, 7, [v10 action]);
        id v50 = ppStmt;
        v51 = [v10 expirationDate];
        [v51 timeIntervalSince1970];
        sqlite3_bind_double(v50, 8, v52);

        v53 = ppStmt;
        id v54 = v66;
        sqlite3_bind_blob(v53, 9, (const void *)[v54 bytes], objc_msgSend(v54, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        v55 = ppStmt;
        v56 = [v10 model];
        sqlite3_bind_int(v55, 10, [v56 isPoweredBy]);

        id v57 = ppStmt;
        id v58 = v21;
        sqlite3_bind_blob(v57, 11, (const void *)[v58 bytes], objc_msgSend(v58, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        v59 = ppStmt;
        id v60 = v27;
        sqlite3_bind_blob(v59, 12, (const void *)[v60 bytes], objc_msgSend(v60, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        int v61 = sqlite3_step(ppStmt);
        sqlite3_finalize(ppStmt);
        if (v61 != 101)
        {
          v62 = ABSLogCommon();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            v63 = sqlite3_errmsg([(BCSPersistentStore *)self openedDatabase]);
            *(_DWORD *)buf = 134218242;
            uint64_t v70 = v61;
            id v28 = v65;
            __int16 v71 = 2080;
            v72 = v63;
            _os_log_error_impl(&dword_2154F4000, v62, OS_LOG_TYPE_ERROR, "Error while finalizing insert link item %lu %s", buf, 0x16u);
          }
        }
      }
    }
    [(BCSPersistentStore *)self endBatch];

    [(BCSPersistentStore *)self endBatch];
  }
}

- (void)deleteItemMatching:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 type];
  if (self && v4 == 2)
  {
    uint64_t v5 = NSString;
    id v6 = [v9 itemIdentifier];
    [v5 stringWithFormat:@"DELETE FROM link_items WHERE full_hash_string = \"%@\"", v6];
    id v7 = objc_claimAutoreleasedReturnValue();
    id v8 = (const char *)[v7 UTF8String];

    -[BCSLinkItemPersistentStore _executeDeleteSQLQuery:](self, v8);
  }
}

- (void)deleteItemsOfType:(int64_t)a3
{
  if (self && a3 == 2)
  {
    uint64_t v5 = (const char *)[@"DELETE FROM link_items" UTF8String];
    -[BCSLinkItemPersistentStore _executeDeleteSQLQuery:](self, v5);
  }
}

- (void)deleteExpiredItemsOfType:(int64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v5 = NSString;
    id v6 = [MEMORY[0x263EFF910] date];
    [v6 timeIntervalSince1970];
    objc_msgSend(v5, "stringWithFormat:", @"DELETE FROM link_items WHERE expiration_date <= \"%f\"", v7);
    id v8 = objc_claimAutoreleasedReturnValue();
    id v9 = (const char *)[v8 UTF8String];

    -[BCSLinkItemPersistentStore _executeDeleteSQLQuery:](self, v9);
  }
}

- (void)_executeDeleteSQLQuery:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    [result beginBatch];
    ppStmt = 0;
    if (!sqlite3_prepare_v2((sqlite3 *)[v3 openedDatabase], a2, -1, &ppStmt, 0))
    {
      sqlite3_step(ppStmt);
      sqlite3_finalize(ppStmt);
    }
    return (void *)[v3 endBatch];
  }
  return result;
}

- (void)deleteLinkItemsWithBundleID:(id)a3
{
  [NSString stringWithFormat:@"DELETE FROM link_items WHERE bundle_id_string = \"%@\"", a3];
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (const char *)[v4 UTF8String];

  -[BCSLinkItemPersistentStore _executeDeleteSQLQuery:](self, v5);
}

unsigned __int8 *__60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke(uint64_t a1, int a2)
{
  objc_super v2 = (unsigned __int8 *)sqlite3_column_text(*(sqlite3_stmt **)(a1 + 32), a2);
  if (v2) {
    objc_super v2 = (unsigned __int8 *)[[NSString alloc] initWithUTF8String:v2];
  }

  return v2;
}

id __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_2(uint64_t a1)
{
  objc_super v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = [NSURL URLWithString:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_3(uint64_t a1, void *a2, int a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 32), a3);
  uint64_t v7 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v6, sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 32), a3));
  id v8 = v7;
  if (v7 && (id v9 = v7, [v9 bytes]))
  {
    id v10 = (void *)MEMORY[0x263F08928];
    v11 = [MEMORY[0x263EFFA08] setWithArray:v5];
    id v16 = 0;
    uint64_t v12 = [v10 unarchivedObjectOfClasses:v11 fromData:v9 error:&v16];
    id v13 = v16;

    if (v13)
    {
      uint64_t v14 = ABSLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v18 = v5;
        __int16 v19 = 2112;
        id v20 = v13;
        _os_log_error_impl(&dword_2154F4000, v14, OS_LOG_TYPE_ERROR, "error while unarchiving items of classes %@ - error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

id __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_32(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v6 = [v5 arrayByAddingObject:objc_opt_class()];

  uint64_t v7 = (*(void (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v6, a3);

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v9 = ABSLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      int v13 = 138412290;
      uint64_t v14 = v12;
      _os_log_error_impl(&dword_2154F4000, v9, OS_LOG_TYPE_ERROR, "error while unarchiving object - expected NSArray type but got %@", (uint8_t *)&v13, 0xCu);
    }
    id v8 = 0;
  }
  else
  {
    id v8 = v7;
  }

  return v8;
}

id __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_35(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v6 = [v5 arrayByAddingObject:objc_opt_class()];

  uint64_t v7 = (*(void (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v6, a3);

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v9 = ABSLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      int v13 = 138412290;
      uint64_t v14 = v12;
      _os_log_error_impl(&dword_2154F4000, v9, OS_LOG_TYPE_ERROR, "error while unarchiving object - expected NSDictionary type but got %@", (uint8_t *)&v13, 0xCu);
    }
    id v8 = 0;
  }
  else
  {
    id v8 = v7;
  }

  return v8;
}

id __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_38(uint64_t a1, uint64_t a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  v13[0] = objc_opt_class();
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v5 = (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v4, a2);

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v7 = ABSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_error_impl(&dword_2154F4000, v7, OS_LOG_TYPE_ERROR, "error while unarchiving object - expected NSNumber type but got %@", (uint8_t *)&v11, 0xCu);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = v5;
  }

  return v6;
}

uint64_t __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_41(uint64_t a1, int a2)
{
  double v2 = sqlite3_column_double(*(sqlite3_stmt **)(a1 + 32), a2);
  uint64_t v3 = (void *)MEMORY[0x263EFF910];

  return [v3 dateWithTimeIntervalSince1970:v2];
}

uint64_t __60__BCSLinkItemPersistentStore__extractLinkItemFromStatement___block_invoke_2_44(uint64_t a1, int a2)
{
  double v2 = objc_msgSend(NSNumber, "numberWithInteger:", sqlite3_column_int(*(sqlite3_stmt **)(a1 + 32), a2));
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

@end