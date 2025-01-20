@interface CTCSXPCService
- (BOOL)checkEntitlements:(id)a3 connection:(id)a4;
- (BOOL)checkFF;
- (BOOL)checkPrivateEntitlement;
- (BOOL)isThreadNetworkProfileInstalled;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)takeUserPermission:(id)a3 userDescription:(id)a4;
- (CTCSXPCService)init;
- (CTCSXPCService)initWithListener:(id)a3;
- (NSXPCListener)listener;
- (OS_dispatch_queue)threadSafeQueue;
- (ThreadNetworkManagerSelfHealHandler)selfHealHandler;
- (id)BackingStoreDS;
- (id)BackingStoreDSInternally;
- (id)getClientKeychainAccessGroup;
- (id)getConnectionTeamId:(id)a3;
- (void)awdPostNumThirdPartyBRs:(unsigned int)a3;
- (void)awdPostPreferrdNwInfo:(unsigned int)a3 numPrefNwsByAppleBRs:(unsigned int)a4;
- (void)awdPostStabilityMetrics:(unsigned __int8)a3;
- (void)ctcsIsPreferredNetworkForActiveOperationalDataset:(id)a3 completion:(id)a4;
- (void)ctcsServerAddPreferredNetworkWithCompletionInternally:(id)a3 extendedPANId:(id)a4 borderAgentID:(id)a5 ipV4NwSignature:(id)a6 ipv6NwSignature:(id)a7 wifiSSID:(id)a8 wifiPassword:(id)a9 completion:(id)a10;
- (void)ctcsServerCleanKeychainThreadNetworksWithCompletion:(id)a3;
- (void)ctcsServerCleanPreferredAndFrozenThreadNetworksWithCompletion:(id)a3;
- (void)ctcsServerDeleteActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4;
- (void)ctcsServerDeleteActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)ctcsServerDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion:(id)a3 ipv6NwSignature:(id)a4 wifiSSID:(id)a5 completion:(id)a6;
- (void)ctcsServerDeletePreferredNetworkWithCompletion:(id)a3;
- (void)ctcsServerRetrieveActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4;
- (void)ctcsServerRetrieveActiveDataSetRecordInternallyWithXPANId:(id)a3 completion:(id)a4;
- (void)ctcsServerRetrieveActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)ctcsServerRetrieveActiveDataSetRecordWithXPANId:(id)a3 completion:(id)a4;
- (void)ctcsServerRetrieveAllActiveDataSetRecordsWithActiveFlag:(BOOL)a3 completion:(id)a4;
- (void)ctcsServerRetrieveIsPreferredNetworkAvailable:(id)a3;
- (void)ctcsServerRetrieveOrGeneratePreferredNetworkInternallyWithCompletion:(id)a3;
- (void)ctcsServerRetrievePreferredNetworkInternallyOnMdnsAndSigWithCompletion:(id)a3;
- (void)ctcsServerRetrievePreferredNetworkInternallyWithCompletion:(id)a3;
- (void)ctcsServerRetrievePreferredNetworkWithCompletion:(id)a3;
- (void)ctcsServerRetrievePreferredNetworkWithNoScanWithCompletion:(id)a3;
- (void)ctcsServerStoreCachedAODasPreferredNetwork:(id)a3 completion:(id)a4;
- (void)ctcsServerStoreThreadNetworkCredentialActiveDataSet:(id)a3 credentialsDataSet:(id)a4 completion:(id)a5;
- (void)ctcsServerStoreThreadNetworkCredentialActiveDataSetInternally:(id)a3 network:(id)a4 credentialsDataSet:(id)a5 waitForSync:(BOOL)a6 completion:(id)a7;
- (void)ctcsUpdatePreferredNetworkInternallyWithCompletion:(id)a3;
- (void)ctcsValidateAODInternally:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)isConnectionValid:(id)a3;
- (void)isConnectionValid:(id)a3 completion:(id)a4;
- (void)ping:(id)a3;
- (void)run;
- (void)setListener:(id)a3;
- (void)setSelfHealHandler:(id)a3;
- (void)setThreadSafeQueue:(id)a3;
@end

@implementation CTCSXPCService

