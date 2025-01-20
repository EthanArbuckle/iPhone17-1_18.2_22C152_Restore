@interface PassThroughViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PassThroughViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PassThroughView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = -[PassThroughViewAccessibility hitTest:withEvent:](self, "hitTest:withEvent:", v7, x, y);
  if (![v8 isAccessibilityElement]) {
    goto LABEL_4;
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__PassThroughViewAccessibility__accessibilityHitTest_withEvent___block_invoke;
  v12[3] = &unk_26512D890;
  v12[4] = self;
  v12[5] = &v13;
  [v8 accessibilityEnumerateAncestorsUsingBlock:v12];
  if (*((unsigned char *)v14 + 24))
  {
    _Block_object_dispose(&v13, 8);
LABEL_4:
    v11.receiver = self;
    v11.super_class = (Class)PassThroughViewAccessibility;
    -[PassThroughViewAccessibility _accessibilityHitTest:withEvent:](&v11, sel__accessibilityHitTest_withEvent_, v7, x, y);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);
LABEL_5:

  return v9;
}

uint64_t __64__PassThroughViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 isAccessibilityElement] && *(id *)(a1 + 32) != v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }

  return MEMORY[0x270F9A758]();
}

@end