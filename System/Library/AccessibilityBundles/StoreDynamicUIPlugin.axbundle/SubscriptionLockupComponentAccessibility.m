@interface SubscriptionLockupComponentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SubscriptionLockupComponentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"StoreDynamicUIPlugin.SubscriptionLockupComponent";
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
  return (id)MEMORY[0x270F80938](self, a2);
}

@end