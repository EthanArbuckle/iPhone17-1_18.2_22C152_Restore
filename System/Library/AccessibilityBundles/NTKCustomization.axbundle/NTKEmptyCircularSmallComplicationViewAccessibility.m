@interface NTKEmptyCircularSmallComplicationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation NTKEmptyCircularSmallComplicationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKEmptyCircularSmallComplicationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end