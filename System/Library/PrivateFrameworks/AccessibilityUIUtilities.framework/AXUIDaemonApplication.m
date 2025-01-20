@interface AXUIDaemonApplication
+ (BOOL)_isSystemUIService;
+ (BOOL)_isUIKitSystemProcess;
+ (BOOL)_suppressesTextEffectsWindow;
+ (BOOL)usesScenes;
+ (double)preferredWindowLevel;
+ (id)_systemUIServiceClientSettings;
+ (id)_systemUIServiceIdentifier;
- (BOOL)_shouldAllowKeyboardArbiter;
- (int64_t)_frontMostAppOrientation;
@end

@implementation AXUIDaemonApplication

+ (BOOL)usesScenes
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  v3 = [MEMORY[0x1E4F59088] sharedSystemShellSwitcher];
  char v4 = [v3 isClarityBoardEnabled];

  return v4;
}

+ (BOOL)_isUIKitSystemProcess
{
  return 1;
}

+ (BOOL)_suppressesTextEffectsWindow
{
  return 1;
}

+ (BOOL)_isSystemUIService
{
  return [a1 usesScenes] ^ 1;
}

+ (id)_systemUIServiceClientSettings
{
  v2 = [MEMORY[0x1E4FB19C8] settings];
  [(id)objc_opt_class() preferredWindowLevel];
  objc_msgSend(v2, "setPreferredLevel:");
  return v2;
}

+ (id)_systemUIServiceIdentifier
{
  if ([a1 usesScenes])
  {
    v2 = 0;
  }
  else
  {
    v3 = [MEMORY[0x1E4F28B50] mainBundle];
    v2 = [v3 bundleIdentifier];
  }
  return v2;
}

- (BOOL)_shouldAllowKeyboardArbiter
{
  return 0;
}

- (int64_t)_frontMostAppOrientation
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  int64_t v3 = [v2 safeIntegerForKey:@"_interfaceOrientation"];

  return v3;
}

+ (double)preferredWindowLevel
{
  return 0.0;
}

@end