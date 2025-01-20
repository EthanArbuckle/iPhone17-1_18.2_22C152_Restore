@interface FAICSSPresetsProvider
- (FAICSSPresetsProvider)initWithNetworkService:(id)a3 storeFrontProvider:(id)a4;
- (FAStoreFrontProvider)storeFrontProvider;
- (STPresetsClient)stPresetsClient;
- (id)availablePresets;
- (void)currentConfigurationForDSID:(id)a3 completion:(id)a4;
- (void)setStPresetsClient:(id)a3;
- (void)setStoreFrontProvider:(id)a3;
@end

@implementation FAICSSPresetsProvider

- (FAICSSPresetsProvider)initWithNetworkService:(id)a3 storeFrontProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FAICSSPresetsProvider;
  v8 = [(FANetworkClient *)&v14 initWithNetworkService:v6];
  if (v8)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v9 = (void *)qword_10005EF50;
    uint64_t v19 = qword_10005EF50;
    if (!qword_10005EF50)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100010170;
      v15[3] = &unk_10004DAB0;
      v15[4] = &v16;
      sub_100010170((uint64_t)v15);
      v9 = (void *)v17[3];
    }
    v10 = v9;
    _Block_object_dispose(&v16, 8);
    v11 = (STPresetsClient *)objc_alloc_init(v10);
    stPresetsClient = v8->_stPresetsClient;
    v8->_stPresetsClient = v11;

    objc_storeStrong((id *)&v8->_storeFrontProvider, a4);
  }

  return v8;
}

- (id)availablePresets
{
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Fetching available presets from icss.", buf, 2u);
  }

  v4 = objc_alloc_init(FASettingPresetsCache);
  *(void *)buf = 0;
  v21 = buf;
  uint64_t v22 = 0x3032000000;
  v23 = sub_10000FB8C;
  v24 = sub_10000FB9C;
  id v25 = 0;
  v5 = [(FAICSSPresetsProvider *)self storeFrontProvider];
  id v6 = [v5 fetchCurrentStoreFront];
  id v7 = [v6 then];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000FBA4;
  v19[3] = &unk_10004D588;
  v19[4] = self;
  v8 = ((void (**)(void, void *))v7)[2](v7, v19);
  v9 = [v8 then];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000FC94;
  v18[3] = &unk_10004DA18;
  v18[4] = self;
  v18[5] = buf;
  v10 = ((void (**)(void, void *))v9)[2](v9, v18);
  v11 = [v10 then];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000FD20;
  v15[3] = &unk_10004DA60;
  v12 = v4;
  uint64_t v16 = v12;
  v17 = buf;
  v13 = ((void (**)(void, void *))v11)[2](v11, v15);

  _Block_object_dispose(buf, 8);
  return v13;
}

- (void)currentConfigurationForDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching presets from screentime client", buf, 2u);
  }

  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v9 = (void *)qword_10005EF60;
  uint64_t v24 = qword_10005EF60;
  if (!qword_10005EF60)
  {
    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    uint64_t v18 = sub_100010338;
    uint64_t v19 = &unk_10004DAB0;
    v20 = &v21;
    sub_100010338((uint64_t)buf);
    v9 = (void *)v22[3];
  }
  v10 = v9;
  _Block_object_dispose(&v21, 8);
  id v11 = [[v10 alloc] initWithDSID:v6];
  v12 = [(FAICSSPresetsProvider *)self stPresetsClient];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100010014;
  v14[3] = &unk_10004DA88;
  id v15 = v7;
  id v13 = v7;
  [v12 currentConfigurationForUserID:v11 completionHandler:v14];
}

- (STPresetsClient)stPresetsClient
{
  return self->_stPresetsClient;
}

- (void)setStPresetsClient:(id)a3
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
  objc_storeStrong((id *)&self->_stPresetsClient, 0);
}

@end