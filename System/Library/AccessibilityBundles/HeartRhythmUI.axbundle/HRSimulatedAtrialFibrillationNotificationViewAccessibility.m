@interface HRSimulatedAtrialFibrillationNotificationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HRSimulatedAtrialFibrillationNotificationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HRSimulatedAtrialFibrillationNotificationView";
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
  return accessibilityAntimonyLocalizedString(@"simulated.afib.notification");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00];
}

@end