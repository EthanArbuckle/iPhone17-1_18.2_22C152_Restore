@interface NTKModuleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation NTKModuleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKModuleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)NTKModuleViewAccessibility;
  return [(NTKModuleViewAccessibility *)&v3 accessibilityTraits] & ~UIAccessibilityTraitNotEnabled;
}

@end