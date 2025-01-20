@interface DTStoreKitService
+ (BOOL)_commandRequiresBundleID:(unint64_t)a3;
+ (id)_dataUsingCompatibilityTimeRateFrom:(id)a3 currentVersion:(int)a4;
+ (void)_sendMessage:(id)a3 onConnection:(id)a4 completion:(id)a5;
+ (void)registerCapabilities:(id)a3;
+ (void)removeConfigurationDataForBundleID:(id)a3 connection:(id)a4 completion:(id)a5;
+ (void)syncConfigurationAssetData:(id)a3 fileName:(id)a4 forBundleID:(id)a5 connection:(id)a6 completion:(id)a7;
+ (void)syncConfigurationData:(id)a3 forBundleID:(id)a4 connection:(id)a5 completion:(id)a6;
- (BOOL)_handleBuyProductMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5;
- (BOOL)_handleChangeAutoRenewStatusMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5;
- (BOOL)_handleCompleteAskToBuyTransactionMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5;
- (BOOL)_handleDeleteAllTransactionsMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5;
- (BOOL)_handleDiscoverAppsMessage:(id)a3 error:(id *)a4;
- (BOOL)_handleFetchTransactionsMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5;
- (BOOL)_handleGetConfigurationMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5;
- (BOOL)_handleObserveTransactionsMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5;
- (BOOL)_handleRemoveConfigurationMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5;
- (BOOL)_handleSendPurchaseIntentMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5;
- (BOOL)_handleSyncConfigurationAssetMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5;
- (BOOL)_handleSyncConfigurationMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5;
- (BOOL)_handleUpdateTransactionMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5;
- (BOOL)_processMessage:(id)a3 error:(id *)a4;
- (DTStoreKitService)initWithChannel:(id)a3;
- (id)_descriptionForServiceCommand:(unint64_t)a3;
- (id)_synchronousRemoteObjectProxy:(id *)a3;
- (void)_disconnectServiceConnection;
- (void)_sendGenericSuccessResponseForMessage:(id)a3;
- (void)messageReceived:(id)a3;
- (void)transactionDeleted:(unint64_t)a3 forBundleID:(id)a4;
- (void)transactionUpdated:(id)a3 forBundleID:(id)a4;
@end

@implementation DTStoreKitService

+ (void)registerCapabilities:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138543362;
    uint64_t v6 = objc_opt_class();
    _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "[%{public}@] Registering service", (uint8_t *)&v5, 0xCu);
  }
  [v4 publishCapability:@"com.apple.instruments.server.services.storekit" withVersion:8 forClass:a1];
}

- (DTStoreKitService)initWithChannel:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DTStoreKitService;
  int v5 = [(DTXService *)&v20 initWithChannel:v4];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.storekit.configuration.xpc" options:0];
    connectionToDaemon = v5->_connectionToDaemon;
    v5->_connectionToDaemon = (NSXPCConnection *)v6;

    v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E54A048];
    [(NSXPCConnection *)v5->_connectionToDaemon setRemoteObjectInterface:v8];

    v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E53B740];
    [(NSXPCConnection *)v5->_connectionToDaemon setExportedInterface:v9];

    [(NSXPCConnection *)v5->_connectionToDaemon setExportedObject:v5];
    objc_initWeak(&location, v5);
    v10 = v5->_connectionToDaemon;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_2308AD0C4;
    v17[3] = &unk_264B8D760;
    objc_copyWeak(&v18, &location);
    [(NSXPCConnection *)v10 setInterruptionHandler:v17];
    v11 = v5->_connectionToDaemon;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_2308AD178;
    v15[3] = &unk_264B8D760;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v11 setInvalidationHandler:v15];
    [(NSXPCConnection *)v5->_connectionToDaemon resume];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_2308AD240;
    v13[3] = &unk_264B8D760;
    objc_copyWeak(&v14, &location);
    [v4 registerDisconnectHandler:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)_disconnectServiceConnection
{
  [(NSXPCConnection *)self->_connectionToDaemon invalidate];
  connectionToDaemon = self->_connectionToDaemon;
  self->_connectionToDaemon = 0;
}

+ (void)removeConfigurationDataForBundleID:(id)a3 connection:(id)a4 completion:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138543618;
    uint64_t v14 = objc_opt_class();
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "[%{public}@] Remove configuration called for %{public}@", (uint8_t *)&v13, 0x16u);
  }
  if ((int)[v9 remoteCapabilityVersion:@"com.apple.instruments.server.services.storekit"] <= 0)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_opt_class();
      int v13 = 138543362;
      uint64_t v14 = v12;
      _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "[%{public}@] Unsupported device, cannot remove configuration", (uint8_t *)&v13, 0xCu);
    }
    v10[2](v10, 0);
  }
  else
  {
    v11 = [MEMORY[0x263F38CA0] messageWithObject:v8];
    [v11 setInteger:5 forMessageKey:@"serviceCommand"];
    [a1 _sendMessage:v11 onConnection:v9 completion:v10];
  }
}

