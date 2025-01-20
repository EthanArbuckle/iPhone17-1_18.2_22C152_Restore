@interface CPSSessionConfiguration
+ (BOOL)supportsSecureCoding;
+ (CPSSessionConfiguration)localConfiguration;
+ (CPSSessionConfiguration)pptConfiguration;
+ (CPSSessionConfiguration)pptLocalConfiguration;
+ (CPSSessionConfiguration)standardConfiguration;
+ (id)_defaultSourceBundleIDToReasonMap;
+ (id)reasonForSourceBundleID:(id)a3;
+ (id)standardConfigurationWithFallbackClipBundleID:(id)a3;
+ (id)standardConfigurationWithURL:(id)a3 fallbackBundleID:(id)a4;
- (BOOL)analyticsShouldIncludeReferrerURL;
- (BOOL)canPrefetchEncryptionKey;
- (BOOL)isForSwitcherOverlay;
- (BOOL)isInvokedByPhysicalCode;
- (BOOL)mayLaunchWithoutInvocationUI;
- (BOOL)originIsControlCenter;
- (BOOL)useLocalContent;
- (BOOL)usedByPPT;
- (CPSSessionConfiguration)initWithCoder:(id)a3;
- (NSString)analyticsLaunchReason;
- (NSString)analyticsReferrerBundleID;
- (NSString)fallbackClipBundleID;
- (NSString)launchReason;
- (NSString)referrerBundleID;
- (NSString)sourceBundleID;
- (NSUUID)sessionID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFallbackClipBundleID:(id)a3;
- (void)setIsForSwitcherOverlay:(BOOL)a3;
- (void)setLaunchReason:(id)a3;
- (void)setOriginIsControlCenter:(BOOL)a3;
- (void)setReferrerBundleID:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSourceBundleID:(id)a3;
- (void)setUseLocalContent:(BOOL)a3;
- (void)setUsedByPPT:(BOOL)a3;
@end

@implementation CPSSessionConfiguration

+ (CPSSessionConfiguration)standardConfiguration
{
  return (CPSSessionConfiguration *)[a1 standardConfigurationWithFallbackClipBundleID:0];
}

+ (id)standardConfigurationWithFallbackClipBundleID:(id)a3
{
  return (id)[a1 standardConfigurationWithURL:0 fallbackBundleID:a3];
}

+ (id)standardConfigurationWithURL:(id)a3 fallbackBundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(CPSSessionConfiguration);
  v8 = [MEMORY[0x263F08C38] UUID];
  [(CPSSessionConfiguration *)v7 setSessionID:v8];

  v9 = [MEMORY[0x263F086E0] mainBundle];
  v10 = [v9 bundleIdentifier];
  [(CPSSessionConfiguration *)v7 setSourceBundleID:v10];

  v11 = [(CPSSessionConfiguration *)v7 sourceBundleID];
  uint64_t v12 = +[CPSSessionConfiguration reasonForSourceBundleID:v11];
  v13 = (void *)v12;
  if (v12) {
    v14 = (__CFString *)v12;
  }
  else {
    v14 = @"Other";
  }
  [(CPSSessionConfiguration *)v7 setLaunchReason:v14];

  if (!v6)
  {
    objc_msgSend(v5, "cps_fallbackBundleIdentifier");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  [(CPSSessionConfiguration *)v7 setFallbackClipBundleID:v6];

  return v7;
}

+ (CPSSessionConfiguration)localConfiguration
{
  v2 = +[CPSSessionConfiguration standardConfiguration];
  [v2 setUseLocalContent:1];

  return (CPSSessionConfiguration *)v2;
}

+ (CPSSessionConfiguration)pptConfiguration
{
  v2 = +[CPSSessionConfiguration standardConfiguration];
  [v2 setUsedByPPT:1];

  return (CPSSessionConfiguration *)v2;
}

+ (CPSSessionConfiguration)pptLocalConfiguration
{
  v2 = +[CPSSessionConfiguration standardConfiguration];
  [v2 setUsedByPPT:1];
  [v2 setUseLocalContent:1];

  return (CPSSessionConfiguration *)v2;
}

