@interface ApplicationProxy
+ (id)proxyForBundle:(id)a3;
+ (id)proxyForBundleID:(id)a3;
+ (id)proxyForBundleURL:(id)a3;
+ (id)proxyForItemID:(id)a3;
+ (id)proxyMatchingBundleID:(id)a3 orItemID:(id)a4;
+ (void)enumerateApplicationsOfType:(unint64_t)a3 usingBlock:(id)a4;
- (ApplicationProxy)initWithBundle:(id)a3;
- (ApplicationProxy)initWithBundleID:(id)a3;
- (ApplicationProxy)initWithBundleID:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5;
- (ApplicationProxy)initWithBundlePath:(id)a3;
- (ApplicationProxy)initWithBundleURL:(id)a3;
- (ApplicationProxy)initWithBundleURL:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5;
- (ApplicationProxy)initWithItemID:(id)a3 error:(id *)a4;
- (BOOL)appClipIsConfiguredForIAP;
- (BOOL)hasMIDBasedSINF;
- (BOOL)hasUnknownDistributor;
- (BOOL)isAppClip;
- (BOOL)isAppleSigned;
- (BOOL)isArcade;
- (BOOL)isB2BCustomApp;
- (BOOL)isBeta;
- (BOOL)isConfiguratorInstall;
- (BOOL)isFactoryInstall;
- (BOOL)isInstalled;
- (BOOL)isManagedAccount;
- (BOOL)isOffloaded;
- (BOOL)isPlaceholder;
- (BOOL)isProfileValidated;
- (BOOL)isStoreOriginated;
- (BOOL)missingRequiredSINF;
- (BOOL)validateEligibilityForUpdatesWithLogKey:(id)a3;
- (IXApplicationIdentity)applicationIdentity;
- (LSApplicationRecord)record;
- (MIStoreMetadata)storeMetadata;
- (NSArray)extensionReceiptURLs;
- (NSData)sinf;
- (NSNumber)downloaderDSID;
- (NSNumber)familyID;
- (NSNumber)installFailureReason;
- (NSNumber)purchaserDSID;
- (NSNumber)ratingRank;
- (NSNumber)storefront;
- (NSString)appStoreToolsBuildVersion;
- (NSString)bundleID;
- (NSString)bundlePath;
- (NSString)bundleVersion;
- (NSString)canonicalExecutablePath;
- (NSString)deviceIdentifierForVendor;
- (NSString)localizedName;
- (NSString)md5;
- (NSString)parentApplicationBundleID;
- (NSString)shortDescription;
- (NSString)shortVersionString;
- (NSString)sinfPath;
- (NSString)storeCohort;
- (NSString)thinningVariantID;
- (NSString)vendorName;
- (NSURL)bundleURL;
- (NSURL)receiptURL;
- (id)description;
- (int64_t)betaExternalVersionID;
- (int64_t)softwarePlatform;
- (int64_t)storeExternalVersionID;
- (int64_t)storeItemID;
- (unint64_t)appPlatform;
- (unint64_t)applicationType;
- (unsigned)codeSignatureVersion;
- (void)setAppClip:(BOOL)a3;
- (void)setAppClipIsConfiguredForIAP:(BOOL)a3;
- (void)setAppPlatform:(unint64_t)a3;
- (void)setAppleSigned:(BOOL)a3;
- (void)setApplicationType:(unint64_t)a3;
- (void)setArcade:(BOOL)a3;
- (void)setBeta:(BOOL)a3;
- (void)setBetaExternalVersionID:(int64_t)a3;
- (void)setBundleID:(id)a3;
- (void)setBundlePath:(id)a3;
- (void)setBundleURL:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setCanonicalExecutablePath:(id)a3;
- (void)setDeviceIdentifierForVendor:(id)a3;
- (void)setDownloaderDSID:(id)a3;
- (void)setFamilyID:(id)a3;
- (void)setHasMIDBasedSINF:(BOOL)a3;
- (void)setInstalled:(BOOL)a3;
- (void)setLocalizedName:(id)a3;
- (void)setMissingRequiredSINF:(BOOL)a3;
- (void)setOffloaded:(BOOL)a3;
- (void)setParentApplicationBundleID:(id)a3;
- (void)setPlaceholder:(BOOL)a3;
- (void)setProfileValidated:(BOOL)a3;
- (void)setPurchaserDSID:(id)a3;
- (void)setShortVersionString:(id)a3;
- (void)setStoreCohort:(id)a3;
- (void)setStoreExternalVersionID:(int64_t)a3;
- (void)setStoreItemID:(int64_t)a3;
- (void)setStoreOriginated:(BOOL)a3;
- (void)setStorefront:(id)a3;
- (void)setThinningVariantID:(id)a3;
- (void)setVendorName:(id)a3;
@end

