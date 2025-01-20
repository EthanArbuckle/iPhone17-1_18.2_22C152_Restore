@interface MDMClientCore
+ (id)clientWithChannelType:(unint64_t)a3;
- (BOOL)authenticateWithCheckInURL:(id)a3 identity:(__SecIdentity *)a4 pinnedSecCertificateRefs:(id)a5 pinningRevocationCheckRequired:(BOOL)a6 topic:(id)a7 useDevelopmentAPNS:(BOOL)a8 signMessage:(BOOL)a9 isUserEnrollment:(BOOL)a10 enrollmentID:(id)a11 outError:(id *)a12;
- (BOOL)checkInRequestAtURL:(id)a3 identity:(__SecIdentity *)a4 pinnedSecCertificateRefs:(id)a5 pinningRevocationCheckRequired:(BOOL)a6 signMessage:(BOOL)a7 isUserEnrollment:(BOOL)a8 enrollmentID:(id)a9 messageType:(id)a10 requestDict:(id)a11 outResponse:(id *)a12 outError:(id *)a13;
- (BOOL)checkOutCheckInURL:(id)a3 identity:(__SecIdentity *)a4 pinnedSecCertificateRefs:(id)a5 pinningRevocationCheckRequired:(BOOL)a6 topic:(id)a7 signMessage:(BOOL)a8 isUserEnrollment:(BOOL)a9 enrollmentID:(id)a10 outError:(id *)a11;
- (BOOL)hasSetPersonaMappingForRestore;
- (BOOL)isActivationLockAllowedWhileSupervised;
- (BOOL)isAwaitingUserConfigured;
- (BOOL)remoteManagementCheckInURL:(id)a3 identity:(__SecIdentity *)a4 pinnedSecCertificateRefs:(id)a5 pinningRevocationCheckRequired:(BOOL)a6 signMessage:(BOOL)a7 isUserEnrollment:(BOOL)a8 enrollmentID:(id)a9 endpoint:(id)a10 requestData:(id)a11 outResponse:(id *)a12 outError:(id *)a13;
- (MDMClientCore)initWithChannelType:(unint64_t)a3;
- (MDMClientCore)initWithChannelType:(unint64_t)a3 dataProvider:(id)a4;
- (MDMClientDataProvider)dataProvider;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)xpcConnectionSyncQueue;
- (id)_deviceEnrollmentAuthenticationDict;
- (id)_userEnrollmentAuthenticationDictWithEnrollmentID:(id)a3;
- (id)_userFieldsForResponse;
- (id)pushToken;
- (unint64_t)accessRights;
- (unint64_t)channelType;
- (void)_destroyXPCConnectionAndInvalidate:(BOOL)a3;
- (void)_queue_createAndStartMDMXPCConnection;
- (void)blockAppInstallsWithCompletion:(id)a3;
- (void)dealloc;
- (void)depPushTokenWithCompletion:(id)a3;
- (void)getAssertionDescriptionsWithCompletion:(id)a3;
- (void)migrateMDMWithContext:(int)a3 completion:(id)a4;
- (void)notifyNewConfiguration;
- (void)processDeviceRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5;
- (void)processUserRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5;
- (void)reauthenticationComplete;
- (void)requestInstallOfAppsInRestoreWithCompletion:(id)a3;
- (void)retryNotNowResponse;
- (void)scheduleTokenUpdate;
- (void)scheduleTokenUpdateIfNecessary;
- (void)setChannelType:(unint64_t)a3;
- (void)setDataProvider:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)simulatePush;
- (void)simulatePushIfNetworkTetheredWithCompletion:(id)a3;
- (void)simulatePushWithCompletion:(id)a3;
- (void)syncDEPPushTokenWithCompletion:(id)a3;
- (void)touchWithCompletion:(id)a3;
- (void)unblockAppInstallsWithCompletion:(id)a3;
- (void)uprootMDM;
@end

@implementation MDMClientCore

+ (id)clientWithChannelType:(unint64_t)a3
{
  v3 = [[MDMClientCore alloc] initWithChannelType:a3];

  return v3;
}

- (MDMClientCore)initWithChannelType:(unint64_t)a3
{
  v5 = objc_opt_new();
  v6 = [(MDMClientCore *)self initWithChannelType:a3 dataProvider:v5];

  return v6;
}

- (MDMClientCore)initWithChannelType:(unint64_t)a3 dataProvider:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MDMClientCore;
  v8 = [(MDMClientCore *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_channelType = a3;
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.devicemanagementclient.MDMClientCore._xpcConnectionSyncQueue", 0);
    xpcConnectionSyncQueue = v9->_xpcConnectionSyncQueue;
    v9->_xpcConnectionSyncQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_dataProvider, a4);
  }

  return v9;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MDMClientCore;
  [(MDMClientCore *)&v3 dealloc];
}

