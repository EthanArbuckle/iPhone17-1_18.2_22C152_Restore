@interface SPUITextFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHoverTypingShouldAdjustDockedMode;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)automationElements;
- (id)axCompletionStrings;
@end

@implementation SPUITextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SPUITextField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SPUICompletionStringView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SPUICompletionStringView", @"labelsStackView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SPUICompletionStringView", @"completionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SPUICompletionStringView", @"bridgeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SPUICompletionStringView", @"extensionLabel", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(SPUITextFieldAccessibility *)self axCompletionStrings];
  if ([v3 count])
  {
    v4 = [v3 objectAtIndexedSubscript:0];
    v5 = [v4 safeValueForKey:@"labelsStackView"];

    v6 = [v5 safeValueForKey:@"completionLabel"];
    v7 = [v6 safeStringForKey:@"text"];

    v8 = accessibilityLocalizedString(v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SPUITextFieldAccessibility;
    v8 = [(SPUITextFieldAccessibility *)&v10 accessibilityLabel];
  }

  return v8;
}

- (id)accessibilityValue
{
  unint64_t v3 = AXRequestingClient();
  if (v3 <= 7 && ((1 << v3) & 0x86) != 0)
  {
    v25.receiver = self;
    v25.super_class = (Class)SPUITextFieldAccessibility;
    v4 = [(SPUITextFieldAccessibility *)&v25 accessibilityValue];
  }
  else
  {
    v5 = [(SPUITextFieldAccessibility *)self axCompletionStrings];
    if ([v5 count])
    {
      v6 = [v5 objectAtIndexedSubscript:0];
      v7 = [v6 safeValueForKey:@"labelsStackView"];

      v8 = [v7 safeValueForKey:@"completionLabel"];
      v9 = [v8 safeStringForKey:@"text"];

      objc_super v10 = [v7 safeValueForKey:@"bridgeLabel"];
      v11 = [v10 safeStringForKey:@"text"];

      v12 = [v7 safeValueForKey:@"extensionLabel"];
      v13 = [v12 safeStringForKey:@"text"];

      v23.receiver = self;
      v23.super_class = (Class)SPUITextFieldAccessibility;
      v4 = [(SPUITextFieldAccessibility *)&v23 accessibilityValue];
      if ([v7 _accessibilityViewIsVisible]
        && [v9 length]
        && [v11 length]
        && [v13 length])
      {
        v14 = __UIAXStringForVariables();
        v15 = [(SPUITextFieldAccessibility *)self safeStringForKey:@"text", v13, @"__AXStringForVariablesSentinel"];
        char v16 = [v15 isEqualToString:v9];

        if ((v16 & 1) == 0)
        {
          uint64_t v17 = __UIAXStringForVariables();

          v14 = (void *)v17;
        }
        v18 = NSString;
        v19 = accessibilityLocalizedString(@"search.suggestion.format");
        v20 = objc_msgSend(v18, "localizedStringWithFormat:", v19, v14);

        uint64_t v21 = __UIAXStringForVariables();

        v4 = (void *)v21;
      }
    }
    else
    {
      v24.receiver = self;
      v24.super_class = (Class)SPUITextFieldAccessibility;
      v4 = [(SPUITextFieldAccessibility *)&v24 accessibilityValue];
    }
  }

  return v4;
}

- (id)accessibilityIdentifier
{
  return @"SpotlightSearchField";
}

- (BOOL)_accessibilityHoverTypingShouldAdjustDockedMode
{
  return 1;
}

- (id)automationElements
{
  v8.receiver = self;
  v8.super_class = (Class)SPUITextFieldAccessibility;
  unint64_t v3 = [(SPUITextFieldAccessibility *)&v8 automationElements];
  uint64_t v4 = [v3 mutableCopy];
  if (v4)
  {
    v5 = (void *)v4;
  }
  else
  {
    v5 = [MEMORY[0x263EFF980] array];

    if (!v5)
    {
      v5 = [MEMORY[0x263EFF980] array];
    }
  }
  v6 = [(SPUITextFieldAccessibility *)self axCompletionStrings];
  [v5 axSafelyAddObjectsFromArray:v6];

  return v5;
}

- (id)axCompletionStrings
{
  if (axCompletionStrings_onceToken != -1) {
    dispatch_once(&axCompletionStrings_onceToken, &__block_literal_global_0);
  }

  return (id)[(SPUITextFieldAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_309];
}

uint64_t __49__SPUITextFieldAccessibility_axCompletionStrings__block_invoke()
{
  uint64_t result = MEMORY[0x2456626E0](@"SPUICompletionStringView");
  axCompletionStrings_completionView = result;
  return result;
}

uint64_t __49__SPUITextFieldAccessibility_axCompletionStrings__block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

@end