- (CTCSXPCService)init
{
  v3 = sub_1000090D4(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "-[CTCSXPCService init]";
    __int16 v10 = 1024;
    int v11 = 51;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Server: %s:%d", (uint8_t *)&v8, 0x12u);
  }

  id v4 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.ThreadNetwork.xpc"];
  v5 = [(CTCSXPCService *)self initWithListener:v4];
  if (v5)
  {
    v6 = sub_1000090D4(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      v9 = "-[CTCSXPCService init]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Server: %s", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

- (CTCSXPCService)initWithListener:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTCSXPCService;
  v6 = [(CTCSXPCService *)&v17 init];
  v7 = v6;
  if (v6)
  {
    p_listener = (id *)&v6->_listener;
    objc_storeStrong((id *)&v6->_listener, a3);
    [*p_listener setDelegate:v7];
    id v9 = *p_listener;
    __int16 v10 = sub_10000AB24();
    [v9 _setQueue:v10];

    dispatch_queue_t v11 = dispatch_queue_create("CTCSXPCServiceListener Thread Safe Queue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    threadSafeQueue = v7->_threadSafeQueue;
    v7->_threadSafeQueue = (OS_dispatch_queue *)v11;

    v13 = objc_alloc_init(ThreadNetworkManagerSelfHealHandler);
    selfHealHandler = v7->_selfHealHandler;
    v7->_selfHealHandler = v13;

    v15 = sub_1000090D4(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[CTCSXPCService initWithListener:]";
      __int16 v20 = 1024;
      int v21 = 67;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Server: %s:%d", buf, 0x12u);
    }
  }
  return v7;
}

- (void)run
{
  v3 = sub_1000090D4(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[CTCSXPCService run]";
    __int16 v7 = 1024;
    int v8 = 74;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Server: %s:%d", buf, 0x12u);
  }

  [(ThreadNetworkManagerSelfHealHandler *)self->_selfHealHandler initSelfHealThreadNetworkTimer];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000ACA4;
  v4[3] = &unk_100074940;
  v4[4] = self;
  sub_10000B274(v4, 1);
}

- (void)invalidate
{
  v2 = [(CTCSXPCService *)self listener];
  [v2 invalidate];

  v3 = sub_1000090D4(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[CTCSXPCService invalidate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Server: %s - invalidated", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((id)objc_claimAutoreleasedReturnValue() ! = [(CTCSXPCService *)self listener]; {
    __assert_rtn("-[CTCSXPCService listener:shouldAcceptNewConnection:]", "CTCSXPCService.mm", 95, "listener == self.listener");
  }

  if (!v7) {
    __assert_rtn("-[CTCSXPCService listener:shouldAcceptNewConnection:]", "CTCSXPCService.mm", 97, "newConnection != nil");
  }
  if (![(CTCSXPCService *)self checkFF])
  {
    v13 = sub_1000090D4(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315394;
      __int16 v20 = "-[CTCSXPCService listener:shouldAcceptNewConnection:]";
      __int16 v21 = 1024;
      int v22 = 101;
      v15 = "%s:%d: Feature is not supported...";
      v16 = v13;
      uint32_t v17 = 18;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v19, v17);
    }
LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  int v8 = +[NSString stringWithUTF8String:"com.apple.developer.networking.manage-thread-network-credentials"];
  unsigned __int8 v9 = [(CTCSXPCService *)self checkEntitlements:v8 connection:v7];

  if ((v9 & 1) == 0)
  {
    v13 = sub_1000090D4(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315138;
      __int16 v20 = "-[CTCSXPCService listener:shouldAcceptNewConnection:]";
      v15 = "Server: %s - Invalid Entitlements";
      v16 = v13;
      uint32_t v17 = 12;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  __int16 v10 = sub_10000AB24();
  dispatch_assert_queue_V2(v10);

  dispatch_queue_t v11 = sub_10000AB24();
  [v7 _setQueue:v11];

  v12 = +[XPCInterface CTCSCreateXPCTransportInterface];
  [v7 setExportedInterface:v12];

  [v7 setExportedObject:self];
  [v7 setInterruptionHandler:&stru_1000749A0];
  [v7 setInvalidationHandler:&stru_1000749C0];
  [v7 resume];
  v13 = sub_1000090D4(1);
  BOOL v14 = 1;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315138;
    __int16 v20 = "-[CTCSXPCService listener:shouldAcceptNewConnection:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Server: %s - CTCS XPC new Connection started", (uint8_t *)&v19, 0xCu);
  }
LABEL_13:

  return v14;
}

- (void)awdPostStabilityMetrics:(unsigned __int8)a3
{
  int v3 = a3;
  int v4 = objc_alloc_init(AWDFlagstoneCTCSStabilityMetrics);
  if (v4)
  {
    id v5 = objc_opt_new();
    [(AWDFlagstoneCTCSStabilityMetrics *)v4 setSCntrsStability:v5];

    id v6 = [(AWDFlagstoneCTCSStabilityMetrics *)v4 sCntrsStability];

    if (v6)
    {
      switch(v3)
      {
        case 1:
          id v7 = [(AWDFlagstoneCTCSStabilityMetrics *)v4 sCntrsStability];
          [v7 setCtcsReadWriteFailType:1];
          goto LABEL_10;
        case 2:
          id v7 = [(AWDFlagstoneCTCSStabilityMetrics *)v4 sCntrsStability];
          [v7 setCtcsReadWriteFailType:2];
          goto LABEL_10;
        case 3:
          id v7 = [(AWDFlagstoneCTCSStabilityMetrics *)v4 sCntrsStability];
          [v7 setCtcsReadWriteFailType:3];
          goto LABEL_10;
        case 4:
          id v7 = [(AWDFlagstoneCTCSStabilityMetrics *)v4 sCntrsStability];
          [v7 setCtcsReadWriteFailType:4];
          goto LABEL_10;
        case 5:
          id v7 = [(AWDFlagstoneCTCSStabilityMetrics *)v4 sCntrsStability];
          [v7 setCtcsReadWriteFailType:5];
          goto LABEL_10;
        case 6:
          id v7 = [(AWDFlagstoneCTCSStabilityMetrics *)v4 sCntrsStability];
          [v7 setCtcsReadWriteFailType:6];
LABEL_10:

          AWDPostMetric();
          int v8 = sub_1000090D4(1);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            int v9 = 136315650;
            __int16 v10 = "-[CTCSXPCService awdPostStabilityMetrics:]";
            __int16 v11 = 1024;
            int v12 = 209;
            __int16 v13 = 1024;
            int v14 = v3;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%d : Posted AWD Metric for awdPostStabilityMetrics for enum error : %d ", (uint8_t *)&v9, 0x18u);
          }

          break;
        default:
          break;
      }
    }
  }
}

- (void)awdPostNumThirdPartyBRs:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v4 = objc_alloc_init(AWDFlagstoneCTCSNumberOfThirdPartyBRs);
  id v5 = v4;
  if (v4)
  {
    [(AWDFlagstoneCTCSNumberOfThirdPartyBRs *)v4 setHasNumberOfThirdPartyBorderRouters:1];
    [(AWDFlagstoneCTCSNumberOfThirdPartyBRs *)v5 setNumberOfThirdPartyBorderRouters:v3];
    AWDPostMetric();
    id v6 = sub_1000090D4(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315650;
      int v8 = "-[CTCSXPCService awdPostNumThirdPartyBRs:]";
      __int16 v9 = 1024;
      int v10 = 224;
      __int16 v11 = 1024;
      int v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s:%d :Posted AWD Metric for CTCSNumberOfThirdPartyBRs numThirdPartyBRs=%d ", (uint8_t *)&v7, 0x18u);
    }
  }
}

- (void)awdPostPreferrdNwInfo:(unsigned int)a3 numPrefNwsByAppleBRs:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v6 = objc_alloc_init(AWDFlagstoneCTCSNumberPreferredNetworksByBorderRouters);
  int v7 = v6;
  if (v6)
  {
    [(AWDFlagstoneCTCSNumberPreferredNetworksByBorderRouters *)v6 setNumberOfPreferredNwByAppleBorderRouters:0];
    [(AWDFlagstoneCTCSNumberPreferredNetworksByBorderRouters *)v7 setNumberOfPreferredNwByThirdPartyBorderRouters:0];
    [(AWDFlagstoneCTCSNumberPreferredNetworksByBorderRouters *)v7 setHasNumberOfPreferredNwByAppleBorderRouters:0];
    [(AWDFlagstoneCTCSNumberPreferredNetworksByBorderRouters *)v7 setHasNumberOfPreferredNwByThirdPartyBorderRouters:0];
    if (v4)
    {
      [(AWDFlagstoneCTCSNumberPreferredNetworksByBorderRouters *)v7 setHasNumberOfPreferredNwByAppleBorderRouters:1];
      [(AWDFlagstoneCTCSNumberPreferredNetworksByBorderRouters *)v7 setNumberOfPreferredNwByAppleBorderRouters:v4];
    }
    if (v5)
    {
      [(AWDFlagstoneCTCSNumberPreferredNetworksByBorderRouters *)v7 setHasNumberOfPreferredNwByThirdPartyBorderRouters:1];
      [(AWDFlagstoneCTCSNumberPreferredNetworksByBorderRouters *)v7 setNumberOfPreferredNwByThirdPartyBorderRouters:v5];
    }
    AWDPostMetric();
    int v8 = sub_1000090D4(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315650;
      int v10 = "-[CTCSXPCService awdPostPreferrdNwInfo:numPrefNwsByAppleBRs:]";
      __int16 v11 = 1024;
      int v12 = v4;
      __int16 v13 = 1024;
      int v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s : Posted AWD Metric for CTCSNumberPreferredNetworksByBorderRouters numPrefForAppleBR=%d numPrefForThirdPartyBR=%d ", (uint8_t *)&v9, 0x18u);
    }
  }
}

- (BOOL)takeUserPermission:(id)a3 userDescription:(id)a4
{
  uint64_t v5 = (__CFString *)a3;
  id v6 = (__CFString *)a4;
  int v7 = sub_1000090D4(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    int v14 = "-[CTCSXPCService takeUserPermission:userDescription:]";
    __int16 v15 = 1024;
    int v16 = 259;
    __int16 v17 = 2112;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s:%d: appString  : %@", buf, 0x1Cu);
  }

  CFOptionFlags v12 = 0;
  CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, v5, v6, @"Allow", @"Don't Allow", 0, &v12);
  CFOptionFlags v8 = v12 & 3;
  if ((v12 & 3) != 0)
  {
    int v9 = sub_1000090D4(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int v14 = "-[CTCSXPCService takeUserPermission:userDescription:]";
      __int16 v15 = 1024;
      int v16 = 270;
      int v10 = "%s:%d:  User response is No \n";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v10, buf, 0x12u);
    }
  }
  else
  {
    int v9 = sub_1000090D4(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int v14 = "-[CTCSXPCService takeUserPermission:userDescription:]";
      __int16 v15 = 1024;
      int v16 = 267;
      int v10 = "%s:%d:  User response is Yes \n";
      goto LABEL_8;
    }
  }

  return v8 == 0;
}

