@interface CHCustomCategories
+ (void)databaseAssetAvailableStatusWithCompletion:(id)a3;
+ (void)downloadDatabaseAssetIfNeeded;
+ (void)downloadDatabaseAssetIfNeededWithCompletion:(id)a3;
- (CHCoreDataController)coreDataController;
- (CHCustomCategories)init;
- (NSDictionary)intToUUIDMapping;
- (NSError)fetchError;
- (NSPersistentContainer)persistentContainer;
- (id)categoryForBundleId:(id)a3;
- (id)customCategoryVersion;
- (id)extractDataFromCoreDataResult:(id)a3;
- (id)fetchCategoriesForBundleId:(id)a3;
- (id)loadMappingFromFile;
- (id)lockAssetAndReturnAssetPathForFile:(id)a3 withLockReason:(id)a4;
- (id)resetTimer;
- (void)categoriesForBundleId:(id)a3 completion:(id)a4;
- (void)categoriesForBundleIdSet:(id)a3 completion:(id)a4;
- (void)lockAssetWithLockReason:(id)a3;
- (void)setCoreDataController:(id)a3;
- (void)setFetchError:(id)a3;
- (void)setIntToUUIDMapping:(id)a3;
- (void)setPersistentContainer:(id)a3;
@end

@implementation CHCustomCategories

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intToUUIDMapping, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_coreDataController, 0);
  objc_storeStrong((id *)&self->_fetchError, 0);
}

- (void)setIntToUUIDMapping:(id)a3
{
}

- (NSDictionary)intToUUIDMapping
{
  return self->_intToUUIDMapping;
}

- (void)setPersistentContainer:(id)a3
{
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setCoreDataController:(id)a3
{
}

- (CHCoreDataController)coreDataController
{
  return self->_coreDataController;
}

- (void)setFetchError:(id)a3
{
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (id)resetTimer
{
  v2 = objc_alloc_init(CHMobileAssetBridge);
  v3 = (void *)MEMORY[0x263EFFA20];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__CHCustomCategories_resetTimer__block_invoke;
  v7[3] = &unk_265287C70;
  v8 = v2;
  v4 = v2;
  v5 = [v3 scheduledTimerWithTimeInterval:0 repeats:v7 block:10.0];

  return v5;
}

void __32__CHCustomCategories_resetTimer__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) autoAssetEndAllLocksForAssetType:@"com.apple.MobileAsset.CognitiveHealth" assetSpecifier:@"SupplementalCategoryDatabase" completion:&__block_literal_global_136];
  [(id)lockTimer invalidate];
  v1 = (void *)lockTimer;
  lockTimer = 0;
}

void __32__CHCustomCategories_resetTimer__block_invoke_2(uint64_t a1, uint64_t a2)
{
}

- (void)lockAssetWithLockReason:(id)a3
{
  id v3 = [(CHCustomCategories *)self lockAssetAndReturnAssetPathForFile:&stru_26FE1BA48 withLockReason:a3];
}

- (id)lockAssetAndReturnAssetPathForFile:(id)a3 withLockReason:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(CHMobileAssetBridge);
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __72__CHCustomCategories_lockAssetAndReturnAssetPathForFile_withLockReason___block_invoke;
  v17 = &unk_265287D08;
  v19 = &v20;
  v9 = v8;
  v18 = v9;
  [(CHMobileAssetBridge *)v7 autoAssetLockContentForAssetType:@"com.apple.MobileAsset.CognitiveHealth" assetSpecifier:@"SupplementalCategoryDatabase" lockReason:v6 completion:&v14];
  dispatch_time_t v10 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v9, v10);
  v11 = (void *)v21[5];
  if (v11)
  {
    v12 = [v11 stringByAppendingPathComponent:v5];
    NSLog(&cfstr_AssetPathForRe.isa, v6, v12, v14, v15, v16, v17);
  }
  else
  {
    v12 = 0;
  }

  _Block_object_dispose(&v20, 8);
  return v12;
}

void __72__CHCustomCategories_lockAssetAndReturnAssetPathForFile_withLockReason___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  NSLog(&cfstr_AssetDirectory.isa, v7, [a3 count], v8);

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v11 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)loadMappingFromFile
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(CHCustomCategories *)self lockAssetAndReturnAssetPathForFile:@"uuid-int-mapping.csv" withLockReason:@"Locking to load uuid to int mapping file"];
  NSLog(&cfstr_CustomCategory.isa, v4);
  id v23 = 0;
  id v5 = [NSString stringWithContentsOfFile:v4 encoding:4 error:&v23];
  id v6 = v23;
  id v7 = v6;
  if (v6)
  {
    NSLog(&cfstr_ErrorWhileRead_0.isa, v6);
  }
  else
  {
    v17 = v5;
    v18 = v4;
    id v8 = [v5 componentsSeparatedByString:@"\n"];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v19 + 1) + 8 * i) componentsSeparatedByString:@","];
          if ([v13 count] == 2)
          {
            uint64_t v14 = [v13 objectAtIndex:0];
            uint64_t v15 = [v13 objectAtIndex:1];
            [v3 setValue:v14 forKey:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v10);
    }

    id v5 = v17;
    v4 = v18;
  }

  return v3;
}

