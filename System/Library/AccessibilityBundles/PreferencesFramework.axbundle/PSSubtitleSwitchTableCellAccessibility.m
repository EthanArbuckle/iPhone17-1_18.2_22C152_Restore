@interface PSSubtitleSwitchTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityValue;
@end

@implementation PSSubtitleSwitchTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSSubtitleSwitchTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  v3 = [(PSSubtitleSwitchTableCellAccessibility *)self safeValueForKey:@"control"];
  v4 = v3;
  if (v3
    && ([v3 isHidden] & 1) == 0
    && ([v4 window], v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    v6 = [(PSSubtitleSwitchTableCellAccessibility *)self safeValueForKey:@"control"];
    v7 = [v6 accessibilityValue];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end