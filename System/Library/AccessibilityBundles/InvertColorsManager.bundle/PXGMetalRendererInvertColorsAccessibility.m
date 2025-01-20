@interface PXGMetalRendererInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isInvertColorsEnabled;
@end

@implementation PXGMetalRendererInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXGMetalRenderer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isInvertColorsEnabled
{
  return 0;
}

@end