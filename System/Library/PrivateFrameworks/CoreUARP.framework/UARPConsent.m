@interface UARPConsent
+ (BOOL)supportsSecureCoding;
- (BOOL)isDownloadable;
- (BOOL)isRecommended;
- (BOOL)needsPostLogoutMode;
- (NSError)installerProgressError;
- (NSNumber)downloadSize;
- (NSNumber)installerOverallProgress;
- (NSString)accessoryName;
- (NSString)appleModelNumber;
- (NSString)assetBuildVersion;
- (NSString)assetVersion;
- (NSString)consentDescription;
- (NSString)installerProgressDescription;
- (NSString)installerProgressPhase;
- (NSString)warning;
- (UARPConsent)initWithAccessoryName:(id)a3 appleModelNumber:(id)a4 assetVersion:(id)a5;
- (UARPConsent)initWithAccessoryName:(id)a3 assetVersion:(id)a4;
- (UARPConsent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAppleModelNumber:(id)a3;
- (void)setAssetBuildVersion:(id)a3;
- (void)setConsentDescription:(id)a3;
- (void)setDownloadSize:(id)a3;
- (void)setInstallerOverallProgress:(id)a3;
- (void)setInstallerProgressDescription:(id)a3;
- (void)setInstallerProgressError:(id)a3;
- (void)setInstallerProgressPhase:(id)a3;
- (void)setIsDownloadable:(BOOL)a3;
- (void)setIsRecommended:(BOOL)a3;
- (void)setNeedsPostLogoutMode:(BOOL)a3;
- (void)setWarning:(id)a3;
@end

@implementation UARPConsent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPConsent)initWithAccessoryName:(id)a3 assetVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UARPConsent;
  v8 = [(UARPConsent *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    accessoryName = v8->_accessoryName;
    v8->_accessoryName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    assetVersion = v8->_assetVersion;
    v8->_assetVersion = (NSString *)v11;

    *(_WORD *)&v8->_isDownloadable = 257;
    uint64_t v13 = [@"This is a firmware update for " stringByAppendingString:v8->_accessoryName];
    consentDescription = v8->_consentDescription;
    v8->_consentDescription = (NSString *)v13;
  }
  return v8;
}

- (UARPConsent)initWithAccessoryName:(id)a3 appleModelNumber:(id)a4 assetVersion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)UARPConsent;
  uint64_t v11 = [(UARPConsent *)&v21 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    accessoryName = v11->_accessoryName;
    v11->_accessoryName = (NSString *)v12;

    uint64_t v14 = [v10 copy];
    assetVersion = v11->_assetVersion;
    v11->_assetVersion = (NSString *)v14;

    uint64_t v16 = [v9 copy];
    appleModelNumber = v11->_appleModelNumber;
    v11->_appleModelNumber = (NSString *)v16;

    *(_WORD *)&v11->_isDownloadable = 257;
    uint64_t v18 = [@"This is a firmware update for " stringByAppendingString:v11->_accessoryName];
    consentDescription = v11->_consentDescription;
    v11->_consentDescription = (NSString *)v18;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[UARPConsent alloc] initWithAccessoryName:self->_accessoryName appleModelNumber:self->_appleModelNumber assetVersion:self->_assetVersion];
  v4->_isDownloadable = self->_isDownloadable;
  v4->_isRecommended = self->_isRecommended;
  uint64_t v5 = [(NSString *)self->_warning copy];
  warning = v4->_warning;
  v4->_warning = (NSString *)v5;

  v4->_downloadSize = self->_downloadSize;
  uint64_t v7 = [(NSString *)self->_consentDescription copy];
  consentDescription = v4->_consentDescription;
  v4->_consentDescription = (NSString *)v7;

  v4->_needsPostLogoutMode = self->_needsPostLogoutMode;
  uint64_t v9 = [(NSString *)self->_installerProgressDescription copy];
  installerProgressDescription = v4->_installerProgressDescription;
  v4->_installerProgressDescription = (NSString *)v9;

  uint64_t v11 = [(NSString *)self->_installerProgressPhase copy];
  installerProgressPhase = v4->_installerProgressPhase;
  v4->_installerProgressPhase = (NSString *)v11;

  objc_storeStrong((id *)&v4->_installerProgressError, self->_installerProgressError);
  uint64_t v13 = [(NSString *)self->_assetBuildVersion copy];
  assetBuildVersion = v4->_assetBuildVersion;
  v4->_assetBuildVersion = (NSString *)v13;

  objc_storeStrong((id *)&v4->_installerOverallProgress, self->_installerOverallProgress);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  accessoryName = self->_accessoryName;
  id v5 = a3;
  [v5 encodeObject:accessoryName forKey:@"accessoryName"];
  [v5 encodeObject:self->_appleModelNumber forKey:@"appleModelNumber"];
  [v5 encodeObject:self->_assetVersion forKey:@"asetVersion"];
  [v5 encodeBool:self->_isDownloadable forKey:@"isDownloadable"];
  [v5 encodeBool:self->_isRecommended forKey:@"isRecommended"];
  [v5 encodeObject:self->_warning forKey:@"warning"];
  [v5 encodeObject:self->_downloadSize forKey:@"downloadSize"];
  [v5 encodeObject:self->_consentDescription forKey:@"consentDescription"];
  [v5 encodeBool:self->_needsPostLogoutMode forKey:@"needsPostLogoutMode"];
  [v5 encodeObject:self->_installerProgressDescription forKey:@"installerProgressDescription"];
  [v5 encodeObject:self->_installerProgressPhase forKey:@"installerProgressPhase"];
  [v5 encodeObject:self->_installerProgressError forKey:@"installerProgressError"];
  [v5 encodeObject:self->_assetBuildVersion forKey:@"assetBuildVersion"];
  [v5 encodeObject:self->_installerOverallProgress forKey:@"installerOverallProgress"];
}

