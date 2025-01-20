@interface ASOOverlayAppClipConfiguration
+ (BOOL)supportsSecureCoding;
- (ASOOverlayAppClipConfiguration)initWithCoder:(id)a3;
- (ASOOverlayAppClipConfiguration)initWithPosition:(int64_t)a3;
- (ASOOverlayAppClipConfiguration)initWithStorage:(id)a3;
- (NSMutableDictionary)storage;
- (NSString)campaignToken;
- (NSString)description;
- (NSString)latestReleaseID;
- (NSString)productVariantID;
- (NSString)providerToken;
- (id)additionalValueForKey:(id)a3;
- (id)additionalValueForKey:(id)a3 serviceContext:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)position;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalValue:(id)a3 forKey:(id)a4;
- (void)setCampaignToken:(id)a3;
- (void)setLatestReleaseID:(id)a3;
- (void)setPosition:(int64_t)a3;
- (void)setProductVariantID:(id)a3;
- (void)setProviderToken:(id)a3;
@end

@implementation ASOOverlayAppClipConfiguration

- (ASOOverlayAppClipConfiguration)initWithPosition:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ASOOverlayAppClipConfiguration;
  v4 = [(ASOOverlayAppClipConfiguration *)&v8 init];
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    storage = v4->_storage;
    v4->_storage = v5;

    [(ASOOverlayAppClipConfiguration *)v4 setPosition:a3];
  }
  return v4;
}

- (ASOOverlayAppClipConfiguration)initWithStorage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASOOverlayAppClipConfiguration;
  v6 = [(ASOOverlayAppClipConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_storage, a3);
  }

  return v7;
}

- (ASOOverlayAppClipConfiguration)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t Class = ASOSignpostSpanGetClass(v15, v6);
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:5];
  objc_super v8 = objc_msgSend(v4, "setWithArray:", v7, v12, v13, v14, v15);
  objc_super v9 = [v5 decodeObjectOfClasses:v8 forKey:@"ASOOverlayConfigurationStorageKey"];

  v10 = [(ASOOverlayAppClipConfiguration *)self initWithStorage:v9];
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(ASOOverlayAppClipConfiguration *)self storage];
  uint64_t v6 = (void *)[v5 mutableCopy];
  v7 = (void *)[v4 initWithStorage:v6];

  return v7;
}

- (void)setCampaignToken:(id)a3
{
}

- (NSString)campaignToken
{
  return (NSString *)[(ASOOverlayAppClipConfiguration *)self additionalValueForKey:@"ASOOverlayConfigurationParameterCampaignToken"];
}

- (void)setProviderToken:(id)a3
{
}

- (NSString)providerToken
{
  return (NSString *)[(ASOOverlayAppClipConfiguration *)self additionalValueForKey:@"ASOOverlayConfigurationParameterProviderToken"];
}

- (void)setPosition:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(ASOOverlayAppClipConfiguration *)self setAdditionalValue:v4 forKey:@"ASOOverlayConfigurationParameterPosition"];
}

- (int64_t)position
{
  v2 = [(ASOOverlayAppClipConfiguration *)self additionalValueForKey:@"ASOOverlayConfigurationParameterPosition"];
  v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)setLatestReleaseID:(id)a3
{
}

- (NSString)latestReleaseID
{
  return (NSString *)[(ASOOverlayAppClipConfiguration *)self additionalValueForKey:@"ASOOverlayConfigurationParameterLatestReleaseID"];
}

- (void)setProductVariantID:(id)a3
{
}

- (NSString)productVariantID
{
  return (NSString *)[(ASOOverlayAppClipConfiguration *)self additionalValueForKey:@"ASOOverlayConfigurationParameterProductVariantID"];
}

- (void)setAdditionalValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ASOOverlayAppClipConfiguration *)self storage];
  [v8 setValue:v7 forKey:v6];
}

- (id)additionalValueForKey:(id)a3
{
  return [(ASOOverlayAppClipConfiguration *)self additionalValueForKey:a3 serviceContext:0];
}

- (id)additionalValueForKey:(id)a3 serviceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 hasPrefix:@"ASOOverlayConfigurationPrivate"]
    || v7 && [v7 hasPrivateEntitlement])
  {
    id v8 = [(ASOOverlayAppClipConfiguration *)self storage];
    objc_super v9 = [v8 objectForKey:v6];
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASOOverlayAppClipConfiguration *)self storage];
  [v4 encodeObject:v5 forKey:@"ASOOverlayConfigurationStorageKey"];
}

- (NSString)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)ASOOverlayAppClipConfiguration;
  id v4 = [(ASOOverlayAppClipConfiguration *)&v9 description];
  id v5 = [(ASOOverlayAppClipConfiguration *)self storage];
  id v6 = [v5 description];
  id v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return (NSString *)v7;
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
}

@end