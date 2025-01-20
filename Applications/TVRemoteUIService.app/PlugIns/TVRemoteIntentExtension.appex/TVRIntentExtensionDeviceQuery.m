@interface TVRIntentExtensionDeviceQuery
+ (id)sharedInstance;
- (TVRCDeviceQuery)deviceQuery;
- (void)provideDeviceOptionsWithCompletion:(id)a3;
- (void)setDeviceQuery:(id)a3;
@end

@implementation TVRIntentExtensionDeviceQuery

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return v2;
}

void __47__TVRIntentExtensionDeviceQuery_sharedInstance__block_invoke(id a1)
{
  sharedInstance_sharedInstance_0 = objc_alloc_init(TVRIntentExtensionDeviceQuery);

  _objc_release_x1();
}

- (void)provideDeviceOptionsWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __68__TVRIntentExtensionDeviceQuery_provideDeviceOptionsWithCompletion___block_invoke;
  v4[3] = &unk_1000105C0;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

void __68__TVRIntentExtensionDeviceQuery_provideDeviceOptionsWithCompletion___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    v2 = _TVRIntentExtensionLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Starting device query", buf, 2u);
    }

    id v3 = objc_alloc_init((Class)TVRCDeviceQuery);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    [*(id *)(*(void *)(a1 + 32) + 8) start];
  }
  dispatch_time_t v6 = dispatch_time(0, 3000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __68__TVRIntentExtensionDeviceQuery_provideDeviceOptionsWithCompletion___block_invoke_2;
  v8[3] = &unk_1000105C0;
  v7 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v8);
}

void __68__TVRIntentExtensionDeviceQuery_provideDeviceOptionsWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v22 = a1;
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) devices];
  id v4 = [v3 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v8 connectionType] == (id)1 && objc_msgSend(v8, "isPaired"))
        {
          id v9 = _TVRIntentExtensionLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v28 = v8;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Found paired device=%{public}@", buf, 0xCu);
          }

          id v10 = objc_alloc((Class)TVRDevice);
          v11 = [v8 identifier];
          v12 = [v8 name];
          v13 = [v8 name];
          id v14 = [v10 initWithIdentifier:v11 displayString:v12 pronunciationHint:v13];
          [v2 addObject:v14];
        }
        else
        {
          v11 = _TVRIntentExtensionLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v28 = v8;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Ignoring since it is not paired or discovered via Rapport, device=%{public}@", buf, 0xCu);
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v5);
  }

  [*(id *)(*(void *)(v22 + 32) + 8) stop];
  uint64_t v15 = *(void *)(v22 + 32);
  v16 = *(void **)(v15 + 8);
  *(void *)(v15 + 8) = 0;

  id v17 = [v2 count];
  v18 = _TVRIntentExtensionLog();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v2;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Calling device options completion with list=%{public}@", buf, 0xCu);
    }

    uint64_t v20 = *(void *)(v22 + 40);
    id v21 = [objc_alloc((Class)INObjectCollection) initWithItems:v2];
    (*(void (**)(uint64_t, id, void))(v20 + 16))(v20, v21, 0);
  }
  else
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Calling device options completion with nil list since no devices were found", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(v22 + 40) + 16))();
  }
}

- (TVRCDeviceQuery)deviceQuery
{
  return self->_deviceQuery;
}

- (void)setDeviceQuery:(id)a3
{
}

- (void).cxx_destruct
{
}

@end