- (UARPConsent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryName"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleModelNumber"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"asetVersion"];
  id v8 = [(UARPConsent *)self initWithAccessoryName:v5 appleModelNumber:v6 assetVersion:v7];
  v8->_isDownloadable = [v4 decodeBoolForKey:@"isDownloadable"];
  v8->_isRecommended = [v4 decodeBoolForKey:@"isRecommended"];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"warning"];
  warning = v8->_warning;
  v8->_warning = (NSString *)v9;

  v8->_downloadSize = (NSNumber *)(id)[v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadSize"];
  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"consentDescription"];
  consentDescription = v8->_consentDescription;
  v8->_consentDescription = (NSString *)v11;

  v8->_needsPostLogoutMode = [v4 decodeBoolForKey:@"needsPostLogoutMode"];
  uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installerProgressDescription"];
  installerProgressDescription = v8->_installerProgressDescription;
  v8->_installerProgressDescription = (NSString *)v13;

  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installerProgressPhase"];
  installerProgressPhase = v8->_installerProgressPhase;
  v8->_installerProgressPhase = (NSString *)v15;

  uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installerProgressError"];
  installerProgressError = v8->_installerProgressError;
  v8->_installerProgressError = (NSError *)v17;

  uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetBuildVersion"];
  assetBuildVersion = v8->_assetBuildVersion;
  v8->_assetBuildVersion = (NSString *)v19;

  uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installerOverallProgress"];

  installerOverallProgress = v8->_installerOverallProgress;
  v8->_installerOverallProgress = (NSNumber *)v21;

  return v8;
}

- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4
{
  id v9 = a4;
  [v9 appendWithTabDepth:a3, @"%@\n", self->_accessoryName format];
  if (self->_appleModelNumber) {
    [v9 appendWithTabDepth:a3, @"%@\n", self->_appleModelNumber format];
  }
  [v9 appendWithTabDepth:a3, @"%@\n", self->_assetVersion format];
  if (self->_assetBuildVersion) {
    [v9 appendWithTabDepth:a3, @"%@\n", self->_assetBuildVersion format];
  }
  if (self->_consentDescription) {
    [v9 appendWithTabDepth:a3 + 1, @"Consent Description: %@\n", self->_consentDescription format];
  }
  id v6 = v9;
  if (self->_warning)
  {
    [v9 appendWithTabDepth:a3 + 1, @"Warning: %@\n", self->_warning format];
    id v6 = v9;
  }
  unint64_t v7 = a3 + 1;
  if (self->_downloadSize)
  {
    [v9 appendWithTabDepth:v7, @"Download Size: %@\n", self->_downloadSize format];
    id v6 = v9;
  }
  objc_msgSend(v6, "appendWithTabDepth:format:", v7, @"Is Downloadable: %d\n", self->_isDownloadable);
  objc_msgSend(v9, "appendWithTabDepth:format:", v7, @"Is Recommended: %d\n", self->_isRecommended);
  objc_msgSend(v9, "appendWithTabDepth:format:", v7, @"Needs Post Logout Mode: %d\n", self->_needsPostLogoutMode);
  if (self->_installerProgressDescription) {
    [v9 appendWithTabDepth:v7, @"Installer Progress Description: %@\n", self->_installerProgressDescription format];
  }
  if (self->_installerProgressPhase) {
    [v9 appendWithTabDepth:v7, @"Installer Progress Phase: %@\n", self->_installerProgressPhase format];
  }
  id v8 = v9;
  if (self->_installerOverallProgress)
  {
    [v9 appendWithTabDepth:v7, @"Installer Overall Progress: %@\n", self->_installerOverallProgress format];
    id v8 = v9;
  }
  if (self->_installerProgressError)
  {
    [v9 appendWithTabDepth:v7, @"Installer Progress Error: %@\n", self->_installerProgressError format];
    id v8 = v9;
  }
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: _accessoryName=%@, _appleModelNumber=%@, _assetVersion=%@, _consentDescription=%@ _warning=%@ _needsPostLogoutMode=%d, _installerProgressDescription=%@, _installerOverallProgress=%@>", v5, self->_accessoryName, self->_appleModelNumber, self->_assetVersion, self->_consentDescription, self->_warning, self->_needsPostLogoutMode, self->_installerProgressDescription, self->_installerOverallProgress];

  return v6;
}

- (NSString)accessoryName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)appleModelNumber
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAppleModelNumber:(id)a3
{
}

- (NSString)assetVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isDownloadable
{
  return self->_isDownloadable;
}

- (void)setIsDownloadable:(BOOL)a3
{
  self->_isDownloadable = a3;
}

- (NSNumber)downloadSize
{
  return self->_downloadSize;
}

- (void)setDownloadSize:(id)a3
{
  self->_downloadSize = (NSNumber *)a3;
}

- (BOOL)isRecommended
{
  return self->_isRecommended;
}

- (void)setIsRecommended:(BOOL)a3
{
  self->_isRecommended = a3;
}

- (NSString)consentDescription
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConsentDescription:(id)a3
{
}

- (NSString)warning
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWarning:(id)a3
{
}

- (BOOL)needsPostLogoutMode
{
  return self->_needsPostLogoutMode;
}

- (void)setNeedsPostLogoutMode:(BOOL)a3
{
  self->_needsPostLogoutMode = a3;
}

- (NSString)installerProgressDescription
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInstallerProgressDescription:(id)a3
{
}

- (NSString)installerProgressPhase
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInstallerProgressPhase:(id)a3
{
}

- (NSError)installerProgressError
{
  return (NSError *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInstallerProgressError:(id)a3
{
}

- (NSNumber)installerOverallProgress
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInstallerOverallProgress:(id)a3
{
}

- (NSString)assetBuildVersion
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAssetBuildVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetBuildVersion, 0);
  objc_storeStrong((id *)&self->_installerOverallProgress, 0);
  objc_storeStrong((id *)&self->_installerProgressError, 0);
  objc_storeStrong((id *)&self->_installerProgressPhase, 0);
  objc_storeStrong((id *)&self->_installerProgressDescription, 0);
  objc_storeStrong((id *)&self->_warning, 0);
  objc_storeStrong((id *)&self->_consentDescription, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_appleModelNumber, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
}

@end