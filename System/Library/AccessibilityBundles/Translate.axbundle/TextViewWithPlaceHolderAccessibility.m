@interface TextViewWithPlaceHolderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityPlaceholderValue;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TextViewWithPlaceHolderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SequoiaTranslator.TextViewWithPlaceHolder";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityPlaceholderValue
{
  return accessibilityLocalizedString(@"enter.text.placeholder");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)TextViewWithPlaceHolderAccessibility;
  [(TextViewWithPlaceHolderAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(TextViewWithPlaceHolderAccessibility *)self safeValueForKey:@"_axPlaceholderTextView"];
  [v3 setAccessibilityElementsHidden:1];
}

@end