@interface PocketAPI
+ (id)pkt_hashForConsumerKey:(id)a3 accessToken:(id)a4;
+ (id)pocketAppURLScheme;
+ (id)sharedAPI;
- (BOOL)handleOpenURL:(id)a3;
- (BOOL)isLoggedIn;
- (NSOperationQueue)operationQueue;
- (NSString)URLScheme;
- (NSString)consumerKey;
- (NSString)username;
- (PocketAPI)init;
- (id)methodOperationWithAPIMethod:(id)a3 forHTTPMethod:(int)a4 arguments:(id)a5 delegate:(id)a6;
- (id)methodOperationWithAPIMethod:(id)a3 forHTTPMethod:(int)a4 arguments:(id)a5 handler:(id)a6;
- (id)pkt_actionDictionaryWithName:(id)a3 parameters:(id)a4;
- (id)pkt_deviceName;
- (id)pkt_deviceOSVersion;
- (id)pkt_getKeychainValueForKey:(id)a3;
- (id)pkt_getKeychainValueForKey:(id)a3 serviceName:(id)a4;
- (id)pkt_getToken;
- (id)pkt_loadCurrentLoginFromDefaults;
- (id)pkt_userAgent;
- (id)saveOperationWithURL:(id)a3 delegate:(id)a4;
- (id)saveOperationWithURL:(id)a3 handler:(id)a4;
- (id)saveOperationWithURL:(id)a3 title:(id)a4 delegate:(id)a5;
- (id)saveOperationWithURL:(id)a3 title:(id)a4 handler:(id)a5;
- (id)saveOperationWithURL:(id)a3 title:(id)a4 tweetID:(id)a5 delegate:(id)a6;
- (id)saveOperationWithURL:(id)a3 title:(id)a4 tweetID:(id)a5 handler:(id)a6;
- (unint64_t)appID;
- (void)callAPIMethod:(id)a3 withHTTPMethod:(int)a4 arguments:(id)a5 delegate:(id)a6;
- (void)callAPIMethod:(id)a3 withHTTPMethod:(int)a4 arguments:(id)a5 handler:(id)a6;
- (void)dealloc;
- (void)loginWithDelegate:(id)a3;
- (void)loginWithHandler:(id)a3;
- (void)logout;
- (void)pkt_loggedInWithUsername:(id)a3 token:(id)a4;
- (void)pkt_migrateAccountToAccessTokenWithUsername:(id)a3 password:(id)a4 delegate:(id)a5;
- (void)pkt_migrateAccountToAccessTokenWithUsername:(id)a3 password:(id)a4 handler:(id)a5;
- (void)pkt_saveCurrentLoginToDefaults;
- (void)pkt_setKeychainValue:(id)a3 forKey:(id)a4;
- (void)pkt_setKeychainValue:(id)a3 forKey:(id)a4 serviceName:(id)a5;
- (void)saveURL:(id)a3 delegate:(id)a4;
- (void)saveURL:(id)a3 handler:(id)a4;
- (void)saveURL:(id)a3 withTitle:(id)a4 delegate:(id)a5;
- (void)saveURL:(id)a3 withTitle:(id)a4 handler:(id)a5;
- (void)saveURL:(id)a3 withTitle:(id)a4 tweetID:(id)a5 delegate:(id)a6;
- (void)saveURL:(id)a3 withTitle:(id)a4 tweetID:(id)a5 handler:(id)a6;
- (void)setConsumerKey:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setURLScheme:(id)a3;
@end

@implementation PocketAPI

- (NSOperationQueue)operationQueue
{
  return self->operationQueue;
}

- (NSString)consumerKey
{
  return self->consumerKey;
}

- (id)pkt_deviceOSVersion
{
  v2 = (void *)[MEMORY[0x263F85258] currentDevice];
  return (id)[v2 systemVersion];
}