- (BOOL)checkFF
{
  v2 = objc_alloc_init(CTCSUtils);
  if (!v2) {
    sub_100054B84();
  }
  uint64_t v3 = v2;
  unsigned int v4 = [(CTCSUtils *)v2 ctcsUtilIsThreadCommissioningEnabled];
  if (v4)
  {
    uint64_t v5 = sub_1000090D4(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100054BB0(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    __int16 v13 = sub_1000090D4(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100054BE8(v13, v14, v15, v16, v17, v18, v19, v20);
    }

    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    CFStringRef v24 = @"ThreadCommissioningService Feature is Disabled";
    __int16 v21 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    uint64_t v5 = +[NSError errorWithDomain:@"Feature Flags Error" code:2 userInfo:v21];
  }
  return v4;
}

- (id)getClientKeychainAccessGroup
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = +[NSXPCConnection currentConnection];
  if (v3)
  {
    unsigned int v4 = [(CTCSXPCService *)v2 getConnectionTeamId:v3];
    if (v4)
    {
      uint64_t v5 = sub_1000090D4(1);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v9 = 136315650;
        uint64_t v10 = "-[CTCSXPCService getClientKeychainAccessGroup]";
        __int16 v11 = 1024;
        int v12 = 307;
        __int16 v13 = 2112;
        uint64_t v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: %d: clientKeychainAccessGroup: %@ .\n", (uint8_t *)&v9, 0x1Cu);
      }

      unsigned int v4 = v4;
      uint64_t v6 = v4;
    }
    else
    {
      uint64_t v7 = sub_1000090D4(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100054C9C();
      }

      uint64_t v6 = 0;
    }
  }
  else
  {
    unsigned int v4 = sub_1000090D4(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100054C20();
    }
    uint64_t v6 = 0;
  }

  objc_sync_exit(v2);

  return v6;
}

- (id)BackingStoreDSInternally
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = +[NSXPCConnection currentConnection];
  if (!v3)
  {
    uint64_t v7 = sub_1000090D4(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100054D18();
    }
    goto LABEL_10;
  }
  unsigned int v4 = +[NSString stringWithUTF8String:"com.apple.private.threadnetwork"];
  unsigned __int8 v5 = [(CTCSXPCService *)v2 checkEntitlements:v4 connection:v3];

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = sub_1000090D4(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100054D94();
    }
LABEL_10:
    uint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = sub_1000090D4(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    __int16 v11 = "-[CTCSXPCService BackingStoreDSInternally]";
    __int16 v12 = 1024;
    int v13 = 330;
    __int16 v14 = 2112;
    CFStringRef v15 = @"0000000000";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: %d: Apple internal keychainAccessGroup: %@ .\n", (uint8_t *)&v10, 0x1Cu);
  }

  uint64_t v7 = +[THThreadNetworkCredentialsKeychainBackingStore defaultBackingStore];
  uint64_t v8 = [[THThreadNetworkCredentialsStoreLocalClient alloc] initWithKeychainAccessGroup:@"0000000000" backingStore:v7];
LABEL_11:

  objc_sync_exit(v2);

  return v8;
}

- (id)BackingStoreDS
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(CTCSXPCService *)v2 getClientKeychainAccessGroup];
  if (v3)
  {
    unsigned int v4 = sub_1000090D4(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315650;
      int v9 = "-[CTCSXPCService BackingStoreDS]";
      __int16 v10 = 1024;
      int v11 = 347;
      __int16 v12 = 2112;
      int v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s: %d: keychainAccessGroup: %@ .\n", (uint8_t *)&v8, 0x1Cu);
    }

    unsigned __int8 v5 = +[THThreadNetworkCredentialsKeychainBackingStore defaultBackingStore];
    uint64_t v6 = [[THThreadNetworkCredentialsStoreLocalClient alloc] initWithKeychainAccessGroup:v3 backingStore:v5];
  }
  else
  {
    unsigned __int8 v5 = sub_1000090D4(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100054E10();
    }
    uint64_t v6 = 0;
  }

  objc_sync_exit(v2);

  return v6;
}

- (id)getConnectionTeamId:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = v4;
  long long v20 = 0u;
  long long v21 = 0u;
  if (v4) {
    [v4 auditToken];
  }
  uint64_t v6 = (void *)xpc_copy_code_signing_identity_for_token();
  if (v6)
  {
    uint64_t v7 = sub_1000090D4(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      NSErrorUserInfoKey v23 = "-[CTCSXPCService getConnectionTeamId:]";
      __int16 v24 = 1024;
      int v25 = 363;
      __int16 v26 = 2080;
      v27 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s:%d: appId  : %s", buf, 0x1Cu);
    }

    id v8 = objc_alloc((Class)LSApplicationRecord);
    int v9 = +[NSString stringWithUTF8String:v6];
    id v19 = 0;
    id v10 = [v8 initWithBundleIdentifier:v9 allowPlaceholder:1 error:&v19];
    int v11 = v19;

    free(v6);
    if (v10)
    {
      __int16 v12 = [v10 teamIdentifier];
      int v13 = v12;
      if (v12)
      {
        int v13 = v12;
        __int16 v14 = (__CFString *)v13;
      }
      else
      {
        uint64_t v17 = sub_1000090D4(1);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          NSErrorUserInfoKey v23 = "-[CTCSXPCService getConnectionTeamId:]";
          __int16 v24 = 1024;
          int v25 = 383;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s:%d: applicationRecord is nil", buf, 0x12u);
        }

        __int16 v14 = 0;
      }
    }
    else if (os_variant_has_internal_diagnostics() {
           && (+[NSString stringWithUTF8String:"com.apple.private.threadnetwork"], CFStringRef v15 = objc_claimAutoreleasedReturnValue(), v16 = [(CTCSXPCService *)self checkEntitlements:v15 connection:v5], v15, v16))
    }
    {
      int v13 = sub_1000090D4(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100054F08();
      }
      __int16 v14 = @"0000000000";
    }
    else
    {
      int v13 = sub_1000090D4(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100054F84();
      }
      __int16 v14 = 0;
    }
  }
  else
  {
    int v11 = sub_1000090D4(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100054E8C();
    }
    __int16 v14 = 0;
  }

  return v14;
}

- (BOOL)checkEntitlements:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  int v9 = [v7 valueForEntitlement:v6];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v9 BOOLValue])
  {
    id v10 = sub_1000090D4(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100055000((uint64_t)v6, v10);
    }

    int v11 = 0;
  }
  else
  {
    int v11 = 1;
  }

  objc_sync_exit(v8);
  if (v11)
  {
    __int16 v12 = sub_1000090D4(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      CFStringRef v15 = "-[CTCSXPCService checkEntitlements:connection:]";
      __int16 v16 = 1024;
      int v17 = 402;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Server: %s:%d - Entitlement Check Failed", (uint8_t *)&v14, 0x12u);
    }
  }
  return v11 ^ 1;
}

- (void)isConnectionValid:(id)a3 completion:(id)a4
{
  id v4 = (void (**)(id, uint64_t, void))a4;
  unsigned __int8 v5 = sub_1000090D4(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[CTCSXPCService isConnectionValid:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Server: %s - Connection is valid", (uint8_t *)&v6, 0xCu);
  }

  v4[2](v4, 1, 0);
}

- (void)isConnectionValid:(id)a3
{
  uint64_t v3 = (void (**)(id, uint64_t, void))a3;
  id v4 = sub_1000090D4(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    int v6 = "-[CTCSXPCService isConnectionValid:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Server: %s - Connection is valid", (uint8_t *)&v5, 0xCu);
  }

  v3[2](v3, 1, 0);
}

- (void)ping:(id)a3
{
  uint64_t v3 = (void (**)(id, uint64_t, void))a3;
  id v4 = sub_1000090D4(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    int v6 = "-[CTCSXPCService ping:]";
    __int16 v7 = 1024;
    int v8 = 419;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Server: %s:%d: - Ping", (uint8_t *)&v5, 0x12u);
  }

  v3[2](v3, 1, 0);
}

