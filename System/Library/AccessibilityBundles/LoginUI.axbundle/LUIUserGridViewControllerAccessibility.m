@interface LUIUserGridViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
@end

@implementation LUIUserGridViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LUIUserGridViewController";
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
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __68__LUIUserGridViewControllerAccessibility_accessibilityPerformEscape__block_invoke;
  v9 = &unk_26512B678;
  v10 = self;
  v11 = &v12;
  AXPerformSafeBlock();
  if (*((unsigned char *)v13 + 24))
  {
    BOOL v3 = 1;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)LUIUserGridViewControllerAccessibility;
    BOOL v3 = [(LUIUserGridViewControllerAccessibility *)&v5 accessibilityPerformEscape];
    *((unsigned char *)v13 + 24) = v3;
  }
  _Block_object_dispose(&v12, 8);
  return v3;
}

uint64_t __68__LUIUserGridViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) vibrantButtonPressed:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

@end