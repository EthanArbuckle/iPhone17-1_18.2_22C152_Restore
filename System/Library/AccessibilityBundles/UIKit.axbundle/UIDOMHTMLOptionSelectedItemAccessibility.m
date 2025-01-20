@interface UIDOMHTMLOptionSelectedItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (id)accessibilityLanguage;
@end

@implementation UIDOMHTMLOptionSelectedItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIDOMHTMLOptionSelectedItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLanguage
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIDOMHTMLOptionSelectedItemAccessibility;
  return [(UIDOMHTMLOptionSelectedItemAccessibility *)&v3 accessibilityLanguage];
}

- (id)accessibilityLabel
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIDOMHTMLOptionSelectedItemAccessibility;
  return [(UIDOMHTMLOptionSelectedItemAccessibility *)&v3 accessibilityLabel];
}

@end