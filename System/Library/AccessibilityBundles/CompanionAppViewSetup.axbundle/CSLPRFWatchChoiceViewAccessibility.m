@interface CSLPRFWatchChoiceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CSLPRFWatchChoiceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSLPRFWatchChoiceView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CSLPRFWatchChoiceView" hasInstanceVariable:@"_button" withType:"CSLPRFAppViewChoiceButton"];
  [v3 validateClass:@"CSLPRFAppViewChoiceButton" isKindOfClass:@"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSLPRFWatchChoiceView", @"choice", "q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(CSLPRFWatchChoiceViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_0];
  v4 = v3;
  if (!v3)
  {
    uint64_t v6 = [(CSLPRFWatchChoiceViewAccessibility *)self safeIntegerForKey:@"choice"];
    if (v6 == 1)
    {
      v7 = @"CHOICE_GRID_VIEW";
    }
    else
    {
      if (v6 != 2)
      {
LABEL_8:
        v10.receiver = self;
        v10.super_class = (Class)CSLPRFWatchChoiceViewAccessibility;
        uint64_t v5 = [(CSLPRFWatchChoiceViewAccessibility *)&v10 accessibilityLabel];
        goto LABEL_9;
      }
      v7 = @"CHOICE_LIST_VIEW";
    }
    v8 = accessibilityLocalizedString(v7);
    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  uint64_t v5 = [v3 accessibilityLabel];
LABEL_9:
  v8 = (void *)v5;
LABEL_10:

  return v8;
}

uint64_t __56__CSLPRFWatchChoiceViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)accessibilityTraits
{
  char v10 = 0;
  objc_opt_class();
  id v3 = [(CSLPRFWatchChoiceViewAccessibility *)self safeValueForKey:@"_button"];
  v4 = __UIAccessibilityCastAsClass();

  if (v4)
  {
    int v5 = [v4 isSelected];
    uint64_t v6 = [v4 accessibilityTraits];
    unint64_t v7 = v6;
    if (v5) {
      unint64_t v7 = *MEMORY[0x263F1CF38] | v6;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CSLPRFWatchChoiceViewAccessibility;
    unint64_t v7 = [(CSLPRFWatchChoiceViewAccessibility *)&v9 accessibilityTraits];
  }

  return v7;
}

@end