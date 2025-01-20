@interface CPSWebClip
+ (NSArray)appClips;
- (BOOL)isApplicationInstalled;
- (BOOL)isPoweredBy;
- (BOOL)scenelessBackgroundLaunch;
- (CGImage)iconImage;
- (NSDate)lastActivatedTime;
- (NSDictionary)_dictionaryRepresentation;
- (NSSet)trustedClientBundleIdentifiers;
- (NSString)_temporaryIconPath;
- (NSString)applicationBundleIdentifier;
- (NSString)bundleIdentifier;
- (NSString)fullAppCaption;
- (NSString)fullAppName;
- (NSString)iconImagePath;
- (NSString)identifier;
- (NSString)localizedSubtitle;
- (NSString)title;
- (NSURL)fullAppStoreURL;
- (NSURL)pageURL;
- (NSURL)registeredURL;
- (NSUUID)uuid;
- (NSUserActivity)appClipUserActivity;
- (id)_bundleResourceWithName:(id)a3;
- (id)_init;
- (id)_initWithIdentifier:(id)a3 webClipDictionary:(id)a4;
- (id)description;
- (int64_t)webClipType;
- (unint64_t)bundleVersion;
- (void)_updateWithClipMetadata:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setFullAppCaption:(id)a3;
- (void)setFullAppName:(id)a3;
- (void)setFullAppStoreURL:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastActivatedTime:(id)a3;
- (void)setPageURL:(id)a3;
- (void)setPoweredBy:(BOOL)a3;
- (void)setRegisteredURL:(id)a3;
- (void)setScenelessBackgroundLaunch:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)set_temporaryIconPath:(id)a3;
@end

@implementation CPSWebClip

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)CPSWebClip;
  v2 = [(CPSWebClip *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    v4 = [v3 UUIDString];
    uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"-" withString:&stru_26C629F40];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v5;

    v2->_bundleVersion = 1;
    v2->_webClipType = 1;
    v7 = v2;
  }

  return v2;
}

- (id)_initWithIdentifier:(id)a3 webClipDictionary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v36.receiver = self;
  v36.super_class = (Class)CPSWebClip;
  objc_super v9 = [(CPSWebClip *)&v36 init];
  if (v9)
  {
    v10 = NSURL;
    v11 = objc_msgSend(v8, "safari_stringForKey:", @"URL");
    v12 = [v10 URLWithString:v11];
    [(CPSWebClip *)v9 setPageURL:v12];

    v13 = NSURL;
    v14 = objc_msgSend(v8, "safari_stringForKey:", @"RegisteredURL");
    v15 = [v13 URLWithString:v14];
    [(CPSWebClip *)v9 setRegisteredURL:v15];

    objc_storeStrong((id *)&v9->_identifier, a3);
    uint64_t v16 = objc_msgSend(v8, "safari_stringForKey:", @"Title");
    title = v9->_title;
    v9->_title = (NSString *)v16;

    uint64_t v18 = objc_msgSend(v8, "safari_stringForKey:", @"ApplicationBundleIdentifier");
    applicationBundleIdentifier = v9->_applicationBundleIdentifier;
    v9->_applicationBundleIdentifier = (NSString *)v18;

    v20 = objc_msgSend(v8, "safari_arrayForKey:", @"TrustedClientBundleIdentifiers");
    if ([v20 count])
    {
      uint64_t v21 = [MEMORY[0x263EFFA08] setWithArray:v20];
      trustedClientBundleIdentifiers = v9->_trustedClientBundleIdentifiers;
      v9->_trustedClientBundleIdentifiers = (NSSet *)v21;
    }
    v9->_bundleVersion = (int)objc_msgSend(v8, "_web_intForKey:", @"ApplicationBundleVersion");
    v9->_scenelessBackgroundLaunch = objc_msgSend(v8, "safari_BOOLForKey:", @"ScenelessBackgroundLaunch");
    v9->_poweredBy = objc_msgSend(v8, "safari_BOOLForKey:", @"PoweredBy");
    uint64_t v23 = objc_msgSend(v8, "safari_stringForKey:", @"FullAppName");
    fullAppName = v9->_fullAppName;
    v9->_fullAppName = (NSString *)v23;

    uint64_t v25 = objc_msgSend(v8, "safari_stringForKey:", @"FullAppCaption");
    fullAppCaption = v9->_fullAppCaption;
    v9->_fullAppCaption = (NSString *)v25;

    v27 = NSURL;
    v28 = objc_msgSend(v8, "safari_stringForKey:", @"FullAppStoreURL");
    uint64_t v29 = [v27 URLWithString:v28];
    fullAppStoreURL = v9->_fullAppStoreURL;
    v9->_fullAppStoreURL = (NSURL *)v29;

    uint64_t v31 = objc_msgSend(v8, "safari_dateForKey:", @"LastActivatedTime");
    lastActivatedTime = v9->_lastActivatedTime;
    v9->_lastActivatedTime = (NSDate *)v31;

    if (objc_msgSend(v8, "safari_BOOLForKey:", @"IsAppClip"))
    {
      uint64_t v33 = 1;
    }
    else if ([(NSString *)v9->_applicationBundleIdentifier isEqualToString:@"com.apple.shortcuts"])
    {
      uint64_t v33 = 4;
    }
    else if (objc_msgSend(v8, "safari_BOOLForKey:", @"FullScreen"))
    {
      uint64_t v33 = 3;
    }
    else
    {
      if (v9->_applicationBundleIdentifier)
      {
        v9->_webClipType = 0;
LABEL_14:
        v34 = v9;

        goto LABEL_15;
      }
      uint64_t v33 = 2;
    }
    v9->_webClipType = v33;
    goto LABEL_14;
  }
