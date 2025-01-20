@interface ACXInstallQueueElement
- (ACXInstallQueueElement)initWithURL:(id)a3 watchBundleID:(id)a4 companionBundleID:(id)a5 priority:(unint64_t)a6 appPrefs:(id)a7 provisioningProfileInfo:(id)a8 isUserInitiated:(BOOL)a9 requiredCapabilities:(id)a10 isPlaceholder:(BOOL)a11 size:(int64_t)a12;
- (ACXInstallQueueElement)initWithWatchBundleID:(id)a3 companionBundleID:(id)a4 priority:(unint64_t)a5 appPrefs:(id)a6 provisioningProfileInfo:(id)a7 isUserInitiated:(BOOL)a8 requiredCapabilities:(id)a9;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserInitiated;
- (NSDictionary)appPreferences;
- (NSDictionary)provisioningProfileInfo;
- (NSString)bundleID;
- (NSString)companionBundleID;
- (NSURL)appURL;
- (id)requiredCapabilities;
- (int64_t)appSize;
- (unint64_t)hash;
- (unint64_t)installType;
- (unint64_t)priority;
@end

@implementation ACXInstallQueueElement

- (ACXInstallQueueElement)initWithWatchBundleID:(id)a3 companionBundleID:(id)a4 priority:(unint64_t)a5 appPrefs:(id)a6 provisioningProfileInfo:(id)a7 isUserInitiated:(BOOL)a8 requiredCapabilities:(id)a9
{
  id v24 = a3;
  id v23 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)ACXInstallQueueElement;
  v18 = [(ACXInstallQueueElement *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_bundleID, a3);
    objc_storeStrong((id *)&v19->_companionBundleID, a4);
    v19->_priority = a5;
    objc_storeStrong((id *)&v19->_appPreferences, a6);
    objc_storeStrong((id *)&v19->_provisioningProfileInfo, a7);
    v19->_isUserInitiated = a8;
    objc_storeStrong(&v19->_requiredCapabilities, a9);
    v19->_installType = 0;
    appURL = v19->_appURL;
    v19->_appURL = 0;

    v19->_appSize = 0;
  }

  return v19;
}

- (ACXInstallQueueElement)initWithURL:(id)a3 watchBundleID:(id)a4 companionBundleID:(id)a5 priority:(unint64_t)a6 appPrefs:(id)a7 provisioningProfileInfo:(id)a8 isUserInitiated:(BOOL)a9 requiredCapabilities:(id)a10 isPlaceholder:(BOOL)a11 size:(int64_t)a12
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v28 = a7;
  id v27 = a8;
  id v26 = a10;
  v29.receiver = self;
  v29.super_class = (Class)ACXInstallQueueElement;
  v21 = [(ACXInstallQueueElement *)&v29 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_bundleID, a4);
    objc_storeStrong((id *)&v22->_companionBundleID, a5);
    v22->_priority = a6;
    objc_storeStrong((id *)&v22->_appPreferences, a7);
    objc_storeStrong((id *)&v22->_provisioningProfileInfo, a8);
    v22->_isUserInitiated = a9;
    objc_storeStrong(&v22->_requiredCapabilities, a10);
    objc_storeStrong((id *)&v22->_appURL, a3);
    v22->_appSize = a12;
    uint64_t v23 = 1;
    if (!a11) {
      uint64_t v23 = 2;
    }
    v22->_installType = v23;
  }

  return v22;
}

- (unint64_t)hash
{
  v2 = [(ACXInstallQueueElement *)self bundleID];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ACXInstallQueueElement *)a3;
  if (v4 == self)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(ACXInstallQueueElement *)self bundleID];
      v7 = [(ACXInstallQueueElement *)v5 bundleID];

      unsigned __int8 v8 = [v6 isEqualToString:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (unint64_t)installType
{
  return self->_installType;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)companionBundleID
{
  return self->_companionBundleID;
}

- (NSDictionary)appPreferences
{
  return self->_appPreferences;
}

- (NSDictionary)provisioningProfileInfo
{
  return self->_provisioningProfileInfo;
}

- (BOOL)isUserInitiated
{
  return self->_isUserInitiated;
}

- (id)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (NSURL)appURL
{
  return self->_appURL;
}

- (int64_t)appSize
{
  return self->_appSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appURL, 0);
  objc_storeStrong(&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_provisioningProfileInfo, 0);
  objc_storeStrong((id *)&self->_appPreferences, 0);
  objc_storeStrong((id *)&self->_companionBundleID, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end