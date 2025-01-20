@interface GKApplicationProxy
+ (id)metadataForBundleURL:(id)a3;
- (BOOL)isGameCenterEnabled;
- (BOOL)isInstalled;
- (BOOL)isRestricted;
- (GKApplicationProxy)initWithBundleID:(id)a3;
- (GKApplicationProxy)initWithProxy:(id)a3;
- (LSApplicationProxy)lsProxy;
- (NSBundle)bundle;
- (NSDate)purchaseDate;
- (NSDictionary)metadata;
- (NSNumber)adamID;
- (NSNumber)externalVersion;
- (NSString)bundleID;
- (NSString)bundleShortVersion;
- (NSString)bundleVersion;
- (id)bundleURL;
- (void)setLsProxy:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation GKApplicationProxy

- (NSString)bundleVersion
{
  return (NSString *)[(LSApplicationProxy *)self->_lsProxy bundleVersion];
}

- (NSString)bundleShortVersion
{
  return (NSString *)[(LSApplicationProxy *)self->_lsProxy shortVersionString];
}

- (NSNumber)adamID
{
  v2 = [(GKApplicationProxy *)self metadata];
  v3 = [v2 objectForKeyedSubscript:@"itemId"];

  return (NSNumber *)v3;
}

- (NSNumber)externalVersion
{
  v2 = [(GKApplicationProxy *)self metadata];
  v3 = [v2 objectForKeyedSubscript:@"softwareVersionExternalIdentifier"];

  return (NSNumber *)v3;
}

- (NSBundle)bundle
{
  if ([(LSApplicationProxy *)self->_lsProxy foundBackingBundle])
  {
    v3 = [(GKApplicationProxy *)self bundleURL];
    if (v3)
    {
      v4 = [MEMORY[0x1E4F28B50] bundleWithURL:v3];
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return (NSBundle *)v4;
}

- (NSDictionary)metadata
{
  metadata = self->_metadata;
  if (!metadata)
  {
    v4 = [(LSApplicationProxy *)self->_lsProxy bundleURL];
    v5 = [v4 URLByDeletingLastPathComponent];
    v6 = [v5 URLByAppendingPathComponent:@"iTunesMetadata.plist"];

    if (v6)
    {
      v7 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v6];
      v8 = self->_metadata;
      self->_metadata = v7;
    }
    metadata = self->_metadata;
  }

  return metadata;
}

- (id)bundleURL
{
  return (id)[(LSApplicationProxy *)self->_lsProxy bundleURL];
}

- (GKApplicationProxy)initWithBundleID:(id)a3
{
  v4 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:a3];
  v5 = [(GKApplicationProxy *)self initWithProxy:v4];

  return v5;
}

- (GKApplicationProxy)initWithProxy:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKApplicationProxy;
  v5 = [(GKApplicationProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    [(GKApplicationProxy *)v5 setLsProxy:v4];
  }

  return v6;
}

- (void)setLsProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_lsProxy, 0);
}

+ (id)metadataForBundleURL:(id)a3
{
  v3 = [a3 URLByDeletingLastPathComponent];
  id v4 = [v3 URLByAppendingPathComponent:@"iTunesMetadata.plist"];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)bundleID
{
  return (NSString *)[(LSApplicationProxy *)self->_lsProxy applicationIdentifier];
}

- (NSDate)purchaseDate
{
  if (purchaseDate_onceToken != -1) {
    dispatch_once(&purchaseDate_onceToken, &__block_literal_global_43);
  }
  v3 = [(GKApplicationProxy *)self metadata];
  id v4 = [v3 objectForKeyedSubscript:@"purchaseDate"];
  if (!v4)
  {
    v5 = [v3 objectForKeyedSubscript:@"com.apple.iTunesStore.downloadInfo"];
    id v4 = [v5 objectForKeyedSubscript:@"purchaseDate"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [(id)purchaseDate_sDateFormatter dateFromString:v4];
    }
    else
    {
      uint64_t v6 = 0;
    }

    id v4 = (void *)v6;
  }

  return (NSDate *)v4;
}

void __34__GKApplicationProxy_purchaseDate__block_invoke()
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)purchaseDate_sDateFormatter;
  purchaseDate_sDateFormatter = (uint64_t)v0;

  [(id)purchaseDate_sDateFormatter setLocale:v4];
  [(id)purchaseDate_sDateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
  v2 = (void *)purchaseDate_sDateFormatter;
  v3 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v2 setTimeZone:v3];
}

- (BOOL)isRestricted
{
  v2 = [(LSApplicationProxy *)self->_lsProxy appState];
  char v3 = [v2 isRestricted];

  return v3;
}

- (BOOL)isGameCenterEnabled
{
  v2 = [(GKApplicationProxy *)self metadata];
  char v3 = [v2 objectForKeyedSubscript:@"gameCenterEnabled"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isInstalled
{
  int v3 = [(LSApplicationProxy *)self->_lsProxy foundBackingBundle];
  if (v3) {
    LOBYTE(v3) = [(LSApplicationProxy *)self->_lsProxy installType] == 0;
  }
  return v3;
}

- (LSApplicationProxy)lsProxy
{
  return self->_lsProxy;
}

- (void)setMetadata:(id)a3
{
}

@end