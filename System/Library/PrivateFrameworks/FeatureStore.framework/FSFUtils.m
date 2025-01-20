@interface FSFUtils
+ (BOOL)isEnabledOnMacOS;
+ (BOOL)isPlatformMacOS;
+ (BOOL)isPlatformWatchOS;
+ (BOOL)isPlatformiOS;
+ (BOOL)isPlatformtvOS;
+ (BOOL)isSupportedPlatform;
+ (BOOL)isSupportedUser;
+ (BOOL)isUnderLegalRestriction;
+ (id)availableStreams;
+ (id)biomeStoreConfig;
+ (id)getBase64EncodedStrFromData:(id)a3;
+ (id)getBaseLocalPath;
+ (id)getDataFromBase64EncodedStr:(id)a3;
+ (id)getStreamPath;
+ (id)getStreamURL;
+ (unint64_t)biomeMaxStreamSizeInBytes;
+ (void)getBaseLocalPath;
@end

@implementation FSFUtils

+ (id)getBase64EncodedStrFromData:(id)a3
{
  return (id)[a3 base64EncodedStringWithOptions:0];
}

+ (id)getDataFromBase64EncodedStr:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263EFF8F8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithBase64EncodedString:v4 options:0];

  return v5;
}

+ (BOOL)isPlatformiOS
{
  return 1;
}

+ (BOOL)isEnabledOnMacOS
{
  return 1;
}

+ (BOOL)isPlatformMacOS
{
  return 0;
}

+ (BOOL)isPlatformWatchOS
{
  return 0;
}

+ (BOOL)isPlatformtvOS
{
  return 0;
}

+ (BOOL)isSupportedPlatform
{
  return +[FSFUtils isPlatformiOS]
      || +[FSFUtils isPlatformtvOS]
      || +[FSFUtils isPlatformWatchOS]
      || +[FSFUtils isPlatformMacOS]
      && +[FSFUtils isEnabledOnMacOS];
}

+ (BOOL)isSupportedUser
{
  v2 = NSUserName();
  char v3 = [v2 isEqualToString:@"mobile"];

  return v3;
}

+ (id)getBaseLocalPath
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (+[FSFUtils isPlatformiOS]
    || +[FSFUtils isPlatformWatchOS]
    || +[FSFUtils isPlatformtvOS])
  {
    v2 = @"/private/var/mobile/Library/Logs/com.apple.FeatureStore/";
  }
  else if (+[FSFUtils isEnabledOnMacOS] {
         && +[FSFUtils isPlatformMacOS])
  }
  {
    geteuid();
    bzero(v5, 0x400uLL);
    if (__user_local_dirname())
    {
      id v4 = [NSString stringWithUTF8String:v5];
    }
    else
    {
      id v4 = NSHomeDirectory();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        +[FSFUtils getBaseLocalPath]((uint64_t)v4);
      }
    }
    v2 = [v4 stringByAppendingString:@"com.apple.FeatureStore/"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

+ (id)getStreamPath
{
  v2 = +[FSFUtils getBaseLocalPath];
  char v3 = [v2 stringByAppendingString:@"biomeStream/"];

  return v3;
}

+ (id)getStreamURL
{
  v2 = NSURL;
  char v3 = +[FSFUtils getStreamPath];
  id v4 = [v2 fileURLWithPath:v3];

  return v4;
}

+ (id)availableStreams
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [a1 getStreamPath];
  id v10 = 0;
  v5 = [v3 contentsOfDirectoryAtPath:v4 error:&v10];
  id v6 = v10;

  if (v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    v7 = [a1 getStreamPath];
    v8 = [v6 debugDescription];
    *(_DWORD *)buf = 138412546;
    v12 = v7;
    __int16 v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_21D935000, &_os_log_internal, OS_LOG_TYPE_INFO, "Cannot get contents of stream path: %@ error: %@", buf, 0x16u);
  }

  return v5;
}

+ (BOOL)isUnderLegalRestriction
{
  if (+[FSFDeviceInfo isRunningOnInternalBuild]) {
    return 0;
  }
  if (!+[FSFSiriPreferenceUtil isOptedIn])
  {
    BOOL v2 = 1;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
      return v2;
    }
    *(_WORD *)buf = 0;
    v5 = &_os_log_internal;
    id v6 = "It is not opted in.";
    v7 = buf;
    goto LABEL_9;
  }
  char v3 = +[FSFCallKitUtil sharedInstance];
  int v4 = [v3 isOnCall];

  if (v4)
  {
    BOOL v2 = 1;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
      return v2;
    }
    __int16 v9 = 0;
    v5 = &_os_log_internal;
    id v6 = "It is on call.";
    v7 = (uint8_t *)&v9;
LABEL_9:
    _os_log_impl(&dword_21D935000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
    return v2;
  }
  return 0;
}

+ (unint64_t)biomeMaxStreamSizeInBytes
{
  if (!os_variant_allows_internal_security_policies()) {
    return 52428800;
  }
  BOOL v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 objectForKey:@"FeatureStoreMaxStreamSizeInMB"];

  if (!v3) {
    return 52428800;
  }
  int v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v5 = [v4 integerForKey:@"FeatureStoreMaxStreamSizeInMB"];

  return v5 << 20;
}

+ (id)biomeStoreConfig
{
  char v3 = (void *)MEMORY[0x263F2A668];
  int v4 = [a1 getStreamPath];
  uint64_t v5 = (void *)[v3 newPrivateStreamDefaultConfigurationWithStoreBasePath:v4];

  id v6 = objc_msgSend(objc_alloc(MEMORY[0x263F2A660]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 1, 1, objc_msgSend(a1, "biomeMaxStreamSizeInBytes"), 1209600.0);
  [v5 setPruningPolicy:v6];

  return v5;
}

+ (void)getBaseLocalPath
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_21D935000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not get user dir. Returning %@", (uint8_t *)&v1, 0xCu);
}

@end