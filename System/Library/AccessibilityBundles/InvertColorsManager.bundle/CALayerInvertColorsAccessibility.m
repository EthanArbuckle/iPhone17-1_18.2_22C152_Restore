@interface CALayerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation CALayerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CALayer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end