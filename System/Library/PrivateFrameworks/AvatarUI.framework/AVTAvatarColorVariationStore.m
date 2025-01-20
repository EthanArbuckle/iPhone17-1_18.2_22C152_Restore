@interface AVTAvatarColorVariationStore
- (AVTAvatarColorVariationStore)init;
- (NSMutableDictionary)colorPresets;
- (id)colorPresetFromColor:(id)a3;
- (id)colorVariationFromColor:(id)a3;
- (id)keyForColor:(id)a3;
- (void)resetValues;
- (void)saveColorPreset:(id)a3 forColor:(id)a4;
@end

@implementation AVTAvatarColorVariationStore

- (AVTAvatarColorVariationStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)AVTAvatarColorVariationStore;
  v2 = [(AVTAvatarColorVariationStore *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    colorPresets = v2->_colorPresets;
    v2->_colorPresets = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)colorVariationFromColor:(id)a3
{
  id v4 = a3;
  v5 = [(AVTAvatarColorVariationStore *)self colorPresetFromColor:v4];
  objc_super v6 = [[AVTCoreModelColorVariation alloc] initWithColor:v4 colorPreset:v5];

  return v6;
}

- (id)colorPresetFromColor:(id)a3
{
  id v4 = a3;
  v5 = [(AVTAvatarColorVariationStore *)self keyForColor:v4];
  objc_super v6 = [(AVTAvatarColorVariationStore *)self colorPresets];
  v7 = [v6 objectForKey:v5];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [v4 baseColorPreset];
  }
  v9 = v8;

  return v9;
}

- (void)saveColorPreset:(id)a3 forColor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(AVTAvatarColorVariationStore *)self colorPresets];
  id v8 = [(AVTAvatarColorVariationStore *)self keyForColor:v6];

  [v9 setValue:v7 forKey:v8];
}

- (id)keyForColor:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = a3;
  unint64_t v5 = [v4 settingKind];
  id v7 = AVTAvatarSettingKindIdentifier(v5, v6);
  id v8 = [v4 identifier];

  id v9 = [v3 stringWithFormat:@"%@-%@", v7, v8];

  return v9;
}

- (void)resetValues
{
  id v2 = [(AVTAvatarColorVariationStore *)self colorPresets];
  [v2 removeAllObjects];
}

- (NSMutableDictionary)colorPresets
{
  return self->_colorPresets;
}

- (void).cxx_destruct
{
}

@end