@implementation ApplicationProxy

+ (id)proxyMatchingBundleID:(id)a3 orItemID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_7;
  }
  v7 = [[ApplicationProxy alloc] initWithBundleID:v5 allowPlaceholder:0 error:0];
  v8 = [(ApplicationProxy *)v7 validLocationProxy];

  if (v6)
  {
    id v9 = [v8 storeItemID];
    if (v9 != [v6 longLongValue]) {
      goto LABEL_6;
    }
    if (v8)
    {
      v10 = [[ApplicationProxy alloc] initWithItemID:v6 error:0];
      v11 = [(ApplicationProxy *)v10 validLocationProxy];

      v12 = [v11 bundleID];
      LOBYTE(v10) = [v12 isEqualToString:v5];

      v8 = v11;
      if ((v10 & 1) == 0)
      {
LABEL_6:

LABEL_7:
        v8 = 0;
      }
    }
  }
  if (([v8 isInstalled] & 1) == 0)
  {

    v8 = 0;
  }

  return v8;
}

- (ApplicationProxy)initWithBundleID:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v15 = 0;
  id v9 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v8 allowPlaceholder:v6 error:&v15];
  id v10 = v15;
  v11 = v10;
  if (v9)
  {
    self = sub_1003EEFFC((id *)&self->super.isa, v9);
    v12 = self;
  }
  else if (a5)
  {
    v12 = 0;
    *a5 = v10;
  }
  else
  {
    v13 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v8;
      __int16 v18 = 2114;
      v19 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "No record found for %{public}@: %{public}@", buf, 0x16u);
    }

    v12 = 0;
  }

  return v12;
}

- (BOOL)validateEligibilityForUpdatesWithLogKey:(id)a3
{
  id v4 = a3;
  if (![(ApplicationProxy *)self storeItemID]) {
    goto LABEL_18;
  }
  if (![(ApplicationProxy *)self hasMIDBasedSINF])
  {
    if ([(ApplicationProxy *)self isBeta]
      || [(ApplicationProxy *)self isProfileValidated])
    {
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  if (![(ApplicationProxy *)self isPlaceholder])
  {
LABEL_9:
    if ([(ApplicationProxy *)self isPlaceholder])
    {
      id v8 = [(ApplicationProxy *)self installFailureReason];
      id v5 = v8;
      if (!v8 || [v8 integerValue] != (id)4) {
        goto LABEL_17;
      }
    }
    if (![(ApplicationProxy *)self isInstalled]
      || ![(ApplicationProxy *)self missingRequiredSINF])
    {
      BOOL v9 = 1;
      goto LABEL_19;
    }
    id v5 = ASDLogHandleForCategory();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    BOOL v6 = [(ApplicationProxy *)self bundleID];
    int v11 = 138412546;
    id v12 = v4;
    __int16 v13 = 2114;
    v14 = v6;
    v7 = "[%@] Skipping unclaimed application: %{public}@";
    goto LABEL_6;
  }
  id v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [(ApplicationProxy *)self bundleID];
    int v11 = 138412546;
    id v12 = v4;
    __int16 v13 = 2114;
    v14 = v6;
    v7 = "[%@] Skipping per device app with bundle ID: %{public}@";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, 0x16u);
  }
LABEL_17:

LABEL_18:
  BOOL v9 = 0;
LABEL_19:

  return v9;
}

- (ApplicationProxy)initWithBundleURL:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v16 = 0;
  id v9 = [objc_alloc((Class)LSApplicationRecord) initWithURL:v8 allowPlaceholder:v6 error:&v16];
  id v10 = v16;
  int v11 = v10;
  if (v9)
  {
    self = sub_1003EEFFC((id *)&self->super.isa, v9);
    id v12 = self;
  }
  else if (a5)
  {
    id v12 = 0;
    *a5 = v10;
  }
  else
  {
    __int16 v13 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v15 = [v8 path];
      *(_DWORD *)buf = 138543618;
      __int16 v18 = v15;
      __int16 v19 = 2114;
      v20 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "No record found at %{public}@: %{public}@", buf, 0x16u);
    }
    id v12 = 0;
  }

  return v12;
}