LABEL_15:

  return v9;
}

- (void)_updateWithClipMetadata:(id)a3
{
  id v22 = a3;
  self->_poweredBy = [v22 isPoweredByThirdParty];
  v4 = [v22 bundleDisplayName];
  uint64_t v5 = v4;
  if (self->_poweredBy || ![v4 length])
  {
    v6 = [v22 clipName];
  }
  else
  {
    v6 = [v22 bundleDisplayName];
  }
  title = self->_title;
  self->_title = v6;

  id v8 = [v22 clipBundleID];
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  self->_applicationBundleIdentifier = v8;

  if ([v22 hasFullAppInstalledOnSystem])
  {
    v10 = [v22 fullAppBundleID];
    v11 = self->_applicationBundleIdentifier;
    self->_applicationBundleIdentifier = v10;
  }
  v12 = [v22 fullAppCachedIconFilePath];
  temporaryIconPath = self->_temporaryIconPath;
  self->_temporaryIconPath = v12;

  v14 = [v22 fullAppName];
  fullAppName = self->_fullAppName;
  self->_fullAppName = v14;

  uint64_t v16 = [v22 fullAppCaption];
  fullAppCaption = self->_fullAppCaption;
  self->_fullAppCaption = v16;

  uint64_t v18 = [v22 fullAppStoreURL];
  fullAppStoreURL = self->_fullAppStoreURL;
  self->_fullAppStoreURL = v18;

  v20 = [v22 clipLaunchURL];
  [(CPSWebClip *)self setPageURL:v20];

  uint64_t v21 = [v22 clipURL];
  [(CPSWebClip *)self setRegisteredURL:v21];
}

