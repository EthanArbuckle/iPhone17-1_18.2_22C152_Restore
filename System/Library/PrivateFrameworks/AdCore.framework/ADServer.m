@interface ADServer
+ (NSOperationQueue)workQueue;
+ (id)sharedInstance;
+ (void)initialize;
- (ADServer)init;
- (BOOL)shouldRestoreConfiguration;
- (NSDictionary)configurations;
- (NSString)resourceConnectProxyURL;
- (NSURLSession)session;
- (id)deserializeMessage:(id)a3 error:(id *)a4;
- (id)serializeMessage:(id)a3;
- (id)serverURLForMessageClass:(Class)a3 serverURL:(id)a4;
- (int)configurationExpirationTime;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)buildConfigurationDictionary:(id)a3;
- (void)handleRequest:(id)a3 serverURL:(id)a4 responseHandler:(id)a5;
- (void)restoreConfiguration;
- (void)saveConfig;
- (void)saveProxyURL;
- (void)setConfigurationExpirationTime:(int)a3;
- (void)setConfigurations:(id)a3;
- (void)setResourceConnectProxyURL:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation ADServer

- (void)handleRequest:(id)a3 serverURL:(id)a4 responseHandler:(id)a5
{
  v72[6] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v65 = a5;
  if (!v65)
  {
    v10 = NSString;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = [v10 stringWithFormat:@"[%@] How in the world is the completionHandler nil?!!?!", v12];
    _ADLog(@"iAdServerRequestLogging", v13, 16);
  }
  uint64_t v14 = [(ADServer *)self serverURLForMessageClass:objc_opt_class() serverURL:v9];

  v15 = +[ADCoreSettings sharedInstance];
  v16 = (void *)MEMORY[0x1E4F28E88];
  [v15 adServerTimeoutInterval];
  v66 = (void *)v14;
  v17 = objc_msgSend(v16, "requestWithURL:cachePolicy:timeoutInterval:", v14, 0);
  [v17 setHTTPMethod:@"POST"];
  v18 = [v15 deviceModel];

  if (v18)
  {
    v19 = [v15 deviceModel];
  }
  else
  {
    v20 = [NSString stringWithFormat:@"Missing deviceModel"];
    _ADLog(@"iAdServerRequestLogging", v20, 16);

    v19 = @"MISSING_DEVICE_MODEL";
  }
  v21 = [v15 osVersionAndBuild];

  if (v21)
  {
    v22 = [v15 osVersionAndBuild];
  }
  else
  {
    v23 = [NSString stringWithFormat:@"Missing osVersionAndBuild"];
    _ADLog(@"iAdServerRequestLogging", v23, 16);

    v22 = @"MISSING_VERSION_AND_BUILD";
  }
  v24 = [v15 bundleIdentifier];

  v63 = self;
  if (v24)
  {
    v25 = [v15 bundleIdentifier];
  }
  else
  {
    v26 = [NSString stringWithFormat:@"Missing bundleIdentifier"];
    _ADLog(@"iAdServerRequestLogging", v26, 16);

    v25 = @"MISSING_BUNDLE_IDENTIFIER";
  }
  v27 = [v15 iTunesStorefront];

  v64 = v8;
  v67 = v17;
  if (v27)
  {
    v68 = [v15 iTunesStorefront];
  }
  else
  {
    v28 = [NSString stringWithFormat:@"Missing iTunesStorefront"];
    _ADLog(@"iAdServerRequestLogging", v28, 16);

    v68 = @"MISSING_ITUNES_STOREFRONT";
  }
  v29 = [MEMORY[0x1E4F1C9C8] date];
  double v30 = (double)(int)objc_msgSend(v29, "AD_toServerTime");

  uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&v30);
  v32 = NSString;
  v33 = [v15 deviceModel];
  v34 = [v15 osVersionAndBuild];
  v35 = [v15 bundleIdentifier];
  v36 = [v15 iTunesStorefront];
  uint64_t v37 = [v32 stringWithFormat:@"%@; %@; %@; %@", v33, v34, v35, v36];

  v71[0] = @"timestamp";
  v71[1] = @"User-Agent";
  v61 = (void *)v37;
  v62 = (void *)v31;
  v72[0] = v31;
  v72[1] = v37;
  v71[2] = @"bundleID";
  v71[3] = @"device";
  v60 = v25;
  v72[2] = v25;
  v72[3] = v19;
  v71[4] = @"os_Version";
  v71[5] = @"storefront";
  v59 = v22;
  v72[4] = v22;
  v72[5] = v68;
  v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:6];
  [v67 setAllHTTPHeaderFields:v38];

  uint64_t v39 = objc_opt_class();
  if (v39 == objc_opt_class())
  {
    v40 = +[ADCoreSettings sharedInstance];
    int v41 = [v40 isPersonalizedAdsEnabled];

    if (v41) {
      v42 = @"false";
    }
    else {
      v42 = @"true";
    }
    [v67 addValue:v42 forHTTPHeaderField:@"limitAdTracking"];
  }
  v43 = [MEMORY[0x1E4F1CA60] dictionary];
  v44 = [v67 allHTTPHeaderFields];
  [v43 setObject:v44 forKey:@"headers"];

  v45 = [v64 dictionaryRepresentation];
  [v43 setObject:v45 forKey:@"body"];

  v46 = NSString;
  uint64_t v47 = objc_opt_class();
  uint64_t v48 = objc_opt_class();
  v49 = [v67 URL];
  v50 = [v49 absoluteString];
  v51 = objc_msgSend(v43, "AD_jsonString");
  v52 = [v46 stringWithFormat:@"[%@ handleRequest]: Sending request %@ to AdPlatforms %@ with object: %@", v47, v48, v50, v51];
  _ADLog(@"iAdServerRequestLogging", v52, 0);

  v53 = +[ADIDManager sharedInstance];
  uint64_t v54 = objc_opt_class();
  [v53 logIDs:@"[%@ handleRequest]: IDs for %@", v54, objc_opt_class()];

  v55 = [(ADServer *)v63 serializeMessage:v64];
  v56 = [(ADServer *)v63 session];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __52__ADServer_handleRequest_serverURL_responseHandler___block_invoke;
  v69[3] = &unk_1E68A0B50;
  v69[4] = v63;
  id v70 = v65;
  id v57 = v65;
  v58 = [v56 uploadTaskWithRequest:v67 fromData:v55 completionHandler:v69];

  [v58 resume];
}

