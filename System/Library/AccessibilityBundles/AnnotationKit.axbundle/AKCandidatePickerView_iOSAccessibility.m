@interface AKCandidatePickerView_iOSAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_createButtonsWithBlurStyle:(int64_t)a3;
- (void)_selectBackground:(id)a3 animated:(BOOL)a4;
@end

@implementation AKCandidatePickerView_iOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKCandidatePickerView_iOS";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKCandidatePickerView_iOS", @"_createButtonsWithBlurStyle:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKCandidatePickerView_iOS", @"_selectBackground: animated:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKCandidatePickerView_iOS", @"annotations", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKCandidatePickerView_iOS", @"buttons", "@", 0);
}

- (void)_createButtonsWithBlurStyle:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)AKCandidatePickerView_iOSAccessibility;
  [(AKCandidatePickerView_iOSAccessibility *)&v12 _createButtonsWithBlurStyle:a3];
  objc_opt_class();
  v4 = [(AKCandidatePickerView_iOSAccessibility *)self safeValueForKey:@"annotations"];
  v5 = __UIAccessibilityCastAsClass();

  char v11 = 0;
  objc_opt_class();
  v6 = [(AKCandidatePickerView_iOSAccessibility *)self safeValueForKey:@"buttons"];
  v7 = __UIAccessibilityCastAsClass();

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__AKCandidatePickerView_iOSAccessibility__createButtonsWithBlurStyle___block_invoke;
  v9[3] = &unk_265103F70;
  id v10 = v5;
  id v8 = v5;
  [v7 enumerateObjectsUsingBlock:v9];
}

- (void)_selectBackground:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)AKCandidatePickerView_iOSAccessibility;
  id v5 = a3;
  [(AKCandidatePickerView_iOSAccessibility *)&v6 _selectBackground:v5 animated:v4];
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x263F1CEE8], v6.receiver, v6.super_class);
}

@end