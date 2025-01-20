@interface IMDRelayServiceReachabilityRequest
+ (id)requestFromData:(id)a3 error:(id *)a4;
- (IMDRelayServiceReachabilityRequest)initWithHandles:(id)a3 serviceName:(id)a4 context:(id)a5;
- (IMServiceReachabilityContext)context;
- (NSArray)handles;
- (NSString)serviceName;
- (id)createDictionary;
- (void)setContext:(id)a3;
- (void)setHandles:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation IMDRelayServiceReachabilityRequest

- (IMDRelayServiceReachabilityRequest)initWithHandles:(id)a3 serviceName:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IMDRelayServiceReachabilityRequest;
  v12 = [(IMDRelayServiceReachabilityRequest *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_handles, a3);
    objc_storeStrong((id *)&v13->_serviceName, a4);
    objc_storeStrong((id *)&v13->_context, a5);
  }

  return v13;
}

+ (id)requestFromData:(id)a3 error:(id *)a4
{
  v4 = +[IMBlastdoor sendRelayReachabilityRequest:a3 error:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F6E970]);
    v6 = [v4 context];
    v7 = (void *)[v5 initWithBlastDoorContext:v6];

    v8 = [IMDRelayServiceReachabilityRequest alloc];
    id v9 = [v4 handles];
    id v10 = [v4 serviceName];
    id v11 = [(IMDRelayServiceReachabilityRequest *)v8 initWithHandles:v9 serviceName:v10 context:v7];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)createDictionary
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"h";
  v3 = [(IMDRelayServiceReachabilityRequest *)self handles];
  v10[0] = v3;
  v9[1] = @"s";
  v4 = [(IMDRelayServiceReachabilityRequest *)self serviceName];
  v10[1] = v4;
  v9[2] = @"c";
  id v5 = [(IMDRelayServiceReachabilityRequest *)self context];
  v6 = [v5 createDictionary];
  v10[2] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (NSArray)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (IMServiceReachabilityContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);

  objc_storeStrong((id *)&self->_handles, 0);
}

@end