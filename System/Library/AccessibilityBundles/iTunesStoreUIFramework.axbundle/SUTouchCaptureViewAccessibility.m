@interface SUTouchCaptureViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityPerformEscape;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
@end

@implementation SUTouchCaptureViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUTouchCaptureView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown
{
  return [(SUTouchCaptureViewAccessibility *)self _accessibilityHasDescendantOfType:NSClassFromString(&cfstr_Sumaskedview.isa)] ^ 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)SUTouchCaptureViewAccessibility;
  -[SUTouchCaptureViewAccessibility _accessibilityHitTest:withEvent:](&v29, sel__accessibilityHitTest_withEvent_, v7, x, y);
  v8 = (SUTouchCaptureViewAccessibility *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8) {
    BOOL v10 = v8 == self;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v11 = [(SUTouchCaptureViewAccessibility *)self safeValueForKey:@"passThroughViews", 0];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v25 + 1) + 8 * i);
          objc_msgSend(v16, "convertPoint:fromView:", self, x, y);
          uint64_t v17 = objc_msgSend(v16, "_accessibilityHitTest:withEvent:", v7);

          if (v17)
          {

            v9 = (SUTouchCaptureViewAccessibility *)v17;
            goto LABEL_20;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    if (!v9)
    {
      if (!-[SUTouchCaptureViewAccessibility pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
      {
LABEL_29:
        v9 = 0;
        goto LABEL_21;
      }
      v11 = [MEMORY[0x263F1C5C0] currentDevice];
      if (objc_opt_respondsToSelector())
      {
        v18 = [MEMORY[0x263F1C5C0] currentDevice];
        uint64_t v19 = [v18 userInterfaceIdiom];

        if (v19 == 1)
        {
          v20 = self;
          goto LABEL_22;
        }
        goto LABEL_29;
      }
      v9 = 0;
LABEL_20:
    }
  }
LABEL_21:
  if (v9 != self)
  {
LABEL_24:
    self = v9;
    v23 = self;
    goto LABEL_25;
  }
LABEL_22:
  v21 = [(SUTouchCaptureViewAccessibility *)self subviews];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    v9 = self;
    goto LABEL_24;
  }
  v23 = 0;
LABEL_25:

  return v23;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  return 1;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return (id)MEMORY[0x270F80A40](@"popover.view.dimiss.region", a2);
}

@end