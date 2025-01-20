@interface IDSDXPCReunionSync
- (BOOL)_isEntitledForPreferInfraWiFiForServices:(id)a3 error:(id *)a4;
- (IDSDXPCReunionSync)initWithConnection:(id)a3 clientProcessName:(id)a4 UTunDeliveryController:(id)a5 duetInterface:(id)a6;
- (IDSDuetInterface)duetInterface;
- (IDSUTunDeliveryController)utunDeliveryController;
- (IDSXPCConnection)connection;
- (NSString)clientProcessName;
- (void)_defaultPeerSetPreferInfraWiFi:(BOOL)a3 services:(id)a4;
- (void)reunionSyncCompletedForServices:(id)a3 withCompletion:(id)a4;
- (void)reunionSyncStartedForServices:(id)a3 withCompletion:(id)a4;
- (void)setClientProcessName:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDuetInterface:(id)a3;
- (void)setUtunDeliveryController:(id)a3;
@end

@implementation IDSDXPCReunionSync

- (IDSDXPCReunionSync)initWithConnection:(id)a3 clientProcessName:(id)a4 UTunDeliveryController:(id)a5 duetInterface:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSDXPCReunionSync;
  v15 = [(IDSDXPCReunionSync *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_clientProcessName, a4);
    objc_storeStrong((id *)&v16->_connection, a3);
    objc_storeStrong((id *)&v16->_utunDeliveryController, a5);
    objc_storeStrong((id *)&v16->_duetInterface, a6);
  }

  return v16;
}

- (void)reunionSyncStartedForServices:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[IDSDXPCReunionSync reunionSyncStartedForServices:withCompletion:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Reunion: %s services: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v13 = "-[IDSDXPCReunionSync reunionSyncStartedForServices:withCompletion:]";
      id v14 = v6;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v13 = "-[IDSDXPCReunionSync reunionSyncStartedForServices:withCompletion:]";
        id v14 = v6;
        _IDSLogV();
      }
    }
  }
  id v15 = 0;
  unsigned int v9 = -[IDSDXPCReunionSync _isEntitledForPreferInfraWiFiForServices:error:](self, "_isEntitledForPreferInfraWiFiForServices:error:", v6, &v15, v13, v14);
  id v10 = v15;
  if (v9)
  {
    [(IDSDXPCReunionSync *)self _defaultPeerSetPreferInfraWiFi:1 services:v6];
    id v11 = [(IDSDXPCReunionSync *)self duetInterface];
    id v12 = [(IDSDXPCReunionSync *)self clientProcessName];
    [v11 setReunionSyncInProgress:1 forClientID:v12];
  }
  v7[2](v7, v10);
}

- (void)reunionSyncCompletedForServices:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[IDSDXPCReunionSync reunionSyncCompletedForServices:withCompletion:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Reunion: %s services: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v13 = "-[IDSDXPCReunionSync reunionSyncCompletedForServices:withCompletion:]";
      id v14 = v6;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v13 = "-[IDSDXPCReunionSync reunionSyncCompletedForServices:withCompletion:]";
        id v14 = v6;
        _IDSLogV();
      }
    }
  }
  id v15 = 0;
  unsigned int v9 = -[IDSDXPCReunionSync _isEntitledForPreferInfraWiFiForServices:error:](self, "_isEntitledForPreferInfraWiFiForServices:error:", v6, &v15, v13, v14);
  id v10 = v15;
  if (v9)
  {
    [(IDSDXPCReunionSync *)self _defaultPeerSetPreferInfraWiFi:0 services:v6];
    id v11 = [(IDSDXPCReunionSync *)self duetInterface];
    id v12 = [(IDSDXPCReunionSync *)self clientProcessName];
    [v11 setReunionSyncInProgress:0 forClientID:v12];
  }
  v7[2](v7, v10);
}

- (void)_defaultPeerSetPreferInfraWiFi:(BOOL)a3 services:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v6 = [(IDSDXPCReunionSync *)self utunDeliveryController];
    [v6 defaultPeerSetPreferInfraWiFi:v4 services:v7];
  }
}

- (BOOL)_isEntitledForPreferInfraWiFiForServices:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = [(IDSDXPCReunionSync *)self connection];
    unsigned int v7 = [v6 hasEntitlement:kIDSPreferInfraWiFiEntitlement];

    v8 = +[IMRGLog watchPairing];
    unsigned int v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ReunionSync has entitlemnt for non-empty service list {entitlement: com.apple.private.ids.prefer-infrawifi, services: %{public}@}", (uint8_t *)&v11, 0xCu);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      sub_100712910((uint64_t)v5, v9);
    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)setClientProcessName:(id)a3
{
}

- (IDSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (IDSUTunDeliveryController)utunDeliveryController
{
  return self->_utunDeliveryController;
}

- (void)setUtunDeliveryController:(id)a3
{
}

- (IDSDuetInterface)duetInterface
{
  return self->_duetInterface;
}

- (void)setDuetInterface:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duetInterface, 0);
  objc_storeStrong((id *)&self->_utunDeliveryController, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_clientProcessName, 0);
}

@end