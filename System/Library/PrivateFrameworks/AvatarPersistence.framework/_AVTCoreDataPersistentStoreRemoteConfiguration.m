@interface _AVTCoreDataPersistentStoreRemoteConfiguration
+ (id)createContainerForRemoteConfiguration;
- (AVTAvatarsDaemon)daemonClient;
- (AVTUILogger)logger;
- (BOOL)setupIfNeeded:(id *)a3;
- (NSPersistentContainer)container;
- (_AVTCoreDataPersistentStoreRemoteConfiguration)initWithDaemonClient:(id)a3 environment:(id)a4;
- (id)createManagedObjectContext;
- (id)persistentStoreCoordinator;
- (id)storeDescription;
@end

@implementation _AVTCoreDataPersistentStoreRemoteConfiguration

- (_AVTCoreDataPersistentStoreRemoteConfiguration)initWithDaemonClient:(id)a3 environment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_AVTCoreDataPersistentStoreRemoteConfiguration;
  v9 = [(_AVTCoreDataPersistentStoreRemoteConfiguration *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [v8 logger];
    logger = v9->_logger;
    v9->_logger = (AVTUILogger *)v10;

    objc_storeStrong((id *)&v9->_daemonClient, a3);
    uint64_t v12 = [(id)objc_opt_class() createContainerForRemoteConfiguration];
    container = v9->_container;
    v9->_container = (NSPersistentContainer *)v12;
  }
  return v9;
}

+ (id)createContainerForRemoteConfiguration
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = +[AVTCoreDataPersistentStoreConfiguration currentManagedObjectModel];
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF2E8]) initWithName:@"AVTCoreDataContainer" managedObjectModel:v2];
  id v4 = objc_alloc_init(MEMORY[0x263EFF328]);
  [v4 setType:*MEMORY[0x263EFF1C0]];
  [v4 setOption:@"com.apple.avatar.service" forKey:*MEMORY[0x263EFF1B8]];
  uint64_t v5 = MEMORY[0x263EFFA88];
  [v4 setOption:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EFF1A0]];
  [v4 setShouldAddStoreAsynchronously:0];
  [v4 setOption:v5 forKey:*MEMORY[0x263EFF100]];
  [v4 setOption:v5 forKey:*MEMORY[0x263EFF1B0]];
  [v4 setOption:v5 forKey:*MEMORY[0x263EFF0B0]];
  v8[0] = v4;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  [v3 setPersistentStoreDescriptions:v6];

  return v3;
}

- (BOOL)setupIfNeeded:(id *)a3
{
  uint64_t v5 = [(_AVTCoreDataPersistentStoreRemoteConfiguration *)self container];
  v6 = [v5 persistentStoreCoordinator];
  id v7 = [v6 persistentStores];
  uint64_t v8 = [v7 count];

  BOOL v9 = 1;
  if (!v8)
  {
    uint64_t v10 = [(_AVTCoreDataPersistentStoreRemoteConfiguration *)self daemonClient];
    [v10 checkIn];

    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 1;
    uint64_t v14 = 0;
    objc_super v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__7;
    v18 = __Block_byref_object_dispose__7;
    id v19 = 0;
    v11 = [(_AVTCoreDataPersistentStoreRemoteConfiguration *)self container];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __64___AVTCoreDataPersistentStoreRemoteConfiguration_setupIfNeeded___block_invoke;
    v13[3] = &unk_2647C4150;
    v13[4] = &v14;
    v13[5] = &v20;
    [v11 loadPersistentStoresWithCompletionHandler:v13];

    BOOL v9 = *((unsigned char *)v21 + 24) != 0;
    if (a3 && !*((unsigned char *)v21 + 24)) {
      *a3 = (id) v15[5];
    }
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  return v9;
}

- (id)createManagedObjectContext
{
  v2 = [(_AVTCoreDataPersistentStoreRemoteConfiguration *)self container];
  v3 = (void *)[v2 newBackgroundContext];

  [v3 setTransactionAuthor:@"AvatarUIClient"];

  return v3;
}

- (id)persistentStoreCoordinator
{
  v2 = [(_AVTCoreDataPersistentStoreRemoteConfiguration *)self container];
  v3 = [v2 persistentStoreCoordinator];

  return v3;
}

- (id)storeDescription
{
  v2 = [(_AVTCoreDataPersistentStoreRemoteConfiguration *)self container];
  v3 = [v2 persistentStoreDescriptions];
  id v4 = [v3 firstObject];

  return v4;
}

- (NSPersistentContainer)container
{
  return self->_container;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTAvatarsDaemon)daemonClient
{
  return self->_daemonClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonClient, 0);
  objc_storeStrong((id *)&self->_logger, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

@end