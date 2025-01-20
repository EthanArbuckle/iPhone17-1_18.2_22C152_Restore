@interface HMDAsset
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMDAsset)initWithCoder:(id)a3;
- (HMDAsset)initWithIdentifier:(id)a3 metadata:(id)a4 resourceURL:(id)a5;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)metadata;
- (NSString)identifier;
- (NSURL)resourceURL;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDAsset

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

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  v4 = [(HMDAsset *)self identifier];
  [v10 encodeObject:v4 forKey:@"HM.identifier"];

  v5 = [(HMDAsset *)self metadata];

  if (v5)
  {
    v6 = [(HMDAsset *)self metadata];
    [v10 encodeObject:v6 forKey:@"HM.assetMetadata"];
  }
  v7 = [(HMDAsset *)self resourceURL];

  if (v7)
  {
    v8 = [(HMDAsset *)self resourceURL];
    v9 = [v8 absoluteString];
    [v10 encodeObject:v9 forKey:@"HM.assetURL"];
  }
}

- (HMDAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.assetMetadata"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.assetURL"];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  }
  else
  {
    v8 = 0;
  }
  v9 = [(HMDAsset *)self initWithIdentifier:v5 metadata:v6 resourceURL:v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDAsset *)a3;
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
      v6 = [(HMDAsset *)self identifier];
      v7 = [(HMDAsset *)v5 identifier];
      if (HMFEqualObjects())
      {
        v8 = [(HMDAsset *)self metadata];
        v9 = [(HMDAsset *)v5 metadata];
        if (HMFEqualObjects())
        {
          id v10 = [(HMDAsset *)self resourceURL];
          v11 = [(HMDAsset *)v5 resourceURL];
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
  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = [(HMDAsset *)self identifier];
  v5 = [v3 dictionaryWithObject:v4 forKey:@"kIdentifierKey"];

  v6 = [(HMDAsset *)self metadata];

  if (v6)
  {
    v7 = [(HMDAsset *)self metadata];
    [v5 setObject:v7 forKeyedSubscript:@"kAssetMetadataKey"];
  }
  v8 = [(HMDAsset *)self resourceURL];

  if (v8)
  {
    v9 = [(HMDAsset *)self resourceURL];
    id v10 = [v9 absoluteString];
    [v5 setObject:v10 forKeyedSubscript:@"kAssetURLKey"];
  }
  v11 = (void *)[v5 copy];

  return (NSDictionary *)v11;
}

- (HMDAsset)initWithIdentifier:(id)a3 metadata:(id)a4 resourceURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDAsset;
  v11 = [(HMDAsset *)&v19 init];
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