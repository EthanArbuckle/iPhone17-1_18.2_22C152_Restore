@interface UITransitionViewAccessibility__Podcasts__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesInvisibility;
- (BOOL)_foundSearchControllerDimmingView;
- (BOOL)_isSuperviewOfSearchControllerView;
- (BOOL)accessibilityElementsHidden;
@end

@implementation UITransitionViewAccessibility__Podcasts__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITransitionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_isSuperviewOfSearchControllerView
{
  v2 = [(UITransitionViewAccessibility__Podcasts__UIKit *)self subviews];
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __84__UITransitionViewAccessibility__Podcasts__UIKit__isSuperviewOfSearchControllerView__block_invoke;
  v5[3] = &unk_2651443D8;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)_foundSearchControllerDimmingView
{
  v2 = [(UITransitionViewAccessibility__Podcasts__UIKit *)self _accessibilityFindDescendant:&__block_literal_global_4];
  char v3 = [v2 _accessibilityViewIsVisible];

  return v3;
}

- (BOOL)accessibilityElementsHidden
{
  if ([(UITransitionViewAccessibility__Podcasts__UIKit *)self _isSuperviewOfSearchControllerView]&& ![(UITransitionViewAccessibility__Podcasts__UIKit *)self _foundSearchControllerDimmingView])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)UITransitionViewAccessibility__Podcasts__UIKit;
  return [(UITransitionViewAccessibility__Podcasts__UIKit *)&v4 accessibilityElementsHidden];
}

- (BOOL)_accessibilityOverridesInvisibility
{
  if (![(UITransitionViewAccessibility__Podcasts__UIKit *)self _isSuperviewOfSearchControllerView]|| (BOOL v3 = [(UITransitionViewAccessibility__Podcasts__UIKit *)self _foundSearchControllerDimmingView]))
  {
    v5.receiver = self;
    v5.super_class = (Class)UITransitionViewAccessibility__Podcasts__UIKit;
    LOBYTE(v3) = [(UITransitionViewAccessibility__Podcasts__UIKit *)&v5 _accessibilityOverridesInvisibility];
  }
  return v3;
}

@end