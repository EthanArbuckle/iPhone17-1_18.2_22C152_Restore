@interface AXSettings_DBSLargeTextExplanationViewOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (AXSettings_DBSLargeTextExplanationViewOverride)initWithSpecifier:(id)a3;
@end

@implementation AXSettings_DBSLargeTextExplanationViewOverride

+ (id)safeCategoryTargetClassName
{
  return @"DBSLargeTextExplanationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"DBSLargeTextExplanationView" hasInstanceVariable:@"_bodyExampleLabel" withType:"UILabel"];
  [v3 validateClass:@"DBSLargeTextExplanationView" hasInstanceVariable:@"_bodyExampleTextView" withType:"UITextView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DBSLargeTextExplanationView", @"initWithSpecifier:", "@", 0);
}

- (AXSettings_DBSLargeTextExplanationViewOverride)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXSettings_DBSLargeTextExplanationViewOverride;
  v5 = [(AXSettings_DBSLargeTextExplanationViewOverride *)&v13 initWithSpecifier:v4];
  if (v5)
  {
    objc_opt_class();
    v6 = [(AXSettings_DBSLargeTextExplanationViewOverride *)v5 safeValueForKey:@"_bodyExampleLabel"];
    v7 = __UIAccessibilityCastAsClass();

    v8 = sharedBFFStyle();
    [v8 applyThemeToLabel:v7];

    objc_opt_class();
    v9 = [(AXSettings_DBSLargeTextExplanationViewOverride *)v5 safeValueForKey:@"_bodyExampleTextView"];
    v10 = __UIAccessibilityCastAsClass();

    v11 = sharedBFFStyle();
    [v11 applyThemeToTextView:v10];
  }
  return v5;
}

@end