@interface ASDImpressionParamsConfig
+ (BOOL)supportsSecureCoding;
- (ASDImpressionParamsConfig)initWithCoder:(id)a3;
- (NSNumber)appAdamId;
- (NSNumber)campaignId;
- (NSNumber)fidelityType;
- (NSNumber)sourceAppAdamId;
- (NSNumber)sourceIdentifier;
- (NSNumber)timestamp;
- (NSString)adNetworkId;
- (NSString)attributionSignature;
- (NSString)impressionId;
- (NSString)processName;
- (NSString)sourceAppBundleId;
- (NSString)version;
- (void)encodeWithCoder:(id)a3;
- (void)setAdNetworkId:(id)a3;
- (void)setAppAdamId:(id)a3;
- (void)setAttributionSignature:(id)a3;
- (void)setCampaignId:(id)a3;
- (void)setFidelityType:(id)a3;
- (void)setImpressionId:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setSourceAppAdamId:(id)a3;
- (void)setSourceAppBundleId:(id)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation ASDImpressionParamsConfig

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
  [v5 encodeObject:self->_attributionSignature forKey:@"6"];
  [v5 encodeObject:self->_sourceAppBundleId forKey:@"7"];
  [v5 encodeObject:self->_version forKey:@"8"];
  [v5 encodeObject:self->_timestamp forKey:@"9"];
  [v5 encodeObject:self->_fidelityType forKey:@"10"];
  [v5 encodeObject:self->_processName forKey:@"11"];
  [v5 encodeObject:self->_sourceIdentifier forKey:@"12"];
}

- (ASDImpressionParamsConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ASDImpressionParamsConfig;
  id v5 = [(ASDImpressionParamsConfig *)&v31 init];
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
    attributionSignature = v5->_attributionSignature;
    v5->_attributionSignature = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"7"];
    sourceAppBundleId = v5->_sourceAppBundleId;
    v5->_sourceAppBundleId = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"8"];
    version = v5->_version;
    v5->_version = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"9"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"10"];
    fidelityType = v5->_fidelityType;
    v5->_fidelityType = (NSNumber *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"11"];
    processName = v5->_processName;
    v5->_processName = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"12"];
    sourceIdentifier = v5->_sourceIdentifier;
    v5->_sourceIdentifier = (NSNumber *)v28;
  }
  return v5;
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

- (NSString)sourceAppBundleId
{
  return self->_sourceAppBundleId;
}

- (void)setSourceAppBundleId:(id)a3
{
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSNumber)fidelityType
{
  return self->_fidelityType;
}

- (void)setFidelityType:(id)a3
{
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_fidelityType, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_sourceAppBundleId, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_attributionSignature, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceAppAdamId, 0);
  objc_storeStrong((id *)&self->_impressionId, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_adNetworkId, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
}

@end