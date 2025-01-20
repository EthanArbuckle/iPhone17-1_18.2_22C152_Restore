@interface MTToolbarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)shouldGroupAccessibilityChildren;
@end

@implementation MTToolbarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTToolbar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldGroupAccessibilityChildren
{
  if ([(MTToolbarAccessibility *)self _accessibilityHasDescendantOfType:objc_opt_class()])return 0; {
  v4.receiver = self;
  }
  v4.super_class = (Class)MTToolbarAccessibility;
  return [(MTToolbarAccessibility *)&v4 shouldGroupAccessibilityChildren];
}

@end