- (BOOL)checkPrivateEntitlement
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = +[NSXPCConnection currentConnection];
  if (v3)
  {
    id v4 = +[NSString stringWithUTF8String:"com.apple.private.threadnetwork"];
    unsigned __int8 v5 = [(CTCSXPCService *)v2 checkEntitlements:v4 connection:v3];
  }
  else
  {
    int v6 = sub_1000090D4(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10005508C();
    }

    unsigned __int8 v5 = 0;
  }

  objc_sync_exit(v2);
  return v5;
}

- (BOOL)isThreadNetworkProfileInstalled
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"EnableThreadNetwork", @"com.apple.homed", &keyExistsAndHasValidFormat);
  uint64_t v3 = sub_1000090D4(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    int v8 = "-[CTCSXPCService isThreadNetworkProfileInstalled]";
    __int16 v9 = 1024;
    int v10 = 443;
    __int16 v11 = 1024;
    int v12 = keyExistsAndHasValidFormat;
    __int16 v13 = 1024;
    BOOL v14 = AppBooleanValue != 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d: - keyExists : %d, isRunningThreadNetworkProfileMode : %d", buf, 0x1Eu);
  }

  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

- (void)ctcsServerDeleteActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = sub_1000090D4(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    long long v20 = "-[CTCSXPCService ctcsServerDeleteActiveDataSetRecordForThreadBorderAgent:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Server: %s", buf, 0xCu);
  }

  id v9 = [objc_alloc((Class)THThreadNetworkBorderAgent) initWithBaDiscrId:v6];
  if (v9)
  {
    int v10 = [(CTCSXPCService *)self BackingStoreDS];
    if (v10)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10000CFAC;
      v13[3] = &unk_100074A50;
      v13[4] = self;
      id v14 = v7;
      [v10 deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:v9 completion:v13];
    }
    else
    {
      int v12 = dispatch_get_global_queue(0, 0);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000CF28;
      v15[3] = &unk_100074A28;
      id v16 = v7;
      dispatch_async(v12, v15);
    }
  }
  else
  {
    __int16 v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000CEA4;
    block[3] = &unk_100074A28;
    id v18 = v7;
    dispatch_async(v11, block);

    int v10 = v18;
  }
}

- (void)ctcsServerRetrieveAllActiveDataSetRecordsWithActiveFlag:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  int v8 = sub_1000090D4(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 136315906;
    id v19 = "-[CTCSXPCService ctcsServerRetrieveAllActiveDataSetRecordsWithActiveFlag:completion:]";
    __int16 v20 = 1024;
    int v21 = 484;
    __int16 v22 = 2112;
    NSErrorUserInfoKey v23 = v9;
    __int16 v24 = 1024;
    BOOL v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Server: %s:%d: Retrieving ALL DS credentials...cmd : %@ activeFlag : %d \n", buf, 0x22u);
  }
  int v10 = [(CTCSXPCService *)self BackingStoreDS];
  __int16 v11 = v10;
  if (v10)
  {
    int v12 = [v10 keychainAccessGroup];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000D31C;
    v14[3] = &unk_100074A78;
    v14[4] = self;
    id v15 = v7;
    [v11 retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup:v12 activeFlag:v4 completion:v14];
  }
  else
  {
    __int16 v13 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D294;
    block[3] = &unk_100074A28;
    id v17 = v7;
    dispatch_async(v13, block);
  }
}

- (void)ctcsServerRetrieveActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = sub_1000090D4(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v16 = "-[CTCSXPCService ctcsServerRetrieveActiveDataSetRecordForThreadBorderAgent:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Server: %s", buf, 0xCu);
  }

  id v9 = [(CTCSXPCService *)self BackingStoreDS];
  if (v9)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000D648;
    v11[3] = &unk_100074AA0;
    v11[4] = self;
    id v12 = v7;
    [v9 retrieveActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:v6 completion:v11];
  }
  else
  {
    int v10 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D5C0;
    block[3] = &unk_100074A28;
    id v14 = v7;
    dispatch_async(v10, block);
  }
}

- (void)ctcsServerStoreThreadNetworkCredentialActiveDataSet:(id)a3 credentialsDataSet:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = sub_1000090D4(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[CTCSXPCService ctcsServerStoreThreadNetworkCredentialActiveDataSet:credentialsDataSet:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Server: %s", buf, 0xCu);
  }

  id v12 = [objc_alloc((Class)THThreadNetworkBorderAgent) initWithBaDiscrId:v8];
  id v13 = [objc_alloc((Class)THThreadNetworkCredentialsDataSet) initWithDataSetArray:v9 userInfo:0];
  id v14 = v13;
  if (v12 && v13)
  {
    id v15 = [(CTCSXPCService *)self BackingStoreDS];
    if (v15)
    {
      id v16 = [v14 dataSetArray];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10000DB5C;
      v20[3] = &unk_100074B18;
      id v21 = v15;
      __int16 v22 = v12;
      id v23 = v14;
      __int16 v24 = self;
      id v25 = v10;
      [v21 validateRecordWithMdnsScanWithDataSet:v16 borderAgentID:v8 completion:v20];

      id v17 = &v21;
      id v18 = v22;
    }
    else
    {
      id v18 = dispatch_get_global_queue(0, 0);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10000DAD4;
      v26[3] = &unk_100074A28;
      id v17 = &v27;
      id v27 = v10;
      dispatch_async(v18, v26);
    }
  }
  else
  {
    id v19 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000DA4C;
    block[3] = &unk_100074A28;
    id v29 = v10;
    dispatch_async(v19, block);

    id v15 = v29;
  }
}

