@interface AVTMutableEditingModelColors
- (AVTMutableEditingModelColors)initWithStorage:(id)a3 variationStore:(id)a4;
- (AVTMutableEditingModelColors)initWithVariationStore:(id)a3;
- (NSMutableDictionary)mutableStorage;
- (void)setColor:(id)a3 forSettingKind:(id)a4 identifier:(id)a5;
@end

@implementation AVTMutableEditingModelColors

- (AVTMutableEditingModelColors)initWithStorage:(id)a3 variationStore:(id)a4
{
  return [(AVTMutableEditingModelColors *)self initWithVariationStore:a4];
}

- (AVTMutableEditingModelColors)initWithVariationStore:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  v6 = [v4 dictionary];
  v9.receiver = self;
  v9.super_class = (Class)AVTMutableEditingModelColors;
  v7 = [(AVTEditingModelColors *)&v9 initWithStorage:v6 variationStore:v5];

  if (v7) {
    objc_storeStrong((id *)&v7->_mutableStorage, v6);
  }

  return v7;
}

- (void)setColor:(id)a3 forSettingKind:(id)a4 identifier:(id)a5
{
  int64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  id v15 = a3;
  id v9 = a5;
  v10 = [(AVTMutableEditingModelColors *)self mutableStorage];
  v11 = AVTAvatarSettingKindIdentifier(var0, var1);
  v12 = [v10 objectForKeyedSubscript:v11];

  if (!v12)
  {
    v12 = [MEMORY[0x263EFF9A0] dictionary];
    v13 = [(AVTMutableEditingModelColors *)self mutableStorage];
    v14 = AVTAvatarSettingKindIdentifier(var0, var1);
    [v13 setObject:v12 forKeyedSubscript:v14];
  }
  [v12 setObject:v15 forKeyedSubscript:v9];
}

- (NSMutableDictionary)mutableStorage
{
  return self->_mutableStorage;
}

- (void).cxx_destruct
{
}

@end