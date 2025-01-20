@interface SBWindowSceneAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityTraversalWindows;
@end

@implementation SBWindowSceneAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBWindowScene";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityTraversalWindows
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  char v21 = 0;
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  v3 = [v2 _visibleWindows];
  id v16 = (id)[v3 mutableCopy];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = [(id)*MEMORY[0x263F1D020] _accessibilityAllWindowsOnlyVisibleWindows:1];
  v5 = [v4 reverseObjectEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = [v10 windowScene];
        v12 = [v11 _focusSystemSceneComponent];

        if ([v12 conformsToProtocol:&unk_26F7EDA38])
        {
          v13 = [v12 parentFocusEnvironment];
          v14 = [v2 _focusSystemSceneComponent];

          if (v13 == v14) {
            [v16 addObject:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v7);
  }

  return v16;
}

@end