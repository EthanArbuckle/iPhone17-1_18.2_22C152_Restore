@interface SFEntitledAssetConfig
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)language;
- (NSString)regionId;
- (SFEntitledAssetConfig)initWithAssetType:(unint64_t)a3 language:(id)a4 regionId:(id)a5;
- (SFEntitledAssetConfig)initWithCoder:(id)a3;
- (SFEntitledAssetConfig)initWithLanguage:(id)a3 assetType:(unint64_t)a4;
- (SFEntitledAssetConfig)initWithLanguage:(id)a3 task:(id)a4;
- (SFEntitledAssetConfig)initWithLanguage:(id)a3 taskHint:(int64_t)a4;
- (unint64_t)assetType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFEntitledAssetConfig

- (SFEntitledAssetConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"SFEntitledAssetConfig::assetType"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFEntitledAssetConfig::language"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFEntitledAssetConfig::regionId"];

  v8 = [(SFEntitledAssetConfig *)self initWithAssetType:v5 language:v6 regionId:v7];
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionId, 0);

  objc_storeStrong((id *)&self->_language, 0);
}

- (unint64_t)assetType
{
  return self->_assetType;
}

- (NSString)language
{
  return self->_language;
}

- (SFEntitledAssetConfig)initWithAssetType:(unint64_t)a3 language:(id)a4 regionId:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SFEntitledAssetConfig;
  v10 = [(SFEntitledAssetConfig *)&v20 init];
  v11 = v10;
  if (v10)
  {
    v10->_assetType = a3;
    if (a3 == 7)
    {
      uint64_t v12 = +[SFUtilities languageCodeForLocaleIdentifier:v8];
    }
    else
    {
      uint64_t v13 = SFReplacementLocaleCodeForLocaleIdentifier(v8);
      v14 = (void *)v13;
      if (v13) {
        v15 = (void *)v13;
      }
      else {
        v15 = v8;
      }
      objc_storeStrong((id *)&v11->_language, v15);

      uint64_t v12 = +[SFUtilities stringByReplacingUnderscoresWithHyphens:v11->_language];
    }
    language = v11->_language;
    v11->_language = (NSString *)v12;

    uint64_t v17 = [v9 copy];
    regionId = v11->_regionId;
    v11->_regionId = (NSString *)v17;
  }
  return v11;
}

- (SFEntitledAssetConfig)initWithLanguage:(id)a3 assetType:(unint64_t)a4
{
  return [(SFEntitledAssetConfig *)self initWithAssetType:a4 language:a3 regionId:0];
}

- (SFEntitledAssetConfig)initWithLanguage:(id)a3 taskHint:(int64_t)a4
{
  uint64_t v6 = SFEntitledAssetTypeForTaskHint(a4);

  return [(SFEntitledAssetConfig *)self initWithAssetType:v6 language:a3 regionId:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t assetType = self->_assetType;
  id v5 = a3;
  [v5 encodeInteger:assetType forKey:@"SFEntitledAssetConfig::assetType"];
  [v5 encodeObject:self->_language forKey:@"SFEntitledAssetConfig::language"];
  [v5 encodeObject:self->_regionId forKey:@"SFEntitledAssetConfig::regionId"];
}

- (NSString)regionId
{
  return self->_regionId;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFEntitledAssetConfig *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t assetType = self->_assetType;
      if (assetType != [(SFEntitledAssetConfig *)v5 assetType])
      {
        LOBYTE(v10) = 1;
LABEL_16:
        char v11 = v10 ^ 1;

        goto LABEL_17;
      }
      language = self->_language;
      id v8 = [(SFEntitledAssetConfig *)v5 language];
      if ([language isEqualToString:v8])
      {
        regionId = self->_regionId;
        if (regionId)
        {
          language = [(SFEntitledAssetConfig *)v5 regionId];
          if (![(NSString *)regionId isEqualToString:language])
          {
            LOBYTE(v10) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v12 = [(SFEntitledAssetConfig *)v5 regionId];
        if (!v12)
        {
          LOBYTE(v10) = 0;
          if (!regionId) {
            goto LABEL_15;
          }
          goto LABEL_14;
        }
        uint64_t v13 = (void *)v12;
        v14 = [(SFEntitledAssetConfig *)v5 regionId];
        int v10 = [v14 isEqualToString:self->_regionId] ^ 1;

        if (regionId) {
LABEL_14:
        }
      }
      else
      {
        LOBYTE(v10) = 1;
      }
LABEL_15:

      goto LABEL_16;
    }
    char v11 = 0;
  }
LABEL_17:

  return v11;
}

- (SFEntitledAssetConfig)initWithLanguage:(id)a3 task:(id)a4
{
  return [(SFEntitledAssetConfig *)self initWithAssetType:3 language:a3 regionId:0];
}

@end