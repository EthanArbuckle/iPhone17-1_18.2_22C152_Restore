@interface SKPrivacyController
+ (id)_sharedCloudServiceStatusMonitor;
+ (int64_t)_authorizationStatusFromUnderlyingAuthorizationStatus:(int64_t)a3;
+ (int64_t)authorizationStatus;
+ (void)requestAuthorization:(id)a3;
@end

@implementation SKPrivacyController

+ (id)_sharedCloudServiceStatusMonitor
{
  if (_sharedCloudServiceStatusMonitor_sSharedCloudServiceStatusMonitorOnceToken != -1) {
    dispatch_once(&_sharedCloudServiceStatusMonitor_sSharedCloudServiceStatusMonitorOnceToken, &__block_literal_global_2);
  }
  v2 = (void *)_sharedCloudServiceStatusMonitor_sSharedCloudServiceStatusMonitor;

  return v2;
}

void __55__SKPrivacyController__sharedCloudServiceStatusMonitor__block_invoke()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)getICCloudServiceStatusMonitorClass_softClass;
  uint64_t v8 = getICCloudServiceStatusMonitorClass_softClass;
  if (!getICCloudServiceStatusMonitorClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getICCloudServiceStatusMonitorClass_block_invoke;
    v4[3] = &unk_1E5FA9A30;
    v4[4] = &v5;
    __getICCloudServiceStatusMonitorClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = v0;
  _Block_object_dispose(&v5, 8);
  id v2 = objc_alloc_init(v1);
  v3 = (void *)_sharedCloudServiceStatusMonitor_sSharedCloudServiceStatusMonitor;
  _sharedCloudServiceStatusMonitor_sSharedCloudServiceStatusMonitor = (uint64_t)v2;
}

+ (int64_t)_authorizationStatusFromUnderlyingAuthorizationStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int64_t)authorizationStatus
{
  v3 = [a1 _sharedCloudServiceStatusMonitor];
  uint64_t v4 = [v3 authorizationStatusForScopes:1];

  return [a1 _authorizationStatusFromUnderlyingAuthorizationStatus:v4];
}

+ (void)requestAuthorization:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _sharedCloudServiceStatusMonitor];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SKPrivacyController_requestAuthorization___block_invoke;
  v7[3] = &unk_1E5FA9DC8;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  [v5 requestAuthorizationForScopes:1 completionHandler:v7];
}

uint64_t __44__SKPrivacyController_requestAuthorization___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32))
  {
    uint64_t v2 = result;
    [*(id *)(result + 40) _authorizationStatusFromUnderlyingAuthorizationStatus:a2];
    v3 = *(uint64_t (**)(void))(*(void *)(v2 + 32) + 16);
    return v3();
  }
  return result;
}

@end