@interface SGCuratedChangeNotificationsAddressBookListener
- (void)startListening;
- (void)stopListening;
@end

@implementation SGCuratedChangeNotificationsAddressBookListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenterToken, 0);
}

- (void)stopListening
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_notificationCenterToken];
}

- (void)startListening
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v4 = objc_claimAutoreleasedReturnValue();
  v5 = (const char *)[v4 UTF8String];
  v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v7 = (OS_dispatch_queue *)dispatch_queue_create(v5, v6);
  notificationQueue = self->_notificationQueue;
  self->_notificationQueue = v7;

  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v10 = *MEMORY[0x1E4F1AF80];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__SGCuratedChangeNotificationsAddressBookListener_startListening__block_invoke;
  v13[3] = &unk_1E65B9030;
  objc_copyWeak(&v14, &location);
  v11 = [v9 addObserverForName:v10 object:0 queue:0 usingBlock:v13];
  notificationCenterToken = self->_notificationCenterToken;
  self->_notificationCenterToken = v11;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __65__SGCuratedChangeNotificationsAddressBookListener_startListening__block_invoke(uint64_t a1)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__SGCuratedChangeNotificationsAddressBookListener_startListening__block_invoke_2;
    block[3] = &unk_1E65BEF88;
    block[4] = v2;
    dispatch_async_and_wait(v3, block);
  }
}

uint64_t __65__SGCuratedChangeNotificationsAddressBookListener_startListening__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) fire];
}

@end