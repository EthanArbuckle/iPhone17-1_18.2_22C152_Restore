@interface WFWidgetCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axWorkflowCellName;
- (void)setRunningState:(int64_t)a3;
@end

@implementation WFWidgetCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFWidgetCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFWidgetCell", @"nameView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFWidgetCell", @"setRunningState:", "v", "q", 0);
}

- (BOOL)isAccessibilityElement
{
  v2 = [(WFWidgetCellAccessibility *)self _axWorkflowCellName];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setRunningState:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFWidgetCellAccessibility;
  -[WFWidgetCellAccessibility setRunningState:](&v7, sel_setRunningState_);
  if ((unint64_t)a3 <= 3)
  {
    v4 = off_265169FC0[a3];
    UIAccessibilityNotifications v5 = *MEMORY[0x263F1CDC8];
    v6 = accessibilityLocalizedString(v4);
    UIAccessibilityPostNotification(v5, v6);
  }
}

- (id)_axWorkflowCellName
{
  v2 = [(WFWidgetCellAccessibility *)self safeUIViewForKey:@"nameView"];
  BOOL v3 = [v2 accessibilityValue];

  return v3;
}

@end