+ (void)syncConfigurationData:(id)a3 forBundleID:(id)a4 connection:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (void (**)(id, void *))a6;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v26 = 138543618;
    *(void *)&v26[4] = objc_opt_class();
    __int16 v27 = 2114;
    id v28 = v11;
    _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "[%{public}@] Sync configuration called for %{public}@", v26, 0x16u);
  }
  if ((int)[v12 remoteCapabilityVersion:@"com.apple.instruments.server.services.storekit"] <= 0)
  {
    v25 = DTSKServiceErrorWithDescription(8, @"Cannot sync configuration", v14, v15, v16, v17, v18, v19, *(uint64_t *)v26);
    v13[2](v13, v25);
  }
  else if (v10)
  {
    uint64_t v20 = [v12 remoteCapabilityVersion:@"com.apple.instruments.server.services.storekit"];
    if ((int)v20 <= 4)
    {
      uint64_t v21 = v20;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = objc_opt_class();
        *(_DWORD *)v26 = 138543362;
        *(void *)&v26[4] = v22;
        _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[%{public}@] Using compatibility time rate to sync configuration", v26, 0xCu);
      }
      uint64_t v23 = [a1 _dataUsingCompatibilityTimeRateFrom:v10 currentVersion:v21];

      id v10 = (id)v23;
    }
    v24 = [MEMORY[0x263F38CA0] messageWithObject:v11];
    [v24 setInteger:6 forMessageKey:@"serviceCommand"];
    [v24 setData:v10 forMessageKey:@"configurationFile"];
    [a1 _sendMessage:v24 onConnection:v12 completion:v13];
  }
  else
  {
    DTSKServiceErrorWithDescription(2, @"Missing configuration file data", v14, v15, v16, v17, v18, v19, *(uint64_t *)v26);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v10);
  }
}

+ (void)syncConfigurationAssetData:(id)a3 fileName:(id)a4 forBundleID:(id)a5 connection:(id)a6 completion:(id)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, void *))a7;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int16 v27 = 138543618;
    *(void *)&v27[4] = objc_opt_class();
    __int16 v28 = 2114;
    id v29 = v14;
    _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "[%{public}@] Sync configuration asset called for %{public}@", v27, 0x16u);
  }
  if ((int)[v15 remoteCapabilityVersion:@"com.apple.instruments.server.services.storekit"] > 7)
  {
    if (v12)
    {
      if (v13 && [v13 length])
      {
        v24 = [MEMORY[0x263F38CA0] messageWithObject:v14];
        [v24 setInteger:13 forMessageKey:@"serviceCommand"];
        [v24 setData:v12 forMessageKey:@"configurationAsset"];
        [v24 setString:v13 forMessageKey:@"configurationAssetFileName"];
        [a1 _sendMessage:v24 onConnection:v15 completion:v16];

        goto LABEL_14;
      }
      v25 = @"Empty asset file name";
    }
    else
    {
      v25 = @"Missing configuration asset data";
    }
    v26 = DTSKServiceErrorWithDescription(7, v25, v17, v18, v19, v20, v21, v22, *(uint64_t *)v27);
    v16[2](v16, v26);

    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = objc_opt_class();
    *(_DWORD *)__int16 v27 = 138543874;
    *(void *)&v27[4] = v23;
    __int16 v28 = 2114;
    id v29 = v13;
    __int16 v30 = 2114;
    id v31 = v14;
    _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "[%{public}@] Will not sync StoreKit asset %{public}@ for %{public}@. Unsupported device.", v27, 0x20u);
  }
  v16[2](v16, 0);
LABEL_14:
}

+ (void)_sendMessage:(id)a3 onConnection:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [a4 makeChannelWithIdentifier:@"com.apple.instruments.server.services.storekit"];
  uint64_t v16 = v9;
  if (v9)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = (uint64_t)sub_2308ADAEC;
    v18[3] = (uint64_t)&unk_264B8E960;
    id v19 = v9;
    id v20 = v8;
    [v19 sendControlAsync:v7 replyHandler:v18];
  }
  else
  {
    uint64_t v17 = DTSKServiceErrorWithDescription(4, @"DTStoreKitService is unavailable.", v10, v11, v12, v13, v14, v15, v18[0]);
    (*((void (**)(id, void *))v8 + 2))(v8, v17);
  }
}

