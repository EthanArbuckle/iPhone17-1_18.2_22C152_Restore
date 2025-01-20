@interface IDSStewieCTClient
- (BOOL)forceRollKeys;
- (BOOL)forceRollSMSConfigWipeAll:(BOOL)a3;
- (CoreTelephonyClient)coreTelephonyClient;
- (IDSStewieCTClient)initWithCoreTelephonyClient:(id)a3 queue:(id)a4;
- (IDSStewieCTClient)initWithQueue:(id)a3;
- (IDSStewieCTClientDelegate)delegate;
- (OS_dispatch_queue)queue;
- (void)didUpdateSessionKeys:(id)a3 withAnySuccess:(BOOL)a4;
- (void)fetchSessionKeysUpdate;
- (void)fetchStewieEnabledWithCompletion:(id)a3;
- (void)fetchStewieSMSConfig;
- (void)notifyAboutStewieBlocked:(BOOL)a3;
- (void)notifyStewieSMSConfigUpdated:(id)a3 withError:(id)a4 forSPSEnv:(id)a5;
- (void)satelliteMsgCfgChanged;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)stewieSupportChanged;
- (void)transportKeysChanged;
@end

@implementation IDSStewieCTClient

- (IDSStewieCTClient)initWithCoreTelephonyClient:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSStewieCTClient;
  v9 = [(IDSStewieCTClient *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coreTelephonyClient, a3);
    [(CoreTelephonyClient *)v10->_coreTelephonyClient setDelegate:v10];
    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

- (IDSStewieCTClient)initWithQueue:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:v4];
  v6 = [(IDSStewieCTClient *)self initWithCoreTelephonyClient:v5 queue:v4];

  return v6;
}

- (void)transportKeysChanged
{
  v3 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "transportKeysChanged called - need to fetch session key updates from CT", v4, 2u);
  }

  [(IDSStewieCTClient *)self fetchSessionKeysUpdate];
}

- (void)stewieSupportChanged
{
  v3 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "stewieSupportChanged called by CT.", buf, 2u);
  }

  id v4 = [(IDSStewieCTClient *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100328AE4;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)satelliteMsgCfgChanged
{
  v3 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "satelliteMsgCfgChanged called - need to fetch new SMS config from CT", v4, 2u);
  }

  [(IDSStewieCTClient *)self fetchStewieSMSConfig];
}

- (void)fetchSessionKeysUpdate
{
  v3 = [(IDSStewieCTClient *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Fetching session key updates from CT...", buf, 2u);
  }

  id v5 = [(IDSStewieCTClient *)self coreTelephonyClient];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100328CA0;
  v6[3] = &unk_100989160;
  v6[4] = self;
  [v5 getTransportKeysToUpdateWithCompletion:v6];
}

- (void)didUpdateSessionKeys:(id)a3 withAnySuccess:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(IDSStewieCTClient *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "didUpdateSessionKeys called - need to tell CT", buf, 2u);
  }

  if (CUTIsInternalInstall()) {
    IMGetSPSEnvironmentName();
  }
  else {
  uint64_t v9 = IMGetEnvironmentName();
  }
  v10 = (void *)v9;
  if (v4)
  {
    v30 = (void *)v9;
    id v11 = objc_alloc_init((Class)NSMutableArray);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v31 = v6;
    id v12 = v6;
    id v13 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v33;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v18 = objc_alloc((Class)CTTransportSTK);
          v19 = [v17 stk];
          id v20 = [v17 index];
          v21 = [v17 keyEPKI];
          id v22 = [v18 initWithSTK:v19 forIdx:v20 epki:v21];

          [v11 addObject:v22];
        }
        id v14 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v14);
    }

    v10 = v30;
    id v23 = [objc_alloc((Class)CTTransportKeysReceipt) initWith:v11 sps:v30];
    v24 = +[IDSFoundationLog stewieProvisioning];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [v11 count];
      *(_DWORD *)buf = 134218242;
      id v37 = v25;
      __int16 v38 = 2112;
      v39 = v30;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Sending CTTransportKeysReceipt with %ld key stks, spsEnv: %@", buf, 0x16u);
    }

    v26 = [(IDSStewieCTClient *)self coreTelephonyClient];
    v27 = [v26 setTransportKeysUpdated:1 with:v23];

    id v6 = v31;
  }
  else
  {
    id v23 = [objc_alloc((Class)CTTransportKeysReceipt) initWith:&__NSArray0__struct sps:v9];
    v28 = +[IDSFoundationLog stewieProvisioning];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v10;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Sending CTTransportKeysReceipt with 0 key stks, spsEnv: %@", buf, 0xCu);
    }

    id v11 = [(IDSStewieCTClient *)self coreTelephonyClient];
    v27 = [v11 setTransportKeysUpdated:1 with:v23];
  }

  if (v27)
  {
    v29 = +[IDSFoundationLog stewieProvisioning];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v27;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Confirmed updated session keys with error { confirmKeyError: %@ }", buf, 0xCu);
    }
  }
}

