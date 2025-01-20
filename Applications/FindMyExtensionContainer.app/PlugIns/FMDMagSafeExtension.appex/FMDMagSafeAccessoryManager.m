@interface FMDMagSafeAccessoryManager
+ (id)sharedInstance;
- (BOOL)isExtension;
- (FMDCoreAccessoryManager)caAccessoryManager;
- (FMDMagSafeAccessoryManager)init;
- (FMDMagSafeDataStore)dataSource;
- (FMDMagSafeProtocol)connectedAccessory;
- (FMFuture)launchFlowFuture;
- (NSDictionary)allAccessories;
- (OS_dispatch_group)caGroup;
- (OS_dispatch_queue)serialQueue;
- (id)connectdAccessoryWithSerialNumber:(id)a3;
- (id)getAllAccessories;
- (id)getFindMyEnabledAccessories;
- (id)styleFor:(id)a3;
- (void)accessoryDidConnect:(id)a3;
- (void)accessoryDidDisconnect:(id)a3;
- (void)accessoryDidUpdate:(id)a3;
- (void)conncetionStatusFor:(id)a3 withCompletion:(id)a4;
- (void)launchSetupModuleWithInfo2:(id)a3 withCompletion:(id)a4;
- (void)launchSetupModuleWithInfo:(id)a3 withCompletion:(id)a4;
- (void)removeAccesoryWithSerialNumber:(id)a3 completion:(id)a4;
- (void)setAllAccessories:(id)a3;
- (void)setCaAccessoryManager:(id)a3;
- (void)setCaGroup:(id)a3;
- (void)setConnectedAccessory:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setLaunchFlowFuture:(id)a3;
- (void)setPhoneNumberForAccessoryId:(id)a3 phoneNumber:(id)a4 completion:(id)a5;
- (void)setSerialQueue:(id)a3;
- (void)updateCompletedFor:(id)a3 withCompletion:(id)a4;
@end

@implementation FMDMagSafeAccessoryManager

+ (id)sharedInstance
{
  if (qword_100031358 != -1) {
    dispatch_once(&qword_100031358, &stru_100025538);
  }
  v2 = (void *)qword_100031350;

  return v2;
}

- (FMDMagSafeAccessoryManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)FMDMagSafeAccessoryManager;
  v2 = [(FMDMagSafeAccessoryManager *)&v16 init];
  if (v2)
  {
    v3 = +[FMDMagSafeDataStore sharedInstance];
    [(FMDMagSafeAccessoryManager *)v2 setDataSource:v3];

    v4 = [(FMDMagSafeAccessoryManager *)v2 getFindMyEnabledAccessories];
    [(FMDMagSafeAccessoryManager *)v2 setAllAccessories:v4];

    v5 = sub_100006910();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "initialising core accessory manager", v15, 2u);
    }

    dispatch_queue_t v6 = dispatch_queue_create("FMDMagSafeAccessoryManager.serialQueue", 0);
    [(FMDMagSafeAccessoryManager *)v2 setSerialQueue:v6];

    dispatch_group_t v7 = dispatch_group_create();
    [(FMDMagSafeAccessoryManager *)v2 setCaGroup:v7];

    v8 = [(FMDMagSafeAccessoryManager *)v2 caGroup];
    dispatch_group_enter(v8);

    v9 = [[FMDCoreAccessoryManager alloc] initWithDelegate:v2];
    [(FMDMagSafeAccessoryManager *)v2 setCaAccessoryManager:v9];

    v10 = [(FMDMagSafeAccessoryManager *)v2 caGroup];
    dispatch_time_t v11 = dispatch_time(0, 1000000000);
    intptr_t v12 = dispatch_group_wait(v10, v11);

    if (v12)
    {
      v13 = sub_100002E38();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100016C08();
      }
    }
  }
  return v2;
}

