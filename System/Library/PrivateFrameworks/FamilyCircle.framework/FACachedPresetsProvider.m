@interface FACachedPresetsProvider
- (FACachedPresetsProvider)initWithNetworkService:(id)a3 cache:(id)a4 storeFrontProvider:(id)a5;
- (FANetworkService)networkService;
- (FASettingPresetsCache)cache;
- (FAStoreFrontProvider)storeFrontProvider;
- (id)availablePresets;
- (void)currentConfigurationForDSID:(id)a3 completion:(id)a4;
- (void)setCache:(id)a3;
- (void)setNetworkService:(id)a3;
- (void)setStoreFrontProvider:(id)a3;
@end

@implementation FACachedPresetsProvider

- (FACachedPresetsProvider)initWithNetworkService:(id)a3 cache:(id)a4 storeFrontProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FACachedPresetsProvider;
  v12 = [(FACachedPresetsProvider *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_networkService, a3);
    objc_storeStrong((id *)&v13->_cache, a4);
    objc_storeStrong((id *)&v13->_storeFrontProvider, a5);
  }

  return v13;
}

- (id)availablePresets
{
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Fetching available presets from cache.", buf, 2u);
  }

  v4 = [(FACachedPresetsProvider *)self storeFrontProvider];
  v5 = [v4 fetchCurrentStoreFront];
  v6 = [v5 then];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000B09C;
  v14[3] = &unk_10004D588;
  v14[4] = self;
  v7 = ((void (**)(void, void *))v6)[2](v6, v14);
  v8 = [v7 then];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000B18C;
  v13[3] = &unk_10004D5B0;
  v13[4] = self;
  id v9 = ((void (**)(void, void *))v8)[2](v8, v13);
  id v10 = [v9 then];
  id v11 = ((void (**)(void, Block_layout *))v10)[2](v10, &stru_10004D5F0);

  return v11;
}

- (void)currentConfigurationForDSID:(id)a3 completion:(id)a4
{
  id v4 = a4;
  v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fetching current preset from FACachedPresetsProvider is not available", v6, 2u);
  }

  (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
}

- (FANetworkService)networkService
{
  return self->_networkService;
}

- (void)setNetworkService:(id)a3
{
}

- (FASettingPresetsCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (FAStoreFrontProvider)storeFrontProvider
{
  return self->_storeFrontProvider;
}

- (void)setStoreFrontProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeFrontProvider, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_networkService, 0);
}

@end