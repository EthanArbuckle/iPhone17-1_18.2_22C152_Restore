@interface AppStore_UINavigationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGSize)_navigationBarSizeForViewController:(id)a3 proposedHeight:(double)a4 allowRubberBandStretch:(BOOL)a5;
@end

@implementation AppStore_UINavigationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UINavigationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UINavigationController", @"_navigationBarSizeForViewController:proposedHeight:allowRubberBandStretch:", "{CGSize=dd}", "@", "d", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UINavigationController", @"_heightRangeOfTopViews", "{?=ddd}", 0);
}

- (CGSize)_navigationBarSizeForViewController:(id)a3 proposedHeight:(double)a4 allowRubberBandStretch:(BOOL)a5
{
  BOOL v7 = a5;
  id v10 = a3;
  if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning()) {
    goto LABEL_9;
  }
  objc_opt_class();
  v11 = [(AppStore_UINavigationControllerAccessibility *)self safeValueForKey:@"_heightRangeOfTopViews"];
  v12 = __UIAccessibilityCastAsClass();

  uint64_t v35 = 0;
  v36 = (double *)&v35;
  uint64_t v37 = 0x3810000000;
  v38 = &unk_241E881B2;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  if (!v12) {
    goto LABEL_8;
  }
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  v26 = __122__AppStore_UINavigationControllerAccessibility__navigationBarSizeForViewController_proposedHeight_allowRubberBandStretch___block_invoke;
  v27 = &unk_265100458;
  id v13 = v12;
  id v28 = v13;
  v29 = &v35;
  v30 = &v31;
  AXPerformSafeBlock();
  int v14 = *((unsigned __int8 *)v32 + 24);
  if (*((unsigned char *)v32 + 24))
  {
    double v15 = v36[6];
    v23.receiver = self;
    v23.super_class = (Class)AppStore_UINavigationControllerAccessibility;
    [(AppStore_UINavigationControllerAccessibility *)&v23 _navigationBarSizeForViewController:v10 proposedHeight:v7 allowRubberBandStretch:v15];
    double v5 = v16;
    double v6 = v17;
  }

  _Block_object_dispose(&v31, 8);
  if (!v14)
  {
LABEL_8:
    _Block_object_dispose(&v35, 8);

LABEL_9:
    v22.receiver = self;
    v22.super_class = (Class)AppStore_UINavigationControllerAccessibility;
    [(AppStore_UINavigationControllerAccessibility *)&v22 _navigationBarSizeForViewController:v10 proposedHeight:v7 allowRubberBandStretch:a4];
    double v5 = v18;
    double v6 = v19;
    goto LABEL_10;
  }
  _Block_object_dispose(&v35, 8);

LABEL_10:
  double v20 = v5;
  double v21 = v6;
  result.height = v21;
  result.width = v20;
  return result;
}

@end