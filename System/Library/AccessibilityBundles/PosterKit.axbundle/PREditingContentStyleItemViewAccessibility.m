@interface PREditingContentStyleItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PREditingContentStyleItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PREditingContentStyleItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditingContentStyleItemView", @"localizedName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditingContentStyleItemView", @"contentStyleCoordinator", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditingPosterContentStyleCoordinator", @"style", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRPosterContentDiscreteColorsStyle", @"colors", "@", 0);
  [v3 validateClass:@"PRPosterContentVibrantMaterialStyle"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __64__PREditingContentStyleItemViewAccessibility_accessibilityValue__block_invoke;
  v21 = &unk_265145F80;
  v22 = self;
  v23 = &v24;
  AXPerformSafeBlock();
  id v3 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  v4 = [(PREditingContentStyleItemViewAccessibility *)self safeValueForKey:@"contentStyleCoordinator"];
  v5 = [v4 safeValueForKey:@"style"];

  v6 = [v5 safeArrayForKey:@"colors"];
  LOBYTE(v24) = 0;
  objc_opt_class();
  v7 = [v6 firstObject];
  v8 = __UIAccessibilityCastAsClass();

  if ((_BYTE)v24) {
    goto LABEL_19;
  }
  v9 = AXColorStringForColor();
  if (!v3)
  {
    NSClassFromString(&cfstr_Prposterconten_0.isa);
    if (objc_opt_isKindOfClass())
    {
      accessibilityLocalizedString(@"editing.item.view.vibrant.color");
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if ((unint64_t)[v6 count] < 2)
    {
      if (v9)
      {
        id v10 = v9;
      }
      else
      {
        v17.receiver = self;
        v17.super_class = (Class)PREditingContentStyleItemViewAccessibility;
        id v10 = [(PREditingContentStyleItemViewAccessibility *)&v17 accessibilityValue];
      }
      goto LABEL_15;
    }
    LOBYTE(v24) = 0;
    objc_opt_class();
    v11 = [v6 lastObject];
    v12 = __UIAccessibilityCastAsClass();

    if (!(_BYTE)v24)
    {
      v13 = AXColorStringForColor();
      if ([v9 isEqualToString:v13]) {
        accessibilityLocalizedString(@"editing.item.view.multi.color.gradient");
      }
      else {
      v14 = accessibilityLocalizedString(@"editing.item.view.multi.color.gradient.between.colors");
      }
      v15 = AXCFormattedString();

      goto LABEL_16;
    }
LABEL_19:
    abort();
  }
  id v10 = v3;
LABEL_15:
  v15 = v10;
LABEL_16:

  return v15;
}

uint64_t __64__PREditingContentStyleItemViewAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) localizedName];

  return MEMORY[0x270F9A758]();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PREditingContentStyleItemViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PREditingContentStyleItemViewAccessibility *)&v3 accessibilityTraits];
}

@end