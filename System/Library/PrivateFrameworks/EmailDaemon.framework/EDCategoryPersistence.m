@interface EDCategoryPersistence
+ (OS_os_log)log;
+ (id)categoryForResultRow:(id)a3;
+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4;
+ (void)addCategoryColumnsToMessagesSelectComponent:(id)a3 globalMessagesSelectComponent:(id)a4 businessAddressesSelectComponent:(id)a5;
+ (void)initializeCategorizationVersion:(id)a3;
- (BOOL)persistCategorizationResult:(id)a3 forGlobalID:(int64_t)a4 categorizationVersion:(int64_t)a5 connection:(id)a6;
- (BOOL)persistCategorizationResultMap:(id)a3;
- (EDCategoryChangeHookResponder)hookResponder;
- (EDCategoryCoreAnalyticsLogger)analyticsLogger;
- (EDCategoryPersistence)initWithDatabase:(id)a3 hookResponder:(id)a4;
- (EDPersistenceDatabase)database;
- (EFLocked)cachedCurrentCategorizationVersion;
- (id)modelAnalyticsForMessage:(int64_t)a3;
- (id)requestProtectedDatabaseBackgroundProcessingForDuration:(double)a3 error:(id *)a4;
- (int64_t)currentCategorizationVersion;
- (void)_initializeCategorizationVersion;
- (void)changeHighImpactType:(unint64_t)a3 messages:(id)a4;
- (void)incrementCategorizationVersion;
- (void)prepareToPersistCategorizationResultMap:(id)a3;
- (void)setAnalyticsLogger:(id)a3;
- (void)setCachedCurrentCategorizationVersion:(id)a3;
@end

@implementation EDCategoryPersistence

+ (id)categoryForResultRow:(id)a3
{
  id v3 = a3;
  v4 = +[EDMessagePersistence messageGlobalDataModelCategoryColumnName];
  if (![v3 columnExistsWithName:v4]) {
    goto LABEL_10;
  }
  v5 = +[EDMessagePersistence messageGlobalDataModelSubcategoryColumnName];
  if (![v3 columnExistsWithName:v5])
  {
LABEL_9:

LABEL_10:
    v14 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v6 = +[EDMessagePersistence messageGlobalDataCategoryIsTemporaryColumnName];
  if (([v3 columnExistsWithName:v6] & 1) == 0)
  {

    goto LABEL_9;
  }
  v7 = +[EDMessagePersistence messageGlobalDataHighImpactColumnName];
  char v8 = [v3 columnExistsWithName:v7];

  if (v8)
  {
    v9 = +[EDMessagePersistence messageBusinessCategoryColumnAlias];
    int v10 = [v3 columnExistsWithName:v9];

    if (!v10) {
      goto LABEL_16;
    }
    v11 = +[EDMessagePersistence messageBusinessCategoryColumnAlias];
    v12 = [v3 objectForKeyedSubscript:v11];
    v4 = [v12 numberValue];

    if (v4)
    {
      uint64_t v13 = 3;
    }
    else
    {
LABEL_16:
      v16 = +[EDMessagePersistence messageGlobalDataModelCategoryColumnName];
      v17 = [v3 objectForKeyedSubscript:v16];
      v4 = [v17 numberValue];

      if (v4)
      {
        v18 = +[EDMessagePersistence messageGlobalDataCategoryIsTemporaryColumnName];
        v19 = [v3 objectForKeyedSubscript:v18];
        int v20 = [v19 BOOLValue];

        if (v20) {
          uint64_t v13 = 2;
        }
        else {
          uint64_t v13 = 1;
        }
      }
      else
      {
        uint64_t v13 = 0;
      }
    }
    v21 = +[EDMessagePersistence messageGlobalDataModelSubcategoryColumnName];
    v22 = [v3 objectForKeyedSubscript:v21];
    v23 = [v22 numberValue];
    uint64_t v24 = [v23 unsignedIntegerValue];

    v25 = +[EDMessagePersistence messageGlobalDataHighImpactColumnName];
    v26 = [v3 objectForKeyedSubscript:v25];
    uint64_t v27 = [v26 BOOLValue];

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F60230]), "initWithType:subtype:isHighImpact:state:", objc_msgSend(v4, "unsignedIntegerValue"), v24, v27, v13);
    goto LABEL_11;
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (EDCategoryCoreAnalyticsLogger)analyticsLogger
{
  return self->_analyticsLogger;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__EDCategoryPersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_18 != -1) {
    dispatch_once(&log_onceToken_18, block);
  }
  v2 = (void *)log_log_18;

  return (OS_os_log *)v2;
}

