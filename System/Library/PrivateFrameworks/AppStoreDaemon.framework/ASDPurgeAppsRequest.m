@interface ASDPurgeAppsRequest
+ (int64_t)requestType;
- (ASDPurgeAppsRequest)initWithOptions:(id)a3;
- (void)startWithCompletionBlock:(id)a3;
@end

@implementation ASDPurgeAppsRequest

- (ASDPurgeAppsRequest)initWithOptions:(id)a3
{
  return (ASDPurgeAppsRequest *)-[ASDEphemeralRequest _initWithOptions:](self, a3);
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4 = a3;
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __48__ASDPurgeAppsRequest_startWithCompletionBlock___block_invoke;
  newValue[3] = &unk_1E58B30E0;
  id v7 = v4;
  id v5 = v4;
  -[ASDEphemeralRequest _startWithCompletionHandler:](self, (char *)newValue);
}

uint64_t __48__ASDPurgeAppsRequest_startWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (int64_t)requestType
{
  return 12;
}

@end