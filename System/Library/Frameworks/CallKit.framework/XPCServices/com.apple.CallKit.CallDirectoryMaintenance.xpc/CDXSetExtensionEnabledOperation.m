@interface CDXSetExtensionEnabledOperation
- (BOOL)_loadExtensionDataWithError:(id *)a3;
- (BOOL)isEnabled;
- (CDXAWDReporter)awdReporter;
- (CDXNotifydNotifier)identificationEntriesChangedNotifier;
- (CDXSetExtensionEnabledOperation)init;
- (CDXSetExtensionEnabledOperation)initWithExtensionIdentifier:(id)a3 enabled:(BOOL)a4 loadExtensionDataOperation:(id)a5 queue:(id)a6 store:(id)a7 identificationEntriesChangedNotifier:(id)a8;
- (CDXSetExtensionEnabledOperation)initWithExtensionIdentifier:(id)a3 enabled:(BOOL)a4 loadExtensionDataOperation:(id)a5 store:(id)a6;
- (CDXSetExtensionEnabledOperationLoadExtensionDataOperation)loadExtensionDataOperation;
- (CXCallDirectoryStore)store;
- (NSString)extensionIdentifier;
- (OS_dispatch_queue)queue;
- (void)performWithCompletionHandler:(id)a3;
- (void)setAwdReporter:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setExtensionIdentifier:(id)a3;
- (void)setIdentificationEntriesChangedNotifier:(id)a3;
- (void)setLoadExtensionDataOperation:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation CDXSetExtensionEnabledOperation

- (CDXSetExtensionEnabledOperation)initWithExtensionIdentifier:(id)a3 enabled:(BOOL)a4 loadExtensionDataOperation:(id)a5 queue:(id)a6 store:(id)a7 identificationEntriesChangedNotifier:(id)a8
{
  id v14 = a3;
  id v25 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)CDXSetExtensionEnabledOperation;
  v18 = [(CDXSetExtensionEnabledOperation *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a6);
    v20 = (NSString *)[v14 copy];
    extensionIdentifier = v19->_extensionIdentifier;
    v19->_extensionIdentifier = v20;

    v19->_enabled = a4;
    objc_storeStrong((id *)&v19->_loadExtensionDataOperation, a5);
    objc_storeStrong((id *)&v19->_store, a7);
    objc_storeStrong((id *)&v19->_identificationEntriesChangedNotifier, a8);
    v22 = objc_alloc_init(CDXAWDReporter);
    awdReporter = v19->_awdReporter;
    v19->_awdReporter = v22;
  }
  return v19;
}

- (CDXSetExtensionEnabledOperation)initWithExtensionIdentifier:(id)a3 enabled:(BOOL)a4 loadExtensionDataOperation:(id)a5 store:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  dispatch_queue_t v13 = dispatch_queue_create("com.apple.callkit.calldirectory.setextensionenabledoperation", 0);
  id v14 = [CDXNotifydNotifier alloc];
  id v15 = [(CDXNotifydNotifier *)v14 initWithNotificationName:CXCallDirectoryManagerIdentificationEntriesChangedNotification];
  id v16 = [(CDXSetExtensionEnabledOperation *)self initWithExtensionIdentifier:v12 enabled:v7 loadExtensionDataOperation:v11 queue:v13 store:v10 identificationEntriesChangedNotifier:v15];

  return v16;
}

- (CDXSetExtensionEnabledOperation)init
{
  return 0;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(CDXSetExtensionEnabledOperation *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000098CC;
  v7[3] = &unk_100034BB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)_loadExtensionDataWithError:(id *)a3
{
  v5 = [(CDXSetExtensionEnabledOperation *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  id v6 = [(CDXSetExtensionEnabledOperation *)self loadExtensionDataOperation];

  if (v6)
  {
    BOOL v7 = [(CDXSetExtensionEnabledOperation *)self loadExtensionDataOperation];
    [v7 setAllowLoadingDisabledExtensions:1];

    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = sub_10000A0C8;
    v22 = sub_10000A0D8;
    id v23 = 0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    v9 = [(CDXSetExtensionEnabledOperation *)self loadExtensionDataOperation];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000A0E0;
    v14[3] = &unk_100034DA8;
    id v16 = &v24;
    id v17 = &v18;
    id v10 = v8;
    id v15 = v10;
    [v9 performWithCompletionHandler:v14];

    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    if (a3) {
      *a3 = (id) v19[5];
    }

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v11 = sub_100006944();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100023D8C(v11);
    }

    if (a3)
    {
      *a3 = +[NSError cx_callDirectoryManagerErrorWithCode:0];
    }
  }
  char v12 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v24, 8);
  return v12;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void)setExtensionIdentifier:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (CDXSetExtensionEnabledOperationLoadExtensionDataOperation)loadExtensionDataOperation
{
  return self->_loadExtensionDataOperation;
}

- (void)setLoadExtensionDataOperation:(id)a3
{
}

- (CXCallDirectoryStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (CDXNotifydNotifier)identificationEntriesChangedNotifier
{
  return self->_identificationEntriesChangedNotifier;
}

- (void)setIdentificationEntriesChangedNotifier:(id)a3
{
}

- (CDXAWDReporter)awdReporter
{
  return self->_awdReporter;
}

- (void)setAwdReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awdReporter, 0);
  objc_storeStrong((id *)&self->_identificationEntriesChangedNotifier, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_loadExtensionDataOperation, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end