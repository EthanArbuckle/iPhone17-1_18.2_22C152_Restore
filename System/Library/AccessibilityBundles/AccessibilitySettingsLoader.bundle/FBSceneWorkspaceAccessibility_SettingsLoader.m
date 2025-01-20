@interface FBSceneWorkspaceAccessibility_SettingsLoader
+ (Class)safeCategoryBaseClass;
+ (id)_accessibilityCachedWorkspaces;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (FBSceneWorkspaceAccessibility_SettingsLoader)initWithIdentifier:(id)a3;
- (void)invalidate;
@end

@implementation FBSceneWorkspaceAccessibility_SettingsLoader

+ (id)safeCategoryTargetClassName
{
  return @"FBSceneWorkspace";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FBSceneWorkspace", @"initWithIdentifier:", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FBSceneWorkspace", @"invalidate", "v", 0);
}

- (FBSceneWorkspaceAccessibility_SettingsLoader)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBSceneWorkspaceAccessibility_SettingsLoader;
  v5 = [(FBSceneWorkspaceAccessibility_SettingsLoader *)&v8 initWithIdentifier:v4];
  if (initWithIdentifier__onceToken != -1) {
    dispatch_once(&initWithIdentifier__onceToken, &__block_literal_global_4);
  }
  [(id)AXWorkspaces setObject:v5 forKeyedSubscript:v4];
  v6 = AXLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(FBSceneWorkspaceAccessibility_SettingsLoader *)(uint64_t)v4 initWithIdentifier:v6];
  }

  return v5;
}

+ (id)_accessibilityCachedWorkspaces
{
  return (id)AXWorkspaces;
}

- (void)invalidate
{
  v5.receiver = self;
  v5.super_class = (Class)FBSceneWorkspaceAccessibility_SettingsLoader;
  [(FBSceneWorkspaceAccessibility_SettingsLoader *)&v5 invalidate];
  id v3 = (void *)AXWorkspaces;
  id v4 = [(FBSceneWorkspaceAccessibility_SettingsLoader *)self safeStringForKey:@"_identifier"];
  [v3 setObject:0 forKeyedSubscript:v4];
}

- (void)initWithIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_24016D000, log, OS_LOG_TYPE_DEBUG, "Monitoring workspace: %@ %@", (uint8_t *)&v3, 0x16u);
}

@end