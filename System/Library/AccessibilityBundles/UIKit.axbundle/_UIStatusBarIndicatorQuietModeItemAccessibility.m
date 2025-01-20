@interface _UIStatusBarIndicatorQuietModeItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation _UIStatusBarIndicatorQuietModeItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarIndicatorQuietModeItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarIndicatorQuietModeItem", @"focusName", "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)accessibilityLabel
{
  v7 = self;
  v6[1] = (id)a2;
  id v3 = objc_alloc(MEMORY[0x263F21660]);
  id v4 = (id)[(_UIStatusBarIndicatorQuietModeItemAccessibility *)v7 safeStringForKey:@"focusName"];
  v6[0] = (id)objc_msgSend(v3, "initWithString:");

  [v6[0] setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21838]];
  id v5 = v6[0];
  objc_storeStrong(v6, 0);

  return v5;
}

@end