- (id)pkt_deviceName
{
  size_t size = 0;
  sysctlbyname("hw.machine", 0, &size, 0, 0);
  v2 = malloc_type_malloc(size, 0x225F551CuLL);
  sysctlbyname("hw.machine", v2, &size, 0, 0);
  v3 = (void *)[NSString stringWithCString:v2 encoding:4];
  free(v2);
  v4 = @"iFPGA";
  if (([v3 isEqualToString:@"iFPGA"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"iPhone1,1"])
    {
      return @"iPhone 1G";
    }
    else if ([v3 isEqualToString:@"iPhone1,2"])
    {
      return @"iPhone 3G";
    }
    else if ([v3 hasPrefix:@"iPhone2"])
    {
      return @"iPhone 3GS";
    }
    else if ([v3 hasPrefix:@"iPhone3"])
    {
      return @"iPhone 4";
    }
    else if ([v3 hasPrefix:@"iPhone4"])
    {
      return @"iPhone 4S";
    }
    else if ([v3 hasPrefix:@"iPod1"])
    {
      return @"iPod touch 1G";
    }
    else if ([v3 hasPrefix:@"iPod2"])
    {
      return @"iPod touch 2G";
    }
    else if ([v3 hasPrefix:@"iPod3"])
    {
      return @"iPod touch 3G";
    }
    else if ([v3 hasPrefix:@"iPod4"])
    {
      return @"iPod touch 4G";
    }
    else if ([v3 hasPrefix:@"iPad1"])
    {
      return @"iPad 1G";
    }
    else if ([v3 hasPrefix:@"iPad2"])
    {
      return @"iPad 2G";
    }
    else if ([v3 hasPrefix:@"iPad3"])
    {
      return @"iPad 3G";
    }
    else if ([v3 hasPrefix:@"AppleTV2"])
    {
      return @"Apple TV 2G";
    }
    else if ([v3 hasPrefix:@"iPhone"])
    {
      return @"Unknown iPhone";
    }
    else if ([v3 hasPrefix:@"iPod"])
    {
      return @"Unknown iPod touch";
    }
    else if ([v3 hasPrefix:@"iPad"])
    {
      return @"Unknown iPad";
    }
    else if (([v3 hasSuffix:@"86"] & 1) != 0 {
           || [v3 isEqual:@"x86_64"])
    }
    {
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F85258], "currentDevice"), "idiom") == 1) {
        return @"iPad Simulator";
      }
      else {
        return @"iPhone Simulator";
      }
    }
    else
    {
      return @"Unknown iOS Device";
    }
  }
  return v4;
}

- (id)pkt_userAgent
{
  id result = self->userAgent;
  if (!result)
  {
    v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "infoDictionary");
    uint64_t v5 = [v4 objectForKey:@"CFBundleDisplayName"];
    if (!v5) {
      uint64_t v5 = [v4 objectForKey:*MEMORY[0x263EFFB68]];
    }
    uint64_t v6 = [v4 objectForKey:@"CFBundleVersion"];
    v7 = [(PocketAPI *)self pkt_deviceName];
    v8 = [(PocketAPI *)self pkt_deviceOSVersion];
    uint64_t v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F85258], "currentDevice"), "systemName");
    uint64_t v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F85258], "currentDevice"), "idiom");
    v11 = @"Mobile";
    if (v10 == 1) {
      v11 = @"Tablet";
    }
    v12 = &stru_26F008428;
    if (v5) {
      v13 = (__CFString *)v5;
    }
    else {
      v13 = &stru_26F008428;
    }
    if (v6) {
      v14 = (__CFString *)v6;
    }
    else {
      v14 = &stru_26F008428;
    }
    if (v9) {
      v15 = (__CFString *)v9;
    }
    else {
      v15 = &stru_26F008428;
    }
    if (v8) {
      v16 = v8;
    }
    else {
      v16 = &stru_26F008428;
    }
    if (v7) {
      v12 = v7;
    }
    id result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"PocketSDK:1.0.2", v13, v14, v15, v16, @"Apple", v12, v11, @"App Store", 0), "componentsJoinedByString:", @";");
    self->userAgent = (NSString *)result;
  }
  return result;
}

- (id)pkt_actionDictionaryWithName:(id)a3 parameters:(id)a4
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:a4];
  [v5 setObject:a3 forKey:@"action"];
  uint64_t v6 = NSNumber;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "date"), "timeIntervalSince1970");
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v6, "numberWithInteger:", (uint64_t)v7), @"time");
  return v5;
}

