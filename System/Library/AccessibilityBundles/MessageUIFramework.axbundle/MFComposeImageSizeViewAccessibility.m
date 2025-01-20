@interface MFComposeImageSizeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
- (void)setSizeDescription:(id)a3 forScale:(unsigned int)a4;
@end

@implementation MFComposeImageSizeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFComposeImageSizeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setSizeDescription:(id)a3 forScale:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MFComposeImageSizeViewAccessibility;
  [(MFComposeImageSizeViewAccessibility *)&v18 setSizeDescription:v6 forScale:v4];
  if (setSizeDescription_forScale__onceToken != -1) {
    dispatch_once(&setSizeDescription_forScale__onceToken, &__block_literal_global_1);
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__0;
  v12[4] = __Block_byref_object_dispose__0;
  id v13 = 0;
  AXPerformSafeBlock();
  v7 = [(MFComposeImageSizeViewAccessibility *)self safeValueForKey:@"_segmentedControl"];
  v8 = __UIAccessibilitySafeClass();

  unint64_t v9 = v15[3];
  if (v9 < [v8 numberOfSegments])
  {
    v10 = [v8 imageForSegmentAtIndex:v15[3]];
    v11 = __UIAXStringForVariables();
    objc_msgSend(v10, "setAccessibilityLabel:", v11, v6, @"__AXStringForVariablesSentinel");
  }
  _Block_object_dispose(v12, 8);

  _Block_object_dispose(&v14, 8);
}

void __67__MFComposeImageSizeViewAccessibility_setSizeDescription_forScale___block_invoke()
{
  v10[4] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Mfcomposeimage.isa)];
  v1 = [v0 localizedStringForKey:@"SMALL_SIZE_BAR_TITLE" value:&stru_26F41A030 table:@"Main"];
  v10[0] = v1;
  v2 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Mfcomposeimage.isa)];
  v3 = [v2 localizedStringForKey:@"MEDIUM_SIZE_BAR_TITLE" value:&stru_26F41A030 table:@"Main"];
  v10[1] = v3;
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Mfcomposeimage.isa)];
  v5 = [v4 localizedStringForKey:@"LARGE_SIZE_BAR_TITLE" value:&stru_26F41A030 table:@"Main"];
  v10[2] = v5;
  id v6 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Mfcomposeimage.isa)];
  v7 = [v6 localizedStringForKey:@"ACTUAL_SIZE_BAR_TITLE" value:&stru_26F41A030 table:@"Main"];
  v10[3] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];
  unint64_t v9 = (void *)setSizeDescription_forScale__scaleLabels;
  setSizeDescription_forScale__scaleLabels = v8;
}

uint64_t __67__MFComposeImageSizeViewAccessibility_setSizeDescription_forScale___block_invoke_293(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _scaleLabelIndexForScale:*(unsigned int *)(a1 + 56)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [(id)setSizeDescription_forScale__scaleLabels objectAtIndex:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];

  return MEMORY[0x270F9A758]();
}

- (BOOL)accessibilityElementsHidden
{
  v2 = [(MFComposeImageSizeViewAccessibility *)self safeValueForKey:@"alpha"];
  [v2 floatValue];
  BOOL v4 = v3 != 1.0;

  return v4;
}

@end