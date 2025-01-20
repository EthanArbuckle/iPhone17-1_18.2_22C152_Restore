@interface EKCalendarItemEditorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
@end

@implementation EKCalendarItemEditorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKCalendarItemEditor";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)EKCalendarItemEditorAccessibility;
  v4 = [(EKCalendarItemEditorAccessibility *)&v9 tableView:a3 cellForRowAtIndexPath:a4];
  [v4 _setAccessibilityTableCellUsesDetailTextAsValue:1];
  v5 = [v4 detailTextLabel];
  v6 = [v5 text];
  uint64_t v7 = [v6 length];

  if (v7) {
    [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  }

  return v4;
}

@end