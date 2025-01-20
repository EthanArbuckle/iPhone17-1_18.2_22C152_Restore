@interface PHBottomBarButton__MobilePhone__InvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation PHBottomBarButton__MobilePhone__InvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHBottomBarButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

@end