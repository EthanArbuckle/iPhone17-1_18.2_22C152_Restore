@interface AMSMappedBundleInfo
+ (AMSMappedBundleInfo)currentBundleInfo;
+ (id)_accountMediaTypeForClientName:(id)a3 bundleID:(id)a4;
+ (id)_clientNameFromProcessInfo:(id)a3;
+ (id)_clientVersionFromProcessInfo:(id)a3 clientName:(id)a4;
+ (id)accountMediaTypeInfoForProcessInfo:(id)a3;
+ (id)bundleInfoForMobileAppStoreWithProcessInfo:(id)a3;
+ (id)bundleInfoForProcessInfo:(id)a3;
- (NSString)accountMediaType;
- (NSString)bundleIdentifier;
- (NSString)clientName;
- (NSString)clientVersion;
- (NSString)proxyAppBundleID;
- (NSString)scheme;
- (NSString)secureScheme;
- (NSString)userAgentSuffix;
- (id)_initWithClient:(int64_t)a3 processInfo:(id)a4;
- (void)setAccountMediaType:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setClientName:(id)a3;
- (void)setClientVersion:(id)a3;
- (void)setProxyAppBundleID:(id)a3;
- (void)setScheme:(id)a3;
- (void)setSecureScheme:(id)a3;
- (void)setUserAgentSuffix:(id)a3;
@end

@implementation AMSMappedBundleInfo

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (NSString)clientName
{
  return self->_clientName;
}

+ (id)accountMediaTypeInfoForProcessInfo:(id)a3
{
  return 0;
}

+ (id)bundleInfoForProcessInfo:(id)a3
{
  id v3 = a3;
  v4 = [v3 bundleIdentifier];
  uint64_t v5 = [v4 lowercaseString];
  v6 = (void *)v5;
  v7 = &stru_1EDCA7308;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  v8 = v7;

  v9 = [&unk_1EDD01AE8 objectForKeyedSubscript:v8];

  uint64_t v10 = [v9 integerValue];
  id v11 = [[AMSMappedBundleInfo alloc] _initWithClient:v10 processInfo:v3];

  return v11;
}