- (id)getFindMyEnabledAccessories
{
  v2 = [(FMDMagSafeAccessoryManager *)self dataSource];
  v3 = [v2 readAllAccessoriesFromDisk];

  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        dispatch_time_t v11 = [v5 objectForKeyedSubscript:v10];
        if ([v11 findMyEnabled]) {
          [v4 setObject:v11 forKeyedSubscript:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)getAllAccessories
{
  v3 = [(FMDMagSafeAccessoryManager *)self getFindMyEnabledAccessories];
  [(FMDMagSafeAccessoryManager *)self setAllAccessories:v3];

  return [(FMDMagSafeAccessoryManager *)self allAccessories];
}

- (void)conncetionStatusFor:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = [(FMDMagSafeAccessoryManager *)self allAccessories];
  v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
    uint64_t v10 = sub_100002E38();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100016C70();
    }

    dispatch_time_t v11 = +[NSError errorWithMessage:@"accessory not found"];
    v7[2](v7, 0, v11);
  }
  intptr_t v12 = [(FMDMagSafeAccessoryManager *)self allAccessories];
  long long v13 = [v12 objectForKeyedSubscript:v6];
  long long v14 = [v13 serialNumbers];
  long long v15 = [v14 objectForKeyedSubscript:@"systemSerialNumber"];

  long long v16 = [(FMDMagSafeAccessoryManager *)self connectdAccessoryWithSerialNumber:v15];
  ((void (**)(id, BOOL, void *))v7)[2](v7, v16 != 0, 0);
}

- (id)styleFor:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDMagSafeAccessoryManager *)self allAccessories];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = [(FMDMagSafeAccessoryManager *)self allAccessories];
    uint64_t v8 = [v7 objectForKeyedSubscript:v4];
    v9 = [v8 style];
  }
  else
  {
    uint64_t v10 = sub_100002E38();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100016C70();
    }

    v9 = 0;
  }

  return v9;
}

- (void)removeAccesoryWithSerialNumber:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_100006910();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing accessory with serialnumber %@", buf, 0xCu);
  }

  +[FMPreferencesUtil removeKey:v6 inDomain:kFMDNotBackedUpMagSafePrefDomain];
  v9 = [(FMDMagSafeAccessoryManager *)self connectdAccessoryWithSerialNumber:v6];
  uint64_t v10 = sub_100006910();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Accessory is connected removing keys", buf, 2u);
    }

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000DDDC;
    v18[3] = &unk_100025588;
    v18[4] = self;
    id v19 = v6;
    id v20 = v7;
    id v12 = v7;
    [v9 removeKeysWithCompletion:v18];
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Accessory not connected removing keys from device", buf, 2u);
    }

    id v12 = +[NSString stringWithFormat:@"com.apple.accessoryd.mfi4.userPublicKey.%@", v6];
    long long v13 = sub_100006910();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "handle_NVMEraseResponse: featureTag: %@", buf, 0xCu);
    }

    MFi4AuthFeatureGroup();
    DeleteSynchronizableKeyForAuthFeature();
    long long v14 = [(FMDMagSafeAccessoryManager *)self dataSource];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000E078;
    v16[3] = &unk_100025560;
    v16[4] = self;
    id v17 = v7;
    id v15 = v7;
    [v14 removeAccessoryWithSerialNumber:v6 withCompletion:v16];
  }
}

- (id)connectdAccessoryWithSerialNumber:(id)a3
{
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(FMDMagSafeAccessoryManager *)self caAccessoryManager];
  id v6 = [v5 accessoryRawInfo];
  id v7 = [v6 allValues];

  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        BOOL v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v12 = +[FMDAccessoryTypeValidator sharedInstance];
        long long v13 = [v11 accessoryType];
        if ([v12 isAllowedAccessoryWithType:v13]
          && [v11 isMF4i])
        {
          unsigned int v14 = [v11 authPassed];

          if (v14)
          {
            id v15 = [v11 serialNumber];
            unsigned __int8 v16 = [v4 isEqualToString:v15];

            if (v16)
            {
              id v8 = v11;
              goto LABEL_14;
            }
          }
        }
        else
        {
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
LABEL_14:

  return v8;
}

