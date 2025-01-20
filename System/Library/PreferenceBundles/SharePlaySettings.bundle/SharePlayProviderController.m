@interface SharePlayProviderController
- (BOOL)isEnabled;
- (CPApplicationPolicyManager)applicationPolicyManager;
- (NSArray)providers;
- (NSMutableDictionary)providerByBundleIdentifier;
- (OS_dispatch_queue)queue;
- (SharePlayProviderController)init;
- (SharePlayProviderControllerDelegate)delegateController;
- (id)mutableProviderForBundleIdentifier:(id)a3;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)applicationPolicyManager:(id)a3 authorizationChangedForBundleIdentifier:(id)a4;
- (void)removeDelegate:(id)a3;
- (void)setApplicationPolicyManager:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setProvider:(id)a3 forBundleIdentifier:(id)a4;
- (void)setProviders:(id)a3;
- (void)setSharePlayEnabled:(BOOL)a3 forProvider:(id)a4;
- (void)updateProviderByBundleIdentifier;
- (void)updateProviders;
@end

@implementation SharePlayProviderController

- (SharePlayProviderController)init
{
  v18.receiver = self;
  v18.super_class = (Class)SharePlayProviderController;
  v2 = [(SharePlayProviderController *)&v18 init];
  if (v2)
  {
    id v3 = +[NSString stringWithFormat:@"com.apple.SharePlaySettings.queue.%@.%p", objc_opt_class(), v2];
    v4 = (const char *)[v3 UTF8String];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = +[CPApplicationPolicyManager sharedInstance];
    applicationPolicyManager = v2->_applicationPolicyManager;
    v2->_applicationPolicyManager = (CPApplicationPolicyManager *)v8;

    [(CPApplicationPolicyManager *)v2->_applicationPolicyManager addDelegate:v2 withQueue:v2->_queue];
    v10 = (SharePlayProviderControllerDelegate *)objc_alloc_init((Class)TUDelegateController);
    delegateController = v2->_delegateController;
    v2->_delegateController = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    providerByBundleIdentifier = v2->_providerByBundleIdentifier;
    v2->_providerByBundleIdentifier = v12;

    v14 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_20F0;
    block[3] = &unk_82E0;
    v17 = v2;
    dispatch_async(v14, block);
  }
  return v2;
}

- (BOOL)isEnabled
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  id v3 = [(SharePlayProviderController *)self applicationPolicyManager];
  if (objc_opt_respondsToSelector())
  {
    v4 = [(SharePlayProviderController *)self queue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_2208;
    v7[3] = &unk_8308;
    v9 = &v10;
    id v8 = v3;
    dispatch_sync(v4, v7);
  }
  char v5 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)setEnabled:(BOOL)a3
{
  char v5 = [(SharePlayProviderController *)self applicationPolicyManager];
  if (objc_opt_respondsToSelector())
  {
    dispatch_queue_t v6 = [(SharePlayProviderController *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2308;
    block[3] = &unk_8330;
    BOOL v10 = a3;
    id v8 = v5;
    v9 = self;
    dispatch_async(v6, block);
  }
}

- (NSArray)providers
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  BOOL v10 = sub_25BC;
  v11 = sub_25CC;
  id v12 = 0;
  id v3 = [(SharePlayProviderController *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_25D4;
  v6[3] = &unk_8308;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)setProviders:(id)a3
{
  char v5 = (NSArray *)a3;
  dispatch_queue_t v6 = [(SharePlayProviderController *)self queue];
  dispatch_assert_queue_V2(v6);

  if (self->_providers != v5)
  {
    objc_storeStrong((id *)&self->_providers, a3);
    uint64_t v7 = [(SharePlayProviderController *)self delegateController];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_26D0;
    v8[3] = &unk_83A8;
    v8[4] = self;
    uint64_t v9 = v5;
    [v7 enumerateDelegatesUsingBlock:v8];
  }
}

- (void)setSharePlayEnabled:(BOOL)a3 forProvider:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SharePlayProviderController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2870;
  block[3] = &unk_8330;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)setProvider:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SharePlayProviderController *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(SharePlayProviderController *)self providerByBundleIdentifier];
  id v10 = [v9 objectForKeyedSubscript:v7];

  if ((TUObjectsAreEqualOrNil() & 1) == 0)
  {
    id v11 = [v6 copy];
    id v12 = [(SharePlayProviderController *)self providerByBundleIdentifier];
    [v12 setObject:v11 forKeyedSubscript:v7];

    [(SharePlayProviderController *)self updateProviders];
    if (v10)
    {
      char v13 = [(SharePlayProviderController *)self delegateController];
      if (v6)
      {
        v28 = _NSConcreteStackBlock;
        uint64_t v29 = 3221225472;
        v30 = sub_2B08;
        v31 = &unk_83A8;
        v32 = self;
        v14 = &v33;
        id v33 = v6;
        v15 = &v28;
      }
      else
      {
        v22 = _NSConcreteStackBlock;
        uint64_t v23 = 3221225472;
        v24 = sub_2BEC;
        v25 = &unk_83A8;
        v26 = self;
        v14 = &v27;
        id v27 = v10;
        v15 = &v22;
      }
    }
    else
    {
      char v13 = [(SharePlayProviderController *)self delegateController];
      v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      objc_super v18 = sub_2CD0;
      v19 = &unk_83A8;
      v20 = self;
      v14 = &v21;
      id v21 = v6;
      v15 = &v16;
    }
    objc_msgSend(v13, "enumerateDelegatesUsingBlock:", v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31,
      v32,
      v33);
  }
}

