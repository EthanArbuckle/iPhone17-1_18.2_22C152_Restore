@interface MFCaptionLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MFCaptionLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFCaptionLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MFCaptionLabel" isKindOfClass:@"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFCaptionLabel", @"_chevronAttributedString", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v10 = MEMORY[0x263EF8330];
  v11 = self;
  AXPerformSafeBlock();
  id v4 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  v5 = objc_msgSend(v3, "attributedText", v10, 3221225472, __49__MFCaptionLabelAccessibility_accessibilityLabel__block_invoke, &unk_2650A3F00, v11, &v12);
  v6 = [v5 string];
  v7 = [v4 string];

  v8 = [v6 stringByReplacingOccurrencesOfString:v7 withString:&stru_26F41A030];

  return v8;
}

uint64_t __49__MFCaptionLabelAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _chevronAttributedString];

  return MEMORY[0x270F9A758]();
}

@end