@interface BAMetadataStoreManager
- (BAMetadataStore)metadataStore;
- (BAMetadataStoreManager)init;
- (BAMetadataStoreManager)initWithContainer:(id)a3;
- (NSPersistentContainer)container;
- (void)deleteStoreWithCompletion:(id)a3;
@end

@implementation BAMetadataStoreManager

- (BAMetadataStoreManager)initWithContainer:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BAMetadataStoreManager;
  v6 = [(BAMetadataStoreManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_container, a3);
    [(NSPersistentContainer *)v7->_container loadPersistentStoresWithCompletionHandler:&stru_1001A2748];
    v8 = [[BAMetadataStore alloc] initWithPersistentContainer:v7->_container];
    metadataStore = v7->_metadataStore;
    v7->_metadataStore = v8;
  }
  return v7;
}

- (BAMetadataStoreManager)init
{
  v3 = +[BAMetadataStorePersistentContainer persistentContainer];
  v4 = [(BAMetadataStoreManager *)self initWithContainer:v3];

  return v4;
}

- (void)deleteStoreWithCompletion:(id)a3
{
  id v21 = a3;
  v23 = self;
  v4 = [(BAMetadataStoreManager *)self container];
  id v5 = [v4 persistentStoreCoordinator];
  v6 = [v5 persistentStores];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v7)
  {
    id v8 = v7;
    v9 = 0;
    uint64_t v24 = *(void *)v27;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(obj);
        }
        objc_super v11 = [*(id *)(*((void *)&v26 + 1) + 8 * i) URL];
        if (v11)
        {
          v12 = +[NSPersistentStoreDescription persistentStoreDescriptionWithURL:v11];
          v13 = [v12 options];
          v14 = BLServiceMetadataStoreLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v31 = v11;
            __int16 v32 = 2112;
            v33 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Attempt to remove metadata store, url: %@, options: %@", buf, 0x16u);
          }

          v15 = [(BAMetadataStoreManager *)v23 container];
          v16 = [v15 persistentStoreCoordinator];
          v17 = [v12 type];
          id v25 = v9;
          [v16 destroyPersistentStoreAtURL:v11 withType:v17 options:v13 error:&v25];
          id v18 = v25;

          v9 = v18;
        }
        else
        {
          v12 = BLServiceMetadataStoreLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unexpected nil metadataStore URL", buf, 2u);
          }
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  id v19 = objc_retainBlock(v21);
  v20 = v19;
  if (v19) {
    (*((void (**)(id, void *))v19 + 2))(v19, v9);
  }
}

- (BAMetadataStore)metadataStore
{
  return self->_metadataStore;
}

- (NSPersistentContainer)container
{
  return self->_container;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);

  objc_storeStrong((id *)&self->_metadataStore, 0);
}

@end