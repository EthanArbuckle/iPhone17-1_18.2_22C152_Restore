@interface SKNodeAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
- (CGRect)accessibilityFrame;
- (id)_accessibilitySpriteKitChildrenNodes;
- (id)accessibilityContainer;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (id)accessibilityLabel;
- (int64_t)accessibilityElementCount;
- (int64_t)indexOfAccessibilityElement:(id)a3;
@end

@implementation SKNodeAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKNode";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKNode", @"children", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKNode", @"frame", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKNode", @"scene", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKNode", @"parent", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKNode", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKNode", @"alpha", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKNode", @"isHidden", "B", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(SKNodeAccessibility *)self accessibilityUserDefinedLabel];
  if (![v3 length])
  {
    uint64_t v4 = [(SKNodeAccessibility *)self safeValueForKey:@"name"];

    id v3 = (void *)v4;
  }

  return v3;
}

- (id)_accessibilitySpriteKitChildrenNodes
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  id v9 = 0;
  AXPerformSafeBlock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __59__SKNodeAccessibility__accessibilitySpriteKitChildrenNodes__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) safeValueForKey:@"children"];
  id v2 = [v6 reverseObjectEnumerator];
  uint64_t v3 = [v2 allObjects];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (CGRect)accessibilityFrame
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v47.receiver = self;
  v47.super_class = (Class)SKNodeAccessibility;
  [(SKNodeAccessibility *)&v47 accessibilityFrame];
  CGFloat x = v51.origin.x;
  CGFloat y = v51.origin.y;
  CGFloat width = v51.size.width;
  CGFloat height = v51.size.height;
  if (!CGRectIsEmpty(v51)) {
    goto LABEL_36;
  }
  char v46 = 0;
  objc_opt_class();
  id v6 = __UIAccessibilityCastAsClass();
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [v6 scene];
  v16 = [v6 parent];
  uint64_t v17 = [v15 view];
  v18 = (UIView *)v17;
  BOOL v19 = !v15 || v6 == 0;
  BOOL v20 = v19 || v16 == 0;
  BOOL v21 = v20 || v17 == 0;
  BOOL v22 = v21;
  if (v21)
  {
    double v10 = *MEMORY[0x263F001A8];
    double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v23 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v8, v10 + v14, 0);
    v48[0] = v23;
    v24 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v8 + v12, v10 + v14);
    v48[1] = v24;
    v25 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v8, v10);
    v48[2] = v25;
    v26 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v8 + v12, v10);
    v48[3] = v26;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:4];

    uint64_t v28 = [v27 countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v43;
      double v31 = -INFINITY;
      double v32 = INFINITY;
      double v33 = INFINITY;
      double v34 = -INFINITY;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v43 != v30) {
            objc_enumerationMutation(v27);
          }
          [*(id *)(*((void *)&v42 + 1) + 8 * i) CGPointValue];
          objc_msgSend(v15, "convertPoint:fromNode:", v16);
          objc_msgSend(v15, "convertPointToView:");
          if (v36 >= v34) {
            double v34 = v36;
          }
          if (v37 >= v31) {
            double v31 = v37;
          }
          if (v36 < v33) {
            double v33 = v36;
          }
          if (v37 < v32) {
            double v32 = v37;
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v42 objects:v49 count:16];
      }
      while (v29);
    }
    else
    {
      double v31 = -INFINITY;
      double v32 = INFINITY;
      double v33 = INFINITY;
      double v34 = -INFINITY;
    }

    v52.size.CGFloat width = v34 - v33;
    v52.size.CGFloat height = v31 - v32;
    v52.origin.CGFloat x = v33;
    v52.origin.CGFloat y = v32;
    CGRect v53 = UIAccessibilityConvertFrameToScreenCoordinates(v52, v18);
    CGFloat x = v53.origin.x;
    CGFloat y = v53.origin.y;
    CGFloat width = v53.size.width;
    CGFloat height = v53.size.height;
  }

  if (!v22)
  {
LABEL_36:
    double v10 = x;
    double v8 = y;
    double v12 = width;
    double v14 = height;
  }
  double v38 = v10;
  double v39 = v8;
  double v40 = v12;
  double v41 = v14;
  result.size.CGFloat height = v41;
  result.size.CGFloat width = v40;
  result.origin.CGFloat y = v39;
  result.origin.CGFloat x = v38;
  return result;
}

- (BOOL)accessibilityElementsHidden
{
  [(SKNodeAccessibility *)self safeCGFloatForKey:@"alpha"];
  if (v3 == 0.0) {
    return 1;
  }

  return [(SKNodeAccessibility *)self safeBoolForKey:@"isHidden"];
}

- (id)accessibilityContainer
{
  v5.receiver = self;
  v5.super_class = (Class)SKNodeAccessibility;
  double v3 = [(SKNodeAccessibility *)&v5 accessibilityContainer];
  if (!v3)
  {
    double v3 = [(SKNodeAccessibility *)self safeValueForKey:@"parent"];
    if (!v3)
    {
      double v3 = [(SKNodeAccessibility *)self safeValueForKey:@"scene"];
    }
  }

  return v3;
}

- (int64_t)accessibilityElementCount
{
  v6.receiver = self;
  v6.super_class = (Class)SKNodeAccessibility;
  id v3 = [(SKNodeAccessibility *)&v6 accessibilityElementCount];
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [(SKNodeAccessibility *)self _accessibilitySpriteKitChildrenNodes];
    id v3 = (id)[v4 accessibilityElementCount];
  }
  return (int64_t)v3;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SKNodeAccessibility;
  objc_super v5 = -[SKNodeAccessibility accessibilityElementAtIndex:](&v8, sel_accessibilityElementAtIndex_);
  if (!v5)
  {
    objc_super v6 = [(SKNodeAccessibility *)self _accessibilitySpriteKitChildrenNodes];
    objc_super v5 = [v6 accessibilityElementAtIndex:a3];
  }

  return v5;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKNodeAccessibility;
  id v5 = [(SKNodeAccessibility *)&v8 indexOfAccessibilityElement:v4];
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v6 = [(SKNodeAccessibility *)self _accessibilitySpriteKitChildrenNodes];
    id v5 = (id)[v6 indexOfAccessibilityElement:v4];
  }
  return (int64_t)v5;
}

@end