@interface CDXRetrieveExtensionEnabledStatusOperation
- (CDXRetrieveExtensionEnabledStatusOperation)initWithExtensionIdentifier:(id)a3 queue:(id)a4 store:(id)a5;
- (CDXRetrieveExtensionEnabledStatusOperation)initWithExtensionIdentifier:(id)a3 store:(id)a4;
- (CXCallDirectoryStore)store;
- (NSString)extensionIdentifier;
- (OS_dispatch_queue)queue;
- (void)performWithCompletionHandler:(id)a3;
- (void)setExtensionIdentifier:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation CDXRetrieveExtensionEnabledStatusOperation

- (CDXRetrieveExtensionEnabledStatusOperation)initWithExtensionIdentifier:(id)a3 queue:(id)a4 store:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CDXRetrieveExtensionEnabledStatusOperation;
  v11 = [(CDXRetrieveExtensionEnabledStatusOperation *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a4);
    v13 = (NSString *)[v8 copy];
    extensionIdentifier = v12->_extensionIdentifier;
    v12->_extensionIdentifier = v13;

    objc_storeStrong((id *)&v12->_store, a5);
  }

  return v12;
}

- (CDXRetrieveExtensionEnabledStatusOperation)initWithExtensionIdentifier:(id)a3 store:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_queue_t v8 = dispatch_queue_create("com.apple.callkit.calldirectory.retrieveextensionenabledstatusoperation", 0);
  id v9 = [(CDXRetrieveExtensionEnabledStatusOperation *)self initWithExtensionIdentifier:v7 queue:v8 store:v6];

  return v9;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(CDXRetrieveExtensionEnabledStatusOperation *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000094B4;
  v7[3] = &unk_100034BB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
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
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end