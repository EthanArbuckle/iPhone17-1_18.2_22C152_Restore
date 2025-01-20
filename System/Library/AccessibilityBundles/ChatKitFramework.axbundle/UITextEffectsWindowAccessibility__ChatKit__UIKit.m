@interface UITextEffectsWindowAccessibility__ChatKit__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityWindowVisible;
@end

@implementation UITextEffectsWindowAccessibility__ChatKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITextEffectsWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityWindowVisible
{
  if (_AXCKIsActionWindowShowing()) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)UITextEffectsWindowAccessibility__ChatKit__UIKit;
  return [(UITextEffectsWindowAccessibility__ChatKit__UIKit *)&v4 _accessibilityWindowVisible];
}

@end