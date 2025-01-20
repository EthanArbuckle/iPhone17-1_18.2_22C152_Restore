@interface AMDCoreDataPersistentContainer
+ (id)sharedContainer;
- (NSManagedObjectContext)_moc;
- (NSPersistentContainer)_container;
- (id)getManagedObjectContext;
- (void)save:(id *)a3;
- (void)set_container:(id)a3;
- (void)set_moc:(id)a3;
@end

@implementation AMDCoreDataPersistentContainer

+ (id)sharedContainer
{
  v5 = (dispatch_once_t *)&sharedContainer_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_4);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)sharedContainer_sharedContainer;

  return v2;
}

void __49__AMDCoreDataPersistentContainer_sharedContainer__block_invoke(void *a1)
{
  v14[2] = a1;
  v14[1] = a1;
  v1 = objc_alloc_init(AMDCoreDataPersistentContainer);
  v2 = (void *)sharedContainer_sharedContainer;
  sharedContainer_sharedContainer = (uint64_t)v1;

  v14[0] = (id)[MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaDiscovery"];
  id v13 = (id)[v14[0] URLForResource:@"AppleMediaDiscovery" withExtension:@"momd"];
  id v3 = objc_alloc(MEMORY[0x263EFF298]);
  id v12 = (id)[v3 initWithContentsOfURL:v13];
  id v4 = (id)[MEMORY[0x263EFF2E8] persistentContainerWithName:@"recommendation_v9" managedObjectModel:v12];
  objc_msgSend((id)sharedContainer_sharedContainer, "set_container:");

  +[AMDPerf startMonitoringEvent:](AMDPerf, "startMonitoringEvent:");
  id v5 = (id)[(id)sharedContainer_sharedContainer _container];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  v9 = __49__AMDCoreDataPersistentContainer_sharedContainer__block_invoke_2;
  v10 = &unk_263FE2250;
  id v11 = v12;
  objc_msgSend(v5, "loadPersistentStoresWithCompletionHandler:");

  +[AMDPerf endMonitoringEvent:@"LoadCoreData"];
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v14, 0);
}

void __49__AMDCoreDataPersistentContainer_sharedContainer__block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v38 = 0;
  objc_storeStrong(&v38, a3);
  v37[1] = a1;
  if (v38)
  {
    id v35 = &_os_log_internal;
    os_log_type_t v34 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
    {
      id v13 = (id)[v38 localizedDescription];
      __os_log_helper_16_2_1_8_64((uint64_t)v43, (uint64_t)v13);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v35, v34, "Error loading CoreData: %@", v43, 0xCu);
    }
    objc_storeStrong(&v35, 0);
    id v33 = &_os_log_internal;
    char v32 = 1;
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_INFO))
    {
      id v11 = v33;
      os_log_type_t v12 = v32;
      __os_log_helper_16_0_0(v31);
      _os_log_impl(&dword_20ABD4000, v11, v12, "Attempting a lightweight coredata migration", v31, 2u);
    }
    objc_storeStrong(&v33, 0);
    id v30 = (id)[objc_alloc(MEMORY[0x263EFF320]) initWithManagedObjectModel:a1[4]];
    v41[0] = *MEMORY[0x263EFF070];
    v42[0] = MEMORY[0x263EFFA88];
    v41[1] = *MEMORY[0x263EFF008];
    v42[1] = MEMORY[0x263EFFA88];
    id v29 = (id)[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
    id v28 = 0;
    id v8 = v30;
    uint64_t v7 = *MEMORY[0x263EFF168];
    id v10 = (id)[location[0] URL];
    id v27 = v28;
    id v9 = (id)objc_msgSend(v8, "addPersistentStoreWithType:configuration:URL:options:error:", v7, 0);
    objc_storeStrong(&v28, v27);

    if (v9)
    {
      id v23 = &_os_log_internal;
      os_log_type_t v22 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_INFO))
      {
        id v3 = v23;
        os_log_type_t v4 = v22;
        __os_log_helper_16_0_0(v21);
        _os_log_impl(&dword_20ABD4000, v3, v4, "Lightweight CoreData migration was successful", v21, 2u);
      }
      objc_storeStrong(&v23, 0);
      +[AMDFrameworkMetrics log:@"Success" withKey:@"CoreDataMigration" atVerbosity:0];
    }
    else
    {
      id v5 = NSString;
      id v6 = (id)[v28 localizedDescription];
      id v26 = (id)[v5 stringWithFormat:@"Migration failed with error: %@", v6];

      id v25 = &_os_log_internal;
      os_log_type_t v24 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v40, (uint64_t)v26);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v25, v24, "%@", v40, 0xCu);
      }
      objc_storeStrong(&v25, 0);
      +[AMDFrameworkMetrics log:v26 withKey:@"CoreDataMigrationError" atVerbosity:0];
      objc_storeStrong(&v26, 0);
    }
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
  }
  else
  {
    v37[0] = &_os_log_internal;
    os_log_type_t v36 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v37[0], OS_LOG_TYPE_DEBUG))
    {
      id v18 = (id)[location[0] URL];
      __os_log_helper_16_2_1_8_64((uint64_t)v44, (uint64_t)v18);
      _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v37[0], v36, "Loaded CoreData from URL: %@", v44, 0xCu);
    }
    objc_storeStrong(v37, 0);
    id v15 = (id)[(id)sharedContainer_sharedContainer _container];
    id v14 = (id)[v15 newBackgroundContext];
    objc_msgSend((id)sharedContainer_sharedContainer, "set_moc:");

    uint64_t v16 = *MEMORY[0x263EFF060];
    id v17 = (id)[(id)sharedContainer_sharedContainer _moc];
    [v17 setMergePolicy:v16];
  }
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
}

- (id)getManagedObjectContext
{
  return [(AMDCoreDataPersistentContainer *)self _moc];
}

- (void)save:(id *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v10 = self;
  SEL v9 = a2;
  id v8 = a3;
  id v5 = [(AMDCoreDataPersistentContainer *)self _moc];
  [(NSManagedObjectContext *)v5 save:v8];

  if (*v8)
  {
    id v3 = NSString;
    id v4 = (id)[*v8 localizedDescription];
    id v7 = (id)[v3 stringWithFormat:@"Error saving local MOC: %@", v4];

    id location = &_os_log_internal;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v11, (uint64_t)v7);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)location, OS_LOG_TYPE_ERROR, "%@", v11, 0xCu);
    }
    objc_storeStrong(&location, 0);
    +[AMDFrameworkMetrics log:v7 withKey:@"MOCError" atVerbosity:0];
    objc_storeStrong(&v7, 0);
  }
}

- (NSPersistentContainer)_container
{
  return self->__container;
}

- (void)set_container:(id)a3
{
}

- (NSManagedObjectContext)_moc
{
  return self->__moc;
}

- (void)set_moc:(id)a3
{
}

- (void).cxx_destruct
{
}

@end