@interface SKOverlayAppClipConfiguration
- (NSString)campaignToken;
- (NSString)customProductPageIdentifier;
- (NSString)latestReleaseID;
- (NSString)providerToken;
- (SKOverlayAppClipConfiguration)initWithBacking:(id)a3;
- (SKOverlayAppClipConfiguration)initWithPosition:(SKOverlayPosition)position;
- (SKOverlayPosition)position;
- (id)_init;
- (id)additionalValueForKey:(NSString *)key;
- (void)setAdditionalValue:(id)value forKey:(NSString *)key;
- (void)setCampaignToken:(NSString *)campaignToken;
- (void)setCustomProductPageIdentifier:(NSString *)customProductPageIdentifier;
- (void)setLatestReleaseID:(NSString *)latestReleaseID;
- (void)setPosition:(SKOverlayPosition)position;
- (void)setProviderToken:(NSString *)providerToken;
@end

@implementation SKOverlayAppClipConfiguration

- (SKOverlayAppClipConfiguration)initWithPosition:(SKOverlayPosition)position
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F4BD18]) initWithPosition:position != SKOverlayPositionBottom];
  v7.receiver = self;
  v7.super_class = (Class)SKOverlayAppClipConfiguration;
  v5 = [(SKOverlayConfiguration *)&v7 initWithBacking:v4];

  return v5;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)SKOverlayAppClipConfiguration;
  return [(SKOverlayConfiguration *)&v3 _init];
}

- (SKOverlayAppClipConfiguration)initWithBacking:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKOverlayAppClipConfiguration;
  return [(SKOverlayConfiguration *)&v4 initWithBacking:a3];
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

@end