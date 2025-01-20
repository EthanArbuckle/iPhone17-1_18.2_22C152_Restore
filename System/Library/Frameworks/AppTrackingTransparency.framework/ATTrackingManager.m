@interface ATTrackingManager
+ (ATTrackingManagerAuthorizationStatus)trackingAuthorizationStatus;
+ (BOOL)_applicationHasDisqualifyingEntitlement;
+ (BOOL)_isCrossAppTrackingAllowed;
+ (BOOL)_restrictionProfileInstalled;
+ (BOOL)_userAllowedToChangeSettings;
+ (BOOL)applicationStateActive;
+ (BOOL)isApplicationExtension;
+ (id)_TCCServer;
+ (unint64_t)_performTCCPreflightRequest;
+ (unint64_t)_trackingAuthorizationStatus;
+ (void)_performTCCAccessRequest:(id)a3;
+ (void)_sendRequestTrackingAnalytic:(unint64_t)a3 prompted:(BOOL)a4 deniedReason:(unint64_t)a5;
+ (void)_sendTrackingStatusAnalytic:(unint64_t)a3 prompted:(BOOL)a4 deniedReason:(unint64_t)a5;
+ (void)requestTrackingAuthorizationWithCompletionHandler:(void *)completion;
@end

@implementation ATTrackingManager

void __60__ATTrackingManager__applicationHasDisqualifyingEntitlement__block_invoke()
{
  CFAllocatorRef Default = CFAllocatorGetDefault();
  v1 = SecTaskCreateFromSelf(Default);
  if (v1)
  {
    v2 = v1;
    CFBooleanRef v3 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v1, @"com.apple.security.on-demand-install-capable", 0);
    if (v3)
    {
      CFBooleanRef v4 = v3;
      _applicationHasDisqualifyingEntitlement_isDimSumApp = CFBooleanGetValue(v3) != 0;
      CFRelease(v4);
    }
    CFRelease(v2);
  }
}

+ (void)_sendRequestTrackingAnalytic:(unint64_t)a3 prompted:(BOOL)a4 deniedReason:(unint64_t)a5
{
  BOOL v6 = a4;
  id v11 = [MEMORY[0x263EFF9A0] dictionary];
  v8 = [NSNumber numberWithUnsignedInteger:a3];
  [v11 setValue:v8 forKey:@"result"];

  v9 = [NSNumber numberWithBool:v6];
  [v11 setValue:v9 forKey:@"userWasPrompted"];

  v10 = [NSNumber numberWithUnsignedInteger:a5];
  [v11 setValue:v10 forKey:@"reasonDenied"];

  AnalyticsSendEvent();
}

void __48__ATTrackingManager__performTCCPreflightRequest__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (!v5 || a3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = (id)objc_opt_class();
      id v6 = v8;
      _os_log_impl(&dword_2156BC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] Received error invoking TCC preflight request.", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = tcc_authorization_record_get_authorization_right();
  }
}

+ (ATTrackingManagerAuthorizationStatus)trackingAuthorizationStatus
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v3 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_2156BC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] trackingAuthorizationStatus API call invoked.", (uint8_t *)&buf, 0xCu);
  }
  ++kRateLimitCounter;
  double Current = CFAbsoluteTimeGetCurrent();
  if (kRateLimitCounter >= 6
    && ((double v5 = Current - *(double *)&_lastTrackingAuthTimestamp, *(double *)&_lastTrackingAuthTimestamp != 0.0)
      ? (BOOL v6 = v5 < 1.0)
      : (BOOL v6 = 0),
        v6))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = objc_opt_class();
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      id v8 = v7;
      _os_log_impl(&dword_2156BC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] Call to trackingAuthorizationStatus eligible for rate limiting", (uint8_t *)&buf, 0xCu);
    }
    return _lastAuthorizationStatus;
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    id v10 = a1;
    objc_sync_enter(v10);
    uint64_t v11 = [v10 _trackingAuthorizationStatus];
    *(void *)(*((void *)&buf + 1) + 24) = v11;
    objc_sync_exit(v10);

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __48__ATTrackingManager_trackingAuthorizationStatus__block_invoke;
    v13[3] = &unk_264256390;
    v13[4] = &buf;
    v13[5] = v10;
    if (trackingAuthorizationStatus_onceToken != -1) {
      dispatch_once(&trackingAuthorizationStatus_onceToken, v13);
    }
    _lastTrackingAuthTimestamp = CFAbsoluteTimeGetCurrent();
    ATTrackingManagerAuthorizationStatus v9 = *(void *)(*((void *)&buf + 1) + 24);
    _lastAuthorizationStatus = v9;
    _Block_object_dispose(&buf, 8);
  }
  return v9;
}

