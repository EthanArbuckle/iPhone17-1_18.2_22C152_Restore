@interface AVTCoreModelCategory
- (AVTCoreModelCategory)initWithPresetCategory:(int64_t)a3 presets:(id)a4 tags:(id)a5 rows:(id)a6 pairing:(id)a7;
- (AVTCoreModelPairing)pairing;
- (NSArray)pickers;
- (NSArray)presets;
- (NSDictionary)tags;
- (id)description;
- (int64_t)presetCategory;
@end

@implementation AVTCoreModelCategory

- (AVTCoreModelCategory)initWithPresetCategory:(int64_t)a3 presets:(id)a4 tags:(id)a5 rows:(id)a6 pairing:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)AVTCoreModelCategory;
  v16 = [(AVTCoreModelCategory *)&v25 init];
  v17 = v16;
  if (v16)
  {
    v16->_presetCategory = a3;
    uint64_t v18 = [v12 copy];
    presets = v17->_presets;
    v17->_presets = (NSArray *)v18;

    uint64_t v20 = [v14 copy];
    pickers = v17->_pickers;
    v17->_pickers = (NSArray *)v20;

    uint64_t v22 = [v13 copy];
    tags = v17->_tags;
    v17->_tags = (NSDictionary *)v22;

    objc_storeStrong((id *)&v17->_pairing, a7);
  }

  return v17;
}

- (id)description
{
  v15.receiver = self;
  v15.super_class = (Class)AVTCoreModelCategory;
  v3 = [(AVTCoreModelCategory *)&v15 description];
  v4 = (void *)[v3 mutableCopy];

  [(AVTCoreModelCategory *)self presetCategory];
  v5 = AVTPresetCategoryToString();
  [v4 appendFormat:@" AVTPresetCategory: %@\n", v5];

  v6 = [(AVTCoreModelCategory *)self pairing];

  if (v6)
  {
    v7 = [(AVTCoreModelCategory *)self pairing];
    [v7 pairedCategory];
    v8 = AVTPresetCategoryToString();
    [v4 appendFormat:@" paired with: %@\n", v8];
  }
  v9 = [(AVTCoreModelCategory *)self pickers];
  v10 = objc_msgSend(v9, "avt_description");
  [v4 appendFormat:@" rows: %@\n", v10];

  v11 = [(AVTCoreModelCategory *)self presets];
  id v12 = objc_msgSend(v11, "avt_description");
  [v4 appendFormat:@" presets: %@\n", v12];

  id v13 = (void *)[v4 copy];
  return v13;
}

- (NSArray)presets
{
  return self->_presets;
}

- (NSDictionary)tags
{
  return self->_tags;
}

- (NSArray)pickers
{
  return self->_pickers;
}

- (int64_t)presetCategory
{
  return self->_presetCategory;
}

- (AVTCoreModelPairing)pairing
{
  return self->_pairing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairing, 0);
  objc_storeStrong((id *)&self->_pickers, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_presets, 0);
}

@end