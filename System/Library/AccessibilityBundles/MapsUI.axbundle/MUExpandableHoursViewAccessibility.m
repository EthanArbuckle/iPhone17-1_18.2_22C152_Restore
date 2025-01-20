@interface MUExpandableHoursViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation MUExpandableHoursViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUExpandableHoursView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)MUExpandableHoursViewAccessibility;
  [(MUExpandableHoursViewAccessibility *)&v4 _setExpanded:a3 animated:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end