void __28__EDCategoryPersistence_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_18;
  log_log_18 = (uint64_t)v1;
}

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  id result = (id)MEMORY[0x1E4F1CBF0];
  *a3 = (id)MEMORY[0x1E4F1CBF0];
  *a4 = result;
  return result;
}

- (EDCategoryPersistence)initWithDatabase:(id)a3 hookResponder:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"EDCategoryPersistence-BlackPearl.m", 100, @"Invalid parameter not satisfying: %@", @"database != nil" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)EDCategoryPersistence;
  int v10 = [(EDCategoryPersistence *)&v19 init];
  v11 = v10;
  v12 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_database, a3);
    objc_storeStrong((id *)&v11->_hookResponder, a4);
    if (_os_feature_enabled_impl())
    {
      uint64_t v13 = objc_alloc_init(EDCategoryCoreAnalyticsLogger);
      analyticsLogger = v12->_analyticsLogger;
      v12->_analyticsLogger = v13;
    }
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F60DA0]) initWithObject:&unk_1F35BAB98];
    cachedCurrentCategorizationVersion = v12->_cachedCurrentCategorizationVersion;
    v12->_cachedCurrentCategorizationVersion = (EFLocked *)v15;
  }
  return v12;
}

- (BOOL)persistCategorizationResult:(id)a3 forGlobalID:(int64_t)a4 categorizationVersion:(int64_t)a5 connection:(id)a6
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  id v11 = objc_alloc(MEMORY[0x1E4F60F10]);
  v12 = +[EDMessagePersistence messageGlobalDataTableName];
  uint64_t v13 = (void *)[v11 initWithTable:v12];

  v14 = NSNumber;
  uint64_t v15 = [v9 category];
  v16 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "state") == 2);
  v17 = +[EDMessagePersistence messageGlobalDataCategoryIsTemporaryColumnName];
  [v13 setObject:v16 forKeyedSubscript:v17];

  v18 = NSNumber;
  objc_super v19 = [v9 category];
  int v20 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "type"));
  v21 = +[EDMessagePersistence messageGlobalDataModelCategoryColumnName];
  [v13 setObject:v20 forKeyedSubscript:v21];

  v22 = NSNumber;
  v23 = [v9 category];
  uint64_t v24 = objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v23, "subtype"));
  v25 = +[EDMessagePersistence messageGlobalDataModelSubcategoryColumnName];
  [v13 setObject:v24 forKeyedSubscript:v25];

  v26 = NSNumber;
  uint64_t v27 = [v9 category];
  v28 = objc_msgSend(v26, "numberWithBool:", objc_msgSend(v27, "isHighImpact"));
  v29 = +[EDMessagePersistence messageGlobalDataHighImpactColumnName];
  [v13 setObject:v28 forKeyedSubscript:v29];

  v30 = [v9 metadata];
  v31 = [v30 stringRepresentationWithError:0];

  if (v31)
  {
    v32 = +[EDMessagePersistence messageGlobalDataModelAnalyticsColumnName];
    [v13 setObject:v31 forKeyedSubscript:v32];
  }
  v33 = [NSNumber numberWithInteger:a5];
  v34 = +[EDMessagePersistence messageGlobalDataCategoryModelVersionColumnName];
  [v13 setObject:v33 forKeyedSubscript:v34];

  v35 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  v36 = [NSNumber numberWithLongLong:a4];
  v40[0] = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  v38 = [v35 in:v37];
  [v13 setWhereClause:v38];

  LOBYTE(v38) = [v10 executeUpdateStatement:v13 error:0];
  return (char)v38;
}

- (BOOL)persistCategorizationResultMap:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [v4 allKeys];
    v6 = [(EDCategoryPersistence *)self hookResponder];
    [v6 persistenceWillChangeCategorizationForMessages:v5];

    v7 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
    int64_t v8 = [(EDCategoryPersistence *)self currentCategorizationVersion];
    id v9 = [(EDCategoryPersistence *)self database];
    id v10 = [NSString stringWithUTF8String:"-[EDCategoryPersistence persistCategorizationResultMap:]"];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __56__EDCategoryPersistence_persistCategorizationResultMap___block_invoke;
    v18 = &unk_1E6BFFF40;
    id v11 = v7;
    objc_super v19 = v11;
    int v20 = self;
    id v21 = v4;
    int64_t v22 = v8;
    char v12 = objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, &v15);

    uint64_t v13 = [(EDCategoryPersistence *)self hookResponder];
    [v13 persistenceDidChangeCategorizationForMessages:v5 generationWindow:v11];
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