+ (id)_defaultSourceBundleIDToReasonMap
{
  v5[14] = *MEMORY[0x263EF8340];
  v4[0] = @"com.apple.mobilesafari";
  v4[1] = @"com.apple.SafariViewService";
  v5[0] = @"Safari";
  v5[1] = @"Safari";
  v4[2] = @"com.apple.Maps";
  v4[3] = @"com.apple.MobileSMS";
  v5[2] = @"Maps";
  v5[3] = @"Messages";
  v4[4] = @"com.apple.BarcodeSupport.BarcodeNotificationService";
  v4[5] = @"com.apple.duetexpertd";
  v5[4] = @"NFC";
  v5[5] = @"LocationBased";
  v4[6] = @"com.apple.Spotlight";
  v4[7] = @"com.apple.springboard";
  v5[6] = @"SpotlightSearch";
  v5[7] = @"SpringBoard";
  v4[8] = @"com.apple.SpringBoard";
  v4[9] = @"com.apple.BarcodeScanner";
  v5[8] = @"SpringBoard";
  v5[9] = @"QR";
  v4[10] = @"com.apple.DTServiceHub";
  v4[11] = @"com.apple.siri";
  v5[10] = @"DeveloperTools";
  v5[11] = @"Siri";
  v4[12] = @"com.apple.ClipTester";
  v4[13] = @"com.apple.camera";
  v5[12] = @"ClipTester";
  v5[13] = @"QR";
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:14];

  return v2;
}

+ (id)reasonForSourceBundleID:(id)a3
{
  id v3 = a3;
  v4 = +[CPSSessionConfiguration _defaultSourceBundleIDToReasonMap];
  id v5 = [v4 objectForKey:v3];

  return v5;
}

- (NSString)analyticsReferrerBundleID
{
  referrerBundleID = self->_referrerBundleID;
  if (!referrerBundleID) {
    referrerBundleID = self->_sourceBundleID;
  }
  return referrerBundleID;
}

- (NSString)analyticsLaunchReason
{
  id v3 = +[CPSSessionConfiguration reasonForSourceBundleID:self->_referrerBundleID];
  launchReason = v3;
  if (!v3) {
    launchReason = self->_launchReason;
  }
  p_isa = launchReason;

  if ([(NSString *)p_isa isEqualToString:@"Safari"]
    || [(NSString *)p_isa isEqualToString:@"InApp"])
  {
    if (self->_referrerBundleID) {
      id v6 = @"App Referral";
    }
    else {
      id v6 = @"Web Referral";
    }
    v7 = v6;

    p_isa = &v7->isa;
  }

  return p_isa;
}

- (BOOL)analyticsShouldIncludeReferrerURL
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Web Referral";
  v6[1] = @"App Referral";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [(CPSSessionConfiguration *)self analyticsLaunchReason];
  LOBYTE(self) = [v3 containsObject:v4];

  return (char)self;
}

- (BOOL)canPrefetchEncryptionKey
{
  if ([(NSString *)self->_launchReason isEqualToString:@"NFC"]
    || [(NSString *)self->_sourceBundleID isEqualToString:@"com.apple.BarcodeScanner"])
  {
    return 0;
  }
  else
  {
    return ![(NSString *)self->_launchReason isEqualToString:@"Other"];
  }
}

- (BOOL)mayLaunchWithoutInvocationUI
{
  v5[7] = *MEMORY[0x263EF8340];
  v5[0] = @"Maps";
  v5[1] = @"Safari";
  v5[2] = @"Messages";
  v5[3] = @"Mail";
  v5[4] = @"SpotlightSearch";
  v5[5] = @"LocationBased";
  v5[6] = @"Shazam";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:7];
  LOBYTE(self) = [v3 containsObject:self->_launchReason];

  return (char)self;
}