- (ApplicationProxy)initWithItemID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v13 = 0;
  id v7 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithStoreItemIdentifier:error:", objc_msgSend(v6, "unsignedLongLongValue"), &v13);
  id v8 = v13;
  id v9 = v8;
  if (v7)
  {
    self = sub_1003EEFFC((id *)&self->super.isa, v7);
    id v10 = self;
  }
  else if (a4)
  {
    id v10 = 0;
    *a4 = v8;
  }
  else
  {
    int v11 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = v6;
      __int16 v16 = 2114;
      id v17 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "No record found for %{public}@: %{public}@", buf, 0x16u);
    }

    id v10 = 0;
  }

  return v10;
}

+ (id)proxyForBundle:(id)a3
{
  id v3 = a3;
  id v4 = [[ApplicationProxy alloc] initWithBundle:v3];

  return v4;
}

+ (id)proxyForBundleID:(id)a3
{
  id v3 = a3;
  id v4 = [[ApplicationProxy alloc] initWithBundleID:v3];

  return v4;
}

+ (id)proxyForItemID:(id)a3
{
  id v3 = a3;
  id v12 = 0;
  id v4 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithStoreItemIdentifier:error:", objc_msgSend(v3, "unsignedLongLongValue"), &v12);
  id v5 = v12;
  id v6 = v5;
  if (v5)
  {
    if ([v5 code] == (id)-10814
      && ([v6 domain],
          id v7 = objc_claimAutoreleasedReturnValue(),
          unsigned int v8 = [v7 isEqualToString:NSOSStatusErrorDomain],
          v7,
          v8))
    {
      id v9 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = v3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No record found for %{public}@", buf, 0xCu);
      }
    }
    else
    {
      id v9 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v14 = v3;
        __int16 v15 = 2114;
        __int16 v16 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "No record found for %{public}@: %{public}@", buf, 0x16u);
      }
    }

    id v10 = 0;
  }
  else
  {
    id v10 = sub_1003EEFFC((id *)[ApplicationProxy alloc], v4);
  }

  return v10;
}

+ (id)proxyForBundleURL:(id)a3
{
  id v3 = a3;
  id v12 = 0;
  id v4 = [objc_alloc((Class)LSApplicationRecord) initWithURL:v3 allowPlaceholder:1 error:&v12];
  id v5 = v12;
  id v6 = v5;
  if (v5)
  {
    if ([v5 code] == (id)-10814
      && ([v6 domain],
          id v7 = objc_claimAutoreleasedReturnValue(),
          unsigned int v8 = [v7 isEqualToString:NSOSStatusErrorDomain],
          v7,
          v8))
    {
      id v9 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = v3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No record found for %{public}@", buf, 0xCu);
      }
    }
    else
    {
      id v9 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v14 = v3;
        __int16 v15 = 2114;
        __int16 v16 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "No record found for %{public}@: %{public}@", buf, 0x16u);
      }
    }

    id v10 = 0;
  }
  else
  {
    id v10 = sub_1003EEFFC((id *)[ApplicationProxy alloc], v4);
  }

  return v10;
}

- (ApplicationProxy)initWithBundle:(id)a3
{
  id v4 = [a3 identifier];
  id v5 = [(ApplicationProxy *)self initWithBundleID:v4];

  return v5;
}

- (ApplicationProxy)initWithBundleID:(id)a3
{
  id v4 = a3;
  id v13 = 0;
  id v5 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v4 allowPlaceholder:1 error:&v13];
  id v6 = v13;
  id v7 = v6;
  if (v6)
  {
    if ([v6 code] == (id)-10814
      && ([v7 domain],
          unsigned int v8 = objc_claimAutoreleasedReturnValue(),
          unsigned int v9 = [v8 isEqualToString:NSOSStatusErrorDomain],
          v8,
          v9))
    {
      id v10 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "No record found for %{public}@", buf, 0xCu);
      }
    }
    else
    {
      id v10 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v15 = v4;
        __int16 v16 = 2114;
        id v17 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "No record found for %{public}@: %{public}@", buf, 0x16u);
      }
    }

    int v11 = 0;
  }
  else
  {
    self = sub_1003EEFFC((id *)&self->super.isa, v5);
    int v11 = self;
  }

  return v11;
}

- (ApplicationProxy)initWithBundlePath:(id)a3
{
  id v4 = +[NSURL fileURLWithPath:a3];
  id v5 = [(ApplicationProxy *)self initWithBundleURL:v4];

  return v5;
}

