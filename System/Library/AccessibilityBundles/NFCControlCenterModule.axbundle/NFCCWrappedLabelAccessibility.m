@interface NFCCWrappedLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation NFCCWrappedLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NFCCWrappedLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)NFCCWrappedLabelAccessibility;
  [(NFCCWrappedLabelAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(NFCCWrappedLabelAccessibility *)self safeValueForKey:@"label"];
  [v3 setIsAccessibilityElement:0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(NFCCWrappedLabelAccessibility *)self safeValueForKey:@"label"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(NFCCWrappedLabelAccessibility *)self safeValueForKey:@"label"];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

@end