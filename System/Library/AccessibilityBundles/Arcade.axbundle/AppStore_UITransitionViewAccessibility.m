@interface AppStore_UITransitionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_isSuperviewOfSearchControllerView;
- (BOOL)accessibilityViewIsModal;
@end

@implementation AppStore_UITransitionViewAccessibility

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
  v2 = [(AppStore_UITransitionViewAccessibility *)self subviews];
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __76__AppStore_UITransitionViewAccessibility__isSuperviewOfSearchControllerView__block_invoke;
  v5[3] = &unk_265107610;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)accessibilityViewIsModal
{
  if ([(AppStore_UITransitionViewAccessibility *)self _isSuperviewOfSearchControllerView])
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AppStore_UITransitionViewAccessibility;
  return [(AppStore_UITransitionViewAccessibility *)&v4 accessibilityViewIsModal];
}

@end