uint64_t __56__EDCategoryPersistence_persistCategorizationResultMap___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  [*(id *)(a1 + 40) prepareToPersistCategorizationResultMap:*(void *)(a1 + 48)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__EDCategoryPersistence_persistCategorizationResultMap___block_invoke_2;
  v8[3] = &unk_1E6C00828;
  id v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v8[4] = *(void *)(a1 + 40);
  uint64_t v10 = v5;
  id v6 = v3;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return 1;
}

void __56__EDCategoryPersistence_persistCategorizationResultMap___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "persistCategorizationResult:forGlobalID:categorizationVersion:connection:", v5, objc_msgSend(v6, "globalMessageID"), *(void *)(a1 + 48), *(void *)(a1 + 40));
}

- (void)prepareToPersistCategorizationResultMap:(id)a3
{
  id v5 = a3;
  [(EDCategoryPersistence *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDCategoryPersistence prepareToPersistCategorizationResultMap:]", "EDCategoryPersistence-BlackPearl.m", 174, "0");
}

- (void)changeHighImpactType:(unint64_t)a3 messages:(id)a4
{
  id v6 = a4;
  v7 = [(EDCategoryPersistence *)self database];
  int64_t v8 = [NSString stringWithUTF8String:"-[EDCategoryPersistence changeHighImpactType:messages:]"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__EDCategoryPersistence_changeHighImpactType_messages___block_invoke;
  v10[3] = &unk_1E6BFF4A0;
  id v9 = v6;
  id v11 = v9;
  unint64_t v12 = a3;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v10);
}

uint64_t __55__EDCategoryPersistence_changeHighImpactType_messages___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "ef_map:", &__block_literal_global_11);
  id v5 = objc_alloc(MEMORY[0x1E4F60F10]);
  id v6 = +[EDMessagePersistence messageGlobalDataTableName];
  v7 = (void *)[v5 initWithTable:v6];

  int64_t v8 = [NSNumber numberWithInt:*(void *)(a1 + 40) == 1];
  id v9 = +[EDMessagePersistence messageGlobalDataHighImpactColumnName];
  [v7 setObject:v8 forKeyedSubscript:v9];

  uint64_t v10 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  id v11 = [v10 in:v4];
  [v7 setWhereClause:v11];

  id v18 = 0;
  uint64_t v12 = [v3 executeUpdateStatement:v7 error:&v18];
  id v13 = v18;
  if (v13)
  {
    v14 = +[EDCategoryPersistence log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = objc_msgSend(v13, "ef_publicDescription");
      __55__EDCategoryPersistence_changeHighImpactType_messages___block_invoke_cold_1(v15, v16, buf, v14);
    }
  }
  return v12;
}

id __55__EDCategoryPersistence_changeHighImpactType_messages___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "globalMessageID"));

  return v3;
}

- (id)modelAnalyticsForMessage:(int64_t)a3
{
  uint64_t v15 = 0;
  v16[0] = &v15;
  v16[1] = 0x3032000000;
  v16[2] = __Block_byref_object_copy__4;
  v16[3] = __Block_byref_object_dispose__4;
  id v17 = 0;
  id v4 = [(EDCategoryPersistence *)self database];
  id v5 = [NSString stringWithUTF8String:"-[EDCategoryPersistence modelAnalyticsForMessage:]"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__EDCategoryPersistence_modelAnalyticsForMessage___block_invoke;
  v14[3] = &unk_1E6BFFE38;
  v14[4] = &v15;
  v14[5] = a3;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v14);

  id v6 = *(void **)(v16[0] + 40);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F28D90];
    int64_t v8 = [v6 dataUsingEncoding:4];
    id v13 = 0;
    id v9 = [v7 JSONObjectWithData:v8 options:4 error:&v13];
    id v10 = v13;

    if (v10)
    {
      id v11 = +[EDCategoryPersistence log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        [(EDCategoryPersistence *)(uint64_t)v16 modelAnalyticsForMessage:v11];
      }
    }
  }
  else
  {
    id v9 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v9;
}