- (id)serverURLForMessageClass:(Class)a3 serverURL:(id)a4
{
  id v6 = a4;
  v7 = +[ADCoreSettings sharedInstance];
  id v8 = [(ADServer *)self configurations];
  if (v8)
  {
    id v9 = [v7 bundleIdentifier];
    v10 = [v8 objectForKeyedSubscript:v9];
    if (v10)
    {
      v11 = [(objc_class *)a3 options];
      v12 = [v11 objectForKeyedSubscript:@"messageIndex"];

      v13 = [v10 objectForKeyedSubscript:v12];
      uint64_t v14 = v13;
      if (v13)
      {
        id v15 = v13;

        id v6 = v15;
      }
    }
  }
  v16 = [(objc_class *)a3 options];
  v17 = [v16 objectForKeyedSubscript:@"URLSuffix"];

  v18 = [(objc_class *)a3 options];
  v19 = [v18 objectForKeyedSubscript:@"messageProtocolVersion"];

  if (!v19)
  {
    v20 = ADAdsOptions();
    v19 = [v20 objectForKeyedSubscript:@"protocolVersion"];
  }
  v21 = [v6 URLByAppendingPathComponent:v19];
  v22 = [v21 URLByAppendingPathComponent:v17];

  v23 = [NSString stringWithFormat:@"serverURLForMessageClass %@ %@ ", a3, v22];
  _ADLog(@"iAdServerRequestLogging", v23, 0);

  return v22;
}

- (NSDictionary)configurations
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 32, 1);
}

- (id)serializeMessage:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() options];
  v5 = [v4 objectForKeyedSubscript:@"messageIndex"];

  id v6 = objc_opt_new();
  [v3 writeTo:v6];

  v7 = [v6 data];
  unsigned int v11 = bswap32([v5 integerValue]);
  unsigned int v10 = bswap32([v7 length]);
  id v8 = [MEMORY[0x1E4F1CA58] data];
  [v8 appendBytes:&v11 length:4];
  [v8 appendBytes:&v10 length:4];
  [v8 appendData:v7];

  return v8;
}

