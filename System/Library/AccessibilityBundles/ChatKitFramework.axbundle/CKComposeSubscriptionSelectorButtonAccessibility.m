@interface CKComposeSubscriptionSelectorButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation CKComposeSubscriptionSelectorButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKComposeSubscriptionSelectorButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v2 = [(CKComposeSubscriptionSelectorButtonAccessibility *)self safeValueForKey:@"buttonTitleLabel"];
  v3 = __UIAXStringForVariables();

  return v3;
}

@end