@interface APSigningServerRequestor
- (APSigningServerRequestor)init;
- (BOOL)_retrieveResponse:(void *)a3 andLength:(unsigned int *)a4 fromData:(id)a5 error:(id *)a6;
- (NSURLSession)session;
- (id)deviceModel;
- (id)systemNameAndVersion;
- (id)userAgentString;
- (unint64_t)serverRequestorId;
- (void)sendRequest:(id)a3 requestType:(int64_t)a4 completionHandler:(id)a5;
- (void)sendRequestForData:(id)a3 requestType:(int64_t)a4 completionHandler:(id)a5;
- (void)setServerRequestorId:(unint64_t)a3;
- (void)setSession:(id)a3;
@end

@implementation APSigningServerRequestor

- (APSigningServerRequestor)init
{
  v7.receiver = self;
  v7.super_class = (Class)APSigningServerRequestor;
  v2 = [(APSigningServerRequestor *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
    v4 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v3];
    [(APSigningServerRequestor *)v2 setSession:v4];

    v5 = [MEMORY[0x1E4F29128] UUID];
    -[APSigningServerRequestor setServerRequestorId:](v2, "setServerRequestorId:", [v5 hash]);
  }
  return v2;
}

- (void)sendRequestForData:(id)a3 requestType:(int64_t)a4 completionHandler:(id)a5
{
  v35[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (+[APSystemInternal isAppleInternalInstall])
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.AdPlatforms"];
    v11 = [v10 stringForKey:@"mockFPDIServerUrl"];
    if ([v11 length]) {
      v12 = v11;
    }
    else {
      v12 = @"https://sas.pcms.apple.com/sas/v1/auth/";
    }
  }
  else
  {
    v12 = @"https://sas.pcms.apple.com/sas/v1/auth/";
  }
  if (a4 == 1301) {
    v13 = @"init";
  }
  else {
    v13 = @"setup";
  }
  if (a4 == 1301) {
    v14 = @"x-apple-auth-init-token";
  }
  else {
    v14 = @"x-apple-auth-setup-token";
  }
  v15 = [(__CFString *)v12 stringByAppendingString:v13];

  id v16 = objc_alloc(MEMORY[0x1E4F28E88]);
  v17 = [MEMORY[0x1E4F1CB10] URLWithString:v15];
  v18 = (void *)[v16 initWithURL:v17 cachePolicy:0 timeoutInterval:10.0];

  v19 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[APSigningServerRequestor serverRequestorId](self, "serverRequestorId"));
  v34[0] = v14;
  v34[1] = @"x-apple-auth-request-id";
  v35[0] = v8;
  v35[1] = v19;
  v34[2] = @"user-agent";
  v20 = [(APSigningServerRequestor *)self userAgentString];
  v35[2] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:3];

  [v18 setAllHTTPHeaderFields:v21];
  [v18 setHTTPMethod:@"GET"];
  if (!+[APSystemInternal isAppleInternalInstall]) {
    goto LABEL_21;
  }
  id v29 = v8;
  v22 = objc_alloc_init(APSigningAuthoritySettings);
  v23 = v22;
  if (a4 == 1301)
  {
    v24 = [(APSigningAuthoritySettings *)v22 contextServerInitDelay];
  }
  else
  {
    if (a4 != 1302)
    {
LABEL_20:

      id v8 = v29;
LABEL_21:
      [(APSigningServerRequestor *)self sendRequest:v18 requestType:a4 completionHandler:v9];
      goto LABEL_22;
    }
    v24 = [(APSigningAuthoritySettings *)v22 contextServerSetupDelay];
  }
  v25 = v24;
  unsigned int v26 = [v24 unsignedIntValue];

  if (!v26) {
    goto LABEL_20;
  }
  dispatch_time_t v27 = dispatch_time(0, 1000000000 * v26);
  v28 = dispatch_queue_create("com.apple.ap.signingserverrequestor.delayqueue", 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D70D4D40;
  block[3] = &unk_1E6A6B980;
  block[4] = self;
  id v31 = v18;
  int64_t v33 = a4;
  id v32 = v9;
  dispatch_after(v27, v28, block);

  id v8 = v29;
LABEL_22:
}