- (NSDictionary)_dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  pageURL = self->_pageURL;
  if (pageURL)
  {
    uint64_t v5 = [(NSURL *)pageURL absoluteString];
    if (v5) {
      [v3 setObject:v5 forKeyedSubscript:@"URL"];
    }
  }
  registeredURL = self->_registeredURL;
  if (registeredURL)
  {
    id v7 = [(NSURL *)registeredURL absoluteString];
    if (v7) {
      [v3 setObject:v7 forKeyedSubscript:@"RegisteredURL"];
    }
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKeyedSubscript:@"Title"];
  }
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  if (applicationBundleIdentifier) {
    [v3 setObject:applicationBundleIdentifier forKeyedSubscript:@"ApplicationBundleIdentifier"];
  }
  if (self->_bundleVersion)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v10 forKeyedSubscript:@"ApplicationBundleVersion"];
  }
  fullAppName = self->_fullAppName;
  if (fullAppName) {
    [v3 setObject:fullAppName forKeyedSubscript:@"FullAppName"];
  }
  fullAppCaption = self->_fullAppCaption;
  if (fullAppCaption) {
    [v3 setObject:fullAppCaption forKeyedSubscript:@"FullAppCaption"];
  }
  fullAppStoreURL = self->_fullAppStoreURL;
  if (fullAppStoreURL)
  {
    v14 = [(NSURL *)fullAppStoreURL absoluteString];
    if (v14) {
      [v3 setObject:v14 forKeyedSubscript:@"FullAppStoreURL"];
    }
  }
  v15 = [NSNumber numberWithBool:self->_scenelessBackgroundLaunch];
  [v3 setObject:v15 forKeyedSubscript:@"ScenelessBackgroundLaunch"];

  [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"IsAppClip"];
  uint64_t v16 = [NSNumber numberWithBool:self->_poweredBy];
  [v3 setObject:v16 forKeyedSubscript:@"PoweredBy"];

  lastActivatedTime = self->_lastActivatedTime;
  if (lastActivatedTime) {
    [v3 setObject:lastActivatedTime forKeyedSubscript:@"LastActivatedTime"];
  }

  return (NSDictionary *)v3;
}

- (id)_bundleResourceWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CPSWebClipStore _urlForWebClipWithIdentifier:self->_identifier];
  if (v5)
  {
    v6 = [MEMORY[0x263F086E0] bundleWithURL:v5];
    id v7 = [v6 URLForResource:v4 withExtension:@"png" subdirectory:0];
    id v8 = v7;
    if (v7)
    {
      objc_super v9 = [v7 path];
    }
    else
    {
      objc_super v9 = 0;
    }
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (NSUUID)uuid
{
  if ([(NSString *)self->_identifier length] == 32)
  {
    id v3 = NSString;
    id v4 = -[NSString substringWithRange:](self->_identifier, "substringWithRange:", 0, 8);
    uint64_t v5 = -[NSString substringWithRange:](self->_identifier, "substringWithRange:", 8, 4);
    v6 = -[NSString substringWithRange:](self->_identifier, "substringWithRange:", 12, 4);
    id v7 = -[NSString substringWithRange:](self->_identifier, "substringWithRange:", 16, 4);
    id v8 = -[NSString substringWithRange:](self->_identifier, "substringWithRange:", 20, 12);
    objc_super v9 = [v3 stringWithFormat:@"%@-%@-%@-%@-%@", v4, v5, v6, v7, v8];

    v10 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v9];
  }
  else
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:self->_identifier];
  }

  return (NSUUID *)v10;
}

- (NSString)title
{
  if (self->_title) {
    return self->_title;
  }
  else {
    return (NSString *)@"Untitled";
  }
}

- (NSString)bundleIdentifier
{
  int64_t webClipType = self->_webClipType;
  if (webClipType == 3)
  {
    identifier = self->_identifier;
    id v4 = @"com.apple.webapp-";
    goto LABEL_5;
  }
  if (webClipType == 1)
  {
    identifier = self->_identifier;
    id v4 = @"com.apple.appclip-";
LABEL_5:
    uint64_t v5 = [(__CFString *)v4 stringByAppendingString:identifier];
    goto LABEL_7;
  }
  uint64_t v5 = self->_identifier;
LABEL_7:

  return v5;
}

- (NSUserActivity)appClipUserActivity
{
  id v3 = objc_alloc(MEMORY[0x263F018D0]);
  id v4 = (void *)[v3 initWithActivityType:*MEMORY[0x263F08658]];
  [v4 setWebpageURL:self->_pageURL];

  return (NSUserActivity *)v4;
}

- (void)setPageURL:(id)a3
{
  id v5 = a3;
  if (objc_msgSend(v5, "cps_isHTTPFamilyURL")) {
    objc_storeStrong((id *)&self->_pageURL, a3);
  }
}

