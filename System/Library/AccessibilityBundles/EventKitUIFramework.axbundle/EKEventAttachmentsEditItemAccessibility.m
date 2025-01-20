@interface EKEventAttachmentsEditItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
@end

@implementation EKEventAttachmentsEditItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKEventAttachmentsEditItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKEventAttachmentsEditItemAccessibility;
  v3 = [(EKEventAttachmentsEditItemAccessibility *)&v6 cellForSubitemAtIndex:a3];
  uint64_t v4 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8] | v4];

  return v3;
}

@end