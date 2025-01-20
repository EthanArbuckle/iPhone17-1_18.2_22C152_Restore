@interface EDBusinessPersistence
+ (BOOL)_hasCommonDomain:(id)a3;
+ (BOOL)_shouldUseGroupingSimpleAddressForEmailAddress:(id)a3 grouping:(int64_t)a4;
+ (BOOL)_shouldUseSimpleAddressForHighLevelDomain:(id)a3 displayName:(id)a4 grouping:(int64_t)a5;
+ (NSString)businessAddressesAddressColumnName;
+ (NSString)businessAddressesBusinessColumnName;
+ (NSString)businessAddressesCategoryColumnName;
+ (NSString)businessAddressesLastBCSSyncColumnName;
+ (NSString)businessAddressesLastModifiedColumnName;
+ (NSString)businessAddressesTableName;
+ (NSString)businessCategoriesBusinessColumnName;
+ (NSString)businessCategoriesCategoryColumnName;
+ (NSString)businessCategoriesTableName;
+ (NSString)businessesBrandIDColumnName;
+ (NSString)businessesDisplayNameColumnName;
+ (NSString)businessesDomainColumnName;
+ (NSString)businessesLocalizedBrandNameColumnName;
+ (NSString)businessesTableName;
+ (id)_brandIDFromInteger:(int64_t)a3;
+ (id)_commonDomains;
+ (id)brandIDForResultRow:(id)a3;
+ (id)businessAddressesTableSchema;
+ (id)businessCategoriesTableSchema;
+ (id)businessesTableSchema;
+ (id)log;
+ (id)protectedTablesAndForeignKeysToResolve:(id *)a3;
+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4;
- (BCSBusinessQueryService)businessQueryService;
- (BOOL)_combineBusinesses:(id)a3 connection:(id)a4 newBusinessID:(int64_t *)a5;
- (BOOL)_completedBCSSyncforAddressID:(id)a3 connection:(id)a4;
- (BOOL)_deleteBusinessAddressEntryForAddressID:(id)a3 connection:(id)a4;
- (BOOL)_deleteBusinessEntryForBusinessID:(id)a3 connection:(id)a4;
- (BOOL)_hasCompletedRecentBCSSyncForAddressID:(int64_t)a3 connection:(id)a4;
- (BOOL)_insertOrUpdateBusiness:(int64_t)a3 forAddress:(int64_t)a4 connection:(id)a5;
- (BOOL)_insertOrUpdateBusinessCategoriesCategoryColumnForBusinessID:(int64_t)a3 category:(unint64_t)a4 connection:(id)a5;
- (BOOL)_removeOldBusinessIDs:(id)a3 connection:(id)a4;
- (BOOL)_removeUserOverrideForAddressIDs:(id)a3 timestamp:(id)a4 connection:(id)a5;
- (BOOL)_removeUserOverrideForBusinessID:(int64_t)a3 timestamp:(id)a4 connection:(id)a5;
- (BOOL)_setUserOverrideForBusinessID:(int64_t)a3 category:(unint64_t)a4 connection:(id)a5 timestamp:(id)a6;
- (BOOL)_updateBrandNamesForBusinessID:(int64_t)a3 brandNames:(id)a4 connection:(id)a5;
- (BOOL)_updateBusinessAddressesCategoryColumnForAddressIDs:(id)a3 category:(unint64_t)a4 connection:(id)a5 timestamp:(id)a6;
- (BOOL)_updateBusinessAddressesTableforBusinessID:(id)a3 newBusinessID:(id)a4 connection:(id)a5;
- (BOOL)_updateBusinessIDForAddress:(id)a3 addressID:(int64_t)a4 emailItem:(id)a5 connection:(id)a6;
- (BOOL)_updateDisplayNameForBusinessID:(int64_t)a3 displayName:(id)a4 connection:(id)a5;
- (EDBusinessPersistence)initWithDatabase:(id)a3 hookRegistry:(id)a4;
- (EDPersistenceDatabase)database;
- (EDPersistenceHookRegistry)hookRegistry;
- (id)_addressesNeedingUpdateStatementOnlyCounts:(BOOL)a3;
- (id)_bcsEmailIdentiferForAddress:(id)a3;
- (id)_businessAddressMapWithCategoryOverrideWithConnection:(id)a3;
- (id)_businessExternalIDForAddressID:(int64_t)a3 expectedGrouping:(int64_t)a4 connection:(id)a5 error:(id *)a6;
- (id)_businessExternalIDForEmailAddress:(id)a3 addressID:(int64_t)a4 brandID:(id)a5 grouping:(int64_t)a6 businessIDsToCombine:(id *)a7;
- (id)_businessIDsForHighLevelDomain:(id)a3 connection:(id)a4;
- (id)_categoryOverridesForBusinessIDs:(id)a3 connection:(id)a4;
- (id)_existingExternalIDForAddressID:(int64_t)a3 error:(id *)a4;
- (id)_externalIDForDomain:(id)a3 displayName:(id)a4 brandID:(id)a5 simpleAddress:(id)a6 grouping:(int64_t)a7;
- (id)_externalIDForPersistedDomain:(id)a3 displayName:(id)a4 brandID:(id)a5 grouping:(int64_t)a6;
- (id)_externalIDWithCommonPrefixForHighLevelDomain:(id)a3 displayName:(id)a4 businessIDsToCombine:(id *)a5;
- (id)_findExistingBrandIDForBusinessID:(int64_t)a3 connection:(id)a4;
- (id)_groupingTrieForHighLevelDomain:(id)a3;
- (id)_highLevelDomainsForBusinessIDs:(id)a3;
- (id)_lastBCSSyncForAddressID:(int64_t)a3 connection:(id)a4;
- (id)_localizedStringFromJSONString:(id)a3;
- (id)_persistedBrandNamesForDictionary:(id)a3;
- (id)_persistedDisplayNameForExternalID:(id)a3;
- (id)_persistedDomainForExternalID:(id)a3;
- (id)addressIDsForBusinessID:(int64_t)a3 connection:(id)a4;
- (id)addressesForBusinessID:(int64_t)a3;
- (id)businessAddressMapWithCategoryOverride;
- (id)businessDisplayNameForBusinessID:(int64_t)a3;
- (id)businessExternalIDForBusinessID:(int64_t)a3;
- (id)businessExternalIDForEmailAddress:(id)a3 grouping:(int64_t)a4;
- (id)categoryTypeForAddressID:(int64_t)a3;
- (id)categoryTypeForBusinessID:(int64_t)a3;
- (id)lastModifiedDateForAddressID:(int64_t)a3;
- (id)updatedCategoryForAddressID:(int64_t)a3 fromCategorizationResult:(id)a4;
- (int64_t)_businessIDForDomain:(id)a3 displayName:(id)a4 connection:(id)a5;
- (int64_t)_findExistingBusinessForAddressID:(int64_t)a3 connection:(id)a4;
- (int64_t)_findOrCreateBusinessIDForAddress:(id)a3 addressID:(int64_t)a4 businessMetadata:(id)a5 connection:(id)a6;
- (int64_t)_insertBusinessWithBrandID:(int64_t)a3 localizedBrandNames:(id)a4 connection:(id)a5;
- (int64_t)_insertBusinessWithDomain:(id)a3 displayName:(id)a4 connection:(id)a5;
- (int64_t)_persistedBrandIDForExternalID:(id)a3;
- (int64_t)_persistedBrandIDForString:(id)a3;
- (int64_t)businessIDForAddressID:(int64_t)a3;
- (int64_t)businessIDForBusinessExternalID:(id)a3;
- (int64_t)findOrCreateBusinessIDForAddress:(id)a3 addressID:(int64_t)a4 connection:(id)a5;
- (unint64_t)countOfAddressesNeedingUpdate;
- (void)addressIDsWereDeleted:(id)a3 connection:(id)a4;
- (void)backfillBusinessesTables;
- (void)countOfUserOverridesWithCompletionHandler:(id)a3;
- (void)fetchBusinessMetadataForAddresses:(id)a3 completionHandler:(id)a4;
- (void)insertOrUpdateUserOverrideForAddressIDs:(id)a3 category:(unint64_t)a4 timestamp:(id)a5;
- (void)insertOrUpdateUserOverrideForBusinessIDs:(id)a3 category:(unint64_t)a4 timestamp:(id)a5;
- (void)iterateAddressesNeedingUpdateWithCancelationToken:(id)a3 handler:(id)a4;
- (void)persistenceDidReconcileProtectedData;
- (void)persistenceWillAddProtectedDatabaseIDsFromJournal:(id)a3 andReplaceJournalDatabaseIDsWithProtectedDatabaseIDs:(id)a4 forTable:(id)a5;
- (void)removeAllUserOverrides;
- (void)removeUserOverrideForAddressIDs:(id)a3 timestamp:(id)a4;
- (void)removeUserOverridesForBusinessIDs:(id)a3 timestamp:(id)a4;
- (void)setBusinessQueryService:(id)a3;
- (void)setDatabase:(id)a3;
@end

@implementation EDBusinessPersistence

+ (NSString)businessAddressesTableName
{
  return (NSString *)@"business_addresses";
}

+ (NSString)businessAddressesCategoryColumnName
{
  return (NSString *)@"category";
}

+ (NSString)businessAddressesAddressColumnName
{
  return (NSString *)@"address";
}

+ (NSString)businessAddressesBusinessColumnName
{
  return (NSString *)@"business";
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__EDBusinessPersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_15 != -1) {
    dispatch_once(&log_onceToken_15, block);
  }
  v2 = (void *)log_log_15;

  return v2;
}

void __28__EDBusinessPersistence_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_15;
  log_log_15 = (uint64_t)v1;
}

- (EDBusinessPersistence)initWithDatabase:(id)a3 hookRegistry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)EDBusinessPersistence;
  v9 = [(EDBusinessPersistence *)&v26 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    v11 = [(EDPersistenceDatabase *)v10->_database protectedDatabasePersistence];
    v12 = +[EDProtectedDatabasePersistence deleteMergeHandler];
    [v11 registerMergeHandler:v12 forTable:@"business_addresses"];

    v13 = [(EDPersistenceDatabase *)v10->_database protectedDatabasePersistence];
    v14 = +[EDProtectedDatabasePersistence replaceMergeHandler];
    [v13 registerMergeHandler:v14 forTable:@"business_categories"];

    objc_storeStrong((id *)&v10->_hookRegistry, a4);
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v17 = dispatch_queue_create("businessPersistence", v16);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v17;

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v21 = dispatch_queue_create("businessConnectResponse", v20);
    businessConnectResponseQueue = v10->_businessConnectResponseQueue;
    v10->_businessConnectResponseQueue = (OS_dispatch_queue *)v21;

    [v8 registerProtectedDataReconciliationHookResponder:v10];
    v23 = (BCSBusinessQueryService *)objc_alloc_init(getBCSBusinessQueryServiceClass());
    businessQueryService = v10->_businessQueryService;
    v10->_businessQueryService = v23;
  }
  return v10;
}

+ (NSString)businessesTableName
{
  return (NSString *)@"businesses";
}

+ (NSString)businessesDomainColumnName
{
  return (NSString *)@"domain";
}

+ (NSString)businessesDisplayNameColumnName
{
  return (NSString *)@"address_comment";
}

+ (NSString)businessesBrandIDColumnName
{
  return (NSString *)@"brand_id";
}

+ (NSString)businessesLocalizedBrandNameColumnName
{
  return (NSString *)@"localized_brand_name";
}

+ (NSString)businessAddressesLastModifiedColumnName
{
  return (NSString *)@"last_modified";
}

+ (NSString)businessAddressesLastBCSSyncColumnName
{
  return (NSString *)@"last_bcs_sync";
}

+ (NSString)businessCategoriesTableName
{
  return (NSString *)@"business_categories";
}

+ (NSString)businessCategoriesBusinessColumnName
{
  return (NSString *)@"business";
}

+ (NSString)businessCategoriesCategoryColumnName
{
  return (NSString *)@"category";
}

+ (id)businessCategoriesTableSchema
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"business" nullable:0];
  v10[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"category" nullable:0];
  v10[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v6 = (void *)[v2 initWithName:@"business_categories" rowIDType:1 columns:v5];

  v9 = @"business";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  [v6 addUniquenessConstraintForColumns:v7 conflictResolution:1];

  return v6;
}

+ (id)businessesTableSchema
{
  v42[4] = *MEMORY[0x1E4F143B8];
  v36 = [MEMORY[0x1E4F60E80] textColumnWithName:@"address_comment" collation:2 nullable:1];
  v35 = [MEMORY[0x1E4F60E80] textColumnWithName:@"domain" collation:2 nullable:1];
  v34 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"brand_id" nullable:1];
  v33 = [MEMORY[0x1E4F60E80] textColumnWithName:@"localized_brand_name" collation:0 nullable:1];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v42[0] = v36;
  v42[1] = v35;
  v42[2] = v34;
  v42[3] = v33;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
  id v32 = (id)[v2 initWithName:@"businesses" rowIDType:2 columns:v3];

  v41[0] = @"address_comment";
  v41[1] = @"domain";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  [v32 addUniquenessConstraintForColumns:v4 conflictResolution:1];

  v40 = @"brand_id";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  [v32 addUniquenessConstraintForColumns:v5 conflictResolution:1];

  id v6 = objc_alloc(MEMORY[0x1E4F60E48]);
  id v7 = [v36 columnExpression];
  id v8 = [v7 isNotNull];
  v39[0] = v8;
  v9 = [v35 columnExpression];
  v10 = [v9 isNotNull];
  v39[1] = v10;
  v11 = [v34 columnExpression];
  v12 = [v11 isNull];
  v39[2] = v12;
  v13 = [v33 columnExpression];
  v14 = [v13 isNull];
  v39[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
  v31 = (void *)[v6 initWithExpressions:v15];

  id v16 = objc_alloc(MEMORY[0x1E4F60E48]);
  dispatch_queue_t v17 = [v36 columnExpression];
  v18 = [v17 isNull];
  v38[0] = v18;
  v19 = [v35 columnExpression];
  v20 = [v19 isNull];
  v38[1] = v20;
  dispatch_queue_t v21 = [v34 columnExpression];
  v22 = [v21 isNotNull];
  v38[2] = v22;
  v23 = [v33 columnExpression];
  v24 = [v23 isNotNull];
  v38[3] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
  objc_super v26 = (void *)[v16 initWithExpressions:v25];

  id v27 = objc_alloc(MEMORY[0x1E4F60ED8]);
  v37[0] = v31;
  v37[1] = v26;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  v29 = (void *)[v27 initWithExpressions:v28];

  [v32 addCheckConstraintForExpression:v29];

  return v32;
}

+ (id)businessAddressesTableSchema
{
  v13[5] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"address" nullable:0];
  v13[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"business" nullable:0];
  v13[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"category" nullable:1];
  v13[2] = v5;
  id v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"last_modified" nullable:1];
  v13[3] = v6;
  id v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"last_bcs_sync" nullable:1];
  v13[4] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:5];
  v9 = (void *)[v2 initWithName:@"business_addresses" rowIDType:1 columns:v8];

  v12 = @"address";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [v9 addUniquenessConstraintForColumns:v10 conflictResolution:1];

  return v9;
}

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v6 = +[EDBusinessPersistence businessAddressesTableSchema];
  id v7 = +[EDBusinessPersistence businessCategoriesTableSchema];
  id v8 = [EDPersistenceAssociationPlaceholder alloc];
  v9 = [v6 columnForName:@"address"];
  v10 = +[EDMessagePersistence addressesTableName];
  v11 = [(EDPersistenceAssociationPlaceholder *)v8 initWithColumn:v9 tableName:v10];

  v12 = [EDPersistenceAssociationPlaceholder alloc];
  v13 = [v6 columnForName:@"business"];
  v14 = [(EDPersistenceAssociationPlaceholder *)v12 initWithColumn:v13 tableName:@"businesses"];

  v15 = [EDPersistenceAssociationPlaceholder alloc];
  id v16 = [v7 columnForName:@"business"];
  dispatch_queue_t v17 = [(EDPersistenceAssociationPlaceholder *)v15 initWithColumn:v16 tableName:@"businesses"];

  *a3 = (id)MEMORY[0x1E4F1CBF0];
  v21[0] = v11;
  v21[1] = v14;
  v21[2] = v17;
  *a4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  v20[0] = v6;
  v20[1] = v7;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];

  return v18;
}

+ (id)protectedTablesAndForeignKeysToResolve:(id *)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    *a3 = (id)MEMORY[0x1E4F1CBF0];
  }
  id v3 = +[EDBusinessPersistence businessesTableSchema];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)lastModifiedDateForAddressID:(int64_t)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  id v14 = 0;
  v4 = [(EDBusinessPersistence *)self database];
  v5 = [NSString stringWithUTF8String:"-[EDBusinessPersistence lastModifiedDateForAddressID:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__EDBusinessPersistence_lastModifiedDateForAddressID___block_invoke;
  v8[3] = &unk_1E6BFFE38;
  v8[4] = &v9;
  v8[5] = a3;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __54__EDBusinessPersistence_lastModifiedDateForAddressID___block_invoke(uint64_t a1, void *a2)
{
  v12[8] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"last_modified" table:@"business_addresses"];
  v5 = [MEMORY[0x1E4F60E78] column:@"address"];
  uint64_t v6 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  id v7 = [v5 equalTo:v6];
  [v4 setWhere:v7];

  id v11 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__EDBusinessPersistence_lastModifiedDateForAddressID___block_invoke_2;
  v12[3] = &unk_1E6BFF4C8;
  v12[4] = *(void *)(a1 + 32);
  LOBYTE(v6) = [v3 executeSelectStatement:v4 withBlock:v12 error:&v11];
  id v8 = v11;
  if ((v6 & 1) == 0)
  {
    uint64_t v9 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __54__EDBusinessPersistence_lastModifiedDateForAddressID___block_invoke_cold_1();
    }
  }
  return 1;
}

void __54__EDBusinessPersistence_lastModifiedDateForAddressID___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 dateValue];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)insertOrUpdateUserOverrideForAddressIDs:(id)a3 category:(unint64_t)a4 timestamp:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    v10 = [(EDBusinessPersistence *)self hookRegistry];
    [v10 persistenceWillChangeCategoryForAddressIDs:v8];

    id v11 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
    v12 = [(EDBusinessPersistence *)self database];
    v13 = [NSString stringWithUTF8String:"-[EDBusinessPersistence insertOrUpdateUserOverrideForAddressIDs:category:timestamp:]"];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __84__EDBusinessPersistence_insertOrUpdateUserOverrideForAddressIDs_category_timestamp___block_invoke;
    v22[3] = &unk_1E6BFFE60;
    id v14 = v11;
    v23 = v14;
    v24 = self;
    id v15 = v8;
    id v25 = v15;
    unint64_t v27 = a4;
    id v26 = v9;
    int v16 = objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v13, v22);

    if (v16)
    {
      dispatch_queue_t v17 = +[EDBusinessPersistence log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = EMStringFromCategoryType();
        *(_DWORD *)buf = 138543618;
        id v29 = v15;
        __int16 v30 = 2114;
        v31 = v18;
        _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_INFO, "Persisted category change addressIDs %{public}@, to categoryType:%{public}@", buf, 0x16u);
      }
      v19 = [(EDBusinessPersistence *)self hookRegistry];
      [v19 persistenceDidChangeCategoryForAddressIDs:v15 generationWindow:v14];
    }
    else
    {
      v20 = +[EDBusinessPersistence log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        dispatch_queue_t v21 = EMStringFromCategoryType();
        -[EDBusinessPersistence insertOrUpdateUserOverrideForAddressIDs:category:timestamp:]((uint64_t)v15, v21, (uint64_t)buf);
      }

      v19 = [(EDBusinessPersistence *)self hookRegistry];
      [v19 persistenceDidNotChangeCategoryForAddressIDs:v15];
    }
  }
}

