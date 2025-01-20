@interface DOCTagAppearance
+ (id)infoCollection;
+ (id)makerUI;
+ (id)pickerList;
+ (id)renderingAppearance;
@end

@implementation DOCTagAppearance

+ (id)renderingAppearance
{
  if (renderingAppearance_onceToken != -1) {
    dispatch_once(&renderingAppearance_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)renderingAppearance_shared;

  return v2;
}

uint64_t __39__DOCTagAppearance_renderingAppearance__block_invoke()
{
  renderingAppearance_shared = [[DOCTagRenderingAppearance alloc] _init];

  return MEMORY[0x270F9A758]();
}

+ (id)pickerList
{
  if (pickerList_onceToken != -1) {
    dispatch_once(&pickerList_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)pickerList_shared;

  return v2;
}

uint64_t __30__DOCTagAppearance_pickerList__block_invoke()
{
  id v0 = [[DOCTagListCellAppearance alloc] _init];
  uint64_t v1 = pickerList_shared;
  pickerList_shared = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)makerUI
{
  if (makerUI_onceToken != -1) {
    dispatch_once(&makerUI_onceToken, &__block_literal_global_2_1);
  }
  v2 = (void *)makerUI_shared;

  return v2;
}

uint64_t __27__DOCTagAppearance_makerUI__block_invoke()
{
  id v0 = [[DOCTagMakerAppearance alloc] _init];
  uint64_t v1 = makerUI_shared;
  makerUI_shared = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)infoCollection
{
  if (infoCollection_onceToken != -1) {
    dispatch_once(&infoCollection_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)infoCollection_shared;

  return v2;
}

uint64_t __34__DOCTagAppearance_infoCollection__block_invoke()
{
  id v0 = [[DOCTagInfoCollectionAppearance alloc] _init];
  uint64_t v1 = infoCollection_shared;
  infoCollection_shared = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end