@interface RoutePlanningAddStopCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation RoutePlanningAddStopCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RoutePlanningAddStopCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"RoutePlanningAddStopCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RoutePlanningAddStopCell", @"isEnabled", "B", 0);
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  int v3 = [(RoutePlanningAddStopCellAccessibility *)self safeBoolForKey:@"isEnabled"];
  uint64_t v4 = *MEMORY[0x263F1CF20];
  if (v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

@end