@interface MetadataRibbonBorderedLabelWithDescriptionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MetadataRibbonBorderedLabelWithDescriptionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppStore.MetadataRibbonBorderedLabelWithDescriptionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AppStore.MetadataRibbonBorderedLabelWithDescriptionView", @"accessibilityBorderedLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AppStore.MetadataRibbonBorderedLabelWithDescriptionView", @"accessibilityDescriptionLabel", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(MetadataRibbonBorderedLabelWithDescriptionViewAccessibility *)self safeValueForKey:@"accessibilityBorderedLabel"];
  uint64_t v4 = [(MetadataRibbonBorderedLabelWithDescriptionViewAccessibility *)self safeValueForKey:@"accessibilityDescriptionLabel"];
  v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v11 = __UIAXStringForVariables();
  }
  else
  {
    v7 = NSString;
    v8 = accessibilityAppStoreLocalizedString(@"ranking.with.category");
    v9 = [v3 accessibilityLabel];
    v10 = [v5 accessibilityLabel];
    v11 = objc_msgSend(v7, "stringWithFormat:", v8, v9, v10);
  }

  return v11;
}

@end