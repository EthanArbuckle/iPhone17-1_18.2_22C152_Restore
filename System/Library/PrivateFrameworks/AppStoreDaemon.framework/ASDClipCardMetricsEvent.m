@interface ASDClipCardMetricsEvent
+ (BOOL)supportsSecureCoding;
- (ASDClipCardMetricsEvent)initWithClipBundleID:(id)a3;
- (ASDClipCardMetricsEvent)initWithCoder:(id)a3;
- (BOOL)thirdPartyWithNoAppReferrer;
- (NSNumber)itemID;
- (NSString)bundleID;
- (NSString)referralSource;
- (NSString)referralSourceBundleID;
- (NSString)referrerType;
- (NSURL)sourceURL;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setItemID:(id)a3;
- (void)setReferralSource:(id)a3;
- (void)setReferralSourceBundleID:(id)a3;
- (void)setReferrerType:(id)a3;
- (void)setSourceURL:(id)a3;
- (void)setThirdPartyWithNoAppReferrer:(BOOL)a3;
@end

@implementation ASDClipCardMetricsEvent

- (ASDClipCardMetricsEvent)initWithClipBundleID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDClipCardMetricsEvent;
  v6 = [(ASDClipCardMetricsEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleID, a3);
  }

  return v7;
}

- (void)setReferralSource:(id)a3
{
  objc_storeStrong((id *)&self->_referralSource, a3);
  id v7 = a3;
  id v5 = (NSString *)[v7 copy];
  referralSourceBundleID = self->_referralSourceBundleID;
  self->_referralSourceBundleID = v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDClipCardMetricsEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ASDClipCardMetricsEvent;
  id v5 = [(ASDClipCardMetricsEvent *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_itemID"];
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_referralSourceBundleID"];
    referralSourceBundleID = v5->_referralSourceBundleID;
    v5->_referralSourceBundleID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_referrerType"];
    referrerType = v5->_referrerType;
    v5->_referrerType = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sourceURL"];
    sourceURL = v5->_sourceURL;
    v5->_sourceURL = (NSURL *)v14;

    v5->_thirdPartyWithNoAppReferrer = [v4 decodeBoolForKey:@"_thirdPartyWithNoAppReferrer"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  bundleID = self->_bundleID;
  id v5 = a3;
  [v5 encodeObject:bundleID forKey:@"_bundleID"];
  [v5 encodeObject:self->_itemID forKey:@"_itemID"];
  [v5 encodeObject:self->_referralSourceBundleID forKey:@"_referralSourceBundleID"];
  [v5 encodeObject:self->_referrerType forKey:@"_referrerType"];
  [v5 encodeObject:self->_sourceURL forKey:@"_sourceURL"];
  [v5 encodeBool:self->_thirdPartyWithNoAppReferrer forKey:@"_thirdPartyWithNoAppReferrer"];
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (NSString)referralSource
{
  return self->_referralSource;
}

- (NSString)referralSourceBundleID
{
  return self->_referralSourceBundleID;
}

- (void)setReferralSourceBundleID:(id)a3
{
}

- (NSString)referrerType
{
  return self->_referrerType;
}

- (void)setReferrerType:(id)a3
{
}

- (BOOL)thirdPartyWithNoAppReferrer
{
  return self->_thirdPartyWithNoAppReferrer;
}

- (void)setThirdPartyWithNoAppReferrer:(BOOL)a3
{
  self->_thirdPartyWithNoAppReferrer = a3;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_referrerType, 0);
  objc_storeStrong((id *)&self->_referralSourceBundleID, 0);
  objc_storeStrong((id *)&self->_referralSource, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end