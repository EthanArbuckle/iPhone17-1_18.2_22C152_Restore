@interface ASDUpdateMetricsEvent
+ (BOOL)supportsSecureCoding;
+ (id)relativeMetricsKeys;
- (ASDUpdateMetricsEvent)initWithCoder:(id)a3;
- (ASDUpdateMetricsEvent)initWithDictionary:(id)a3;
- (NSNumber)available;
- (NSNumber)discovery;
- (NSNumber)downloadComplete;
- (NSNumber)downloadStart;
- (NSNumber)installComplete;
- (NSNumber)installStart;
- (NSNumber)purchaseComplete;
- (NSNumber)purchaseStart;
- (void)encodeWithCoder:(id)a3;
- (void)setAvailable:(id)a3;
- (void)setDiscovery:(id)a3;
- (void)setDownloadComplete:(id)a3;
- (void)setDownloadStart:(id)a3;
- (void)setInstallComplete:(id)a3;
- (void)setInstallStart:(id)a3;
- (void)setPurchaseComplete:(id)a3;
- (void)setPurchaseStart:(id)a3;
@end

@implementation ASDUpdateMetricsEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDUpdateMetricsEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ASDUpdateMetricsEvent;
  v5 = [(ASDUpdateMetricsEvent *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"a"];
    available = v5->_available;
    v5->_available = (NSNumber *)v6;

    uint64_t v8 = [v4 objectForKey:@"d"];
    discovery = v5->_discovery;
    v5->_discovery = (NSNumber *)v8;

    uint64_t v10 = [v4 objectForKey:@"ps"];
    purchaseStart = v5->_purchaseStart;
    v5->_purchaseStart = (NSNumber *)v10;

    uint64_t v12 = [v4 objectForKey:@"pc"];
    purchaseComplete = v5->_purchaseComplete;
    v5->_purchaseComplete = (NSNumber *)v12;

    uint64_t v14 = [v4 objectForKey:@"ds"];
    downloadStart = v5->_downloadStart;
    v5->_downloadStart = (NSNumber *)v14;

    uint64_t v16 = [v4 objectForKey:@"dc"];
    downloadComplete = v5->_downloadComplete;
    v5->_downloadComplete = (NSNumber *)v16;

    uint64_t v18 = [v4 objectForKey:@"is"];
    installStart = v5->_installStart;
    v5->_installStart = (NSNumber *)v18;

    uint64_t v20 = [v4 objectForKey:@"ic"];
    installComplete = v5->_installComplete;
    v5->_installComplete = (NSNumber *)v20;
  }
  return v5;
}

- (ASDUpdateMetricsEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ASDUpdateMetricsEvent;
  v5 = [(ASDUpdateMetricsEvent *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"a"];
    available = v5->_available;
    v5->_available = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
    discovery = v5->_discovery;
    v5->_discovery = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ps"];
    purchaseStart = v5->_purchaseStart;
    v5->_purchaseStart = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pc"];
    purchaseComplete = v5->_purchaseComplete;
    v5->_purchaseComplete = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ds"];
    downloadStart = v5->_downloadStart;
    v5->_downloadStart = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dc"];
    downloadComplete = v5->_downloadComplete;
    v5->_downloadComplete = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"is"];
    installStart = v5->_installStart;
    v5->_installStart = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ic"];
    installComplete = v5->_installComplete;
    v5->_installComplete = (NSNumber *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  available = self->_available;
  id v5 = a3;
  [v5 encodeObject:available forKey:@"a"];
  [v5 encodeObject:self->_discovery forKey:@"d"];
  [v5 encodeObject:self->_purchaseStart forKey:@"ps"];
  [v5 encodeObject:self->_purchaseComplete forKey:@"pc"];
  [v5 encodeObject:self->_downloadStart forKey:@"ds"];
  [v5 encodeObject:self->_downloadComplete forKey:@"dc"];
  [v5 encodeObject:self->_installStart forKey:@"is"];
  [v5 encodeObject:self->_installComplete forKey:@"ic"];
}

+ (id)relativeMetricsKeys
{
  v4[7] = *MEMORY[0x1E4F143B8];
  v4[0] = @"d";
  v4[1] = @"ps";
  v4[2] = @"pc";
  v4[3] = @"ds";
  v4[4] = @"dc";
  v4[5] = @"is";
  v4[6] = @"ic";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:7];
  return v2;
}

- (NSNumber)available
{
  return self->_available;
}

- (void)setAvailable:(id)a3
{
}

- (NSNumber)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
}

- (NSNumber)purchaseStart
{
  return self->_purchaseStart;
}

- (void)setPurchaseStart:(id)a3
{
}

- (NSNumber)purchaseComplete
{
  return self->_purchaseComplete;
}

- (void)setPurchaseComplete:(id)a3
{
}

- (NSNumber)downloadStart
{
  return self->_downloadStart;
}

- (void)setDownloadStart:(id)a3
{
}

- (NSNumber)downloadComplete
{
  return self->_downloadComplete;
}

- (void)setDownloadComplete:(id)a3
{
}

- (NSNumber)installStart
{
  return self->_installStart;
}

- (void)setInstallStart:(id)a3
{
}

- (NSNumber)installComplete
{
  return self->_installComplete;
}

- (void)setInstallComplete:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installComplete, 0);
  objc_storeStrong((id *)&self->_installStart, 0);
  objc_storeStrong((id *)&self->_downloadComplete, 0);
  objc_storeStrong((id *)&self->_downloadStart, 0);
  objc_storeStrong((id *)&self->_purchaseComplete, 0);
  objc_storeStrong((id *)&self->_purchaseStart, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_available, 0);
}

@end