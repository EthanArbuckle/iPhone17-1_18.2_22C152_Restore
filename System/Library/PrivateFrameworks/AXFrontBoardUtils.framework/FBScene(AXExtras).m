@interface FBScene(AXExtras)
- (BOOL)accessibilityIsSceneOnUnknownScreen;
- (BOOL)accessibilitySceneBelongsToTheSystemApp;
- (BOOL)accessibilitySceneIsCallServiceBanner;
- (BOOL)accessibilitySceneIsDeactivatedBySidebar;
- (BOOL)accessibilitySceneIsDeactivatedBySwitcher;
- (BOOL)accessibilitySceneIsDismissedInCallService;
- (BOOL)accessibilitySceneIsDismissedSearchScreen;
- (BOOL)accessibilitySceneIsForegroundVisible;
- (BOOL)accessibilitySceneIsSuspended;
- (double)accessibilitySceneFrame;
- (double)accessibilitySceneLevel;
- (id)accessibilitySceneDescription;
- (id)accessibilityScenePID;
- (id)accessibilitySceneProcess;
- (uint64_t)accessibilityIsSceneOccluded;
- (uint64_t)accessibilityIsSceneOnCarScreen;
- (uint64_t)accessibilityIsSceneOnExternalScreen;
- (uint64_t)accessibilityIsSceneOnMainScreen;
- (uint64_t)accessibilitySceneIdentifier;
- (uint64_t)accessibilitySceneIsRunningInForeground;
- (uint64_t)accessibilitySceneOwnerIsAUIApplication;
@end

@implementation FBScene(AXExtras)

- (id)accessibilitySceneDescription
{
  v2 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"FBScene (AX) <%p>\n", a1);
  v3 = [a1 accessibilitySceneIdentifier];
  [v2 appendFormat:@"  Scene ID: %@\n", v3];

  v4 = [a1 accessibilityScenePID];
  [v2 appendFormat:@"  Scene Process (pid): %@\n", v4];

  [a1 accessibilitySceneFrame];
  v5 = NSStringFromRect(v15);
  [v2 appendFormat:@"  Scene Frame: %@\n", v5];

  v6 = NSNumber;
  [a1 accessibilitySceneLevel];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  [v2 appendFormat:@"  Scene Level: %@\n", v7];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "accessibilityIsSceneOccluded"));
  [v2 appendFormat:@"  Scene is Occluded: %@\n", v8];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "accessibilitySceneBelongsToTheSystemApp"));
  [v2 appendFormat:@"  Belongs to system app: %@\n", v9];

  v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "accessibilitySceneOwnerIsAUIApplication"));
  [v2 appendFormat:@"  Is a UIApplication: %@\n", v10];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "accessibilitySceneIsForegroundVisible"));
  [v2 appendFormat:@"  Is foreground visible: %@\n", v11];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "accessibilitySceneIsRunningInForeground"));
  [v2 appendFormat:@"  Is foreground running: %@\n", v12];

  return v2;
}

- (uint64_t)accessibilityIsSceneOnMainScreen
{
  v1 = [a1 settings];
  v2 = [v1 displayIdentity];
  uint64_t v3 = [v2 isMainDisplay];

  return v3;
}

- (uint64_t)accessibilityIsSceneOnExternalScreen
{
  v1 = [a1 settings];
  v2 = [v1 displayIdentity];
  uint64_t v3 = [v2 isExternal];

  return v3;
}

- (uint64_t)accessibilityIsSceneOnCarScreen
{
  v1 = [a1 settings];
  v2 = [v1 displayIdentity];
  uint64_t v3 = [v2 isCarDisplay];

  return v3;
}

- (BOOL)accessibilityIsSceneOnUnknownScreen
{
  v1 = [a1 settings];
  v2 = [v1 displayIdentity];
  BOOL v3 = [v2 type] == 7;

  return v3;
}

- (BOOL)accessibilitySceneBelongsToTheSystemApp
{
  v2 = AXFrontBoardSystemAppProcess();
  BOOL v3 = [a1 accessibilitySceneProcess];
  BOOL v4 = v2 == v3;

  return v4;
}

