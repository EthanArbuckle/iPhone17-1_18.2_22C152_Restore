@interface UIKBRTIPartnerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unsigned)_performKeyboardOutputOperations:(id)a3;
@end

@implementation UIKBRTIPartnerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKBRTIPartner";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKBRTIPartner", @"_performKeyboardOutputOperations:", "I", "@", 0);
  objc_storeStrong(v4, obj);
}

- (unsigned)_performKeyboardOutputOperations:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  _UIAccessibilityBlockPostingOfAllNotifications();
  unsigned int v6 = 0;
  v5.receiver = v8;
  v5.super_class = (Class)UIKBRTIPartnerAccessibility;
  unsigned int v6 = [(UIKBRTIPartnerAccessibility *)&v5 _performKeyboardOutputOperations:location[0]];
  AXPerformBlockAsynchronouslyOnMainThread();
  unsigned int v4 = v6;
  objc_storeStrong(location, 0);
  return v4;
}

uint64_t __64__UIKBRTIPartnerAccessibility__performKeyboardOutputOperations___block_invoke()
{
  return AXUIUnblockKeyboardEntryNotifications();
}

@end