+ (unint64_t)_trackingAuthorizationStatus
{
  id v2 = a1;
  objc_sync_enter(v2);
  int v3 = [v2 _restrictionProfileInstalled];
  if (((v3 | [v2 _userAllowedToChangeSettings] ^ 1) & 1) != 0
    || ([v2 _applicationHasDisqualifyingEntitlement] & 1) != 0)
  {
    unint64_t v4 = 1;
  }
  else
  {
    uint64_t v6 = [v2 _performTCCPreflightRequest];
    if (v6)
    {
      if (v6 == 2)
      {
        unint64_t v4 = 3;
      }
      else if (v6 == 1)
      {
        if ([v2 _isCrossAppTrackingAllowed]) {
          unint64_t v4 = 0;
        }
        else {
          unint64_t v4 = 2;
        }
      }
      else
      {
        unint64_t v4 = 0;
      }
    }
    else
    {
      unint64_t v4 = 2;
    }
  }
  objc_sync_exit(v2);

  return v4;
}

+ (BOOL)_applicationHasDisqualifyingEntitlement
{
  if (_applicationHasDisqualifyingEntitlement_once != -1) {
    dispatch_once(&_applicationHasDisqualifyingEntitlement_once, &__block_literal_global);
  }
  return _applicationHasDisqualifyingEntitlement_isDimSumApp;
}

+ (BOOL)_restrictionProfileInstalled
{
  id v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53940]];

  return v3;
}

+ (unint64_t)_performTCCPreflightRequest
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v3 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_2156BC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] Performing TCC Access Preflight Request.", (uint8_t *)&buf, 0xCu);
  }
  unint64_t v4 = [a1 _TCCServer];
  double v5 = tcc_service_singleton_for_CF_name();
  uint64_t v6 = (void *)tcc_message_options_create();
  tcc_message_options_set_reply_handler_policy();
  tcc_message_options_set_request_prompt_policy();
  int v7 = tcc_credential_singleton_for_self();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 1;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__ATTrackingManager__performTCCPreflightRequest__block_invoke;
  v11[3] = &unk_264256340;
  v11[4] = &buf;
  v11[5] = a1;
  id v8 = (void *)MEMORY[0x2166C1A10](v11);
  tcc_server_message_request_authorization();
  unint64_t v9 = *(void *)(*((void *)&buf + 1) + 24);

  _Block_object_dispose(&buf, 8);
  return v9;
}

+ (id)_TCCServer
{
  if (_TCCServer_onceToken != -1) {
    dispatch_once(&_TCCServer_onceToken, &__block_literal_global_30);
  }
  id v2 = (void *)_TCCServer_server;

  return v2;
}

+ (BOOL)_userAllowedToChangeSettings
{
  id v2 = [MEMORY[0x263F841B0] sharedManager];
  char v3 = [v2 isSharedIPad];

  if (v3) {
    return 0;
  }
  double v5 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v4 = [v5 effectiveBoolValueForSetting:*MEMORY[0x263F53920]] == 1;

  return v4;
}

+ (BOOL)_isCrossAppTrackingAllowed
{
  id v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F53940]] != 1;

  return v3;
}

uint64_t __48__ATTrackingManager_trackingAuthorizationStatus__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) _sendRequestTrackingAnalytic:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) prompted:0 deniedReason:0];
}

uint64_t __31__ATTrackingManager__TCCServer__block_invoke()
{
  _TCCServer_server = tcc_server_create();

  return MEMORY[0x270F9A758]();
}

