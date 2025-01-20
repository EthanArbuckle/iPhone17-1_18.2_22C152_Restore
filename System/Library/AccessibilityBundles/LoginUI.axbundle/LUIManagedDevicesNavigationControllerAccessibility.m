@interface LUIManagedDevicesNavigationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
@end

@implementation LUIManagedDevicesNavigationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LUIManagedDevicesNavigationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"LUIManagedDevicesNavigationController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LUIManagedDevicesNavigationController", @"doneButtonPressed:", "v", "@", 0);
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  AXPerformSafeBlock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __80__LUIManagedDevicesNavigationControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) doneButtonPressed:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

@end