- (void)messageReceived:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = objc_opt_class();
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "[%{public}@] Message received: %{public}@", buf, 0x16u);
  }
  if ((id)*MEMORY[0x263F38CC8] != v5)
  {
    id v13 = 0;
    BOOL v6 = [(DTStoreKitService *)self _processMessage:v5 error:&v13];
    id v7 = v13;
    id v8 = v7;
    if (!v6)
    {
      if (!v7)
      {
        uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
        [v12 handleFailureInMethod:a2 object:self file:@"DTStoreKitService.m" lineNumber:234 description:@"rdar://98220290 False positive nil passed to a callee that requires a non-null parameter"];
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        uint64_t v15 = v9;
        __int16 v16 = 2114;
        id v17 = v5;
        __int16 v18 = 2114;
        id v19 = v8;
        _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[%{public}@] Error processing message %{public}@: %{public}@", buf, 0x20u);
      }
      uint64_t v10 = (void *)[v5 newReplyWithError:v8];
      uint64_t v11 = [(DTXService *)self channel];
      [v11 sendMessage:v10 replyHandler:0];
    }
  }
}

- (void)transactionDeleted:(unint64_t)a3 forBundleID:(id)a4
{
  id v7 = [MEMORY[0x263F38CA0] messageWithObject:a4];
  [v7 setInteger:7 forMessageKey:@"serviceCommand"];
  [v7 setInteger:2 forMessageKey:@"action"];
  [v7 setInteger:a3 forMessageKey:@"transactionID"];
  BOOL v6 = [(DTXService *)self channel];
  [v6 sendMessageAsync:v7 replyHandler:0];
}

- (void)transactionUpdated:(id)a3 forBundleID:(id)a4
{
  BOOL v6 = (void *)MEMORY[0x263F38CA0];
  id v7 = a3;
  id v9 = [v6 messageWithObject:a4];
  [v9 setInteger:7 forMessageKey:@"serviceCommand"];
  [v9 setData:v7 forMessageKey:@"transactionData"];

  id v8 = [(DTXService *)self channel];
  [v8 sendMessageAsync:v9 replyHandler:0];
}

- (BOOL)_handleBuyProductMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_2308AE124;
  v40 = sub_2308AE134;
  id v41 = 0;
  __int16 v16 = [v8 dataForMessageKey:@"purchaseConfiguration"];
  if (v16)
  {
    id v17 = (id *)(v37 + 5);
    id obj = (id)v37[5];
    __int16 v18 = [(DTStoreKitService *)self _synchronousRemoteObjectProxy:&obj];
    objc_storeStrong(v17, obj);
    uint64_t v28 = MEMORY[0x263EF8330];
    uint64_t v29 = 3221225472;
    __int16 v30 = sub_2308AE13C;
    id v31 = &unk_264B8E988;
    v34 = &v36;
    uint64_t v32 = self;
    id v33 = v9;
    [v18 buyProductWithConfiguration:v16 bundleID:v33 completion:&v28];
  }
  else
  {
    uint64_t v19 = DTSKServiceErrorWithDescription(6, @"Missing purchase configuration data required to complete buy", v10, v11, v12, v13, v14, v15, v28);
    uint64_t v20 = (void *)v37[5];
    v37[5] = v19;
  }
  if (a5)
  {
    uint64_t v21 = (void *)v37[5];
    if (v21) {
      *a5 = v21;
    }
  }
  uint64_t v22 = [v8 newReply:v28, v29, v30, v31, v32];
  uint64_t v23 = v37[5];
  [v22 setInteger:v23 == 0 forMessageKey:@"success"];
  v24 = (void *)v37[5];
  if (v24)
  {
    v25 = [v24 localizedDescription];
    [v22 setString:v25 forMessageKey:@"response"];
  }
  v26 = [(DTXService *)self channel];
  [v26 sendControlAsync:v22 replyHandler:0];

  _Block_object_dispose(&v36, 8);
  return v23 == 0;
}

- (BOOL)_handleSendPurchaseIntentMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0;
  __int16 v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = sub_2308AE124;
  id v33 = sub_2308AE134;
  id v34 = 0;
  __int16 v16 = [v8 stringForMessageKey:@"productID"];
  if (v16)
  {
    id v17 = (id *)(v30 + 5);
    id obj = (id)v30[5];
    __int16 v18 = [(DTStoreKitService *)self _synchronousRemoteObjectProxy:&obj];
    objc_storeStrong(v17, obj);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_2308AE490;
    v24[3] = &unk_264B8E9B0;
    __int16 v27 = &v29;
    v24[4] = self;
    id v25 = v16;
    id v26 = v9;
    [v18 sendPurchaseIntentForProductIdentifier:v25 bundleID:v26 completion:v24];
  }
  else
  {
    uint64_t v19 = DTSKServiceErrorWithDescription(3, @"Missing product ID", v10, v11, v12, v13, v14, v15, v23);
    uint64_t v20 = (void *)v30[5];
    v30[5] = v19;
  }
  uint64_t v21 = (void *)v30[5];
  if (a5 && v21)
  {
    *a5 = v21;
    uint64_t v21 = (void *)v30[5];
  }
  if (!v21) {
    [(DTStoreKitService *)self _sendGenericSuccessResponseForMessage:v8];
  }

  _Block_object_dispose(&v29, 8);
  return v21 == 0;
}

