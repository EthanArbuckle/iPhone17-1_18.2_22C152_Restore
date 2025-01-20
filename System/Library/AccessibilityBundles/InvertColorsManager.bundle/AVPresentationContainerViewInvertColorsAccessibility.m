@interface AVPresentationContainerViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoreInvertIfDarkBackgroundColor;
@end

@implementation AVPresentationContainerViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVPresentationContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoreInvertIfDarkBackgroundColor
{
  return 1;
}

@end