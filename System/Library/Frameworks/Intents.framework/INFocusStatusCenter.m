@interface INFocusStatusCenter
+ (INFocusStatusCenter)defaultCenter;
- (DNDAvailabilityService)service;
- (INFocusStatus)focusStatus;
- (INFocusStatusAuthorizationStatus)authorizationStatus;
- (INFocusStatusCenter)init;
- (void)requestAuthorizationWithCompletionHandler:(void *)completionHandler;
@end

@implementation INFocusStatusCenter

- (void).cxx_destruct
{
}

- (DNDAvailabilityService)service
{
  return self->_service;
}

- (void)requestAuthorizationWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  if ([(INFocusStatusCenter *)self authorizationStatus] == INFocusStatusAuthorizationStatusRestricted)
  {
    if (v4) {
      v4[2](v4, 1);
    }
  }
  else
  {
    v5 = v4;
    TCCAccessRequest();
  }
}

uint64_t __65__INFocusStatusCenter_requestAuthorizationWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2) {
      uint64_t v3 = 3;
    }
    else {
      uint64_t v3 = 2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

- (INFocusStatusAuthorizationStatus)authorizationStatus
{
  if (TCCAccessRestricted()) {
    return 1;
  }
  int v3 = TCCAccessPreflight();
  if (v3) {
    return 2 * (v3 == 1);
  }
  else {
    return 3;
  }
}

- (INFocusStatus)focusStatus
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(INFocusStatusCenter *)self authorizationStatus] == INFocusStatusAuthorizationStatusAuthorized)
  {
    int v3 = [(INFocusStatusCenter *)self service];
    id v12 = 0;
    int v4 = [v3 isLocalUserAvailableReturningError:&v12];
    id v5 = v12;

    if (v5)
    {
      v6 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[INFocusStatusCenter focusStatus]";
        __int16 v15 = 2114;
        id v16 = v5;
        _os_log_error_impl(&dword_18CB2F000, v6, OS_LOG_TYPE_ERROR, "%s Unable to get local user availability: %{public}@", buf, 0x16u);
      }
    }
    v7 = [INFocusStatus alloc];
    v8 = [NSNumber numberWithInt:v4 ^ 1u];
    v9 = [(INFocusStatus *)v7 initWithIsFocused:v8];
  }
  else
  {
    v10 = [INFocusStatus alloc];
    v9 = [(INFocusStatus *)v10 initWithIsFocused:MEMORY[0x1E4F1CC28]];
  }

  return v9;
}

- (INFocusStatusCenter)init
{
  v11.receiver = self;
  v11.super_class = (Class)INFocusStatusCenter;
  v2 = [(INFocusStatusCenter *)&v11 init];
  if (v2)
  {
    int v3 = [MEMORY[0x1E4F28B50] mainBundle];
    int v4 = [v3 bundleIdentifier];

    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    id v5 = (void *)getDNDAvailabilityServiceClass_softClass;
    uint64_t v16 = getDNDAvailabilityServiceClass_softClass;
    if (!getDNDAvailabilityServiceClass_softClass)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getDNDAvailabilityServiceClass_block_invoke;
      v12[3] = &unk_1E5520EB8;
      v12[4] = &v13;
      __getDNDAvailabilityServiceClass_block_invoke((uint64_t)v12);
      id v5 = (void *)v14[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v13, 8);
    uint64_t v7 = [v6 serviceForClientIdentifier:v4];
    service = v2->_service;
    v2->_service = (DNDAvailabilityService *)v7;

    v9 = v2;
  }

  return v2;
}

+ (INFocusStatusCenter)defaultCenter
{
  if (defaultCenter_onceToken != -1) {
    dispatch_once(&defaultCenter_onceToken, &__block_literal_global_60681);
  }
  v2 = (void *)defaultCenter_defaultCenter;

  return (INFocusStatusCenter *)v2;
}

uint64_t __36__INFocusStatusCenter_defaultCenter__block_invoke()
{
  v0 = objc_alloc_init(INFocusStatusCenter);
  uint64_t v1 = defaultCenter_defaultCenter;
  defaultCenter_defaultCenter = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end