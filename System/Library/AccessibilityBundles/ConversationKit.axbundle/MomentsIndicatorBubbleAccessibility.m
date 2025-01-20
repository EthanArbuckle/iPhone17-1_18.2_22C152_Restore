@interface MomentsIndicatorBubbleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)start;
@end

@implementation MomentsIndicatorBubbleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.MomentsIndicatorBubble";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)start
{
  v6.receiver = self;
  v6.super_class = (Class)MomentsIndicatorBubbleAccessibility;
  [(MomentsIndicatorBubbleAccessibility *)&v6 start];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
  v4 = [(MomentsIndicatorBubbleAccessibility *)self safeSwiftValueForKey:@"indicator"];
  v5 = [v4 accessibilityLabel];
  UIAccessibilityPostNotification(v3, v5);
}

@end