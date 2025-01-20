@interface SKOverlayAppConfiguration
- (BOOL)userDismissible;
- (NSString)appIdentifier;
- (NSString)campaignToken;
- (NSString)customProductPageIdentifier;
- (NSString)latestReleaseID;
- (NSString)providerToken;
- (SKOverlayAppConfiguration)initWithAppIdentifier:(NSString *)appIdentifier position:(SKOverlayPosition)position;
- (SKOverlayAppConfiguration)initWithBacking:(id)a3;
- (SKOverlayPosition)position;
- (id)_impressionDictFromImpression:(id)a3;
- (id)_init;
- (id)additionalValueForKey:(NSString *)key;
- (void)setAdImpression:(SKAdImpression *)impression;
- (void)setAdditionalValue:(id)value forKey:(NSString *)key;
- (void)setAppIdentifier:(NSString *)appIdentifier;
- (void)setCampaignToken:(NSString *)campaignToken;
- (void)setCustomProductPageIdentifier:(NSString *)customProductPageIdentifier;
- (void)setLatestReleaseID:(NSString *)latestReleaseID;
- (void)setPosition:(SKOverlayPosition)position;
- (void)setProviderToken:(NSString *)providerToken;
- (void)setUserDismissible:(BOOL)userDismissible;
@end

@implementation SKOverlayAppConfiguration

- (SKOverlayAppConfiguration)initWithAppIdentifier:(NSString *)appIdentifier position:(SKOverlayPosition)position
{
  v6 = (objc_class *)MEMORY[0x1E4F4BD20];
  v7 = appIdentifier;
  v8 = (void *)[[v6 alloc] initWithAppIdentifier:v7 position:position != SKOverlayPositionBottom];

  v11.receiver = self;
  v11.super_class = (Class)SKOverlayAppConfiguration;
  v9 = [(SKOverlayConfiguration *)&v11 initWithBacking:v8];

  return v9;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)SKOverlayAppConfiguration;
  return [(SKOverlayConfiguration *)&v3 _init];
}

- (SKOverlayAppConfiguration)initWithBacking:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKOverlayAppConfiguration;
  return [(SKOverlayConfiguration *)&v4 initWithBacking:a3];
}

- (void)setAppIdentifier:(NSString *)appIdentifier
{
  objc_super v4 = appIdentifier;
  id v5 = [(SKOverlayConfiguration *)self _backing];
  [v5 setAppIdentifier:v4];
}

- (NSString)appIdentifier
{
  v2 = [(SKOverlayConfiguration *)self _backing];
  objc_super v3 = [v2 appIdentifier];

  return (NSString *)v3;
}

- (void)setCampaignToken:(NSString *)campaignToken
{
  objc_super v4 = campaignToken;
  id v5 = [(SKOverlayConfiguration *)self _backing];
  [v5 setCampaignToken:v4];
}

- (NSString)campaignToken
{
  v2 = [(SKOverlayConfiguration *)self _backing];
  objc_super v3 = [v2 campaignToken];

  return (NSString *)v3;
}

- (void)setProviderToken:(NSString *)providerToken
{
  objc_super v4 = providerToken;
  id v5 = [(SKOverlayConfiguration *)self _backing];
  [v5 setProviderToken:v4];
}

- (NSString)providerToken
{
  v2 = [(SKOverlayConfiguration *)self _backing];
  objc_super v3 = [v2 providerToken];

  return (NSString *)v3;
}

- (void)setCustomProductPageIdentifier:(NSString *)customProductPageIdentifier
{
  objc_super v4 = customProductPageIdentifier;
  id v5 = [(SKOverlayConfiguration *)self _backing];
  [v5 setProductVariantID:v4];
}

- (NSString)customProductPageIdentifier
{
  v2 = [(SKOverlayConfiguration *)self _backing];
  objc_super v3 = [v2 productVariantID];

  return (NSString *)v3;
}

- (void)setLatestReleaseID:(NSString *)latestReleaseID
{
  objc_super v4 = latestReleaseID;
  id v5 = [(SKOverlayConfiguration *)self _backing];
  [v5 setLatestReleaseID:v4];
}

- (NSString)latestReleaseID
{
  v2 = [(SKOverlayConfiguration *)self _backing];
  objc_super v3 = [v2 latestReleaseID];

  return (NSString *)v3;
}

- (void)setPosition:(SKOverlayPosition)position
{
  id v4 = [(SKOverlayConfiguration *)self _backing];
  [v4 setPosition:position != SKOverlayPositionBottom];
}

- (SKOverlayPosition)position
{
  v2 = [(SKOverlayConfiguration *)self _backing];
  SKOverlayPosition v3 = (unint64_t)([v2 position] != 0);

  return v3;
}

- (void)setUserDismissible:(BOOL)userDismissible
{
  BOOL v3 = userDismissible;
  id v4 = [(SKOverlayConfiguration *)self _backing];
  [v4 setUserDismissible:v3];
}

- (BOOL)userDismissible
{
  v2 = [(SKOverlayConfiguration *)self _backing];
  char v3 = [v2 userDismissible];

  return v3;
}

- (void)setAdditionalValue:(id)value forKey:(NSString *)key
{
  v6 = key;
  id v7 = value;
  id v8 = [(SKOverlayConfiguration *)self _backing];
  [v8 setAdditionalValue:v7 forKey:v6];
}

- (id)additionalValueForKey:(NSString *)key
{
  id v4 = key;
  id v5 = [(SKOverlayConfiguration *)self _backing];
  v6 = [v5 additionalValueForKey:v4];

  return v6;
}

- (void)setAdImpression:(SKAdImpression *)impression
{
  if (impression)
  {
    id v4 = -[SKOverlayAppConfiguration _impressionDictFromImpression:](self, "_impressionDictFromImpression:");
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__SKOverlayAppConfiguration_setAdImpression___block_invoke;
    v5[3] = &unk_1E5FA9DA0;
    v5[4] = self;
    [v4 enumerateKeysAndObjectsUsingBlock:v5];
  }
}

uint64_t __45__SKOverlayAppConfiguration_setAdImpression___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setAdditionalValue:a3 forKey:a2];
}

- (id)_impressionDictFromImpression:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 signature];
  [v4 setObject:v5 forKeyedSubscript:@"adNetworkAttributionSignature"];

  v6 = [v3 adCampaignIdentifier];
  [v4 setObject:v6 forKeyedSubscript:@"adNetworkCampaignId"];

  id v7 = [v3 sourceIdentifier];
  [v4 setObject:v7 forKeyedSubscript:@"sourceIdentifier"];

  id v8 = [v3 adNetworkIdentifier];
  [v4 setObject:v8 forKeyedSubscript:@"adNetworkId"];

  v9 = [v3 adImpressionIdentifier];
  v10 = [v9 lowercaseString];
  [v4 setObject:v10 forKeyedSubscript:@"adNetworkNonce"];

  objc_super v11 = [v3 timestamp];
  [v4 setObject:v11 forKeyedSubscript:@"adNetworkImpressionTimestamp"];

  v12 = [v3 version];
  [v4 setObject:v12 forKeyedSubscript:@"adNetworkPayloadVersion"];

  v13 = [v3 sourceAppStoreItemIdentifier];

  [v4 setObject:v13 forKeyedSubscript:@"adNetworkSourceAppStoreIdentifier"];

  return v4;
}

@end