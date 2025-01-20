@interface AEMessagesShelfRoundButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_commonAEMessagesRoundButtonInitializationWithStyle:(int64_t)a3;
@end

@implementation AEMessagesShelfRoundButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AEMessagesShelfRoundButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_commonAEMessagesRoundButtonInitializationWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AEMessagesShelfRoundButtonAccessibility;
  -[AEMessagesShelfRoundButtonAccessibility _commonAEMessagesRoundButtonInitializationWithStyle:](&v6, sel__commonAEMessagesRoundButtonInitializationWithStyle_);
  if ((unint64_t)a3 <= 2)
  {
    v5 = accessibilityLocalizedString(off_26509ECE0[a3]);
    [(AEMessagesShelfRoundButtonAccessibility *)self setAccessibilityLabel:v5];
  }
}

@end