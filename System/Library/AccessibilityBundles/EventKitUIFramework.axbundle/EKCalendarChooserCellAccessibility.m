@interface EKCalendarChooserCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation EKCalendarChooserCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKCalendarChooserCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  if ([(EKCalendarChooserCellAccessibility *)self safeBoolForKey:@"checked"]
    && ([(EKCalendarChooserCellAccessibility *)self safeBoolForKey:@"showCheckmarksOnLeft"] & 1) != 0)
  {
    int v3 = 1;
  }
  else
  {
    int v3 = [(EKCalendarChooserCellAccessibility *)self safeBoolForKey:@"isSelected"];
  }
  v13.receiver = self;
  v13.super_class = (Class)EKCalendarChooserCellAccessibility;
  unint64_t v4 = [(EKCalendarChooserCellAccessibility *)&v13 accessibilityTraits];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v5 | v4;
  v7 = [(EKCalendarChooserCellAccessibility *)self safeValueForKey:@"textLabel"];
  v8 = [v7 safeValueForKey:@"alpha"];
  [v8 doubleValue];
  double v10 = v9;

  uint64_t v11 = *MEMORY[0x263F1CF20];
  if (v10 >= 1.0) {
    uint64_t v11 = 0;
  }
  return v6 | v11;
}

@end