- (id)mutableProviderForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v12 = 0;
  id v4 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v12];
  id v5 = v12;
  if (v4)
  {
    id v6 = [(SharePlayProvider *)[SharePlayMutableProvider alloc] initWithBundleIdentifier:v3];
    id v7 = +[UIScreen mainScreen];
    [v7 scale];
    id v8 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v3, 0);
    [(SharePlayProvider *)v6 setIconImage:v8];

    uint64_t v9 = [v4 localizedName];
    [(SharePlayProvider *)v6 setLocalizedName:v9];
  }
  else
  {
    uint64_t v9 = SharePlaySettingsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_4DD8((uint64_t)v3, (uint64_t)v5, v9);
    }
    id v6 = 0;
  }

  id v10 = [(SharePlayMutableProvider *)v6 copy];

  return v10;
}

- (void)updateProviderByBundleIdentifier
{
  id v3 = [(SharePlayProviderController *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SharePlayProviderController *)self providerByBundleIdentifier];
  [v4 removeAllObjects];

  id v5 = [(SharePlayProviderController *)self applicationPolicyManager];
  id v6 = [v5 authorizedBundleIdentifiers];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = objc_msgSend(v6, "allKeys", 0);
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        char v13 = [(SharePlayProviderController *)self mutableProviderForBundleIdentifier:v12];
        if (v13)
        {
          v14 = [v6 objectForKeyedSubscript:v12];
          objc_msgSend(v13, "setEnabled:", objc_msgSend(v14, "BOOLValue"));

          id v15 = [v13 copy];
          v16 = [(SharePlayProviderController *)self providerByBundleIdentifier];
          [v16 setObject:v15 forKeyedSubscript:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  [(SharePlayProviderController *)self updateProviders];
}

- (void)updateProviders
{
  id v3 = [(SharePlayProviderController *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SharePlayProviderController *)self providerByBundleIdentifier];
  id v5 = [v4 allValues];
  id v6 = [v5 sortedArrayUsingComparator:&stru_83E8];

  [(SharePlayProviderController *)self setProviders:v6];
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SharePlayProviderController *)self delegateController];
  [v8 addDelegate:v7 queue:v6];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(SharePlayProviderController *)self delegateController];
  [v5 removeDelegate:v4];
}

- (void)applicationPolicyManager:(id)a3 authorizationChangedForBundleIdentifier:(id)a4
{
  id v12 = a4;
  id v5 = [(SharePlayProviderController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(SharePlayProviderController *)self applicationPolicyManager];
  id v7 = [v6 authorizedBundleIdentifiers];
  id v8 = [v7 objectForKeyedSubscript:v12];

  if (v8)
  {
    id v9 = [(SharePlayProviderController *)self providerByBundleIdentifier];
    uint64_t v10 = [v9 objectForKeyedSubscript:v12];
    id v11 = [v10 mutableCopy];

    if (!v11)
    {
      id v11 = [(SharePlayProviderController *)self mutableProviderForBundleIdentifier:v12];
    }
    objc_msgSend(v11, "setEnabled:", objc_msgSend(v8, "BOOLValue"));
  }
  else
  {
    id v11 = 0;
  }
  [(SharePlayProviderController *)self setProvider:v11 forBundleIdentifier:v12];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CPApplicationPolicyManager)applicationPolicyManager
{
  return self->_applicationPolicyManager;
}

- (void)setApplicationPolicyManager:(id)a3
{
}

- (NSMutableDictionary)providerByBundleIdentifier
{
  return self->_providerByBundleIdentifier;
}

- (SharePlayProviderControllerDelegate)delegateController
{
  return self->_delegateController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateController, 0);
  objc_storeStrong((id *)&self->_providerByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationPolicyManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_providers, 0);
}

@end