- (void)setRegisteredURL:(id)a3
{
  id v5 = a3;
  if (objc_msgSend(v5, "cps_isHTTPFamilyURL")) {
    objc_storeStrong((id *)&self->_registeredURL, a3);
  }
}

- (NSString)iconImagePath
{
  v2 = [(CPSWebClip *)self _bundleResourceWithName:@"icon"];
  id v3 = [MEMORY[0x263F08850] defaultManager];
  if ([v3 fileExistsAtPath:v2]) {
    id v4 = v2;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (CGImage)iconImage
{
  result = self->_iconImage;
  if (!result)
  {
    id v4 = [(CPSWebClip *)self _bundleResourceWithName:@"icon"];
    id v5 = v4;
    if (v4) {
      self->_iconImage = CPSCreateImageWithContentsOfFile(v4);
    }

    return self->_iconImage;
  }
  return result;
}

+ (NSArray)appClips
{
  v2 = +[CPSWebClipStore sharedStore];
  id v3 = [v2 _fetchInstalledAppClips];

  return (NSArray *)v3;
}

- (NSString)localizedSubtitle
{
  if (self->_webClipType == 1)
  {
    id v3 = dispatch_group_create();
    dispatch_group_enter(v3);
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__4;
    uint64_t v25 = __Block_byref_object_dispose__4;
    id v26 = 0;
    id v4 = +[CPSClipDataSQLiteStore defaultStore];
    applicationBundleIdentifier = self->_applicationBundleIdentifier;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __31__CPSWebClip_localizedSubtitle__block_invoke;
    v17[3] = &unk_26424EEB0;
    v6 = v3;
    v19 = self;
    v20 = &v21;
    uint64_t v18 = v6;
    [v4 getAppClipRecordWithBundleID:applicationBundleIdentifier completion:v17];

    dispatch_time_t v7 = dispatch_time(0, 5000000000);
    dispatch_group_wait(v6, v7);
    if ([(id)v22[5] length])
    {
      id v8 = (id)v22[5];
    }
    else
    {
      id v9 = objc_alloc(MEMORY[0x263F01878]);
      v10 = self->_applicationBundleIdentifier;
      id v16 = 0;
      v11 = (void *)[v9 initWithBundleIdentifier:v10 allowPlaceholder:1 error:&v16];
      id v12 = v16;
      v13 = [v11 localizedName];
      v14 = v13;
      if (v12 || ![v13 length])
      {
        id v8 = 0;
      }
      else
      {
        id v8 = +[CPSUtilities poweredByCaptionForAppName:v14];
      }
    }
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    id v8 = 0;
  }

  return (NSString *)v8;
}

void __31__CPSWebClip_localizedSubtitle__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int8 *)(v4 + 25);
    if (*(unsigned char *)(v4 + 25))
    {
      uint64_t v2 = [v7 fullApplicationName];
      +[CPSUtilities poweredByCaptionForAppName:v2];
    }
    else
    {
      [v7 fullApplicationCaption];
    v6 = };
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v6);
    if (v5)
    {

      v6 = (void *)v2;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)description
{
  identifier = self->_identifier;
  uint64_t v25 = NSString;
  v27 = [(CPSWebClip *)self uuid];
  uint64_t v23 = [v27 UUIDString];
  int64_t v21 = [(CPSWebClip *)self webClipType];
  v19 = [(CPSWebClip *)self title];
  unint64_t v18 = [(CPSWebClip *)self bundleVersion];
  v30 = [(CPSWebClip *)self bundleIdentifier];
  BOOL v17 = [(CPSWebClip *)self scenelessBackgroundLaunch];
  id v16 = [(CPSWebClip *)self applicationBundleIdentifier];
  uint64_t v29 = [(CPSWebClip *)self trustedClientBundleIdentifiers];
  v28 = [(CPSWebClip *)self pageURL];
  v14 = [(CPSWebClip *)self registeredURL];
  id v22 = [(CPSWebClip *)self registeredURL];
  v20 = [v22 absoluteString];
  v13 = objc_msgSend(v20, "cps_sha256String");
  id v12 = [(CPSWebClip *)self appClipUserActivity];
  v15 = +[CPSWebClipStore _urlForWebClipWithIdentifier:self->_identifier];
  v11 = [v15 path];
  id v3 = [(CPSWebClip *)self iconImagePath];
  uint64_t v4 = [(CPSWebClip *)self localizedSubtitle];
  int v5 = [(CPSWebClip *)self fullAppName];
  v6 = [(CPSWebClip *)self fullAppCaption];
  id v7 = [(CPSWebClip *)self fullAppStoreURL];
  BOOL v8 = [(CPSWebClip *)self isApplicationInstalled];
  id v9 = [(CPSWebClip *)self _dictionaryRepresentation];
  objc_msgSend(v25, "stringWithFormat:", @"%@: \n  uuid = %@,\n  int64_t webClipType = %ld,\n  title = %@,\n  bundleVersion = %lu,\n  bundleIdentifier = %@,\n  scenelessBackgroundLaunch = %d,\n  applicationBundleIdentifier = %@,\n  trustedClientBundleIdentifiers = %@,\n  pageURL = %@,\n  registeredURL = %@,\n  registeredURLHash = %@,\n  appClipUserActivity = %@,\n  path = %@,\n  iconImagePath = %@,\n  localizedSubtitle = %@,\n  fullAppName = %@,\n  fullAppCaption = %@,\n  fullAppStoreURL = %@,\n  applicationInstalled = %d,\n  dictionaryRepresentation = %@", identifier, v23, v21, v19, v18, v30, v17, v16, v29, v28, v14, v13, v12, v11, v3, v4,
    v5,
    v6,
    v7,
    v8,
  id v26 = v9);

  return v26;
}

