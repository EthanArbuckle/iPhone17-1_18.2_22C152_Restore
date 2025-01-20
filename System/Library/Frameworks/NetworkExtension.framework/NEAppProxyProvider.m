@interface NEAppProxyProvider
- (BOOL)handleNewFlow:(NEAppProxyFlow *)flow;
- (BOOL)handleNewUDPFlow:(id)a3 initialRemoteFlowEndpoint:(id)a4;
- (unint64_t)maxWriteSize;
- (void)cancelProxyWithError:(NSError *)error;
- (void)fetchFlowStatesWithCompletionHandler:(id)a3;
- (void)setMaxWriteSize:(unint64_t)a3;
- (void)startProxyWithOptions:(NSDictionary *)options completionHandler:(void *)completionHandler;
- (void)stopProxyWithReason:(NEProviderStopReason)reason completionHandler:(void *)completionHandler;
@end

@implementation NEAppProxyProvider

- (void)fetchFlowStatesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7 = [(NEProvider *)self context];
  id v5 = v4;
  if (v7)
  {
    if (v7[15])
    {
      id v8 = v5;
      NEFlowDirectorFetchFlowStates();
    }
    else
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1C978]);
      (*((void (**)(id, id))v5 + 2))(v5, v6);
    }
  }
}

- (unint64_t)maxWriteSize
{
  v2 = [(NEProvider *)self context];
  if (v2) {
    unint64_t MaxSendSize = NEFlowDirectorGetMaxSendSize();
  }
  else {
    unint64_t MaxSendSize = 0;
  }

  return MaxSendSize;
}

- (void)setMaxWriteSize:(unint64_t)a3
{
  v3 = [(NEProvider *)self context];
  if (v3)
  {
    id v4 = v3;
    NEFlowDirectorSetMaxSendSize();
    v3 = v4;
  }
}

- (BOOL)handleNewUDPFlow:(id)a3 initialRemoteFlowEndpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(NEProvider *)self _callSwiftHandleNewUDPFlow:v6 initialRemoteFlowEndpoint:v7];
  if (v8 == -1)
  {
    v10 = [MEMORY[0x1E4F38BE8] endpointWithCEndpoint:v7];
    BOOL v9 = [(NEAppProxyProvider *)self handleNewUDPFlow:v6 initialRemoteEndpoint:v10];
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
  id v4 = error;
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
  BOOL v9 = [v5 errorWithDomain:@"NEAppProxyProviderDefaultErrorDomain" code:1 userInfo:v8];
  (*((void (**)(void *, void *))completionHandler + 2))(v7, v9);
}

@end