- (BOOL)accessibilitySceneIsDismissedInCallService
{
  v2 = [a1 accessibilitySceneProcess];
  BOOL v3 = [v2 bundleIdentifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x263F22648]];

  if (!v4) {
    return 0;
  }
  objc_opt_class();
  v5 = [a1 settings];
  v6 = [v5 safeValueForKey:@"_legacyOtherSettings"];
  v7 = __UIAccessibilityCastAsClass();

  v8 = [v7 objectForSetting:3001];
  uint64_t v9 = [v8 integerValue];

  BOOL v10 = (unint64_t)(v9 - 4) < 0xFFFFFFFFFFFFFFFELL;
  return v10;
}

- (BOOL)accessibilitySceneIsCallServiceBanner
{
  v2 = [a1 accessibilitySceneProcess];
  BOOL v3 = [v2 bundleIdentifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x263F22648]];

  if (!v4) {
    return 0;
  }
  objc_opt_class();
  v5 = [a1 settings];
  v6 = [v5 safeValueForKey:@"_legacyOtherSettings"];
  v7 = __UIAccessibilityCastAsClass();

  v8 = [v7 objectForSetting:3001];
  BOOL v9 = [v8 integerValue] == 1;

  return v9;
}

- (BOOL)accessibilitySceneIsDismissedSearchScreen
{
  v2 = [a1 identifier];
  int v3 = [v2 containsString:@"searchScreen"];

  if (!v3) {
    return 0;
  }
  objc_opt_class();
  int v4 = [a1 settings];
  v5 = [v4 safeValueForKey:@"_legacyOtherSettings"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [v6 objectForSetting:1000];
  BOOL v8 = [v7 integerValue] == 0;

  return v8;
}

- (uint64_t)accessibilitySceneOwnerIsAUIApplication
{
  NSClassFromString(&cfstr_Fbapplicationp.isa);
  v2 = [a1 accessibilitySceneProcess];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)accessibilitySceneIsSuspended
{
  v1 = [a1 accessibilitySceneProcess];
  BOOL v2 = [v1 safeIntForKey:@"taskState"] == 3;

  return v2;
}

- (BOOL)accessibilitySceneIsForegroundVisible
{
  v1 = [a1 accessibilitySceneProcess];
  BOOL v2 = [v1 safeIntegerForKey:@"visibility"] == 2;

  return v2;
}

- (uint64_t)accessibilitySceneIsRunningInForeground
{
  v1 = [a1 accessibilitySceneProcess];
  uint64_t v2 = [v1 safeBoolForKey:@"isForeground"];

  return v2;
}

- (BOOL)accessibilitySceneIsDeactivatedBySidebar
{
  v1 = [a1 safeValueForKey:@"settings"];
  BOOL v2 = [v1 conformsToProtocol:&unk_26D835C38]
    && ([v1 deactivationReasons] & 0x80) != 0;

  return v2;
}

- (BOOL)accessibilitySceneIsDeactivatedBySwitcher
{
  v1 = [a1 safeValueForKey:@"settings"];
  BOOL v2 = [v1 conformsToProtocol:&unk_26D835C38]
    && ([v1 deactivationReasons] & 8) != 0;

  return v2;
}

- (uint64_t)accessibilitySceneIdentifier
{
  return [a1 safeValueForKey:@"identifier"];
}

- (id)accessibilityScenePID
{
  v1 = [a1 accessibilitySceneProcess];
  uint64_t v2 = [v1 pid];
  int v3 = [NSNumber numberWithInt:v2];

  return v3;
}

- (id)accessibilitySceneProcess
{
  uint64_t v2 = [a1 safeValueForKey:@"clientProcess"];
  int v3 = __UIAccessibilitySafeClass();

  if (!v3)
  {
    int v4 = [a1 safeValueForKey:@"clientHandle"];
    v5 = __UIAccessibilitySafeClass();

    int v3 = [v5 legacyProcess];
  }

  return v3;
}

- (double)accessibilitySceneFrame
{
  v1 = [a1 safeValueForKey:@"settings"];
  uint64_t v2 = [v1 safeValueForKey:@"frame"];
  [v2 CGRectValue];
  double v4 = v3;

  return v4;
}

- (double)accessibilitySceneLevel
{
  v1 = [a1 safeValueForKey:@"settings"];
  uint64_t v2 = [v1 safeValueForKey:@"level"];
  [v2 floatValue];
  double v4 = v3;

  return v4;
}

- (uint64_t)accessibilityIsSceneOccluded
{
  v1 = [a1 safeValueForKey:@"settings"];
  uint64_t v2 = [v1 safeValueForKey:@"isOccluded"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

@end