uint64_t __50__EDCategoryPersistence_modelAnalyticsForMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v5 = +[EDMessagePersistence messageGlobalDataModelAnalyticsColumnName];
  id v6 = +[EDMessagePersistence messageGlobalDataTableName];
  v7 = (void *)[v4 initWithResultColumn:v5 table:v6];

  int64_t v8 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  uint64_t v9 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  id v10 = [v8 equalTo:v9];
  [v7 setWhere:v10];

  id v16 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __50__EDCategoryPersistence_modelAnalyticsForMessage___block_invoke_2;
  v17[3] = &unk_1E6BFF4C8;
  v17[4] = *(void *)(a1 + 32);
  LOBYTE(v9) = [v3 executeSelectStatement:v7 withBlock:v17 error:&v16];
  id v11 = v16;
  if ((v9 & 1) == 0)
  {
    uint64_t v12 = NSString;
    id v13 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
    v14 = [v12 stringWithFormat:@"Failed to read modelAnalytics for messageID:%@", v13];
    [v3 handleError:v11 message:v14];
  }
  return 1;
}

void __50__EDCategoryPersistence_modelAnalyticsForMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 stringValue];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

+ (void)initializeCategorizationVersion:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  char v3 = _setCategorizationVersionUsingConnection(a3, (uint64_t)&v7);
  id v4 = v7;
  if ((v3 & 1) == 0)
  {
    uint64_t v5 = +[EDCategoryPersistence log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      id v6 = objc_msgSend(v4, "ef_publicDescription");
      +[EDCategoryPersistence initializeCategorizationVersion:v5];
    }
  }
}

- (void)_initializeCategorizationVersion
{
  id v4 = [(EDCategoryPersistence *)self database];
  uint64_t v5 = [NSString stringWithUTF8String:"-[EDCategoryPersistence _initializeCategorizationVersion]"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__EDCategoryPersistence__initializeCategorizationVersion__block_invoke;
  v6[3] = &unk_1E6BFF4A0;
  v6[4] = self;
  v6[5] = a2;
  objc_msgSend(v4, "__performWriteWithCaller:usingBlock:", v5, v6);
}

uint64_t __57__EDCategoryPersistence__initializeCategorizationVersion__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = 0;
  char v4 = _setCategorizationVersionUsingConnection(v3, (uint64_t)&v11);
  id v5 = v11;
  if ((v4 & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v10 = objc_msgSend(v5, "ef_publicDescription");
    [v7 handleFailureInMethod:v8, v9, @"EDCategoryPersistence-BlackPearl.m", 241, @"Could not initialize categorization version. Error:%@", v10 object file lineNumber description];
  }
  return 1;
}

- (void)incrementCategorizationVersion
{
  int64_t v3 = [(EDCategoryPersistence *)self currentCategorizationVersion];
  char v4 = [(EDCategoryPersistence *)self database];
  id v5 = [NSString stringWithUTF8String:"-[EDCategoryPersistence incrementCategorizationVersion]"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__EDCategoryPersistence_incrementCategorizationVersion__block_invoke;
  v6[3] = &unk_1E6BFF4A0;
  v6[4] = self;
  v6[5] = v3;
  objc_msgSend(v4, "__performWriteWithCaller:usingBlock:", v5, v6);
}

uint64_t __55__EDCategoryPersistence_incrementCategorizationVersion__block_invoke(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F60F18]);
  v16[0] = @"key";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v6 = (void *)[v4 initWithTable:@"properties" conflictTarget:v5];

  [v6 setObject:@"CategorizationVersion" forKeyedSubscript:@"key"];
  id v7 = [NSNumber numberWithInteger:*(void *)(a1 + 40) + 1];
  [v6 setObject:v7 forKeyedSubscript:@"value"];

  id v14 = 0;
  int v8 = [v3 executeUpsertStatement:v6 error:&v14];
  id v9 = v14;
  if (v8)
  {
    id v10 = [*(id *)(a1 + 32) cachedCurrentCategorizationVersion];
    id v11 = [v6 objectForKeyedSubscript:@"value"];
    [v10 setObject:v11];
  }
  else
  {
    id v10 = +[EDCategoryPersistence log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(v9, "ef_publicDescription");
      __55__EDCategoryPersistence_incrementCategorizationVersion__block_invoke_cold_1(v12, buf, v10);
    }
  }

  return 1;
}