- (void)setPhoneNumberForAccessoryId:(id)a3 phoneNumber:(id)a4 completion:(id)a5
{
  id v5 = (void (**)(id, void *))a5;
  id v6 = sub_100006910();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "not supported", v8, 2u);
  }

  id v7 = +[NSError errorWithMessage:@"Not supported"];
  v5[2](v5, v7);
}

- (void)launchSetupModuleWithInfo:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FMDMagSafeAccessoryManager *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E518;
  block[3] = &unk_100024900;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)launchSetupModuleWithInfo2:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100002E38();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "### get asked to launch setup module with info = %@", buf, 0xCu);
  }

  id v9 = [(FMDMagSafeAccessoryManager *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E9C0;
  block[3] = &unk_100024900;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)updateCompletedFor:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FMDMagSafeAccessoryManager *)self connectdAccessoryWithSerialNumber:v6];
  id v9 = sub_100002AA8();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "### setting keysUpdated for %@", buf, 0xCu);
  }

  if (v8)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000100B4;
    v11[3] = &unk_1000256D0;
    id v12 = v8;
    id v13 = v6;
    id v14 = v7;
    [v12 getPairingDataWithCompletion:v11];
  }
  else
  {
    id v10 = sub_100002AA8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "### accessory not connected storing the operation", buf, 2u);
    }

    +[FMPreferencesUtil setBool:1 forKey:v6 inDomain:kFMDNotBackedUpMagSafePrefDomain];
  }
}

- (void)accessoryDidConnect:(id)a3
{
  id v4 = a3;
  id v5 = sub_100006910();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[FMDMagSafeAccessoryManager accessoryDidConnect:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  id v6 = [(FMDMagSafeAccessoryManager *)self caGroup];

  if (v6)
  {
    id v7 = [(FMDMagSafeAccessoryManager *)self caGroup];
    dispatch_group_leave(v7);

    [(FMDMagSafeAccessoryManager *)self setCaGroup:0];
  }
  id v8 = [(FMDMagSafeAccessoryManager *)self connectdAccessoryWithSerialNumber:v4];
  [(FMDMagSafeAccessoryManager *)self setConnectedAccessory:v8];

  id v9 = [(FMDMagSafeAccessoryManager *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001042C;
  block[3] = &unk_1000248B0;
  block[4] = self;
  dispatch_async(v9, block);
}

- (void)accessoryDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = sub_100006910();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[FMDMagSafeAccessoryManager accessoryDidDisconnect:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v6, 0x16u);
  }

  [(FMDMagSafeAccessoryManager *)self setConnectedAccessory:0];
}

- (void)accessoryDidUpdate:(id)a3
{
  id v3 = a3;
  id v4 = sub_100006910();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    int v6 = "-[FMDMagSafeAccessoryManager accessoryDidUpdate:]";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v5, 0x16u);
  }
}

- (BOOL)isExtension
{
  return 1;
}

- (NSDictionary)allAccessories
{
  return self->_allAccessories;
}

- (void)setAllAccessories:(id)a3
{
}

- (FMDMagSafeDataStore)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (FMDCoreAccessoryManager)caAccessoryManager
{
  return self->_caAccessoryManager;
}

- (void)setCaAccessoryManager:(id)a3
{
}

- (FMDMagSafeProtocol)connectedAccessory
{
  return self->_connectedAccessory;
}

- (void)setConnectedAccessory:(id)a3
{
}

- (OS_dispatch_group)caGroup
{
  return self->_caGroup;
}

- (void)setCaGroup:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (FMFuture)launchFlowFuture
{
  return self->_launchFlowFuture;
}

- (void)setLaunchFlowFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchFlowFuture, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_caGroup, 0);
  objc_storeStrong((id *)&self->_connectedAccessory, 0);
  objc_storeStrong((id *)&self->_caAccessoryManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_allAccessories, 0);
}

@end