- (ApplicationProxy)initWithBundleURL:(id)a3
{
  id v4 = a3;
  id v20 = 0;
  id v5 = [objc_alloc((Class)LSApplicationRecord) initWithURL:v4 allowPlaceholder:1 error:&v20];
  id v6 = v20;
  if (v6)
  {
    id v7 = v6;
    unsigned int v8 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v22 = v4;
      __int16 v23 = 2114;
      id v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "No record found for %{public}@: %{public}@. Checking for extensions.", buf, 0x16u);
    }
  }
  if (v5) {
    goto LABEL_6;
  }
  id v19 = 0;
  id v10 = [objc_alloc((Class)LSApplicationExtensionRecord) initWithURL:v4 error:&v19];
  id v11 = v19;
  id v5 = v11;
  if (v11)
  {
    if ([v11 code] == (id)-10814
      && ([v5 domain],
          id v12 = objc_claimAutoreleasedReturnValue(),
          unsigned int v13 = [v12 isEqualToString:NSOSStatusErrorDomain],
          v12,
          v13))
    {
      id v14 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v22 = v4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "No extension record found for %{public}@", buf, 0xCu);
      }
    }
    else
    {
      id v14 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v22 = v4;
        __int16 v23 = 2114;
        id v24 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "No extension record found for %{public}@: %{public}@", buf, 0x16u);
      }
    }
LABEL_18:

    unsigned int v9 = 0;
    goto LABEL_19;
  }
  id v15 = [v10 containingBundleRecord];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v14 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = [v10 containingBundleRecord];
      *(_DWORD *)buf = 138543362;
      id v22 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Extension record's containing bundle record not expected type: %{public}@", buf, 0xCu);
    }
    goto LABEL_18;
  }
  id v5 = [v10 containingBundleRecord];

LABEL_6:
  self = sub_1003EEFFC((id *)&self->super.isa, v5);
  unsigned int v9 = self;
LABEL_19:

  return v9;
}

- (NSString)shortDescription
{
  return +[NSString stringWithFormat:@"%@/%lld", self->_bundleID, self->_storeItemID];
}

- (NSNumber)downloaderDSID
{
  if (!self->_downloaderDSID)
  {
    id v3 = [(LSApplicationRecord *)self->_record applicationDownloaderDSID];
    if (v3)
    {
      id v4 = +[NSNumber numberWithUnsignedLongLong:v3];
      downloaderDSID = self->_downloaderDSID;
      self->_downloaderDSID = v4;
    }
  }
  id v6 = self->_downloaderDSID;
  return v6;
}

- (NSNumber)familyID
{
  if (!self->_familyID)
  {
    id v3 = [(LSApplicationRecord *)self->_record applicationFamilyID];
    if (v3)
    {
      id v4 = +[NSNumber numberWithUnsignedLongLong:v3];
      familyID = self->_familyID;
      self->_familyID = v4;
    }
  }
  id v6 = self->_familyID;
  return v6;
}

- (BOOL)isManagedAccount
{
  v2 = self;
  if (self)
  {
    account = self->_account;
    if (!account)
    {
      id v4 = sub_10042889C(self->_record);
      id v5 = v4;
      if (v4)
      {
        id v6 = [v4 DSPersonID];
        if (v6)
        {
          id v7 = +[ACAccountStore ams_sharedAccountStore];
          unsigned int v8 = v7;
          if (v7)
          {
            uint64_t v9 = objc_msgSend(v7, "ams_iTunesAccountWithDSID:", v6);
            id v10 = v2->_account;
            v2->_account = (ACAccount *)v9;
          }
        }
      }
      account = v2->_account;
    }
    v2 = account;
  }
  unsigned __int8 v11 = [(ApplicationProxy *)v2 ams_isManagedAppleID];

  return v11;
}

- (NSNumber)purchaserDSID
{
  if (!self->_purchaserDSID && [(LSApplicationRecord *)self->_record applicationDSID])
  {
    id v3 = +[NSNumber numberWithUnsignedLongLong:[(LSApplicationRecord *)self->_record applicationDSID]];
    purchaserDSID = self->_purchaserDSID;
    self->_purchaserDSID = v3;
  }
  id v5 = self->_purchaserDSID;
  return v5;
}

- (BOOL)isAppClip
{
  if (self->_appClip) {
    return 1;
  }
  id v4 = [(LSApplicationRecord *)self->_record appClipMetadata];
  self->_appClip = v4 != 0;

  return self->_appClip;
}