- (BOOL)isActivationLockAllowedWhileSupervised
{
  v2 = [(MDMClientCore *)self dataProvider];
  objc_super v3 = [v2 mdmDictionary];

  if (v3)
  {
    v4 = [v3 objectForKeyedSubscript:@"MDMOptions"];
    v5 = v4;
  }
  else
  {
    v4 = +[MDMOptionsUtilities defaultMDMOptions];
    v5 = v4;
    if (!v4)
    {
      char v7 = 0;
      goto LABEL_5;
    }
  }
  v6 = [v4 objectForKeyedSubscript:@"ActivationLockAllowedWhileSupervised"];
  char v7 = [v6 BOOLValue];

LABEL_5:
  return v7;
}

- (unint64_t)accessRights
{
  v2 = [(MDMClientCore *)self dataProvider];
  objc_super v3 = [v2 mdmDictionary];

  if (v3)
  {
    v4 = [v3 objectForKeyedSubscript:@"AccessRights"];
    unint64_t v5 = [v4 unsignedIntValue];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)getAssertionDescriptionsWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MDMClientCore *)self xpcConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__MDMClientCore_getAssertionDescriptionsWithCompletion___block_invoke;
  v8[3] = &unk_1E6CBCAA8;
  id v9 = v4;
  id v6 = v4;
  char v7 = [v5 remoteObjectProxyWithErrorHandler:v8];

  [v7 getAssertionDescriptionsWithCompletion:v6];
}

void __56__MDMClientCore_getAssertionDescriptionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    unint64_t v5 = v4;
    id v6 = [v3 DMCVerboseDescription];
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1DD340000, v5, OS_LOG_TYPE_ERROR, "Failed to get assertion descriptions. Error: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)notifyNewConfiguration
{
  id v3 = [(MDMClientCore *)self xpcConnection];
  v2 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_0];
  [v2 notifyNewConfigurationWithCompletion:&__block_literal_global_0];
}

void __39__MDMClientCore_notifyNewConfiguration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      unint64_t v5 = [v2 DMCVerboseDescription];
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl(&dword_1DD340000, v4, OS_LOG_TYPE_ERROR, "Error in notifyNewConfiguration XPC reply. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)scheduleTokenUpdate
{
  id v3 = [(MDMClientCore *)self xpcConnection];
  id v2 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_7];
  [v2 scheduleTokenUpdateWithCompletion:&__block_literal_global_7];
}

void __36__MDMClientCore_scheduleTokenUpdate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      unint64_t v5 = [v2 DMCVerboseDescription];
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl(&dword_1DD340000, v4, OS_LOG_TYPE_ERROR, "Error in scheduleTokenUpdate XPC reply. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)scheduleTokenUpdateIfNecessary
{
  id v3 = [(MDMClientCore *)self xpcConnection];
  id v2 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_9];
  [v2 scheduleTokenUpdateIfNecessaryWithCompletion:&__block_literal_global_9];
}

void __47__MDMClientCore_scheduleTokenUpdateIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      unint64_t v5 = [v2 DMCVerboseDescription];
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl(&dword_1DD340000, v4, OS_LOG_TYPE_ERROR, "Error in scheduleTokenUpdate XPC reply. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)retryNotNowResponse
{
  id v3 = [(MDMClientCore *)self xpcConnection];
  id v2 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_11];
  [v2 retryNotNowWithCompletion:&__block_literal_global_11];
}

void __36__MDMClientCore_retryNotNowResponse__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      unint64_t v5 = [v2 DMCVerboseDescription];
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl(&dword_1DD340000, v4, OS_LOG_TYPE_ERROR, "Error in retryNotNowResponse XPC reply. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)simulatePush
{
  id v3 = [(MDMClientCore *)self xpcConnection];
  id v2 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_13];
  [v2 simulatePushWithCompletion:&__block_literal_global_13];
}

void __29__MDMClientCore_simulatePush__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      unint64_t v5 = [v2 DMCVerboseDescription];
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl(&dword_1DD340000, v4, OS_LOG_TYPE_ERROR, "Error in simulatePush XPC reply. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)simulatePushWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__MDMClientCore_simulatePushWithCompletion___block_invoke;
  v9[3] = &unk_1E6CBCAA8;
  id v10 = v4;
  id v5 = v4;
  int v6 = (void *)MEMORY[0x1E01B2E10](v9);
  int v7 = [(MDMClientCore *)self xpcConnection];
  uint64_t v8 = [v7 remoteObjectProxyWithErrorHandler:v6];
  [v8 simulatePushWithCompletion:v6];
}

