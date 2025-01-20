@interface LUI_UIGlintyStringViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation LUI_UIGlintyStringViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIGlintyStringView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end