- (BOOL)forceRollKeys
{
  v3 = [(IDSStewieCTClient *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "forceRollKeys called. Telling CT", (uint8_t *)&v9, 2u);
  }

  id v5 = [(IDSStewieCTClient *)self coreTelephonyClient];
  id v6 = [v5 forceRollAllTransportKeys];

  id v7 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "forceRollAllTransportKeys finished { error : %@ }", (uint8_t *)&v9, 0xCu);
  }

  return v6 == 0;
}

- (BOOL)forceRollSMSConfigWipeAll:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(IDSStewieCTClient *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "forceRollSMSConfig called. Telling CT", (uint8_t *)&v11, 2u);
  }

  id v7 = [(IDSStewieCTClient *)self coreTelephonyClient];
  id v8 = [v7 reprovisionSatelliteMsg:v3];

  int v9 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "forceRollSMSConfig finished { error : %@ }", (uint8_t *)&v11, 0xCu);
  }

  return v8 == 0;
}

- (void)notifyAboutStewieBlocked:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(IDSStewieCTClient *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "notifyAboutStewieBlocked called. Telling CT", v8, 2u);
  }

  id v7 = [(IDSStewieCTClient *)self coreTelephonyClient];
  [v7 setStewieBlocked:v3 completion:&stru_100989180];
}

- (void)fetchStewieEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSStewieCTClient *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fetching Stewie enablement status from CT...", buf, 2u);
  }

  id v7 = [(IDSStewieCTClient *)self coreTelephonyClient];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100329968;
  v9[3] = &unk_1009891A8;
  id v10 = v4;
  id v8 = v4;
  [v7 getStewieSupportWithCompletion:v9];
}

- (void)fetchStewieSMSConfig
{
  BOOL v3 = [(IDSStewieCTClient *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Fetching Parakeet messaging SMS config from CT...", buf, 2u);
  }

  id v5 = [(IDSStewieCTClient *)self coreTelephonyClient];
  id v15 = 0;
  id v6 = [v5 getSatelliteMsgCfgToUpdate:&v15];
  id v7 = v15;

  id v8 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Parakeet SMS config fetched from CT %@ with error %@", buf, 0x16u);
  }

  int v9 = [IDSStewieSMSConfig alloc];
  id v10 = [(IDSStewieSMSConfig *)v6 cfg];
  int v11 = [(IDSStewieSMSConfig *)v6 cfg_id];
  id v12 = [(IDSStewieSMSConfig *)v9 initWithConfig:v10 withID:v11];

  if (v12 && !v7)
  {
    id v13 = +[IDSFoundationLog stewieProvisioning];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Forwarding SMS config: %@ to key manager", buf, 0xCu);
    }

    id v14 = [(IDSStewieCTClient *)self delegate];
    [v14 stewieCTClient:self receivedStewieMessageConfigChanged:v12];
  }
}

- (void)notifyStewieSMSConfigUpdated:(id)a3 withError:(id)a4 forSPSEnv:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(IDSStewieCTClient *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Parakeet messaging config update to CT for UUID %@ with Error %@", (uint8_t *)&v16, 0x16u);
  }

  id v13 = [objc_alloc((Class)CTSatelliteMessagingProvisioningReceipt) initWithID:v8 result:v9 sps:v10];
  id v14 = [(IDSStewieCTClient *)self coreTelephonyClient];
  id v15 = [v14 setSatelliteMsgCfgUpdated:v13];
}

- (IDSStewieCTClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSStewieCTClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end