- (void)pkt_migrateAccountToAccessTokenWithUsername:(id)a3 password:(id)a4 handler:(id)a5
{
  v8 = +[PocketAPIBlockDelegate delegateWithLoginHandler:a5];
  [(PocketAPI *)self pkt_migrateAccountToAccessTokenWithUsername:a3 password:a4 delegate:v8];
}

- (void)pkt_migrateAccountToAccessTokenWithUsername:(id)a3 password:(id)a4 delegate:(id)a5
{
  v13 = objc_alloc_init(PocketAPIOperation);
  [(PocketAPIOperation *)v13 setAPI:self];
  [(PocketAPIOperation *)v13 setDelegate:a5];
  [(PocketAPIOperation *)v13 setDomain:10];
  [(PocketAPIOperation *)v13 setHTTPMethod:1];
  [(PocketAPIOperation *)v13 setAPIMethod:@"authorize"];
  uint64_t v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF960], "preferredLanguages"), "objectAtIndex:", 0);
  uint64_t v10 = (void *)[MEMORY[0x263EFF960] currentLocale];
  uint64_t v11 = [v10 objectForKey:*MEMORY[0x263EFF4D0]];
  uint64_t v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA18], "systemTimeZone"), "secondsFromGMT");
  -[PocketAPIOperation setArguments:](v13, "setArguments:", [NSDictionary dictionaryWithObjectsAndKeys:a3, @"username", a4, @"password", @"credentials", @"grant_type", v9, @"locale", v11, @"country", objc_msgSend(NSString, "stringWithFormat:", @"%i", v12 / 60), @"timezone", 0]);
  [(NSOperationQueue *)self->operationQueue addOperation:v13];
}

- (void)pkt_saveCurrentLoginToDefaults
{
  currentLogin = self->currentLogin;
  if (currentLogin)
  {
    uint64_t v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:currentLogin requiringSecureCoding:1 error:0];
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = objc_alloc_init(MEMORY[0x263EFFA40]);
      [v5 setObject:v4 forKey:@"PocketAPICurrentLogin"];
      [v5 synchronize];
    }
  }
}

- (id)pkt_loadCurrentLoginFromDefaults
{
  id v2 = objc_alloc_init(MEMORY[0x263EFFA40]);
  uint64_t v3 = (void *)[v2 dataForKey:@"PocketAPICurrentLogin"];
  if (v3)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];
    if (v3)
    {
      [v2 removeObjectForKey:@"PocketAPICurrentLogin"];
      [v2 synchronize];
    }
  }
  return v3;
}

- (void)logout
{
  [(PocketAPI *)self willChangeValueForKey:@"username"];
  [(PocketAPI *)self willChangeValueForKey:@"isLoggedIn"];
  [(PocketAPI *)self pkt_setKeychainValue:0 forKey:@"username"];
  [(PocketAPI *)self pkt_setKeychainValue:0 forKey:@"token"];
  [(PocketAPI *)self pkt_setKeychainValue:0 forKey:@"tokenDigest"];
  [(PocketAPI *)self didChangeValueForKey:@"isLoggedIn"];
  [(PocketAPI *)self didChangeValueForKey:@"username"];
}

- (void)pkt_loggedInWithUsername:(id)a3 token:(id)a4
{
  [(PocketAPI *)self willChangeValueForKey:@"username"];
  [(PocketAPI *)self willChangeValueForKey:@"isLoggedIn"];
  [(PocketAPI *)self pkt_setKeychainValue:a3 forKey:@"username"];
  [(PocketAPI *)self pkt_setKeychainValue:a4 forKey:@"token"];
  -[PocketAPI pkt_setKeychainValue:forKey:](self, "pkt_setKeychainValue:forKey:", objc_msgSend((id)objc_opt_class(), "pkt_hashForConsumerKey:accessToken:", -[PocketAPI consumerKey](self, "consumerKey"), a4), @"tokenDigest");
  [(PocketAPI *)self didChangeValueForKey:@"isLoggedIn"];
  [(PocketAPI *)self didChangeValueForKey:@"username"];
}

- (id)pkt_getToken
{
  return [(PocketAPI *)self pkt_getKeychainValueForKey:@"token"];
}

- (NSString)username
{
  return (NSString *)[(PocketAPI *)self pkt_getKeychainValueForKey:@"username"];
}

