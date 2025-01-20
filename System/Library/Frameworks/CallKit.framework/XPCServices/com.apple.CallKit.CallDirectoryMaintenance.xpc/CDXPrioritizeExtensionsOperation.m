@interface CDXPrioritizeExtensionsOperation
- (CDXNotifydNotifier)identificationEntriesChangedNotifier;
- (CDXPrioritizeExtensionsOperation)init;
- (CDXPrioritizeExtensionsOperation)initWithPrioritizedExtensionIdentifiers:(id)a3 store:(id)a4;
- (CDXPrioritizeExtensionsOperation)initWithPrioritizedExtensionIdentifiers:(id)a3 store:(id)a4 identificationEntriesChangedNotifier:(id)a5;
- (CXCallDirectoryStore)store;
- (NSArray)prioritizedExtensionIdentifiers;
- (OS_dispatch_queue)queue;
- (void)performWithCompletionHandler:(id)a3;
- (void)setIdentificationEntriesChangedNotifier:(id)a3;
- (void)setPrioritizedExtensionIdentifiers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation CDXPrioritizeExtensionsOperation

- (CDXPrioritizeExtensionsOperation)initWithPrioritizedExtensionIdentifiers:(id)a3 store:(id)a4 identificationEntriesChangedNotifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CDXPrioritizeExtensionsOperation;
  v11 = [(CDXPrioritizeExtensionsOperation *)&v17 init];
  if (v11)
  {
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.callkit.calldirectory.prioritizeextensionsoperation", 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v11->_store, a4);
    v14 = (NSArray *)[v8 copy];
    prioritizedExtensionIdentifiers = v11->_prioritizedExtensionIdentifiers;
    v11->_prioritizedExtensionIdentifiers = v14;

    objc_storeStrong((id *)&v11->_identificationEntriesChangedNotifier, a5);
  }

  return v11;
}

- (CDXPrioritizeExtensionsOperation)initWithPrioritizedExtensionIdentifiers:(id)a3 store:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [CDXNotifydNotifier alloc];
  id v9 = [(CDXNotifydNotifier *)v8 initWithNotificationName:CXCallDirectoryManagerIdentificationEntriesChangedNotification];
  id v10 = [(CDXPrioritizeExtensionsOperation *)self initWithPrioritizedExtensionIdentifiers:v7 store:v6 identificationEntriesChangedNotifier:v9];

  return v10;
}

- (CDXPrioritizeExtensionsOperation)init
{
  return 0;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(CDXPrioritizeExtensionsOperation *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012420;
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

- (CXCallDirectoryStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (NSArray)prioritizedExtensionIdentifiers
{
  return self->_prioritizedExtensionIdentifiers;
}

- (void)setPrioritizedExtensionIdentifiers:(id)a3
{
}

- (CDXNotifydNotifier)identificationEntriesChangedNotifier
{
  return self->_identificationEntriesChangedNotifier;
}

- (void)setIdentificationEntriesChangedNotifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identificationEntriesChangedNotifier, 0);
  objc_storeStrong((id *)&self->_prioritizedExtensionIdentifiers, 0);
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end