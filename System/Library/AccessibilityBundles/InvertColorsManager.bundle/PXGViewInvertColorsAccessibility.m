@interface PXGViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation PXGViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXGView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  if (qword_836A0 != -1) {
    dispatch_once(&qword_836A0, &stru_44A98);
  }
  return byte_83698 == 0;
}

@end