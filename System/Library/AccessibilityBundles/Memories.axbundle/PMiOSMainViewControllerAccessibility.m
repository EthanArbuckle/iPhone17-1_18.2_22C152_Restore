@interface PMiOSMainViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)editBBItem;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setupBottomToolbar;
- (void)setControlVisibility:(BOOL)a3;
- (void)toggleControlVisibility;
- (void)viewDidLoad;
@end

@implementation PMiOSMainViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PMiOSMainViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PMiOSMainViewController" isKindOfClass:@"MiroPlayerViewController"];
  [v3 validateClass:@"MiroPlayerViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"PMiOSSliderViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMiOSMainViewController", @"moodSlider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMiOSMainViewController", @"durationSlider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMiOSMainViewController", @"editBBItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMiOSMainViewController", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMiOSMainViewController", @"_setupBottomToolbar", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMiOSMainViewController", @"toggleControlVisibility", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMiOSMainViewController", @"setControlVisibility:", "v", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)PMiOSMainViewControllerAccessibility;
  [(PMiOSMainViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PMiOSMainViewControllerAccessibility *)self safeValueForKey:@"moodSlider"];
  MEMORY[0x2455E2920](@"PMiOSSliderViewController");
  if (objc_opt_isKindOfClass()) {
    [v3 _axSetMemoriesEditSliderType:0];
  }
  v4 = [(PMiOSMainViewControllerAccessibility *)self safeValueForKey:@"durationSlider"];
  MEMORY[0x2455E2920](@"PMiOSSliderViewController");
  if (objc_opt_isKindOfClass()) {
    [v4 _axSetMemoriesEditSliderType:1];
  }
  v5 = [(PMiOSMainViewControllerAccessibility *)self safeValueForKeyPath:@"titleLabel"];
  [v5 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

- (id)editBBItem
{
  v5.receiver = self;
  v5.super_class = (Class)PMiOSMainViewControllerAccessibility;
  v2 = [(PMiOSMainViewControllerAccessibility *)&v5 editBBItem];
  id v3 = accessibilityMemoriesLocalizedString(@"edit.button");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

- (void)_setupBottomToolbar
{
  v3.receiver = self;
  v3.super_class = (Class)PMiOSMainViewControllerAccessibility;
  [(PMiOSMainViewControllerAccessibility *)&v3 _setupBottomToolbar];
  [(PMiOSMainViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PMiOSMainViewControllerAccessibility;
  [(PMiOSMainViewControllerAccessibility *)&v5 viewDidLoad];
  objc_super v3 = [(PMiOSMainViewControllerAccessibility *)self safeValueForKey:@"view"];
  v4 = accessibilityMemoriesLocalizedString(@"memory.movie.hint.reveal");
  [v3 setAccessibilityHint:v4];
}

- (void)toggleControlVisibility
{
  v2.receiver = self;
  v2.super_class = (Class)PMiOSMainViewControllerAccessibility;
  [(PMiOSMainViewControllerAccessibility *)&v2 toggleControlVisibility];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)setControlVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PMiOSMainViewControllerAccessibility;
  -[PMiOSMainViewControllerAccessibility setControlVisibility:](&v8, sel_setControlVisibility_);
  objc_super v5 = [(PMiOSMainViewControllerAccessibility *)self safeValueForKey:@"view"];
  if (v3) {
    objc_super v6 = @"memory.movie.hint.hide";
  }
  else {
    objc_super v6 = @"memory.movie.hint.reveal";
  }
  v7 = accessibilityMemoriesLocalizedString(v6);
  [v5 setAccessibilityHint:v7];
}

@end