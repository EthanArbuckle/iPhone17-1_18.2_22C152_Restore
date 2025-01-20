@interface SFInlinePopUpButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation SFInlinePopUpButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFInlinePopUpButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F813C0];
}

@end