@interface OBBulletedListItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
@end

@implementation OBBulletedListItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"OBBulletedListItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBBulletedListItem", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBBulletedListItem", @"imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBBulletedListItem", @"descriptionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBBulletedListItem", @"accessoryButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(OBBulletedListItemAccessibility *)self safeUIViewForKey:@"imageView"];
  v4 = [v3 safeValueForKey:@"image"];
  v5 = [v4 accessibilityUserDefinedLabel];

  v8 = [(OBBulletedListItemAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleLabel, descriptionLabel"];
  v6 = __AXStringForVariables();

  return v6;
}

- (id)_accessibilitySupplementaryFooterViews
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [(OBBulletedListItemAccessibility *)self safeUIViewForKey:@"accessoryButton"];
  if ([v2 _accessibilityViewIsVisible])
  {
    v5[0] = v2;
    id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

@end