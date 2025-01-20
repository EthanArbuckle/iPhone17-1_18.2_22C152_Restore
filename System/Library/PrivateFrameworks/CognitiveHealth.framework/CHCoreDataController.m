@interface CHCoreDataController
- (NSPersistentContainer)persistentContainer;
- (void)addPersistentStoreFromDatabase;
@end

@implementation CHCoreDataController

- (void).cxx_destruct
{
}

- (void)addPersistentStoreFromDatabase
{
  v26[1] = *MEMORY[0x263EF8340];
  v2 = [(NSPersistentContainer *)self->_persistentContainer persistentStoreCoordinator];
  v3 = objc_alloc_init(CHMobileAssetBridge);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__173;
  v23 = __Block_byref_object_dispose__174;
  id v24 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __54__CHCoreDataController_addPersistentStoreFromDatabase__block_invoke;
  v16[3] = &unk_265287D08;
  v18 = &v19;
  v5 = v4;
  v17 = v5;
  [(CHMobileAssetBridge *)v3 autoAssetLockContentForAssetType:@"com.apple.MobileAsset.CognitiveHealth" assetSpecifier:@"SupplementalCategoryDatabase" lockReason:@"Locking to load sqlite file into CoreData" completion:v16];
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v5, v6);
  if (v20[5])
  {
    v7 = objc_msgSend(NSURL, "fileURLWithPath:");
    v8 = [v7 URLByAppendingPathComponent:@"CustomCategoryMapping.sqlite"];

    NSLog(&cfstr_CustomCateogry.isa, v8);
    v9 = [v2 persistentStoreForURL:v8];
    LODWORD(v7) = v9 == 0;

    if (v7)
    {
      uint64_t v25 = *MEMORY[0x263EFF138];
      v26[0] = MEMORY[0x263EFFA88];
      v10 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
      uint64_t v11 = *MEMORY[0x263EFF168];
      id v15 = 0;
      v12 = [v2 addPersistentStoreWithType:v11 configuration:0 URL:v8 options:v10 error:&v15];
      id v13 = v15;

      if (!v12)
      {
        v14 = [v13 userInfo];
        NSLog(&cfstr_UnresolvedErro.isa, v13, v14);
      }
    }
    else
    {
      NSLog(&cfstr_PersistentStor.isa);
    }
  }
  _Block_object_dispose(&v19, 8);
}

void __54__CHCoreDataController_addPersistentStoreFromDatabase__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  NSLog(&cfstr_AssetDirectory.isa, v7, [a3 count], v8);

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v11 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSPersistentContainer)persistentContainer
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_persistentContainer)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    dispatch_semaphore_t v4 = [v3 URLForResource:@"CustomCategoryModel" withExtension:@"momd"];
    v5 = (void *)[objc_alloc(MEMORY[0x263EFF298]) initWithContentsOfURL:v4];
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFF2E8]) initWithName:@"CSVToCoreData" managedObjectModel:v5];
    persistentContainer = v2->_persistentContainer;
    v2->_persistentContainer = (NSPersistentContainer *)v6;

    [(NSPersistentContainer *)v2->_persistentContainer loadPersistentStoresWithCompletionHandler:&__block_literal_global_186];
  }
  [(CHCoreDataController *)v2 addPersistentStoreFromDatabase];
  objc_sync_exit(v2);

  id v8 = v2->_persistentContainer;
  return v8;
}

void __43__CHCoreDataController_persistentContainer__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [v3 userInfo];
    NSLog(&cfstr_UnresolvedErro.isa, v3, v4);
  }
}

@end