void __44__MDMClientCore_simulatePushWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      int v6 = [v3 DMCVerboseDescription];
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1DD340000, v5, OS_LOG_TYPE_ERROR, "Error in simulatePushWithCompletion XPC reply. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)simulatePushIfNetworkTetheredWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__MDMClientCore_simulatePushIfNetworkTetheredWithCompletion___block_invoke;
  v9[3] = &unk_1E6CBCAA8;
  id v10 = v4;
  id v5 = v4;
  int v6 = (void *)MEMORY[0x1E01B2E10](v9);
  uint64_t v7 = [(MDMClientCore *)self xpcConnection];
  int v8 = [v7 remoteObjectProxyWithErrorHandler:v6];
  [v8 simulatePushIfNetworkTetheredWithCompletion:v6];
}

void __61__MDMClientCore_simulatePushIfNetworkTetheredWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      int v6 = [v3 DMCVerboseDescription];
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1DD340000, v5, OS_LOG_TYPE_ERROR, "Error in simulatePushIfNetworkTethered XPC reply. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (id)pushToken
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  id v2 = [(MDMClientCore *)self xpcConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_15];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__MDMClientCore_pushToken__block_invoke_16;
  v6[3] = &unk_1E6CBCAF0;
  v6[4] = &v7;
  [v3 pushTokenWithCompletion:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __26__MDMClientCore_pushToken__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 DMCVerboseDescription];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1DD340000, v4, OS_LOG_TYPE_ERROR, "Error getting user push token from mdmuserd. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __26__MDMClientCore_pushToken__block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v7;
      uint64_t v9 = [v6 DMCVerboseDescription];
      int v12 = 138543362;
      objc_super v13 = v9;
      _os_log_impl(&dword_1DD340000, v8, OS_LOG_TYPE_ERROR, "Error getting user push token from mdmuserd. Error: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (void)touchWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MDMClientCore *)self xpcConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__MDMClientCore_touchWithCompletion___block_invoke;
  v11[3] = &unk_1E6CBCAA8;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__MDMClientCore_touchWithCompletion___block_invoke_18;
  v9[3] = &unk_1E6CBCAA8;
  id v10 = v6;
  id v8 = v6;
  [v7 touchWithCompletion:v9];
}

void __37__MDMClientCore_touchWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 DMCVerboseDescription];
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1DD340000, v5, OS_LOG_TYPE_ERROR, "Error reaching out to mdm daemon: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __37__MDMClientCore_touchWithCompletion___block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 DMCVerboseDescription];
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1DD340000, v5, OS_LOG_TYPE_ERROR, "Error touching mdm daemon: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_1DD340000, v4, OS_LOG_TYPE_DEBUG, "TouchWithCompletion completed!", (uint8_t *)&v7, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reauthenticationComplete
{
  id v3 = [(MDMClientCore *)self xpcConnection];
  id v2 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_20];
  [v2 reauthenticationCompleteWithCompletion:&__block_literal_global_20];
}

void __41__MDMClientCore_reauthenticationComplete__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 DMCVerboseDescription];
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl(&dword_1DD340000, v4, OS_LOG_TYPE_ERROR, "Error in reauthenticationComplete XPC reply. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)depPushTokenWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(MDMClientCore *)self xpcConnection];
  id v5 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_22];
  [v5 depPushTokenWithCompletion:v4];
}

void __44__MDMClientCore_depPushTokenWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 DMCVerboseDescription];
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl(&dword_1DD340000, v4, OS_LOG_TYPE_ERROR, "Error connecting to remote. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)syncDEPPushTokenWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(MDMClientCore *)self xpcConnection];
  id v5 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_24];
  [v5 syncDEPPushTokenWithCompletion:v4];
}

void __48__MDMClientCore_syncDEPPushTokenWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = [v2 DMCVerboseDescription];
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl(&dword_1DD340000, v4, OS_LOG_TYPE_ERROR, "Error connecting to remote. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)migrateMDMWithContext:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__MDMClientCore_migrateMDMWithContext_completion___block_invoke;
  v11[3] = &unk_1E6CBCAA8;
  id v12 = v6;
  id v7 = v6;
  uint64_t v8 = (void *)MEMORY[0x1E01B2E10](v11);
  uint64_t v9 = [(MDMClientCore *)self xpcConnection];
  id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v10 migrateMDMWithContext:v4 completion:v8];
}

void __50__MDMClientCore_migrateMDMWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 DMCVerboseDescription];
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1DD340000, v5, OS_LOG_TYPE_ERROR, "Error in migrateMDMWithContext XPC reply. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)uprootMDM
{
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__MDMClientCore_uprootMDM__block_invoke_27;
  v6[3] = &unk_1E6CBCB18;
  objc_copyWeak(&v8, &location);
  id v7 = &__block_literal_global_26;
  id v3 = (void *)MEMORY[0x1E01B2E10](v6);
  uint64_t v4 = [(MDMClientCore *)self xpcConnection];
  id v5 = [v4 remoteObjectProxyWithErrorHandler:v3];
  [v5 uprootMDMWithCompletion:v3];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __26__MDMClientCore_uprootMDM__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = v3;
      id v5 = [v2 DMCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1DD340000, v4, OS_LOG_TYPE_ERROR, "Error in uprootMDM XPC reply. Error: %{public}@. Not attempting a retry.", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __26__MDMClientCore_uprootMDM__block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v5 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = v5;
      id v7 = [v3 DMCVerboseDescription];
      int v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1DD340000, v6, OS_LOG_TYPE_ERROR, "Error in uprootMDM XPC reply. Error: %{public}@. Retrying exactly once...", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v8 = [WeakRetained xpcConnection];
    uint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:*(void *)(a1 + 32)];
    [v9 uprootMDMWithCompletion:*(void *)(a1 + 32)];
  }
}

- (void)requestInstallOfAppsInRestoreWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD340000, v5, OS_LOG_TYPE_DEFAULT, "asking to restore applications", buf, 2u);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__MDMClientCore_requestInstallOfAppsInRestoreWithCompletion___block_invoke;
  v10[3] = &unk_1E6CBCAA8;
  id v11 = v4;
  id v6 = v4;
  id v7 = (void *)MEMORY[0x1E01B2E10](v10);
  uint64_t v8 = [(MDMClientCore *)self xpcConnection];
  uint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:v7];
  [v9 requestInstallOfAppsInRestoreWithCompletion:v7];
}

void __61__MDMClientCore_requestInstallOfAppsInRestoreWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 DMCVerboseDescription];
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1DD340000, v5, OS_LOG_TYPE_ERROR, "Error in restoreApps XPC reply. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (BOOL)hasSetPersonaMappingForRestore
{
  return 1;
}

- (void)blockAppInstallsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD340000, v5, OS_LOG_TYPE_DEFAULT, "block app installs, client block", buf, 2u);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__MDMClientCore_blockAppInstallsWithCompletion___block_invoke;
  v10[3] = &unk_1E6CBCAA8;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = (void *)MEMORY[0x1E01B2E10](v10);
  int v8 = [(MDMClientCore *)self xpcConnection];
  uint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:v7];
  [v9 blockAppInstallsWithCompletion:v7];
}

void __48__MDMClientCore_blockAppInstallsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 DMCVerboseDescription];
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1DD340000, v5, OS_LOG_TYPE_ERROR, "block app installs, client block, error in XPC reply: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)unblockAppInstallsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD340000, v5, OS_LOG_TYPE_DEFAULT, "block app installs, client unblock", buf, 2u);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__MDMClientCore_unblockAppInstallsWithCompletion___block_invoke;
  v10[3] = &unk_1E6CBCAA8;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = (void *)MEMORY[0x1E01B2E10](v10);
  int v8 = [(MDMClientCore *)self xpcConnection];
  uint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:v7];
  [v9 unblockAppInstallsWithCompletion:v7];
}

void __50__MDMClientCore_unblockAppInstallsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = [v3 DMCVerboseDescription];
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1DD340000, v5, OS_LOG_TYPE_ERROR, "block app installs, client unblock, error in XPC reply: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)processDeviceRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__MDMClientCore_processDeviceRequest_encodeResponse_completion___block_invoke;
  v14[3] = &unk_1E6CBCAA8;
  id v15 = v8;
  id v9 = v8;
  id v10 = a3;
  id v11 = (void *)MEMORY[0x1E01B2E10](v14);
  uint64_t v12 = [(MDMClientCore *)self xpcConnection];
  objc_super v13 = [v12 remoteObjectProxyWithErrorHandler:v11];
  [v13 processDeviceRequest:v10 encodeResponse:v5 completion:v9];
}

void __64__MDMClientCore_processDeviceRequest_encodeResponse_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = v4;
      id v6 = [v3 DMCVerboseDescription];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1DD340000, v5, OS_LOG_TYPE_ERROR, "Failed to process device request. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, void, void))(v7 + 16))(v7, v3, 0, 0);
  }
}

- (void)processUserRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__MDMClientCore_processUserRequest_encodeResponse_completion___block_invoke;
  v14[3] = &unk_1E6CBCAA8;
  id v15 = v8;
  id v9 = v8;
  id v10 = a3;
  id v11 = (void *)MEMORY[0x1E01B2E10](v14);
  uint64_t v12 = [(MDMClientCore *)self xpcConnection];
  objc_super v13 = [v12 remoteObjectProxyWithErrorHandler:v11];
  [v13 processUserRequest:v10 encodeResponse:v5 completion:v9];
}

void __62__MDMClientCore_processUserRequest_encodeResponse_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = v4;
      id v6 = [v3 DMCVerboseDescription];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1DD340000, v5, OS_LOG_TYPE_ERROR, "Failed to process user request. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, void, void))(v7 + 16))(v7, v3, 0, 0);
  }
}

