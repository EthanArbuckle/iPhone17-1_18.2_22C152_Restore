@interface HUTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHint;
@end

@implementation HUTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUAnnounceNotificationSettingsItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUTableViewCell", @"item", "@", 0);
  [v3 validateClass:@"HUTableViewCell" isKindOfClass:@"UITableViewCell"];
}

- (id)accessibilityHint
{
  v2 = [(HUTableViewCellAccessibility *)self safeValueForKey:@"item"];
  MEMORY[0x2456509F0](@"HUAnnounceNotificationSettingsItem");
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v3 = __UIAccessibilityCastAsClass();
    v4 = [v3 textLabel];

    v5 = NSString;
    v6 = accessibilityHomeUILocalizedString(@"receive.notifications.when.setting");
    v7 = [v4 accessibilityLabel];
    v8 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end