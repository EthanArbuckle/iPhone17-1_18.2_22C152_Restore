@interface AKAppiTunesMetadata
- (AKAppiTunesMetadata)initWithBundleId:(id)a3 shortName:(id)a4 appName:(id)a5 appDeveloperName:(id)a6 adamID:(id)a7;
- (BOOL)hasEula;
- (NSString)adamID;
- (NSString)appDeveloperName;
- (NSString)appName;
- (NSString)bundleId;
- (NSString)eula;
- (NSString)privacyURL;
- (void)setAdamID:(id)a3;
- (void)setAppDeveloperName:(id)a3;
- (void)setAppName:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setHasEula:(BOOL)a3;
- (void)setPrivacyURL:(id)a3;
@end

@implementation AKAppiTunesMetadata

- (AKAppiTunesMetadata)initWithBundleId:(id)a3 shortName:(id)a4 appName:(id)a5 appDeveloperName:(id)a6 adamID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)AKAppiTunesMetadata;
  v17 = [(AKAppiTunesMetadata *)&v28 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    bundleId = v17->_bundleId;
    v17->_bundleId = (NSString *)v18;

    if ([v13 length]) {
      v20 = v13;
    }
    else {
      v20 = v14;
    }
    uint64_t v21 = [v20 copy];
    appName = v17->_appName;
    v17->_appName = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    appDeveloperName = v17->_appDeveloperName;
    v17->_appDeveloperName = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    adamID = v17->_adamID;
    v17->_adamID = (NSString *)v25;
  }
  return v17;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)appDeveloperName
{
  return self->_appDeveloperName;
}

- (void)setAppDeveloperName:(id)a3
{
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
}

- (NSString)privacyURL
{
  return self->_privacyURL;
}

- (void)setPrivacyURL:(id)a3
{
}

- (BOOL)hasEula
{
  return self->_hasEula;
}

- (void)setHasEula:(BOOL)a3
{
  self->_hasEula = a3;
}

- (NSString)eula
{
  return self->_eula;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eula, 0);
  objc_storeStrong((id *)&self->_privacyURL, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_appDeveloperName, 0);
  objc_storeStrong((id *)&self->_appName, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end