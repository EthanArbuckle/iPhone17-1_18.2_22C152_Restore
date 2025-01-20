@interface AVTCoreModelPreset
+ (id)tagSetFromPreset:(id)a3;
- (AVTCoreModelPreset)initWithPreset:(id)a3;
- (AVTCoreModelPreset)initWithPreset:(id)a3 isDefaultPreset:(BOOL)a4;
- (AVTPreset)preset;
- (BOOL)isDefaultPreset;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)tags;
- (NSString)identifier;
- (NSString)localizedName;
- (NSString)localizedPairedName;
- (id)copyForPairedCategory:(int64_t)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation AVTCoreModelPreset

+ (id)tagSetFromPreset:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  v5 = [v3 dictionary];
  v6 = [v4 tags];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__AVTCoreModelPreset_tagSetFromPreset___block_invoke;
  v10[3] = &unk_263FF13B8;
  id v11 = v5;
  id v7 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];

  v8 = (void *)[v7 copy];
  return v8;
}

void __39__AVTCoreModelPreset_tagSetFromPreset___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = (void *)MEMORY[0x263EFF9B0];
  id v6 = a2;
  id v7 = [v5 orderedSetWithArray:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (AVTCoreModelPreset)initWithPreset:(id)a3
{
  return [(AVTCoreModelPreset *)self initWithPreset:a3 isDefaultPreset:0];
}

- (AVTCoreModelPreset)initWithPreset:(id)a3 isDefaultPreset:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AVTCoreModelPreset;
  v8 = [(AVTCoreModelPreset *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_preset, a3);
    uint64_t v10 = [(id)objc_opt_class() tagSetFromPreset:v7];
    tags = v9->_tags;
    v9->_tags = (NSDictionary *)v10;

    v9->_defaultPreset = a4;
  }

  return v9;
}

- (id)copyForPairedCategory:(int64_t)a3
{
  id v4 = (void *)MEMORY[0x263F296A8];
  v5 = [(AVTCoreModelPreset *)self identifier];
  id v6 = [v4 presetWithCategory:a3 identifier:v5];

  id v7 = [[AVTCoreModelPreset alloc] initWithPreset:v6];
  return v7;
}

- (NSString)identifier
{
  v2 = [(AVTCoreModelPreset *)self preset];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (NSString)localizedName
{
  v2 = [(AVTCoreModelPreset *)self preset];
  v3 = [v2 localizedName];

  return (NSString *)v3;
}

- (NSString)localizedPairedName
{
  v2 = [(AVTCoreModelPreset *)self preset];
  if (objc_opt_respondsToSelector()) {
    [v2 localizedPairedName];
  }
  else {
  v3 = [v2 localizedName];
  }

  return (NSString *)v3;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)AVTCoreModelPreset;
  v3 = [(AVTCoreModelPreset *)&v10 description];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(AVTCoreModelPreset *)self localizedName];
  [v4 appendFormat:@" name: %@", v5];

  id v6 = [(AVTCoreModelPreset *)self identifier];
  [v4 appendFormat:@" identifier: %@", v6];

  id v7 = [(AVTCoreModelPreset *)self tags];
  [v4 appendFormat:@" tags: %@", v7];

  if ([(AVTCoreModelPreset *)self isDefaultPreset]) {
    [v4 appendString:@" (default)"];
  }
  v8 = (void *)[v4 copy];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (AVTCoreModelPreset *)a3;
  if (v5 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [(AVTCoreModelPreset *)self identifier];
      if (v6
        || ([(AVTCoreModelPreset *)v5 identifier], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v7 = [(AVTCoreModelPreset *)self identifier];
        v8 = [(AVTCoreModelPreset *)v5 identifier];
        char v9 = [v7 isEqual:v8];

        if (v6)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        char v9 = 1;
      }

      goto LABEL_11;
    }
    char v9 = 0;
  }
LABEL_12:

  return v9;
}

- (unint64_t)hash
{
  v2 = [(AVTCoreModelPreset *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSDictionary)tags
{
  return self->_tags;
}

- (BOOL)isDefaultPreset
{
  return self->_defaultPreset;
}

- (AVTPreset)preset
{
  return self->_preset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preset, 0);
  objc_storeStrong((id *)&self->_tags, 0);
}

@end