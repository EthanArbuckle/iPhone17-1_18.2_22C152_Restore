@interface TransactionStore
- (void)dealloc;
- (void)init;
@end

@implementation TransactionStore

- (void)init
{
  if (!a1) {
    return 0;
  }
  v10.receiver = a1;
  v10.super_class = (Class)TransactionStore;
  v1 = objc_msgSendSuper2(&v10, "init");
  if (v1)
  {
    v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.AppStoreFoundation.TransactionStore", v2);
    v4 = (void *)v1[1];
    v1[1] = v3;

    v1[3] = 5000000000;
    id v5 = objc_alloc_init((Class)NSCountedSet);
    v6 = (void *)v1[4];
    v1[4] = v5;

    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = (void *)v1[5];
    v1[5] = v7;

    v1 = v1;
    v1[2] = os_state_add_handler();
  }
  return v1;
}

- (void)dealloc
{
  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)TransactionStore;
  [(TransactionStore *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionStore, 0);
  objc_storeStrong((id *)&self->_transactionCount, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end