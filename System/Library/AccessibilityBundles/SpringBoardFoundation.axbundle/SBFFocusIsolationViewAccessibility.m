@interface SBFFocusIsolationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityViewIsModal;
@end

@implementation SBFFocusIsolationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFFocusIsolationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end