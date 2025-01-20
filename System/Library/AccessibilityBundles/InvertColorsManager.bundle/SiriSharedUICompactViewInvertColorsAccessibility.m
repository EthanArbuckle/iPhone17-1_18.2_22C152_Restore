@interface SiriSharedUICompactViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation SiriSharedUICompactViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriSharedUICompactView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 0;
}

@end