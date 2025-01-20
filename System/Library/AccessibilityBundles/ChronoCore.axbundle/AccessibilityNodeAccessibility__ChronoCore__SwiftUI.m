@interface AccessibilityNodeAccessibility__ChronoCore__SwiftUI
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityRespondsToUserInteraction;
@end

@implementation AccessibilityNodeAccessibility__ChronoCore__SwiftUI

+ (id)safeCategoryTargetClassName
{
  return @"SwiftUI.AccessibilityNode";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  if (AXProcessIsChronod()) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)AccessibilityNodeAccessibility__ChronoCore__SwiftUI;
  return [(AccessibilityNodeAccessibility__ChronoCore__SwiftUI *)&v4 accessibilityRespondsToUserInteraction];
}

@end