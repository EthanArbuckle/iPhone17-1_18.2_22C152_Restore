@interface SBIconImageViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation SBIconImageViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBIconImageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  objc_opt_class();
  v3 = [(SBIconImageViewInvertColorsAccessibility *)self safeValueForKey:@"window"];
  v4 = __UIAccessibilityCastAsClass();

  NSClassFromString(@"SPUISecureWindow");
  BOOL v7 = 0;
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 rootViewController];
    NSClassFromString(@"SPUIPlatterContainerViewController");
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

@end