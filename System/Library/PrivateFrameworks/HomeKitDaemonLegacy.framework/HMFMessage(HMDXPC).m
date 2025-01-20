@interface HMFMessage(HMDXPC)
+ (id)entitledMessageWithName:()HMDXPC identifier:messagePayload:;
+ (id)entitledMessageWithName:()HMDXPC messagePayload:;
+ (id)nonSPIEntitledMessageWithName:()HMDXPC messagePayload:;
- (id)clientIdentifier;
- (id)clientName;
- (id)companionAppBundleIdentifier;
- (id)proxyConnection;
- (id)sendPolicy;
- (uint64_t)entitlements;
- (uint64_t)homeManagerOptions;
- (uint64_t)isAuthorizedForHomeDataAccess;
- (uint64_t)isAuthorizedForLocationAccess;
- (uint64_t)isAuthorizedForMicrophoneAccess;
- (uint64_t)isBackground;
- (uint64_t)isEntitledForAPIAccess;
- (uint64_t)isEntitledForAssistantIdentifiers;
- (uint64_t)isEntitledForBackgroundMode;
- (uint64_t)isEntitledForHomeLocationAccess;
- (uint64_t)isEntitledForHomeLocationFeedbackAccess;
- (uint64_t)isEntitledForSPIAccess;
- (uint64_t)isEntitledForSecureAccess;
- (uint64_t)isEntitledForShortcutsAutomationAccess;
- (uint64_t)isEntitledForStateDump;
- (uint64_t)isEntitledToProvideAccessorySetupPayload;
- (uint64_t)isEntitledToProvideMatterSetupPayload;
- (uint64_t)requiresCameraClipsEntitlement;
- (uint64_t)requiresMatterSetupPayloadEntitlement;
- (uint64_t)requiresMultiUserSetupEntitlement;
- (uint64_t)requiresNoSPIEntitlement;
- (uint64_t)requiresPersonManagerEntitlement;
- (uint64_t)requiresSPIEntitlement;
- (uint64_t)requiresSetupPayloadEntitlement;
- (uint64_t)requiresWalletKeyEntitlement;
- (uint64_t)source;
- (uint64_t)sourcePid;
@end

@implementation HMFMessage(HMDXPC)

- (id)sendPolicy
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"sendPolicy"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)proxyConnection
{
  v1 = [a1 transport];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (uint64_t)requiresWalletKeyEntitlement
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"requiresWalletKeyEntitlement"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  uint64_t v5 = [v4 BOOLValue];
  return v5;
}

- (uint64_t)requiresSetupPayloadEntitlement
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"requiresSetupPayloadEntitlement"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  uint64_t v5 = [v4 BOOLValue];
  return v5;
}

- (uint64_t)requiresSPIEntitlement
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"requiresSPIEntitlement"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  uint64_t v5 = [v4 BOOLValue];
  return v5;
}

- (uint64_t)requiresPersonManagerEntitlement
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"requiresPersonManagerEntitlement"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  uint64_t v5 = [v4 BOOLValue];
  return v5;
}

- (uint64_t)requiresNoSPIEntitlement
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"requiresNoSPIEntitlement"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  uint64_t v5 = [v4 BOOLValue];
  return v5;
}

- (uint64_t)requiresMultiUserSetupEntitlement
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"requiresMultiUserSetupEntitlement"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  uint64_t v5 = [v4 BOOLValue];
  return v5;
}

- (uint64_t)requiresMatterSetupPayloadEntitlement
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"requiresMatterSetupPayloadEntitlement"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  uint64_t v5 = [v4 BOOLValue];
  return v5;
}

- (uint64_t)requiresCameraClipsEntitlement
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"requiresCameraClipsEntitlement"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  uint64_t v5 = [v4 BOOLValue];
  return v5;
}

- (uint64_t)isEntitledForSPIAccess
{
  if ([a1 isInternal]) {
    return 1;
  }
  id v3 = [a1 proxyConnection];
  uint64_t v4 = [v3 isEntitledForSPIAccess];

  return v4;
}

- (uint64_t)isBackground
{
  v1 = [a1 proxyConnection];
  v2 = [v1 processInfo];
  uint64_t v3 = [v2 isBackgrounded];

  return v3;
}

- (uint64_t)homeManagerOptions
{
  v1 = [a1 proxyConnection];
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 homeManagerOptions];
  }
  else {
    uint64_t v3 = -1;
  }

  return v3;
}

- (uint64_t)isEntitledForAssistantIdentifiers
{
  v1 = [a1 proxyConnection];
  uint64_t v2 = [v1 isEntitledForAssistantIdentifiers];

  return v2;
}

- (id)clientName
{
  v1 = [a1 proxyConnection];
  uint64_t v2 = [v1 name];

  return v2;
}

- (uint64_t)isAuthorizedForLocationAccess
{
  v1 = [a1 proxyConnection];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 isAuthorizedForLocationAccess];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)isEntitledForHomeLocationAccess
{
  v1 = [a1 proxyConnection];
  uint64_t v2 = [v1 isEntitledForHomeLocationAccess];

  return v2;
}

