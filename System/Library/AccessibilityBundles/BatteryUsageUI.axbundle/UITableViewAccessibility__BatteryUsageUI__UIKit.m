@interface UITableViewAccessibility__BatteryUsageUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)_accessibilityBoundsOfCellsToLoad;
- (CGRect)_visibleBounds;
@end

@implementation UITableViewAccessibility__BatteryUsageUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BatteryUIController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableView", @"_visibleBounds", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (CGRect)_accessibilityBoundsOfCellsToLoad
{
  [(UITableViewAccessibility__BatteryUsageUI__UIKit *)self bounds];

  return CGRectInset(*(CGRect *)&v2, v4 * -2.0, v5 * -2.0);
}

- (CGRect)_visibleBounds
{
  v21.receiver = self;
  v21.super_class = (Class)UITableViewAccessibility__BatteryUsageUI__UIKit;
  [(UITableViewAccessibility__BatteryUsageUI__UIKit *)&v21 _visibleBounds];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  v11 = [(UITableViewAccessibility__BatteryUsageUI__UIKit *)self safeValueForKey:@"delegate"];
  MEMORY[0x245644B60](@"BatteryUIController");
  if ((objc_opt_isKindOfClass() & 1) != 0 && UIAccessibilityIsVoiceOverRunning())
  {
    int v12 = [(UITableViewAccessibility__BatteryUsageUI__UIKit *)self isAccessibilityOpaqueElementProvider];

    if (v12)
    {
      [(UITableViewAccessibility__BatteryUsageUI__UIKit *)self _accessibilityBoundsOfCellsToLoad];
      v25.origin.CGFloat x = v13;
      v25.origin.CGFloat y = v14;
      v25.size.CGFloat width = v15;
      v25.size.CGFloat height = v16;
      v22.origin.CGFloat x = x;
      v22.origin.CGFloat y = y;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      CGRect v23 = CGRectUnion(v22, v25);
      CGFloat x = v23.origin.x;
      CGFloat y = v23.origin.y;
      CGFloat width = v23.size.width;
      CGFloat height = v23.size.height;
    }
  }
  else
  {
  }
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

@end