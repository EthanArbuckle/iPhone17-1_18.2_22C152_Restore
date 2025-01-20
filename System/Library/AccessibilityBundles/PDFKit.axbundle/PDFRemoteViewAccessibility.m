@interface PDFRemoteViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PDFRemoteViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIRemoteView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a4;
  char v37 = 0;
  objc_opt_class();
  v8 = __UIAccessibilityCastAsClass();
  v9 = [v8 superview];
  [v8 frame];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v10 = [v9 subviews];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v34 != v13) {
        objc_enumerationMutation(v10);
      }
      v15 = *(void **)(*((void *)&v33 + 1) + 8 * v14);
      MEMORY[0x245659980](@"PDFExtensionTopView");
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    [v15 frame];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    if (!v9) {
      goto LABEL_14;
    }
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend(v9, "convertPoint:fromView:", v8, x, y);
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        objc_msgSend(v9, "convertRect:fromView:", v8, v17, v19, v21, v23);
        v41.double x = v25;
        v41.double y = v27;
        if (CGRectContainsPoint(v42, v41)) {
          break;
        }
      }
      uint64_t v28 = [v9 superview];

      v9 = (void *)v28;
      if (!v28) {
        goto LABEL_14;
      }
    }
    v31 = [(PDFRemoteViewAccessibility *)self accessibilityElements];
    v29 = [v31 lastObject];
  }
  else
  {
LABEL_9:

LABEL_14:
    v32.receiver = self;
    v32.super_class = (Class)PDFRemoteViewAccessibility;
    v29 = -[PDFRemoteViewAccessibility _accessibilityHitTest:withEvent:](&v32, sel__accessibilityHitTest_withEvent_, v7, x, y);
  }

  return v29;
}

@end