- (id)methodOperationWithAPIMethod:(id)a3 forHTTPMethod:(int)a4 arguments:(id)a5 handler:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v10 = +[PocketAPIBlockDelegate delegateWithResponseHandler:a6];
  return [(PocketAPI *)self methodOperationWithAPIMethod:a3 forHTTPMethod:v7 arguments:a5 delegate:v10];
}

- (id)saveOperationWithURL:(id)a3 title:(id)a4 tweetID:(id)a5 handler:(id)a6
{
  uint64_t v10 = +[PocketAPIBlockDelegate delegateWithSaveHandler:a6];
  return [(PocketAPI *)self saveOperationWithURL:a3 title:a4 tweetID:a5 delegate:v10];
}

- (id)saveOperationWithURL:(id)a3 title:(id)a4 handler:(id)a5
{
  v8 = +[PocketAPIBlockDelegate delegateWithSaveHandler:a5];
  return [(PocketAPI *)self saveOperationWithURL:a3 title:a4 delegate:v8];
}

- (id)saveOperationWithURL:(id)a3 handler:(id)a4
{
  uint64_t v6 = +[PocketAPIBlockDelegate delegateWithSaveHandler:a4];
  return [(PocketAPI *)self saveOperationWithURL:a3 delegate:v6];
}

- (void)callAPIMethod:(id)a3 withHTTPMethod:(int)a4 arguments:(id)a5 handler:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v10 = +[PocketAPIBlockDelegate delegateWithResponseHandler:a6];
  [(PocketAPI *)self callAPIMethod:a3 withHTTPMethod:v7 arguments:a5 delegate:v10];
}

- (void)saveURL:(id)a3 withTitle:(id)a4 tweetID:(id)a5 handler:(id)a6
{
  uint64_t v10 = +[PocketAPIBlockDelegate delegateWithSaveHandler:a6];
  [(PocketAPI *)self saveURL:a3 withTitle:a4 tweetID:a5 delegate:v10];
}

- (void)saveURL:(id)a3 withTitle:(id)a4 handler:(id)a5
{
  v8 = +[PocketAPIBlockDelegate delegateWithSaveHandler:a5];
  [(PocketAPI *)self saveURL:a3 withTitle:a4 delegate:v8];
}

- (void)saveURL:(id)a3 handler:(id)a4
{
  uint64_t v6 = +[PocketAPIBlockDelegate delegateWithSaveHandler:a4];
  [(PocketAPI *)self saveURL:a3 delegate:v6];
}

- (void)loginWithHandler:(id)a3
{
  uint64_t v4 = +[PocketAPIBlockDelegate delegateWithLoginHandler:a3];
  [(PocketAPI *)self loginWithDelegate:v4];
}

- (id)methodOperationWithAPIMethod:(id)a3 forHTTPMethod:(int)a4 arguments:(id)a5 delegate:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v11 = objc_alloc_init(PocketAPIOperation);
  [(PocketAPIOperation *)v11 setAPI:self];
  [(PocketAPIOperation *)v11 setDelegate:a6];
  [(PocketAPIOperation *)v11 setAPIMethod:a3];
  [(PocketAPIOperation *)v11 setHTTPMethod:v8];
  -[PocketAPIOperation setArguments:](v11, "setArguments:", [NSDictionary dictionaryWithDictionary:a5]);
  return v11;
}

- (id)saveOperationWithURL:(id)a3 delegate:(id)a4
{
  return [(PocketAPI *)self saveOperationWithURL:a3 title:0 tweetID:0 delegate:a4];
}

- (id)saveOperationWithURL:(id)a3 title:(id)a4 delegate:(id)a5
{
  return [(PocketAPI *)self saveOperationWithURL:a3 title:a4 tweetID:0 delegate:a5];
}

