@interface STNotificationUsageCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation STNotificationUsageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STNotificationUsageCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STNotificationUsageCell" isKindOfClass:@"STUsageCell"];
  [v3 validateClass:@"STNotificationUsageCell" isKindOfClass:@"PSTableCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PSTableCell", @"value", "@", 0);
  [v3 validateClass:@"STUsageCell" hasInstanceVariable:@"_itemNameLabel" withType:"UILabel"];
}

- (id)accessibilityLabel
{
  id v3 = [(STNotificationUsageCellAccessibility *)self safeValueForKey:@"value"];
  v4 = __UIAccessibilitySafeClass();

  v5 = NSString;
  v6 = accessibilityLocalizedString(@"notifications.count.format");
  objc_opt_class();
  v7 = [v4 safeValueForKey:@"totalUsage"];
  v8 = __UIAccessibilityCastAsClass();

  v9 = objc_msgSend(v5, "stringWithFormat:", v6, objc_msgSend(v8, "integerValue"));

  v10 = [(STNotificationUsageCellAccessibility *)self safeUIViewForKey:@"_itemNameLabel"];
  v11 = [v10 accessibilityLabel];
  v12 = __UIAXStringForVariables();

  return v12;
}

@end