- (BOOL)isApplicationInstalled
{
  char v6 = 0;
  uint64_t v2 = +[CPSUtilities versionIdentifierForAppWithBundleIdentifier:self->_applicationBundleIdentifier isPlaceholder:&v6];
  if (v2) {
    BOOL v3 = v6 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  BOOL v4 = v3;

  return v4;
}

- (NSString)_temporaryIconPath
{
  return self->_temporaryIconPath;
}

- (void)set_temporaryIconPath:(id)a3
{
}

- (unint64_t)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setTitle:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (NSSet)trustedClientBundleIdentifiers
{
  return self->_trustedClientBundleIdentifiers;
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (NSURL)registeredURL
{
  return self->_registeredURL;
}

- (int64_t)webClipType
{
  return self->_webClipType;
}

- (BOOL)scenelessBackgroundLaunch
{
  return self->_scenelessBackgroundLaunch;
}

- (void)setScenelessBackgroundLaunch:(BOOL)a3
{
  self->_scenelessBackgroundLaunch = a3;
}

- (BOOL)isPoweredBy
{
  return self->_poweredBy;
}

- (void)setPoweredBy:(BOOL)a3
{
  self->_poweredBy = a3;
}

- (NSString)fullAppName
{
  return self->_fullAppName;
}

- (void)setFullAppName:(id)a3
{
}

- (NSString)fullAppCaption
{
  return self->_fullAppCaption;
}

- (void)setFullAppCaption:(id)a3
{
}

- (NSURL)fullAppStoreURL
{
  return self->_fullAppStoreURL;
}

- (void)setFullAppStoreURL:(id)a3
{
}

- (NSDate)lastActivatedTime
{
  return self->_lastActivatedTime;
}

- (void)setLastActivatedTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActivatedTime, 0);
  objc_storeStrong((id *)&self->_fullAppStoreURL, 0);
  objc_storeStrong((id *)&self->_fullAppCaption, 0);
  objc_storeStrong((id *)&self->_fullAppName, 0);
  objc_storeStrong((id *)&self->_registeredURL, 0);
  objc_storeStrong((id *)&self->_trustedClientBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_temporaryIconPath, 0);

  objc_storeStrong((id *)&self->_pageURL, 0);
}

@end