- (id)_initWithClient:(int64_t)a3 processInfo:(id)a4
{
  id v6 = a4;
  v39.receiver = self;
  v39.super_class = (Class)AMSMappedBundleInfo;
  v7 = [(AMSMappedBundleInfo *)&v39 init];
  if (!v7) {
    goto LABEL_44;
  }
  int64_t v8 = a3 - 1;
  char v9 = 0;
  char v10 = 0;
  id v11 = @"macappstores";
  v12 = @"macappstore";
  v13 = @"3.0";
  v14 = @"MacAppStore";
  v15 = @"com.apple.AppStore";
  switch(v8)
  {
    case 0:
      v16 = 0;
      v17 = 0;
      v18 = 0;
      char v19 = 0;
      v15 = 0;
      char v10 = 1;
      LOBYTE(v20) = 1;
      v38 = @"AppleTV";
      break;
    case 1:
      char v9 = 0;
      v13 = 0;
      id v11 = @"itms-appss";
      v12 = @"itms-apps";
      char v10 = 1;
      v14 = @"AppStore";
      goto LABEL_29;
    case 2:
      char v9 = 0;
      v13 = 0;
      id v11 = @"itms-bookss";
      v12 = @"itms-books";
      char v10 = 1;
      v14 = @"iBooks";
      v15 = @"com.apple.iBooks";
      goto LABEL_29;
    case 3:
      char v9 = 0;
      v13 = 0;
      v12 = 0;
      id v11 = 0;
      char v10 = 1;
      v14 = @"AMSFollowUpExtension";
      v15 = @"com.apple.AppleMediaServices.FollowUpExtension";
      goto LABEL_29;
    case 4:
      char v9 = 0;
      v13 = 0;
      v12 = 0;
      id v11 = 0;
      char v10 = 1;
      v14 = @"itunesstored";
      v15 = @"com.apple.itunesstored";
      goto LABEL_29;
    case 5:
      char v9 = 0;
      v13 = 0;
      id v11 = @"itms-itunesus";
      v12 = @"itms-itunesu";
      char v10 = 1;
      v14 = @"iTunesU";
      v15 = @"com.apple.itunesu";
      goto LABEL_29;
    case 6:
      char v9 = 0;
      v13 = 0;
      v12 = 0;
      id v11 = 0;
      char v10 = 1;
      v14 = @"Maps";
      v15 = @"com.apple.Maps";
      goto LABEL_29;
    case 7:
      char v9 = 0;
      v13 = 0;
      v12 = 0;
      id v11 = 0;
      char v10 = 1;
      v14 = @"matd";
      v15 = @"com.apple.WelcomeKit";
      goto LABEL_29;
    case 8:
      char v9 = 0;
      v13 = 0;
      v12 = 0;
      id v11 = 0;
      char v10 = 1;
      v14 = @"Messages";
      v15 = @"com.apple.MobileSMS";
      goto LABEL_29;
    case 9:
      char v9 = 0;
      v13 = 0;
      id v11 = @"itmss";
      v12 = @"itms";
      char v10 = 1;
      v14 = @"MobileStore";
      v15 = @"com.apple.MobileStore";
      goto LABEL_29;
    case 10:
      char v9 = 0;
      v13 = 0;
      id v11 = @"musics";
      v12 = @"music";
      goto LABEL_25;
    case 11:
    case 22:
      char v9 = 0;
      v13 = 0;
      v12 = @"itms-podcasts";
      char v10 = 1;
      v14 = @"Podcasts";
      v15 = @"com.apple.podcasts";
      goto LABEL_27;
    case 12:
      char v9 = 0;
      v13 = 0;
      v12 = 0;
      id v11 = 0;
      char v10 = 1;
      v14 = @"StoreKitUIService";
      v15 = @"com.apple.StoreKitUIService";
      goto LABEL_29;
    case 13:
      v14 = 0;
      v13 = 0;
      id v11 = @"its-videoss";
      v12 = @"its-videos";
      char v9 = 1;
      char v10 = 1;
      v15 = @"com.apple.videos";
      goto LABEL_29;
    case 14:
      v18 = 0;
      char v19 = 0;
      v15 = 0;
      v38 = @"Watch";
      char v10 = 1;
      v17 = @"itms-watch";
      LOBYTE(v20) = 1;
      v16 = @"itms-watchs";
      break;
    case 15:
      v14 = 0;
      v13 = 0;
      v12 = @"fitnessapp";
      char v9 = 1;
      v15 = @"com.apple.Fitness";
      char v10 = 1;
      goto LABEL_27;
    case 16:
      v14 = 0;
      v13 = 0;
      char v9 = 1;
      v15 = @"com.apple.tv";
      char v10 = 1;
      v12 = @"com.apple.tv";
      id v11 = @"com.apple.tv";
      goto LABEL_29;
    case 17:
    case 24:
      char v9 = 0;
      v13 = 0;
      id v11 = @"applenewss";
      v12 = @"applenews";
      char v10 = 1;
      v14 = @"News";
      v15 = @"com.apple.news";
      goto LABEL_29;
    case 18:
      goto LABEL_29;
    case 19:
      char v9 = 0;
      v13 = 0;
      id v11 = @"itms-bookss";
      v12 = @"itms-books";
      char v10 = 1;
      v14 = @"iBooks";
      v15 = @"com.apple.iBooksX";
      goto LABEL_29;
    case 20:
      char v9 = 0;
      v13 = 0;
      v12 = 0;
      id v11 = 0;
      char v10 = 1;
      v14 = @"Configurator";
      v15 = @"com.apple.configurator.ui";
      goto LABEL_29;
    case 21:
      char v9 = 0;
      v13 = 0;
      id v11 = @"itmss";
      v12 = @"itms";
LABEL_25:
      char v10 = 1;
      v14 = @"Music";
      v15 = @"com.apple.Music";
      goto LABEL_29;
    case 23:
      char v9 = 0;
      v13 = 0;
      v12 = @"com.apple.tv";
      char v10 = 1;
      v14 = @"TV";
      v15 = @"com.apple.TV";
LABEL_27:
      id v11 = v12;
      goto LABEL_29;
    case 25:
      char v9 = 0;
      v13 = 0;
      char v10 = 1;
      v14 = @"iCloudQuota";
      v15 = @"com.apple.iCloudQuota.ICQFollowup";
LABEL_29:
      v38 = v14;
      v21 = [v6 bundleIdentifier];
      uint64_t v20 = [v21 compare:v15 options:1];

      if (v20)
      {
        v22 = [[AMSProcessInfo alloc] initWithBundleIdentifier:v15];

        LOBYTE(v20) = 0;
        id v6 = v22;
      }
      v18 = v13;
      char v19 = v9;
      v17 = v12;
      v16 = v11;
      break;
    default:
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v38 = 0;
      v15 = 0;
      char v10 = 1;
      char v19 = 1;
      LOBYTE(v20) = 1;
      break;
  }
  if (!v6)
  {
    id v6 = +[AMSProcessInfo currentProcess];
    if (v20) {
      goto LABEL_34;
    }
LABEL_36:
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = &v15->isa;
    goto LABEL_37;
  }
  if ((v20 & 1) == 0) {
    goto LABEL_36;
  }
LABEL_34:
  uint64_t v23 = [v6 bundleIdentifier];
  bundleIdentifier = v7->_bundleIdentifier;
  v7->_bundleIdentifier = (NSString *)v23;
LABEL_37:

  if (v19)
  {
    uint64_t v25 = +[AMSMappedBundleInfo _clientNameFromProcessInfo:v6];
    clientName = v7->_clientName;
    v7->_clientName = (NSString *)v25;
  }
  else
  {
    clientName = v7->_clientName;
    v7->_clientName = &v38->isa;
  }

  if (v10)
  {
    uint64_t v27 = +[AMSMappedBundleInfo _clientVersionFromProcessInfo:v6 clientName:v7->_clientName];
    clientVersion = v7->_clientVersion;
    v7->_clientVersion = (NSString *)v27;
  }
  else
  {
    clientVersion = v7->_clientVersion;
    v7->_clientVersion = &v18->isa;
  }

  uint64_t v29 = +[AMSMappedBundleInfo _accountMediaTypeForClientName:v7->_clientName bundleID:v7->_bundleIdentifier];
  accountMediaType = v7->_accountMediaType;
  v7->_accountMediaType = (NSString *)v29;

  scheme = v7->_scheme;
  v7->_scheme = &v17->isa;

  secureScheme = v7->_secureScheme;
  v7->_secureScheme = &v16->isa;

  uint64_t v33 = [v6 proxyAppBundleID];
  proxyAppBundleID = v7->_proxyAppBundleID;
  v7->_proxyAppBundleID = (NSString *)v33;

  uint64_t v35 = [v6 userAgentSuffix];
  userAgentSuffix = v7->_userAgentSuffix;
  v7->_userAgentSuffix = (NSString *)v35;

LABEL_44:
  return v7;
}