uint64_t __84__EDBusinessPersistence_insertOrUpdateUserOverrideForAddressIDs_category_timestamp___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  uint64_t v4 = [*(id *)(a1 + 40) _updateBusinessAddressesCategoryColumnForAddressIDs:*(void *)(a1 + 48) category:*(void *)(a1 + 64) connection:v3 timestamp:*(void *)(a1 + 56)];

  return v4;
}

- (int64_t)businessIDForAddressID:(int64_t)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = *MEMORY[0x1E4F5FCC8];
  uint64_t v5 = [(EDBusinessPersistence *)self database];
  uint64_t v6 = [NSString stringWithUTF8String:"-[EDBusinessPersistence businessIDForAddressID:]"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__EDBusinessPersistence_businessIDForAddressID___block_invoke;
  v9[3] = &unk_1E6BFFE88;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = a3;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v9);

  int64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __48__EDBusinessPersistence_businessIDForAddressID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _findExistingBusinessForAddressID:*(void *)(a1 + 48) connection:v3];

  return 1;
}

- (int64_t)findOrCreateBusinessIDForAddress:(id)a3 addressID:(int64_t)a4 connection:(id)a5
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int64_t v10 = [(EDBusinessPersistence *)self _findExistingBusinessForAddressID:a4 connection:v9];
  if (v10 == *MEMORY[0x1E4F5FCC8])
  {
    id v11 = [(EDBusinessPersistence *)self businessQueryService];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      uint64_t v13 = [(EDBusinessPersistence *)self _bcsEmailIdentiferForAddress:v8];
      if (v13)
      {
        id v14 = [(EDBusinessPersistence *)self businessQueryService];
        id v15 = [v14 cachedBusinessMetadataForEmail:v13 error:0];

        if (v15)
        {

          int v16 = +[EDBusinessPersistence log];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            dispatch_queue_t v17 = (void *)MEMORY[0x1E4F60E00];
            v48 = [v15 businessId];
            id v47 = [v17 fullyOrPartiallyRedactedStringForString:v48];
            id v18 = v8;
            v19 = [v18 emailAddressValue];
            v20 = v19;
            if (v19)
            {
              dispatch_queue_t v21 = objc_msgSend(v19, "ef_publicDescription");
            }
            else
            {
              v45 = (void *)MEMORY[0x1E4F60E00];
              v46 = [v18 stringValue];
              dispatch_queue_t v21 = [v45 fullyOrPartiallyRedactedStringForString:v46];
            }
            *(_DWORD *)buf = 134218498;
            int64_t v52 = a4;
            __int16 v53 = 2114;
            int64_t v54 = (int64_t)v47;
            __int16 v55 = 2114;
            v56 = v21;
            _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "Finding or creating businessID for address %lld (brandID %{public}@): %{public}@", buf, 0x20u);
          }
LABEL_23:

          int64_t v10 = [(EDBusinessPersistence *)self _findOrCreateBusinessIDForAddress:v8 addressID:a4 businessMetadata:v15 connection:v9];
          goto LABEL_29;
        }
        v31 = [NSNumber numberWithLongLong:a4];
        v57 = v31;
        v58[0] = v8;
        uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:&v57 count:1];
        [(EDBusinessPersistence *)self fetchBusinessMetadataForAddresses:v32 completionHandler:0];
      }
    }
    int v16 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = v8;
      v34 = [v33 emailAddressValue];
      v35 = v34;
      if (v34)
      {
        v36 = objc_msgSend(v34, "ef_publicDescription");
      }
      else
      {
        v37 = (void *)MEMORY[0x1E4F60E00];
        v38 = [v33 stringValue];
        v36 = [v37 fullyOrPartiallyRedactedStringForString:v38];
      }
      *(_DWORD *)buf = 134218242;
      int64_t v52 = a4;
      __int16 v53 = 2114;
      int64_t v54 = (int64_t)v36;
      _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "Finding or creating businessID for address %lld: %{public}@", buf, 0x16u);
    }
    id v15 = 0;
    goto LABEL_23;
  }
  if ([(EDBusinessPersistence *)self _hasCompletedRecentBCSSyncForAddressID:a4 connection:v9])
  {
    id v15 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v8;
      v23 = [v22 emailAddressValue];
      v24 = v23;
      if (v23)
      {
        id v25 = objc_msgSend(v23, "ef_publicDescription");
      }
      else
      {
        v39 = (void *)MEMORY[0x1E4F60E00];
        v40 = [v22 stringValue];
        id v25 = [v39 fullyOrPartiallyRedactedStringForString:v40];
      }
      *(_DWORD *)buf = 134218498;
      int64_t v52 = v10;
      __int16 v53 = 2048;
      int64_t v54 = a4;
      __int16 v55 = 2114;
      v56 = v25;
      _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "Found existing businessID %lld for address %lld: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    id v26 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = v8;
      v28 = [v27 emailAddressValue];
      id v29 = v28;
      if (v28)
      {
        __int16 v30 = objc_msgSend(v28, "ef_publicDescription");
      }
      else
      {
        v41 = (void *)MEMORY[0x1E4F60E00];
        v42 = [v27 stringValue];
        __int16 v30 = [v41 fullyOrPartiallyRedactedStringForString:v42];
      }
      *(_DWORD *)buf = 134218498;
      int64_t v52 = v10;
      __int16 v53 = 2048;
      int64_t v54 = a4;
      __int16 v55 = 2114;
      v56 = v30;
      _os_log_impl(&dword_1DB39C000, v26, OS_LOG_TYPE_DEFAULT, "Checking for BCS update for existing businessID %lld for address %lld: %{public}@", buf, 0x20u);
    }
    id v15 = [NSNumber numberWithLongLong:a4];
    v49 = v15;
    id v50 = v8;
    v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    [(EDBusinessPersistence *)self fetchBusinessMetadataForAddresses:v43 completionHandler:0];
  }
LABEL_29:

  return v10;
}

- (int64_t)_findOrCreateBusinessIDForAddress:(id)a3 addressID:(int64_t)a4 businessMetadata:(id)a5 connection:(id)a6
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v10 = a5;
  id v56 = a6;
  int64_t v52 = v10;
  if (v10)
  {
    id v11 = [v10 businessId];
    int64_t v54 = [v10 localizedNames];
  }
  else
  {
    int64_t v54 = 0;
    id v11 = 0;
  }
  char v12 = v53;
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  uint64_t v14 = [v13 preferredGroupedSenderGrouping];

  id v58 = 0;
  id v15 = [(EDBusinessPersistence *)self _businessExternalIDForEmailAddress:v53 addressID:a4 brandID:v11 grouping:v14 businessIDsToCombine:&v58];
  id v55 = v58;
  int64_t v16 = [(EDBusinessPersistence *)self businessIDForBusinessExternalID:v15];
  int64_t v57 = v16;
  uint64_t v17 = *MEMORY[0x1E4F5FCC8];
  if (v16 == *MEMORY[0x1E4F5FCC8])
  {
    id v18 = [(EDBusinessPersistence *)self _persistedDisplayNameForExternalID:v15];
    if ([v55 count])
    {
      [(EDBusinessPersistence *)self _combineBusinesses:v55 connection:v56 newBusinessID:&v57];
      [(EDBusinessPersistence *)self _updateDisplayNameForBusinessID:v57 displayName:v18 connection:v56];
      v19 = +[EDBusinessPersistence log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v20 = v57;
        dispatch_queue_t v21 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:v18];
        id v22 = objc_msgSend(v15, "ef_publicDescription");
        *(_DWORD *)buf = 134218754;
        int64_t v62 = v20;
        __int16 v63 = 2114;
        v64 = v21;
        __int16 v65 = 2114;
        id v66 = v22;
        __int16 v67 = 2114;
        id v68 = v55;
        _os_log_impl(&dword_1DB39C000, v19, OS_LOG_TYPE_DEFAULT, "New businessID %lld with display name %{public}@ for external ID %{public}@ by combining businesIDs: %{public}@", buf, 0x2Au);

        char v12 = v53;
      }
      goto LABEL_31;
    }
    if (v11
      && (int64_t v27 = [(EDBusinessPersistence *)self _persistedBrandIDForString:v11],
          v27 != v16))
    {
      if ([v54 count])
      {
        id v31 = v54;
      }
      else
      {
        v59 = @"en";
        v51 = [v53 emailAddressValue];
        uint64_t v32 = [v51 displayName];
        id v33 = &stru_1F3583658;
        os_log_t loga = (os_log_t)v32;
        if (v32) {
          id v33 = (__CFString *)v32;
        }
        v60 = v33;
        uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];

        id v31 = (id)v34;
      }
      id v50 = v31;
      log = -[EDBusinessPersistence _persistedBrandNamesForDictionary:](self, "_persistedBrandNamesForDictionary:");
      int64_t v57 = -[EDBusinessPersistence _insertBusinessWithBrandID:localizedBrandNames:connection:](self, "_insertBusinessWithBrandID:localizedBrandNames:connection:", v27);
      v35 = +[EDBusinessPersistence log];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        id v47 = v35;
        v36 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:v11];
        v37 = objc_msgSend(v50, "ef_mapValues:", &__block_literal_global_76);
        *(_DWORD *)buf = 134218498;
        int64_t v62 = v57;
        __int16 v63 = 2114;
        v64 = v36;
        __int16 v65 = 2114;
        id v66 = v37;
        _os_log_impl(&dword_1DB39C000, v47, OS_LOG_TYPE_DEFAULT, "New businessID %lld for brandID %{public}@ with brand names: %{public}@", buf, 0x20u);

        v35 = v47;
      }
    }
    else
    {
      id v50 = [(EDBusinessPersistence *)self _persistedDomainForExternalID:v15];
      int64_t v57 = -[EDBusinessPersistence _insertBusinessWithDomain:displayName:connection:](self, "_insertBusinessWithDomain:displayName:connection:");
      v28 = +[EDBusinessPersistence log];
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      log = v28;
      id v29 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:v18];
      __int16 v30 = objc_msgSend(v15, "ef_publicDescription");
      *(_DWORD *)buf = 134218498;
      int64_t v62 = v57;
      __int16 v63 = 2114;
      v64 = v29;
      __int16 v65 = 2114;
      id v66 = v30;
      _os_log_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEFAULT, "New businessID %lld with display name %{public}@ for external ID %{public}@", buf, 0x20u);

      char v12 = v53;
    }
    v28 = log;
LABEL_28:

    if (v57 == v16 || !v15) {
      goto LABEL_32;
    }
    v19 = [(EDBusinessPersistence *)self hookRegistry];
    [v19 persistenceIsCreatingBusinessID:v57 withExternalBusinessID:v15];
LABEL_31:

LABEL_32:
    goto LABEL_33;
  }
  v23 = +[EDBusinessPersistence log];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_msgSend(v15, "ef_publicDescription");
    *(_DWORD *)buf = 134218498;
    int64_t v62 = v57;
    __int16 v63 = 2114;
    v64 = v24;
    __int16 v65 = 2114;
    id v66 = v55;
    _os_log_impl(&dword_1DB39C000, v23, OS_LOG_TYPE_DEFAULT, "Found existing businessID %lld for externalID %{public}@, businessIDs to combine: %{public}@", buf, 0x20u);

    char v12 = v53;
  }

  if ([v54 count])
  {
    id v18 = [(EDBusinessPersistence *)self businessDisplayNameForBusinessID:v57];
    v19 = [(EDBusinessPersistence *)self _persistedBrandNamesForDictionary:v54];
    if ((EFStringsAreEqual() & 1) == 0)
    {
      id v25 = +[EDBusinessPersistence log];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = objc_msgSend(v54, "ef_mapValues:", &__block_literal_global_76);
        *(_DWORD *)buf = 138543362;
        int64_t v62 = (int64_t)v26;
        _os_log_impl(&dword_1DB39C000, v25, OS_LOG_TYPE_DEFAULT, "Updating brand names to %{public}@", buf, 0xCu);
      }
      [(EDBusinessPersistence *)self _updateBrandNamesForBusinessID:v57 brandNames:v19 connection:v56];
    }
    goto LABEL_31;
  }
LABEL_33:
  if (v57 == v17)
  {
    v38 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      id v39 = v12;
      v40 = [v39 emailAddressValue];
      v41 = v40;
      if (v40)
      {
        v44 = objc_msgSend(v40, "ef_publicDescription");
      }
      else
      {
        v42 = (void *)MEMORY[0x1E4F60E00];
        v43 = [v39 stringValue];
        v44 = [v42 fullyOrPartiallyRedactedStringForString:v43];
      }
      *(_DWORD *)buf = 134218242;
      int64_t v62 = a4;
      __int16 v63 = 2114;
      v64 = v44;
      _os_log_error_impl(&dword_1DB39C000, v38, OS_LOG_TYPE_ERROR, "Failed to find or create businessID for address %lld: %{public}@", buf, 0x16u);
    }
    goto LABEL_39;
  }
  [(EDBusinessPersistence *)self _insertOrUpdateBusiness:v57 forAddress:a4 connection:v56];
  if (v11)
  {
    v38 = [NSNumber numberWithLongLong:a4];
    [(EDBusinessPersistence *)self _completedBCSSyncforAddressID:v38 connection:v56];
LABEL_39:
  }
  int64_t v45 = v57;

  return v45;
}

id __97__EDBusinessPersistence__findOrCreateBusinessIDForAddress_addressID_businessMetadata_connection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:a2];

  return v2;
}

- (int64_t)_findExistingBusinessForAddressID:(int64_t)a3 connection:(id)a4
{
  id v5 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = *MEMORY[0x1E4F5FCC8];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"business" table:@"business_addresses"];
  int64_t v7 = [MEMORY[0x1E4F60E78] column:@"address"];
  id v8 = [NSNumber numberWithLongLong:a3];
  id v9 = [v7 equalTo:v8];
  [v6 setWhere:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__EDBusinessPersistence__findExistingBusinessForAddressID_connection___block_invoke;
  v12[3] = &unk_1E6BFF4C8;
  v12[4] = &v13;
  [v5 executeSelectStatement:v6 withBlock:v12 error:0];
  int64_t v10 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v10;
}

void __70__EDBusinessPersistence__findExistingBusinessForAddressID_connection___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 databaseIDValue];
}

- (id)_findExistingBrandIDForBusinessID:(int64_t)a3 connection:(id)a4
{
  id v5 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__2;
  uint64_t v17 = __Block_byref_object_dispose__2;
  id v18 = 0;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"brand_id" table:@"businesses"];
  int64_t v7 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  id v8 = [NSNumber numberWithLongLong:a3];
  id v9 = [v7 equalTo:v8];
  [v6 setWhere:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__EDBusinessPersistence__findExistingBrandIDForBusinessID_connection___block_invoke;
  v12[3] = &unk_1E6BFF4C8;
  v12[4] = &v13;
  [v5 executeSelectStatement:v6 withBlock:v12 error:0];
  id v10 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v10;
}

void __70__EDBusinessPersistence__findExistingBrandIDForBusinessID_connection___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = +[EDBusinessPersistence brandIDForResultRow:](EDBusinessPersistence, "brandIDForResultRow:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (int64_t)_insertBusinessWithBrandID:(int64_t)a3 localizedBrandNames:(id)a4 connection:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"businesses"];
  id v10 = [NSNumber numberWithLongLong:a3];
  [v9 setObject:v10 forKeyedSubscript:@"brand_id"];
  [v9 setObject:v7 forKeyedSubscript:@"localized_brand_name"];
  id v25 = 0;
  int v11 = [v8 executeInsertStatement:v9 error:&v25];
  id v12 = v25;
  if (v11)
  {
    int64_t v13 = [v8 lastInsertedDatabaseID];
    uint64_t v14 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F60E00];
      uint64_t v16 = [v10 stringValue];
      uint64_t v17 = [v15 fullyOrPartiallyRedactedStringForString:v16];
      id v18 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:v7];
      *(_DWORD *)buf = 134218498;
      int64_t v27 = v13;
      __int16 v28 = 2114;
      id v29 = v17;
      __int16 v30 = 2114;
      id v31 = v18;
      _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Successfully inserted business with ID %lld, brandID %{public}@ (as int64), and brand names %{public}@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v14 = +[EDBusinessPersistence log];
    int64_t v13 = *MEMORY[0x1E4F5FCC8];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int64_t v20 = (void *)MEMORY[0x1E4F60E00];
      v24 = [v10 stringValue];
      objc_msgSend(v20, "fullyOrPartiallyRedactedStringForString:");
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      id v22 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:v7];
      v23 = objc_msgSend(v12, "ef_publicDescription");
      *(_DWORD *)buf = 138543874;
      int64_t v27 = (int64_t)v21;
      __int16 v28 = 2114;
      id v29 = v22;
      __int16 v30 = 2114;
      id v31 = v23;
      _os_log_error_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_ERROR, "Failed to insert business with brandID %{public}@ (as int64) and brand names %{public}@, due to error %{public}@", buf, 0x20u);
    }
  }

  return v13;
}

- (int64_t)_insertBusinessWithDomain:(id)a3 displayName:(id)a4 connection:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"businesses"];
  [v10 setObject:v7 forKeyedSubscript:@"domain"];
  [v10 setObject:v8 forKeyedSubscript:@"address_comment"];
  id v18 = 0;
  int v11 = [v9 executeInsertStatement:v10 error:&v18];
  id v12 = v18;
  if (v11)
  {
    int64_t v13 = [v9 lastInsertedDatabaseID];
    uint64_t v14 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:v7 maximumUnredactedLength:1];
      uint64_t v16 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:v8];
      *(_DWORD *)buf = 134218498;
      int64_t v20 = v13;
      __int16 v21 = 2114;
      id v22 = v15;
      __int16 v23 = 2114;
      v24 = v16;
      _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Successfully inserted business with ID %lld, domain %{public}@ and display name %{public}@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v14 = +[EDBusinessPersistence log];
    int64_t v13 = *MEMORY[0x1E4F5FCC8];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:v7 maximumUnredactedLength:1];
      objc_claimAutoreleasedReturnValue();
      [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:v8];
      objc_claimAutoreleasedReturnValue();
      -[EDBusinessPersistence _insertBusinessWithDomain:displayName:connection:]();
    }
  }

  return v13;
}

- (BOOL)_updateDisplayNameForBusinessID:(int64_t)a3 displayName:(id)a4 connection:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"businesses"];
  [v9 setObject:v7 forKeyedSubscript:@"address_comment"];
  id v10 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  int v11 = [NSNumber numberWithLongLong:a3];
  id v12 = [v10 equalTo:v11];
  [v9 setWhereClause:v12];

  id v17 = 0;
  int v13 = [v8 executeUpdateStatement:v9 error:&v17];
  id v14 = v17;
  if (v13)
  {
    uint64_t v15 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v19 = a3;
      _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "Successfully updated display name for business with ID %lld", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v15 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[EDBusinessPersistence _updateDisplayNameForBusinessID:displayName:connection:]();
    }
  }

  return v13;
}

