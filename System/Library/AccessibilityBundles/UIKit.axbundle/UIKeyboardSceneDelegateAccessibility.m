@interface UIKeyboardSceneDelegateAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_axPostScreenChange;
- (void)orderInWithAnimationStyle:(id)a3;
- (void)orderOutWithAnimationStyle:(id)a3;
- (void)setInputViews:(id)a3 animationStyle:(id)a4;
@end

@implementation UIKeyboardSceneDelegateAccessibility

void __69__UIKeyboardSceneDelegateAccessibility_setInputViews_animationStyle___block_invoke(id *a1)
{
  argument[2] = a1;
  argument[1] = a1;
  argument[0] = (id)[a1[4] safeValueForKey:@"inputView"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], argument[0]);
  }
  else {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21A08]);
  }
  objc_storeStrong(argument, 0);
}

- (void)setInputViews:(id)a3 animationStyle:(id)a4
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  v11.receiver = v14;
  v11.super_class = (Class)UIKeyboardSceneDelegateAccessibility;
  [(UIKeyboardSceneDelegateAccessibility *)&v11 setInputViews:location[0] animationStyle:v12];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __69__UIKeyboardSceneDelegateAccessibility_setInputViews_animationStyle___block_invoke;
  v9 = &unk_2650ADF18;
  id v10 = location[0];
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardSceneDelegate";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  int v7 = location;
  id v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v5 = "@";
  v3 = @"UIKeyboardSceneDelegate";
  v4 = "v";
  [location[0] validateClass:"@" hasInstanceMethod:"@" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"orderOutWithAnimationStyle:", v4, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"orderInWithAnimationStyle:", v4, v5, 0);
  [location[0] validateClass:@"UIInputViewAnimationStyle" hasProperty:@"duration" withType:"d"];
  [location[0] validateClass:@"UIInputViewSet" hasProperty:@"inputView" withType:v5];
  objc_storeStrong(v7, v6);
}

- (void)orderInWithAnimationStyle:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6.receiver = v8;
  v6.super_class = (Class)UIKeyboardSceneDelegateAccessibility;
  [(UIKeyboardSceneDelegateAccessibility *)&v6 orderInWithAnimationStyle:location[0]];
  v4 = v8;
  id v5 = (id)[location[0] safeValueForKey:@"duration"];
  [v5 floatValue];
  [(UIKeyboardSceneDelegateAccessibility *)v4 performSelector:sel__axPostScreenChange withObject:0 afterDelay:v3];

  objc_storeStrong(location, 0);
}

- (void)orderOutWithAnimationStyle:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIKeyboardSceneDelegateAccessibility;
  [(UIKeyboardSceneDelegateAccessibility *)&v3 orderOutWithAnimationStyle:location[0]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  objc_storeStrong(location, 0);
}

- (void)_axPostScreenChange
{
  unsigned int v2 = MEMORY[0x2455E6B20]();
  MEMORY[0x2455E6B10](0);
  MEMORY[0x2455E6B10](v2);
}

@end