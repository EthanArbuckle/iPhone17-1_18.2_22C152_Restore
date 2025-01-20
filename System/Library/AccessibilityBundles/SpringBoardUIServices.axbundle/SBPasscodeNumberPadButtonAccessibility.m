@interface SBPasscodeNumberPadButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilitySupportsDirectioOrbManipulation;
- (unint64_t)accessibilityTraits;
@end

@implementation SBPasscodeNumberPadButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBPasscodeNumberPadButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF28] | *MEMORY[0x263F1CF08];
}

- (BOOL)_accessibilitySupportsDirectioOrbManipulation
{
  return 0;
}

@end