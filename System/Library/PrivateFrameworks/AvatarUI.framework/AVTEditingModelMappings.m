@interface AVTEditingModelMappings
+ (id)framingModeForCameraIdentifier:(id)a3;
+ (id)paletteCategories;
+ (id)presetCategoryForColorPaletteName:(id)a3;
+ (id)presetCategoryFromCategoryName:(id)a3;
@end

@implementation AVTEditingModelMappings

+ (id)presetCategoryFromCategoryName:(id)a3
{
  v3 = NSNumber;
  uint64_t v4 = AVTPresetCategoryFromString();
  return (id)[v3 numberWithInteger:v4];
}

+ (id)framingModeForCameraIdentifier:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (id)presetCategoryForColorPaletteName:(id)a3
{
  id v3 = NSNumber;
  uint64_t v4 = AVTColorCategoryFromString();
  return (id)[v3 numberWithInteger:v4];
}

+ (id)paletteCategories
{
  id v3 = [MEMORY[0x263EFF980] arrayWithCapacity:40];
  AVTEnumeratePresetCategories();

  return v3;
}

void __44__AVTEditingModelMappings_paletteCategories__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithInteger:a2];
  [v2 addObject:v3];
}

@end