@interface CKBrowserPluginCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation CKBrowserPluginCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKBrowserPluginCell";
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