- (NSString)parentApplicationBundleID
{
  if ([(ApplicationProxy *)self isAppClip] && !self->_parentApplicationBundleID)
  {
    id v3 = [(LSApplicationRecord *)self->_record entitlements];
    id v4 = [v3 objectForKey:@"com.apple.developer.parent-application-identifiers" ofClass:objc_opt_class()];

    if (objc_opt_respondsToSelector())
    {
      id v5 = [v4 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();
      }
    }
  }
  parentApplicationBundleID = self->_parentApplicationBundleID;
  return parentApplicationBundleID;
}

- (BOOL)appClipIsConfiguredForIAP
{
  if ([(ApplicationProxy *)self isAppClip] && !self->_appClipIsConfiguredForIAPValue)
  {
    id v3 = [(LSApplicationRecord *)self->_record URL];
    id v4 = [v3 path];
    id v5 = [v4 stringByAppendingPathComponent:@"Info.plist"];

    id v6 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v5];
    id v7 = v6;
    if (v6)
    {
      unsigned int v8 = [v6 objectForKeyedSubscript:@"SKOnDemandInstallOffersInAppPurchases"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 BOOLValue])
      {
        appClipIsConfiguredForIAPValue = self->_appClipIsConfiguredForIAPValue;
        self->_appClipIsConfiguredForIAPValue = (NSNumber *)&__kCFBooleanTrue;
      }
    }
    if (!self->_appClipIsConfiguredForIAPValue) {
      self->_appClipIsConfiguredForIAPValue = (NSNumber *)&__kCFBooleanFalse;
    }
  }
  id v10 = self->_appClipIsConfiguredForIAPValue;
  return [(NSNumber *)v10 BOOLValue];
}

- (unint64_t)appPlatform
{
  return [(LSApplicationRecord *)self->_record platform];
}

- (NSString)bundleID
{
  return (NSString *)[(LSApplicationRecord *)self->_record bundleIdentifier];
}

- (NSString)bundlePath
{
  v2 = [(LSApplicationRecord *)self->_record URL];
  id v3 = [v2 path];

  return (NSString *)v3;
}

- (NSURL)bundleURL
{
  return (NSURL *)[(LSApplicationRecord *)self->_record URL];
}

- (NSString)bundleVersion
{
  return (NSString *)[(LSApplicationRecord *)self->_record exactBundleVersion];
}

- (NSString)canonicalExecutablePath
{
  id v3 = [(LSApplicationRecord *)self->_record executableURL];

  if (v3)
  {
    id v4 = [(LSApplicationRecord *)self->_record executableURL];
    id v5 = [v4 URLByResolvingSymlinksInPath];
    id v6 = [v5 path];
  }
  else
  {
    id v7 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Can't generate canonical executable path for app with no executable URL: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    id v6 = 0;
  }
  return (NSString *)v6;
}

- (NSString)localizedName
{
  return (NSString *)[(LSApplicationRecord *)self->_record localizedName];
}

- (NSString)shortVersionString
{
  return (NSString *)[(LSApplicationRecord *)self->_record shortVersionString];
}

- (NSString)vendorName
{
  v2 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  id v3 = [v2 artistName];

  return (NSString *)v3;
}

- (BOOL)isAppleSigned
{
  unsigned __int16 signingFlags = self->_signingFlags;
  if ((signingFlags & 2) != 0) {
    return signingFlags & 1;
  }
  id v4 = [(ApplicationProxy *)self bundleID];
  id v5 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v4 allowPlaceholder:1 error:0];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 containingBundleRecord];

    id v5 = (void *)v6;
  }
  if (v5)
  {
    unsigned int v7 = [v5 isProfileValidated];
    char v8 = v7 ^ 1;
    if (v7) {
      __int16 v9 = 2;
    }
    else {
      __int16 v9 = 3;
    }
    unsigned __int16 v10 = v9 | self->_signingFlags;
  }
  else
  {
    char v8 = 0;
    unsigned __int16 v10 = self->_signingFlags | 2;
  }
  self->_unsigned __int16 signingFlags = v10;

  return v8;
}

- (BOOL)isProfileValidated
{
  return [(LSApplicationRecord *)self->_record isProfileValidated];
}

- (unsigned)codeSignatureVersion
{
  return [(LSApplicationRecord *)self->_record codeSignatureVersion];
}

- (NSString)md5
{
  v2 = [(ApplicationProxy *)self storeMetadata];
  id v3 = [v2 md5];

  return (NSString *)v3;
}

- (BOOL)hasMIDBasedSINF
{
  return [(LSApplicationRecord *)self->_record applicationHasMIDBasedSINF];
}

- (BOOL)missingRequiredSINF
{
  return [(LSApplicationRecord *)self->_record applicationMissingRequiredSINF];
}