- (BOOL)_handleChangeAutoRenewStatusMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_2308AE124;
  id v26 = sub_2308AE134;
  id v27 = 0;
  uint64_t v10 = [v8 integerForMessageKey:@"response"];
  uint64_t v11 = [v8 integerForMessageKey:@"transactionID"];
  uint64_t v12 = (id *)(v23 + 5);
  id obj = (id)v23[5];
  uint64_t v13 = [(DTStoreKitService *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(v12, obj);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2308AE7D8;
  v17[3] = &unk_264B8E9D8;
  uint64_t v19 = &v22;
  uint64_t v20 = v11;
  void v17[4] = self;
  id v14 = v9;
  id v18 = v14;
  [v13 changeAutoRenewStatus:v10 != 0 transactionID:v11 bundleID:v14 completion:v17];

  uint64_t v15 = (void *)v23[5];
  if (a5 && v15)
  {
    *a5 = v15;
    uint64_t v15 = (void *)v23[5];
  }
  if (!v15) {
    [(DTStoreKitService *)self _sendGenericSuccessResponseForMessage:v8];
  }

  _Block_object_dispose(&v22, 8);
  return v15 == 0;
}

- (BOOL)_handleCompleteAskToBuyTransactionMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_2308AE124;
  id v26 = sub_2308AE134;
  id v27 = 0;
  uint64_t v10 = [v8 integerForMessageKey:@"response"];
  uint64_t v11 = [v8 integerForMessageKey:@"transactionID"];
  uint64_t v12 = (id *)(v23 + 5);
  id obj = (id)v23[5];
  uint64_t v13 = [(DTStoreKitService *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(v12, obj);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2308AEB30;
  v17[3] = &unk_264B8E9D8;
  uint64_t v19 = &v22;
  uint64_t v20 = v11;
  void v17[4] = self;
  id v14 = v9;
  id v18 = v14;
  [v13 completeAskToBuyRequestWithResponse:v10 != 0 transactionID:v11 bundleID:v14 completion:v17];

  uint64_t v15 = (void *)v23[5];
  if (a5 && v15)
  {
    *a5 = v15;
    uint64_t v15 = (void *)v23[5];
  }
  if (!v15) {
    [(DTStoreKitService *)self _sendGenericSuccessResponseForMessage:v8];
  }

  _Block_object_dispose(&v22, 8);
  return v15 == 0;
}

- (BOOL)_handleDeleteAllTransactionsMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_2308AE124;
  id v26 = sub_2308AE134;
  id v27 = 0;
  id obj = 0;
  uint64_t v10 = [(DTStoreKitService *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(&v27, obj);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  __int16 v16 = sub_2308AEE34;
  id v17 = &unk_264B8EA00;
  uint64_t v20 = &v22;
  id v18 = self;
  id v11 = v9;
  id v19 = v11;
  [v10 deleteAllTransactionsForBundleID:v11 completion:&v14];

  uint64_t v12 = (void *)v23[5];
  if (a5 && v12)
  {
    *a5 = v12;
    uint64_t v12 = (void *)v23[5];
  }
  if (!v12) {
    -[DTStoreKitService _sendGenericSuccessResponseForMessage:](self, "_sendGenericSuccessResponseForMessage:", v8, v14, v15, v16, v17, v18);
  }

  _Block_object_dispose(&v22, 8);
  return v12 == 0;
}

- (BOOL)_handleFetchTransactionsMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  __int16 v30 = sub_2308AE124;
  uint64_t v31 = sub_2308AE134;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_2308AE124;
  id v25 = sub_2308AE134;
  id v26 = 0;
  id obj = 0;
  uint64_t v10 = [(DTStoreKitService *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(&v32, obj);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_2308AF1A4;
  v16[3] = &unk_264B8EA28;
  id v18 = &v27;
  id v19 = &v21;
  v16[4] = self;
  id v11 = v9;
  id v17 = v11;
  [v10 getTransactionDataForBundleID:v11 completion:v16];

  uint64_t v12 = (void *)v28[5];
  if (a5 && v12)
  {
    *a5 = v12;
    uint64_t v12 = (void *)v28[5];
  }
  if (!v12)
  {
    uint64_t v13 = (void *)[v8 newReplyWithObject:v22[5]];
    uint64_t v14 = [(DTXService *)self channel];
    [v14 sendControlAsync:v13 replyHandler:0];
  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v12 == 0;
}

- (BOOL)_handleRemoveConfigurationMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_2308AE124;
  id v26 = sub_2308AE134;
  id v27 = 0;
  id obj = 0;
  uint64_t v10 = [(DTStoreKitService *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(&v27, obj);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  __int16 v16 = sub_2308AF4B4;
  id v17 = &unk_264B8EA00;
  uint64_t v20 = &v22;
  id v18 = self;
  id v11 = v9;
  id v19 = v11;
  [v10 removeConfigurationForBundleID:v11 completion:&v14];

  uint64_t v12 = (void *)v23[5];
  if (a5 && v12)
  {
    *a5 = v12;
    uint64_t v12 = (void *)v23[5];
  }
  if (!v12) {
    -[DTStoreKitService _sendGenericSuccessResponseForMessage:](self, "_sendGenericSuccessResponseForMessage:", v8, v14, v15, v16, v17, v18);
  }

  _Block_object_dispose(&v22, 8);
  return v12 == 0;
}

- (BOOL)_handleSyncConfigurationMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  __int16 v16 = [v8 dataForMessageKey:@"configurationFile"];
  if (v16)
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    __int16 v30 = sub_2308AE124;
    uint64_t v31 = sub_2308AE134;
    id v32 = 0;
    id obj = 0;
    id v17 = [(DTStoreKitService *)self _synchronousRemoteObjectProxy:&obj];
    objc_storeStrong(&v32, obj);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = (uint64_t)sub_2308AF904;
    v25[3] = (uint64_t)&unk_264B8EA50;
    v25[4] = (uint64_t)&v27;
    [v17 saveConfigurationData:v16 forBundleID:v9 completion:v25];

    if (a5) {
      *a5 = (id) v28[5];
    }
    uint64_t v18 = v28[5];
    BOOL v19 = v18 == 0;
    id v20 = MEMORY[0x263EF8438];
    if (v18)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = objc_opt_class();
        uint64_t v22 = v28[5];
        *(_DWORD *)buf = 138543874;
        uint64_t v34 = v21;
        __int16 v35 = 2114;
        id v36 = v9;
        __int16 v37 = 2114;
        uint64_t v38 = v22;
        _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[%{public}@] Failed to save configuration file for %{public}@: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v23 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v34 = v23;
        __int16 v35 = 2114;
        id v36 = v9;
        _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "[%{public}@] Successfully saved configuration file for %{public}@", buf, 0x16u);
      }

      [(DTStoreKitService *)self _sendGenericSuccessResponseForMessage:v8];
    }
    _Block_object_dispose(&v27, 8);
  }
  else if (a5)
  {
    DTSKServiceErrorWithDescription(2, @"Configuration data is required", v10, v11, v12, v13, v14, v15, v25[0]);
    BOOL v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)_handleSyncConfigurationAssetMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 dataForMessageKey:@"configurationAsset"];
  id v17 = [v8 stringForMessageKey:@"configurationAssetFileName"];
  if (v10)
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = sub_2308AE124;
    id v32 = sub_2308AE134;
    id v33 = 0;
    id obj = 0;
    uint64_t v18 = [(DTStoreKitService *)self _synchronousRemoteObjectProxy:&obj];
    objc_storeStrong(&v33, obj);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = (uint64_t)sub_2308AFC48;
    v26[3] = (uint64_t)&unk_264B8EA50;
    v26[4] = (uint64_t)&v28;
    [v18 saveConfigurationAssetData:v10 fileName:v17 forBundleID:v9 completion:v26];

    if (a5) {
      *a5 = (id) v29[5];
    }
    uint64_t v19 = v29[5];
    BOOL v20 = v19 == 0;
    id v21 = MEMORY[0x263EF8438];
    if (v19)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = objc_opt_class();
        uint64_t v23 = v29[5];
        *(_DWORD *)buf = 138544130;
        uint64_t v35 = v22;
        __int16 v36 = 2114;
        __int16 v37 = v17;
        __int16 v38 = 2114;
        id v39 = v9;
        __int16 v40 = 2114;
        uint64_t v41 = v23;
        _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[%{public}@] Failed to save configuration asset %{public}@ for %{public}@: %{public}@", buf, 0x2Au);
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v24 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        uint64_t v35 = v24;
        __int16 v36 = 2114;
        __int16 v37 = v17;
        __int16 v38 = 2114;
        id v39 = v9;
        _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "[%{public}@] Successfully saved configuration asset %{public}@ for %{public}@", buf, 0x20u);
      }

      [(DTStoreKitService *)self _sendGenericSuccessResponseForMessage:v8];
    }
    _Block_object_dispose(&v28, 8);
  }
  else if (a5)
  {
    DTSKServiceErrorWithDescription(2, @"Configuration asset data is required", v11, v12, v13, v14, v15, v16, v26[0]);
    BOOL v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)_handleGetConfigurationMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = sub_2308AE124;
  v44 = sub_2308AE134;
  id v45 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  __int16 v37 = sub_2308AE124;
  __int16 v38 = sub_2308AE134;
  id v39 = 0;
  id obj = 0;
  uint64_t v10 = [(DTStoreKitService *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(&v45, obj);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_2308B0024;
  v32[3] = &unk_264B8EA78;
  v32[4] = &v40;
  v32[5] = &v34;
  [v10 configurationDataForBundleID:v9 completion:v32];

  uint64_t v17 = v41[5];
  if (v35[5])
  {
    if (!v17)
    {
      uint64_t v18 = MEMORY[0x263EF8438];
      id v19 = MEMORY[0x263EF8438];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v47 = v20;
        __int16 v48 = 2114;
        id v49 = v9;
        _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "[%{public}@] Successfully received configuration file for %{public}@", buf, 0x16u);
      }

      id v21 = (void *)[v8 newReplyWithObject:v9];
      [v21 setData:v35[5] forMessageKey:@"configurationFile"];
      uint64_t v22 = [(DTXService *)self channel];
      [v22 sendControlAsync:v21 replyHandler:0];

      BOOL v23 = 1;
      goto LABEL_12;
    }
  }
  else if (!v17)
  {
    uint64_t v24 = DTSKServiceErrorWithDescription(2, @"Configuration data not found", v11, v12, v13, v14, v15, v16, v31);
    id v25 = (void *)v41[5];
    v41[5] = v24;

    if (!v41[5]) {
      __assert_rtn("-[DTStoreKitService _handleGetConfigurationMessage:forBundleID:error:]", "DTStoreKitService.m", 561, "localError");
    }
  }
  id v26 = MEMORY[0x263EF8438];
  id v27 = MEMORY[0x263EF8438];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = v41[5];
    *(_DWORD *)buf = 138543874;
    uint64_t v47 = v28;
    __int16 v48 = 2114;
    id v49 = v9;
    __int16 v50 = 2114;
    uint64_t v51 = v29;
    _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get configuration file for %{public}@: %{public}@", buf, 0x20u);
  }

  BOOL v23 = 0;
  if (a5) {
    *a5 = (id) v41[5];
  }