- (void)ctcsServerRetrieveActiveDataSetRecordWithXPANId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000090D4(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Server: Retrieving Network with extended panid %@\n", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v73 = 0x3032000000;
  v74 = sub_10000E92C;
  v75 = sub_10000E93C;
  id v76 = 0;
  id v9 = +[NSXPCConnection currentConnection];
  if (v9)
  {
    id v10 = [(CTCSXPCService *)self BackingStoreDS];
    if (v10)
    {
      long long v54 = 0u;
      long long v55 = 0u;
      [v9 auditToken];
      __int16 v11 = (void *)xpc_copy_code_signing_identity_for_token();
      if (!v11)
      {
        v30 = dispatch_get_global_queue(0, 0);
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_10000EA54;
        v52[3] = &unk_100074A28;
        id v53 = v7;
        dispatch_async(v30, v52);

        v31 = v53;
LABEL_30:

        goto LABEL_31;
      }
      id v12 = sub_1000090D4(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v69 = 136315650;
        *(void *)&v69[4] = "-[CTCSXPCService ctcsServerRetrieveActiveDataSetRecordWithXPANId:completion:]";
        *(_WORD *)&v69[12] = 1024;
        *(_DWORD *)&v69[14] = 619;
        *(_WORD *)&v69[18] = 2080;
        *(void *)&v69[20] = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s:%d: appId  : %s", v69, 0x1Cu);
      }

      id v13 = objc_alloc((Class)LSApplicationRecord);
      id v14 = +[NSString stringWithUTF8String:v11];
      id v51 = 0;
      id v15 = [v13 initWithBundleIdentifier:v14 allowPlaceholder:1 error:&v51];
      id v39 = v51;

      free(v11);
      if (v15)
      {
        id v16 = [v15 localizedName];
        BOOL v17 = v16 == 0;

        if (!v17)
        {
          id v18 = sub_1000090D4(1);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            id v19 = [v15 localizedName];
            *(_DWORD *)v69 = 136315650;
            *(void *)&v69[4] = "-[CTCSXPCService ctcsServerRetrieveActiveDataSetRecordWithXPANId:completion:]";
            *(_WORD *)&v69[12] = 1024;
            *(_DWORD *)&v69[14] = 642;
            *(_WORD *)&v69[18] = 2112;
            *(void *)&v69[20] = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s:%d: Localized app name  : %@", v69, 0x1Cu);
          }
          __int16 v20 = +[NSBundle mainBundle];
          id v21 = [v20 localizedStringForKey:@"KEY_CHANGE_TITLE_PLEASE" value:&stru_100075A30 table:0];

          *(void *)v69 = 0;
          *(void *)&v69[8] = v69;
          *(void *)&v69[16] = 0x3032000000;
          *(void *)&v69[24] = sub_10000E92C;
          v70 = sub_10000E93C;
          __int16 v22 = [v15 localizedName];
          +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, v22);
          id v71 = (id)objc_claimAutoreleasedReturnValue();

          if (*(void *)(*(void *)&v69[8] + 40))
          {
            id v23 = sub_1000090D4(1);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              uint64_t v24 = *(void *)(*(void *)&v69[8] + 40);
              *(_DWORD *)v66 = 136315650;
              *(void *)&v66[4] = "-[CTCSXPCService ctcsServerRetrieveActiveDataSetRecordWithXPANId:completion:]";
              *(_WORD *)&v66[12] = 1024;
              *(_DWORD *)&v66[14] = 655;
              *(_WORD *)&v66[18] = 2112;
              *(void *)&v66[20] = v24;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s:%d: uiString  : %@", v66, 0x1Cu);
            }

            id v25 = +[NSBundle mainBundle];
            uint64_t v38 = [v25 localizedStringForKey:@"KEY_CHANGE_DESCRIPTION_PLEASE" value:&stru_100075A30 table:0];

            *(void *)v66 = 0;
            *(void *)&v66[8] = v66;
            *(void *)&v66[16] = 0x3032000000;
            *(void *)&v66[24] = sub_10000E92C;
            v67 = sub_10000E93C;
            +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v38, &stru_100075A30);
            id v68 = (id)objc_claimAutoreleasedReturnValue();
            if (*(void *)(*(void *)&v66[8] + 40))
            {
              __int16 v26 = sub_1000090D4(1);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                uint64_t v27 = *(void *)(*(void *)&v66[8] + 40);
                *(_DWORD *)v60 = 136315650;
                v61 = "-[CTCSXPCService ctcsServerRetrieveActiveDataSetRecordWithXPANId:completion:]";
                __int16 v62 = 1024;
                int v63 = 670;
                __int16 v64 = 2112;
                uint64_t v65 = v27;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s:%d - Usage Description : %@", v60, 0x1Cu);
              }

              v40[0] = _NSConcreteStackBlock;
              v40[1] = 3221225472;
              v40[2] = sub_10000ED0C;
              v40[3] = &unk_100074B40;
              v40[4] = self;
              p_long long buf = &buf;
              v43 = v69;
              v44 = v66;
              id v41 = v7;
              [v10 retrieveActiveDataSetRecordWithExtendedPANId:v6 completion:v40];
            }
            else
            {
              v37 = dispatch_get_global_queue(0, 0);
              v45[0] = _NSConcreteStackBlock;
              v45[1] = 3221225472;
              v45[2] = sub_10000EC84;
              v45[3] = &unk_100074A28;
              id v46 = v7;
              dispatch_async(v37, v45);
            }
            _Block_object_dispose(v66, 8);

            v36 = (void *)v38;
          }
          else
          {
            v35 = dispatch_get_global_queue(0, 0);
            v47[0] = _NSConcreteStackBlock;
            v47[1] = 3221225472;
            v47[2] = sub_10000EBFC;
            v47[3] = &unk_100074A28;
            id v48 = v7;
            dispatch_async(v35, v47);

            v36 = v48;
          }

          _Block_object_dispose(v69, 8);
          goto LABEL_29;
        }
        v34 = dispatch_get_global_queue(0, 0);
        v33 = v49;
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_10000EB74;
        v49[3] = &unk_100074A28;
        v49[4] = v7;
        dispatch_async(v34, v49);
      }
      else
      {
        v32 = dispatch_get_global_queue(0, 0);
        v33 = v50;
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_10000EADC;
        v50[3] = &unk_100074A28;
        v50[4] = v7;
        dispatch_async(v32, v50);
      }
      id v21 = (void *)v33[4];
LABEL_29:

      v31 = v39;
      goto LABEL_30;
    }
    id v29 = dispatch_get_global_queue(0, 0);
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_10000E9CC;
    v56[3] = &unk_100074A28;
    id v57 = v7;
    dispatch_async(v29, v56);
  }
  else
  {
    v28 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E944;
    block[3] = &unk_100074A28;
    id v59 = v7;
    dispatch_async(v28, block);

    id v10 = v59;
  }
LABEL_31:

  _Block_object_dispose(&buf, 8);
}

- (void)ctcsServerRetrievePreferredNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000090D4(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Server: Retrieving Preferred Network...\n", buf, 2u);
  }

  *(void *)long long buf = 0;
  id v57 = buf;
  uint64_t v58 = 0x3032000000;
  id v59 = sub_10000E92C;
  v60 = sub_10000E93C;
  id v61 = 0;
  id v6 = +[NSXPCConnection currentConnection];
  if (v6)
  {
    id v7 = [(CTCSXPCService *)self BackingStoreDS];
    if (v7)
    {
      long long v50 = 0u;
      long long v51 = 0u;
      [v6 auditToken];
      id v8 = (void *)xpc_copy_code_signing_identity_for_token();
      if (!v8)
      {
        v28 = dispatch_get_global_queue(0, 0);
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_10000FA48;
        v48[3] = &unk_100074A28;
        id v49 = v4;
        dispatch_async(v28, v48);

        id v29 = v49;
LABEL_30:

        goto LABEL_31;
      }
      id v9 = sub_1000090D4(1);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v71 = 136315650;
        *(void *)&v71[4] = "-[CTCSXPCService ctcsServerRetrievePreferredNetworkWithCompletion:]";
        *(_WORD *)&v71[12] = 1024;
        *(_DWORD *)&v71[14] = 735;
        *(_WORD *)&v71[18] = 2080;
        *(void *)&v71[20] = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s:%d: appId  : %s", v71, 0x1Cu);
      }

      id v10 = objc_alloc((Class)LSApplicationRecord);
      __int16 v11 = +[NSString stringWithUTF8String:v8];
      id v47 = 0;
      id v12 = [v10 initWithBundleIdentifier:v11 allowPlaceholder:1 error:&v47];
      id v35 = v47;

      free(v8);
      if (v12)
      {
        id v13 = [v12 localizedName];
        BOOL v14 = v13 == 0;

        if (!v14)
        {
          id v15 = sub_1000090D4(1);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            id v16 = [v12 localizedName];
            *(_DWORD *)id v71 = 136315650;
            *(void *)&v71[4] = "-[CTCSXPCService ctcsServerRetrievePreferredNetworkWithCompletion:]";
            *(_WORD *)&v71[12] = 1024;
            *(_DWORD *)&v71[14] = 759;
            *(_WORD *)&v71[18] = 2112;
            *(void *)&v71[20] = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s:%d: Localized app name  : %@", v71, 0x1Cu);
          }
          BOOL v17 = +[NSBundle mainBundle];
          id v18 = [v17 localizedStringForKey:@"KEY_CHANGE_TITLE_PLEASE" value:&stru_100075A30 table:0];

          *(void *)id v71 = 0;
          *(void *)&v71[8] = v71;
          *(void *)&v71[16] = 0x3032000000;
          *(void *)&v71[24] = sub_10000E92C;
          v72 = sub_10000E93C;
          id v19 = [v12 localizedName];
          +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v19);
          id v73 = (id)objc_claimAutoreleasedReturnValue();

          if (*(void *)(*(void *)&v71[8] + 40))
          {
            __int16 v20 = sub_1000090D4(1);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              uint64_t v21 = *(void *)(*(void *)&v71[8] + 40);
              *(_DWORD *)id v68 = 136315650;
              *(void *)&v68[4] = "-[CTCSXPCService ctcsServerRetrievePreferredNetworkWithCompletion:]";
              *(_WORD *)&v68[12] = 1024;
              *(_DWORD *)&v68[14] = 773;
              *(_WORD *)&v68[18] = 2112;
              *(void *)&v68[20] = v21;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s:%d: uiString  : %@", v68, 0x1Cu);
            }

            __int16 v22 = +[NSBundle mainBundle];
            id v23 = [v22 localizedStringForKey:@"KEY_CHANGE_DESCRIPTION_PLEASE" value:&stru_100075A30 table:0];

            *(void *)id v68 = 0;
            *(void *)&v68[8] = v68;
            *(void *)&v68[16] = 0x3032000000;
            *(void *)&v68[24] = sub_10000E92C;
            v69 = sub_10000E93C;
            +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v23, &stru_100075A30);
            id v70 = (id)objc_claimAutoreleasedReturnValue();
            if (*(void *)(*(void *)&v68[8] + 40))
            {
              uint64_t v24 = sub_1000090D4(1);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                uint64_t v25 = *(void *)(*(void *)&v68[8] + 40);
                *(_DWORD *)__int16 v62 = 136315650;
                int v63 = "-[CTCSXPCService ctcsServerRetrievePreferredNetworkWithCompletion:]";
                __int16 v64 = 1024;
                int v65 = 788;
                __int16 v66 = 2112;
                uint64_t v67 = v25;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s:%d - Usage Description : %@", v62, 0x1Cu);
              }

              v36[0] = _NSConcreteStackBlock;
              v36[1] = 3221225472;
              v36[2] = sub_10000FD00;
              v36[3] = &unk_100074B40;
              v36[4] = self;
              uint64_t v38 = buf;
              id v39 = v71;
              v40 = v68;
              id v37 = v4;
              [v7 retrievePreferredNetworkWithCompletion:v36];
            }
            else
            {
              v34 = dispatch_get_global_queue(0, 0);
              v41[0] = _NSConcreteStackBlock;
              v41[1] = 3221225472;
              v41[2] = sub_10000FC78;
              v41[3] = &unk_100074A28;
              id v42 = v4;
              dispatch_async(v34, v41);
            }
            _Block_object_dispose(v68, 8);
          }
          else
          {
            v33 = dispatch_get_global_queue(0, 0);
            v43[0] = _NSConcreteStackBlock;
            v43[1] = 3221225472;
            v43[2] = sub_10000FBF0;
            v43[3] = &unk_100074A28;
            id v44 = v4;
            dispatch_async(v33, v43);

            id v23 = v44;
          }

          _Block_object_dispose(v71, 8);
          goto LABEL_29;
        }
        v32 = dispatch_get_global_queue(0, 0);
        v31 = v45;
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_10000FB68;
        v45[3] = &unk_100074A28;
        void v45[4] = v4;
        dispatch_async(v32, v45);
      }
      else
      {
        v30 = dispatch_get_global_queue(0, 0);
        v31 = v46;
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_10000FAD0;
        v46[3] = &unk_100074A28;
        v46[4] = v4;
        dispatch_async(v30, v46);
      }
      id v18 = (void *)v31[4];
LABEL_29:

      id v29 = v35;
      goto LABEL_30;
    }
    uint64_t v27 = dispatch_get_global_queue(0, 0);
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10000F9C0;
    v52[3] = &unk_100074A28;
    id v53 = v4;
    dispatch_async(v27, v52);
  }
  else
  {
    __int16 v26 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F938;
    block[3] = &unk_100074A28;
    id v55 = v4;
    dispatch_async(v26, block);

    id v7 = v55;
  }
LABEL_31:

  _Block_object_dispose(buf, 8);
}

- (void)ctcsIsPreferredNetworkForActiveOperationalDataset:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_1000090D4(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 136315906;
    __int16 v22 = "-[CTCSXPCService ctcsIsPreferredNetworkForActiveOperationalDataset:completion:]";
    __int16 v23 = 2112;
    uint64_t v24 = v10;
    __int16 v25 = 2080;
    __int16 v26 = "-[CTCSXPCService ctcsIsPreferredNetworkForActiveOperationalDataset:completion:]";
    __int16 v27 = 2080;
    v28 = "-[CTCSXPCService ctcsIsPreferredNetworkForActiveOperationalDataset:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Server: %s Checking whether dataset matches to preferred network... %@, %s, %s \n", buf, 0x2Au);
  }
  if (v7)
  {
    __int16 v11 = [(CTCSXPCService *)self BackingStoreDS];
    if (v11)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100010220;
      v15[3] = &unk_100074B68;
      id v16 = v8;
      [v11 checkIsPreferredNetworkForActiveOperationalDataset:v7 completion:v15];
      id v12 = &v16;
    }
    else
    {
      BOOL v14 = dispatch_get_global_queue(0, 0);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10001020C;
      v17[3] = &unk_100074A28;
      id v18 = v8;
      dispatch_async(v14, v17);

      id v12 = &v18;
    }
  }
  else
  {
    id v13 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000101AC;
    block[3] = &unk_100074A28;
    id v20 = v8;
    dispatch_async(v13, block);

    __int16 v11 = v20;
  }
}

- (void)ctcsServerRetrieveIsPreferredNetworkAvailable:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000090D4(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Server: checking if preferred network is available ...\n", buf, 2u);
  }

  *(void *)long long buf = 0;
  BOOL v14 = buf;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10000E92C;
  BOOL v17 = sub_10000E93C;
  id v18 = 0;
  id v6 = [(CTCSXPCService *)self BackingStoreDS];
  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001052C;
    v9[3] = &unk_100074B90;
    v10[1] = buf;
    v10[0] = v4;
    [v6 retrievePreferredNetworkWithCompletion:v9];
    id v7 = (id *)v10;
  }
  else
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010518;
    block[3] = &unk_100074A28;
    id v7 = &v12;
    id v12 = v4;
    dispatch_async(v8, block);
  }
  _Block_object_dispose(buf, 8);
}

- (void)ctcsServerRetrievePreferredNetworkWithNoScanWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000090D4(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Server: Retrieving Preferred Network for Internal Clients with _no_scan_ ...\n", buf, 2u);
  }

  *(void *)long long buf = 0;
  BOOL v14 = buf;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10000E92C;
  BOOL v17 = sub_10000E93C;
  id v18 = 0;
  id v6 = [(CTCSXPCService *)self BackingStoreDSInternally];
  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000108E8;
    v9[3] = &unk_100074B90;
    v10[1] = buf;
    v10[0] = v4;
    [v6 retrievePreferredNetworkWithNoScanWithCompletion:v9];
    id v7 = (id *)v10;
  }
  else
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010860;
    block[3] = &unk_100074A28;
    id v7 = &v12;
    id v12 = v4;
    dispatch_async(v8, block);
  }
  _Block_object_dispose(buf, 8);
}

