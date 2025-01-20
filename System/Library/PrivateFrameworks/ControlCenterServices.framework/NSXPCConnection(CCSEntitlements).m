@interface NSXPCConnection(CCSEntitlements)
- (uint64_t)ccs_hasEntitlementForForciblyEnablingModules;
- (uint64_t)ccs_hasEntitlementForHandlingControlCenterOperation;
- (uint64_t)ccs_hasEntitlementForListingModuleIdentifiers;
- (uint64_t)ccs_hasEntitlementForModuleIdentifier:()CCSEntitlements;
- (uint64_t)ccs_hasEntitlementToResetToDefaultLayout;
@end

@implementation NSXPCConnection(CCSEntitlements)

- (uint64_t)ccs_hasEntitlementForModuleIdentifier:()CCSEntitlements
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F29BE0];
  v6 = [a1 _xpcConnection];
  v7 = [v5 tokenFromXPCConnection:v6];

  v8 = [v7 valueForEntitlement:@"com.apple.private.controlcenter.service.moduleidentifiers"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13[0] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];

    v8 = (void *)v9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v8 containsObject:v4])
  {
    uint64_t v10 = 1;
  }
  else
  {
    v11 = [v7 valueForEntitlement:@"application-identifier"];
    if (([v11 isEqual:@"com.apple.control-center.controlcentertool"] & 1) != 0
      || ([v11 isEqual:@"com.apple.internal.suiautomation"] & 1) != 0)
    {
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v10 = [v11 isEqual:@"com.apple.springboard"];
    }
  }
  return v10;
}

- (uint64_t)ccs_hasEntitlementForListingModuleIdentifiers
{
  v1 = (void *)MEMORY[0x263F29BE0];
  v2 = [a1 _xpcConnection];
  v3 = [v1 tokenFromXPCConnection:v2];

  id v4 = [v3 valueForEntitlement:@"application-identifier"];
  uint64_t v5 = [v4 isEqual:@"com.apple.control-center.controlcentertool"];

  return v5;
}

- (uint64_t)ccs_hasEntitlementForForciblyEnablingModules
{
  v1 = (void *)MEMORY[0x263F29BE0];
  v2 = [a1 _xpcConnection];
  v3 = [v1 tokenFromXPCConnection:v2];

  id v4 = [v3 valueForEntitlement:@"application-identifier"];
  if (([v4 isEqual:@"com.apple.control-center.controlcentertool"] & 1) != 0
    || ([v4 isEqual:@"com.apple.internal.suiautomation"] & 1) != 0
    || ([v4 isEqual:@"com.apple.springboard"] & 1) != 0
    || ([v4 isEqual:@"com.apple.accessibility.AccessibilityUIServer"] & 1) != 0
    || ([v4 isEqual:@"com.apple.internal.suiuntool.SystemExperienceAutomationAngel"] & 1) != 0
    || ([v4 isEqual:@"com.apple.accessibility.heard"] & 1) != 0
    || ([v4 isEqual:@"com.apple.tvremoted"] & 1) != 0
    || ([v4 isEqual:@"com.apple.Music"] & 1) != 0
    || ([v4 isEqual:@"com.apple.amp.MusicUI.MusicUIEngagementExtension"] & 1) != 0
    || ([v4 isEqual:@"com.apple.Preferences"] & 1) != 0)
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = [v4 isEqual:@"com.apple.Health"];
  }

  return v5;
}

- (uint64_t)ccs_hasEntitlementForHandlingControlCenterOperation
{
  v1 = (void *)MEMORY[0x263F29BE0];
  v2 = [a1 _xpcConnection];
  v3 = [v1 tokenFromXPCConnection:v2];

  id v4 = [v3 valueForEntitlement:@"application-identifier"];
  if (([v4 isEqual:@"com.apple.control-center.controlcentertool"] & 1) != 0
    || ([v4 isEqual:@"com.apple.internal.suiautomation"] & 1) != 0
    || ([v4 isEqual:@"com.apple.springboard"] & 1) != 0
    || ([v4 isEqual:@"com.apple.GameOverlayUI"] & 1) != 0)
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = [v4 isEqual:@"com.apple.WorkflowKit.BackgroundShortcutRunner"];
  }

  return v5;
}

- (uint64_t)ccs_hasEntitlementToResetToDefaultLayout
{
  v1 = (void *)MEMORY[0x263F29BE0];
  v2 = [a1 _xpcConnection];
  v3 = [v1 tokenFromXPCConnection:v2];

  id v4 = [v3 valueForEntitlement:@"application-identifier"];
  if ([v4 isEqual:@"com.apple.control-center.controlcentertool"]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = [v4 isEqual:@"com.apple.Preferences"];
  }

  return v5;
}

@end