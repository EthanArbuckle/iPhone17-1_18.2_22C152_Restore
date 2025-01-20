@interface MCCloudConfiguration
+ (id)sharedConfiguration;
- (BOOL)alreadySignedIntoFaceTime;
- (BOOL)hasMAIDCredential;
- (BOOL)isAwaitingConfiguration;
- (BOOL)isProvisionallyEnrolled;
- (BOOL)isSupervised;
- (BOOL)isTeslaEnrolled;
- (NSDictionary)details;
- (NSDictionary)setAsideDetails;
- (id)MAIDUsername;
- (id)diagnosticsUploadURL;
- (id)language;
- (id)languageScript;
- (id)mdmVersionProtocol;
- (id)provisionalEnrollmentExpirationDate;
- (id)region;
- (id)skipSetupKeys;
- (id)tvProviderUserToken;
- (void)refreshDetailsFromDisk;
- (void)setDetails:(id)a3;
- (void)setSetAsideDetails:(id)a3;
@end

@implementation MCCloudConfiguration

+ (id)sharedConfiguration
{
  if (sharedConfiguration_onceToken != -1) {
    dispatch_once(&sharedConfiguration_onceToken, &__block_literal_global_36);
  }
  v2 = (void *)sharedConfiguration_config;
  return v2;
}

uint64_t __43__MCCloudConfiguration_sharedConfiguration__block_invoke()
{
  sharedConfiguration_config = objc_alloc_init(MCCloudConfiguration);
  return MEMORY[0x1F41817F8]();
}

- (void)refreshDetailsFromDisk
{
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  [v2 refreshDetailsFromDisk];
}

- (NSDictionary)details
{
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  v3 = [v2 details];

  return (NSDictionary *)v3;
}

- (void)setDetails:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F73168];
  id v4 = a3;
  id v5 = [v3 sharedConfiguration];
  [v5 setDetails:v4];
}

- (NSDictionary)setAsideDetails
{
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  v3 = [v2 setAsideDetails];

  return (NSDictionary *)v3;
}

- (void)setSetAsideDetails:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F73168];
  id v4 = a3;
  id v5 = [v3 sharedConfiguration];
  [v5 setSetAsideDetails:v4];
}

- (BOOL)isSupervised
{
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v3 = [v2 isSupervised];

  return v3;
}

- (BOOL)isTeslaEnrolled
{
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v3 = [v2 isTeslaEnrolled];

  return v3;
}

- (BOOL)isAwaitingConfiguration
{
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v3 = [v2 isAwaitingConfiguration];

  return v3;
}

- (id)mdmVersionProtocol
{
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v3 = [v2 mdmVersionProtocol];

  return v3;
}

- (id)diagnosticsUploadURL
{
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v3 = [v2 diagnosticsUploadURL];

  return v3;
}

- (id)MAIDUsername
{
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v3 = [v2 MAIDUsername];

  return v3;
}

- (BOOL)hasMAIDCredential
{
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v3 = [v2 hasMAIDCredential];

  return v3;
}

- (BOOL)alreadySignedIntoFaceTime
{
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v3 = [v2 alreadySignedIntoFaceTime];

  return v3;
}

- (id)language
{
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v3 = [v2 language];

  return v3;
}

- (id)region
{
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v3 = [v2 region];

  return v3;
}

- (id)languageScript
{
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v3 = [v2 languageScript];

  return v3;
}

- (BOOL)isProvisionallyEnrolled
{
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v3 = [v2 isProvisionallyEnrolled];

  return v3;
}

- (id)provisionalEnrollmentExpirationDate
{
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v3 = [v2 provisionalEnrollmentExpirationDate];

  return v3;
}

- (id)tvProviderUserToken
{
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v3 = [v2 tvProviderUserToken];

  return v3;
}

- (id)skipSetupKeys
{
  id v2 = [MEMORY[0x1E4F73168] sharedConfiguration];
  char v3 = [v2 skipSetupKeys];

  return v3;
}

@end