@interface CALayerAccessibility__UIKit__QuartzCore
+ (BOOL)_isSerializableAccessibilityElement;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)_accessibilityBounds;
- (CGRect)accessibilityFrame;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityLabel;
- (void)dealloc;
@end

@implementation CALayerAccessibility__UIKit__QuartzCore

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  [(CALayerAccessibility__UIKit__QuartzCore *)self _accessibilityUnregister];
  v2.receiver = v4;
  v2.super_class = (Class)CALayerAccessibility__UIKit__QuartzCore;
  [(CALayerAccessibility__UIKit__QuartzCore *)&v2 dealloc];
}

+ (id)safeCategoryTargetClassName
{
  return @"CALayer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  SEL v3 = @"UIWindowLayer";
  objc_msgSend(location[0], "validateClass:");
  [location[0] validateClass:@"UIWindowLayer" hasInstanceVariable:@"_window" withType:"UIWindow"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"CALayer", @"setBounds:", "v", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_storeStrong(v5, obj);
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v7 = self;
  location[1] = (id)a2;
  id v2 = (id)[(CALayerAccessibility__UIKit__QuartzCore *)self accessibilityUserDefinedLabel];
  BOOL v5 = v2 == 0;

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      location[0] = (id)[(CALayerAccessibility__UIKit__QuartzCore *)v7 string];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v8 = (id)[location[0] string];
      }
      else {
        id v8 = location[0];
      }
      objc_storeStrong(location, 0);
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = (id)[(CALayerAccessibility__UIKit__QuartzCore *)v7 accessibilityUserDefinedLabel];
  }
  SEL v3 = v8;

  return v3;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v21 = a3;
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  char v18 = [(CALayerAccessibility__UIKit__QuartzCore *)v20 _accessibilityBoolValueForKey:@"AXInHitTestOverride"] & 1;
  char v11 = 0;
  char v6 = 0;
  if (!v18)
  {
    uint64_t v12 = MEMORY[0x263EF8330];
    int v13 = -1073741824;
    int v14 = 0;
    v15 = __75__CALayerAccessibility__UIKit__QuartzCore__accessibilityHitTest_withEvent___block_invoke;
    v16 = &unk_2650AE580;
    v17 = v20;
    char v11 = 1;
    v10 = (id *)&v17;
    char v6 = ((uint64_t (*)(void))__75__CALayerAccessibility__UIKit__QuartzCore__accessibilityHitTest_withEvent___block_invoke)();
  }
  if (v6)
  {
    -[CALayerAccessibility__UIKit__QuartzCore _accessibilitySetBoolValue:forKey:](v20, "_accessibilitySetBoolValue:forKey:", 1);
    id v9 = (id)-[CALayerAccessibility__UIKit__QuartzCore accessibilityHitTest:withEvent:](v20, "accessibilityHitTest:withEvent:", location[0], v21.x, v21.y);
    [(CALayerAccessibility__UIKit__QuartzCore *)v20 _accessibilitySetBoolValue:0 forKey:@"AXInHitTestOverride"];
    v22 = (CALayerAccessibility__UIKit__QuartzCore *)v9;
    int v8 = 1;
    objc_storeStrong(&v9, 0);
  }
  else
  {
    int v8 = 0;
  }
  if (v11) {
    objc_storeStrong(v10, 0);
  }
  if (!v8)
  {
    if (([(CALayerAccessibility__UIKit__QuartzCore *)v20 isAccessibilityElement] & 1) != 0
      && (-[CALayerAccessibility__UIKit__QuartzCore containsPoint:](v20, "containsPoint:", v21.x, v21.y) & 1) != 0)
    {
      v22 = v20;
      int v8 = 1;
    }
    else
    {
      id v7 = (id)-[CALayerAccessibility__UIKit__QuartzCore hitTest:](v20, "hitTest:", v21.x, v21.y);
      if ([v7 isAccessibilityElement]) {
        v22 = (CALayerAccessibility__UIKit__QuartzCore *)v7;
      }
      else {
        v22 = 0;
      }
      int v8 = 1;
      objc_storeStrong(&v7, 0);
    }
  }
  objc_storeStrong(location, 0);
  v4 = v22;

  return v4;
}

- (CGRect)_accessibilityBounds
{
  [(CALayerAccessibility__UIKit__QuartzCore *)self bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)accessibilityFrame
{
  v32 = self;
  SEL v31 = a2;
  [(CALayerAccessibility__UIKit__QuartzCore *)self _accessibilityBounds];
  *(void *)&long long v29 = v2;
  *((void *)&v29 + 1) = v3;
  *(void *)&long long v30 = v4;
  *((void *)&v30 + 1) = v5;
  id v24 = (id)[(CALayerAccessibility__UIKit__QuartzCore *)v32 _accessibilityParentView];
  id v28 = (id)[v24 window];

  if (!v28)
  {
    id location = v32;
    while (1)
    {
      id v23 = (id)[location superlayer];
      id v6 = location;
      id location = v23;

      if (!v23) {
        break;
      }
      NSClassFromString(&cfstr_Uiwindowlayer.isa);
      if (objc_opt_isKindOfClass())
      {
        id v7 = (id)[location safeValueForKey:@"_window"];
        id v8 = v28;
        id v28 = v7;

        if (v28) {
          break;
        }
      }
    }
    objc_storeStrong(&location, 0);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  id v22 = (id)objc_msgSend(v28, "layer", v32);
  [v21 convertRect:v29 toLayer:v30];
  *(void *)&long long v33 = v9;
  *((void *)&v33 + 1) = v10;
  *(void *)&long long v34 = v11;
  *((void *)&v34 + 1) = v12;

  [v28 convertRect:v33 toWindow:v34];
  *(void *)&long long v25 = v13;
  *((void *)&v25 + 1) = v14;
  *(void *)&long long v26 = v15;
  *((void *)&v26 + 1) = v16;
  long long v33 = v25;
  long long v34 = v26;
  objc_storeStrong(&v28, 0);
  double v18 = *((double *)&v33 + 1);
  double v17 = *(double *)&v33;
  double v20 = *((double *)&v34 + 1);
  double v19 = *(double *)&v34;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

@end