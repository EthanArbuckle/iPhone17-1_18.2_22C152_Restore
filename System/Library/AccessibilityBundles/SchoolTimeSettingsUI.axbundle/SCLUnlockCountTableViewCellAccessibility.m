@interface SCLUnlockCountTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation SCLUnlockCountTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SCLUnlockCountTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitNone;
}

@end