@interface HUCheckmarkIconCollectionListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation HUCheckmarkIconCollectionListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUCheckmarkIconCollectionListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUCheckmarkIconCollectionListCell", @"hidesCheckmark", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUCheckmarkIconCollectionListCell", @"checkmarkAccessoryView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUCheckmarkAccessoryView", @"checked", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(HUCheckmarkIconCollectionListCellAccessibility *)self safeValueForKey:@"contentView"];
  objc_opt_class();
  v4 = [v3 safeValueForKey:@"textLabel"];
  v5 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v6 = [v3 safeValueForKeyPath:@"secondaryTextLabel"];
  v7 = __UIAccessibilityCastAsClass();

  if ([(HUCheckmarkIconCollectionListCellAccessibility *)self safeBoolForKey:@"hidesCheckmark"])
  {
    v8 = 0;
  }
  else
  {
    v9 = [(HUCheckmarkIconCollectionListCellAccessibility *)self safeValueForKey:@"checkmarkAccessoryView"];
    if ([v9 safeBoolForKey:@"checked"])
    {
      id v10 = [NSString alloc];
      v11 = accessibilityHomeUILocalizedString(@"automation.scenes.and.accessories.checked");
      v8 = (void *)[v10 initWithString:v11];
    }
    else
    {
      v8 = 0;
    }
  }
  v12 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 3, v5, v7, v8);
  v13 = AXLabelForElements();

  return v13;
}

@end