- (void)sendRequest:(id)a3 requestType:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    int64_t v31 = a4;
    _os_log_impl(&dword_1D70B2000, v10, OS_LOG_TYPE_DEBUG, "Attempt to send network request of type %{public}ld.", buf, 0xCu);
  }

  if (!+[APSystemInternal isAppleInternalInstall]) {
    goto LABEL_8;
  }
  v11 = objc_alloc_init(APSigningAuthoritySettings);
  v12 = v11;
  if (a4 != 1302)
  {
    if (a4 != 1301) {
      goto LABEL_7;
    }
    v13 = [(APSigningAuthoritySettings *)v11 failContextServerInit];
    char v14 = [v13 BOOLValue];

    if ((v14 & 1) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    v22 = dispatch_queue_create("com.apple.ap.signingserverrequestor.failqueue", 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D70D4FD8;
    block[3] = &unk_1E6A6B9A8;
    v17 = &v29;
    id v29 = v9;
    id v23 = v9;
    dispatch_async(v22, block);

    goto LABEL_9;
  }
  v20 = [(APSigningAuthoritySettings *)v11 failContextServerSetup];
  int v21 = [v20 BOOLValue];

  if (v21) {
    goto LABEL_11;
  }
LABEL_7:

LABEL_8:
  v15 = [MEMORY[0x1E4F1C9C8] date];
  id v16 = [(APSigningServerRequestor *)self session];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1D70D4FFC;
  v24[3] = &unk_1E6A6B9D0;
  v17 = (id *)v25;
  v25[0] = v15;
  v25[1] = self;
  id v26 = v9;
  int64_t v27 = a4;
  id v18 = v9;
  v12 = v15;
  v19 = [v16 dataTaskWithRequest:v8 completionHandler:v24];

  [v19 resume];
LABEL_9:
}

- (BOOL)_retrieveResponse:(void *)a3 andLength:(unsigned int *)a4 fromData:(id)a5 error:(id *)a6
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v9 = (objc_class *)NSString;
  id v10 = a5;
  v11 = (void *)[[v9 alloc] initWithData:v10 encoding:4];

  objc_opt_class();
  id v12 = v11;
  if (!v12)
  {
    if (a6)
    {
      v15 = (void *)MEMORY[0x1E4F28C58];
      v25 = @"reason";
      id v16 = [NSString stringWithFormat:@"%@ is nil", @"Encoded result string"];
      v26[0] = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      *a6 = [v15 errorWithDomain:@"com.apple.ap.signingServerRequestor" code:6200 userInfo:v17];
LABEL_8:
    }
LABEL_9:

    BOOL v14 = 0;
    goto LABEL_10;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a6)
    {
      id v18 = (void *)MEMORY[0x1E4F28C58];
      id v23 = @"reason";
      v19 = NSString;
      v20 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v20);
      v17 = [v19 stringWithFormat:@"%@ is of the wrong type (%@)", @"Encoded result string", v16];
      v24 = v17;
      int v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      *a6 = [v18 errorWithDomain:@"com.apple.ap.signingServerRequestor" code:6200 userInfo:v21];

      goto LABEL_8;
    }
    goto LABEL_9;
  }

  id v13 = (id) [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v12 options:0];
  *a3 = (void *)[v13 bytes];
  *a4 = [v13 length];

  BOOL v14 = 1;
LABEL_10:

  return v14;
}

- (id)userAgentString
{
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 bundleIdentifier];

  v5 = NSString;
  v6 = [(APSigningServerRequestor *)self deviceModel];
  objc_super v7 = [(APSigningServerRequestor *)self systemNameAndVersion];
  id v8 = [v5 stringWithFormat:@"%@; %@; %@", v6, v7, v4];

  return v8;
}

- (id)systemNameAndVersion
{
  long long v7 = 0uLL;
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }
  else {
    long long v7 = 0uLL;
  }

  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%ld.%ld.%ld", v7, 0);
  v5 = [NSString stringWithFormat:@"%@ %@", @"iOS", v4];

  return v5;
}

- (id)deviceModel
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  size_t v14 = 0;
  if (sysctlbyname("hw.machine", 0, &v14, 0, 0))
  {
    v2 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v3 = *__error();
      v4 = __error();
      v5 = strerror(*v4);
      *(_DWORD *)buf = 136446722;
      id v16 = "hw.machine";
      __int16 v17 = 1026;
      int v18 = v3;
      __int16 v19 = 2082;
      v20 = v5;
    }

    v6 = @"unknown";
  }
  else
  {
    long long v7 = (char *)&v13 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (sysctlbyname("hw.machine", v7, &v14, 0, 0))
    {
      id v8 = APLogForCategory(0x2BuLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = *__error();
        id v10 = __error();
        v11 = strerror(*v10);
        *(_DWORD *)buf = 136446722;
        id v16 = "hw.machine";
        __int16 v17 = 1026;
        int v18 = v9;
        __int16 v19 = 2080;
        v20 = v11;
      }

      v6 = @"unknown";
    }
    else
    {
      v6 = [NSString stringWithUTF8String:v7];
    }
  }
  return v6;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (unint64_t)serverRequestorId
{
  return self->_serverRequestorId;
}

- (void)setServerRequestorId:(unint64_t)a3
{
  self->_serverRequestorId = a3;
}

- (void).cxx_destruct
{
}

@end