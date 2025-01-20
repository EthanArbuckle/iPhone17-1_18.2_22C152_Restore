@interface MetadataRibbonIconWithLabelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MetadataRibbonIconWithLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ProductPageExtension.MetadataRibbonIconWithLabelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(MetadataRibbonIconWithLabelViewAccessibility *)self safeValueForKey:@"accessibilityArtworkView"];
  v6 = [(MetadataRibbonIconWithLabelViewAccessibility *)self safeValueForKey:@"accessibilityUILabel"];
  v4 = __UIAXStringForVariables();

  return v4;
}

@end