@interface SBIconLabelImageAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation SBIconLabelImageAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBIconLabelImage";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end