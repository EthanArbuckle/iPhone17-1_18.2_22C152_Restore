@interface VideosDetailViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateContentInsets;
- (void)viewDidLoad;
@end

@implementation VideosDetailViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosDetailViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosDetailViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosDetailViewController", @"artworkView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosDetailViewController", @"_updateContentInsets", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosDetailViewController", @"shouldFloatHeader", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosDetailViewController", @"childContentScrollView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosDetailViewController", @"headerContainmentView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)VideosDetailViewControllerAccessibility;
  [(VideosDetailViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(VideosDetailViewControllerAccessibility *)self safeValueForKey:@"artworkView"];
  [v3 setIsAccessibilityElement:1];
  v4 = accessibilityLocalizedString(@"video.poster");
  [v3 setAccessibilityLabel:v4];

  v5 = [(VideosDetailViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v5 setAccessibilityIdentifier:@"VideosDetailView"];

  v6 = [(VideosDetailViewControllerAccessibility *)self safeValueForKey:@"headerContainmentView"];
  [v6 setAccessibilityIdentifier:@"AXContainedInCollectionView"];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)VideosDetailViewControllerAccessibility;
  [(VideosDetailViewControllerAccessibility *)&v3 viewDidLoad];
  [(VideosDetailViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_updateContentInsets
{
  char v42 = 0;
  objc_opt_class();
  objc_super v3 = [(VideosDetailViewControllerAccessibility *)self safeValueForKey:@"childContentScrollView"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 contentInset];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v4 contentOffset];
  double v39 = v14;
  double v40 = v13;
  v41.receiver = self;
  v41.super_class = (Class)VideosDetailViewControllerAccessibility;
  [(VideosDetailViewControllerAccessibility *)&v41 _updateContentInsets];
  [v4 contentInset];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  if (UIAccessibilityIsVoiceOverRunning() && v18 == v8 && v16 == v6 && v22 == v12 && v20 == v10) {
    objc_msgSend(v4, "setContentOffset:", v40, v39);
  }
  v26 = (double *)MEMORY[0x263F1D1C0];
  if ([(VideosDetailViewControllerAccessibility *)self safeBoolForKey:@"shouldFloatHeader"])
  {
    double v27 = *v26;
  }
  else
  {
    char v42 = 0;
    objc_opt_class();
    v28 = __UIAccessibilityCastAsClass();
    if (v42) {
      goto LABEL_21;
    }
    v29 = v28;
    v30 = [v28 topLayoutGuide];
    [v30 length];
    double v27 = v31;
  }
  char v42 = 0;
  objc_opt_class();
  v32 = __UIAccessibilityCastAsClass();
  if (v42) {
LABEL_21:
  }
    abort();
  v33 = v32;
  double v34 = v26[1];
  double v35 = v26[3];
  v36 = [v32 bottomLayoutGuide];
  [v36 length];
  double v38 = v37;

  objc_msgSend(v4, "_accessibilitySetVisibleContentInset:", v27, v34, v38, v35);
}

@end