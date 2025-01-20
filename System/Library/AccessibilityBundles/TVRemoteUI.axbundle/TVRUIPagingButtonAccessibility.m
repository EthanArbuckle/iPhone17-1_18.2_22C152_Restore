@interface TVRUIPagingButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TVRUIPagingButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVRUIPagingButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIPagingButton", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIPagingButton", @"topButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIPagingButton", @"bottomButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)TVRUIPagingButtonAccessibility;
  [(TVRUIPagingButtonAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  id v3 = [(TVRUIPagingButtonAccessibility *)self safeValueForKey:@"topButton"];
  v4 = accessibilityLocalizedString(@"tv.remote.channel.up.button");
  [v3 setAccessibilityLabel:v4];

  v5 = [(TVRUIPagingButtonAccessibility *)self safeValueForKey:@"bottomButton"];
  v6 = accessibilityLocalizedString(@"tv.remote.channel.down.button");
  [v5 setAccessibilityLabel:v6];

  v7 = [(TVRUIPagingButtonAccessibility *)self safeValueForKey:@"titleLabel"];
  [v7 setIsAccessibilityElement:0];
}

@end