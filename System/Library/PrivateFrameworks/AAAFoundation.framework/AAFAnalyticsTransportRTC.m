@interface AAFAnalyticsTransportRTC
+ (id)analyticsTransportRTCWithClientType:(id)a3 clientBundleId:(id)a4 clientName:(id)a5;
- (AAFAnalyticsTransportRTC)initWithClientType:(id)a3 clientBundleId:(id)a4 clientName:(id)a5;
- (AAFXPCSession)remoteService;
- (NSNumber)clientType;
- (NSString)clientBundleId;
- (NSString)clientName;
- (NSString)debugDescription;
- (void)dealloc;
- (void)sendEvent:(id)a3;
- (void)setRemoteService:(id)a3;
@end

@implementation AAFAnalyticsTransportRTC

- (AAFAnalyticsTransportRTC)initWithClientType:(id)a3 clientBundleId:(id)a4 clientName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AAFAnalyticsTransportRTC;
  v12 = [(AAFAnalyticsTransportRTC *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientType, a3);
    objc_storeStrong((id *)&v13->_clientBundleId, a4);
    objc_storeStrong((id *)&v13->_clientName, a5);
    v14 = [[AAFXPCSessionConfig alloc] initWithServiceName:@"com.apple.cdp.daemon" remoteProtocol:&unk_1F3941670 options:0];
    v15 = [[AAFXPCSession alloc] initWithRemoteServiceConfig:v14 delegate:v13];
    remoteService = v13->_remoteService;
    v13->_remoteService = v15;

    [(AAFXPCSession *)v13->_remoteService resume];
  }

  return v13;
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  v5 = [(AAFXPCSession *)self->_remoteService remoteServiceProxyWithErrorHandler:&__block_literal_global_5];
  v6 = [v4 clientName];

  if (!v6)
  {
    v7 = _AAFLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[AAFAnalyticsTransportRTC sendEvent:]();
    }

    v8 = [(AAFAnalyticsTransportRTC *)self clientName];
    [v4 setClientName:v8];
  }
  id v9 = [v4 clientBundleId];

  if (!v9)
  {
    id v10 = _AAFLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[AAFAnalyticsTransportRTC sendEvent:]();
    }

    id v11 = [(AAFAnalyticsTransportRTC *)self clientBundleId];
    [v4 setClientBundleId:v11];
  }
  v12 = [v4 clientType];

  if (!v12)
  {
    v13 = _AAFLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[AAFAnalyticsTransportRTC sendEvent:]();
    }

    v14 = [(AAFAnalyticsTransportRTC *)self clientType];
    [v4 setClientType:v14];
  }
  [v5 sendEvent:v4];
}

void __38__AAFAnalyticsTransportRTC_sendEvent___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _AAFLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __38__AAFAnalyticsTransportRTC_sendEvent___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (void)dealloc
{
  [(AAFXPCSession *)self->_remoteService invalidate];
  remoteService = self->_remoteService;
  self->_remoteService = 0;

  v4.receiver = self;
  v4.super_class = (Class)AAFAnalyticsTransportRTC;
  [(AAFAnalyticsTransportRTC *)&v4 dealloc];
}

- (NSString)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(AAFAnalyticsTransportRTC *)self clientType];
  v6 = [(AAFAnalyticsTransportRTC *)self clientBundleId];
  v7 = [(AAFAnalyticsTransportRTC *)self clientName];
  v8 = [v3 stringWithFormat:@"<%@: %p> ClientType: [%@], ClientBundleId: [%@], ClientName: [%@]", v4, self, v5, v6, v7];

  return (NSString *)v8;
}

+ (id)analyticsTransportRTCWithClientType:(id)a3 clientBundleId:(id)a4 clientName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v8 && v9 && v10)
  {
    v12 = (void *)[objc_alloc((Class)a1) initWithClientType:v8 clientBundleId:v9 clientName:v10];
  }
  else
  {
    v13 = _AAFLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[AAFAnalyticsTransportInProcessRTC analyticsTransportRTCWithClientType:clientBundleId:clientName:](v13);
    }

    v12 = 0;
  }

  return v12;
}

- (NSNumber)clientType
{
  return self->_clientType;
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (AAFXPCSession)remoteService
{
  return self->_remoteService;
}

- (void)setRemoteService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
  objc_storeStrong((id *)&self->_clientType, 0);
}

- (void)sendEvent:.cold.1()
{
  OUTLINED_FUNCTION_2();
  v3 = [v2 eventName];
  uint64_t v4 = [v0 clientType];
  v5 = [v1 clientType];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD937000, v6, v7, "Overriding event [%@] clientType to [%@] from [%@]", v8, v9, v10, v11, v12);
}

- (void)sendEvent:.cold.2()
{
  OUTLINED_FUNCTION_2();
  v3 = [v2 eventName];
  uint64_t v4 = [v0 clientBundleId];
  v5 = [v1 clientBundleId];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD937000, v6, v7, "Overriding event [%@] clientBundleId to [%@] from [%@]", v8, v9, v10, v11, v12);
}

- (void)sendEvent:.cold.3()
{
  OUTLINED_FUNCTION_2();
  v3 = [v2 eventName];
  uint64_t v4 = [v0 clientName];
  v5 = [v1 clientName];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD937000, v6, v7, "Overriding event [%@] clientName to [%@] from [%@]", v8, v9, v10, v11, v12);
}

void __38__AAFAnalyticsTransportRTC_sendEvent___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DD937000, a2, OS_LOG_TYPE_ERROR, "Error sending report for event. XPC error: %@", (uint8_t *)&v2, 0xCu);
}

@end