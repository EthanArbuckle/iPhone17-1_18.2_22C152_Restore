@interface CertInfoGradientLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation CertInfoGradientLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CertInfoGradientLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  return (id)[(CertInfoGradientLabelAccessibility *)self safeStringForKey:@"_text"];
}

@end