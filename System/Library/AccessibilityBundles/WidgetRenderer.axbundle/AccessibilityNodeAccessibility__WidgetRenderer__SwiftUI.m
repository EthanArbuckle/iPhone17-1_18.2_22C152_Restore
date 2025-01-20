@interface AccessibilityNodeAccessibility__WidgetRenderer__SwiftUI
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldUseHostContextIDForLongPress;
- (BOOL)accessibilityRespondsToUserInteraction;
@end

@implementation AccessibilityNodeAccessibility__WidgetRenderer__SwiftUI

+ (id)safeCategoryTargetClassName
{
  return @"SwiftUI.AccessibilityNode";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  if (AXProcessIsWidgetRenderer()) {
    return [(AccessibilityNodeAccessibility__WidgetRenderer__SwiftUI *)self safeBoolForKey:@"_accessibilityExplicitlyNonInteractable"] ^ 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)AccessibilityNodeAccessibility__WidgetRenderer__SwiftUI;
  return [(AccessibilityNodeAccessibility__WidgetRenderer__SwiftUI *)&v4 accessibilityRespondsToUserInteraction];
}

- (BOOL)_accessibilityShouldUseHostContextIDForLongPress
{
  return 1;
}

@end