+ (void)_sendTrackingStatusAnalytic:(unint64_t)a3 prompted:(BOOL)a4 deniedReason:(unint64_t)a5
{
  BOOL v6 = a4;
  id v11 = [MEMORY[0x263EFF9A0] dictionary];
  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  [v11 setValue:v8 forKey:@"result"];

  unint64_t v9 = [NSNumber numberWithBool:v6];
  [v11 setValue:v9 forKey:@"userWasPrompted"];

  id v10 = [NSNumber numberWithUnsignedInteger:a5];
  [v11 setValue:v10 forKey:@"reasonDenied"];

  AnalyticsSendEvent();
}

+ (void)_performTCCAccessRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v16 = (id)objc_opt_class();
    id v5 = v16;
    _os_log_impl(&dword_2156BC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] Performing TCC Access Request.", buf, 0xCu);
  }
  BOOL v6 = [a1 _TCCServer];
  int v7 = tcc_service_singleton_for_CF_name();
  id v8 = (void *)tcc_message_options_create();
  tcc_message_options_set_reply_handler_policy();
  tcc_message_options_set_request_prompt_policy();
  unint64_t v9 = tcc_credential_singleton_for_self();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__ATTrackingManager__performTCCAccessRequest___block_invoke;
  v12[3] = &unk_264256368;
  id v13 = v4;
  id v14 = a1;
  id v10 = v4;
  id v11 = (void *)MEMORY[0x2166C1A10](v12);
  tcc_server_message_request_authorization();
}

void __46__ATTrackingManager__performTCCAccessRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (!v5 || a3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = (id)objc_opt_class();
      id v7 = v9;
      _os_log_impl(&dword_2156BC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] Received error invoking TCC access request.", (uint8_t *)&v8, 0xCu);
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1);
  }
  else
  {
    uint64_t authorization_right = tcc_authorization_record_get_authorization_right();
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), authorization_right);
  }
}

+ (BOOL)applicationStateActive
{
  if (applicationStateActive_once != -1) {
    dispatch_once(&applicationStateActive_once, &__block_literal_global_33);
  }
  BOOL result = applicationStateActive_application;
  if (applicationStateActive_application) {
    return [(id)applicationStateActive_application performSelector:applicationStateActive_applicationStateSelector] == 0;
  }
  return result;
}

void __43__ATTrackingManager_applicationStateActive__block_invoke()
{
  Class v0 = NSClassFromString(&cfstr_Uiapplication.isa);
  SEL v1 = NSSelectorFromString(&cfstr_Sharedapplicat.isa);
  applicationStateActive_applicationStateSelector = (uint64_t)NSSelectorFromString(&cfstr_Applicationsta.isa);
  if (objc_opt_respondsToSelector())
  {
    id obj = [(objc_class *)v0 performSelector:v1];
    if (objc_opt_respondsToSelector()) {
      objc_storeStrong((id *)&applicationStateActive_application, obj);
    }
  }
}

+ (BOOL)isApplicationExtension
{
  id v2 = [MEMORY[0x263F086E0] mainBundle];
  BOOL v3 = [v2 bundlePath];
  char v4 = [v3 hasSuffix:@".appex"];

  return v4;
}