- (NSString)sinfPath
{
  id v3 = [(LSApplicationRecord *)self->_record URL];
  id v4 = [v3 path];

  id v5 = [(LSApplicationRecord *)self->_record executableURL];
  uint64_t v6 = [v5 lastPathComponent];
  unsigned int v7 = [v6 stringByAppendingPathExtension:@"sinf"];

  if ([v4 length] && objc_msgSend(v7, "length"))
  {
    id v8 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v4, @"SC_Info", v7, 0);
    __int16 v9 = +[NSString pathWithComponents:v8];
  }
  else
  {
    __int16 v9 = 0;
  }

  return (NSString *)v9;
}

- (NSData)sinf
{
  v2 = [(ApplicationProxy *)self sinfPath];
  if (v2) {
    id v3 = [objc_alloc((Class)NSData) initWithContentsOfFile:v2];
  }
  else {
    id v3 = 0;
  }

  return (NSData *)v3;
}

- (IXApplicationIdentity)applicationIdentity
{
  v2 = [(LSApplicationRecord *)self->_record bundleIdentifier];
  if (v2) {
    id v3 = [objc_alloc((Class)IXApplicationIdentity) initWithBundleIdentifier:v2];
  }
  else {
    id v3 = 0;
  }

  return (IXApplicationIdentity *)v3;
}

- (NSNumber)installFailureReason
{
  id v3 = [(LSApplicationRecord *)self->_record placeholderFailureReason];
  if (v3)
  {
    id v3 = +[NSNumber numberWithUnsignedInteger:[(LSApplicationRecord *)self->_record placeholderFailureReason]];
  }
  return (NSNumber *)v3;
}

- (unint64_t)applicationType
{
  v2 = [(LSApplicationRecord *)self->_record typeForInstallMachinery];
  if ([v2 isEqualToString:LSUserApplicationType])
  {
    unint64_t v3 = 0;
  }
  else if ([v2 isEqualToString:LSSystemApplicationType])
  {
    unint64_t v3 = 1;
  }
  else if ([v2 isEqualToString:LSInternalApplicationType])
  {
    unint64_t v3 = 2;
  }
  else
  {
    unint64_t v3 = 99999;
  }

  return v3;
}

- (BOOL)isInstalled
{
  return [(LSApplicationRecord *)self->_record isPlaceholder] ^ 1;
}

- (BOOL)isOffloaded
{
  return (char *)[(LSApplicationRecord *)self->_record installType] - 7 < (char *)3;
}

- (BOOL)isPlaceholder
{
  return [(LSApplicationRecord *)self->_record isPlaceholder];
}

- (NSString)appStoreToolsBuildVersion
{
  return (NSString *)[(LSApplicationRecord *)self->_record appStoreToolsBuildVersion];
}

- (BOOL)hasUnknownDistributor
{
  return sub_1000173A0(self->_record);
}

- (BOOL)isArcade
{
  if ([(LSApplicationRecord *)self->_record isArcadeApp])
  {
    LOBYTE(has_internal_content) = 1;
  }
  else
  {
    int has_internal_content = os_variant_has_internal_content();
    if (has_internal_content)
    {
      if (self->_bundleID)
      {
        id v4 = sub_1003F2D8C();
        unsigned __int8 v5 = [v4 containsObject:self->_bundleID];

        LOBYTE(has_internal_content) = v5;
      }
      else
      {
        LOBYTE(has_internal_content) = 0;
      }
    }
  }
  return has_internal_content;
}

- (BOOL)isBeta
{
  return [(LSApplicationRecord *)self->_record isBeta];
}

- (int64_t)betaExternalVersionID
{
  v2 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  id v3 = [v2 betaVersionIdentifier];

  return (int64_t)v3;
}

- (NSString)deviceIdentifierForVendor
{
  deviceIdentifierForVendor = self->_deviceIdentifierForVendor;
  if (!deviceIdentifierForVendor)
  {
    id v4 = [(LSApplicationRecord *)self->_record deviceIdentifierForVendor];
    unsigned __int8 v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 UUIDString];
      unsigned int v7 = self->_deviceIdentifierForVendor;
      self->_deviceIdentifierForVendor = v6;
    }
    deviceIdentifierForVendor = self->_deviceIdentifierForVendor;
  }
  return deviceIdentifierForVendor;
}

