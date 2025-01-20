@interface AVTAvatarEditorColorsState
- (AVTAvatarColorVariationStore)variationStore;
- (AVTAvatarEditorColorsState)initWithVariationStore:(id)a3;
- (NSMutableDictionary)colorStorage;
- (id)selectedColorForCategory:(int64_t)a3 destinationIndex:(int64_t)a4;
- (id)selectedColorPresetForCategory:(int64_t)a3 destinationIndex:(int64_t)a4;
- (id)storageForCategory:(int64_t)a3;
- (void)setColorStorage:(id)a3;
- (void)setSelectedColorPreset:(id)a3 forCoreModelColor:(id)a4;
@end

@implementation AVTAvatarEditorColorsState

- (AVTAvatarEditorColorsState)initWithVariationStore:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVTAvatarEditorColorsState;
  v6 = [(AVTAvatarEditorColorsState *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_variationStore, a3);
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    colorStorage = v7->_colorStorage;
    v7->_colorStorage = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (id)selectedColorForCategory:(int64_t)a3 destinationIndex:(int64_t)a4
{
  v6 = [(AVTAvatarEditorColorsState *)self colorStorage];
  v7 = [NSNumber numberWithInteger:a3];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  v9 = [NSNumber numberWithInteger:a4];
  v10 = [v8 objectForKeyedSubscript:v9];

  return v10;
}

- (id)selectedColorPresetForCategory:(int64_t)a3 destinationIndex:(int64_t)a4
{
  id v5 = [(AVTAvatarEditorColorsState *)self selectedColorForCategory:a3 destinationIndex:a4];
  v6 = [v5 baseColorPreset];
  v7 = [(AVTAvatarEditorColorsState *)self variationStore];

  if (v7)
  {
    uint64_t v8 = [(AVTAvatarEditorColorsState *)self variationStore];
    uint64_t v9 = [v8 colorPresetFromColor:v5];

    v6 = (void *)v9;
  }

  return v6;
}

- (void)setSelectedColorPreset:(id)a3 forCoreModelColor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(AVTAvatarEditorColorsState *)self variationStore];
  [v8 saveColorPreset:v7 forColor:v6];

  uint64_t v9 = [v6 baseColorPreset];
  -[AVTAvatarEditorColorsState storageForCategory:](self, "storageForCategory:", [v9 category]);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "settingKind"));
  [v11 setObject:v6 forKeyedSubscript:v10];
}

- (id)storageForCategory:(int64_t)a3
{
  id v5 = [(AVTAvatarEditorColorsState *)self colorStorage];
  id v6 = [NSNumber numberWithInteger:a3];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v7 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v8 = [(AVTAvatarEditorColorsState *)self colorStorage];
    uint64_t v9 = [NSNumber numberWithInteger:a3];
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
  return v7;
}

- (AVTAvatarColorVariationStore)variationStore
{
  return self->_variationStore;
}

- (NSMutableDictionary)colorStorage
{
  return self->_colorStorage;
}

- (void)setColorStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorStorage, 0);
  objc_storeStrong((id *)&self->_variationStore, 0);
}

@end