+ (void)requestTrackingAuthorizationWithCompletionHandler:(void *)completion
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  char v4 = completion;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v20 = (id)objc_opt_class();
    id v5 = v20;
    _os_log_impl(&dword_2156BC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] requestTrackingAuthorizationWithCompletionHandler API call invoked.", buf, 0xCu);
  }
  if (v4)
  {
    ++requestRateLimitCounter;
    double Current = CFAbsoluteTimeGetCurrent();
    if (requestRateLimitCounter >= 6
      && ((double Current = Current - *(double *)&_lastRequestTrackingAuthTimestamp,
           *(double *)&_lastRequestTrackingAuthTimestamp != 0.0)
        ? (BOOL v7 = Current < 1.0)
        : (BOOL v7 = 0),
          v7))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = objc_opt_class();
        *(_DWORD *)long long buf = 138412290;
        id v20 = v8;
        id v9 = v8;
        _os_log_impl(&dword_2156BC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] Call to requestTrackingAuthorizationWithCompletionHandler eligible for rate limiting", buf, 0xCu);
      }
      v4[2](v4, _lastAuthorizationStatus);
    }
    else
    {
      int v10 = objc_msgSend(a1, "_restrictionProfileInstalled", Current);
      char v11 = [a1 _userAllowedToChangeSettings];
      if (v10)
      {
        [a1 _sendRequestTrackingAnalytic:1 prompted:0 deniedReason:2];
        _lastRequestTrackingAuthTimestamp = CFAbsoluteTimeGetCurrent();
        _lastAuthorizationStatus = 1;
        v4[2](v4, 1);
      }
      else if (v11)
      {
        if ([a1 _applicationHasDisqualifyingEntitlement])
        {
          [a1 _sendRequestTrackingAnalytic:1 prompted:0 deniedReason:4];
          _lastRequestTrackingAuthTimestamp = CFAbsoluteTimeGetCurrent();
          _lastAuthorizationStatus = 1;
          v4[2](v4, 1);
        }
        else
        {
          uint64_t v12 = [a1 _performTCCPreflightRequest];
          if (v12 == 2)
          {
            [a1 _sendRequestTrackingAnalytic:3 prompted:0 deniedReason:0];
            _lastRequestTrackingAuthTimestamp = CFAbsoluteTimeGetCurrent();
            _lastAuthorizationStatus = 3;
            v4[2](v4, 3);
          }
          else if (v12 == 1 && ([a1 _isCrossAppTrackingAllowed] & 1) != 0)
          {
            int v13 = [a1 applicationStateActive];
            if ((v13 ^ 1 | [a1 isApplicationExtension]))
            {
              id v14 = a1;
              objc_sync_enter(v14);
              uint64_t v15 = [v14 _trackingAuthorizationStatus];
              objc_sync_exit(v14);

              [v14 _sendRequestTrackingAnalytic:v15 prompted:0 deniedReason:0];
              _lastRequestTrackingAuthTimestamp = CFAbsoluteTimeGetCurrent();
              _lastAuthorizationStatus = v15;
              v4[2](v4, v15);
            }
            else
            {
              v16[0] = MEMORY[0x263EF8330];
              v16[1] = 3221225472;
              v16[2] = __71__ATTrackingManager_requestTrackingAuthorizationWithCompletionHandler___block_invoke;
              v16[3] = &unk_2642563B8;
              id v18 = a1;
              uint64_t v17 = v4;
              [a1 _performTCCAccessRequest:v16];
            }
          }
          else
          {
            [a1 _sendRequestTrackingAnalytic:2 prompted:0 deniedReason:1];
            _lastRequestTrackingAuthTimestamp = CFAbsoluteTimeGetCurrent();
            _lastAuthorizationStatus = 2;
            v4[2](v4, 2);
          }
        }
      }
      else
      {
        [a1 _sendRequestTrackingAnalytic:1 prompted:0 deniedReason:3];
        _lastRequestTrackingAuthTimestamp = CFAbsoluteTimeGetCurrent();
        _lastAuthorizationStatus = 1;
        v4[2](v4, 1);
      }
    }
  }
}

uint64_t __71__ATTrackingManager_requestTrackingAuthorizationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      [*(id *)(a1 + 40) _sendRequestTrackingAnalytic:3 prompted:1 deniedReason:0];
      _lastRequestTrackingAuthTimestamp = CFAbsoluteTimeGetCurrent();
      _lastAuthorizationStatus = 3;
    }
    else
    {
      [*(id *)(a1 + 40) _sendRequestTrackingAnalytic:0 prompted:1 deniedReason:0];
      _lastRequestTrackingAuthTimestamp = CFAbsoluteTimeGetCurrent();
      _lastAuthorizationStatus = 0;
    }
    BOOL v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    [*(id *)(a1 + 40) _sendRequestTrackingAnalytic:2 prompted:1 deniedReason:1];
    _lastRequestTrackingAuthTimestamp = CFAbsoluteTimeGetCurrent();
    _lastAuthorizationStatus = 2;
    BOOL v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  }

  return v3();
}

@end