- (NSArray)extensionReceiptURLs
{
  extensionReceiptURLs = self->_extensionReceiptURLs;
  if (!extensionReceiptURLs)
  {
    id v4 = [(LSApplicationRecord *)self->_record applicationExtensionRecords];
    unsigned __int8 v5 = [v4 objectEnumerator];
    uint64_t v6 = sub_10041E130(v5, &stru_10052CA38);

    sub_100017560((uint64_t)Optional, v6);
    unsigned int v7 = (Optional *)objc_claimAutoreleasedReturnValue();
    id v8 = self->_extensionReceiptURLs;
    self->_extensionReceiptURLs = v7;

    extensionReceiptURLs = self->_extensionReceiptURLs;
  }
  return (NSArray *)sub_10000B188(extensionReceiptURLs, &__NSArray0__struct);
}

- (BOOL)isB2BCustomApp
{
  v2 = sub_10042889C(self->_record);
  unsigned __int8 v3 = [v2 isB2BCustomApp];

  return v3;
}

- (NSNumber)ratingRank
{
  v2 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  unsigned __int8 v3 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v2 ratingRank]);

  return (NSNumber *)v3;
}

- (NSURL)receiptURL
{
  return (NSURL *)sub_1003DA0E4(self->_record);
}

- (NSString)storeCohort
{
  p_storeCohort = &self->_storeCohort;
  storeCohort = self->_storeCohort;
  if (!storeCohort)
  {
    unsigned __int8 v5 = [(LSApplicationRecord *)self->_record iTunesMetadata];
    uint64_t v6 = [v5 storeCohort];

    if (v6 && [v6 length]) {
      objc_storeStrong((id *)p_storeCohort, v6);
    }

    storeCohort = *p_storeCohort;
  }
  return storeCohort;
}

- (int64_t)storeExternalVersionID
{
  v2 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  id v3 = [v2 versionIdentifier];

  return (int64_t)v3;
}

- (NSNumber)storefront
{
  if (!self->_storefront)
  {
    id v3 = [(LSApplicationRecord *)self->_record iTunesMetadata];
    id v4 = [v3 storeFront];

    if (v4)
    {
      unsigned __int8 v5 = [(LSApplicationRecord *)self->_record iTunesMetadata];
      +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v5 storeFront]);
      uint64_t v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      storefront = self->_storefront;
      self->_storefront = v6;
    }
  }
  id v8 = self->_storefront;
  return v8;
}

- (int64_t)storeItemID
{
  v2 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  id v3 = [v2 storeItemIdentifier];

  return (int64_t)v3;
}

- (MIStoreMetadata)storeMetadata
{
  storeMetadata = self->_storeMetadata;
  if (storeMetadata) {
    goto LABEL_6;
  }
  id v4 = sub_10042889C(self->_record);
  if (v4) {
    sub_100017560((uint64_t)Optional, v4);
  }
  else {
    sub_10038E38C();
  }
  unsigned __int8 v5 = (Optional *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = self->_storeMetadata;
  self->_storeMetadata = v5;

  storeMetadata = self->_storeMetadata;
  if (storeMetadata)
  {
LABEL_6:
    if (storeMetadata->_hasValue) {
      storeMetadata = (Optional *)objc_getProperty(storeMetadata, a2, 16, 1);
    }
    else {
      storeMetadata = 0;
    }
  }
  return (MIStoreMetadata *)storeMetadata;
}

- (BOOL)isStoreOriginated
{
  if ([(ApplicationProxy *)self storeItemID] < 1) {
    return 0;
  }
  else {
    return sub_1000173A0(self->_record) ^ 1;
  }
}

- (NSString)thinningVariantID
{
  v2 = [(LSApplicationRecord *)self->_record iTunesMetadata];
  id v3 = [v2 variantID];

  return (NSString *)v3;
}

- (BOOL)isConfiguratorInstall
{
  v2 = [(ApplicationProxy *)self storeMetadata];
  unsigned __int8 v3 = [v2 sideLoadedDeviceBasedVPP];

  return v3;
}

- (BOOL)isFactoryInstall
{
  v2 = [(ApplicationProxy *)self storeMetadata];
  unsigned __int8 v3 = [v2 isFactoryInstall];

  return v3;
}

+ (void)enumerateApplicationsOfType:(unint64_t)a3 usingBlock:(id)a4
{
  id v5 = a4;
  if (a3 == 2)
  {
    uint64_t v6 = +[LSApplicationRecord enumeratorWithOptions:0];
    unsigned int v7 = v6;
    id v8 = &stru_10052CA98;
  }
  else if (a3 == 1)
  {
    uint64_t v6 = +[LSApplicationRecord enumeratorWithOptions:1];
    unsigned int v7 = v6;
    id v8 = &stru_10052CA78;
  }
  else
  {
    if (a3)
    {
      unsigned int v7 = 0;
      goto LABEL_9;
    }
    uint64_t v6 = +[LSApplicationRecord enumeratorWithOptions:0];
    unsigned int v7 = v6;
    id v8 = &stru_10052CA58;
  }
  [v6 setFilter:v8];
LABEL_9:
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1003F1298;
  v10[3] = &unk_10052CAC0;
  id v11 = v5;
  id v9 = v5;
  sub_10041DE14(v7, v10);
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)ApplicationProxy;
  unsigned __int8 v3 = [(ApplicationProxy *)&v11 description];
  id v4 = [(ApplicationProxy *)self bundleID];
  id v5 = [(ApplicationProxy *)self shortVersionString];
  int64_t v6 = [(ApplicationProxy *)self storeItemID];
  int64_t v7 = [(ApplicationProxy *)self storeExternalVersionID];
  id v8 = [(ApplicationProxy *)self bundlePath];
  id v9 = +[NSString stringWithFormat:@"%@: (%@, %@, %lld:%lld %@) ", v3, v4, v5, v6, v7, v8];

  return v9;
}