- (id)saveOperationWithURL:(id)a3 title:(id)a4 tweetID:(id)a5 delegate:(id)a6
{
  if (!a3 || ![a3 absoluteString]) {
    return 0;
  }
  uint64_t v11 = NSNumber;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "date"), "timeIntervalSince1970");
  uint64_t v13 = [v11 numberWithInteger:(uint64_t)v12];
  v14 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  [v14 setObject:v13 forKey:@"time"];
  objc_msgSend(v14, "setObject:forKey:", objc_msgSend(a3, "absoluteString"), @"url");
  if (a4) {
    [v14 setObject:a4 forKey:@"title"];
  }
  if (a5
    && ([a5 isEqualToString:&stru_26F008428] & 1) == 0
    && ([a5 isEqualToString:@"0"] & 1) == 0)
  {
    [v14 setObject:a5 forKey:@"ref_id"];
  }
  id v15 = (id)[v14 copy];
  return [(PocketAPI *)self methodOperationWithAPIMethod:@"add" forHTTPMethod:1 arguments:v15 delegate:a6];
}

- (void)callAPIMethod:(id)a3 withHTTPMethod:(int)a4 arguments:(id)a5 delegate:(id)a6
{
  operationQueue = self->operationQueue;
  id v7 = [(PocketAPI *)self methodOperationWithAPIMethod:a3 forHTTPMethod:*(void *)&a4 arguments:a5 delegate:a6];
  [(NSOperationQueue *)operationQueue addOperation:v7];
}

- (void)saveURL:(id)a3 withTitle:(id)a4 tweetID:(id)a5 delegate:(id)a6
{
  operationQueue = self->operationQueue;
  id v7 = [(PocketAPI *)self saveOperationWithURL:a3 title:a4 tweetID:a5 delegate:a6];
  [(NSOperationQueue *)operationQueue addOperation:v7];
}

- (void)saveURL:(id)a3 withTitle:(id)a4 delegate:(id)a5
{
  operationQueue = self->operationQueue;
  id v6 = [(PocketAPI *)self saveOperationWithURL:a3 title:a4 delegate:a5];
  [(NSOperationQueue *)operationQueue addOperation:v6];
}

- (void)saveURL:(id)a3 delegate:(id)a4
{
  operationQueue = self->operationQueue;
  id v5 = [(PocketAPI *)self saveOperationWithURL:a3 delegate:a4];
  [(NSOperationQueue *)operationQueue addOperation:v5];
}

- (void)loginWithDelegate:(id)a3
{
  id v5 = self->currentLogin;
  id v6 = [[PocketAPILogin alloc] initWithAPI:self delegate:a3];
  self->currentLogin = v6;
  [(PocketAPILogin *)v6 fetchRequestToken];
  [(PocketAPI *)self pkt_saveCurrentLoginToDefaults];
}

- (BOOL)isLoggedIn
{
  uint64_t v3 = [(PocketAPI *)self username];
  id v4 = [(PocketAPI *)self pkt_getToken];
  LOBYTE(v5) = 0;
  if (v3)
  {
    if (v4)
    {
      uint64_t v5 = [(NSString *)v3 length];
      if (v5) {
        LOBYTE(v5) = [v4 length] != 0;
      }
    }
  }
  return v5;
}