- (void)ctcsServerRetrievePreferredNetworkInternallyOnMdnsAndSigWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000090D4(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Server: Retrieving Preferred Network for Internal Clients ...\n", buf, 2u);
  }

  *(void *)long long buf = 0;
  BOOL v14 = buf;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10000E92C;
  BOOL v17 = sub_10000E93C;
  id v18 = 0;
  id v6 = [(CTCSXPCService *)self BackingStoreDSInternally];
  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100010C70;
    v9[3] = &unk_100074B90;
    v10[1] = buf;
    v10[0] = v4;
    [v6 retrievePreferredNetworkWithCompletion:v9];
    id v7 = (id *)v10;
  }
  else
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010BE8;
    block[3] = &unk_100074A28;
    id v7 = &v12;
    id v12 = v4;
    dispatch_async(v8, block);
  }
  _Block_object_dispose(buf, 8);
}

- (void)ctcsServerRetrievePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000090D4(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Server: Retrieving Preferred Network for Internal Clients ...\n", buf, 2u);
  }

  *(void *)long long buf = 0;
  BOOL v14 = buf;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10000E92C;
  BOOL v17 = sub_10000E93C;
  id v18 = 0;
  id v6 = [(CTCSXPCService *)self BackingStoreDSInternally];
  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100010FF8;
    v9[3] = &unk_100074B90;
    v10[1] = buf;
    v10[0] = v4;
    [v6 retrievePreferredNetworkInternallyWithCompletion:v9];
    id v7 = (id *)v10;
  }
  else
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010F70;
    block[3] = &unk_100074A28;
    id v7 = &v12;
    id v12 = v4;
    dispatch_async(v8, block);
  }
  _Block_object_dispose(buf, 8);
}

- (void)ctcsServerRetrieveOrGeneratePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000090D4(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Server: Retrieving or generate Preferred Network for Internal Clients ...\n", buf, 2u);
  }

  *(void *)long long buf = 0;
  id v16 = buf;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_10000E92C;
  id v19 = sub_10000E93C;
  id v20 = 0;
  if (MGGetBoolAnswer())
  {
    id v6 = sub_1000090D4(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v21 = 136315394;
      __int16 v22 = "-[CTCSXPCService ctcsServerRetrieveOrGeneratePreferredNetworkInternallyWithCompletion:]";
      __int16 v23 = 1024;
      int v24 = 980;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, " %s:%d Thread is supported on this device !", v21, 0x12u);
    }

    id v7 = [(CTCSXPCService *)self BackingStoreDSInternally];
    if (v7)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000114B4;
      v11[3] = &unk_100074B90;
      v12[1] = buf;
      v12[0] = v4;
      [v7 retrieveOrGeneratePreferredNetworkInternallyWithCompletion:v11];
      id v8 = (id *)v12;
    }
    else
    {
      id v10 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001142C;
      block[3] = &unk_100074A28;
      id v14 = v4;
      dispatch_async(v10, block);

      id v8 = &v14;
    }
  }
  else
  {
    id v7 = +[NSError storeError:3 description:@"Feature not supported"];
    id v9 = sub_1000090D4(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000552B4();
    }

    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
  }

  _Block_object_dispose(buf, 8);
}

- (void)ctcsServerDeletePreferredNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000090D4(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v14 = "-[CTCSXPCService ctcsServerDeletePreferredNetworkWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Server: %s", buf, 0xCu);
  }

  id v6 = [(CTCSXPCService *)self BackingStoreDSInternally];
  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100011810;
    v9[3] = &unk_100074BB8;
    id v10 = v4;
    [v6 deletePreferredNetworkWithCompletion:v9];
    id v7 = &v10;
  }
  else
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001178C;
    block[3] = &unk_100074A28;
    id v12 = v4;
    dispatch_async(v8, block);

    id v7 = &v12;
  }
}

- (void)ctcsUpdatePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000090D4(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v10 = "-[CTCSXPCService ctcsUpdatePreferredNetworkInternallyWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Server: %s", buf, 0xCu);
  }

  id v6 = [(CTCSXPCService *)self BackingStoreDSInternally];
  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000119AC;
    v7[3] = &unk_100074B68;
    id v8 = v4;
    [v6 updatePreferredNetworkInternallyWithCompletion:v7];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)ctcsServerRetrieveActiveDataSetRecordInternallyWithXPANId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000090D4(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Server: Retrieving Network with extended panid Internally %@\n", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_10000E92C;
  id v19 = sub_10000E93C;
  id v20 = 0;
  id v9 = [(CTCSXPCService *)self BackingStoreDSInternally];
  if (v9)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100011CBC;
    v11[3] = &unk_100074BE0;
    void v11[4] = self;
    p_long long buf = &buf;
    id v12 = v7;
    [v9 retrieveActiveDataSetRecordOnMdnsWithExtendedPANId:v6 completion:v11];
  }
  else
  {
    id v10 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100011C34;
    block[3] = &unk_100074A28;
    id v15 = v7;
    dispatch_async(v10, block);
  }
  _Block_object_dispose(&buf, 8);
}

- (void)ctcsServerStoreCachedAODasPreferredNetwork:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000090D4(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v21 = "-[CTCSXPCService ctcsServerStoreCachedAODasPreferredNetwork:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Server: %s", buf, 0xCu);
  }

  id v9 = [objc_alloc((Class)THThreadNetworkCredentialsDataSet) initWithDataSetArray:v6 userInfo:0];
  if (v9)
  {
    id v10 = [(CTCSXPCService *)self BackingStoreDSInternally];
    if (v10)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100012180;
      v14[3] = &unk_100074C08;
      id v15 = v7;
      [v10 storeCachedAODasPreferredNetwork:v9 completion:v14];
      __int16 v11 = &v15;
    }
    else
    {
      id v13 = dispatch_get_global_queue(0, 0);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000120F8;
      v16[3] = &unk_100074A28;
      id v17 = v7;
      dispatch_async(v13, v16);

      __int16 v11 = &v17;
    }
  }
  else
  {
    id v12 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012070;
    block[3] = &unk_100074A28;
    id v19 = v7;
    dispatch_async(v12, block);

    id v10 = v19;
  }
}

- (void)ctcsValidateAODInternally:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)THThreadNetworkCredentialsDataSet) initWithDataSetArray:v6 userInfo:0];
  if (v8)
  {
    id v9 = [(CTCSXPCService *)self BackingStoreDSInternally];
    if (v9)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000124BC;
      v13[3] = &unk_100074C30;
      id v14 = v7;
      [v9 validateAODInternally:v8 completion:v13];
      id v10 = &v14;
    }
    else
    {
      id v12 = dispatch_get_global_queue(0, 0);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100012434;
      v15[3] = &unk_100074A28;
      id v10 = &v16;
      id v16 = v7;
      dispatch_async(v12, v15);
    }
  }
  else
  {
    __int16 v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000123AC;
    block[3] = &unk_100074A28;
    id v18 = v7;
    dispatch_async(v11, block);

    id v9 = v18;
  }
}

- (void)ctcsServerStoreThreadNetworkCredentialActiveDataSetInternally:(id)a3 network:(id)a4 credentialsDataSet:(id)a5 waitForSync:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = sub_1000090D4(1);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v26 = "-[CTCSXPCService ctcsServerStoreThreadNetworkCredentialActiveDataSetInternally:network:credentialsDataSet:wait"
          "ForSync:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Server: %s", buf, 0xCu);
  }

  if (os_variant_has_internal_diagnostics())
  {
    id v17 = [(CTCSXPCService *)self BackingStoreDSInternally];
    if (v17)
    {
      id v18 = v21;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000128AC;
      v21[3] = &unk_100074C08;
      uint8_t v21[4] = v15;
      [v17 storeThreadNetworkCredentialActiveDataSet:v12 network:v13 credentialsDataSet:v14 waitForSync:v8 completion:v21];
    }
    else
    {
      id v20 = dispatch_get_global_queue(0, 0);
      id v18 = v22;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100012824;
      v22[3] = &unk_100074A28;
      v22[4] = v15;
      dispatch_async(v20, v22);
    }
  }
  else
  {
    id v19 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001279C;
    block[3] = &unk_100074A28;
    id v24 = v15;
    dispatch_async(v19, block);

    id v17 = v24;
  }
}