- (BOOL)_updateBrandNamesForBusinessID:(int64_t)a3 brandNames:(id)a4 connection:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"businesses"];
  [v9 setObject:v7 forKeyedSubscript:@"localized_brand_name"];
  id v10 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  int v11 = [NSNumber numberWithLongLong:a3];
  id v12 = [v10 equalTo:v11];
  [v9 setWhereClause:v12];

  id v17 = 0;
  int v13 = [v8 executeUpdateStatement:v9 error:&v17];
  id v14 = v17;
  if (v13)
  {
    uint64_t v15 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v19 = a3;
      _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "Successfully updated brand names for business with ID %lld", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v15 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[EDBusinessPersistence _updateBrandNamesForBusinessID:brandNames:connection:]();
    }
  }

  return v13;
}

- (BOOL)_updateBusinessAddressesTableforBusinessID:(id)a3 newBusinessID:(id)a4 connection:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"business_addresses"];
  [v10 setObject:v8 forKeyedSubscript:@"business"];
  int v11 = [MEMORY[0x1E4F60E78] column:@"business"];
  id v12 = [v11 equalTo:v7];
  [v10 setWhereClause:v12];

  id v19 = 0;
  [v9 executeUpdateStatement:v10 error:&v19];
  id v13 = v19;
  id v18 = v13;
  int v14 = [v9 executeUpdateStatement:v10 error:&v18];
  id v15 = v18;

  if (v14)
  {
    uint64_t v16 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v7;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "Successfully updated business ID in business_addresses from %@ to %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v16 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[EDBusinessPersistence _updateBusinessAddressesTableforBusinessID:newBusinessID:connection:]();
    }
  }

  return v14;
}

- (BOOL)_completedBCSSyncforAddressID:(id)a3 connection:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"business_addresses"];
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = NSNumber;
  [v8 timeIntervalSince1970];
  id v10 = objc_msgSend(v9, "numberWithDouble:");
  [v7 setObject:v10 forKeyedSubscript:@"last_bcs_sync"];

  int v11 = [MEMORY[0x1E4F60E78] column:@"address"];
  id v12 = [v11 equalTo:v5];
  [v7 setWhereClause:v12];

  id v20 = 0;
  [v6 executeUpdateStatement:v7 error:&v20];
  id v13 = v20;
  id v19 = v13;
  int v14 = [v6 executeUpdateStatement:v7 error:&v19];
  id v15 = v19;

  if (v14)
  {
    uint64_t v16 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v5;
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "Successfully updated last BCS sync date for address ID %@ in business_addresses to %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v16 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v18 = objc_msgSend(v15, "ef_publicDescription");
      *(_DWORD *)buf = 138412802;
      id v22 = v5;
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      __int16 v25 = 2114;
      id v26 = v18;
      _os_log_error_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_ERROR, "Failed to update last BCS sync date for address ID %@ in business_addresses to %@, due to error %{public}@", buf, 0x20u);
    }
  }

  return v14;
}

- (BOOL)_deleteBusinessEntryForBusinessID:(id)a3 connection:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F60E98]);
  id v8 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  id v9 = [v8 equalTo:v5];
  id v10 = (void *)[v7 initWithTable:@"businesses" where:v9];

  id v15 = 0;
  int v11 = [v6 executeDeleteStatement:v10 error:&v15];
  id v12 = v15;
  if (v11)
  {
    id v13 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Successfully deleted old business ID: %@", buf, 0xCu);
    }
  }
  else
  {
    id v13 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[EDBusinessPersistence _deleteBusinessEntryForBusinessID:connection:]();
    }
  }

  return v11;
}

- (BOOL)_deleteBusinessAddressEntryForAddressID:(id)a3 connection:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F60E98]);
  id v8 = [MEMORY[0x1E4F60E78] column:@"address"];
  id v9 = [v8 equalTo:v5];
  id v10 = (void *)[v7 initWithTable:@"business_addresses" where:v9];

  id v15 = 0;
  int v11 = [v6 executeDeleteStatement:v10 error:&v15];
  id v12 = v15;
  if (v11)
  {
    id v13 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Successfully deleted unused address ID: %@", buf, 0xCu);
    }
  }
  else
  {
    id v13 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[EDBusinessPersistence _deleteBusinessAddressEntryForAddressID:connection:]();
    }
  }

  return v11;
}

- (int64_t)_businessIDForDomain:(id)a3 displayName:(id)a4 connection:(id)a5
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = *MEMORY[0x1E4F5FCC8];
  id v10 = objc_alloc(MEMORY[0x1E4F60EF8]);
  int v11 = [MEMORY[0x1E4F60E78] allColumns];
  id v12 = (void *)[v10 initWithResult:v11 table:@"businesses"];

  id v13 = (void *)MEMORY[0x1E4F60E48];
  int v14 = [MEMORY[0x1E4F60E78] column:@"domain"];
  id v15 = [v14 equalTo:v7];
  v27[0] = v15;
  uint64_t v16 = [MEMORY[0x1E4F60E78] column:@"address_comment"];
  id v17 = [v16 equalTo:v8];
  v27[1] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  id v19 = [v13 combined:v18];
  [v12 setWhere:v19];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __69__EDBusinessPersistence__businessIDForDomain_displayName_connection___block_invoke;
  v22[3] = &unk_1E6BFF4C8;
  void v22[4] = &v23;
  [v9 executeSelectStatement:v12 withBlock:v22 error:0];
  int64_t v20 = v24[3];

  _Block_object_dispose(&v23, 8);
  return v20;
}

void __69__EDBusinessPersistence__businessIDForDomain_displayName_connection___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F60D08]];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 databaseIDValue];
}

- (id)_businessIDsForHighLevelDomain:(id)a3 connection:(id)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v9 = [MEMORY[0x1E4F60E78] allColumns];
  id v10 = (void *)[v8 initWithResult:v9 table:@"businesses"];

  int v11 = (void *)MEMORY[0x1E4F60E48];
  id v12 = [MEMORY[0x1E4F60E78] column:@"domain"];
  id v13 = [v12 equalTo:v5];
  v22[0] = v13;
  int v14 = [MEMORY[0x1E4F60E78] column:@"address_comment"];
  id v15 = [v14 notEqualTo:&stru_1F3583658];
  v22[1] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  id v17 = [v11 combined:v16];
  [v10 setWhere:v17];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __67__EDBusinessPersistence__businessIDsForHighLevelDomain_connection___block_invoke;
  v20[3] = &unk_1E6BFF3B0;
  id v18 = v7;
  id v21 = v18;
  [v6 executeSelectStatement:v10 withBlock:v20 error:0];

  return v18;
}

void __67__EDBusinessPersistence__businessIDsForHighLevelDomain_connection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F60DF0];
  id v10 = v3;
  id v5 = [v3 objectForKeyedSubscript:@"address_comment"];
  id v6 = [v5 stringValue];
  id v7 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F60D08]];
  id v8 = [v7 numberValue];
  id v9 = [v4 pairWithFirst:v6 second:v8];

  [*(id *)(a1 + 32) addObject:v9];
}

- (id)_categoryOverridesForBusinessIDs:(id)a3 connection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__2;
  id v19 = __Block_byref_object_dispose__2;
  id v20 = (id)0xAAAAAAAAAAAAAAAALL;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v8 = [MEMORY[0x1E4F60E78] allColumns];
  id v9 = (void *)[v7 initWithResult:v8 table:@"business_categories"];

  id v10 = [MEMORY[0x1E4F60E78] column:@"business"];
  int v11 = [v10 in:v5];
  [v9 setWhere:v11];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__EDBusinessPersistence__categoryOverridesForBusinessIDs_connection___block_invoke;
  v14[3] = &unk_1E6BFF4C8;
  v14[4] = &v15;
  [v6 executeSelectStatement:v9 withBlock:v14 error:0];
  id v12 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v12;
}

void __69__EDBusinessPersistence__categoryOverridesForBusinessIDs_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = [a2 objectForKeyedSubscript:@"category"];
  id v3 = [v4 numberValue];
  [v2 addObject:v3];
}

- (BOOL)_setUserOverrideForBusinessID:(int64_t)a3 category:(unint64_t)a4 connection:(id)a5 timestamp:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  [(EDBusinessPersistence *)self _insertOrUpdateBusinessCategoriesCategoryColumnForBusinessID:a3 category:a4 connection:v10];
  id v12 = [(EDBusinessPersistence *)self addressIDsForBusinessID:a3 connection:v10];
  id v13 = [(EDBusinessPersistence *)self hookRegistry];
  [v13 persistenceWillChangeCategoryForAddressIDs:v12];

  BOOL v14 = [(EDBusinessPersistence *)self _updateBusinessAddressesCategoryColumnForAddressIDs:v12 category:a4 connection:v10 timestamp:v11];
  uint64_t v15 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
  -[EDPersistenceDatabaseGenerationWindow insertGeneration:](v15, "insertGeneration:", [v10 transactionGeneration]);
  if (v14)
  {
    uint64_t v16 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = EMStringFromCategoryType();
      int v22 = 138543618;
      uint64_t v23 = v12;
      __int16 v24 = 2114;
      uint64_t v25 = v17;
      _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_INFO, "Persisted category change addressIDs %{public}@, to categoryType:%{public}@", (uint8_t *)&v22, 0x16u);
    }
    id v18 = [(EDBusinessPersistence *)self hookRegistry];
    [v18 persistenceDidChangeCategoryForAddressIDs:v12 generationWindow:v15];
  }
  else
  {
    id v19 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = EMStringFromCategoryType();
      -[EDBusinessPersistence insertOrUpdateUserOverrideForAddressIDs:category:timestamp:]((uint64_t)v12, v20, (uint64_t)&v22);
    }

    id v18 = [(EDBusinessPersistence *)self hookRegistry];
    [v18 persistenceDidNotChangeCategoryForAddressIDs:v12];
  }

  return v14;
}

- (BOOL)_insertOrUpdateBusiness:(int64_t)a3 forAddress:(int64_t)a4 connection:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v9 = [MEMORY[0x1E4F60E78] column:@"category"];
  id v10 = (void *)[v8 initWithResult:v9 table:@"business_categories"];

  id v11 = [MEMORY[0x1E4F60E78] column:@"business"];
  id v12 = [NSNumber numberWithLongLong:a3];
  id v13 = [v11 equalTo:v12];
  [v10 setWhere:v13];

  [v10 setLimit:1];
  id v14 = objc_alloc(MEMORY[0x1E4F60F18]);
  v24[0] = @"address";
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  uint64_t v16 = (void *)[v14 initWithTable:@"business_addresses" conflictTarget:v15];

  uint64_t v17 = [NSNumber numberWithLongLong:a4];
  [v16 setObject:v17 forKeyedSubscript:@"address"];

  id v18 = [NSNumber numberWithLongLong:a3];
  [v16 setObject:v18 forKeyedSubscript:@"business"];

  [v16 setObject:v10 forKeyedSubscript:@"category"];
  id v23 = 0;
  char v19 = [v7 executeUpsertStatement:v16 error:&v23];
  id v20 = v23;
  if ((v19 & 1) == 0)
  {
    id v21 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[EDBusinessPersistence _insertOrUpdateBusiness:forAddress:connection:]();
    }
  }
  return v19;
}

- (void)countOfUserOverridesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  database = self->_database;
  id v6 = [NSString stringWithUTF8String:"-[EDBusinessPersistence countOfUserOverridesWithCompletionHandler:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__EDBusinessPersistence_countOfUserOverridesWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E6BFFED0;
  id v7 = v4;
  id v9 = v7;
  [(EDPersistenceDatabase *)database __performReadWithCaller:v6 usingBlock:v8];
}

uint64_t __67__EDBusinessPersistence_countOfUserOverridesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v5 = [MEMORY[0x1E4F60E40] count:0];
  id v6 = +[EDBusinessPersistence businessCategoriesTableName];
  id v7 = (void *)[v4 initWithResult:v5 table:v6];

  [v3 countForSelectStatement:v7];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return 1;
}

- (void)removeAllUserOverrides
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  database = self->_database;
  id v5 = [NSString stringWithUTF8String:"-[EDBusinessPersistence removeAllUserOverrides]"];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __47__EDBusinessPersistence_removeAllUserOverrides__block_invoke;
  id v11 = &unk_1E6BFF3D8;
  id v12 = self;
  id v6 = v3;
  id v13 = v6;
  [(EDPersistenceDatabase *)database __performWriteWithCaller:v5 usingBlock:&v8];

  id v7 = objc_alloc_init(getMCCSecretAgentControllerClass_0());
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v6, "timeIntervalSince1970", v8, v9, v10, v11, v12);
    objc_msgSend(v7, "clearAllUserOverridesWithTimestamp:completion:", &__block_literal_global_94_0);
  }
}

uint64_t __47__EDBusinessPersistence_removeAllUserOverrides__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _businessAddressMapWithCategoryOverrideWithConnection:v3];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__EDBusinessPersistence_removeAllUserOverrides__block_invoke_2;
  v12[3] = &unk_1E6BFFEF8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  uint64_t v16 = &v17;
  v12[4] = v6;
  id v13 = v7;
  id v8 = v3;
  id v14 = v8;
  id v15 = v5;
  id v9 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v12];
  uint64_t v10 = *((unsigned __int8 *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __47__EDBusinessPersistence_removeAllUserOverrides__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v27 = a3;
  __int16 v28 = v5;
  char v6 = objc_msgSend(*(id *)(a1 + 32), "_removeUserOverrideForBusinessID:timestamp:connection:", objc_msgSend(v5, "longLongValue"), *(void *)(a1 + 40), *(void *)(a1 + 48));
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  if (*(unsigned char *)(v7 + 24)) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v27;
  uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v9)
  {

LABEL_20:
    char v24 = [*(id *)(a1 + 32) _deleteBusinessEntryForBusinessID:v28 connection:*(void *)(a1 + 48)];
    uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8);
    if (*(unsigned char *)(v25 + 24)) {
      char v26 = v24;
    }
    else {
      char v26 = 0;
    }
    *(unsigned char *)(v25 + 24) = v26;
    goto LABEL_24;
  }
  char v30 = 1;
  uint64_t v10 = *(void *)v32;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v32 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * i);
      id v13 = objc_alloc(MEMORY[0x1E4F60EF8]);
      id v14 = [MEMORY[0x1E4F60E40] count:0];
      id v15 = +[EDMessagePersistence messagesTableName];
      uint64_t v16 = (void *)[v13 initWithResult:v14 table:v15];

      uint64_t v17 = (void *)MEMORY[0x1E4F60E78];
      id v18 = +[EDMessagePersistence messagesSenderColumnName];
      uint64_t v19 = [v17 column:v18];
      char v20 = [v19 equalTo:v12];
      [v16 setWhere:v20];

      if ([*(id *)(a1 + 48) countForSelectStatement:v16])
      {
        char v30 = 0;
      }
      else
      {
        char v21 = [*(id *)(a1 + 32) _deleteBusinessAddressEntryForAddressID:v12 connection:*(void *)(a1 + 48)];
        uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
        if (*(unsigned char *)(v22 + 24)) {
          char v23 = v21;
        }
        else {
          char v23 = 0;
        }
        *(unsigned char *)(v22 + 24) = v23;
        [*(id *)(a1 + 56) addObject:v28];
      }
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  }
  while (v9);

  if (v30) {
    goto LABEL_20;
  }
LABEL_24:
}

void __47__EDBusinessPersistence_removeAllUserOverrides__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __47__EDBusinessPersistence_removeAllUserOverrides__block_invoke_3_cold_1();
    }
  }
}

- (void)removeUserOverridesForBusinessIDs:(id)a3 timestamp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    database = self->_database;
    uint64_t v9 = [NSString stringWithUTF8String:"-[EDBusinessPersistence removeUserOverridesForBusinessIDs:timestamp:]"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__EDBusinessPersistence_removeUserOverridesForBusinessIDs_timestamp___block_invoke;
    void v10[3] = &unk_1E6BFF4F0;
    id v11 = v6;
    uint64_t v12 = self;
    id v13 = v7;
    [(EDPersistenceDatabase *)database __performWriteWithCaller:v9 usingBlock:v10];
  }
}

uint64_t __69__EDBusinessPersistence_removeUserOverridesForBusinessIDs_timestamp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        if (!objc_msgSend(*(id *)(a1 + 40), "_removeUserOverrideForBusinessID:timestamp:connection:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "longLongValue", (void)v10), *(void *)(a1 + 48), v3))
        {
          uint64_t v8 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 1;
LABEL_11:

  return v8;
}

- (BOOL)_removeUserOverrideForBusinessID:(int64_t)a3 timestamp:(id)a4 connection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!a3 || *MEMORY[0x1E4F5FCC8] == a3)
  {
    id v14 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[EDBusinessPersistence _removeUserOverrideForBusinessID:timestamp:connection:]();
    }
    LOBYTE(v18) = 0;
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F60E98]);
    long long v11 = [MEMORY[0x1E4F60E78] column:@"business"];
    long long v12 = [NSNumber numberWithLongLong:a3];
    long long v13 = [v11 equalTo:v12];
    id v14 = [v10 initWithTable:@"business_categories" where:v13];

    id v21 = 0;
    int v15 = [v9 executeDeleteStatement:v14 error:&v21];
    id v16 = v21;
    if (v15)
    {
      uint64_t v17 = [(EDBusinessPersistence *)self hookRegistry];
      [v17 persistenceDidChangeCategoryForBusiness:a3];
    }
    else
    {
      uint64_t v17 = +[EDBusinessPersistence log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[EDBusinessPersistence _removeUserOverrideForBusinessID:timestamp:connection:]((uint64_t)v16, a3, v17);
      }
    }

    uint64_t v19 = [(EDBusinessPersistence *)self addressIDsForBusinessID:a3 connection:v9];
    BOOL v18 = v15 & [(EDBusinessPersistence *)self _removeUserOverrideForAddressIDs:v19 timestamp:v8 connection:v9];
  }
  return v18;
}

- (void)removeUserOverrideForAddressIDs:(id)a3 timestamp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDBusinessPersistence *)self database];
  id v9 = [NSString stringWithUTF8String:"-[EDBusinessPersistence removeUserOverrideForAddressIDs:timestamp:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__EDBusinessPersistence_removeUserOverrideForAddressIDs_timestamp___block_invoke;
  v12[3] = &unk_1E6BFF4F0;
  v12[4] = self;
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v12);
}

uint64_t __67__EDBusinessPersistence_removeUserOverrideForAddressIDs_timestamp___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _removeUserOverrideForAddressIDs:*(void *)(a1 + 40) timestamp:*(void *)(a1 + 48) connection:a2];
}

