@interface AccessibilityNodeAccessibility__Maps__SwiftUI
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (CGPoint)accessibilityActivationPoint;
@end

@implementation AccessibilityNodeAccessibility__Maps__SwiftUI

+ (id)safeCategoryTargetClassName
{
  return @"SwiftUI.AccessibilityNode";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGPoint)accessibilityActivationPoint
{
  v3 = [(AccessibilityNodeAccessibility__Maps__SwiftUI *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:@"PlaceSummaryAccessoryViewImageView-PlaceSummaryTitleLabel-PlaceSummaryLabel-PlaceSummaryLabel-UserGeneratedGuideButton-PlaceSummaryActionButtonsGrid"];

  double v5 = 5.0;
  double v6 = 5.0;
  if ((v4 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)AccessibilityNodeAccessibility__Maps__SwiftUI;
    [(AccessibilityNodeAccessibility__Maps__SwiftUI *)&v7 accessibilityActivationPoint];
  }
  result.y = v6;
  result.x = v5;
  return result;
}

@end