@interface SBAppToAppWorkspaceTransactionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_setupAnimation;
@end

@implementation SBAppToAppWorkspaceTransactionAccessibility

void __62__SBAppToAppWorkspaceTransactionAccessibility__setupAnimation__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 safeValueForKey:@"application"];
  [v2 addObject:v3];
}

- (id)_setupAnimation
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v37.receiver = self;
  v37.super_class = (Class)SBAppToAppWorkspaceTransactionAccessibility;
  id v27 = [(SBAppToAppWorkspaceTransactionAccessibility *)&v37 _setupAnimation];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  char v36 = 0;
  objc_opt_class();
  v4 = [(SBAppToAppWorkspaceTransactionAccessibility *)self safeValueForKey:@"toApplicationSceneEntities"];
  v5 = __UIAccessibilityCastAsClass();

  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __62__SBAppToAppWorkspaceTransactionAccessibility__setupAnimation__block_invoke;
  v34[3] = &unk_265153FD8;
  id v6 = v3;
  id v35 = v6;
  v26 = v5;
  [v5 enumerateObjectsUsingBlock:v34];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(SBAppToAppWorkspaceTransactionAccessibility *)self safeValueForKey:@"fromApplicationSceneEntities"];
  uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = @"SBApplicationSceneEntity";
    uint64_t v10 = *(void *)v31;
    v11 = @"application";
    v12 = @"SBApplication";
    do
    {
      uint64_t v13 = 0;
      uint64_t v28 = v8;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        char v36 = 0;
        v14 = __UIAccessibilitySafeClass();
        if (v36
          || (v15 = v14,
              char v36 = 0,
              [v14 safeValueForKey:v11],
              v16 = objc_claimAutoreleasedReturnValue(),
              __UIAccessibilitySafeClass(),
              v17 = objc_claimAutoreleasedReturnValue(),
              v16,
              v36))
        {
          abort();
        }
        if (([v6 containsObject:v17] & 1) == 0)
        {
          v18 = [v17 safeValueForKey:@"processState"];
          [v18 safeValueForKey:@"pid"];
          uint64_t v19 = v10;
          id v20 = v6;
          v21 = v12;
          v22 = v11;
          v24 = v23 = v9;

          [v24 intValue];
          AXTentativePidSuspend();

          v9 = v23;
          v11 = v22;
          v12 = v21;
          id v6 = v20;
          uint64_t v10 = v19;
          uint64_t v8 = v28;
        }

        ++v13;
      }
      while (v8 != v13);
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v8);
  }

  return v27;
}

+ (id)safeCategoryTargetClassName
{
  return @"SBAppToAppWorkspaceTransaction";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBToAppsWorkspaceTransaction", @"fromApplicationSceneEntities", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBToAppsWorkspaceTransaction", @"toApplicationSceneEntities", "@", 0);
  [v3 validateClass:@"SBAppToAppWorkspaceTransaction" isKindOfClass:@"SBToAppsWorkspaceTransaction"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationSceneEntity", @"application", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"processState", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationProcessState", @"pid", "i", 0);
}

@end