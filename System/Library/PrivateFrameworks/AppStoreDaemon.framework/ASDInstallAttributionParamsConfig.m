@interface ASDInstallAttributionParamsConfig
+ (BOOL)supportsSecureCoding;
+ (id)paramsFromDictionary:(id)a3;
- (ASDInstallAttributionParamsConfig)initWithCoder:(id)a3;
- (BOOL)overrideCampaignLimit;
- (NSNumber)appAdamId;
- (NSNumber)campaignId;
- (NSNumber)sourceAppAdamId;
- (NSNumber)sourceIdentifier;
- (NSNumber)timestamp;
- (NSString)adNetworkId;
- (NSString)attributionSignature;
- (NSString)impressionId;
- (NSString)interactionType;
- (NSString)sourceAppBundleId;
- (NSString)version;
- (void)encodeWithCoder:(id)a3;
- (void)setAdNetworkId:(id)a3;
- (void)setAppAdamId:(id)a3;
- (void)setAttributionSignature:(id)a3;
- (void)setCampaignId:(id)a3;
- (void)setImpressionId:(id)a3;
- (void)setInteractionType:(id)a3;
- (void)setOverrideCampaignLimit:(BOOL)a3;
- (void)setSourceAppAdamId:(id)a3;
- (void)setSourceAppBundleId:(id)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation ASDInstallAttributionParamsConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  appAdamId = self->_appAdamId;
  id v5 = a3;
  [v5 encodeObject:appAdamId forKey:@"1"];
  [v5 encodeObject:self->_adNetworkId forKey:@"2"];
  [v5 encodeObject:self->_campaignId forKey:@"3"];
  [v5 encodeObject:self->_impressionId forKey:@"4"];
  [v5 encodeObject:self->_sourceAppAdamId forKey:@"5"];
  [v5 encodeObject:self->_timestamp forKey:@"6"];
  [v5 encodeObject:self->_attributionSignature forKey:@"7"];
  [v5 encodeObject:self->_sourceAppBundleId forKey:@"8"];
  [v5 encodeBool:self->_overrideCampaignLimit forKey:@"9"];
  [v5 encodeObject:self->_version forKey:@"10"];
  [v5 encodeObject:self->_sourceIdentifier forKey:@"11"];
  [v5 encodeObject:self->_interactionType forKey:@"12"];
}

- (ASDInstallAttributionParamsConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ASDInstallAttributionParamsConfig;
  id v5 = [(ASDInstallAttributionParamsConfig *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"1"];
    appAdamId = v5->_appAdamId;
    v5->_appAdamId = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"2"];
    adNetworkId = v5->_adNetworkId;
    v5->_adNetworkId = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"3"];
    campaignId = v5->_campaignId;
    v5->_campaignId = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"4"];
    impressionId = v5->_impressionId;
    v5->_impressionId = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"5"];
    sourceAppAdamId = v5->_sourceAppAdamId;
    v5->_sourceAppAdamId = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"6"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"7"];
    attributionSignature = v5->_attributionSignature;
    v5->_attributionSignature = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"8"];
    sourceAppBundleId = v5->_sourceAppBundleId;
    v5->_sourceAppBundleId = (NSString *)v20;

    v5->_overrideCampaignLimit = [v4 decodeBoolForKey:@"9"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"10"];
    version = v5->_version;
    v5->_version = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"11"];
    sourceIdentifier = v5->_sourceIdentifier;
    v5->_sourceIdentifier = (NSNumber *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"12"];
    interactionType = v5->_interactionType;
    v5->_interactionType = (NSString *)v26;
  }
  return v5;
}

+ (id)paramsFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 objectForKeyedSubscript:@"adNetworkAttributionSignature"];
  [v4 setAttributionSignature:v5];

  uint64_t v6 = [v3 objectForKeyedSubscript:@"adNetworkCampaignId"];
  [v4 setCampaignId:v6];

  v7 = [v3 objectForKeyedSubscript:@"adNetworkId"];
  [v4 setAdNetworkId:v7];

  uint64_t v8 = [v3 objectForKeyedSubscript:@"adNetworkNonce"];
  [v4 setImpressionId:v8];

  v9 = [v3 objectForKeyedSubscript:@"adNetworkImpressionTimestamp"];
  [v4 setTimestamp:v9];

  uint64_t v10 = [v3 objectForKeyedSubscript:@"adNetworkSourceAppStoreIdentifier"];
  [v4 setSourceAppAdamId:v10];

  v11 = [v3 objectForKeyedSubscript:@"adNetworkPayloadVersion"];
  [v4 setVersion:v11];

  uint64_t v12 = [v3 objectForKeyedSubscript:@"id"];
  [v4 setAppAdamId:v12];

  v13 = [v3 objectForKeyedSubscript:@"sourceIdentifier"];

  [v4 setSourceIdentifier:v13];
  return v4;
}

- (NSNumber)appAdamId
{
  return self->_appAdamId;
}

- (void)setAppAdamId:(id)a3
{
}

- (NSString)adNetworkId
{
  return self->_adNetworkId;
}

- (void)setAdNetworkId:(id)a3
{
}

- (NSNumber)campaignId
{
  return self->_campaignId;
}

- (void)setCampaignId:(id)a3
{
}

- (NSString)impressionId
{
  return self->_impressionId;
}

- (void)setImpressionId:(id)a3
{
}

- (NSNumber)sourceAppAdamId
{
  return self->_sourceAppAdamId;
}

- (void)setSourceAppAdamId:(id)a3
{
}

- (NSNumber)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)attributionSignature
{
  return self->_attributionSignature;
}

- (void)setAttributionSignature:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSString)interactionType
{
  return self->_interactionType;
}

- (void)setInteractionType:(id)a3
{
}

- (NSString)sourceAppBundleId
{
  return self->_sourceAppBundleId;
}

- (void)setSourceAppBundleId:(id)a3
{
}

- (BOOL)overrideCampaignLimit
{
  return self->_overrideCampaignLimit;
}

- (void)setOverrideCampaignLimit:(BOOL)a3
{
  self->_overrideCampaignLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceAppBundleId, 0);
  objc_storeStrong((id *)&self->_interactionType, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_attributionSignature, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceAppAdamId, 0);
  objc_storeStrong((id *)&self->_impressionId, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_adNetworkId, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
}

@end