- (BOOL)isAwaitingUserConfigured
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  id v2 = [(MDMClientCore *)self xpcConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_29];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__MDMClientCore_isAwaitingUserConfigured__block_invoke_30;
  v5[3] = &unk_1E6CBCB40;
  v5[4] = &v6;
  [v3 isAwaitingUserConfiguredWithCompletion:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __41__MDMClientCore_isAwaitingUserConfigured__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      BOOL v5 = [v2 DMCVerboseDescription];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1DD340000, v4, OS_LOG_TYPE_ERROR, "Failed to start query for isAwaitingUserConfigured. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __41__MDMClientCore_isAwaitingUserConfigured__block_invoke_30(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    int v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = v6;
      uint64_t v8 = [v5 DMCVerboseDescription];
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1DD340000, v7, OS_LOG_TYPE_ERROR, "Failed to query isAwaitingUserConfigured. Error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
}

- (BOOL)authenticateWithCheckInURL:(id)a3 identity:(__SecIdentity *)a4 pinnedSecCertificateRefs:(id)a5 pinningRevocationCheckRequired:(BOOL)a6 topic:(id)a7 useDevelopmentAPNS:(BOOL)a8 signMessage:(BOOL)a9 isUserEnrollment:(BOOL)a10 enrollmentID:(id)a11 outError:(id *)a12
{
  BOOL v36 = a6;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v17 = a11;
  id v18 = a7;
  id v19 = a5;
  id v20 = a3;
  v21 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD340000, v21, OS_LOG_TYPE_DEFAULT, "Authenticating with MDM", buf, 2u);
  }
  v37 = v17;
  if (a10) {
    [(MDMClientCore *)self _userEnrollmentAuthenticationDictWithEnrollmentID:v17];
  }
  else {
  v22 = [(MDMClientCore *)self _deviceEnrollmentAuthenticationDict];
  }
  [v22 setObject:v18 forKeyedSubscript:@"Topic"];

  v23 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v22 format:100 options:0 error:0];
  v24 = [MDMHTTPTransaction alloc];
  v25 = +[MDMConfiguration sharedConfiguration];
  v26 = [v25 rmAccountID];
  BYTE2(v35) = 0;
  LOWORD(v35) = 1;
  v27 = -[MDMHTTPTransaction initWithURL:data:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isCheckin:isCheckout:isShortTransaction:rmAccountID:](v24, "initWithURL:data:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isCheckin:isCheckout:isShortTransaction:rmAccountID:", v20, v23, a4, v19, v36, a9, v35, v26);

  if ([MEMORY[0x1E4F5E788] shouldSimulateMDMCommunication])
  {
    v28 = +[DMCHTTPTransaction emptySuccessResponseBlock];
    [(DMCHTTPTransaction *)v27 setSimulatedTransactionBlock:v28];
  }
  [(DMCHTTPTransaction *)v27 performSynchronously];
  v29 = [(DMCHTTPTransaction *)v27 error];
  uint64_t v30 = DMCLogObjects();
  v31 = *(NSObject **)(v30 + 8);
  if (v29)
  {
    if (os_log_type_enabled(*(os_log_t *)(v30 + 8), OS_LOG_TYPE_ERROR))
    {
      v32 = v31;
      v33 = [v29 DMCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      v39 = v33;
      _os_log_impl(&dword_1DD340000, v32, OS_LOG_TYPE_ERROR, "Cannot Authenticate. Error: %{public}@", buf, 0xCu);
    }
    if (a12) {
      *a12 = v29;
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(v30 + 8), OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD340000, v31, OS_LOG_TYPE_DEFAULT, "Authentication with MDM finished.", buf, 2u);
  }

  return v29 == 0;
}