- (BOOL)_removeUserOverrideForAddressIDs:(id)a3 timestamp:(id)a4 connection:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v11 = [(EDBusinessPersistence *)self hookRegistry];
    [v11 persistenceWillChangeCategoryForAddressIDs:v8];

    long long v12 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"business_addresses"];
    id v13 = [MEMORY[0x1E4F1CA98] null];
    [v12 setObject:v13 forKeyedSubscript:@"category"];

    id v14 = NSNumber;
    [v9 timeIntervalSince1970];
    int v15 = objc_msgSend(v14, "numberWithDouble:");
    [v12 setObject:v15 forKeyedSubscript:@"last_modified"];

    id v16 = [MEMORY[0x1E4F60E78] column:@"address"];
    uint64_t v17 = [v16 in:v8];
    [v12 setWhereClause:v17];

    id v24 = 0;
    int v18 = [v10 executeUpdateStatement:v12 error:&v24];
    id v19 = v24;
    char v20 = objc_alloc_init(EDPersistenceDatabaseGenerationWindow);
    -[EDPersistenceDatabaseGenerationWindow insertGeneration:](v20, "insertGeneration:", [v10 transactionGeneration]);
    if (v18)
    {
      id v21 = [(EDBusinessPersistence *)self hookRegistry];
      [v21 persistenceDidChangeCategoryForAddressIDs:v8 generationWindow:v20];
    }
    else
    {
      uint64_t v22 = +[EDBusinessPersistence log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[EDBusinessPersistence _removeUserOverrideForAddressIDs:timestamp:connection:]((uint64_t)v19, (uint64_t)v25, [v8 count]);
      }

      id v21 = [(EDBusinessPersistence *)self hookRegistry];
      [v21 persistenceDidNotChangeCategoryForAddressIDs:v8];
    }
  }
  else
  {
    LOBYTE(v18) = 1;
  }

  return v18;
}

- (void)insertOrUpdateUserOverrideForBusinessIDs:(id)a3 category:(unint64_t)a4 timestamp:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    database = self->_database;
    id v11 = [NSString stringWithUTF8String:"-[EDBusinessPersistence insertOrUpdateUserOverrideForBusinessIDs:category:timestamp:]"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__EDBusinessPersistence_insertOrUpdateUserOverrideForBusinessIDs_category_timestamp___block_invoke;
    v12[3] = &unk_1E6BFFF40;
    id v13 = v8;
    id v14 = self;
    unint64_t v16 = a4;
    id v15 = v9;
    [(EDPersistenceDatabase *)database __performWriteWithCaller:v11 usingBlock:v12];
  }
}

uint64_t __85__EDBusinessPersistence_insertOrUpdateUserOverrideForBusinessIDs_category_timestamp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        if (!objc_msgSend(*(id *)(a1 + 40), "_setUserOverrideForBusinessID:category:connection:timestamp:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "longLongValue", (void)v10), *(void *)(a1 + 56), v3, *(void *)(a1 + 48)))
        {
          uint64_t v8 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 1;
LABEL_11:

  return v8;
}

- (id)categoryTypeForBusinessID:(int64_t)a3
{
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x3032000000;
  long long v12 = __Block_byref_object_copy__2;
  long long v13 = __Block_byref_object_dispose__2;
  id v14 = 0;
  id v4 = [(EDBusinessPersistence *)self database];
  uint64_t v5 = [NSString stringWithUTF8String:"-[EDBusinessPersistence categoryTypeForBusinessID:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__EDBusinessPersistence_categoryTypeForBusinessID___block_invoke;
  v8[3] = &unk_1E6BFFE38;
  void v8[4] = &v9;
  v8[5] = a3;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __51__EDBusinessPersistence_categoryTypeForBusinessID___block_invoke(uint64_t a1, void *a2)
{
  v12[8] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"category" table:@"business_categories"];
  uint64_t v5 = [MEMORY[0x1E4F60E78] column:@"business"];
  uint64_t v6 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  uint64_t v7 = [v5 equalTo:v6];
  [v4 setWhere:v7];

  id v11 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__EDBusinessPersistence_categoryTypeForBusinessID___block_invoke_2;
  v12[3] = &unk_1E6BFF4C8;
  void v12[4] = *(void *)(a1 + 32);
  LOBYTE(v6) = [v3 executeSelectStatement:v4 withBlock:v12 error:&v11];
  id v8 = v11;
  if ((v6 & 1) == 0)
  {
    uint64_t v9 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __51__EDBusinessPersistence_categoryTypeForBusinessID___block_invoke_cold_1();
    }
  }
  return 1;
}

void __51__EDBusinessPersistence_categoryTypeForBusinessID___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 numberValue];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)categoryTypeForAddressID:(int64_t)a3
{
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x3032000000;
  long long v12 = __Block_byref_object_copy__2;
  long long v13 = __Block_byref_object_dispose__2;
  id v14 = 0;
  uint64_t v4 = [(EDBusinessPersistence *)self database];
  uint64_t v5 = [NSString stringWithUTF8String:"-[EDBusinessPersistence categoryTypeForAddressID:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__EDBusinessPersistence_categoryTypeForAddressID___block_invoke;
  v8[3] = &unk_1E6BFFE38;
  void v8[4] = &v9;
  v8[5] = a3;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __50__EDBusinessPersistence_categoryTypeForAddressID___block_invoke(uint64_t a1, void *a2)
{
  v12[8] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"category" table:@"business_addresses"];
  uint64_t v5 = [MEMORY[0x1E4F60E78] column:@"address"];
  uint64_t v6 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  id v7 = [v5 equalTo:v6];
  [v4 setWhere:v7];

  id v11 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__EDBusinessPersistence_categoryTypeForAddressID___block_invoke_2;
  v12[3] = &unk_1E6BFF4C8;
  void v12[4] = *(void *)(a1 + 32);
  LOBYTE(v6) = [v3 executeSelectStatement:v4 withBlock:v12 error:&v11];
  id v8 = v11;
  if ((v6 & 1) == 0)
  {
    uint64_t v9 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __50__EDBusinessPersistence_categoryTypeForAddressID___block_invoke_cold_1();
    }
  }
  return 1;
}

void __50__EDBusinessPersistence_categoryTypeForAddressID___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 numberValue];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)updatedCategoryForAddressID:(int64_t)a3 fromCategorizationResult:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a4 category];
  if (((_os_feature_enabled_impl() & 1) != 0
     || _os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
    && ([(EDBusinessPersistence *)self categoryTypeForAddressID:a3],
        (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F60230]), "initWithType:subtype:isHighImpact:state:", objc_msgSend(v7, "unsignedIntegerValue"), objc_msgSend(v6, "subtype"), objc_msgSend(v6, "isHighImpact"), 3);
  }
  else
  {
    if (v6)
    {
      id v9 = v6;
    }
    else
    {
      long long v10 = EDLibraryLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 134217984;
        int64_t v13 = a3;
        _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_INFO, "Missing category for addressID %lld. Adding a placeholder category", (uint8_t *)&v12, 0xCu);
      }

      id v9 = (id)[objc_alloc(MEMORY[0x1E4F60230]) initWithType:0 state:0];
    }
    id v8 = v9;
  }

  return v8;
}

- (BOOL)_updateBusinessAddressesCategoryColumnForAddressIDs:(id)a3 category:(unint64_t)a4 connection:(id)a5 timestamp:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  int v12 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"business_addresses"];
  int64_t v13 = [NSNumber numberWithUnsignedInteger:a4];
  [v12 setObject:v13 forKeyedSubscript:@"category"];

  uint64_t v14 = NSNumber;
  [v11 timeIntervalSince1970];
  uint64_t v15 = objc_msgSend(v14, "numberWithDouble:");
  [v12 setObject:v15 forKeyedSubscript:@"last_modified"];

  unint64_t v16 = [MEMORY[0x1E4F60E78] column:@"address"];
  uint64_t v17 = [v16 in:v9];
  [v12 setWhereClause:v17];

  id v23 = 0;
  char v18 = [v10 executeUpdateStatement:v12 error:&v23];
  id v19 = v23;
  if ((v18 & 1) == 0)
  {
    char v20 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = [v9 count];
      *(_DWORD *)buf = 134218498;
      unint64_t v25 = a4;
      __int16 v26 = 2048;
      uint64_t v27 = v22;
      __int16 v28 = 2114;
      id v29 = v19;
      _os_log_error_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_ERROR, "Failed to insert category %lu to business_addresses table for %lu address IDs due to error %{public}@", buf, 0x20u);
    }
  }
  return v18;
}

- (BOOL)_insertOrUpdateBusinessCategoriesCategoryColumnForBusinessID:(int64_t)a3 category:(unint64_t)a4 connection:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (!a3 || *MEMORY[0x1E4F5FCC8] == a3)
  {
    id v11 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[EDBusinessPersistence _removeUserOverrideForBusinessID:timestamp:connection:]();
    }
    LOBYTE(v14) = 0;
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F60F18]);
    v26[0] = @"business";
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    id v11 = [v9 initWithTable:@"business_categories" conflictTarget:v10];

    int v12 = [NSNumber numberWithLongLong:a3];
    [v11 setObject:v12 forKeyedSubscript:@"business"];

    int64_t v13 = [NSNumber numberWithUnsignedInteger:a4];
    [v11 setObject:v13 forKeyedSubscript:@"category"];

    id v19 = 0;
    int v14 = [v8 executeUpsertStatement:v11 error:&v19];
    id v15 = v19;
    if (v14)
    {
      unint64_t v16 = [(EDBusinessPersistence *)self hookRegistry];
      [v16 persistenceDidChangeCategoryForBusiness:a3];
    }
    else
    {
      unint64_t v16 = +[EDBusinessPersistence log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        char v18 = EMStringFromCategoryType();
        *(_DWORD *)buf = 134218498;
        int64_t v21 = a3;
        __int16 v22 = 2112;
        id v23 = v18;
        __int16 v24 = 2114;
        id v25 = v15;
        _os_log_error_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_ERROR, "Failed to insert business_categories entry for business ID: %lld, category: %@ due to error %{public}@", buf, 0x20u);
      }
    }
  }
  return v14;
}

- (id)addressIDsForBusinessID:(int64_t)a3 connection:(id)a4
{
  id v5 = a4;
  uint64_t v15 = 0;
  unint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  char v18 = __Block_byref_object_copy__2;
  id v19 = __Block_byref_object_dispose__2;
  id v20 = (id)0xAAAAAAAAAAAAAAAALL;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v7 = [MEMORY[0x1E4F60E78] allColumns];
  id v8 = (void *)[v6 initWithResult:v7 table:@"business_addresses"];

  id v9 = [MEMORY[0x1E4F60E78] column:@"business"];
  id v10 = [NSNumber numberWithLongLong:a3];
  id v11 = [v9 equalTo:v10];
  [v8 setWhere:v11];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__EDBusinessPersistence_addressIDsForBusinessID_connection___block_invoke;
  v14[3] = &unk_1E6BFF4C8;
  v14[4] = &v15;
  [v5 executeSelectStatement:v8 withBlock:v14 error:0];
  id v12 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v12;
}

void __60__EDBusinessPersistence_addressIDsForBusinessID_connection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"address"];
  id v4 = [v3 numberValue];

  if (v4) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
  }
}

- (id)addressesForBusinessID:(int64_t)a3
{
  id v5 = objc_opt_new();
  id v6 = [(EDBusinessPersistence *)self database];
  id v7 = [NSString stringWithUTF8String:"-[EDBusinessPersistence addressesForBusinessID:]"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __48__EDBusinessPersistence_addressesForBusinessID___block_invoke;
  v20[3] = &unk_1E6BFF360;
  void v20[4] = self;
  int64_t v22 = a3;
  id v8 = v5;
  id v21 = v8;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v20);

  id v9 = objc_opt_new();
  id v10 = [(EDBusinessPersistence *)self database];
  id v11 = [NSString stringWithUTF8String:"-[EDBusinessPersistence addressesForBusinessID:]"];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __48__EDBusinessPersistence_addressesForBusinessID___block_invoke_2;
  v17[3] = &unk_1E6BFF3D8;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  objc_msgSend(v10, "__performReadWithCaller:usingBlock:", v11, v17);

  int v14 = v19;
  id v15 = v13;

  return v15;
}

uint64_t __48__EDBusinessPersistence_addressesForBusinessID___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) addressIDsForBusinessID:*(void *)(a1 + 48) connection:a2];
  [*(id *)(a1 + 40) addObjectsFromArray:v3];

  return 1;
}

uint64_t __48__EDBusinessPersistence_addressesForBusinessID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v5 = [MEMORY[0x1E4F60E78] column:@"address"];
  id v6 = +[EDMessagePersistence addressesTableName];
  id v7 = (void *)[v4 initWithResult:v5 table:v6];

  id v8 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  id v9 = (uint64_t *)(a1 + 32);
  id v10 = [v8 in:*(void *)(a1 + 32)];
  [v7 setWhere:v10];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __48__EDBusinessPersistence_addressesForBusinessID___block_invoke_3;
  v17[3] = &unk_1E6BFF3B0;
  id v18 = *(id *)(a1 + 40);
  id v16 = 0;
  uint64_t v11 = [v3 executeSelectStatement:v7 withBlock:v17 error:&v16];
  id v12 = v16;
  if (v12)
  {
    id v13 = +[EDMessageRepository log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __48__EDBusinessPersistence_addressesForBusinessID___block_invoke_2_cold_1(v9, v13, v14);
    }
  }
  return v11;
}

void __48__EDBusinessPersistence_addressesForBusinessID___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"address"];
  id v4 = [v3 stringValue];

  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (id)businessAddressMapWithCategoryOverride
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__2;
  id v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  database = self->_database;
  id v4 = [NSString stringWithUTF8String:"-[EDBusinessPersistence businessAddressMapWithCategoryOverride]"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__EDBusinessPersistence_businessAddressMapWithCategoryOverride__block_invoke;
  v7[3] = &unk_1E6BFFF68;
  v7[4] = self;
  v7[5] = &v8;
  [(EDPersistenceDatabase *)database __performReadWithCaller:v4 usingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

BOOL __63__EDBusinessPersistence_businessAddressMapWithCategoryOverride__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _businessAddressMapWithCategoryOverrideWithConnection:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  BOOL v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
  return v7;
}

- (id)_businessAddressMapWithCategoryOverrideWithConnection:(id)a3
{
  id v3 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2;
  id v16 = __Block_byref_object_dispose__2;
  id v17 = (id)0xAAAAAAAAAAAAAAAALL;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v5 = [MEMORY[0x1E4F60E78] allColumns];
  id v6 = (void *)[v4 initWithResult:v5 table:@"business_addresses"];

  BOOL v7 = [MEMORY[0x1E4F60E78] column:@"category"];
  uint64_t v8 = [v7 isNotNull];
  [v6 setWhere:v8];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__EDBusinessPersistence__businessAddressMapWithCategoryOverrideWithConnection___block_invoke;
  v11[3] = &unk_1E6BFF4C8;
  v11[4] = &v12;
  [v3 executeSelectStatement:v6 withBlock:v11 error:0];
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v9;
}

void __79__EDBusinessPersistence__businessAddressMapWithCategoryOverrideWithConnection___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"address"];
  uint64_t v5 = [v4 numberValue];

  id v6 = [v3 objectForKeyedSubscript:@"business"];
  BOOL v7 = [v6 numberValue];

  if (v5 && v7)
  {
    uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v7];
    if (v8)
    {
      uint64_t v11 = v5;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
      uint64_t v10 = [v8 arrayByAddingObjectsFromArray:v9];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v10 forKeyedSubscript:v7];
    }
    else
    {
      v12[0] = v5;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v9 forKeyedSubscript:v7];
    }
  }
}

- (void)backfillBusinessesTables
{
  id v3 = [MEMORY[0x1E4F60D58] currentDevice];
  char v4 = [v3 isInternal];

  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__EDBusinessPersistence_backfillBusinessesTables__block_invoke;
    block[3] = &unk_1E6BFF2F0;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __49__EDBusinessPersistence_backfillBusinessesTables__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) database];
  id v22 = 0;
  uint64_t v14 = [v2 requestProtectedDatabaseBackgroundProcessingForDuration:&v22 error:1200.0];
  id v15 = v22;

  if (v15)
  {
    id v3 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      char v4 = [v15 description];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Business persistence failed to obtain background processing permission: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__2;
  __int16 v26 = __Block_byref_object_dispose__2;
  id v27 = (id)0xAAAAAAAAAAAAAAAALL;
  id v27 = objc_alloc_init(MEMORY[0x1E4F60DC0]);
  uint64_t v5 = [*(id *)(a1 + 32) database];
  id v6 = [NSString stringWithUTF8String:"-[EDBusinessPersistence backfillBusinessesTables]_block_invoke"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __49__EDBusinessPersistence_backfillBusinessesTables__block_invoke_2;
  v21[3] = &unk_1E6BFFFB8;
  void v21[4] = &buf;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v21);

  for (unint64_t i = 0; i < objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "count", v14); i += v8)
  {
    if (i + 50 >= [*(id *)(*((void *)&buf + 1) + 40) count]) {
      uint64_t v8 = [*(id *)(*((void *)&buf + 1) + 40) count] - i;
    }
    else {
      uint64_t v8 = 50;
    }
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", i, v8);
    uint64_t v10 = [*(id *)(a1 + 32) database];
    uint64_t v11 = [NSString stringWithUTF8String:"-[EDBusinessPersistence backfillBusinessesTables]_block_invoke"];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __49__EDBusinessPersistence_backfillBusinessesTables__block_invoke_2_105;
    v16[3] = &unk_1E6C00008;
    p_long long buf = &buf;
    uint64_t v20 = v8;
    id v12 = v9;
    uint64_t v13 = *(void *)(a1 + 32);
    id v17 = v12;
    uint64_t v18 = v13;
    objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, v16);
  }
  [v14 cancel];
  _Block_object_dispose(&buf, 8);
}

uint64_t __49__EDBusinessPersistence_backfillBusinessesTables__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"address" table:@"business_addresses"];
  id v26 = 0;
  uint64_t v5 = +[EDMessagePersistence selectAddressesStatementWithResultColumns:&v26];
  id v6 = v26;
  uint64_t v7 = *MEMORY[0x1E4F60D08];
  [v5 addResultColumn:*MEMORY[0x1E4F60D08]];
  uint64_t v8 = [MEMORY[0x1E4F60E78] column:v7];
  id v9 = [v8 notIn:v4];
  [v5 setWhere:v9];

  [v5 setLimit:1];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __49__EDBusinessPersistence_backfillBusinessesTables__block_invoke_3;
  v21[3] = &unk_1E6BFF4C8;
  void v21[4] = &v22;
  [v3 executeSelectStatement:v5 withBlock:v21 error:0];
  if (*((unsigned char *)v23 + 24))
  {
    [v5 setLimit:0];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __49__EDBusinessPersistence_backfillBusinessesTables__block_invoke_4;
    uint64_t v18 = &unk_1E6BFFF90;
    id v10 = v6;
    uint64_t v11 = *(void *)(a1 + 32);
    id v19 = v10;
    uint64_t v20 = v11;
    [v3 executeSelectStatement:v5 withBlock:&v15 error:0];
    id v12 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v28 = v13;
      _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "%lld addresses need business IDs.", buf, 0xCu);
    }
  }
  _Block_object_dispose(&v22, 8);

  return 1;
}