- (void)ctcsServerRetrieveActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = sub_1000090D4(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Server: Retrieving DS credentials for UUID %@...\n", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_10000E92C;
  __int16 v22 = sub_10000E93C;
  id v23 = 0;
  if (os_variant_has_internal_diagnostics())
  {
    id v9 = [(CTCSXPCService *)self BackingStoreDSInternally];
    if (v9)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100012CC8;
      v13[3] = &unk_100074B90;
      v14[1] = &buf;
      v14[0] = v7;
      [v9 retrieveActiveDataSetRecordWithUniqueIdentifier:v6 completion:v13];
      id v10 = (id *)v14;
    }
    else
    {
      id v12 = dispatch_get_global_queue(0, 0);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100012C40;
      v15[3] = &unk_100074A28;
      id v16 = v7;
      dispatch_async(v12, v15);

      id v10 = &v16;
    }
  }
  else
  {
    __int16 v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012BB8;
    block[3] = &unk_100074A28;
    id v18 = v7;
    dispatch_async(v11, block);

    id v9 = v18;
  }

  _Block_object_dispose(&buf, 8);
}

- (void)ctcsServerDeleteActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = sub_1000090D4(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v20 = "-[CTCSXPCService ctcsServerDeleteActiveDataSetRecordWithUniqueIdentifier:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Server: %s", buf, 0xCu);
  }

  if (os_variant_has_internal_diagnostics())
  {
    id v9 = [(CTCSXPCService *)self BackingStoreDSInternally];
    if (v9)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100013108;
      v13[3] = &unk_100074BB8;
      id v14 = v7;
      [v9 deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:v6 completion:v13];
      id v10 = &v14;
    }
    else
    {
      id v12 = dispatch_get_global_queue(0, 0);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100013084;
      v15[3] = &unk_100074A28;
      id v16 = v7;
      dispatch_async(v12, v15);

      id v10 = &v16;
    }
  }
  else
  {
    __int16 v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013000;
    block[3] = &unk_100074A28;
    id v18 = v7;
    dispatch_async(v11, block);

    id v9 = v18;
  }
}

- (void)ctcsServerCleanPreferredAndFrozenThreadNetworksWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000090D4(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v17 = "-[CTCSXPCService ctcsServerCleanPreferredAndFrozenThreadNetworksWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Server: %s", buf, 0xCu);
  }

  if (os_variant_has_internal_diagnostics())
  {
    id v6 = [(CTCSXPCService *)self BackingStoreDSInternally];
    if (v6)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      void v10[2] = sub_100013494;
      v10[3] = &unk_100074BB8;
      id v11 = v4;
      [v6 deletePreferredAndFrozenThreadNetworksWithCompletion:v10];
      id v7 = &v11;
    }
    else
    {
      id v9 = dispatch_get_global_queue(0, 0);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      void v12[2] = sub_100013410;
      v12[3] = &unk_100074A28;
      id v13 = v4;
      dispatch_async(v9, v12);

      id v7 = &v13;
    }
  }
  else
  {
    BOOL v8 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001338C;
    block[3] = &unk_100074A28;
    id v15 = v4;
    dispatch_async(v8, block);

    id v6 = v15;
  }
}

- (void)ctcsServerCleanKeychainThreadNetworksWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000090D4(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v17 = "-[CTCSXPCService ctcsServerCleanKeychainThreadNetworksWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Server: %s", buf, 0xCu);
  }

  if (os_variant_has_internal_diagnostics())
  {
    id v6 = [(CTCSXPCService *)self BackingStoreDSInternally];
    if (v6)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      void v10[2] = sub_100013820;
      v10[3] = &unk_100074BB8;
      id v11 = v4;
      [v6 cleanThreadKeychainDatabase:v10];
      id v7 = &v11;
    }
    else
    {
      id v9 = dispatch_get_global_queue(0, 0);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      void v12[2] = sub_10001379C;
      v12[3] = &unk_100074A28;
      id v13 = v4;
      dispatch_async(v9, v12);

      id v7 = &v13;
    }
  }
  else
  {
    BOOL v8 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013718;
    block[3] = &unk_100074A28;
    id v15 = v4;
    dispatch_async(v8, block);

    id v6 = v15;
  }
}

- (void)ctcsServerAddPreferredNetworkWithCompletionInternally:(id)a3 extendedPANId:(id)a4 borderAgentID:(id)a5 ipV4NwSignature:(id)a6 ipv6NwSignature:(id)a7 wifiSSID:(id)a8 wifiPassword:(id)a9 completion:(id)a10
{
  id v29 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = sub_1000090D4(1);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v37 = "-[CTCSXPCService ctcsServerAddPreferredNetworkWithCompletionInternally:extendedPANId:borderAgentID:ipV4NwSigna"
          "ture:ipv6NwSignature:wifiSSID:wifiPassword:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Server: %s", buf, 0xCu);
  }

  if (os_variant_has_internal_diagnostics())
  {
    id v24 = [(CTCSXPCService *)self BackingStoreDSInternally];
    if (v24)
    {
      id v25 = [objc_alloc((Class)THThreadNetwork) initWithName:v29 extendedPANID:v16];
      id v26 = [objc_alloc((Class)THThreadNetworkBorderAgent) initWithBaDiscrId:v17];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100013CD0;
      v30[3] = &unk_100074BB8;
      id v31 = v22;
      [v24 addPreferredNetworkWithCompletionInternally:v25 borderAgentID:v26 ipV4NwSignature:v18 ipv6NwSignature:v19 wifiSSID:v20 wifiPassword:v21 completion:v30];
    }
    else
    {
      v28 = dispatch_get_global_queue(0, 0);
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100013C4C;
      v32[3] = &unk_100074A28;
      id v33 = v22;
      dispatch_async(v28, v32);

      id v25 = v33;
    }
  }
  else
  {
    __int16 v27 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013BC8;
    block[3] = &unk_100074A28;
    id v35 = v22;
    dispatch_async(v27, block);

    id v24 = v35;
  }
}

- (void)ctcsServerDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion:(id)a3 ipv6NwSignature:(id)a4 wifiSSID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_1000090D4(1);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v26 = "-[CTCSXPCService ctcsServerDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion:ipv6NwSignature:w"
          "ifiSSID:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Server: %s", buf, 0xCu);
  }

  if (os_variant_has_internal_diagnostics())
  {
    id v15 = [(CTCSXPCService *)self BackingStoreDSInternally];
    if (v15)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000140B4;
      v19[3] = &unk_100074BB8;
      id v20 = v13;
      [v15 deletePreferredNetworkForNetworkSignatureInternallyWithCompletion:v10 ipv6NwSignature:v11 wifiSSID:v12 completion:v19];
      id v16 = &v20;
    }
    else
    {
      id v18 = dispatch_get_global_queue(0, 0);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100014030;
      v21[3] = &unk_100074A28;
      id v22 = v13;
      dispatch_async(v18, v21);

      id v16 = &v22;
    }
  }
  else
  {
    id v17 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013FAC;
    block[3] = &unk_100074A28;
    id v24 = v13;
    dispatch_async(v17, block);

    id v15 = v24;
  }
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_dispatch_queue)threadSafeQueue
{
  return self->_threadSafeQueue;
}

- (void)setThreadSafeQueue:(id)a3
{
}

- (ThreadNetworkManagerSelfHealHandler)selfHealHandler
{
  return self->_selfHealHandler;
}

- (void)setSelfHealHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfHealHandler, 0);
  objc_storeStrong((id *)&self->_threadSafeQueue, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end