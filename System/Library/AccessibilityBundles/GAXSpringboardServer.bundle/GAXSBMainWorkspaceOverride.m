@interface GAXSBMainWorkspaceOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_canExecuteTransitionRequest:(id)a3 forExecution:(BOOL)a4;
- (void)_handleUserActionRequest:(id)a3 options:(id)a4 activationSettings:(id)a5 origin:(id)a6 withResult:(id)a7;
- (void)presentPowerDownTransientOverlay;
- (void)systemService:(id)a3 handleOpenApplicationRequest:(id)a4 withCompletion:(id)a5;
@end

@implementation GAXSBMainWorkspaceOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBMainWorkspace";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainWorkspace", @"systemService: handleOpenApplicationRequest: withCompletion:", "v", "@", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainWorkspace", @"_handleUserActionRequest: options: activationSettings: origin: withResult:", "v", "@", "@", "@", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainWorkspace", @"_canExecuteTransitionRequest:forExecution:", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainWorkspace", @"presentPowerDownTransientOverlay", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainWorkspaceTransitionRequest", @"source", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWorkspaceTransitionRequest", @"transientOverlayContext", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWorkspaceTransientOverlayTransitionContext", @"transientOverlay", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWorkspaceTransientOverlay", @"viewController", "@", 0);
}

- (void)systemService:(id)a3 handleOpenApplicationRequest:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v11 = +[GAXSpringboard sharedInstance];
  if (![v11 isActive]) {
    goto LABEL_6;
  }
  v12 = GAXAllowedRemoteUIProcesses();
  v13 = [v9 bundleIdentifier];
  unsigned __int8 v14 = [v12 containsObject:v13];

  if (v14) {
    goto LABEL_6;
  }
  v15 = [v11 frontmostAppIdentifier];
  v16 = [v9 bundleIdentifier];
  if ([v15 isEqualToString:v16])
  {

LABEL_6:
    v24.receiver = self;
    v24.super_class = (Class)GAXSBMainWorkspaceOverride;
    [(GAXSBMainWorkspaceOverride *)&v24 systemService:v8 handleOpenApplicationRequest:v9 withCompletion:v10];
    goto LABEL_7;
  }
  v17 = [v9 bundleIdentifier];
  unsigned __int8 v18 = [v11 isBundleIDAllowedApp:v17];

  if (v18) {
    goto LABEL_6;
  }
  v19 = GAXLogCommon();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = [v9 bundleIdentifier];
    *(_DWORD *)buf = 138543362;
    v28 = v20;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Guided Access blocking workspace open app request: %{public}@", buf, 0xCu);
  }
  if (v10)
  {
    uint64_t v21 = FBSOpenApplicationErrorDomain;
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    CFStringRef v26 = @"Guided Access active";
    v22 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v23 = +[NSError errorWithDomain:v21 code:1 userInfo:v22];

    v10[2](v10, v23);
  }
LABEL_7:
}

- (void)_handleUserActionRequest:(id)a3 options:(id)a4 activationSettings:(id)a5 origin:(id)a6 withResult:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void *))a7;
  v17 = +[GAXSpringboard sharedInstance];
  buf[0] = 0;
  objc_opt_class();
  unsigned __int8 v18 = [v13 objectForKey:FBSOpenApplicationOptionKeyPayloadURL];
  v19 = __UIAccessibilityCastAsClass();

  if (![v17 isActive]) {
    goto LABEL_10;
  }
  unsigned int v20 = GAXURLSchemeIsPhoneRelated(v19);
  char v21 = v20;
  if (v20)
  {
    v28 = [v17 frontmostAppIdentifier];
    if (GAXAppIsMobilePhoneOrFacetime(v28)) {
      goto LABEL_6;
    }
  }
  v22 = [v17 frontmostAppIdentifier];
  if ([v22 isEqualToString:v12])
  {

    if ((v21 & 1) == 0)
    {
LABEL_10:
      v29.receiver = self;
      v29.super_class = (Class)GAXSBMainWorkspaceOverride;
      [(GAXSBMainWorkspaceOverride *)&v29 _handleUserActionRequest:v12 options:v13 activationSettings:v14 origin:v15 withResult:v16];
      goto LABEL_11;
    }
LABEL_6:

    goto LABEL_10;
  }
  unsigned __int8 v27 = [v17 isBundleIDAllowedApp:v12];

  if (v21) {
  if (v27)
  }
    goto LABEL_10;
  v23 = GAXLogCommon();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v33 = v19;
    __int16 v34 = 2114;
    id v35 = v12;
    _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Guided Access blocking workspace open URL request: %{public}@ app: %{public}@", buf, 0x16u);
  }

  if (v16)
  {
    uint64_t v24 = FBSOpenApplicationErrorDomain;
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    CFStringRef v31 = @"Guided Access active";
    NSErrorUserInfoKey v25 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    CFStringRef v26 = +[NSError errorWithDomain:v24 code:1 userInfo:v25];

    v16[2](v16, v26);
  }
LABEL_11:
}

- (BOOL)_canExecuteTransitionRequest:(id)a3 forExecution:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = +[GAXSpringboard sharedInstance];
  v13.receiver = self;
  v13.super_class = (Class)GAXSBMainWorkspaceOverride;
  LODWORD(self) = [(GAXSBMainWorkspaceOverride *)&v13 _canExecuteTransitionRequest:v5 forExecution:v4];
  id v8 = (char *)[v5 safeIntegerForKey:@"source"];
  id v9 = [v5 safeValueForKeyPath:@"transientOverlayContext.transientOverlay.viewController"];

  AXSafeClassFromString();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (self)
  {
    if ((isKindOfClass & 1) != 0
      || (LOBYTE(self) = 1, (unint64_t)(v8 - 11) <= 0x38)
      && ((1 << (v8 - 11)) & 0x100000000000011) != 0)
    {
      if ([v6 isActive])
      {
        GAXLogCommon();
        self = (GAXSBMainWorkspaceOverride *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)self, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v12 = 0;
          _os_log_impl(&dword_0, (os_log_t)self, OS_LOG_TYPE_DEFAULT, "Guided Access active. Disallowing transition request.", v12, 2u);
        }

        LOBYTE(self) = 0;
      }
      else
      {
        LOBYTE(self) = 1;
      }
    }
  }

  return (char)self;
}

- (void)presentPowerDownTransientOverlay
{
  id v3 = +[GAXSpringboard sharedInstance];
  if ([v3 isActive])
  {
    BOOL v4 = GAXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v5 = "Guided Access active. Disallowing slide-to-power-down";
LABEL_7:
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
    }
  }
  else
  {
    if (![v3 wantsSingleAppModeOrAppSelfLockMode])
    {
      v6.receiver = self;
      v6.super_class = (Class)GAXSBMainWorkspaceOverride;
      [(GAXSBMainWorkspaceOverride *)&v6 presentPowerDownTransientOverlay];
      goto LABEL_10;
    }
    BOOL v4 = GAXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v5 = "Device wants Single App Mode / App self-lock mode. Disallowing slide-to-power-down";
      goto LABEL_7;
    }
  }

LABEL_10:
}

@end