uint64_t __49__EDBusinessPersistence_backfillBusinessesTables__block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __49__EDBusinessPersistence_backfillBusinessesTables__block_invoke_4(uint64_t a1, void *a2)
{
  id v21 = a2;
  uint64_t v20 = [*(id *)(a1 + 32) second];
  id v3 = [v21 objectForKeyedSubscript:v20];
  char v4 = [v3 stringValue];
  uint64_t v5 = [*(id *)(a1 + 32) first];
  id v6 = [v21 objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 stringValue];
  id v8 = v4;
  id v9 = v7;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F60800]) initWithString:v8];
  [v10 setDisplayName:v9];
  uint64_t v11 = [v10 emailAddressValue];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    uint64_t v14 = [v10 stringValue];
    uint64_t v15 = (void *)v14;
    if (v14) {
      uint64_t v16 = (void *)v14;
    }
    else {
      uint64_t v16 = v8;
    }
    id v13 = v16;
  }
  id v17 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v18 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F60D08]];
  id v19 = [v18 numberValue];
  [v17 setOrAddObject:v13 forKey:v19];
}

uint64_t __49__EDBusinessPersistence_backfillBusinessesTables__block_invoke_2_105(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 protectedDatabaseAttached] & 1) == 0)
  {
    char v4 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __49__EDBusinessPersistence_backfillBusinessesTables__block_invoke_2_105_cold_1();
    }
  }
  uint64_t v5 = +[EDBusinessPersistence log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[7];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Backfilling %lld addresses without business IDs.", buf, 0xCu);
  }

  uint64_t v7 = *(void **)(*(void *)(a1[6] + 8) + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__EDBusinessPersistence_backfillBusinessesTables__block_invoke_106;
  v11[3] = &unk_1E6BFFFE0;
  uint64_t v8 = a1[4];
  v11[4] = a1[5];
  id v9 = v3;
  id v12 = v9;
  [v7 enumerateKeysAndObjectsAtIndexes:v8 options:0 usingBlock:v11];

  return 1;
}

void __49__EDBusinessPersistence_backfillBusinessesTables__block_invoke_106(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v6 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_insertOrUpdateBusiness:forAddress:connection:", objc_msgSend(*(id *)(a1 + 32), "findOrCreateBusinessIDForAddress:addressID:connection:", v6, objc_msgSend(v7, "longLongValue"), *(void *)(a1 + 40)), objc_msgSend(v7, "longLongValue"), *(void *)(a1 + 40));
}

+ (BOOL)_shouldUseGroupingSimpleAddressForEmailAddress:(id)a3 grouping:(int64_t)a4
{
  id v5 = a3;
  id v6 = [v5 emailAddressValue];
  uint64_t v7 = [v6 displayName];
  uint64_t v8 = (void *)v7;
  id v9 = &stru_1F3583658;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  id v10 = v9;

  uint64_t v11 = [v5 emailAddressValue];
  id v12 = [v11 highLevelDomainStrippingTopLevelDomain];

  BOOL v13 = +[EDBusinessPersistence _shouldUseSimpleAddressForHighLevelDomain:v12 displayName:v10 grouping:a4];
  return v13;
}

+ (BOOL)_hasCommonDomain:(id)a3
{
  id v3 = [a3 emailAddressValue];
  char v4 = [v3 highLevelDomainStrippingTopLevelDomain];

  id v5 = +[EDBusinessPersistence _commonDomains];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (BOOL)_shouldUseSimpleAddressForHighLevelDomain:(id)a3 displayName:(id)a4 grouping:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5 != 3
    && [v7 length]
    && (objc_msgSend(v8, "ef_stringByTrimmingWhitespaceAndNewlineCharacters"),
        id v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 length],
        v9,
        v10))
  {
    uint64_t v11 = +[EDBusinessPersistence _commonDomains];
    char v12 = [v11 containsObject:v7];
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

+ (id)_commonDomains
{
  if (_commonDomains_onceToken_0 != -1) {
    dispatch_once(&_commonDomains_onceToken_0, &__block_literal_global_109);
  }
  id v2 = (void *)_commonDomains_sCommonDomains_0;

  return v2;
}

void __39__EDBusinessPersistence__commonDomains__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F35BB3F0];
  os_log_t v1 = (void *)_commonDomains_sCommonDomains_0;
  _commonDomains_sCommonDomains_0 = v0;
}

- (BOOL)_combineBusinesses:(id)a3 connection:(id)a4 newBusinessID:(int64_t *)a5
{
  id v8 = a3;
  id v41 = a4;
  id v9 = [v8 firstObject];
  uint64_t v10 = [v9 longLongValue];
  int64_t v11 = *MEMORY[0x1E4F5FCC8];
  if (v10) {
    int64_t v12 = v10;
  }
  else {
    int64_t v12 = *MEMORY[0x1E4F5FCC8];
  }

  if ((unint64_t)[v8 count] > 1)
  {
    if (v12 == v11)
    {
      uint64_t v14 = [v8 objectAtIndexedSubscript:1];
      int64_t v12 = [v14 longLongValue];

      if (v12 == v11)
      {
        v37 = [MEMORY[0x1E4F28B00] currentHandler];
        [v37 handleFailureInMethod:a2 object:self file:@"EDBusinessPersistence.m" lineNumber:1142 description:@"Unable to find valid business ID to combine businesses into"];

        int64_t v12 = v11;
      }
    }
    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = [(EDBusinessPersistence *)self _categoryOverridesForBusinessIDs:v8 connection:v41];
    id v17 = [v15 setWithArray:v16];

    id v39 = v17;
    unint64_t v18 = [v17 count];
    if ([v17 count] == 1)
    {
      id v19 = [v17 allObjects];
      uint64_t v20 = [v19 firstObject];
      uint64_t v21 = [v20 unsignedIntegerValue];
      uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
      [(EDBusinessPersistence *)self _setUserOverrideForBusinessID:v12 category:v21 connection:v41 timestamp:v22];
    }
    v38 = a5;
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v24 = [v8 count];
      BOOL v13 = i >= v24;
      if (i >= v24) {
        break;
      }
      char v25 = [v8 objectAtIndexedSubscript:i];
      if ([v25 longLongValue] == v11)
      {
        if (i)
        {
          id v26 = +[EDBusinessPersistence log];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            -[EDBusinessPersistence _combineBusinesses:connection:newBusinessID:](&buf, v43, v26);
          }
        }
      }
      else
      {
        if (v18 < 2)
        {
          int v31 = 1;
        }
        else
        {
          id v27 = objc_alloc(MEMORY[0x1E4F60E98]);
          uint64_t v28 = [MEMORY[0x1E4F60E78] column:@"business"];
          uint64_t v29 = [v28 equalTo:v25];
          uint64_t v30 = (void *)[v27 initWithTable:@"business_categories" where:v29];

          int v31 = [v41 executeDeleteStatement:v30 error:0];
        }
        if ([v25 longLongValue] != v12)
        {
          if (v31)
          {
            long long v32 = [NSNumber numberWithLongLong:v12];
            BOOL v33 = [(EDBusinessPersistence *)self _updateBusinessAddressesTableforBusinessID:v25 newBusinessID:v32 connection:v41];

            LOBYTE(v31) = v33
                       && [(EDBusinessPersistence *)self _deleteBusinessEntryForBusinessID:v25 connection:v41];
          }
          long long v34 = [(EDBusinessPersistence *)self hookRegistry];
          objc_msgSend(v34, "persistenceIsMergingBusinessID:intoBusinessID:", objc_msgSend(v25, "longLongValue"), v12);
        }
        if ((v31 & 1) == 0)
        {
          v35 = +[EDBusinessPersistence log];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            -[EDBusinessPersistence _combineBusinesses:connection:newBusinessID:]();
          }

          break;
        }
      }
    }
    if (v38) {
      int64_t *v38 = v12;
    }
  }
  else
  {
    if (a5) {
      *a5 = v12;
    }
    BOOL v13 = 1;
  }

  return v13;
}

- (void)addressIDsWereDeleted:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"business" table:@"business_addresses"];
  id v9 = [MEMORY[0x1E4F60E78] column:@"address"];
  uint64_t v10 = [v9 in:v6];
  [v8 setWhere:v10];

  int64_t v11 = objc_opt_new();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __58__EDBusinessPersistence_addressIDsWereDeleted_connection___block_invoke;
  v18[3] = &unk_1E6BFF3B0;
  id v12 = v11;
  id v19 = v12;
  [v7 executeSelectStatement:v8 withBlock:v18 error:0];
  id v13 = objc_alloc(MEMORY[0x1E4F60E98]);
  uint64_t v14 = [MEMORY[0x1E4F60E78] column:@"address"];
  uint64_t v15 = [v14 in:v6];
  uint64_t v16 = (void *)[v13 initWithTable:@"business_addresses" where:v15];

  if (([v7 executeDeleteStatement:v16 error:0] & 1) == 0)
  {
    id v17 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[EDBusinessPersistence addressIDsWereDeleted:connection:]();
    }
  }
  [(EDBusinessPersistence *)self _removeOldBusinessIDs:v12 connection:v7];
}

void __58__EDBusinessPersistence_addressIDsWereDeleted_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [a2 objectAtIndexedSubscript:0];
  id v3 = [v4 numberValue];
  objc_msgSend(v2, "ef_addOptionalObject:", v3);
}

- (BOOL)_removeOldBusinessIDs:(id)a3 connection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"business" table:@"business_addresses"];
  [v7 setDistinct:1];
  id v8 = [MEMORY[0x1E4F60E78] column:@"business"];
  id v9 = [v8 in:v5];
  [v7 setWhere:v9];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __58__EDBusinessPersistence__removeOldBusinessIDs_connection___block_invoke;
  void v27[3] = &unk_1E6BFF3B0;
  id v10 = v5;
  id v28 = v10;
  [v6 executeSelectStatement:v7 withBlock:v27 error:0];
  int64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"business" table:@"business_categories"];

  id v12 = [MEMORY[0x1E4F60E78] column:@"business"];
  id v13 = [v12 in:v10];
  [v11 setWhere:v13];

  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  unint64_t v24 = __58__EDBusinessPersistence__removeOldBusinessIDs_connection___block_invoke_2;
  char v25 = &unk_1E6BFF3B0;
  id v14 = v10;
  id v26 = v14;
  [v6 executeSelectStatement:v11 withBlock:&v22 error:0];
  if (objc_msgSend(v14, "count", v22, v23, v24, v25))
  {
    id v15 = objc_alloc(MEMORY[0x1E4F60E98]);
    uint64_t v16 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
    id v17 = [v16 in:v14];
    unint64_t v18 = (void *)[v15 initWithTable:@"businesses" where:v17];

    char v19 = [v6 executeDeleteStatement:v18 error:0];
    if ((v19 & 1) == 0)
    {
      uint64_t v20 = +[EDBusinessPersistence log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[EDBusinessPersistence _removeOldBusinessIDs:connection:]();
      }
    }
  }
  else
  {
    char v19 = 1;
  }

  return v19;
}

void __58__EDBusinessPersistence__removeOldBusinessIDs_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [a2 objectAtIndexedSubscript:0];
  id v3 = [v4 numberValue];
  [v2 removeObject:v3];
}

void __58__EDBusinessPersistence__removeOldBusinessIDs_connection___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [a2 objectAtIndexedSubscript:0];
  id v3 = [v4 numberValue];
  [v2 removeObject:v3];
}

- (id)businessExternalIDForBusinessID:(int64_t)a3
{
  uint64_t v10 = 0;
  int64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__2;
  id v14 = __Block_byref_object_dispose__2;
  id v15 = 0;
  id v5 = [(EDBusinessPersistence *)self database];
  id v6 = [NSString stringWithUTF8String:"-[EDBusinessPersistence businessExternalIDForBusinessID:]"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__EDBusinessPersistence_businessExternalIDForBusinessID___block_invoke;
  v9[3] = &unk_1E6BFFE88;
  v9[5] = &v10;
  v9[6] = a3;
  v9[4] = self;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v9);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __57__EDBusinessPersistence_businessExternalIDForBusinessID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"domain" table:@"businesses"];
  [v4 addResultColumn:@"address_comment"];
  [v4 addResultColumn:@"brand_id"];
  id v5 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  uint64_t v6 = [NSNumber numberWithLongLong:*(void *)(a1 + 48)];
  id v7 = [v5 equalTo:v6];
  [v4 setWhere:v7];

  id v11 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __57__EDBusinessPersistence_businessExternalIDForBusinessID___block_invoke_2;
  v12[3] = &unk_1E6BFF208;
  long long v13 = *(_OWORD *)(a1 + 32);
  LOBYTE(v6) = [v3 executeSelectStatement:v4 withBlock:v12 error:&v11];
  id v8 = v11;
  if ((v6 & 1) == 0)
  {
    id v9 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __57__EDBusinessPersistence_businessExternalIDForBusinessID___block_invoke_cold_1();
    }
  }
  return 1;
}

void __57__EDBusinessPersistence_businessExternalIDForBusinessID___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 objectAtIndexedSubscript:0];
  id v4 = [v3 stringValue];

  id v5 = [v13 objectAtIndexedSubscript:1];
  uint64_t v6 = [v5 stringValue];

  id v7 = +[EDBusinessPersistence brandIDForResultRow:v13];
  id v8 = *(void **)(a1 + 32);
  id v9 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  uint64_t v10 = objc_msgSend(v8, "_externalIDForPersistedDomain:displayName:brandID:grouping:", v4, v6, v7, objc_msgSend(v9, "preferredGroupedSenderGrouping"));
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (int64_t)businessIDForBusinessExternalID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = *MEMORY[0x1E4F5FCC8];
  id v5 = [(EDBusinessPersistence *)self database];
  uint64_t v6 = [NSString stringWithUTF8String:"-[EDBusinessPersistence businessIDForBusinessExternalID:]"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__EDBusinessPersistence_businessIDForBusinessExternalID___block_invoke;
  void v10[3] = &unk_1E6BFF338;
  void v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  uint64_t v12 = &v13;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  int64_t v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __57__EDBusinessPersistence_businessIDForBusinessExternalID___block_invoke(uint64_t a1, void *a2)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v22 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v4 = (void *)[v3 initWithResultColumn:*MEMORY[0x1E4F60D08] table:@"businesses"];
  uint64_t v5 = [*(id *)(a1 + 32) _persistedBrandIDForExternalID:*(void *)(a1 + 40)];
  if (v5 == *MEMORY[0x1E4F5FCC8])
  {
    uint64_t v6 = [*(id *)(a1 + 32) _persistedDomainForExternalID:*(void *)(a1 + 40)];
    id v7 = [*(id *)(a1 + 32) _persistedDisplayNameForExternalID:*(void *)(a1 + 40)];
    int64_t v8 = (void *)MEMORY[0x1E4F60E48];
    id v9 = [MEMORY[0x1E4F60E78] column:@"domain"];
    uint64_t v10 = [v9 equalTo:v6];
    v25[0] = v10;
    id v11 = [MEMORY[0x1E4F60E78] column:@"address_comment"];
    uint64_t v12 = [v11 equalTo:v7];
    v25[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    uint64_t v14 = [v8 combined:v13];
    [v4 setWhere:v14];
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F60E78] column:@"brand_id"];
    uint64_t v16 = [NSNumber numberWithLongLong:v5];
    id v17 = [v15 equalTo:v16];
    [v4 setWhere:v17];
  }
  id v23 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = __57__EDBusinessPersistence_businessIDForBusinessExternalID___block_invoke_2;
  v24[3] = &unk_1E6BFF4C8;
  v24[4] = *(void *)(a1 + 48);
  char v18 = [v22 executeSelectStatement:v4 withBlock:v24 error:&v23];
  id v19 = v23;
  if ((v18 & 1) == 0)
  {
    uint64_t v20 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __57__EDBusinessPersistence_businessIDForBusinessExternalID___block_invoke_cold_1();
    }
  }
  return 1;
}

void __57__EDBusinessPersistence_businessIDForBusinessExternalID___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 databaseIDValue];
}

- (id)businessExternalIDForEmailAddress:(id)a3 grouping:(int64_t)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = *MEMORY[0x1E4F5FCC8];
  id v7 = [(EDBusinessPersistence *)self database];
  int64_t v8 = [NSString stringWithUTF8String:"-[EDBusinessPersistence businessExternalIDForEmailAddress:grouping:]"];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __68__EDBusinessPersistence_businessExternalIDForEmailAddress_grouping___block_invoke;
  uint64_t v15 = &unk_1E6BFFF68;
  id v17 = &v18;
  id v9 = v6;
  id v16 = v9;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, &v12);

  uint64_t v10 = -[EDBusinessPersistence _businessExternalIDForEmailAddress:addressID:brandID:grouping:businessIDsToCombine:](self, "_businessExternalIDForEmailAddress:addressID:brandID:grouping:businessIDsToCombine:", v9, v19[3], 0, a4, 0, v12, v13, v14, v15);

  _Block_object_dispose(&v18, 8);

  return v10;
}

uint64_t __68__EDBusinessPersistence_businessExternalIDForEmailAddress_grouping___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = +[EDMessagePersistence databaseIDForEmailAddress:*(void *)(a1 + 32) connection:v3];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == *MEMORY[0x1E4F5FCC8])
  {
    id v4 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E4F60E00], "ec_partiallyRedactedStringForAddress:", *(void *)(a1 + 32));
      objc_claimAutoreleasedReturnValue();
      __68__EDBusinessPersistence_businessExternalIDForEmailAddress_grouping___block_invoke_cold_1();
    }
  }
  return 1;
}

- (id)_businessExternalIDForEmailAddress:(id)a3 addressID:(int64_t)a4 brandID:(id)a5 grouping:(int64_t)a6 businessIDsToCombine:(id *)a7
{
  v44[4] = *(id *)MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  if (v13)
  {
    uint64_t v14 = [(EDBusinessPersistence *)self _externalIDForDomain:0 displayName:0 brandID:v13 simpleAddress:0 grouping:0];
    goto LABEL_35;
  }
  id v15 = v12;
  id v16 = [v15 emailAddressValue];
  id v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [v15 stringValue];
  }
  id v19 = v18;

  uint64_t v20 = [v19 emailAddressValue];
  uint64_t v21 = [v20 displayName];
  id v22 = (void *)v21;
  id v23 = &stru_1F3583658;
  if (v21) {
    id v23 = (__CFString *)v21;
  }
  v40 = v23;

  id v12 = v19;
  unint64_t v24 = [v12 emailAddressValue];
  char v25 = [v24 simpleAddress];
  id v26 = v25;
  if (v25)
  {
    id v42 = v25;
  }
  else
  {
    id v42 = [v12 stringValue];
  }

  id v27 = [v12 emailAddressValue];
  id v28 = [v27 highLevelDomainStrippingTopLevelDomain];

  if (v28)
  {
    id v29 = v28;
  }
  else
  {
    uint64_t v30 = [v12 emailAddressValue];
    uint64_t v31 = [v30 domainStrippingTopLevelDomain];
    long long v32 = (void *)v31;
    BOOL v33 = v40;
    if (v42) {
      BOOL v33 = v42;
    }
    if (v31) {
      BOOL v33 = (void *)v31;
    }
    id v29 = v33;
  }
  if (+[EDBusinessPersistence _shouldUseGroupingSimpleAddressForEmailAddress:grouping:](EDBusinessPersistence, "_shouldUseGroupingSimpleAddressForEmailAddress:grouping:", v12, a6, v40))
  {
    int64_t v34 = 3;
  }
  else
  {
    int64_t v34 = a6;
  }
  if (v34 != 1)
  {
    uint64_t v14 = -[EDBusinessPersistence _externalIDForDomain:displayName:brandID:simpleAddress:grouping:](self, "_externalIDForDomain:displayName:brandID:simpleAddress:grouping:", v29, v41, 0, v42);
    goto LABEL_29;
  }
  if (*MEMORY[0x1E4F5FCC8] == a4) {
    goto LABEL_32;
  }
  v44[0] = 0;
  uint64_t v14 = [(EDBusinessPersistence *)self _existingExternalIDForAddressID:a4 error:v44];
  id v35 = v44[0];
  uint64_t v36 = v35;
  if (v14 || !v35)
  {

    if (!v14) {
      goto LABEL_32;
    }
LABEL_29:
    id v38 = 0;
    if (!a7) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  v37 = +[EDBusinessPersistence log];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E4F60E00], "ec_partiallyRedactedStringForAddress:", v12);
    objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    -[EDBusinessPersistence _businessExternalIDForEmailAddress:addressID:brandID:grouping:businessIDsToCombine:]();
  }

