@interface CDXSynchronizeExtensionsOperation
- (BOOL)afterFirstUnlock;
- (CDXNotifydNotifier)identificationEntriesChangedNotifier;
- (CDXSynchronizeExtensionsOperation)init;
- (CDXSynchronizeExtensionsOperation)initWithStore:(id)a3 firstUnlockStatus:(BOOL)a4;
- (CDXSynchronizeExtensionsOperation)initWithStore:(id)a3 firstUnlockStatus:(BOOL)a4 extensionsDataSource:(id)a5 identificationEntriesChangedNotifier:(id)a6 queue:(id)a7;
- (CDXSynchronizeExtensionsOperationExtensionsDataSource)extensionsDataSource;
- (CXCallDirectoryStore)store;
- (NSArray)cachedCallDirectoryStoreExtensions;
- (OS_dispatch_queue)queue;
- (_TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy)liveLookupStore;
- (id)disabledStoredExtensionIdentifiersWithError:(id *)a3;
- (id)enabledStoredExtensionIdentifiersWithError:(id *)a3;
- (id)storedExtensionIdentifiersPassingTest:(id)a3 error:(id *)a4;
- (id)storedExtensionIdentifiersWithError:(id *)a3;
- (id)unavailableStoredExtensionIdentifiersWithError:(id *)a3;
- (void)performWithCompletionHandler:(id)a3;
- (void)setAfterFirstUnlock:(BOOL)a3;
- (void)setCachedCallDirectoryStoreExtensions:(id)a3;
- (void)setExtensionsDataSource:(id)a3;
- (void)setIdentificationEntriesChangedNotifier:(id)a3;
- (void)setLiveLookupStore:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation CDXSynchronizeExtensionsOperation

- (CDXSynchronizeExtensionsOperation)initWithStore:(id)a3 firstUnlockStatus:(BOOL)a4 extensionsDataSource:(id)a5 identificationEntriesChangedNotifier:(id)a6 queue:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CDXSynchronizeExtensionsOperation;
  v17 = [(CDXSynchronizeExtensionsOperation *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queue, a7);
    objc_storeStrong((id *)&v18->_store, a3);
    v19 = objc_alloc_init(_TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy);
    liveLookupStore = v18->_liveLookupStore;
    v18->_liveLookupStore = v19;

    objc_storeStrong((id *)&v18->_extensionsDataSource, a5);
    objc_storeStrong((id *)&v18->_identificationEntriesChangedNotifier, a6);
    v18->_afterFirstUnlock = a4;
  }

  return v18;
}

- (CDXSynchronizeExtensionsOperation)initWithStore:(id)a3 firstUnlockStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.callkit.calldirectory.synchronizeextensionsoperation", 0);
  id v8 = objc_alloc_init((Class)CXCallDirectoryNSExtensionManager);
  v9 = [CDXNotifydNotifier alloc];
  v10 = [(CDXNotifydNotifier *)v9 initWithNotificationName:CXCallDirectoryManagerIdentificationEntriesChangedNotification];
  v11 = [(CDXSynchronizeExtensionsOperation *)self initWithStore:v6 firstUnlockStatus:v4 extensionsDataSource:v8 identificationEntriesChangedNotifier:v10 queue:v7];

  return v11;
}

- (CDXSynchronizeExtensionsOperation)init
{
  return 0;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(CDXSynchronizeExtensionsOperation *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008914;
  v7[3] = &unk_100034BB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)storedExtensionIdentifiersPassingTest:(id)a3 error:(id *)a4
{
  id v6 = (unsigned int (**)(id, void *))a3;
  dispatch_queue_t v7 = [(CDXSynchronizeExtensionsOperation *)self cachedCallDirectoryStoreExtensions];

  if (!v7)
  {
    id v8 = [(CDXSynchronizeExtensionsOperation *)self store];
    v9 = [v8 prioritizedExtensionsWithError:a4];
    [(CDXSynchronizeExtensionsOperation *)self setCachedCallDirectoryStoreExtensions:v9];
  }
  v10 = [(CDXSynchronizeExtensionsOperation *)self cachedCallDirectoryStoreExtensions];

  if (v10)
  {
    v11 = +[NSMutableSet set];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v12 = [(CDXSynchronizeExtensionsOperation *)self cachedCallDirectoryStoreExtensions];
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (v6[2](v6, v17))
          {
            v18 = [v17 identifier];
            [v11 addObject:v18];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    id v19 = [v11 copy];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)storedExtensionIdentifiersWithError:(id *)a3
{
  return [(CDXSynchronizeExtensionsOperation *)self storedExtensionIdentifiersPassingTest:&stru_100034CF8 error:a3];
}

- (id)enabledStoredExtensionIdentifiersWithError:(id *)a3
{
  return [(CDXSynchronizeExtensionsOperation *)self storedExtensionIdentifiersPassingTest:&stru_100034D18 error:a3];
}

- (id)disabledStoredExtensionIdentifiersWithError:(id *)a3
{
  return [(CDXSynchronizeExtensionsOperation *)self storedExtensionIdentifiersPassingTest:&stru_100034D38 error:a3];
}

- (id)unavailableStoredExtensionIdentifiersWithError:(id *)a3
{
  return [(CDXSynchronizeExtensionsOperation *)self storedExtensionIdentifiersPassingTest:&stru_100034D58 error:a3];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CXCallDirectoryStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (_TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy)liveLookupStore
{
  return self->_liveLookupStore;
}

- (void)setLiveLookupStore:(id)a3
{
}

- (CDXSynchronizeExtensionsOperationExtensionsDataSource)extensionsDataSource
{
  return self->_extensionsDataSource;
}

- (void)setExtensionsDataSource:(id)a3
{
}

- (CDXNotifydNotifier)identificationEntriesChangedNotifier
{
  return self->_identificationEntriesChangedNotifier;
}

- (void)setIdentificationEntriesChangedNotifier:(id)a3
{
}

- (NSArray)cachedCallDirectoryStoreExtensions
{
  return self->_cachedCallDirectoryStoreExtensions;
}

- (void)setCachedCallDirectoryStoreExtensions:(id)a3
{
}

- (BOOL)afterFirstUnlock
{
  return self->_afterFirstUnlock;
}

- (void)setAfterFirstUnlock:(BOOL)a3
{
  self->_afterFirstUnlock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCallDirectoryStoreExtensions, 0);
  objc_storeStrong((id *)&self->_identificationEntriesChangedNotifier, 0);
  objc_storeStrong((id *)&self->_extensionsDataSource, 0);
  objc_storeStrong((id *)&self->_liveLookupStore, 0);
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end