+ (id)_clientVersionFromProcessInfo:(id)a3 clientName:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![a4 isEqualToString:@"Messages"]) {
    goto LABEL_15;
  }
  id v6 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/Messages/iMessageBalloons/ASMessagesProvider.bundle"];
  v7 = [v6 infoDictionary];

  if (!v7
    || ([v7 objectForKey:*MEMORY[0x1E4F1CC70]],
        int64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
LABEL_15:
    int64_t v8 = [v5 clientVersion];
    if (!v8)
    {
      char v9 = +[AMSLogConfig sharedConfig];
      if (!v9)
      {
        char v9 = +[AMSLogConfig sharedConfig];
      }
      char v10 = [v9 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v11 = objc_opt_class();
        id v12 = v11;
        v13 = [v5 bundleIdentifier];
        int v15 = 138543618;
        v16 = v11;
        __int16 v17 = 2114;
        v18 = v13;
        _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: Couldn't find %{public}@ store version (iOS), falling back to hardcoded", (uint8_t *)&v15, 0x16u);
      }
      int64_t v8 = @"1.0";
    }
  }

  return v8;
}

+ (id)_accountMediaTypeForClientName:(id)a3 bundleID:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = AMSAccountMediaTypeProduction;
  if (_MergedGlobals_119 != -1) {
    dispatch_once(&_MergedGlobals_119, &__block_literal_global_71);
  }
  id v9 = (id)qword_1EB38DC88;
  objc_sync_enter(v9);
  if (v6 && ([v9 containsObject:v6] & 1) == 0)
  {
    [v9 addObject:v6];
    objc_sync_exit(v9);

    char v10 = +[AMSLogConfig sharedAccountsConfig];
    if (!v10)
    {
      char v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      v13 = NSStringFromSelector(a2);
      int v15 = 138544386;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      v18 = v13;
      __int16 v19 = 2114;
      id v20 = v7;
      __int16 v21 = 2114;
      id v22 = v6;
      __int16 v23 = 2114;
      v24 = v8;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ -> %{public}@ (%{public}@) = %{public}@", (uint8_t *)&v15, 0x34u);
    }
  }
  else
  {
    objc_sync_exit(v9);
  }
  return v8;
}

+ (id)_clientNameFromProcessInfo:(id)a3
{
  id v3 = a3;
  v4 = [v3 bundleIdentifier];
  if (!v4)
  {
    uint64_t v5 = [v3 executableName];
    if (v5) {
      v4 = (__CFString *)v5;
    }
    else {
      v4 = @"itunesstored";
    }
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgentSuffix, 0);
  objc_storeStrong((id *)&self->_proxyAppBundleID, 0);
  objc_storeStrong((id *)&self->_accountMediaType, 0);
  objc_storeStrong((id *)&self->_secureScheme, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (NSString)userAgentSuffix
{
  return self->_userAgentSuffix;
}

uint64_t __63__AMSMappedBundleInfo__accountMediaTypeForClientName_bundleID___block_invoke()
{
  qword_1EB38DC88 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  return MEMORY[0x1F41817F8]();
}

- (NSString)accountMediaType
{
  return self->_accountMediaType;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

+ (AMSMappedBundleInfo)currentBundleInfo
{
  id v3 = +[AMSProcessInfo currentProcess];
  v4 = [a1 bundleInfoForProcessInfo:v3];

  return (AMSMappedBundleInfo *)v4;
}

+ (id)bundleInfoForMobileAppStoreWithProcessInfo:(id)a3
{
  id v3 = a3;
  id v4 = [[AMSMappedBundleInfo alloc] _initWithClient:2 processInfo:v3];

  return v4;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)setClientName:(id)a3
{
}

- (void)setClientVersion:(id)a3
{
}

- (NSString)scheme
{
  return self->_scheme;
}

- (void)setScheme:(id)a3
{
}

- (NSString)secureScheme
{
  return self->_secureScheme;
}

- (void)setSecureScheme:(id)a3
{
}

- (void)setAccountMediaType:(id)a3
{
}

- (NSString)proxyAppBundleID
{
  return self->_proxyAppBundleID;
}

- (void)setProxyAppBundleID:(id)a3
{
}

- (void)setUserAgentSuffix:(id)a3
{
}

@end