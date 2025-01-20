@interface AXRemoteElementAccessibility__PosterKit__AXRuntime
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldHitTestRemoteElementProcess;
- (BOOL)_axIsKindOfClass:(id)a3 fromArray:(id)a4;
@end

@implementation AXRemoteElementAccessibility__PosterKit__AXRuntime

+ (id)safeCategoryTargetClassName
{
  return @"AXRemoteElement";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PREditingSceneViewController"];
  if (NSClassFromString(&cfstr_Pruisambientpo.isa)) {
    [v3 validateClass:@"PRUISAmbientPosterViewController"];
  }
}

- (BOOL)_accessibilityShouldHitTestRemoteElementProcess
{
  if (_accessibilityShouldHitTestRemoteElementProcess_onceToken != -1) {
    dispatch_once(&_accessibilityShouldHitTestRemoteElementProcess_onceToken, &__block_literal_global_0);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __101__AXRemoteElementAccessibility__PosterKit__AXRuntime__accessibilityShouldHitTestRemoteElementProcess__block_invoke_2;
  v6[3] = &unk_265146040;
  v6[4] = self;
  id v3 = [(AXRemoteElementAccessibility__PosterKit__AXRuntime *)self _accessibilityFindAncestor:v6 startWithSelf:0];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_axIsKindOfClass:(id)a3 fromArray:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

@end