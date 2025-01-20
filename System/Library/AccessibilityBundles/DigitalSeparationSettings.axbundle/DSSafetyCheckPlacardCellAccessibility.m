@interface DSSafetyCheckPlacardCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation DSSafetyCheckPlacardCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DigitalSeparationSettings.DSSafetyCheckPlacardCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF18];
}

@end