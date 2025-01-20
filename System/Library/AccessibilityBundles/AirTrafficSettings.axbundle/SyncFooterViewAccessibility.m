@interface SyncFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)updateProgress:(id)a3 dataSource:(id)a4;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityElements;
@end

@implementation SyncFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SyncFooterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)updateProgress:(id)a3 dataSource:(id)a4
{
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__SyncFooterViewAccessibility_updateProgress_dataSource___block_invoke;
  v14[3] = &unk_265103528;
  v14[4] = self;
  id v6 = a4;
  id v7 = a3;
  v8 = (void (**)(void))MEMORY[0x245640320](v14);
  v9 = v8[2]();
  v13.receiver = self;
  v13.super_class = (Class)SyncFooterViewAccessibility;
  BOOL v10 = [(SyncFooterViewAccessibility *)&v13 updateProgress:v7 dataSource:v6];

  v11 = ((void (*)(void (**)(void)))v8[2])(v8);
  if (([v9 isEqualToSet:v11] & 1) == 0) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }

  return v10;
}

id __57__SyncFooterViewAccessibility_updateProgress_dataSource___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = *(id *)(a1 + 32);
    v3 = [v2 subviews];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      id v6 = 0;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v3);
          }
          v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (([v9 isHidden] & 1) == 0)
          {
            if (!v6) {
              id v6 = objc_opt_new();
            }
            [v6 addObject:v9];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
    else
    {
      id v6 = 0;
    }

    if (v6)
    {
      BOOL v10 = [MEMORY[0x263EFFA08] setWithSet:v6];
      goto LABEL_19;
    }
  }
  else
  {
    id v6 = 0;
  }
  BOOL v10 = 0;
LABEL_19:

  return v10;
}

- (id)accessibilityElements
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [(SyncFooterViewAccessibility *)self subviews];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v7 = kIsHitTestingSyncFooterView;
  id v8 = a4;
  uint64_t v9 = [(SyncFooterViewAccessibility *)self _accessibilityBoolValueForKey:v7];
  [(SyncFooterViewAccessibility *)self _accessibilitySetBoolValue:1 forKey:kIsHitTestingSyncFooterView];
  v12.receiver = self;
  v12.super_class = (Class)SyncFooterViewAccessibility;
  BOOL v10 = -[SyncFooterViewAccessibility _accessibilityHitTest:withEvent:](&v12, sel__accessibilityHitTest_withEvent_, v8, x, y);

  [(SyncFooterViewAccessibility *)self _accessibilitySetBoolValue:v9 forKey:kIsHitTestingSyncFooterView];

  return v10;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if ([(SyncFooterViewAccessibility *)self _accessibilityBoolValueForKey:kIsHitTestingSyncFooterView])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = self;
      [(SyncFooterViewAccessibility *)v8 subviews];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            -[SyncFooterViewAccessibility convertPoint:toView:](v8, "convertPoint:toView:", v14, x, y);
            if (objc_msgSend(v14, "pointInside:withEvent:", v7))
            {

              BOOL v15 = 1;
              goto LABEL_13;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SyncFooterViewAccessibility;
  BOOL v15 = -[SyncFooterViewAccessibility pointInside:withEvent:](&v17, sel_pointInside_withEvent_, v7, x, y);
LABEL_13:

  return v15;
}

@end