@interface UIButtonAccessibility__AnnotationKit__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation UIButtonAccessibility__AnnotationKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKToolbarViewController_iOS", @"lineStyleButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKToolbarViewController_iOS", @"textStyleButton", "@", 0);
}

- (id)accessibilityLabel
{
  v35.receiver = self;
  v35.super_class = (Class)UIButtonAccessibility__AnnotationKit__UIKit;
  id v3 = [(UIButtonAccessibility__AnnotationKit__UIKit *)&v35 accessibilityLabel];
  objc_opt_class();
  v4 = __UIAccessibilityCastAsClass();
  uint64_t v5 = [v4 tag];

  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = v5;
  char v30 = 0;
  objc_opt_class();
  v6 = __UIAccessibilityCastAsClass();
  v7 = [v6 superview];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v30 = 0;
    objc_opt_class();
    char v29 = 0;
    objc_opt_class();
    v9 = __UIAccessibilityCastAsClass();
    v10 = [v9 superview];
    v11 = __UIAccessibilityCastAsClass();

    v12 = [v11 items];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __65__UIButtonAccessibility__AnnotationKit__UIKit_accessibilityLabel__block_invoke;
    v28[3] = &unk_265104140;
    v28[4] = self;
    v28[5] = &v31;
    [v12 enumerateObjectsUsingBlock:v28];
  }
  if (v5 == 764015 || (uint64_t v13 = v32[3], v13 == 764015))
  {
    v14 = @"tool.intel.sketch.label";
LABEL_6:
    uint64_t v15 = accessibilityLocalizedString(v14);

    id v3 = (void *)v15;
    goto LABEL_7;
  }
  v14 = @"tool.var.sketch.label";
  if (v5 == 764016) {
    goto LABEL_6;
  }
  if (v13 == 764016) {
    goto LABEL_6;
  }
  v14 = @"tool.signature.label";
  if (v5 == 764019 || v13 == 764019) {
    goto LABEL_6;
  }
LABEL_7:
  if (![v3 length])
  {
    char v30 = 0;
    objc_opt_class();
    v16 = [(UIButtonAccessibility__AnnotationKit__UIKit *)self safeValueForKey:@"allTargets"];
    v17 = __UIAccessibilityCastAsClass();

    if (v30) {
      abort();
    }
    v18 = [v17 anyObject];
    MEMORY[0x245640800](@"AKToolbarViewController_iOS");
    if (objc_opt_isKindOfClass())
    {
      char v30 = 0;
      objc_opt_class();
      v19 = [v18 safeValueForKey:@"lineStyleButton"];
      v20 = __UIAccessibilityCastAsClass();

      if (v30) {
        abort();
      }
      v21 = [v20 customView];

      char v30 = 0;
      objc_opt_class();
      v22 = [v18 safeValueForKey:@"textStyleButton"];
      v23 = __UIAccessibilityCastAsClass();

      if (v30) {
        abort();
      }
      v24 = [v23 customView];

      if ([v21 isEqual:self])
      {
        uint64_t v25 = accessibilityLocalizedString(@"stroke.thickness.button");

        id v3 = (void *)v25;
      }
      if ([v24 isEqual:self])
      {
        uint64_t v26 = accessibilityLocalizedString(@"text.attributes.button");

        id v3 = (void *)v26;
      }
    }
  }
  _Block_object_dispose(&v31, 8);

  return v3;
}

@end