- (int64_t)currentCategorizationVersion
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  id v3 = [(EDCategoryPersistence *)self cachedCurrentCategorizationVersion];
  id v4 = [v3 getObject];
  uint64_t v5 = [v4 integerValue];

  unint64_t v16 = v5;
  if (v14[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(EDCategoryPersistence *)self database];
    id v7 = [NSString stringWithUTF8String:"-[EDCategoryPersistence currentCategorizationVersion]"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__EDCategoryPersistence_currentCategorizationVersion__block_invoke;
    v12[3] = &unk_1E6BFFF68;
    v12[4] = self;
    v12[5] = &v13;
    objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v12);
  }
  int v8 = +[EDCategoryPersistence log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v14[3];
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v9;
    _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Current categorization version set to %ld.", buf, 0xCu);
  }

  int64_t v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __53__EDCategoryPersistence_currentCategorizationVersion__block_invoke(uint64_t a1, void *a2)
{
  id v15 = 0;
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"value" table:@"properties"];
  uint64_t v5 = [MEMORY[0x1E4F60E78] column:@"key"];
  id v6 = [v5 equalTo:@"CategorizationVersion"];
  [v4 setWhere:v6];

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = ___categorizationVersionUsingConnection_block_invoke;
  v16[3] = &unk_1E6BFF4C8;
  void v16[4] = &v17;
  [v3 executeSelectStatement:v4 withBlock:v16 error:&v15];
  uint64_t v7 = v18[3];
  _Block_object_dispose(&v17, 8);

  id v8 = v15;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(v9 + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(v9 + 24) = 1;
    int64_t v10 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__EDCategoryPersistence_currentCategorizationVersion__block_invoke_2;
    block[3] = &unk_1E6BFF2F0;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v10, block);
  }
  id v11 = [*(id *)(a1 + 32) cachedCurrentCategorizationVersion];
  uint64_t v12 = [NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [v11 setObject:v12];

  return 1;
}

uint64_t __53__EDCategoryPersistence_currentCategorizationVersion__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeCategorizationVersion];
}

- (id)requestProtectedDatabaseBackgroundProcessingForDuration:(double)a3 error:(id *)a4
{
  id v6 = [(EDCategoryPersistence *)self database];
  uint64_t v7 = [v6 requestProtectedDatabaseBackgroundProcessingForDuration:a4 error:a3];

  return v7;
}

+ (void)addCategoryColumnsToMessagesSelectComponent:(id)a3 globalMessagesSelectComponent:(id)a4 businessAddressesSelectComponent:(id)a5
{
  id v13 = a4;
  id v6 = a5;
  uint64_t v7 = +[EDMessagePersistence messageGlobalDataModelCategoryColumnName];
  [v13 addResultColumn:v7];

  id v8 = +[EDMessagePersistence messageGlobalDataModelSubcategoryColumnName];
  [v13 addResultColumn:v8];

  uint64_t v9 = +[EDMessagePersistence messageGlobalDataCategoryIsTemporaryColumnName];
  [v13 addResultColumn:v9];

  int64_t v10 = +[EDMessagePersistence messageGlobalDataHighImpactColumnName];
  [v13 addResultColumn:v10];

  id v11 = +[EDBusinessPersistence businessAddressesCategoryColumnName];
  uint64_t v12 = +[EDMessagePersistence messageBusinessCategoryColumnAlias];
  [v6 addResultColumn:v11 alias:v12];
}

- (void)setAnalyticsLogger:(id)a3
{
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (EDCategoryChangeHookResponder)hookResponder
{
  return self->_hookResponder;
}

- (EFLocked)cachedCurrentCategorizationVersion
{
  return self->_cachedCurrentCategorizationVersion;
}

- (void)setCachedCurrentCategorizationVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCurrentCategorizationVersion, 0);
  objc_storeStrong((id *)&self->_hookResponder, 0);
  objc_storeStrong((id *)&self->_database, 0);

  objc_storeStrong((id *)&self->_analyticsLogger, 0);
}

void __55__EDCategoryPersistence_changeHighImpactType_messages___block_invoke_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to update high impact property for messages %@ error %{public}@", buf, 0x16u);
}

- (void)modelAnalyticsForMessage:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Model Analytics is invalid JSON: %@. Error:%@", (uint8_t *)&v4, 0x16u);
}

+ (void)initializeCategorizationVersion:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1DB39C000, log, OS_LOG_TYPE_FAULT, "Couldn not set categorization version set to 1 due to error  %{public}@.", buf, 0xCu);
}

void __55__EDCategoryPersistence_incrementCategorizationVersion__block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to increment categorization version due to error %{public}@", buf, 0xCu);
}

@end