LABEL_32:
  id v43 = 0;
  uint64_t v14 = [(EDBusinessPersistence *)self _externalIDWithCommonPrefixForHighLevelDomain:v29 displayName:v41 businessIDsToCombine:&v43];
  id v38 = v43;
  if (a7) {
LABEL_33:
  }
    *a7 = v38;
LABEL_34:

LABEL_35:

  return v14;
}

- (id)_existingExternalIDForAddressID:(int64_t)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__2;
  id v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2;
  id v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  id v7 = [(EDBusinessPersistence *)self database];
  int64_t v8 = [NSString stringWithUTF8String:"-[EDBusinessPersistence _existingExternalIDForAddressID:error:]"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__EDBusinessPersistence__existingExternalIDForAddressID_error___block_invoke;
  v11[3] = &unk_1E6C00030;
  v11[4] = self;
  void v11[5] = &v18;
  v11[6] = &v12;
  v11[7] = a3;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v11);

  if (a4) {
    *a4 = (id) v13[5];
  }
  id v9 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);

  return v9;
}

BOOL __63__EDBusinessPersistence__existingExternalIDForAddressID_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[7];
  uint64_t v6 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v4 _businessExternalIDForAddressID:v5 expectedGrouping:1 connection:v3 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = *(void *)(a1[5] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  BOOL v10 = *(void *)(*(void *)(a1[5] + 8) + 40) || !*(void *)(*(void *)(a1[6] + 8) + 40);
  return v10;
}

- (id)_businessExternalIDForAddressID:(int64_t)a3 expectedGrouping:(int64_t)a4 connection:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"domain" table:@"businesses"];
  [v11 addResultColumn:@"address_comment"];
  [v11 addResultColumn:@"brand_id"];
  id v12 = (id)[v11 join:@"business_addresses" sourceColumn:*MEMORY[0x1E4F60D08] targetColumn:@"business"];
  id v13 = [MEMORY[0x1E4F60E78] column:@"address"];
  uint64_t v14 = [NSNumber numberWithLongLong:a3];
  id v15 = [v13 equalTo:v14];
  [v11 setWhere:v15];

  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__2;
  unint64_t v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __91__EDBusinessPersistence__businessExternalIDForAddressID_expectedGrouping_connection_error___block_invoke;
  v19[3] = &unk_1E6C00058;
  v19[4] = self;
  v19[5] = &v20;
  v19[6] = a4;
  if ([v10 executeSelectStatement:v11 withBlock:v19 error:a6]) {
    id v16 = (void *)v21[5];
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;
  _Block_object_dispose(&v20, 8);

  return v17;
}

void __91__EDBusinessPersistence__businessExternalIDForAddressID_expectedGrouping_connection_error___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [v11 objectAtIndexedSubscript:0];
  id v4 = [v3 stringValue];

  uint64_t v5 = [v11 objectAtIndexedSubscript:1];
  uint64_t v6 = [v5 stringValue];

  uint64_t v7 = +[EDBusinessPersistence brandIDForResultRow:v11];
  uint64_t v8 = [*(id *)(a1 + 32) _externalIDForPersistedDomain:v4 displayName:v6 brandID:v7 grouping:*(void *)(a1 + 48)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)_externalIDWithCommonPrefixForHighLevelDomain:(id)a3 displayName:(id)a4 businessIDsToCombine:(id *)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    *a5 = 0;
  }
  id v10 = [(EDBusinessPersistence *)self _groupingTrieForHighLevelDomain:v8];
  unint64_t v11 = [v10 count];
  if (v11)
  {
    uint64_t v12 = *MEMORY[0x1E4F5FCC8];
    id v13 = [NSNumber numberWithLongLong:*MEMORY[0x1E4F5FCC8]];
    [v10 insertDisplayName:v9 addressID:v13];

    uint64_t v14 = [v10 findGroups];
    if ([v14 count] <= v11)
    {
      v43[0] = 0;
      v43[1] = v43;
      v43[2] = 0x2020000000;
      v43[3] = v12;
      uint64_t v21 = +[EDBusinessPersistence log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)uint8_t buf = 138412802;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        *(_WORD *)&buf[22] = 2112;
        int64_t v45 = v14;
        _os_log_debug_impl(&dword_1DB39C000, v21, OS_LOG_TYPE_DEBUG, "Grouping display name: %@, high level domain: %@, Created some groups: %@", buf, 0x20u);
      }

      *(void *)uint8_t buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      int64_t v45 = __Block_byref_object_copy__2;
      v46 = __Block_byref_object_dispose__2;
      id v47 = 0;
      uint64_t v37 = 0;
      id v38 = &v37;
      uint64_t v39 = 0x3032000000;
      v40 = __Block_byref_object_copy__2;
      id v41 = __Block_byref_object_dispose__2;
      id v42 = 0;
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      id v29 = __104__EDBusinessPersistence__externalIDWithCommonPrefixForHighLevelDomain_displayName_businessIDsToCombine___block_invoke;
      uint64_t v30 = &unk_1E6C00080;
      id v22 = v8;
      id v31 = v22;
      id v23 = v9;
      int64_t v34 = buf;
      id v35 = &v37;
      uint64_t v36 = v43;
      id v32 = v23;
      BOOL v33 = self;
      [v14 enumerateKeysAndObjectsUsingBlock:&v27];
      if (a5) {
        *a5 = (id) v38[5];
      }
      unint64_t v24 = *(void **)(*(void *)&buf[8] + 40);
      if (v24)
      {
        id v25 = v24;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F60218], "externalIDForHighLevelDomain:displayNameCommonPrefix:", v22, v23, v27, v28, v29, v30, v31);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v18 = v25;

      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(v43, 8);
    }
    else
    {
      id v15 = +[EDBusinessPersistence log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:v9];
        id v17 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:v8 maximumUnredactedLength:1];
        *(_DWORD *)uint8_t buf = 138543618;
        *(void *)&uint8_t buf[4] = v16;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v17;
        _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "New display name (%{public}@) is not a part of an existing group for high level domain (%{public}@), creating a new external ID", buf, 0x16u);
      }
      uint64_t v18 = [MEMORY[0x1E4F60218] externalIDForHighLevelDomain:v8 displayNameCommonPrefix:v9];
    }
  }
  else
  {
    id v19 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:v8 maximumUnredactedLength:1];
      *(_DWORD *)uint8_t buf = 138543362;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_impl(&dword_1DB39C000, v19, OS_LOG_TYPE_DEFAULT, "No current businesses found with this high level domain (%{public}@), creating a new external ID", buf, 0xCu);
    }
    uint64_t v18 = [MEMORY[0x1E4F60218] externalIDForHighLevelDomain:v8 displayNameCommonPrefix:v9];
  }

  return v18;
}

void __104__EDBusinessPersistence__externalIDWithCommonPrefixForHighLevelDomain_displayName_businessIDsToCombine___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = [v8 firstObject];
  uint64_t v10 = *MEMORY[0x1E4F5FCC8];
  unint64_t v11 = [NSNumber numberWithLongLong:*MEMORY[0x1E4F5FCC8]];
  int v12 = [v9 isEqual:v11];

  if (v12)
  {
    id v13 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:*(void *)(a1 + 32) maximumUnredactedLength:1];
      id v15 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:*(void *)(a1 + 40)];
      int v30 = 138543618;
      id v31 = v14;
      __int16 v32 = 2114;
      BOOL v33 = v15;
      _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Existing businesses for high level domain (%{public}@) will be merged under new display name (%{public}@)", (uint8_t *)&v30, 0x16u);
    }
    uint64_t v16 = [MEMORY[0x1E4F60218] externalIDForHighLevelDomain:*(void *)(a1 + 32) displayNameCommonPrefix:*(void *)(a1 + 40)];
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
    id v20 = v8;
    uint64_t v21 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v20;
LABEL_9:

    *a4 = 1;
    goto LABEL_10;
  }
  id v22 = [NSNumber numberWithLongLong:v10];
  int v23 = [v8 containsObject:v22];

  if (v23)
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = (int)[v7 intValue];
    unint64_t v24 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:*(void *)(a1 + 40)];
      id v26 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:*(void *)(a1 + 32) maximumUnredactedLength:1];
      uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      int v30 = 138543874;
      id v31 = v25;
      __int16 v32 = 2114;
      BOOL v33 = v26;
      __int16 v34 = 2048;
      uint64_t v35 = v27;
      _os_log_impl(&dword_1DB39C000, v24, OS_LOG_TYPE_DEFAULT, "New display name (%{public}@) for high level domain (%{public}@) is part of business: %lld", (uint8_t *)&v30, 0x20u);
    }
    uint64_t v28 = [*(id *)(a1 + 48) businessExternalIDForBusinessID:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    uint64_t v29 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v21 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;
    goto LABEL_9;
  }
LABEL_10:
}

- (id)_externalIDForPersistedDomain:(id)a3 displayName:(id)a4 brandID:(id)a5 grouping:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v10 emailAddressValue];
  uint64_t v14 = [v13 simpleAddress];

  int64_t v15 = 3;
  if (!v14) {
    int64_t v15 = a6;
  }
  if (v12) {
    int64_t v16 = 0;
  }
  else {
    int64_t v16 = v15;
  }
  uint64_t v17 = [(EDBusinessPersistence *)self _externalIDForDomain:v10 displayName:v11 brandID:v12 simpleAddress:v14 grouping:v16];

  return v17;
}

- (id)_persistedDomainForExternalID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 grouping];
  if ((unint64_t)(v4 - 1) < 2) {
    goto LABEL_4;
  }
  if (v4 == 3)
  {
    uint64_t v5 = [v3 simpleAddress];
    goto LABEL_6;
  }
  if (v4 == 4)
  {
LABEL_4:
    uint64_t v5 = [v3 highLevelDomain];
LABEL_6:
    uint64_t v6 = (__CFString *)v5;
    goto LABEL_8;
  }
  uint64_t v6 = &stru_1F3583658;
LABEL_8:

  return v6;
}

- (id)_persistedDisplayNameForExternalID:(id)a3
{
  id v3 = a3;
  if ((unint64_t)([v3 grouping] - 1) >= 2)
  {
    uint64_t v4 = &stru_1F3583658;
  }
  else
  {
    uint64_t v4 = [v3 displayName];
  }

  return v4;
}

- (int64_t)_persistedBrandIDForExternalID:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 grouping];
  if ((unint64_t)(v6 - 1) >= 4)
  {
    if (!v6)
    {
      id v7 = [v5 brandID];
      int64_t v3 = [(EDBusinessPersistence *)self _persistedBrandIDForString:v7];
    }
  }
  else
  {
    int64_t v3 = *MEMORY[0x1E4F5FCC8];
  }

  return v3;
}

- (int64_t)_persistedBrandIDForString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v3];
  uint64_t v9 = 0;
  if (([v4 scanUnsignedLongLong:&v9] & 1) == 0)
  {
    uint64_t v6 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[EDBusinessPersistence _persistedBrandIDForString:]();
    }
    goto LABEL_11;
  }
  if (v9 == -1)
  {
    uint64_t v6 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[EDBusinessPersistence _persistedBrandIDForString:]();
    }
    goto LABEL_11;
  }
  if (([v4 isAtEnd] & 1) == 0)
  {
    uint64_t v6 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[EDBusinessPersistence _persistedBrandIDForString:]();
    }
LABEL_11:

    id v5 = (int64_t *)MEMORY[0x1E4F5FCC8];
    goto LABEL_12;
  }
  id v5 = &v9;
LABEL_12:
  int64_t v7 = *v5;

  return v7;
}

- (id)_persistedBrandNamesForDictionary:(id)a3
{
  void v8[4] = *(id *)MEMORY[0x1E4F143B8];
  v8[0] = 0;
  id v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:0 error:v8];
  id v4 = v8[0];
  if (v4)
  {
    id v5 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDBusinessPersistence _persistedBrandNamesForDictionary:]();
    }

    uint64_t v6 = &stru_1F3583658;
  }
  else
  {
    uint64_t v6 = (__CFString *)[[NSString alloc] initWithData:v3 encoding:4];
  }

  return v6;
}

+ (id)_brandIDFromInteger:(int64_t)a3
{
  if (*MEMORY[0x1E4F5FCC8] == a3)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = EFStringWithUInt64();
  }

  return v3;
}

+ (id)brandIDForResultRow:(id)a3
{
  id v3 = a3;
  id v4 = +[EDBusinessPersistence businessesBrandIDColumnName];
  int v5 = [v3 columnExistsWithName:v4];

  if (v5)
  {
    uint64_t v6 = +[EDBusinessPersistence businessesBrandIDColumnName];
    int64_t v7 = [v3 objectForKeyedSubscript:v6];
    id v8 = [v7 numberValue];

    if (v8) {
      uint64_t v9 = [v8 longLongValue];
    }
    else {
      uint64_t v9 = *MEMORY[0x1E4F5FCC8];
    }
    id v10 = +[EDBusinessPersistence _brandIDFromInteger:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_externalIDForDomain:(id)a3 displayName:(id)a4 brandID:(id)a5 simpleAddress:(id)a6 grouping:(int64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  switch(a7)
  {
    case 0:
      uint64_t v15 = [MEMORY[0x1E4F60218] externalIDForBrandID:v13];
      goto LABEL_8;
    case 1:
      uint64_t v15 = [MEMORY[0x1E4F60218] externalIDForHighLevelDomain:v11 displayNameCommonPrefix:v12];
      goto LABEL_8;
    case 2:
      uint64_t v15 = [MEMORY[0x1E4F60218] externalIDForHighLevelDomain:v11 displayName:v12];
      goto LABEL_8;
    case 3:
      uint64_t v15 = [MEMORY[0x1E4F60218] externalIDForSimpleAddress:v14];
      goto LABEL_8;
    case 4:
      uint64_t v15 = [MEMORY[0x1E4F60218] externalIDForHighLevelDomain:v11];
LABEL_8:
      int64_t v16 = (void *)v15;
      break;
    default:
      int64_t v16 = 0;
      break;
  }

  return v16;
}

- (id)_groupingTrieForHighLevelDomain:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  int64_t v16 = __Block_byref_object_copy__2;
  uint64_t v17 = __Block_byref_object_dispose__2;
  id v18 = 0;
  int v5 = [(EDBusinessPersistence *)self database];
  uint64_t v6 = [NSString stringWithUTF8String:"-[EDBusinessPersistence _groupingTrieForHighLevelDomain:]"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__EDBusinessPersistence__groupingTrieForHighLevelDomain___block_invoke;
  void v10[3] = &unk_1E6C000A8;
  id v12 = &v13;
  void v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  if (objc_msgSend((id)v14[5], "ef_isEmpty"))
  {
    id v8 = 0;
  }
  else
  {
    id v8 = objc_alloc_init(EDDisplayNameGroupingTrie);
    [(EDDisplayNameGroupingTrie *)v8 insertDisplayNameAndIDPairs:v14[5]];
  }

  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __57__EDBusinessPersistence__groupingTrieForHighLevelDomain___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _businessIDsForHighLevelDomain:*(void *)(a1 + 40) connection:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 1;
}

- (void)fetchBusinessMetadataForAddresses:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v22 = [MEMORY[0x1E4F1CA48] array];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __77__EDBusinessPersistence_fetchBusinessMetadataForAddresses_completionHandler___block_invoke;
  v44[3] = &unk_1E6C000D0;
  v44[4] = self;
  id v9 = v22;
  id v45 = v9;
  id v10 = v23;
  id v46 = v10;
  id v11 = v8;
  id v47 = v11;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v44, v22);
  if ([v11 count])
  {
    id v12 = [(EDBusinessPersistence *)self database];
    uint64_t v13 = [NSString stringWithUTF8String:"-[EDBusinessPersistence fetchBusinessMetadataForAddresses:completionHandler:]"];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    void v41[2] = __77__EDBusinessPersistence_fetchBusinessMetadataForAddresses_completionHandler___block_invoke_156;
    v41[3] = &unk_1E6BFF3D8;
    id v14 = v11;
    id v42 = v14;
    id v43 = self;
    objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v13, v41);

    uint64_t v15 = [v14 count];
  }
  else
  {
    uint64_t v15 = 0;
  }
  if ([v10 count])
  {
    int64_t v16 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[EDBusinessPersistence fetchBusinessMetadataForAddresses:completionHandler:]();
    }

    uint64_t v35 = 0;
    uint64_t v36 = &v35;
    uint64_t v37 = 0x3032000000;
    id v38 = __Block_byref_object_copy__2;
    uint64_t v39 = __Block_byref_object_dispose__2;
    id v40 = (id)0xAAAAAAAAAAAAAAAALL;
    id v40 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v17 = [MEMORY[0x1E4F60E18] promise];
    id v18 = (void *)v36[5];
    uint64_t v19 = [v17 future];
    [v18 addObject:v19];

    id v20 = [(EDBusinessPersistence *)self businessQueryService];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __77__EDBusinessPersistence_fetchBusinessMetadataForAddresses_completionHandler___block_invoke_158;
    v32[3] = &unk_1E6C00148;
    __int16 v34 = &v35;
    v32[4] = self;
    id v33 = v10;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __77__EDBusinessPersistence_fetchBusinessMetadataForAddresses_completionHandler___block_invoke_161;
    v24[3] = &unk_1E6C001C0;
    id v21 = v17;
    id v25 = v21;
    id v31 = &v35;
    id v26 = v9;
    uint64_t v27 = self;
    id v30 = v7;
    id v28 = v6;
    id v29 = v11;
    [v20 fetchBusinessMetadataForEmails:v26 perItemCallback:v32 completion:v24];

    _Block_object_dispose(&v35, 8);
  }
  else if (v7)
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, v15);
  }
}

void __77__EDBusinessPersistence_fetchBusinessMetadataForAddresses_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] _bcsEmailIdentiferForAddress:v6];
  if (v7)
  {
    [a1[5] addObject:v7];
    id v8 = [v7 email];
    id v9 = [a1[6] objectForKeyedSubscript:v8];

    if (!v9)
    {
      id v10 = [MEMORY[0x1E4F1CA48] array];
      [a1[6] setObject:v10 forKeyedSubscript:v8];
    }
    id v11 = [a1[6] objectForKeyedSubscript:v8];
    id v12 = [MEMORY[0x1E4F60DF0] pairWithFirst:v6 second:v5];
    [v11 addObject:v12];
  }
  else
  {
    [a1[7] addObject:v5];
    uint64_t v13 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = v6;
      uint64_t v15 = [v14 emailAddressValue];
      int64_t v16 = v15;
      if (v15)
      {
        uint64_t v19 = objc_msgSend(v15, "ef_publicDescription");
      }
      else
      {
        uint64_t v17 = (void *)MEMORY[0x1E4F60E00];
        id v18 = [v14 stringValue];
        uint64_t v19 = [v17 fullyOrPartiallyRedactedStringForString:v18];
      }
      int v20 = 138543618;
      id v21 = v5;
      __int16 v22 = 2114;
      id v23 = v19;
      _os_log_error_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_ERROR, "Couldn't convert a Business Connect Identifier for address %{public}@: %{public}@", (uint8_t *)&v20, 0x16u);
    }
  }
}

