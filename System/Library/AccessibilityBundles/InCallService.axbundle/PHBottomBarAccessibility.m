@interface PHBottomBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOnlyComparesByXAxis;
- (BOOL)shouldGroupAccessibilityChildren;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)buttonPressed:(id)a3;
- (void)layoutSubviews;
- (void)refreshCustomizedActionTypeTitles;
- (void)setAnimating:(BOOL)a3;
- (void)setCurrentState:(int64_t)a3 animated:(BOOL)a4 animationCompletionBlock:(id)a5;
@end

@implementation PHBottomBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHBottomBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHBottomBar", @"supplementalBottomRightButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHBottomBar", @"refreshCustomizedActionTypeTitles", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHBottomBar", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHBottomBar", @"buttonPressed:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHBottomBar", @"setAnimating:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHBottomBar", @"animating", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHBottomBar", @"supplementalBottomLeftButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHBottomBar", @"setCurrentState: animated: animationCompletionBlock:", "v", "q", "B", "@?", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)PHBottomBarAccessibility;
  [(PHBottomBarAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(PHBottomBarAccessibility *)self safeValueForKey:@"supplementalBottomRightButton"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 accessibilityLabel];
  objc_msgSend(v4, "setIsAccessibilityElement:", objc_msgSend(v5, "length") != 0);

  objc_opt_class();
  v6 = [(PHBottomBarAccessibility *)self safeValueForKey:@"supplementalBottomLeftButton"];
  v7 = __UIAccessibilityCastAsClass();

  v8 = [v7 accessibilityLabel];
  objc_msgSend(v7, "setIsAccessibilityElement:", objc_msgSend(v8, "length") != 0);
}

- (void)setAnimating:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PHBottomBarAccessibility *)self safeBoolForKey:@"animating"];
  v8.receiver = self;
  v8.super_class = (Class)PHBottomBarAccessibility;
  [(PHBottomBarAccessibility *)&v8 setAnimating:v3];
  if (v5) {
    BOOL v6 = !v3;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"AXPHBottomBarStoppedAnimatingNotification" object:self];
  }
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

- (void)refreshCustomizedActionTypeTitles
{
  v3.receiver = self;
  v3.super_class = (Class)PHBottomBarAccessibility;
  [(PHBottomBarAccessibility *)&v3 refreshCustomizedActionTypeTitles];
  [(PHBottomBarAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PHBottomBarAccessibility;
  [(PHBottomBarAccessibility *)&v3 layoutSubviews];
  [(PHBottomBarAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)setCurrentState:(int64_t)a3 animated:(BOOL)a4 animationCompletionBlock:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)PHBottomBarAccessibility;
  [(PHBottomBarAccessibility *)&v6 setCurrentState:a3 animated:a4 animationCompletionBlock:a5];
  [(PHBottomBarAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)buttonPressed:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PHBottomBarAccessibility;
  [(PHBottomBarAccessibility *)&v3 buttonPressed:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end