LABEL_12:
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  return v23;
}

- (BOOL)_handleUpdateTransactionMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  __int16 v38 = sub_2308AE124;
  id v39 = sub_2308AE134;
  id v40 = 0;
  uint64_t v10 = [v8 integerForMessageKey:@"action"];
  uint64_t v11 = [v8 integerForMessageKey:@"transactionID"];
  if (v10)
  {
    uint64_t v12 = v11;
    uint64_t v13 = (id *)(v36 + 5);
    id obj = (id)v36[5];
    uint64_t v14 = [(DTStoreKitService *)self _synchronousRemoteObjectProxy:&obj];
    objc_storeStrong(v13, obj);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = sub_2308B0388;
    v29[3] = &unk_264B8EAA0;
    uint64_t v31 = &v35;
    uint64_t v32 = v10;
    v29[4] = self;
    uint64_t v33 = v12;
    id v30 = v9;
    [v14 performAction:v10 transactionID:v12 bundleID:v30 completion:v29];
  }
  else
  {
    uint64_t v15 = MEMORY[0x263EF8438];
    id v16 = MEMORY[0x263EF8438];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v17;
      __int16 v43 = 2048;
      uint64_t v44 = 0;
      _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[%{public}@] Unknown action provided: %ld", buf, 0x16u);
    }

    uint64_t v18 = [NSString stringWithFormat:@"Unknown action: %ld"];
    uint64_t v25 = DTSKServiceErrorWithDescription(5, v18, v19, v20, v21, v22, v23, v24, 0);
    id v26 = (void *)v36[5];
    v36[5] = v25;
  }
  id v27 = (void *)v36[5];
  if (a5 && v27)
  {
    *a5 = v27;
    id v27 = (void *)v36[5];
  }
  if (!v27) {
    [(DTStoreKitService *)self _sendGenericSuccessResponseForMessage:v8];
  }
  _Block_object_dispose(&v35, 8);

  return v27 == 0;
}

