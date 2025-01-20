@interface MetadataRibbonEditorsChoiceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MetadataRibbonEditorsChoiceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BridgeStoreExtension.MetadataRibbonEditorsChoiceView";
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
  return accessibilityAppStoreLocalizedString(@"editors.choice");
}

@end