- (BOOL)isInvokedByPhysicalCode
{
  v2 = [(CPSSessionConfiguration *)self launchReason];
  if (([v2 isEqualToString:@"QR"] & 1) != 0
    || ([v2 isEqualToString:@"AppclipCode"] & 1) != 0)
  {
    char v3 = 1;
  }
  else
  {
    char v3 = [v2 isEqualToString:@"NFC"];
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSSessionConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CPSSessionConfiguration;
  id v5 = [(CPSSessionConfiguration *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceBundleID"];
    sourceBundleID = v5->_sourceBundleID;
    v5->_sourceBundleID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referrerBundleID"];
    referrerBundleID = v5->_referrerBundleID;
    v5->_referrerBundleID = (NSString *)v10;

    v5->_usedByPPT = [v4 decodeBoolForKey:@"useByTest"];
    v5->_useLocalContent = [v4 decodeBoolForKey:@"useLocalContent"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceReason"];
    launchReason = v5->_launchReason;
    v5->_launchReason = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fallbackClipBundleID"];
    fallbackClipBundleID = v5->_fallbackClipBundleID;
    v5->_fallbackClipBundleID = (NSString *)v14;

    v5->_originIsControlCenter = [v4 decodeBoolForKey:@"originIsControlCenter"];
    v5->_isForSwitcherOverlay = [v4 decodeBoolForKey:@"isForSwitcherOverlay"];
    v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sessionID = self->_sessionID;
  id v5 = a3;
  [v5 encodeObject:sessionID forKey:@"sessionID"];
  [v5 encodeObject:self->_sourceBundleID forKey:@"sourceBundleID"];
  [v5 encodeObject:self->_referrerBundleID forKey:@"referrerBundleID"];
  [v5 encodeBool:self->_usedByPPT forKey:@"useByTest"];
  [v5 encodeBool:self->_useLocalContent forKey:@"useLocalContent"];
  [v5 encodeObject:self->_launchReason forKey:@"sourceReason"];
  [v5 encodeObject:self->_fallbackClipBundleID forKey:@"fallbackClipBundleID"];
  [v5 encodeBool:self->_originIsControlCenter forKey:@"originIsControlCenter"];
  [v5 encodeBool:self->_isForSwitcherOverlay forKey:@"isForSwitcherOverlay"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"sessionID: %@, sourceBundleID: %@, referrerBundleID: %@, usedByPPT: %d, useLocalContent: %d, launchReason: %@, fallbackClipBundleID: %@, originIsControlCenter: %d, isForSwitcherOverlay = %d", self->_sessionID, self->_sourceBundleID, self->_referrerBundleID, self->_usedByPPT, self->_useLocalContent, self->_launchReason, self->_fallbackClipBundleID, self->_originIsControlCenter, self->_isForSwitcherOverlay];
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (void)setSourceBundleID:(id)a3
{
}

- (NSString)referrerBundleID
{
  return self->_referrerBundleID;
}

- (void)setReferrerBundleID:(id)a3
{
}

- (BOOL)usedByPPT
{
  return self->_usedByPPT;
}

- (void)setUsedByPPT:(BOOL)a3
{
  self->_usedByPPT = a3;
}

- (BOOL)useLocalContent
{
  return self->_useLocalContent;
}

- (void)setUseLocalContent:(BOOL)a3
{
  self->_useLocalContent = a3;
}

- (NSString)fallbackClipBundleID
{
  return self->_fallbackClipBundleID;
}

- (void)setFallbackClipBundleID:(id)a3
{
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (void)setLaunchReason:(id)a3
{
}

- (BOOL)originIsControlCenter
{
  return self->_originIsControlCenter;
}

- (void)setOriginIsControlCenter:(BOOL)a3
{
  self->_originIsControlCenter = a3;
}

- (BOOL)isForSwitcherOverlay
{
  return self->_isForSwitcherOverlay;
}

- (void)setIsForSwitcherOverlay:(BOOL)a3
{
  self->_isForSwitcherOverlay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_fallbackClipBundleID, 0);
  objc_storeStrong((id *)&self->_referrerBundleID, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end