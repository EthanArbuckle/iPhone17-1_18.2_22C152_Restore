@interface IMDRelayServiceReachabilityResponse
+ (id)responseFromData:(id)a3 error:(id *)a4;
- (IMDRelayServiceReachabilityResponse)initWithResult:(id)a3;
- (IMServiceReachabilityResult)result;
- (id)createDictionary;
- (void)setResult:(id)a3;
@end

@implementation IMDRelayServiceReachabilityResponse

- (IMDRelayServiceReachabilityResponse)initWithResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMDRelayServiceReachabilityResponse;
  v6 = [(IMDRelayServiceReachabilityResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_result, a3);
  }

  return v7;
}

+ (id)responseFromData:(id)a3 error:(id *)a4
{
  v4 = +[IMBlastdoor sendRelayReachabilityResponse:a3 error:a4];
  if (v4)
  {
    id v5 = [IMDRelayServiceReachabilityResponse alloc];
    id v6 = objc_alloc(MEMORY[0x1E4F6E990]);
    v7 = [v4 result];
    v8 = (void *)[v6 initWithBlastDoorResult:v7];
    objc_super v9 = [(IMDRelayServiceReachabilityResponse *)v5 initWithResult:v8];
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (id)createDictionary
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"r";
  v2 = [(IMDRelayServiceReachabilityResponse *)self result];
  v3 = [v2 createDictionary];
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (IMServiceReachabilityResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end