- (BOOL)_handleObserveTransactionsMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_2308AE124;
  uint64_t v31 = sub_2308AE134;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_2308AE124;
  uint64_t v25 = sub_2308AE134;
  id v26 = 0;
  id obj = 0;
  uint64_t v10 = [(DTStoreKitService *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(&v32, obj);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_2308B0728;
  v16[3] = &unk_264B8EA28;
  uint64_t v18 = &v27;
  uint64_t v19 = &v21;
  v16[4] = self;
  id v11 = v9;
  id v17 = v11;
  [v10 startObservingTransactionsForBundleID:v11 completion:v16];

  uint64_t v12 = (void *)v28[5];
  if (a5 && v12)
  {
    *a5 = v12;
    uint64_t v12 = (void *)v28[5];
  }
  if (!v12)
  {
    uint64_t v13 = (void *)[v8 newReplyWithObject:v22[5]];
    uint64_t v14 = [(DTXService *)self channel];
    [v14 sendControlAsync:v13 replyHandler:0];
  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v12 == 0;
}

- (BOOL)_handleDiscoverAppsMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_2308AE124;
  uint64_t v24 = sub_2308AE134;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_2308AE124;
  uint64_t v18 = sub_2308AE134;
  id v19 = 0;
  id obj = 0;
  id v7 = [(DTStoreKitService *)self _synchronousRemoteObjectProxy:&obj];
  objc_storeStrong(&v25, obj);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_2308B0A94;
  v12[3] = &unk_264B8EAC8;
  v12[5] = &v20;
  v12[6] = &v14;
  v12[4] = self;
  [v7 testingAppsWithCompletion:v12];

  id v8 = (void *)v21[5];
  if (a4 && v8)
  {
    *a4 = v8;
    id v8 = (void *)v21[5];
  }
  if (!v8)
  {
    id v9 = (void *)[v6 newReplyWithObject:v15[5]];
    uint64_t v10 = [(DTXService *)self channel];
    [v10 sendControlAsync:v9 replyHandler:0];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v8 == 0;
}

- (BOOL)_processMessage:(id)a3 error:(id *)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = [v7 integerForMessageKey:@"serviceCommand"];
  id v9 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  uint64_t v10 = [v7 objectWithAllowedClasses:v9];

  if ([(id)objc_opt_class() _commandRequiresBundleID:v8]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    DTSKServiceErrorWithDescription(1, @"No bundleID specified for message: %@", v11, v12, v13, v14, v15, v16, (uint64_t)v7);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
LABEL_8:
      BOOL v28 = 0;
      if (!a4) {
        goto LABEL_27;
      }
      goto LABEL_25;
    }
    uint64_t v29 = [MEMORY[0x263F08690] currentHandler];
    id v30 = v29;
    SEL v31 = a2;
    id v32 = self;
    uint64_t v33 = 669;
LABEL_29:
    [v29 handleFailureInMethod:v31 object:v32 file:@"DTStoreKitService.m" lineNumber:v33 description:@"rdar://98220290 False positive nil passed to a callee that requires a non-null parameter"];

    BOOL v28 = 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = [(DTStoreKitService *)self _descriptionForServiceCommand:v8];
      *(_DWORD *)buf = 138543618;
      uint64_t v49 = v23;
      __int16 v50 = 2114;
      uint64_t v51 = v24;
      _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "[%{public}@] Service Command Received: \"%{public}@\"", buf, 0x16u);
    }
    switch(v8)
    {
      case 1:
        uint64_t v47 = 0;
        id v25 = (id *)&v47;
        BOOL v26 = [(DTStoreKitService *)self _handleChangeAutoRenewStatusMessage:v7 forBundleID:v10 error:&v47];
        break;
      case 2:
        uint64_t v46 = 0;
        id v25 = (id *)&v46;
        BOOL v26 = [(DTStoreKitService *)self _handleCompleteAskToBuyTransactionMessage:v7 forBundleID:v10 error:&v46];
        break;
      case 3:
        uint64_t v45 = 0;
        id v25 = (id *)&v45;
        BOOL v26 = [(DTStoreKitService *)self _handleDeleteAllTransactionsMessage:v7 forBundleID:v10 error:&v45];
        break;
      case 4:
        uint64_t v44 = 0;
        id v25 = (id *)&v44;
        BOOL v26 = [(DTStoreKitService *)self _handleFetchTransactionsMessage:v7 forBundleID:v10 error:&v44];
        break;
      case 5:
        uint64_t v43 = 0;
        id v25 = (id *)&v43;
        BOOL v26 = [(DTStoreKitService *)self _handleRemoveConfigurationMessage:v7 forBundleID:v10 error:&v43];
        break;
      case 6:
        uint64_t v42 = 0;
        id v25 = (id *)&v42;
        BOOL v26 = [(DTStoreKitService *)self _handleSyncConfigurationMessage:v7 forBundleID:v10 error:&v42];
        break;
      case 7:
        uint64_t v40 = 0;
        id v25 = (id *)&v40;
        BOOL v26 = [(DTStoreKitService *)self _handleUpdateTransactionMessage:v7 forBundleID:v10 error:&v40];
        break;
      case 8:
        uint64_t v39 = 0;
        id v25 = (id *)&v39;
        BOOL v26 = [(DTStoreKitService *)self _handleBuyProductMessage:v7 forBundleID:v10 error:&v39];
        break;
      case 9:
        uint64_t v38 = 0;
        id v25 = (id *)&v38;
        BOOL v26 = [(DTStoreKitService *)self _handleObserveTransactionsMessage:v7 forBundleID:v10 error:&v38];
        break;
      case 10:
        uint64_t v37 = 0;
        id v25 = (id *)&v37;
        BOOL v26 = [(DTStoreKitService *)self _handleDiscoverAppsMessage:v7 error:&v37];
        break;
      case 11:
        uint64_t v41 = 0;
        id v25 = (id *)&v41;
        BOOL v26 = [(DTStoreKitService *)self _handleGetConfigurationMessage:v7 forBundleID:v10 error:&v41];
        break;
      case 12:
        uint64_t v36 = 0;
        id v25 = (id *)&v36;
        BOOL v26 = [(DTStoreKitService *)self _handleSendPurchaseIntentMessage:v7 forBundleID:v10 error:&v36];
        break;
      case 13:
        uint64_t v35 = 0;
        id v25 = (id *)&v35;
        BOOL v26 = [(DTStoreKitService *)self _handleSyncConfigurationAssetMessage:v7 forBundleID:v10 error:&v35];
        break;
      default:
        DTSKServiceErrorWithDescription(0, @"Unknown StoreKit service command received: \"%ld\"", v17, v18, v19, v20, v21, v22, v8);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        if (v27) {
          goto LABEL_8;
        }
        uint64_t v29 = [MEMORY[0x263F08690] currentHandler];
        id v30 = v29;
        SEL v31 = a2;
        id v32 = self;
        uint64_t v33 = 716;
        goto LABEL_29;
    }
    BOOL v28 = v26;
    id v27 = *v25;
    if (a4)
    {
LABEL_25:
      if (v27)
      {
        id v27 = v27;
        *a4 = v27;
      }
    }
  }
