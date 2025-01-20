@interface MetadataRibbonIconWithLabelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MetadataRibbonIconWithLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppStore.MetadataRibbonIconWithLabelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AppStore.MetadataRibbonIconWithLabelView", @"accessibilityArtworkView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AppStore.MetadataRibbonIconWithLabelView", @"accessibilityUILabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MetadataRibbonIconWithLabelViewAccessibility *)self safeValueForKey:@"accessibilityArtworkView"];
  v6 = [(MetadataRibbonIconWithLabelViewAccessibility *)self safeValueForKey:@"accessibilityUILabel"];
  v4 = __UIAXStringForVariables();

  return v4;
}

@end