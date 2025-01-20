@interface CDXRetrieveExtensionsOperation
- (BOOL)_nsExtension:(id)a3 isOnlyExtensionInContainingAppAmongNSExtensions:(id)a4;
- (CDXRetrieveExtensionsOperation)initWithStore:(id)a3;
- (CDXRetrieveExtensionsOperation)initWithStore:(id)a3 extensionsDataSource:(id)a4 queue:(id)a5;
- (CDXRetrieveExtensionsOperationExtensionsDataSource)extensionsDataSource;
- (CXCallDirectoryStore)store;
- (OS_dispatch_queue)queue;
- (id)_extensionWithNSExtension:(id)a3 storeExtension:(id)a4 isOnlyExtensionInContainingApp:(BOOL)a5;
- (id)_extensionsFromNSExtensions:(id)a3 usingProritizedStoreExtensions:(id)a4;
- (void)performWithCompletionHandler:(id)a3;
- (void)setExtensionsDataSource:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation CDXRetrieveExtensionsOperation

- (CDXRetrieveExtensionsOperation)initWithStore:(id)a3 extensionsDataSource:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CDXRetrieveExtensionsOperation;
  v12 = [(CDXRetrieveExtensionsOperation *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a5);
    objc_storeStrong((id *)&v13->_extensionsDataSource, a4);
    objc_storeStrong((id *)&v13->_store, a3);
  }

  return v13;
}

- (CDXRetrieveExtensionsOperation)initWithStore:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.callkit.calldirectory.retrieveextensionsoperation", 0);
  id v6 = objc_alloc_init((Class)CXCallDirectoryNSExtensionManager);
  v7 = [(CDXRetrieveExtensionsOperation *)self initWithStore:v4 extensionsDataSource:v6 queue:v5];

  return v7;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(CDXRetrieveExtensionsOperation *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013688;
  v7[3] = &unk_100034BB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)_extensionsFromNSExtensions:(id)a3 usingProritizedStoreExtensions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v6 count]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v36;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        objc_super v15 = [v14 identifier];
        [v8 setObject:v14 forKeyedSubscript:v15];
      }
      id v11 = [v9 countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v11);
  }

  v16 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v7;
  id v17 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v17)
  {
    id v19 = v17;
    uint64_t v20 = *(void *)v32;
    *(void *)&long long v18 = 138412290;
    long long v29 = v18;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
        v23 = objc_msgSend(v22, "identifier", v29);
        v24 = [v8 objectForKeyedSubscript:v23];

        if (v24)
        {
          v25 = [(CDXRetrieveExtensionsOperation *)self _extensionWithNSExtension:v24 storeExtension:v22 isOnlyExtensionInContainingApp:[(CDXRetrieveExtensionsOperation *)self _nsExtension:v24 isOnlyExtensionInContainingAppAmongNSExtensions:v9]];
          [v16 addObject:v25];
        }
        else
        {
          v25 = sub_10000492C();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = [v22 identifier];
            *(_DWORD *)buf = v29;
            v40 = v26;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "No NSExtension found with prioritized store extension identifier %@", buf, 0xCu);
          }
        }
      }
      id v19 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
    }
    while (v19);
  }

  id v27 = [v16 copy];

  return v27;
}

- (id)_extensionWithNSExtension:(id)a3 storeExtension:(id)a4 isOnlyExtensionInContainingApp:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init((Class)CXCallDirectoryExtension);
  id v10 = [v7 identifier];
  [v9 setIdentifier:v10];

  objc_msgSend(v9, "setState:", objc_msgSend(v7, "state"));
  id v11 = [v7 priority];

  [v9 setPriority:v11];
  uint64_t v12 = [v8 localizedName];
  [v9 setLocalizedName:v12];

  v13 = [v8 localizedContainingAppName];
  [v9 setLocalizedContainingAppName:v13];

  v14 = [v8 plugInKitProxy];

  [v9 setPlugInKitProxy:v14];
  [v9 setOnlyExtensionInContainingApp:v5];

  return v9;
}

- (BOOL)_nsExtension:(id)a3 isOnlyExtensionInContainingAppAmongNSExtensions:(id)a4
{
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "containingAppURL", (void)v15);
        uint64_t v12 = [v5 containingAppURL];
        unsigned int v13 = [v11 isEqual:v12];

        v8 += v13;
        if (v8 > 1)
        {
          LOBYTE(v7) = 0;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    LOBYTE(v7) = v8 == 1;
  }
LABEL_11:

  return (char)v7;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CDXRetrieveExtensionsOperationExtensionsDataSource)extensionsDataSource
{
  return self->_extensionsDataSource;
}

- (void)setExtensionsDataSource:(id)a3
{
}

- (CXCallDirectoryStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_extensionsDataSource, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end