- (BOOL)checkOutCheckInURL:(id)a3 identity:(__SecIdentity *)a4 pinnedSecCertificateRefs:(id)a5 pinningRevocationCheckRequired:(BOOL)a6 topic:(id)a7 signMessage:(BOOL)a8 isUserEnrollment:(BOOL)a9 enrollmentID:(id)a10 outError:(id *)a11
{
  BOOL v11 = a8;
  BOOL v13 = a6;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v17 = a10;
  id v18 = a7;
  id v19 = a5;
  id v20 = a3;
  v21 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD340000, v21, OS_LOG_TYPE_DEFAULT, "Checking out of MDM service", buf, 2u);
  }
  v22 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:@"CheckOut" forKey:@"MessageType"];
  [v22 setObject:v18 forKeyedSubscript:@"Topic"];

  if (a9)
  {
    [v22 setObject:v17 forKeyedSubscript:@"EnrollmentID"];
  }
  else
  {
    v23 = [MEMORY[0x1E4F5E7A0] deviceUDID];
    [v22 setObject:v23 forKeyedSubscript:@"UDID"];
  }
  v24 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v22 format:100 options:0 error:0];
  BYTE2(v33) = 1;
  LOWORD(v33) = 256;
  v25 = -[MDMHTTPTransaction initWithURL:data:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isCheckin:isCheckout:isShortTransaction:rmAccountID:]([MDMHTTPTransaction alloc], "initWithURL:data:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isCheckin:isCheckout:isShortTransaction:rmAccountID:", v20, v24, a4, v19, v13, v11, v33, 0);

  if ([MEMORY[0x1E4F5E788] shouldSimulateMDMCommunication])
  {
    v26 = +[DMCHTTPTransaction emptySuccessResponseBlock];
    [(DMCHTTPTransaction *)v25 setSimulatedTransactionBlock:v26];
  }
  [(DMCHTTPTransaction *)v25 performSynchronously];
  v27 = [(DMCHTTPTransaction *)v25 error];

  uint64_t v28 = DMCLogObjects();
  v29 = *(NSObject **)(v28 + 8);
  if (v27)
  {
    if (os_log_type_enabled(*(os_log_t *)(v28 + 8), OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = v29;
      v31 = [v27 DMCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v31;
      _os_log_impl(&dword_1DD340000, v30, OS_LOG_TYPE_ERROR, "Cannot Check Out. Error: %{public}@", buf, 0xCu);
    }
    if (a11) {
      *a11 = v27;
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(v28 + 8), OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD340000, v29, OS_LOG_TYPE_DEFAULT, "Check out finished.", buf, 2u);
  }

  return v27 == 0;
}

- (BOOL)remoteManagementCheckInURL:(id)a3 identity:(__SecIdentity *)a4 pinnedSecCertificateRefs:(id)a5 pinningRevocationCheckRequired:(BOOL)a6 signMessage:(BOOL)a7 isUserEnrollment:(BOOL)a8 enrollmentID:(id)a9 endpoint:(id)a10 requestData:(id)a11 outResponse:(id *)a12 outError:(id *)a13
{
  BOOL v31 = a7;
  BOOL v32 = a8;
  BOOL v30 = a6;
  v16 = a12;
  id v15 = a13;
  id v18 = a10;
  id v17 = a11;
  v33[1] = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a5;
  id v21 = a9;
  id v22 = v17;
  v33[0] = @"Endpoint";
  v23 = (void *)MEMORY[0x1E4F1C9E8];
  id v24 = v18;
  v25 = [v23 dictionaryWithObjects:&a10 forKeys:v33 count:1];

  v26 = (void *)[v25 mutableCopy];
  if (v22) {
    [v26 setObject:v22 forKeyedSubscript:@"Data"];
  }
  BOOL v27 = [(MDMClientCore *)self checkInRequestAtURL:v19 identity:a4 pinnedSecCertificateRefs:v20 pinningRevocationCheckRequired:v30 signMessage:v31 isUserEnrollment:v32 enrollmentID:v21 messageType:@"DeclarativeManagement" requestDict:v26 outResponse:v16 outError:v15];

  return v27;
}

- (BOOL)checkInRequestAtURL:(id)a3 identity:(__SecIdentity *)a4 pinnedSecCertificateRefs:(id)a5 pinningRevocationCheckRequired:(BOOL)a6 signMessage:(BOOL)a7 isUserEnrollment:(BOOL)a8 enrollmentID:(id)a9 messageType:(id)a10 requestDict:(id)a11 outResponse:(id *)a12 outError:(id *)a13
{
  BOOL v13 = a8;
  BOOL v14 = a7;
  BOOL v15 = a6;
  v66[2] = *MEMORY[0x1E4F143B8];
  id v56 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a5;
  id v23 = a3;
  id v24 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v60 = v20;
    _os_log_impl(&dword_1DD340000, v24, OS_LOG_TYPE_DEFAULT, "Running CheckIn Request to MDM service with MessageType: %{public}@", buf, 0xCu);
  }
  v55 = v20;
  if (v13)
  {
    v65[0] = @"MessageType";
    v65[1] = @"EnrollmentID";
    v66[0] = v20;
    v66[1] = v56;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:2];
    v26 = (void *)[v25 mutableCopy];
  }
  else
  {
    v63[0] = @"MessageType";
    v63[1] = @"UDID";
    v64[0] = v20;
    v25 = [MEMORY[0x1E4F5E7A0] deviceUDID];
    v64[1] = v25;
    BOOL v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:2];
    v26 = (void *)[v27 mutableCopy];
  }
  if (v21) {
    [v26 addEntriesFromDictionary:v21];
  }
  id v54 = v21;
  if ([(MDMClientCore *)self channelType] == 1)
  {
    uint64_t v28 = [(MDMClientCore *)self _userFieldsForResponse];
    [v26 addEntriesFromDictionary:v28];
  }
  v29 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v26 format:100 options:0 error:0];
  BOOL v30 = [MDMHTTPTransaction alloc];
  BOOL v31 = +[MDMConfiguration sharedConfiguration];
  BOOL v32 = [v31 rmAccountID];
  BYTE2(v53) = 1;
  LOWORD(v53) = 1;
  uint64_t v33 = -[MDMHTTPTransaction initWithURL:data:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isCheckin:isCheckout:isShortTransaction:rmAccountID:](v30, "initWithURL:data:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isCheckin:isCheckout:isShortTransaction:rmAccountID:", v23, v29, a4, v22, v15, v14, v53, v32);

  [(DMCHTTPTransaction *)v33 performSynchronously];
  v34 = [(DMCHTTPTransaction *)v33 error];
  uint64_t v35 = [(DMCHTTPTransaction *)v33 statusCode];
  uint64_t v36 = v35;
  if (v34)
  {
    if (v35 == 401)
    {
      v37 = [(DMCHTTPTransaction *)v33 authenticator];

      if (v37)
      {
        v38 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DD340000, v38, OS_LOG_TYPE_DEFAULT, "CheckIn failed with 401 and authenticator present - cannot re-auth here", buf, 2u);
        }
      }
    }

    v39 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = v39;
      v41 = [v34 DMCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      id v60 = v55;
      __int16 v61 = 2114;
      v62 = v41;
      _os_log_impl(&dword_1DD340000, v40, OS_LOG_TYPE_ERROR, "Could Not Check In for MessageType: %{public}@ with Error: %{public}@", buf, 0x16u);
    }
    v42 = v54;
    if (a13) {
      *a13 = v34;
    }
  }
  else
  {
    uint64_t v43 = [(DMCHTTPTransaction *)v33 responseHeaders];
    v44 = (void *)v43;
    v45 = (void *)MEMORY[0x1E4F1CC08];
    if (v43) {
      v45 = (void *)v43;
    }
    id v46 = v45;

    v47 = [(DMCHTTPTransaction *)v33 responseData];

    if (a12)
    {
      v57[0] = @"ResponseStatusCode";
      v48 = [NSNumber numberWithInteger:v36];
      v57[1] = @"ResponseHeaders";
      v58[0] = v48;
      v58[1] = v46;
      v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
      v50 = (void *)[v49 mutableCopy];

      [v50 setObject:v47 forKeyedSubscript:@"ResponseBody"];
      *a12 = (id)[v50 copy];
    }
    v51 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD340000, v51, OS_LOG_TYPE_DEFAULT, "Finished running CheckIn Request on MDM service", buf, 2u);
    }

    v42 = v54;
  }

  return v34 == 0;
}

