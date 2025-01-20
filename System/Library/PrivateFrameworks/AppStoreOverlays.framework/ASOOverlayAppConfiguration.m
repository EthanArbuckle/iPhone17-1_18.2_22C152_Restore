@interface ASOOverlayAppConfiguration
+ (BOOL)supportsSecureCoding;
- (ASOOverlayAppConfiguration)initWithAppIdentifier:(id)a3 position:(int64_t)a4;
- (ASOOverlayAppConfiguration)initWithCoder:(id)a3;
- (ASOOverlayAppConfiguration)initWithStorage:(id)a3;
- (BOOL)userDismissible;
- (NSMutableDictionary)storage;
- (NSString)appIdentifier;
- (NSString)campaignToken;
- (NSString)description;
- (NSString)latestReleaseID;
- (NSString)productVariantID;
- (NSString)providerToken;
- (id)additionalValueForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)position;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalValue:(id)a3 forKey:(id)a4;
- (void)setAppIdentifier:(id)a3;
- (void)setCampaignToken:(id)a3;
- (void)setLatestReleaseID:(id)a3;
- (void)setPosition:(int64_t)a3;
- (void)setProductVariantID:(id)a3;
- (void)setProviderToken:(id)a3;
- (void)setUserDismissible:(BOOL)a3;
@end

@implementation ASOOverlayAppConfiguration

- (ASOOverlayAppConfiguration)initWithAppIdentifier:(id)a3 position:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASOOverlayAppConfiguration;
  v7 = [(ASOOverlayAppConfiguration *)&v11 init];
  if (v7)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    storage = v7->_storage;
    v7->_storage = v8;

    [(ASOOverlayAppConfiguration *)v7 setAppIdentifier:v6];
    [(ASOOverlayAppConfiguration *)v7 setPosition:a4];
  }

  return v7;
}

- (ASOOverlayAppConfiguration)initWithStorage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASOOverlayAppConfiguration;
  id v6 = [(ASOOverlayAppConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_storage, a3);
  }

  return v7;
}

- (ASOOverlayAppConfiguration)initWithCoder:(id)a3
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
  v8 = objc_msgSend(v4, "setWithArray:", v7, v12, v13, v14, v15);
  objc_super v9 = [v5 decodeObjectOfClasses:v8 forKey:@"ASOOverlayConfigurationStorageKey"];

  v10 = [(ASOOverlayAppConfiguration *)self initWithStorage:v9];
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(ASOOverlayAppConfiguration *)self storage];
  uint64_t v6 = (void *)[v5 mutableCopy];
  v7 = (void *)[v4 initWithStorage:v6];

  return v7;
}

- (void)setAppIdentifier:(id)a3
{
}

- (NSString)appIdentifier
{
  return (NSString *)[(ASOOverlayAppConfiguration *)self additionalValueForKey:@"ASOOverlayConfigurationParameterAppIdentifier"];
}

- (void)setCampaignToken:(id)a3
{
}

- (NSString)campaignToken
{
  return (NSString *)[(ASOOverlayAppConfiguration *)self additionalValueForKey:@"ASOOverlayConfigurationParameterCampaignToken"];
}

- (void)setProviderToken:(id)a3
{
}

- (NSString)providerToken
{
  return (NSString *)[(ASOOverlayAppConfiguration *)self additionalValueForKey:@"ASOOverlayConfigurationParameterProviderToken"];
}

- (void)setPosition:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(ASOOverlayAppConfiguration *)self setAdditionalValue:v4 forKey:@"ASOOverlayConfigurationParameterPosition"];
}

- (int64_t)position
{
  v2 = [(ASOOverlayAppConfiguration *)self additionalValueForKey:@"ASOOverlayConfigurationParameterPosition"];
  v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)setUserDismissible:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(ASOOverlayAppConfiguration *)self setAdditionalValue:v4 forKey:@"ASOOverlayConfigurationParameterUserDismissible"];
}

- (BOOL)userDismissible
{
  v2 = [(ASOOverlayAppConfiguration *)self additionalValueForKey:@"ASOOverlayConfigurationParameterUserDismissible"];
  v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setLatestReleaseID:(id)a3
{
}

- (NSString)latestReleaseID
{
  return (NSString *)[(ASOOverlayAppConfiguration *)self additionalValueForKey:@"ASOOverlayConfigurationParameterLatestReleaseID"];
}

- (void)setProductVariantID:(id)a3
{
}

- (NSString)productVariantID
{
  return (NSString *)[(ASOOverlayAppConfiguration *)self additionalValueForKey:@"ASOOverlayConfigurationParameterProductVariantID"];
}

- (void)setAdditionalValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ASOOverlayAppConfiguration *)self storage];
  [v8 setValue:v7 forKey:v6];
}

- (id)additionalValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(ASOOverlayAppConfiguration *)self storage];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASOOverlayAppConfiguration *)self storage];
  [v4 encodeObject:v5 forKey:@"ASOOverlayConfigurationStorageKey"];
}

- (NSString)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)ASOOverlayAppConfiguration;
  id v4 = [(ASOOverlayAppConfiguration *)&v9 description];
  id v5 = [(ASOOverlayAppConfiguration *)self storage];
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