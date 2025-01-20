@interface SpringBoardInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
@end

@implementation SpringBoardInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SpringBoard";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  v2 = AXLogInvertColors();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "SpringBoardInvertColorsAccessibility: loading invert colors", v3, 2u);
  }

  AXPerformSafeBlock();
}

@end