uint64_t __77__EDBusinessPersistence_fetchBusinessMetadataForAddresses_completionHandler___block_invoke_156(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    LODWORD(v7) = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v7 = v7 & objc_msgSend(*(id *)(a1 + 40), "_completedBCSSyncforAddressID:connection:", *(void *)(*((void *)&v10 + 1) + 8 * i), v3, (void)v10);
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __77__EDBusinessPersistence_fetchBusinessMetadataForAddresses_completionHandler___block_invoke_158(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v10 = [MEMORY[0x1E4F60E18] promise];
  long long v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  long long v12 = [v10 future];
  [v11 addObject:v12];

  long long v13 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __77__EDBusinessPersistence_fetchBusinessMetadataForAddresses_completionHandler___block_invoke_2;
  v19[3] = &unk_1E6C00120;
  id v20 = *(id *)(a1 + 40);
  id v21 = v7;
  id v22 = v10;
  id v23 = v9;
  uint64_t v24 = *(void *)(a1 + 32);
  id v25 = v8;
  id v14 = v8;
  id v15 = v9;
  id v16 = v10;
  id v17 = v7;
  dispatch_async(v13, v19);

  return 1;
}

void __77__EDBusinessPersistence_fetchBusinessMetadataForAddresses_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 40);
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) email];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 56) code];
    BOOL v7 = v6 == getBCSErrorReturnedNoDataCode();
    id v8 = [*(id *)(a1 + 64) database];
    id v9 = [NSString stringWithUTF8String:"-[EDBusinessPersistence fetchBusinessMetadataForAddresses:completionHandler:]_block_invoke"];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __77__EDBusinessPersistence_fetchBusinessMetadataForAddresses_completionHandler___block_invoke_2_159;
    v16[3] = &unk_1E6C000F8;
    id v17 = v5;
    id v18 = *(id *)(a1 + 56);
    BOOL v22 = v7;
    id v10 = *(id *)(a1 + 72);
    uint64_t v11 = *(void *)(a1 + 64);
    id v19 = v10;
    uint64_t v20 = v11;
    id v21 = *(id *)(a1 + 48);
    objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v16);

    long long v12 = v17;
  }
  else
  {
    long long v13 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __77__EDBusinessPersistence_fetchBusinessMetadataForAddresses_completionHandler___block_invoke_2_cold_1(v2, v13, v14);
    }

    id v15 = *(void **)(a1 + 48);
    long long v12 = [MEMORY[0x1E4F1CA98] null];
    [v15 finishWithResult:v12];
  }
}

uint64_t __77__EDBusinessPersistence_fetchBusinessMetadataForAddresses_completionHandler___block_invoke_2_159(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v43 = a2;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (!v3)
  {
    uint64_t v5 = 1;
    goto LABEL_39;
  }
  uint64_t v44 = *(void *)v47;
  LOBYTE(v5) = 1;
  *(void *)&long long v4 = 138412802;
  long long v39 = v4;
  do
  {
    uint64_t v45 = v3;
    for (uint64_t i = 0; i != v45; ++i)
    {
      if (*(void *)v47 != v44) {
        objc_enumerationMutation(obj);
      }
      BOOL v7 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      id v8 = objc_msgSend(v7, "first", v39);
      id v9 = [v7 second];
      if (*(void *)(a1 + 40))
      {
        if (!*(unsigned char *)(a1 + 72))
        {
          id v10 = +[EDBusinessPersistence log];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            id v11 = v8;
            long long v12 = [v11 emailAddressValue];
            long long v13 = v12;
            if (v12)
            {
              id v16 = objc_msgSend(v12, "ef_publicDescription");
            }
            else
            {
              uint64_t v14 = (void *)MEMORY[0x1E4F60E00];
              id v15 = [v11 stringValue];
              id v16 = [v14 fullyOrPartiallyRedactedStringForString:v15];
            }
            id v34 = v16;
            uint64_t v35 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
            *(_DWORD *)uint8_t buf = v39;
            id v51 = v9;
            __int16 v52 = 2114;
            id v53 = v34;
            __int16 v54 = 2114;
            id v55 = v35;
            _os_log_error_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_ERROR, "Failed to fetch Business Connect metadata for addressID: %@ (%{public}@). Error: %{public}@", buf, 0x20u);
          }
          goto LABEL_20;
        }
LABEL_12:
        id v10 = +[EDBusinessPersistence log];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = v8;
          id v18 = [v17 emailAddressValue];
          id v19 = v18;
          if (v18)
          {
            uint64_t v20 = objc_msgSend(v18, "ef_publicDescription");
          }
          else
          {
            id v26 = (void *)MEMORY[0x1E4F60E00];
            uint64_t v27 = [v17 stringValue];
            uint64_t v20 = [v26 fullyOrPartiallyRedactedStringForString:v27];
          }
          *(_DWORD *)uint8_t buf = 138412546;
          id v51 = v9;
          __int16 v52 = 2114;
          id v53 = v20;
          _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "No business metadata returned for addressID: %@ (%{public}@)", buf, 0x16u);
        }
        goto LABEL_20;
      }
      if (*(unsigned char *)(a1 + 72)) {
        goto LABEL_12;
      }
      id v10 = +[EDBusinessPersistence log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = (void *)MEMORY[0x1E4F60E00];
        id v40 = [*(id *)(a1 + 48) businessId];
        objc_msgSend(v21, "fullyOrPartiallyRedactedStringForString:");
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        id v22 = v8;
        id v23 = [v22 emailAddressValue];
        uint64_t v24 = v23;
        if (v23)
        {
          id v25 = objc_msgSend(v23, "ef_publicDescription");
        }
        else
        {
          __int16 v32 = (void *)MEMORY[0x1E4F60E00];
          id v33 = [v22 stringValue];
          id v25 = [v32 fullyOrPartiallyRedactedStringForString:v33];
        }
        *(_DWORD *)uint8_t buf = 138543874;
        id v51 = v41;
        __int16 v52 = 2112;
        id v53 = v9;
        __int16 v54 = 2114;
        id v55 = v25;
        _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Fetched Business Connect metadata (brandID %{public}@) for addressID: %@ (%{public}@)", buf, 0x20u);
      }
LABEL_20:

      if (*(void *)(a1 + 48) || *(unsigned char *)(a1 + 72))
      {
        id v28 = [v8 emailAddressValue];
        id v29 = [v28 domain];
        BOOL v30 = v29 == 0;

        if (!v30)
        {
          id v31 = +[EDBusinessPersistence log];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint8_t buf = 138412290;
            id v51 = v9;
            _os_log_impl(&dword_1DB39C000, v31, OS_LOG_TYPE_DEFAULT, "Try to update business ID for address %@", buf, 0xCu);
          }

          if ((v5 & 1) == 0) {
            goto LABEL_29;
          }
          LOBYTE(v5) = objc_msgSend(*(id *)(a1 + 56), "_updateBusinessIDForAddress:addressID:emailItem:connection:", v8, objc_msgSend(v9, "longLongValue"), *(void *)(a1 + 48), v43);
        }
      }
      if (v5)
      {
        uint64_t v5 = [*(id *)(a1 + 56) _completedBCSSyncforAddressID:v9 connection:v43];
        goto LABEL_30;
      }
LABEL_29:
      uint64_t v5 = 0;
LABEL_30:
    }
    uint64_t v3 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
  }
  while (v3);
LABEL_39:

  uint64_t v36 = *(void **)(a1 + 64);
  uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
  [v36 finishWithResult:v37];

  return v5;
}

void __77__EDBusinessPersistence_fetchBusinessMetadataForAddresses_completionHandler___block_invoke_161(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v4 = *(void **)(a1 + 32);
  uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  [v4 finishWithResult:v5];

  uint64_t v6 = +[EDBusinessPersistence log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(a1 + 40) count];
    *(_DWORD *)uint8_t buf = 134217984;
    uint64_t v18 = v7;
    _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Completed call to fetchBusinessMetadataForEmails with %lld addresses", buf, 0xCu);
  }

  if (v3)
  {
    id v8 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __77__EDBusinessPersistence_fetchBusinessMetadataForAddresses_completionHandler___block_invoke_161_cold_1();
    }
  }
  id v9 = [MEMORY[0x1E4F60D70] join:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __77__EDBusinessPersistence_fetchBusinessMetadataForAddresses_completionHandler___block_invoke_163;
  v12[3] = &unk_1E6C00198;
  int8x16_t v11 = *(int8x16_t *)(a1 + 40);
  id v10 = (id)v11.i64[0];
  int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
  id v16 = *(id *)(a1 + 72);
  id v14 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 64);
  [v9 always:v12];
}

void __77__EDBusinessPersistence_fetchBusinessMetadataForAddresses_completionHandler___block_invoke_163(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__EDBusinessPersistence_fetchBusinessMetadataForAddresses_completionHandler___block_invoke_2_164;
  v3[3] = &unk_1E6C00170;
  id v4 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 64);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  dispatch_async(v2, v3);
}

void __77__EDBusinessPersistence_fetchBusinessMetadataForAddresses_completionHandler___block_invoke_2_164(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = +[EDBusinessPersistence log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "Finished writing + fetching metadata for %lld addresses", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 56);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, [*(id *)(a1 + 40) count] - objc_msgSend(*(id *)(a1 + 48), "count"));
  }
}

- (BOOL)_updateBusinessIDForAddress:(id)a3 addressID:(int64_t)a4 emailItem:(id)a5 connection:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v44 = v10;
  uint64_t v45 = v11;
  int64_t v13 = [(EDBusinessPersistence *)self _findExistingBusinessForAddressID:a4 connection:v12];
  uint64_t v14 = *MEMORY[0x1E4F5FCC8];
  if (v13 == *MEMORY[0x1E4F5FCC8])
  {
    long long v46 = 0;
  }
  else
  {
    long long v46 = [(EDBusinessPersistence *)self _findExistingBrandIDForBusinessID:v13 connection:v12];
  }
  id v15 = [v11 businessId];
  int v16 = EFStringsAreEqual();

  if (v16)
  {
    id v17 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint8_t buf = 134217984;
      int64_t v49 = a4;
      _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "Skipping update for address %lld, new brand ID matches existing one.", buf, 0xCu);
    }
    char v18 = 1;
    goto LABEL_21;
  }
  int64_t v19 = [(EDBusinessPersistence *)self _findOrCreateBusinessIDForAddress:v10 addressID:a4 businessMetadata:v11 connection:v12];
  int64_t v20 = v19;
  char v18 = v19 != v14;
  if (v19 != v14 && v13 != v19)
  {
    id v22 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint8_t buf = 134218496;
      int64_t v49 = a4;
      __int16 v50 = 2048;
      int64_t v51 = v13;
      __int16 v52 = 2048;
      int64_t v53 = v20;
      _os_log_impl(&dword_1DB39C000, v22, OS_LOG_TYPE_DEFAULT, "Updated businessID for addressID %lld from %lld to %lld", buf, 0x20u);
    }

    id v23 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v24 = [NSNumber numberWithLongLong:v13];
    uint64_t v42 = [v23 setWithObject:v24];

    [(EDBusinessPersistence *)self _removeOldBusinessIDs:v42 connection:v12];
    id v25 = (void *)MEMORY[0x1E4F1CAD0];
    id v26 = [NSNumber numberWithLongLong:v13];
    v47[0] = v26;
    uint64_t v27 = [NSNumber numberWithLongLong:v20];
    v47[1] = v27;
    id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
    id v29 = [(EDBusinessPersistence *)self _categoryOverridesForBusinessIDs:v28 connection:v12];
    id v43 = [v25 setWithArray:v29];

    unint64_t v30 = [v43 count];
    if ([v43 count] == 1)
    {
      id v41 = [v43 allObjects];
      id v31 = [v41 firstObject];
      uint64_t v32 = [v31 unsignedIntegerValue];
      id v33 = [MEMORY[0x1E4F1C9C8] date];
      char v18 = [(EDBusinessPersistence *)self _setUserOverrideForBusinessID:v20 category:v32 connection:v12 timestamp:v33];
    }
    else
    {
      if (v30 < 2)
      {
        char v18 = 1;
        goto LABEL_20;
      }
      id v34 = objc_alloc(MEMORY[0x1E4F60E98]);
      uint64_t v35 = [MEMORY[0x1E4F60E78] column:@"business"];
      uint64_t v36 = [NSNumber numberWithLongLong:v20];
      uint64_t v37 = [v35 equalTo:v36];
      id v41 = (void *)[v34 initWithTable:@"business_categories" where:v37];

      char v18 = [v12 executeDeleteStatement:v41 error:0];
    }

LABEL_20:
    id v38 = [(EDBusinessPersistence *)self hookRegistry];
    long long v39 = [NSNumber numberWithLongLong:a4];
    [v38 persistenceDidChangeBusinessIDForAddressID:v39 fromBusinessID:v13];

    id v17 = v42;
LABEL_21:
  }
  return v18;
}

- (id)_bcsEmailIdentiferForAddress:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 emailAddressValue];
  if (v4)
  {
    id v5 = objc_alloc(getBCSBusinessEmailIdentifierClass());
    id v6 = v4;
    uint64_t v7 = [v6 emailAddressValue];
    id v8 = [v7 simpleAddress];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [v6 stringValue];
    }
    int v16 = v10;

    id v17 = [v6 domain];
    char v18 = [v6 highLevelDomain];
    int64_t v19 = (void *)[v5 initWithEmail:v16 fullDomain:v17 topLevelDomain:v18];
  }
  else
  {
    id v11 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v3;
      int64_t v13 = [v12 emailAddressValue];
      uint64_t v14 = v13;
      if (v13)
      {
        id v15 = objc_msgSend(v13, "ef_publicDescription");
      }
      else
      {
        int64_t v20 = (void *)MEMORY[0x1E4F60E00];
        id v21 = [v12 stringValue];
        id v15 = [v20 fullyOrPartiallyRedactedStringForString:v21];
      }
      int v23 = 138543362;
      uint64_t v24 = v15;
      _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "Unable to fetch a business identifier for an invalid email address %{public}@", (uint8_t *)&v23, 0xCu);
    }
    int64_t v19 = 0;
  }

  return v19;
}

- (BOOL)_hasCompletedRecentBCSSyncForAddressID:(int64_t)a3 connection:(id)a4
{
  uint64_t v4 = [(EDBusinessPersistence *)self _lastBCSSyncForAddressID:a3 connection:a4];
  id v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_dateHoursAgo:", 24);
  char v6 = objc_msgSend(v4, "ef_isLaterThanDate:", v5);

  return v6;
}

- (id)_lastBCSSyncForAddressID:(int64_t)a3 connection:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  char v6 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"last_bcs_sync" table:@"business_addresses"];
  uint64_t v7 = [MEMORY[0x1E4F60E78] column:@"address"];
  uint64_t v8 = [NSNumber numberWithLongLong:a3];
  id v9 = [v7 equalTo:v8];
  [v6 setWhere:v9];

  uint64_t v18 = 0;
  int64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__2;
  id v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  id v16 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__EDBusinessPersistence__lastBCSSyncForAddressID_connection___block_invoke;
  v17[3] = &unk_1E6BFF4C8;
  void v17[4] = &v18;
  LOBYTE(v8) = [v5 executeSelectStatement:v6 withBlock:v17 error:&v16];
  id v10 = v16;
  if ((v8 & 1) == 0)
  {
    id v11 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDBusinessPersistence _lastBCSSyncForAddressID:connection:]();
    }
  }
  id v12 = (void *)v19[5];
  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  uint64_t v14 = v13;

  _Block_object_dispose(&v18, 8);

  return v14;
}

void __61__EDBusinessPersistence__lastBCSSyncForAddressID_connection___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 dateValue];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  char v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_addressesNeedingUpdateStatementOnlyCounts:(BOOL)a3
{
  BOOL v3 = a3;
  v33[2] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v5 = +[EDMessagePersistence addressesTableName];
  id v31 = (id)[v4 initWithTable:v5];

  if (v3)
  {
    char v6 = [MEMORY[0x1E4F60E40] count:0];
    [v31 addResult:v6 alias:0];

    uint64_t v7 = *MEMORY[0x1E4F60D08];
  }
  else
  {
    uint64_t v8 = +[EDMessagePersistence addressesTableAddressColumnName];
    [v31 addResultColumn:v8];

    id v9 = +[EDMessagePersistence addressesTableCommentColumnName];
    [v31 addResultColumn:v9];

    uint64_t v7 = *MEMORY[0x1E4F60D08];
    [v31 addResultColumn:*MEMORY[0x1E4F60D08]];
  }
  id v10 = (id)[v31 join:@"business_addresses" sourceColumn:v7 targetColumn:@"address"];
  unint64_t v30 = [MEMORY[0x1E4F60E78] table:@"business_addresses" column:@"business"];
  id v28 = [MEMORY[0x1E4F60E78] table:@"businesses" column:v7];
  id v11 = objc_msgSend(v30, "equalTo:");
  id v12 = (id)[v31 join:@"businesses" on:v11];

  id v13 = [MEMORY[0x1E4F60E78] column:@"last_bcs_sync"];
  id v29 = [v13 isNull];

  uint64_t v14 = (void *)MEMORY[0x1E4F60E48];
  id v15 = [MEMORY[0x1E4F60E78] column:@"brand_id"];
  id v16 = [v15 isNotNull];
  v33[0] = v16;
  id v17 = [MEMORY[0x1E4F60E78] column:@"last_bcs_sync"];
  uint64_t v18 = NSNumber;
  int64_t v19 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_dateHoursAgo:", 24);
  [v19 timeIntervalSince1970];
  uint64_t v20 = objc_msgSend(v18, "numberWithDouble:");
  id v21 = [v17 lessThanEqualTo:v20];
  v33[1] = v21;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  id v23 = [v14 combined:v22];

  uint64_t v24 = (void *)MEMORY[0x1E4F60ED8];
  v32[0] = v29;
  v32[1] = v23;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  id v26 = [v24 combined:v25];
  [v31 setWhere:v26];

  return v31;
}

- (unint64_t)countOfAddressesNeedingUpdate
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  BOOL v3 = [(EDBusinessPersistence *)self database];
  id v4 = [NSString stringWithUTF8String:"-[EDBusinessPersistence countOfAddressesNeedingUpdate]"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__EDBusinessPersistence_countOfAddressesNeedingUpdate__block_invoke;
  v7[3] = &unk_1E6BFF400;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v3, "__performReadWithCaller:usingBlock:", v4, v7);

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __54__EDBusinessPersistence_countOfAddressesNeedingUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _addressesNeedingUpdateStatementOnlyCounts:1];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 countForSelectStatement:v4];

  return 1;
}