- (id)companionAppBundleIdentifier
{
  v1 = [a1 proxyConnection];
  uint64_t v2 = [v1 companionAppBundleIdentifier];

  return v2;
}

- (uint64_t)source
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  if (v3 && ![v3 type])
  {
    uint64_t v6 = 8;
  }
  else
  {
    uint64_t v4 = [v1 numberForKey:@"sourceType"];
    uint64_t v5 = v4;
    if (v4)
    {
      uint64_t v6 = (int)[v4 intValue];
    }
    else if ([v1 isEntitledForSPIAccess])
    {
      v7 = [v1 proxyConnection];
      v8 = [v7 clientIdentifier];
      if (HMDIsSiriClientIdentifier(v8)) {
        uint64_t v6 = 1;
      }
      else {
        uint64_t v6 = 5;
      }
    }
    else
    {
      uint64_t v6 = 6;
    }
  }
  return v6;
}

- (id)clientIdentifier
{
  id v1 = [a1 proxyConnection];
  uint64_t v2 = [v1 clientIdentifier];

  return v2;
}

- (uint64_t)sourcePid
{
  id v1 = [a1 proxyConnection];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 clientPid];
  }
  else {
    uint64_t v3 = 0xFFFFFFFFLL;
  }

  return v3;
}

- (uint64_t)isEntitledForHomeLocationFeedbackAccess
{
  id v1 = [a1 proxyConnection];
  uint64_t v2 = [v1 isEntitledForHomeLocationFeedbackAccess];

  return v2;
}

- (uint64_t)isEntitledForStateDump
{
  id v1 = [a1 proxyConnection];
  uint64_t v2 = [v1 isEntitledForStateDump];

  return v2;
}

- (uint64_t)isEntitledForSecureAccess
{
  id v1 = [a1 proxyConnection];
  uint64_t v2 = [v1 isEntitledForSecureAccess];

  return v2;
}

- (uint64_t)isEntitledForShortcutsAutomationAccess
{
  id v1 = [a1 proxyConnection];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 isEntitledForShortcutsAutomationAccess];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)isEntitledToProvideMatterSetupPayload
{
  id v1 = [a1 proxyConnection];
  uint64_t v2 = [v1 isEntitledToProvideMatterSetupPayload];

  return v2;
}

- (uint64_t)isEntitledToProvideAccessorySetupPayload
{
  id v1 = [a1 proxyConnection];
  uint64_t v2 = [v1 isEntitledToProvideAccessorySetupPayload];

  return v2;
}

- (uint64_t)isEntitledForBackgroundMode
{
  id v1 = [a1 proxyConnection];
  uint64_t v2 = [v1 isEntitledForBackgroundMode];

  return v2;
}

- (uint64_t)isAuthorizedForMicrophoneAccess
{
  id v1 = [a1 proxyConnection];
  uint64_t v2 = [v1 isAuthorizedForMicrophoneAccess];

  return v2;
}

- (uint64_t)isAuthorizedForHomeDataAccess
{
  if ([a1 isInternal] & 1) != 0 || (objc_msgSend(a1, "isRemote")) {
    return 1;
  }
  uint64_t v3 = [a1 proxyConnection];
  uint64_t v4 = [v3 isAuthorizedForHomeDataAccess];

  return v4;
}

- (uint64_t)isEntitledForAPIAccess
{
  if ([a1 isInternal] & 1) != 0 || (objc_msgSend(a1, "isRemote")) {
    return 1;
  }
  uint64_t v3 = [a1 proxyConnection];
  uint64_t v4 = [v3 isEntitledForAPIAccess];

  return v4;
}

- (uint64_t)entitlements
{
  id v1 = [a1 proxyConnection];
  uint64_t v2 = [v1 entitlements];

  return v2;
}

+ (id)nonSPIEntitledMessageWithName:()HMDXPC messagePayload:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v14 = @"requiresNoSPIEntitlement";
  v15[0] = MEMORY[0x1E4F1CC38];
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v10 = [a1 alloc];
  v11 = [MEMORY[0x1E4F65488] allMessageDestinations];
  v12 = (void *)[v10 initWithName:v8 qualityOfService:-1 destination:v11 userInfo:v9 headers:0 payload:v7];

  return v12;
}

+ (id)entitledMessageWithName:()HMDXPC identifier:messagePayload:
{
  id v8 = a4;
  v9 = [a1 entitledMessageWithName:a3 messagePayload:a5];
  [v9 setIdentifier:v8];

  return v9;
}

+ (id)entitledMessageWithName:()HMDXPC messagePayload:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v14 = @"requiresSPIEntitlement";
  v15[0] = MEMORY[0x1E4F1CC38];
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v10 = [a1 alloc];
  v11 = [MEMORY[0x1E4F65488] allMessageDestinations];
  v12 = (void *)[v10 initWithName:v8 qualityOfService:-1 destination:v11 userInfo:v9 headers:0 payload:v7];

  return v12;
}

@end