@interface BuddyUIViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation BuddyUIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BuddyTableViewController"];
  [v3 validateClass:@"CDPTableViewController"];
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = [(BuddyUIViewAccessibility *)self accessibilityIdentifier];
  int v9 = [v8 isEqualToString:@"BuddyContainerView"];

  if (v9)
  {
    v10 = [(BuddyUIViewAccessibility *)self safeValueForKey:@"subviews"];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v11 = [v10 reverseObjectEnumerator];
    v12 = [v11 allObjects];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          -[BuddyUIViewAccessibility convertPoint:toView:](self, "convertPoint:toView:", v17, x, y);
          v18 = objc_msgSend(v17, "_accessibilityHitTest:withEvent:", v7);
          if ([v18 isAccessibilityElement])
          {

            goto LABEL_13;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)BuddyUIViewAccessibility;
  v18 = -[BuddyUIViewAccessibility _accessibilityHitTest:withEvent:](&v20, sel__accessibilityHitTest_withEvent_, v7, x, y);
LABEL_13:

  return v18;
}

@end