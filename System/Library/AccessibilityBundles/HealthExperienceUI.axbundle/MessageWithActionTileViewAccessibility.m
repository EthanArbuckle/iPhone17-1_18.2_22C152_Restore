@interface MessageWithActionTileViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation MessageWithActionTileViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExperienceUI.MessageWithActionTileView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthExperienceUI.MessageWithActionTileView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthExperienceUI.MessageWithActionTileView", @"bodyLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthExperienceUI.MessageWithActionTileView", @"actionButton", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(MessageWithActionTileViewAccessibility *)self safeUIViewForKey:@"titleLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(MessageWithActionTileViewAccessibility *)self safeUIViewForKey:@"bodyLabel"];
  v6 = [v5 accessibilityLabel];

  v7 = [(MessageWithActionTileViewAccessibility *)self safeUIViewForKey:@"actionButton"];
  v8 = [v7 accessibilityLabel];

  v9 = __UIAXStringForVariables();

  return v9;
}

@end