- (id)_userFieldsForResponse
{
  v10[2] = *MEMORY[0x1E4F143B8];
  DMCLKLogoutSupportClass();
  id v2 = objc_opt_new();
  char v3 = [v2 isCurrentUserAnonymous];

  if (v3)
  {
    id v4 = @"Temporary Session";
  }
  else
  {
    id v5 = [(id)DMCUMUserManagerClass() sharedManager];
    int v6 = [v5 currentUser];

    id v4 = [v6 username];
  }
  v9[0] = @"UserID";
  v9[1] = @"UserShortName";
  v10[0] = @"FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF";
  v10[1] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (NSXPCConnection)xpcConnection
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  BOOL v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  char v3 = [(MDMClientCore *)self xpcConnectionSyncQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__MDMClientCore_xpcConnection__block_invoke;
  v6[3] = &unk_1E6CBCB68;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSXPCConnection *)v4;
}

void __30__MDMClientCore_xpcConnection__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  char v3 = (void *)v2[1];
  if (!v3)
  {
    objc_msgSend(v2, "_queue_createAndStartMDMXPCConnection");
    char v3 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  id v4 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v4, v3);
}

- (void)_destroyXPCConnectionAndInvalidate:(BOOL)a3
{
  id v5 = [(MDMClientCore *)self xpcConnectionSyncQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__MDMClientCore__destroyXPCConnectionAndInvalidate___block_invoke;
  v6[3] = &unk_1E6CBCB90;
  BOOL v7 = a3;
  void v6[4] = self;
  dispatch_sync(v5, v6);
}

void __52__MDMClientCore__destroyXPCConnectionAndInvalidate___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  }
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

- (void)_queue_createAndStartMDMXPCConnection
{
  unint64_t v3 = [(MDMClientCore *)self channelType];
  if (v3 == 1)
  {
    id v4 = @"com.apple.managedconfiguration.mdmuserdservice";
    id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F38913E8];
    MDMUserXPCProtocolInitialize(v5);
  }
  else if (v3)
  {
    id v4 = 0;
    id v5 = 0;
  }
  else
  {
    id v4 = @"com.apple.managedconfiguration.mdmdservice";
    id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3891388];
    MDMXPCProtocolInitialize(v5);
  }
  int v6 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v4 options:4096];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v6;

  [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v5];
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__MDMClientCore__queue_createAndStartMDMXPCConnection__block_invoke;
  void v10[3] = &unk_1E6CBCBB8;
  objc_copyWeak(&v11, &location);
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__MDMClientCore__queue_createAndStartMDMXPCConnection__block_invoke_118;
  v8[3] = &unk_1E6CBCBB8;
  objc_copyWeak(&v9, &location);
  [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v8];
  [(NSXPCConnection *)self->_xpcConnection resume];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __54__MDMClientCore__queue_createAndStartMDMXPCConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)unint64_t v3 = 0;
    _os_log_impl(&dword_1DD340000, v2, OS_LOG_TYPE_ERROR, "MDM connection invalidation handler called", v3, 2u);
  }
  [WeakRetained _destroyXPCConnectionAndInvalidate:0];
}

