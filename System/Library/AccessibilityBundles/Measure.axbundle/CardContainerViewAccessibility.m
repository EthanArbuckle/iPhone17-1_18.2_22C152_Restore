@interface CardContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)shouldGroupAccessibilityChildren;
@end

@implementation CardContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.CardContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end