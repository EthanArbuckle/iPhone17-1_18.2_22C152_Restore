@interface HMAsset
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMAsset)initWithCoder:(id)a3;
- (HMAsset)initWithIdentifier:(id)a3 metadata:(id)a4 resourceURL:(id)a5;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)metadata;
- (NSString)identifier;
- (NSURL)resourceURL;
@end

@implementation HMAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceURL, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSURL)resourceURL
{
  return self->_resourceURL;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (HMAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.assetMetadata"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.assetURL"];

  v8 = [(HMAsset *)self initWithIdentifier:v5 metadata:v6 resourceURL:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMAsset *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HMAsset *)self identifier];
      v7 = [(HMAsset *)v5 identifier];
      if (HMFEqualObjects())
      {
        v8 = [(HMAsset *)self metadata];
        v9 = [(HMAsset *)v5 metadata];
        if (HMFEqualObjects())
        {
          v10 = [(HMAsset *)self resourceURL];
          v11 = [(HMAsset *)v5 resourceURL];
          char v12 = HMFEqualObjects();
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = [(HMAsset *)self identifier];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA60];
    v5 = [(HMAsset *)self identifier];
    v6 = [v4 dictionaryWithObject:v5 forKey:@"kIdentifierKey"];

    v7 = [(HMAsset *)self metadata];

    if (v7)
    {
      v8 = [(HMAsset *)self metadata];
      [v6 setObject:v8 forKeyedSubscript:@"kAssetMetadataKey"];
    }
    v9 = [(HMAsset *)self resourceURL];

    if (v9)
    {
      v10 = [(HMAsset *)self resourceURL];
      v11 = [v10 absoluteString];
      [v6 setObject:v11 forKeyedSubscript:@"kAssetURLKey"];
    }
    char v12 = (void *)[v6 copy];
  }
  else
  {
    char v12 = 0;
  }

  return (NSDictionary *)v12;
}

- (HMAsset)initWithIdentifier:(id)a3 metadata:(id)a4 resourceURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMAsset;
  v11 = [(HMAsset *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    metadata = v11->_metadata;
    v11->_metadata = (NSDictionary *)v14;

    uint64_t v16 = [v10 copy];
    resourceURL = v11->_resourceURL;
    v11->_resourceURL = (NSURL *)v16;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end