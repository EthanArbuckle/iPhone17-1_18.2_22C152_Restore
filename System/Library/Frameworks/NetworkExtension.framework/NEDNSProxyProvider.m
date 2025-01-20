@interface NEDNSProxyProvider
- (BOOL)handleNewFlow:(NEAppProxyFlow *)flow;
- (BOOL)handleNewUDPFlow:(id)a3 initialRemoteFlowEndpoint:(id)a4;
- (NSArray)systemDNSSettings;
- (void)cancelProxyWithError:(NSError *)error;
- (void)setSystemDNSSettings:(id)a3;
- (void)startProxyWithOptions:(NSDictionary *)options completionHandler:(void *)completionHandler;
- (void)stopProxyWithReason:(NEProviderStopReason)reason completionHandler:(void *)completionHandler;
@end

@implementation NEDNSProxyProvider

- (void).cxx_destruct
{
}

- (void)setSystemDNSSettings:(id)a3
{
}

- (NSArray)systemDNSSettings
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)handleNewUDPFlow:(id)a3 initialRemoteFlowEndpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(NEProvider *)self _callSwiftHandleNewUDPFlow:v6 initialRemoteFlowEndpoint:v7];
  if (v8 == -1)
  {
    v10 = [MEMORY[0x1E4F38BE8] endpointWithCEndpoint:v7];
    BOOL v9 = [(NEDNSProxyProvider *)self handleNewUDPFlow:v6 initialRemoteEndpoint:v10];
  }
  else
  {
    BOOL v9 = v8 != 0;
  }

  return v9;
}

- (BOOL)handleNewFlow:(NEAppProxyFlow *)flow
{
  return 0;
}

- (void)cancelProxyWithError:(NSError *)error
{
  v4 = error;
  id v5 = [(NEProvider *)self context];
  [v5 cancelWithError:v4];
}

- (void)stopProxyWithReason:(NEProviderStopReason)reason completionHandler:(void *)completionHandler
{
}

- (void)startProxyWithOptions:(NSDictionary *)options completionHandler:(void *)completionHandler
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11[0] = @"startProxyWithOptions:completionHandler: not implemented";
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = completionHandler;
  int64_t v8 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  BOOL v9 = [v5 errorWithDomain:@"NEDNSProxyProviderDefaultErrorDomain" code:1 userInfo:v8];
  (*((void (**)(void *, void *))completionHandler + 2))(v7, v9);
}

@end