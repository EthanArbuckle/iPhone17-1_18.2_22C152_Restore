@interface _UIScrollsToTopInitiatorViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_shouldSeekHigherPriorityTouchTarget;
@end

@implementation _UIScrollsToTopInitiatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIScrollsToTopInitiatorView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldSeekHigherPriorityTouchTarget
{
  v5 = self;
  SEL v4 = a2;
  if (UIAccessibilityIsVoiceOverRunning()) {
    return 0;
  }
  v3.receiver = v5;
  v3.super_class = (Class)_UIScrollsToTopInitiatorViewAccessibility;
  return [(_UIScrollsToTopInitiatorViewAccessibility *)&v3 _shouldSeekHigherPriorityTouchTarget];
}

@end