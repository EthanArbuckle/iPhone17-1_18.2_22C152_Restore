@interface SBIconWidgetIntroductionPopoverViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityViewIsModal;
- (BOOL)shouldGroupAccessibilityChildren;
@end

@implementation SBIconWidgetIntroductionPopoverViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBIconWidgetIntroductionPopoverView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end