- (unint64_t)appID
{
  if (![(PocketAPI *)self consumerKey]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v3 = [(NSString *)[(PocketAPI *)self consumerKey] componentsSeparatedByString:@"-"];
  if (!v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v4 = v3;
  if (![(NSArray *)v3 count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v5 = [(NSArray *)v4 objectAtIndex:0];
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v6 = v5;
  if (![v5 length]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return [v6 integerValue];
}

- (BOOL)handleOpenURL:(id)a3
{
  int v5 = objc_msgSend((id)objc_msgSend(a3, "scheme"), "isEqualToString:", -[PocketAPI URLScheme](self, "URLScheme"));
  if (v5)
  {
    id v6 = objc_msgSend(NSDictionary, "pkt_dictionaryByParsingURLEncodedFormString:", objc_msgSend(a3, "query"));
    currentLogin = self->currentLogin;
    if (objc_msgSend((id)objc_msgSend(a3, "path"), "isEqualToString:", @"/reverse")
      && [v6 objectForKey:@"code"])
    {
      uint64_t v8 = [v6 objectForKey:@"code"];
      currentLogin = [[PocketAPILogin alloc] initWithAPI:self delegate:0];
      [(PocketAPILogin *)currentLogin _setRequestToken:v8];
      [(PocketAPILogin *)currentLogin _setReverseAuth:1];
    }
    if (!currentLogin) {
      currentLogin = [(PocketAPI *)self pkt_loadCurrentLoginFromDefaults];
    }
    uint64_t v9 = currentLogin;
    self->currentLogin = v9;
    [(PocketAPILogin *)v9 convertRequestTokenToAccessToken];
    [(PocketAPI *)self pkt_saveCurrentLoginToDefaults];
  }
  return v5;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  [(NSOperationQueue *)self->operationQueue waitUntilAllOperationsAreFinished];

  self->operationQueue = 0;
  self->consumerKey = 0;

  self->URLScheme = 0;
  self->userAgent = 0;
  v3.receiver = self;
  v3.super_class = (Class)PocketAPI;
  [(PocketAPI *)&v3 dealloc];
}

- (void)setOperationQueue:(id)a3
{
  if (self->consumerKey) {
    NSLog(&cfstr_ErrorPocketapi.isa, a2);
  }

  self->operationQueue = (NSOperationQueue *)a3;
}

- (void)setURLScheme:(id)a3
{
  id v5 = a3;

  self->URLScheme = (NSString *)a3;
}

- (NSString)URLScheme
{
  if (self->URLScheme) {
    return self->URLScheme;
  }
  else {
    return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"pocketapp%lu", -[PocketAPI appID](self, "appID"));
  }
}

- (void)setConsumerKey:(id)a3
{
  id v5 = a3;

  self->consumerKey = (NSString *)a3;
  if (a3 && !self->URLScheme) {
    [(PocketAPI *)self setURLScheme:[(PocketAPI *)self URLScheme]];
  }
  if ([(PocketAPI *)self isLoggedIn]
    && (objc_msgSend(-[PocketAPI pkt_getKeychainValueForKey:](self, "pkt_getKeychainValueForKey:", @"tokenDigest"), "isEqualToString:", objc_msgSend((id)objc_opt_class(), "pkt_hashForConsumerKey:accessToken:", -[PocketAPI consumerKey](self, "consumerKey"), -[PocketAPI pkt_getToken](self, "pkt_getToken"))) & 1) == 0)
  {
    NSLog(&cfstr_ErrorTheAccess.isa);
    [(PocketAPI *)self logout];
  }
}

- (PocketAPI)init
{
  v4.receiver = self;
  v4.super_class = (Class)PocketAPI;
  id v2 = [(PocketAPI *)&v4 init];
  if (v2)
  {
    v2->operationQueue = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    if ((PocketAPI *)sSharedAPI != v2) {
      -[PocketAPI setConsumerKey:](v2, "setConsumerKey:", [(id)sSharedAPI consumerKey]);
    }
  }
  return v2;
}

+ (id)pkt_hashForConsumerKey:(id)a3 accessToken:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_super v4 = (void *)[(id)objc_msgSend(NSString stringWithFormat:@"%@-%@", a3, a4), "dataUsingEncoding:", 4];
  CC_SHA1((const void *)[v4 bytes], objc_msgSend(v4, "length"), md);
  id v5 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:20];
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend(v5, "appendFormat:", @"%02x", md[i]);
  return v5;
}

+ (id)pocketAppURLScheme
{
  return @"pocket-oauth-v1";
}

+ (id)sharedAPI
{
  if (!sSharedAPI)
  {
    sSharedAPI = (uint64_t)objc_alloc((Class)a1);
    [(id)sSharedAPI init];
  }
  objc_sync_exit(a1);
  return (id)sSharedAPI;
}

- (id)pkt_getKeychainValueForKey:(id)a3 serviceName:(id)a4
{
  return +[PocketAPIKeychainUtils getPasswordForUsername:a3 andServiceName:a4 error:0];
}

- (void)pkt_setKeychainValue:(id)a3 forKey:(id)a4 serviceName:(id)a5
{
  if (a3) {
    +[PocketAPIKeychainUtils storeUsername:a4 andPassword:a3 forServiceName:a5 updateExisting:1 error:0];
  }
  else {
    +[PocketAPIKeychainUtils deleteItemForUsername:a4 andServiceName:a5 error:0];
  }
}

- (id)pkt_getKeychainValueForKey:(id)a3
{
  return [(PocketAPI *)self pkt_getKeychainValueForKey:a3 serviceName:@"PocketAPI"];
}

- (void)pkt_setKeychainValue:(id)a3 forKey:(id)a4
{
}

@end