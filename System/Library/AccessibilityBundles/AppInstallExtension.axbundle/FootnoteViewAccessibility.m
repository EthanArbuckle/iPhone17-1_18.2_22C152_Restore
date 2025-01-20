@interface FootnoteViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation FootnoteViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppInstallExtension.FootnoteView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(FootnoteViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTextLabel"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)FootnoteViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(FootnoteViewAccessibility *)&v3 accessibilityTraits];
}

@end