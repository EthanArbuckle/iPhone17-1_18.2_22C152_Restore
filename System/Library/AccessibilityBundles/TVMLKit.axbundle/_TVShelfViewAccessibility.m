@interface _TVShelfViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)_accessibilityScanningBehaviorTraits;
@end

@implementation _TVShelfViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVShelfView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_accessibilityScanningBehaviorTraits
{
  return 9;
}

@end