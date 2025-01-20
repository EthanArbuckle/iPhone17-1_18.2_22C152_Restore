@interface ASDLaunchableAppsRequest
+ (int64_t)requestType;
- (ASDLaunchableAppsRequest)initWithOptions:(id)a3;
- (void)startWithCompletionBlock:(id)a3;
@end

@implementation ASDLaunchableAppsRequest

- (ASDLaunchableAppsRequest)initWithOptions:(id)a3
{
  return (ASDLaunchableAppsRequest *)-[ASDEphemeralRequest _initWithOptions:](self, a3);
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4 = a3;
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __53__ASDLaunchableAppsRequest_startWithCompletionBlock___block_invoke;
  newValue[3] = &unk_1E58B30E0;
  id v7 = v4;
  id v5 = v4;
  -[ASDEphemeralRequest _startWithCompletionHandler:](self, (char *)newValue);
}

uint64_t __53__ASDLaunchableAppsRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v7 = v4;
    uint64_t v5 = (*(uint64_t (**)(void))(v5 + 16))();
    id v4 = v7;
  }
  return MEMORY[0x1F41817F8](v5, v4);
}

+ (int64_t)requestType
{
  return 7;
}

@end