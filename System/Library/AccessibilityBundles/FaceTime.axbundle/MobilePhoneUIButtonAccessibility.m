@interface MobilePhoneUIButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityKeyboardKeyAllowsTouchTyping;
@end

@implementation MobilePhoneUIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityKeyboardKeyAllowsTouchTyping
{
  v3 = [(MobilePhoneUIButtonAccessibility *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:@"DeleteButton"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)MobilePhoneUIButtonAccessibility;
  return [(MobilePhoneUIButtonAccessibility *)&v6 _accessibilityKeyboardKeyAllowsTouchTyping];
}

@end