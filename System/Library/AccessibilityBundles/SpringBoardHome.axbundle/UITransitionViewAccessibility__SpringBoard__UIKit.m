@interface UITransitionViewAccessibility__SpringBoard__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityViewIsModal;
@end

@implementation UITransitionViewAccessibility__SpringBoard__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITransitionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  if (accessibilityViewIsModal_onceToken != -1) {
    dispatch_once(&accessibilityViewIsModal_onceToken, &__block_literal_global_0);
  }
  v3 = [(UITransitionViewAccessibility__SpringBoard__UIKit *)self _accessibilityWindow];
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)UITransitionViewAccessibility__SpringBoard__UIKit;
  return [(UITransitionViewAccessibility__SpringBoard__UIKit *)&v6 accessibilityViewIsModal];
}

@end