- (void)iterateAddressesNeedingUpdateWithCancelationToken:(id)a3 handler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__2;
  id v29 = __Block_byref_object_dispose__2;
  id v30 = 0;
  uint64_t v10 = [(EDBusinessPersistence *)self database];
  uint64_t v11 = [NSString stringWithUTF8String:"-[EDBusinessPersistence iterateAddressesNeedingUpdateWithCancelationToken:handler:]"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83__EDBusinessPersistence_iterateAddressesNeedingUpdateWithCancelationToken_handler___block_invoke;
  v19[3] = &unk_1E6C00210;
  SEL v24 = a2;
  id v12 = v7;
  id v20 = v12;
  id v21 = self;
  id v13 = v9;
  id v22 = v13;
  id v23 = &v25;
  objc_msgSend(v10, "__performReadWithCaller:usingBlock:", v11, v19);

  if (v26[5])
  {
    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
  else
  {
    uint64_t v14 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v13 count];
      *(_DWORD *)uint8_t buf = 134217984;
      uint64_t v32 = v15;
      _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "%lu addresses need an updated brand ID.", buf, 0xCu);
    }

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __83__EDBusinessPersistence_iterateAddressesNeedingUpdateWithCancelationToken_handler___block_invoke_167;
    v16[3] = &unk_1E6C00238;
    id v17 = v12;
    id v18 = v8;
    [v13 enumerateObjectsUsingBlock:v16];
  }
  _Block_object_dispose(&v25, 8);
}

uint64_t __83__EDBusinessPersistence_iterateAddressesNeedingUpdateWithCancelationToken_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 protectedDatabaseAttached])
  {
    if ([*(id *)(a1 + 32) isCanceled])
    {
      id v4 = +[EDBusinessPersistence log];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint8_t buf = 0;
        _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Addresses enumeration canceled before first run", buf, 2u);
      }
    }
    else
    {
      unint64_t v5 = [*(id *)(a1 + 40) _addressesNeedingUpdateStatementOnlyCounts:0];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __83__EDBusinessPersistence_iterateAddressesNeedingUpdateWithCancelationToken_handler___block_invoke_166;
      v9[3] = &unk_1E6C001E8;
      uint64_t v10 = *(id *)(a1 + 32);
      id v11 = *(id *)(a1 + 48);
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
      id obj = *(id *)(v6 + 40);
      [v3 executeSelectStatement:v5 withBlock:v9 error:&obj];
      objc_storeStrong((id *)(v6 + 40), obj);

      id v4 = v10;
    }
  }
  else
  {
    id v4 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      objc_claimAutoreleasedReturnValue();
      __83__EDBusinessPersistence_iterateAddressesNeedingUpdateWithCancelationToken_handler___block_invoke_cold_1();
    }
  }

  return 1;
}

void __83__EDBusinessPersistence_iterateAddressesNeedingUpdateWithCancelationToken_handler___block_invoke_166(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = +[EDMessagePersistence addressesTableCommentColumnName];
  id v8 = [v6 objectForKeyedSubscript:v7];
  id v9 = [v8 stringValue];

  uint64_t v10 = +[EDMessagePersistence addressesTableAddressColumnName];
  id v11 = [v6 objectForKeyedSubscript:v10];
  id v12 = [v11 stringValue];

  id v13 = v12;
  id v14 = v9;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F60800]) initWithString:v13];
  [v15 setDisplayName:v14];
  id v16 = [v15 emailAddressValue];
  id v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    uint64_t v19 = [v15 stringValue];
    id v20 = (void *)v19;
    if (v19) {
      id v21 = (void *)v19;
    }
    else {
      id v21 = v13;
    }
    id v18 = v21;
  }
  id v22 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F60D08]];
  id v23 = [v22 numberValue];

  if ([*(id *)(a1 + 32) isCanceled])
  {
    SEL v24 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v26 = 0;
      _os_log_impl(&dword_1DB39C000, v24, OS_LOG_TYPE_DEFAULT, "Addresses enumeration canceled", v26, 2u);
    }

    *a4 = 1;
  }
  uint64_t v25 = [MEMORY[0x1E4F60DF0] pairWithFirst:v23 second:v18];
  [*(id *)(a1 + 40) addObject:v25];
}

void __83__EDBusinessPersistence_iterateAddressesNeedingUpdateWithCancelationToken_handler___block_invoke_167(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) isCanceled])
  {
    id v7 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Addresses enumeration canceled", v11, 2u);
    }

    *a4 = 1;
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [v6 first];
    uint64_t v10 = [v6 second];
    (*(void (**)(uint64_t, void *, void *, void))(v8 + 16))(v8, v9, v10, 0);
  }
}

- (id)businessDisplayNameForBusinessID:(int64_t)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__2;
  id v14 = __Block_byref_object_dispose__2;
  id v15 = 0;
  unint64_t v5 = [(EDBusinessPersistence *)self database];
  id v6 = [NSString stringWithUTF8String:"-[EDBusinessPersistence businessDisplayNameForBusinessID:]"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__EDBusinessPersistence_businessDisplayNameForBusinessID___block_invoke;
  v9[3] = &unk_1E6BFFE88;
  v9[5] = &v10;
  v9[6] = a3;
  void v9[4] = self;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v9);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __58__EDBusinessPersistence_businessDisplayNameForBusinessID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F60E78] table:@"businesses" column:@"localized_brand_name"];
  unint64_t v5 = (void *)MEMORY[0x1E4F60EA8];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F60E78]) initWithName:@"address_comment" table:@"businesses"];
  id v7 = [v5 jsonObject:v6 key:@"en"];

  uint64_t v8 = [MEMORY[0x1E4F60EA8] ifNull:v4 second:v7];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResult:v8 table:@"businesses"];
  uint64_t v10 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  uint64_t v11 = [NSNumber numberWithLongLong:*(void *)(a1 + 48)];
  uint64_t v12 = [v10 equalTo:v11];
  [v9 setWhere:v12];

  id v16 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__EDBusinessPersistence_businessDisplayNameForBusinessID___block_invoke_2;
  v17[3] = &unk_1E6BFF208;
  long long v18 = *(_OWORD *)(a1 + 32);
  LOBYTE(v11) = [v3 executeSelectStatement:v9 withBlock:v17 error:&v16];
  id v13 = v16;
  if ((v11 & 1) == 0)
  {
    id v14 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __58__EDBusinessPersistence_businessDisplayNameForBusinessID___block_invoke_cold_1();
    }
  }
  return 1;
}

void __58__EDBusinessPersistence_businessDisplayNameForBusinessID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v10 = v3;
  unint64_t v5 = [v3 objectAtIndexedSubscript:0];
  id v6 = [v5 stringValue];
  uint64_t v7 = [v4 _localizedStringFromJSONString:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)_localizedStringFromJSONString:(id)a3
{
  v11[4] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = [a3 dataUsingEncoding:4];
  v11[0] = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v3 options:0 error:v11];
  id v5 = v11[0];
  if (v5)
  {
    id v6 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDBusinessPersistence _localizedStringFromJSONString:]();
    }
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F237E8]) initWithLocalizedStrings:v4];
    id v6 = [v8 localizedString];

    if ([v6 length]) {
      id v9 = v6;
    }
    else {
      id v9 = 0;
    }
    uint64_t v7 = v9;
  }

  return v7;
}

- (void)persistenceWillAddProtectedDatabaseIDsFromJournal:(id)a3 andReplaceJournalDatabaseIDsWithProtectedDatabaseIDs:(id)a4 forTable:(id)a5
{
  id v13 = a3;
  id v6 = a5;
  if ((_os_feature_enabled_impl() & 1) != 0 && [v6 isEqualToString:@"businesses"])
  {
    uint64_t v7 = [MEMORY[0x1E4F29060] currentThread];
    uint64_t v8 = [v7 threadDictionary];
    id v9 = [v8 objectForKeyedSubscript:@"EDBusinessPersistence.reconciledBusinessIDs"];

    if (v9)
    {
      [v9 addIndexes:v13];
    }
    else
    {
      id v10 = (void *)[v13 mutableCopy];
      uint64_t v11 = [MEMORY[0x1E4F29060] currentThread];
      uint64_t v12 = [v11 threadDictionary];
      [v12 setObject:v10 forKeyedSubscript:@"EDBusinessPersistence.reconciledBusinessIDs"];
    }
  }
}

- (void)persistenceDidReconcileProtectedData
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    id v3 = [MEMORY[0x1E4F29060] currentThread];
    id v4 = [v3 threadDictionary];
    id v14 = [v4 objectForKeyedSubscript:@"EDBusinessPersistence.reconciledBusinessIDs"];

    id v5 = [MEMORY[0x1E4F29060] currentThread];
    id v6 = [v5 threadDictionary];
    [v6 setObject:0 forKeyedSubscript:@"EDBusinessPersistence.reconciledBusinessIDs"];

    if ([v14 count])
    {
      [(EDBusinessPersistence *)self _highLevelDomainsForBusinessIDs:v14];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v19;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v19 != v8) {
              objc_enumerationMutation(obj);
            }
            uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * v9);
            uint64_t v11 = [(EDBusinessPersistence *)self database];
            uint64_t v12 = [NSString stringWithUTF8String:"-[EDBusinessPersistence persistenceDidReconcileProtectedData]"];
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __61__EDBusinessPersistence_persistenceDidReconcileProtectedData__block_invoke;
            v17[3] = &unk_1E6BFF360;
            void v17[4] = self;
            void v17[5] = v10;
            v17[6] = a2;
            objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v17);

            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v7);
      }

      id v13 = [(EDBusinessPersistence *)self hookRegistry];
      [v13 persistenceDidFinishMergingBusinessesAfterJournalReconciliation];
    }
  }
}

BOOL __61__EDBusinessPersistence_persistenceDidReconcileProtectedData__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _businessIDsForHighLevelDomain:*(void *)(a1 + 40) connection:v3];
  id v5 = objc_alloc_init(EDDisplayNameGroupingTrie);
  [(EDDisplayNameGroupingTrie *)v5 insertDisplayNameAndIDPairs:v4];
  id v6 = [(EDDisplayNameGroupingTrie *)v5 findGroups];
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  unint64_t v7 = [v4 count];
  unint64_t v8 = [v6 count];
  unint64_t v9 = v7 - v8;
  if (v7 != v8)
  {
    if (v7 <= v8)
    {
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"EDBusinessPersistence.m" lineNumber:1974 description:@"We ended up with more groups than we started with when combining groups"];
    }
    uint64_t v10 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:*(void *)(a1 + 40) maximumUnredactedLength:1];
      *(_DWORD *)uint8_t buf = 134218242;
      unint64_t v24 = v9;
      __int16 v25 = 2114;
      id v26 = v11;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Merging %lu businesses for domain %{public}@", buf, 0x16u);
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__EDBusinessPersistence_persistenceDidReconcileProtectedData__block_invoke_175;
    v16[3] = &unk_1E6C00260;
    uint64_t v12 = *(void *)(a1 + 32);
    long long v18 = &v19;
    void v16[4] = v12;
    id v17 = v3;
    [v6 enumerateKeysAndObjectsUsingBlock:v16];
  }
  BOOL v13 = *((unsigned char *)v20 + 24) != 0;
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __61__EDBusinessPersistence_persistenceDidReconcileProtectedData__block_invoke_175(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((unint64_t)[v6 count] >= 2)
  {
    unint64_t v7 = +[EDBusinessPersistence log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Merging businessIDs %@", (uint8_t *)&v8, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _combineBusinesses:v6 connection:*(void *)(a1 + 40) newBusinessID:0];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *a4 = 1;
    }
  }
}

- (id)_highLevelDomainsForBusinessIDs:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(EDBusinessPersistence *)self database];
  unint64_t v7 = [NSString stringWithUTF8String:"-[EDBusinessPersistence _highLevelDomainsForBusinessIDs:]"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__EDBusinessPersistence__highLevelDomainsForBusinessIDs___block_invoke;
  v13[3] = &unk_1E6BFF3D8;
  id v8 = v4;
  id v14 = v8;
  id v9 = v5;
  id v15 = v9;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v13);

  uint64_t v10 = v15;
  id v11 = v9;

  return v11;
}

uint64_t __57__EDBusinessPersistence__highLevelDomainsForBusinessIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"domain" table:@"businesses"];
  [v4 setDistinct:1];
  id v5 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  id v6 = [v5 in:*(void *)(a1 + 32)];
  [v4 setWhere:v6];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__EDBusinessPersistence__highLevelDomainsForBusinessIDs___block_invoke_2;
  v8[3] = &unk_1E6BFF3B0;
  id v9 = *(id *)(a1 + 40);
  [v3 executeSelectStatement:v4 withBlock:v8 error:0];

  return 1;
}

void __57__EDBusinessPersistence__highLevelDomainsForBusinessIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectAtIndexedSubscript:0];
  id v4 = [v3 stringValue];

  if ([v4 length]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (BCSBusinessQueryService)businessQueryService
{
  return self->_businessQueryService;
}

- (void)setBusinessQueryService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessQueryService, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_businessConnectResponseQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __54__EDBusinessPersistence_lastModifiedDateForAddressID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Unable to get lastModifiedDateForAddressID for address ID %lld, due to error: %{public}@", v4, v5);
}

- (void)insertOrUpdateUserOverrideForAddressIDs:(uint64_t)a1 category:(void *)a2 timestamp:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1_2(a1, (uint64_t)a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Unable to persist category change addressIDs %{public}@, to categoryType:%{public}@", v4, v5);
}

- (void)_insertBusinessWithDomain:displayName:connection:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to insert business with domain %{public}@ and display name %{public}@", v5, v6);
}

- (void)_updateDisplayNameForBusinessID:displayName:connection:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_0(&dword_1DB39C000, v0, (uint64_t)v0, "Failed to update display name for business with ID %lld\nError: %@{public}", v1);
}

- (void)_updateBrandNamesForBusinessID:brandNames:connection:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_0(&dword_1DB39C000, v0, (uint64_t)v0, "Failed to update brand names for business with ID %lld\nError: %@{public}", v1);
}

- (void)_updateBusinessAddressesTableforBusinessID:newBusinessID:connection:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_3_0(&dword_1DB39C000, v1, (uint64_t)v1, "Failed to update business ID in business_addresses from %@ to %@", v2);
}

- (void)_deleteBusinessEntryForBusinessID:connection:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, v0, v1, "Failed to delete old business ID: %@", v2);
}

- (void)_deleteBusinessAddressEntryForAddressID:connection:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, v0, v1, "Failed to delete unused address ID: %@", v2);
}

- (void)_insertOrUpdateBusiness:forAddress:connection:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, v0, v1, "Failed to insert business_addresses entry: %@", v2);
}

void __47__EDBusinessPersistence_removeAllUserOverrides__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, v3, (uint64_t)v3, "Failed to clear all user overrides thru MCCKit, error:%@", v4);
}

- (void)_removeUserOverrideForBusinessID:timestamp:connection:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Failed to update user override since businessID is 0", v2, v3, v4, v5, v6);
}

- (void)_removeUserOverrideForBusinessID:(uint64_t)a1 timestamp:(uint64_t)a2 connection:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_3_0(&dword_1DB39C000, a3, (uint64_t)a3, "Failed to remove business_categories entry for business ID: %lld due to error %{public}@", (uint8_t *)&v3);
}

- (void)_removeUserOverrideForAddressIDs:(uint64_t)a1 timestamp:(uint64_t)a2 connection:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to remove category in business_addresses table for %lu address IDs due to error %{public}@", v3, v4);
}

void __51__EDBusinessPersistence_categoryTypeForBusinessID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Unable to get category type for businessID %lld, due to error: %{public}@", v4, v5);
}

void __50__EDBusinessPersistence_categoryTypeForAddressID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Unable to get category type for address ID %lld, due to error: %{public}@", v4, v5);
}

void __48__EDBusinessPersistence_addressesForBusinessID___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, a2, a3, "Failed to find addresses for ids %@", (uint8_t *)&v4);
}

void __49__EDBusinessPersistence_backfillBusinessesTables__block_invoke_2_105_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Lost connection to protected database while backfilling business tables", v2, v3, v4, v5, v6);
}

- (void)_combineBusinesses:(uint8_t *)buf connection:(unsigned char *)a2 newBusinessID:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Found an invalid business ID when re-computing groups", buf, 2u);
}

- (void)_combineBusinesses:connection:newBusinessID:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, v0, v1, "Failed to update businesses tables for business id: %@, stopping.", v2);
}

- (void)addressIDsWereDeleted:connection:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Failed to delete business_addresses", v2, v3, v4, v5, v6);
}

- (void)_removeOldBusinessIDs:connection:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Failed to delete businesses", v2, v3, v4, v5, v6);
}

void __57__EDBusinessPersistence_businessExternalIDForBusinessID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Unable to get external ID for business ID %lld, due to error: %{public}@", v4, v5);
}

void __57__EDBusinessPersistence_businessIDForBusinessExternalID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Unable to get business ID for external ID %{public}@, due to error: %{public}@", v5, v6);
}

void __68__EDBusinessPersistence_businessExternalIDForEmailAddress_grouping___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, v3, (uint64_t)v3, "Unable to find email address to determine external ID: %@", v4);
}

- (void)_businessExternalIDForEmailAddress:addressID:brandID:grouping:businessIDsToCombine:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Unable to determine existing external ID for address: %@, due to error: %{public}@", v5, v6);
}

- (void)_persistedBrandIDForString:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_10(&dword_1DB39C000, v0, v1, "Value from brandID string %@ overflowed UINT64_MAX", v2, v3, v4, v5, v6);
}

- (void)_persistedBrandIDForString:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_10(&dword_1DB39C000, v0, v1, "Multiple values found in the brandID string %@", v2, v3, v4, v5, v6);
}

- (void)_persistedBrandIDForString:.cold.3()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_10(&dword_1DB39C000, v0, v1, "Failed to find a valid decimal integer representation in the brandID string %@", v2, v3, v4, v5, v6);
}

- (void)_persistedBrandNamesForDictionary:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, v3, (uint64_t)v3, "Failed to convert localized brand names dictionary to JSON, due to error %{public}@", v4);
}

- (void)fetchBusinessMetadataForAddresses:completionHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  _os_log_debug_impl(&dword_1DB39C000, v0, OS_LOG_TYPE_DEBUG, "Fetching Business Connect metadata for emailIdentifiers: %@", v1, 0xCu);
}

void __77__EDBusinessPersistence_fetchBusinessMetadataForAddresses_completionHandler___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, a2, a3, "Business Connect returned an unknown emailIdentifier we didn't supply: %@", (uint8_t *)&v4);
}

void __77__EDBusinessPersistence_fetchBusinessMetadataForAddresses_completionHandler___block_invoke_161_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, v3, (uint64_t)v3, "Call to fetchBusinessMetadataForEmails completed with error: %{public}@", v4);
}

- (void)_lastBCSSyncForAddressID:connection:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Unable to get last BCS sync for address ID %lld, due to error: %{public}@", v4, v5);
}

void __83__EDBusinessPersistence_iterateAddressesNeedingUpdateWithCancelationToken_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, v3, (uint64_t)v3, "%{public}@: Couldn't iterate addresses because database is locked", v4);
}

void __58__EDBusinessPersistence_businessDisplayNameForBusinessID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Unable to get business display name for business ID %lld, due to error: %{public}@", v4, v5);
}

- (void)_localizedStringFromJSONString:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, v3, (uint64_t)v3, "Failed to convert JSON string to a dictionary, due to error %{public}@", v4);
}

@end