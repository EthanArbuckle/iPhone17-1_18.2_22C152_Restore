@interface JFXEffectAsset
+ (id)firstAssetInAssets:(id)a3 matchingFilterAttributes:(id)a4;
- (BOOL)contentUpdateAvailable;
- (BOOL)isEqual:(id)a3;
- (JFXEffectAsset)initWithAssetID:(id)a3 URL:(id)a4 copyOfAttributes:(id)a5;
- (JFXEffectAsset)initWithAssetID:(id)a3 URL:(id)a4 copyOfAttributes:(id)a5 contentUpdateAvailable:(BOOL)a6;
- (JFXEffectAssetAttributes)attributes;
- (NSString)assetID;
- (NSURL)localURL;
- (id)description;
- (unint64_t)hash;
@end

@implementation JFXEffectAsset

- (JFXEffectAsset)initWithAssetID:(id)a3 URL:(id)a4 copyOfAttributes:(id)a5 contentUpdateAvailable:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)JFXEffectAsset;
  v14 = [(JFXEffectAsset *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_assetID, a3);
    objc_storeStrong((id *)&v15->_localURL, a4);
    uint64_t v16 = [v13 copy];
    attributes = v15->_attributes;
    v15->_attributes = (JFXEffectAssetAttributes *)v16;

    v15->_contentUpdateAvailable = a6;
  }

  return v15;
}

- (JFXEffectAsset)initWithAssetID:(id)a3 URL:(id)a4 copyOfAttributes:(id)a5
{
  return [(JFXEffectAsset *)self initWithAssetID:a3 URL:a4 copyOfAttributes:a5 contentUpdateAvailable:0];
}

- (id)description
{
  v3 = NSString;
  v4 = [(JFXEffectAsset *)self assetID];
  uint64_t v5 = [(JFXEffectAsset *)self localURL];
  v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = @"Remote";
  }
  v8 = [(JFXEffectAsset *)self attributes];
  v9 = [v3 stringWithFormat:@"assetID %@ URL %@ attributes %@", v4, v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (JFXEffectAsset *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = [(JFXEffectAsset *)v5 assetID];
    v7 = [(JFXEffectAsset *)self assetID];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(JFXEffectAsset *)self assetID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (NSURL)localURL
{
  return self->_localURL;
}

- (JFXEffectAssetAttributes)attributes
{
  return self->_attributes;
}

- (BOOL)contentUpdateAvailable
{
  return self->_contentUpdateAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_localURL, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

+ (id)firstAssetInAssets:(id)a3 matchingFilterAttributes:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "attributes", (void)v15);
        char v13 = [v12 isMatchingFilterAttributes:v6];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

@end