- (void)buildConfigurationDictionary:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "AD_maxServerTime");
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v25 = v3;
  id obj = [v3 theConfigurations];
  uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        unsigned int v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v10 expirationDate];
        if (v11 < (double)v4)
        {
          [v10 expirationDate];
          int v4 = (int)v12;
        }
        v13 = [v10 bundleId];
        uint64_t v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "requestType"));
        id v15 = [v10 baseUrl];
        v16 = [MEMORY[0x1E4F1CB10] URLWithString:v15];
        v17 = [v5 objectForKeyedSubscript:v13];
        if (!v17)
        {
          v17 = [MEMORY[0x1E4F1CA60] dictionary];
          [v5 setObject:v17 forKeyedSubscript:v13];
        }
        if (v14) {
          BOOL v18 = v16 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18) {
          [v17 setObject:v16 forKeyedSubscript:v14];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v7);
  }

  objc_storeStrong((id *)&self->_configurations, v5);
  self->_configurationExpirationTime = v4;
  if ([v25 hasResourceConnectProxyURL])
  {
    v19 = [v25 resourceConnectProxyURL];
    resourceConnectProxyURL = self->_resourceConnectProxyURL;
    self->_resourceConnectProxyURL = v19;
  }
  v21 = NSString;
  v22 = [(NSDictionary *)self->_configurations AD_jsonString];
  v23 = [v21 stringWithFormat:@"Configuration Dictionary: %@", v22];
  _ADLog(@"iAdServerRequestLogging", v23, 0);
}

- (void)saveProxyURL
{
  id v2 = [(ADServer *)self resourceConnectProxyURL];
  ADSaveToPromotedContentKeychain((uint64_t)v2, @"APProxySettings.resourceConnectProxyURL");
}

- (void)saveConfig
{
  id v2 = [(ADServer *)self configurations];
  ADSaveToPromotedContentKeychain((uint64_t)v2, @"APServerConfigurationSettings.serverConfigRecord");
}

- (NSString)resourceConnectProxyURL
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

+ (NSOperationQueue)workQueue
{
  return (NSOperationQueue *)(id)_staticWorkQueue;
}

- (void)setConfigurationExpirationTime:(int)a3
{
  self->_configurationExpirationTime = a3;
}

- (int)configurationExpirationTime
{
  return self->_configurationExpirationTime;
}

uint64_t __52__ADServer_handleRequest_serverURL_responseHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__ADServer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_3 != -1) {
    dispatch_once(&sharedInstance__onceToken_3, block);
  }
  id v2 = (void *)sharedInstance__instance_3;
  return v2;
}

+ (void)initialize
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  id v3 = (void *)_staticWorkQueue;
  _staticWorkQueue = (uint64_t)v2;

  [(id)_staticWorkQueue setName:@"com.apple.queue.adplatforms.serial"];
  int v4 = (void *)_staticWorkQueue;
  [v4 setMaxConcurrentOperationCount:1];
}

void __52__ADServer_handleRequest_serverURL_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = v9;
    double v11 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v8;
      v13 = [v12 MIMEType];
      if ([v13 hasPrefix:@"text"])
      {
        uint64_t v14 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
        id v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = [v12 statusCode];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        v28[0] = v14;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
        id v10 = [v15 errorWithDomain:@"com.apple.AdPlatforms" code:v16 userInfo:v17];

        double v11 = 0;
        id v7 = 0;
      }
      else if ([v13 hasPrefix:@"application/octet-stream"])
      {
        BOOL v18 = *(void **)(a1 + 32);
        id v26 = 0;
        double v11 = [v18 deserializeMessage:v7 error:&v26];
        id v10 = v26;
      }
      else
      {
        double v11 = 0;
        id v10 = 0;
      }
    }
    else
    {
      double v11 = 0;
      id v10 = 0;
    }
  }
  v19 = *(void **)(a1 + 40);
  if (v19)
  {
    v20 = (void *)_staticWorkQueue;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __52__ADServer_handleRequest_serverURL_responseHandler___block_invoke_2;
    v21[3] = &unk_1E68A0B28;
    id v25 = v19;
    id v22 = v11;
    id v23 = v8;
    id v24 = v10;
    [v20 addOperationWithBlock:v21];
  }
}

