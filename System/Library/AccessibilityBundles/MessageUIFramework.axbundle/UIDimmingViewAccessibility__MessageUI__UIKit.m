@interface UIDimmingViewAccessibility__MessageUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)passthroughViews;
@end

@implementation UIDimmingViewAccessibility__MessageUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIDimmingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)passthroughViews
{
  v8.receiver = self;
  v8.super_class = (Class)UIDimmingViewAccessibility__MessageUI__UIKit;
  v3 = [(UIDimmingViewAccessibility__MessageUI__UIKit *)&v8 passthroughViews];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v4 = [(UIDimmingViewAccessibility__MessageUI__UIKit *)self safeValueForKey:@"superview"];
    v5 = [v4 _accessibilityFindSubviewDescendant:&__block_literal_global_4];

    if (v5)
    {
      uint64_t v6 = [v3 arrayByAddingObject:v5];

      v3 = (void *)v6;
    }
  }

  return v3;
}

@end