LABEL_27:

  return v28;
}

- (void)_sendGenericSuccessResponseForMessage:(id)a3
{
  id v5 = (id)[a3 newReply];
  [v5 setInteger:1 forMessageKey:@"success"];
  id v4 = [(DTXService *)self channel];
  [v4 sendControlAsync:v5 replyHandler:0];
}

- (id)_synchronousRemoteObjectProxy:(id *)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_2308AE124;
  uint64_t v13 = sub_2308AE134;
  id v14 = 0;
  connectionToDaemon = self->_connectionToDaemon;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_2308B11F0;
  v8[3] = &unk_264B8EAF0;
  v8[4] = self;
  v8[5] = &v9;
  id v5 = [(NSXPCConnection *)connectionToDaemon synchronousRemoteObjectProxyWithErrorHandler:v8];
  if (a3)
  {
    id v6 = (void *)v10[5];
    if (v6) {
      *a3 = v6;
    }
  }
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (id)_descriptionForServiceCommand:(unint64_t)a3
{
  if (a3 >= 0xE)
  {
    [NSString stringWithFormat:@"Unknown command \"%lu\"", a3];
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_264B8EB38[a3];
  }
  return v3;
}

+ (id)_dataUsingCompatibilityTimeRateFrom:(id)a3 currentVersion:(int)a4
{
  id v5 = a3;
  id v6 = [MEMORY[0x263F08900] JSONObjectWithData:v5 options:0 error:0];
  id v7 = (void *)[v6 mutableCopy];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v7 objectForKey:@"settings"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v8 objectForKey:@"_compatibilityTimeRate"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v19 = 0;
        uint64_t v20 = &v19;
        uint64_t v21 = 0x3032000000;
        uint64_t v22 = sub_2308AE124;
        uint64_t v23 = sub_2308AE134;
        id v24 = 0;
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = sub_2308B15D4;
        v17[3] = &unk_264B8EB18;
        int v18 = a4;
        void v17[4] = &v19;
        [v9 enumerateKeysAndObjectsUsingBlock:v17];
        if (v20[5])
        {
          uint64_t v10 = [v9 objectForKeyedSubscript:];
          uint64_t v11 = (void *)[v8 mutableCopy];
          [v11 setObject:v10 forKey:@"_timeRate"];
          [v11 removeObjectForKey:@"_compatibilityTimeRate"];
          [v7 setObject:v11 forKey:@"settings"];
          uint64_t v12 = [MEMORY[0x263F08900] dataWithJSONObject:v7 options:0 error:0];
          uint64_t v13 = (void *)v12;
          if (v12) {
            id v14 = (void *)v12;
          }
          else {
            id v14 = v5;
          }
          id v15 = v14;
        }
        else
        {
          id v15 = v5;
        }
        _Block_object_dispose(&v19, 8);
      }
      else
      {
        id v15 = v5;
      }
    }
    else
    {
      id v15 = v5;
    }
  }
  else
  {
    id v15 = v5;
  }

  return v15;
}

+ (BOOL)_commandRequiresBundleID:(unint64_t)a3
{
  return a3 != 10;
}

- (void).cxx_destruct
{
}

@end