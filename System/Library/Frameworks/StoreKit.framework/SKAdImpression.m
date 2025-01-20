@interface SKAdImpression
- (NSNumber)adCampaignIdentifier;
- (NSNumber)advertisedAppStoreItemIdentifier;
- (NSNumber)sourceAppStoreItemIdentifier;
- (NSNumber)sourceIdentifier;
- (NSNumber)timestamp;
- (NSString)adDescription;
- (NSString)adImpressionIdentifier;
- (NSString)adNetworkIdentifier;
- (NSString)adPurchaserName;
- (NSString)adType;
- (NSString)signature;
- (NSString)version;
- (SKAdImpression)initWithSourceAppStoreItemIdentifier:(NSNumber *)sourceAppStoreItemIdentifier advertisedAppStoreItemIdentifier:(NSNumber *)advertisedAppStoreItemIdentifier adNetworkIdentifier:(NSString *)adNetworkIdentifier adCampaignIdentifier:(NSNumber *)adCampaignIdentifier adImpressionIdentifier:(NSString *)adImpressionIdentifier timestamp:(NSNumber *)timestamp signature:(NSString *)signature version:(NSString *)version;
- (void)setAdCampaignIdentifier:(NSNumber *)adCampaignIdentifier;
- (void)setAdDescription:(NSString *)adDescription;
- (void)setAdImpressionIdentifier:(NSString *)adImpressionIdentifier;
- (void)setAdNetworkIdentifier:(NSString *)adNetworkIdentifier;
- (void)setAdPurchaserName:(NSString *)adPurchaserName;
- (void)setAdType:(NSString *)adType;
- (void)setAdvertisedAppStoreItemIdentifier:(NSNumber *)advertisedAppStoreItemIdentifier;
- (void)setSignature:(NSString *)signature;
- (void)setSourceAppStoreItemIdentifier:(NSNumber *)sourceAppStoreItemIdentifier;
- (void)setSourceIdentifier:(NSNumber *)sourceIdentifier;
- (void)setTimestamp:(NSNumber *)timestamp;
- (void)setVersion:(NSString *)version;
@end

@implementation SKAdImpression

- (SKAdImpression)initWithSourceAppStoreItemIdentifier:(NSNumber *)sourceAppStoreItemIdentifier advertisedAppStoreItemIdentifier:(NSNumber *)advertisedAppStoreItemIdentifier adNetworkIdentifier:(NSString *)adNetworkIdentifier adCampaignIdentifier:(NSNumber *)adCampaignIdentifier adImpressionIdentifier:(NSString *)adImpressionIdentifier timestamp:(NSNumber *)timestamp signature:(NSString *)signature version:(NSString *)version
{
  v27 = sourceAppStoreItemIdentifier;
  v26 = advertisedAppStoreItemIdentifier;
  v25 = adNetworkIdentifier;
  v24 = adCampaignIdentifier;
  v23 = adImpressionIdentifier;
  v22 = timestamp;
  v21 = signature;
  v17 = version;
  v28.receiver = self;
  v28.super_class = (Class)SKAdImpression;
  v18 = [(SKAdImpression *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sourceAppStoreItemIdentifier, sourceAppStoreItemIdentifier);
    objc_storeStrong((id *)&v19->_advertisedAppStoreItemIdentifier, advertisedAppStoreItemIdentifier);
    objc_storeStrong((id *)&v19->_adNetworkIdentifier, adNetworkIdentifier);
    objc_storeStrong((id *)&v19->_adCampaignIdentifier, adCampaignIdentifier);
    objc_storeStrong((id *)&v19->_adImpressionIdentifier, adImpressionIdentifier);
    objc_storeStrong((id *)&v19->_timestamp, timestamp);
    objc_storeStrong((id *)&v19->_signature, signature);
    objc_storeStrong((id *)&v19->_version, version);
  }

  return v19;
}

- (NSNumber)sourceAppStoreItemIdentifier
{
  return self->_sourceAppStoreItemIdentifier;
}

- (void)setSourceAppStoreItemIdentifier:(NSNumber *)sourceAppStoreItemIdentifier
{
}

- (NSNumber)advertisedAppStoreItemIdentifier
{
  return self->_advertisedAppStoreItemIdentifier;
}

- (void)setAdvertisedAppStoreItemIdentifier:(NSNumber *)advertisedAppStoreItemIdentifier
{
}

- (NSString)adNetworkIdentifier
{
  return self->_adNetworkIdentifier;
}

- (void)setAdNetworkIdentifier:(NSString *)adNetworkIdentifier
{
}

- (NSNumber)adCampaignIdentifier
{
  return self->_adCampaignIdentifier;
}

- (void)setAdCampaignIdentifier:(NSNumber *)adCampaignIdentifier
{
}

- (NSNumber)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(NSNumber *)sourceIdentifier
{
}

- (NSString)adImpressionIdentifier
{
  return self->_adImpressionIdentifier;
}

- (void)setAdImpressionIdentifier:(NSString *)adImpressionIdentifier
{
}

- (NSString)adType
{
  return self->_adType;
}

- (void)setAdType:(NSString *)adType
{
}

- (NSString)adDescription
{
  return self->_adDescription;
}

- (void)setAdDescription:(NSString *)adDescription
{
}

- (NSString)adPurchaserName
{
  return self->_adPurchaserName;
}

- (void)setAdPurchaserName:(NSString *)adPurchaserName
{
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(NSNumber *)timestamp
{
}

- (NSString)signature
{
  return self->_signature;
}

- (void)setSignature:(NSString *)signature
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(NSString *)version
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_adPurchaserName, 0);
  objc_storeStrong((id *)&self->_adDescription, 0);
  objc_storeStrong((id *)&self->_adType, 0);
  objc_storeStrong((id *)&self->_adImpressionIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_adCampaignIdentifier, 0);
  objc_storeStrong((id *)&self->_adNetworkIdentifier, 0);
  objc_storeStrong((id *)&self->_advertisedAppStoreItemIdentifier, 0);

  objc_storeStrong((id *)&self->_sourceAppStoreItemIdentifier, 0);
}

@end