- (LSApplicationRecord)record
{
  return self->_record;
}

- (void)setDownloaderDSID:(id)a3
{
}

- (void)setFamilyID:(id)a3
{
}

- (void)setPurchaserDSID:(id)a3
{
}

- (void)setAppClip:(BOOL)a3
{
  self->_appClip = a3;
}

- (void)setParentApplicationBundleID:(id)a3
{
}

- (void)setAppClipIsConfiguredForIAP:(BOOL)a3
{
  self->_appClipIsConfiguredForIAP = a3;
}

- (void)setAppPlatform:(unint64_t)a3
{
  self->_appPlatform = a3;
}

- (void)setBundleID:(id)a3
{
}

- (void)setBundlePath:(id)a3
{
}

- (void)setBundleURL:(id)a3
{
}

- (void)setBundleVersion:(id)a3
{
}

- (void)setCanonicalExecutablePath:(id)a3
{
}

- (void)setLocalizedName:(id)a3
{
}

- (void)setShortVersionString:(id)a3
{
}

- (int64_t)softwarePlatform
{
  return self->_softwarePlatform;
}

- (void)setVendorName:(id)a3
{
}

- (void)setAppleSigned:(BOOL)a3
{
  self->_appleSigned = a3;
}

- (void)setProfileValidated:(BOOL)a3
{
  self->_profileValidated = a3;
}

- (void)setHasMIDBasedSINF:(BOOL)a3
{
  self->_hasMIDBasedSINF = a3;
}

- (void)setMissingRequiredSINF:(BOOL)a3
{
  self->_missingRequiredSINF = a3;
}

- (void)setApplicationType:(unint64_t)a3
{
  self->_applicationType = a3;
}

- (void)setInstalled:(BOOL)a3
{
  self->_installed = a3;
}

- (void)setOffloaded:(BOOL)a3
{
  self->_offloaded = a3;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (void)setArcade:(BOOL)a3
{
  self->_arcade = a3;
}

- (void)setBeta:(BOOL)a3
{
  self->_beta = a3;
}

- (void)setBetaExternalVersionID:(int64_t)a3
{
  self->_betaExternalVersionID = a3;
}

- (void)setDeviceIdentifierForVendor:(id)a3
{
}

- (void)setStoreCohort:(id)a3
{
}

- (void)setStoreExternalVersionID:(int64_t)a3
{
  self->_storeExternalVersionID = a3;
}

- (void)setStorefront:(id)a3
{
}

- (void)setStoreItemID:(int64_t)a3
{
  self->_storeItemID = a3;
}

- (void)setStoreOriginated:(BOOL)a3
{
  self->_storeOriginated = a3;
}

- (void)setThinningVariantID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionBundleID, 0);
  objc_storeStrong((id *)&self->_thinningVariantID, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_storeCohort, 0);
  objc_storeStrong((id *)&self->_deviceIdentifierForVendor, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_shortVersionString, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_canonicalExecutablePath, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_parentApplicationBundleID, 0);
  objc_storeStrong((id *)&self->_purchaserDSID, 0);
  objc_storeStrong((id *)&self->_familyID, 0);
  objc_storeStrong((id *)&self->_downloaderDSID, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_storeMetadata, 0);
  objc_storeStrong((id *)&self->_extensionReceiptURLs, 0);
  objc_storeStrong((id *)&self->_appClipIsConfiguredForIAPValue, 0);
}

@end