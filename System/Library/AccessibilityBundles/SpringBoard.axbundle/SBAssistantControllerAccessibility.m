@interface SBAssistantControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 factory:(id)a4 dismissalOptions:(id)a5 completion:(id)a6;
@end

@implementation SBAssistantControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBAssistantController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 factory:(id)a4 dismissalOptions:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v22 = a4;
  id v8 = a5;
  id v9 = a6;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v10 = [MEMORY[0x263F3F460] sharedInstance];
  v11 = [v10 allProcesses];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    uint64_t v15 = *MEMORY[0x263F21348];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v18 = [v17 bundleIdentifier];
        int v19 = [v18 isEqualToString:v15];

        if (v19)
        {
          [v17 pid];
          AXProcessIsCarPlay();
          AXTentativePidSuspend();
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  v23.receiver = self;
  v23.super_class = (Class)SBAssistantControllerAccessibility;
  [(SBAssistantControllerAccessibility *)&v23 _dismissAssistantViewIfNecessaryWithAnimation:a3 factory:v22 dismissalOptions:v8 completion:v9];
}

@end