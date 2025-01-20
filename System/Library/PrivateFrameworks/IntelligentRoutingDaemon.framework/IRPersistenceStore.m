@interface IRPersistenceStore
- (BOOL)loadWithCoordinator:(id)a3;
- (IRPersistenceStore)initWithURL:(id)a3;
- (NSDictionary)options;
- (NSString)storeType;
- (NSURL)url;
@end

@implementation IRPersistenceStore

- (IRPersistenceStore)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IRPersistenceStore;
  v5 = [(IRPersistenceStore *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    storeDescription = v5->_storeDescription;
    v5->_storeDescription = (NSPersistentStoreDescription *)v6;

    [(NSPersistentStoreDescription *)v5->_storeDescription setShouldAddStoreAsynchronously:0];
    [(NSPersistentStoreDescription *)v5->_storeDescription setShouldMigrateStoreAutomatically:1];
    [(NSPersistentStoreDescription *)v5->_storeDescription setShouldInferMappingModelAutomatically:1];
    [(NSPersistentStoreDescription *)v5->_storeDescription setURL:v4];
    [(NSPersistentStoreDescription *)v5->_storeDescription setType:*MEMORY[0x263EFF168]];
    [(NSPersistentStoreDescription *)v5->_storeDescription setOption:*MEMORY[0x263F08098] forKey:*MEMORY[0x263EFF0E0]];
    [(NSPersistentStoreDescription *)v5->_storeDescription setValue:@"WAL" forPragmaNamed:@"journal_mode"];
  }

  return v5;
}

- (BOOL)loadWithCoordinator:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11[0] = &v10;
  v11[1] = 0x3032000000;
  v11[2] = __Block_byref_object_copy__4;
  v11[3] = __Block_byref_object_dispose__4;
  id v12 = 0;
  storeDescription = self->_storeDescription;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__IRPersistenceStore_loadWithCoordinator___block_invoke;
  v9[3] = &unk_2653A06C8;
  v9[4] = &v10;
  [v4 addPersistentStoreWithDescription:storeDescription completionHandler:v9];
  if (*(void *)(v11[0] + 40))
  {
    uint64_t v6 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      -[IRPersistenceStore loadWithCoordinator:]((uint64_t)v11, v6);
    }
    BOOL v7 = *(void *)(v11[0] + 40) == 0;
  }
  else
  {
    BOOL v7 = 1;
  }
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __42__IRPersistenceStore_loadWithCoordinator___block_invoke(uint64_t a1, int a2, id obj)
{
}

- (NSURL)url
{
  return [(NSPersistentStoreDescription *)self->_storeDescription URL];
}

- (NSString)storeType
{
  return [(NSPersistentStoreDescription *)self->_storeDescription type];
}

- (NSDictionary)options
{
  return [(NSPersistentStoreDescription *)self->_storeDescription options];
}

- (void).cxx_destruct
{
}

- (void)loadWithCoordinator:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_25418E000, a2, OS_LOG_TYPE_ERROR, "#persistence-store, [ErrorId - Store Load error] Could not add store with error = %@", (uint8_t *)&v3, 0xCu);
}

@end