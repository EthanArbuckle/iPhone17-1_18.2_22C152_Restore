@interface SWTodayTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation SWTodayTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SWTodayTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SWTodayTableViewCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SWTodayTableViewController", @"clipView", "@", 0);
}

- (unint64_t)accessibilityTraits
{
  char v23 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 _tableView];
  v5 = [v4 dataSource];

  v6 = [v5 safeValueForKey:@"clipView"];
  [v6 accessibilityFrame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(SWTodayTableViewCellAccessibility *)self accessibilityFrame];
  v26.origin.x = v15;
  v26.origin.y = v16;
  v26.size.width = v17;
  v26.size.height = v18;
  v24.origin.x = v8;
  v24.origin.y = v10;
  v24.size.width = v12;
  v24.size.height = v14;
  CGRect v25 = CGRectIntersection(v24, v26);
  if (v25.size.width < 2.0 || v25.size.height < 2.0)
  {
    id v20 = (id)*MEMORY[0x263F813E8];
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)SWTodayTableViewCellAccessibility;
    id v20 = [(SWTodayTableViewCellAccessibility *)&v22 accessibilityTraits];
  }

  return (unint64_t)v20;
}

@end