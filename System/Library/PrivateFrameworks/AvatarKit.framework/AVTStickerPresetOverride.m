@interface AVTStickerPresetOverride
+ (id)presetOverrideFromDictionary:(id)a3 forCategoryName:(id)a4;
- (AVTStickerPresetOverride)initWithCategory:(int64_t)a3 presetIdentifier:(id)a4 unless:(id)a5;
- (NSArray)unlessIdentifiers;
- (NSString)presetIdentifier;
- (int64_t)category;
- (void)applyToAvatar:(id)a3 reversionContext:(id)a4;
@end

@implementation AVTStickerPresetOverride

+ (id)presetOverrideFromDictionary:(id)a3 forCategoryName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [AVTStickerPresetOverride alloc];
  uint64_t v8 = AVTPresetCategoryFromString(v5);

  v9 = [v6 objectForKeyedSubscript:@"value"];
  v10 = [v6 objectForKeyedSubscript:@"unless"];

  v11 = [(AVTStickerPresetOverride *)v7 initWithCategory:v8 presetIdentifier:v9 unless:v10];
  return v11;
}

- (AVTStickerPresetOverride)initWithCategory:(int64_t)a3 presetIdentifier:(id)a4 unless:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AVTStickerPresetOverride;
  v11 = [(AVTStickerPresetOverride *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_category = a3;
    objc_storeStrong((id *)&v11->_unlessIdentifiers, a5);
    objc_storeStrong((id *)&v12->_presetIdentifier, a4);
  }

  return v12;
}

- (void)applyToAvatar:(id)a3 reversionContext:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v20;
    int64_t v8 = [(AVTStickerPresetOverride *)self category];
    id v9 = [(AVTStickerPresetOverride *)self presetIdentifier];
    id v10 = +[AVTPreset presetWithCategory:v8 identifier:v9];

    v11 = objc_msgSend(v7, "presetForCategory:", -[AVTStickerPresetOverride category](self, "category"));
    v12 = [(AVTStickerPresetOverride *)self unlessIdentifiers];
    v13 = [v11 identifier];
    char v14 = [v12 containsObject:v13];

    if ((v14 & 1) == 0)
    {
      if (v6)
      {
        v15 = [AVTStickerPresetOverride alloc];
        int64_t v16 = [(AVTStickerPresetOverride *)self category];
        v17 = [v11 identifier];
        v18 = [(AVTStickerPresetOverride *)self unlessIdentifiers];
        v19 = [(AVTStickerPresetOverride *)v15 initWithCategory:v16 presetIdentifier:v17 unless:v18];

        [v6 savePresetOverride:v19];
      }
      objc_msgSend(v7, "setPreset:forCategory:animated:", v10, -[AVTStickerPresetOverride category](self, "category"), 0);
    }
  }
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)presetIdentifier
{
  return self->_presetIdentifier;
}

- (NSArray)unlessIdentifiers
{
  return self->_unlessIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlessIdentifiers, 0);
  objc_storeStrong((id *)&self->_presetIdentifier, 0);
}

@end