@interface ComponentViewOverflowViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
@end

@implementation ComponentViewOverflowViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppStore.ComponentViewOverflowViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  objc_opt_class();
  uint64_t v2 = __UIAccessibilityCastAsClass();
  v3 = (void *)v6[5];
  v6[5] = v2;

  AXPerformSafeBlock();
  _Block_object_dispose(&v5, 8);

  return 1;
}

uint64_t __78__ComponentViewOverflowViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) dismissViewControllerAnimated:1 completion:0];
}

@end