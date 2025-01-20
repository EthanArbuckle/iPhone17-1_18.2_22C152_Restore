@interface PRRenderingViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation PRRenderingViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PRRenderingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  if (qword_83690 != -1) {
    dispatch_once(&qword_83690, &stru_44A38);
  }
  return (byte_83688 | byte_83689) != 0;
}

@end