@interface _GEOCountryConfigurationRemoteProxy
- (_GEOCountryConfigurationRemoteProxy)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (void)dealloc;
- (void)updateCountryCodeWithCallbackQueue:(id)a3 callback:(id)a4;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation _GEOCountryConfigurationRemoteProxy

- (_GEOCountryConfigurationRemoteProxy)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_GEOCountryConfigurationRemoteProxy;
  v8 = [(_GEOCountryConfigurationRemoteProxy *)&v17 init];
  if (v8)
  {
    uint64_t v9 = geo_dispatch_queue_create();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v8->_delegateQueue, a4);
    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_DeviceCountryCodeSourced, (uint64_t)off_1E9113928, v8->_queue, v8);
    objc_initWeak(&location, v8);
    v11 = v8->_queue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70___GEOCountryConfigurationRemoteProxy_initWithDelegate_delegateQueue___block_invoke;
    v14[3] = &unk_1E53DD2C0;
    objc_copyWeak(&v15, &location);
    notify_register_dispatch("com.apple.GeoServices.countryProvidersChanged", &v8->_providersChangedToken, v11, v14);
    v12 = v8;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  v4 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "Received country code change notification. Informing delegate.", buf, 2u);
  }

  v5 = +[_GEOCountryConfigurationInfo get]();
  delegateQueue = self->_delegateQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67___GEOCountryConfigurationRemoteProxy_valueChangedForGEOConfigKey___block_invoke;
  v8[3] = &unk_1E53D8998;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(delegateQueue, v8);
}

- (void)updateCountryCodeWithCallbackQueue:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[GEOXPCConnection createServerConnectionFor:1 debugIdentifier:@"CountryConfiguration" eventHandler:0];
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"country.update", @"message", 0);
  v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83___GEOCountryConfigurationRemoteProxy_updateCountryCodeWithCallbackQueue_callback___block_invoke;
  v14[3] = &unk_1E53DE268;
  id v15 = v6;
  id v16 = v7;
  id v12 = v6;
  id v13 = v7;
  [v8 sendMessage:v10 withReply:queue handler:v14];
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForKey(GEOConfigKey_Invalid, unk_1E91186C0, self);
  notify_cancel(self->_countryCodeChangedToken);
  notify_cancel(self->_providersChangedToken);
  v3.receiver = self;
  v3.super_class = (Class)_GEOCountryConfigurationRemoteProxy;
  [(_GEOCountryConfigurationRemoteProxy *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end