- (id)extractDataFromCoreDataResult:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        intToUUIDMapping = self->_intToUUIDMapping;
        v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "category", (void)v15);
        v13 = [(NSDictionary *)intToUUIDMapping objectForKey:v12];

        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)fetchCategoriesForBundleId:(id)a3
{
  id v4 = a3;
  [(CHCustomCategories *)self lockAssetWithLockReason:@"Locking to fetch from CoreData"];
  id v5 = objc_alloc_init(MEMORY[0x263EFF260]);
  id v6 = (void *)MEMORY[0x263EFF240];
  uint64_t v7 = [(NSPersistentContainer *)self->_persistentContainer viewContext];
  uint64_t v8 = [v6 entityForName:@"CustomCategory" inManagedObjectContext:v7];
  [v5 setEntity:v8];

  uint64_t v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"bundleId == %@", v4];

  [v5 setPredicate:v9];
  uint64_t v10 = [(NSPersistentContainer *)self->_persistentContainer viewContext];
  id v18 = 0;
  uint64_t v11 = [v10 executeFetchRequest:v5 error:&v18];
  v12 = (NSError *)v18;

  fetchError = self->_fetchError;
  self->_fetchError = v12;
  uint64_t v14 = v12;

  uint64_t v15 = [(CHCustomCategories *)self resetTimer];
  long long v16 = (void *)lockTimer;
  lockTimer = v15;

  return v11;
}

- (id)categoryForBundleId:(id)a3
{
  id v4 = [(CHCustomCategories *)self fetchCategoriesForBundleId:a3];
  id v5 = [(CHCustomCategories *)self extractDataFromCoreDataResult:v4];
  if ([v5 count]) {
    id v6 = v5;
  }
  else {
    id v6 = &unk_26FE1C7F8;
  }
  id v7 = v6;

  return v7;
}

- (void)categoriesForBundleIdSet:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, NSError *))a4;
  uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v15 = -[CHCustomCategories categoryForBundleId:](self, "categoryForBundleId:", v14, (void)v16);
        [v8 setValue:v15 forKey:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  v7[2](v7, v8, self->_fetchError);
}

- (void)categoriesForBundleId:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id, NSError *))a4;
  id v7 = [(CHCustomCategories *)self categoryForBundleId:a3];
  v6[2](v6, v7, self->_fetchError);
}

- (id)customCategoryVersion
{
  id v3 = [(CHCustomCategories *)self lockAssetAndReturnAssetPathForFile:@"version.txt" withLockReason:@"Locking to load version"];
  NSLog(&cfstr_CustomCategory.isa, v3);
  id v10 = 0;
  id v4 = [NSString stringWithContentsOfFile:v3 encoding:4 error:&v10];
  id v5 = v10;
  uint64_t v6 = [(CHCustomCategories *)self resetTimer];
  id v7 = (void *)lockTimer;
  lockTimer = v6;

  if (v5)
  {
    NSLog(&cfstr_ErrorWhileRead.isa, v5);
    uint64_t v8 = @"1.0.0";
  }
  else
  {
    uint64_t v8 = v4;
  }

  return v8;
}

- (CHCustomCategories)init
{
  v12.receiver = self;
  v12.super_class = (Class)CHCustomCategories;
  v2 = [(CHCustomCategories *)&v12 init];
  if (v2)
  {
    id v3 = objc_alloc_init(CHCoreDataController);
    coreDataController = v2->_coreDataController;
    v2->_coreDataController = v3;

    uint64_t v5 = [(CHCoreDataController *)v2->_coreDataController persistentContainer];
    persistentContainer = v2->_persistentContainer;
    v2->_persistentContainer = (NSPersistentContainer *)v5;

    uint64_t v7 = [(CHCustomCategories *)v2 loadMappingFromFile];
    intToUUIDMapping = v2->_intToUUIDMapping;
    v2->_intToUUIDMapping = (NSDictionary *)v7;

    uint64_t v9 = [(CHCustomCategories *)v2 resetTimer];
    id v10 = (void *)lockTimer;
    lockTimer = v9;
  }
  return v2;
}

+ (void)downloadDatabaseAssetIfNeededWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(CHMobileAssetBridge);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__CHCustomCategories_downloadDatabaseAssetIfNeededWithCompletion___block_invoke;
  v6[3] = &unk_265287CC0;
  id v7 = v3;
  id v5 = v3;
  [(CHMobileAssetBridge *)v4 autoAssetInterestInContentForAssetType:@"com.apple.MobileAsset.CognitiveHealth" assetSpecifier:@"SupplementalCategoryDatabase" completion:v6];
}

void __66__CHCustomCategories_downloadDatabaseAssetIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog(&cfstr_DownloadError.isa, v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)databaseAssetAvailableStatusWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(CHMobileAssetBridge);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__CHCustomCategories_databaseAssetAvailableStatusWithCompletion___block_invoke;
  v6[3] = &unk_265287C98;
  id v7 = v3;
  id v5 = v3;
  [(CHMobileAssetBridge *)v4 autoAssetAvailableForUseForAssetType:@"com.apple.MobileAsset.CognitiveHealth" assetSpecifier:@"SupplementalCategoryDatabase" completion:v6];
}

void __65__CHCustomCategories_databaseAssetAvailableStatusWithCompletion___block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  NSLog(&cfstr_StatusOfAutoAs.isa, a2, v5);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)downloadDatabaseAssetIfNeeded
{
}

@end