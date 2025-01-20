@interface SRSuggestionsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)didShowSuggestionsForSuggestionsView:(id)a3;
@end

@implementation SRSuggestionsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SRSuggestionsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)didShowSuggestionsForSuggestionsView:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)SRSuggestionsViewControllerAccessibility;
  id v3 = a3;
  [(SRSuggestionsViewControllerAccessibility *)&v21 didShowSuggestionsForSuggestionsView:v3];
  v4 = objc_msgSend(MEMORY[0x263F1C920], "mainScreen", v21.receiver, v21.super_class);
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v3 accessibilityFrame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  v23.origin.x = v14;
  v23.origin.y = v16;
  v23.size.width = v18;
  v23.size.height = v20;
  LODWORD(v3) = CGRectIntersectsRect(v22, v23);

  if (v3) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

@end