void __54__MDMClientCore__queue_createAndStartMDMXPCConnection__block_invoke_118(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v3 = 0;
    _os_log_impl(&dword_1DD340000, v2, OS_LOG_TYPE_DEFAULT, "MDM connection interruption handler called", v3, 2u);
  }
  [WeakRetained _destroyXPCConnectionAndInvalidate:1];
}

- (id)_userEnrollmentAuthenticationDictWithEnrollmentID:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"MessageType";
  v13[1] = @"EnrollmentID";
  v14[0] = @"Authenticate";
  v14[1] = a3;
  unint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  id v5 = [v3 dictionaryWithObjects:v14 forKeys:v13 count:2];
  int v6 = (void *)[v5 mutableCopy];

  BOOL v7 = [MEMORY[0x1E4F5E7A0] marketingVersion];
  [v6 DMCSetObjectIfNotNil:v7 forKey:@"OSVersion"];

  uint64_t v8 = [MEMORY[0x1E4F5E7A0] buildVersion];
  [v6 DMCSetObjectIfNotNil:v8 forKey:@"BuildVersion"];

  id v9 = (void *)MEMORY[0x1E4F5E788];
  uint64_t v10 = [MEMORY[0x1E4F5E7A0] productType];
  id v11 = [v9 productNameWithDefaultValue:v10];

  [v6 DMCSetObjectIfNotNil:v11 forKey:@"ProductName"];

  return v6;
}

- (id)_deviceEnrollmentAuthenticationDict
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v22[0] = @"MessageType";
  v22[1] = @"UDID";
  v23[0] = @"Authenticate";
  unint64_t v3 = [MEMORY[0x1E4F5E7A0] deviceUDID];
  v23[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  id v5 = (void *)[v4 mutableCopy];

  v21[0] = @"OSVersion";
  v21[1] = @"BuildVersion";
  v21[2] = @"ProductName";
  v21[3] = @"SerialNumber";
  v21[4] = @"IMEI";
  v21[5] = @"MEID";
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:6];
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v20];
  unint64_t v7 = [(MDMClientCore *)self accessRights];
  uint64_t v8 = +[MDMConfiguration sharedConfiguration];
  id v9 = [v8 personaID];
  uint64_t v10 = +[MDMDeviceQueryUtilities allowedDeviceQueriesForAccessRights:v7 isDataSeparated:v9 != 0];

  [v6 intersectSet:v10];
  if ([v6 containsObject:@"OSVersion"])
  {
    id v11 = [MEMORY[0x1E4F5E7A0] marketingVersion];
    [v5 DMCSetObjectIfNotNil:v11 forKey:@"OSVersion"];
  }
  if ([v6 containsObject:@"BuildVersion"])
  {
    id v12 = [MEMORY[0x1E4F5E7A0] buildVersion];
    [v5 DMCSetObjectIfNotNil:v12 forKey:@"BuildVersion"];
  }
  if ([v6 containsObject:@"ProductName"])
  {
    BOOL v13 = (void *)MEMORY[0x1E4F5E788];
    BOOL v14 = [MEMORY[0x1E4F5E7A0] productType];
    BOOL v15 = [v13 productNameWithDefaultValue:v14];
    [v5 DMCSetObjectIfNotNil:v15 forKey:@"ProductName"];
  }
  if ([v6 containsObject:@"SerialNumber"])
  {
    v16 = DMCIOSerialString();
    [v5 DMCSetObjectIfNotNil:v16 forKey:@"SerialNumber"];
  }
  if ([v6 containsObject:@"IMEI"])
  {
    id v17 = DMCCTIMEI();
    [v5 DMCSetObjectIfNotNil:v17 forKey:@"IMEI"];
  }
  if ([v6 containsObject:@"MEID"])
  {
    id v18 = DMCCTMEID();
    [v5 DMCSetObjectIfNotNil:v18 forKey:@"MEID"];
  }

  return v5;
}

- (unint64_t)channelType
{
  return self->_channelType;
}

- (void)setChannelType:(unint64_t)a3
{
  self->_channelType = a3;
}

- (void)setXpcConnection:(id)a3
{
}

- (OS_dispatch_queue)xpcConnectionSyncQueue
{
  return self->_xpcConnectionSyncQueue;
}

- (MDMClientDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_xpcConnectionSyncQueue, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end