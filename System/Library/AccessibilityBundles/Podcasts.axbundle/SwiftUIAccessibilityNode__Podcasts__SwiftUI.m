@interface SwiftUIAccessibilityNode__Podcasts__SwiftUI
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
@end

@implementation SwiftUIAccessibilityNode__Podcasts__SwiftUI

+ (id)safeCategoryTargetClassName
{
  return @"SwiftUI.AccessibilityNode";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __96__SwiftUIAccessibilityNode__Podcasts__SwiftUI__accessibilityHitTestShouldFallbackToNearestChild__block_invoke;
  v11 = &unk_2651443B0;
  v12 = self;
  v13 = &v14;
  AXPerformSafeBlock();
  id v3 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  if (v3)
  {
    char v4 = [v3 BOOLValue];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SwiftUIAccessibilityNode__Podcasts__SwiftUI;
    id v5 = [(SwiftUIAccessibilityNode__Podcasts__SwiftUI *)&v7 _accessibilityExpandedStatus];

    return v5 != 0;
  }
  return v4;
}

@end