- (id)deserializeMessage:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5 || (unint64_t)[v5 length] <= 7)
  {
    id v7 = [NSString stringWithFormat:@"[%@] ERROR: We cannot deserialize data less than 8 bytes: %@", objc_opt_class(), v6];
    _ADLog(@"iAdServerRequestLogging", v7, 16);

LABEL_4:
    a4 = 0;
    goto LABEL_5;
  }
  uint64_t v12 = 0;
  objc_msgSend(v6, "getBytes:range:", (char *)&v12 + 4, 0, 4);
  HIDWORD(v12) = bswap32(HIDWORD(v12));
  objc_msgSend(v6, "getBytes:range:", &v12, 4, 4);
  uint64_t v9 = bswap32(v12);
  LODWORD(v12) = v9;
  if (v9 + 8 <= (unint64_t)[v6 length])
  {
    objc_msgSend(v6, "subdataWithRange:", 8, v9);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = @"Bad protocol response header; is the server up-to-date?";
    double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *a4 = [v10 errorWithDomain:@"com.apple.AdPlatforms" code:1 userInfo:v11];

    goto LABEL_4;
  }
LABEL_5:

  return a4;
}

uint64_t __26__ADServer_sharedInstance__block_invoke()
{
  sharedInstance__instance_3 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (ADServer)init
{
  v9.receiver = self;
  v9.super_class = (Class)ADServer;
  id v2 = [(ADServer *)&v9 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
    int v4 = +[ADCoreSettings sharedInstance];
    [v4 NSURLConnectionTimeout];
    objc_msgSend(v3, "setTimeoutIntervalForRequest:");

    id v5 = +[ADCoreSettings sharedInstance];
    [v5 NSURLTransactionTimeout];
    objc_msgSend(v3, "setTimeoutIntervalForResource:");

    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F29078]) initWithMemoryCapacity:0 diskCapacity:0 diskPath:0];
    [v3 setURLCache:v6];
    id v7 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v3 delegate:v2 delegateQueue:0];
    [(ADServer *)v2 setSession:v7];

    v2->_configurationExpirationTime = objc_msgSend(MEMORY[0x1E4F1C9C8], "AD_maxServerTime");
    if ([(ADServer *)v2 shouldRestoreConfiguration]) {
      [(ADServer *)v2 restoreConfiguration];
    }
  }
  return v2;
}

- (BOOL)shouldRestoreConfiguration
{
  if (!MGGetBoolAnswer()) {
    return 1;
  }
  id v2 = +[ADCoreSettings sharedInstance];
  id v3 = [v2 defaultConfigurationServerURL];
  int v4 = [v3 absoluteString];

  int v5 = [v4 isEqualToString:@"https://cf-invalid.iad.apple.com/adserver"];
  if (v5)
  {
    uint64_t v6 = [NSString stringWithFormat:@"The Configuration Message has been disabled in Internal Settings."];
    _ADLog(@"iAdInternalLogging", v6, 0);
  }
  char v7 = v5 ^ 1;

  return v7;
}

- (void)restoreConfiguration
{
  OSStatus v7 = 0;
  uint64_t v3 = ADCopyDataFromKeychain(@"ADConfigurationsKeychainKey", &v7);
  int v4 = (void *)v3;
  if (v7) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    uint64_t v6 = [[ADConfigurationResponse alloc] initWithData:v3];
    [(ADServer *)self buildConfigurationDictionary:v6];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  BOOL v5 = [NSString stringWithFormat:@"URLSession %@ task %@ didCompleteWithError %@", a3, a4, a5];
  _ADLog(@"iAdServerRequestLogging", v5, 16);
}

- (void)setConfigurations:(id)a3
{
}

- (void)setResourceConnectProxyURL:(id)a3
{
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_resourceConnectProxyURL, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
}

@end