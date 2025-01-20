@interface MFComposeWebViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilitySubclassSupportsDarkMode;
@end

@implementation MFComposeWebViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFComposeWebView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilitySubclassSupportsDarkMode
{
  return 1;
}

@end