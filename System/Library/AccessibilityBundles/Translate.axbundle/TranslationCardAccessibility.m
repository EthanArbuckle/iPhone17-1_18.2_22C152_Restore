@interface TranslationCardAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (void)senseTapped:(id)a3;
@end

@implementation TranslationCardAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SequoiaTranslator.TranslationCard";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SequoiaTranslator.TranslationCard", @"_axSourceLanguage", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SequoiaTranslator.TranslationCard", @"_axSourceLanguageTranslationResult", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SequoiaTranslator.TranslationCard", @"_axTargetLanguage", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SequoiaTranslator.TranslationCard", @"_axTargetLanguageTranslationResult", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SequoiaTranslator.TranslationCard", @"_axTranslationIsFavorited", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SequoiaTranslator.TranslationCard", @"_axCanPerformLookupAction", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SequoiaTranslator.TranslationCard", @"_axPerformFavoriteAction", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SequoiaTranslator.TranslationCard", @"_axPerformSpeakTranslationAction", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SequoiaTranslator.TranslationCard", @"_axPerformLookupAction", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SequoiaTranslator.TranslationCard", @"_axSenseHeader", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SequoiaTranslator.TranslationCard", @"senseTapped:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = (void *)MEMORY[0x263F21660];
  v4 = [(TranslationCardAccessibility *)self safeValueForKey:@"_axSourceLanguageTranslationResult"];
  v5 = [v3 axAttributedStringWithString:v4];

  v6 = [(TranslationCardAccessibility *)self safeValueForKey:@"_axSourceLocale"];
  v7 = (void *)MEMORY[0x263F217A8];
  [v5 setAttribute:v6 forKey:*MEMORY[0x263F217A8]];

  v8 = (void *)MEMORY[0x263F21660];
  v9 = [(TranslationCardAccessibility *)self safeValueForKey:@"_axTargetLanguageTranslationResult"];
  v10 = [v8 axAttributedStringWithString:v9];

  v11 = [(TranslationCardAccessibility *)self safeValueForKey:@"_axTargetLocale"];
  [v10 setAttribute:v11 forKey:*v7];

  v12 = [(TranslationCardAccessibility *)self safeValueForKey:@"_axSourceLanguage"];
  v13 = [(TranslationCardAccessibility *)self safeValueForKey:@"_axTargetLanguage"];
  if ([(TranslationCardAccessibility *)self safeBoolForKey:@"_axTranslationIsFavorited"])v14 = @"favorited"; {
  else
  }
    v14 = &stru_26F816588;
  v17 = accessibilityLocalizedString(v14);
  v15 = __UIAXStringForVariables();

  return v15;
}

- (id)accessibilityCustomActions
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc(MEMORY[0x263F1C390]);
  if ([(TranslationCardAccessibility *)self safeBoolForKey:@"_axTranslationIsFavorited"])v5 = @"remove.favorite.action"; {
  else
  }
    v5 = @"favorite.action";
  v6 = accessibilityLocalizedString(v5);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __58__TranslationCardAccessibility_accessibilityCustomActions__block_invoke;
  v17[3] = &unk_265160D60;
  v17[4] = self;
  v7 = (void *)[v4 initWithName:v6 actionHandler:v17];
  [v3 addObject:v7];

  id v8 = objc_alloc(MEMORY[0x263F1C390]);
  v9 = accessibilityLocalizedString(@"speak.translation.action");
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __58__TranslationCardAccessibility_accessibilityCustomActions__block_invoke_3;
  v16[3] = &unk_265160D60;
  v16[4] = self;
  v10 = (void *)[v8 initWithName:v9 actionHandler:v16];
  [v3 addObject:v10];

  if ([(TranslationCardAccessibility *)self safeBoolForKey:@"_axCanPerformLookupAction"])
  {
    id v11 = objc_alloc(MEMORY[0x263F1C390]);
    v12 = accessibilityLocalizedString(@"lookup.word.action");
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __58__TranslationCardAccessibility_accessibilityCustomActions__block_invoke_5;
    v15[3] = &unk_265160D60;
    v15[4] = self;
    v13 = (void *)[v11 initWithName:v12 actionHandler:v15];
    [v3 addObject:v13];
  }

  return v3;
}

uint64_t __58__TranslationCardAccessibility_accessibilityCustomActions__block_invoke()
{
  return 1;
}

uint64_t __58__TranslationCardAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axPerformFavoriteAction];
}

uint64_t __58__TranslationCardAccessibility_accessibilityCustomActions__block_invoke_3()
{
  return 1;
}

uint64_t __58__TranslationCardAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axPerformSpeakTranslationAction];
}

uint64_t __58__TranslationCardAccessibility_accessibilityCustomActions__block_invoke_5()
{
  return 1;
}

uint64_t __58__TranslationCardAccessibility_accessibilityCustomActions__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axPerformLookupAction];
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = objc_opt_new();
  id v4 = [(TranslationCardAccessibility *)self safeUIViewForKey:@"_axSenseHeader"];
  [v3 addObject:v4];

  v5 = [(TranslationCardAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_0];
  [v3 addObjectsFromArray:v5];
  v6 = [(TranslationCardAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_344];
  [v3 addObjectsFromArray:v6];

  return v3;
}

uint64_t __70__TranslationCardAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245667B00](@"SequoiaTranslator.SenseRow");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __70__TranslationCardAccessibility__accessibilitySupplementaryFooterViews__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)senseTapped:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TranslationCardAccessibility;
  [(TranslationCardAccessibility *)&v8 senseTapped:a3];
  id v4 = (void *)MEMORY[0x263F21660];
  v5 = [(TranslationCardAccessibility *)self safeValueForKey:@"_axTargetLanguageTranslationResult"];
  v6 = [v4 axAttributedStringWithString:v5];

  v7 = [(TranslationCardAccessibility *)self safeValueForKey:@"_axTargetLocale"];
  [v6 setAttribute:v7 forKey:*MEMORY[0x263F217A8]];

  UIAccessibilitySpeakAndDoNotBeInterrupted();
}

@end