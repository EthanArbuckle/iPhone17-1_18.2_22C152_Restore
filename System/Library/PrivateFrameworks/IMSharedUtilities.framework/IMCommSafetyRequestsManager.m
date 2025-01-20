@interface IMCommSafetyRequestsManager
+ (id)sharedManager;
+ (void)initialize;
- (BOOL)_shouldForceSensitivityResult;
- (IMCommSafetyRequestsManager)init;
- (MADService)service;
- (NSMutableDictionary)cachedResults;
- (id)_identifierForURL:(id)a3 withChatID:(id)a4;
- (id)cachedResultForContentAttachment:(id)a3 withChatID:(id)a4;
- (id)userSafetyClient;
- (void)_setSensitiveValue:(BOOL)a3 forIdentifier:(id)a4;
- (void)dealloc;
- (void)isSensitiveCGImage:(CGImage *)a3 withOrientation:(unsigned int)a4 completionHandler:(id)a5;
- (void)isSensitiveContent:(id)a3 contentAttachmentType:(int64_t)a4 useBlastDoor:(BOOL)a5 withChatID:(id)a6 completionHandler:(id)a7;
- (void)isSensitiveContent:(id)a3 contentAttachmentType:(int64_t)a4 withChatID:(id)a5 completionHandler:(id)a6;
- (void)isSensitiveContent:(id)a3 withChatID:(id)a4 completionHandler:(id)a5;
- (void)isSensitiveImage:(id)a3 withChatID:(id)a4 completionHandler:(id)a5;
- (void)setCachedResults:(id)a3;
- (void)setService:(id)a3;
- (void)setUserSafetyClient:(id)a3;
@end

@implementation IMCommSafetyRequestsManager

+ (void)initialize
{
}

+ (id)sharedManager
{
  if (qword_1EB4A61E8 != -1) {
    dispatch_once(&qword_1EB4A61E8, &unk_1EF2BF480);
  }
  v2 = (void *)qword_1EB4A6210;

  return v2;
}

- (IMCommSafetyRequestsManager)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)IMCommSafetyRequestsManager;
  v2 = [(IMCommSafetyRequestsManager *)&v13 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v2->operationQueue;
    v2->operationQueue = v3;

    v5 = dispatch_get_global_queue(2, 0);
    [(NSOperationQueue *)v2->operationQueue setUnderlyingQueue:v5];

    [(NSOperationQueue *)v2->operationQueue setMaxConcurrentOperationCount:5];
    id v6 = objc_alloc_init((Class)MEMORY[0x1A6227910](@"USSensitivityAnalyzer", @"UserSafety"));
    id userSafetyClient = v2->_userSafetyClient;
    v2->_id userSafetyClient = v6;

    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = v2->_userSafetyClient;
        *(_DWORD *)buf = 138412290;
        id v15 = v9;
        _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Initialized USSensitivityAnalyzer %@", buf, 0xCu);
      }
    }
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedResults = v2->_cachedResults;
    v2->_cachedResults = v10;
  }
  return v2;
}

- (void)dealloc
{
  if (self->_service)
  {
    v3 = [(IMCommSafetyRequestsManager *)self service];
    [v3 cancelAllRequests];
  }
  v4.receiver = self;
  v4.super_class = (Class)IMCommSafetyRequestsManager;
  [(IMCommSafetyRequestsManager *)&v4 dealloc];
}

- (MADService)service
{
  service = self->_service;
  if (!service)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    objc_super v4 = (void *)qword_1E94FF538;
    uint64_t v13 = qword_1E94FF538;
    if (!qword_1E94FF538)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = sub_1A07F33E0;
      v9[3] = &unk_1E5A10130;
      v9[4] = &v10;
      sub_1A07F33E0((uint64_t)v9);
      objc_super v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    id v6 = [v5 service];
    v7 = self->_service;
    self->_service = v6;

    service = self->_service;
  }

  return service;
}

- (id)_identifierForURL:(id)a3 withChatID:(id)a4
{
  id v5 = a3;
  id v6 = (__CFString *)a4;
  v7 = [v5 path];
  v8 = IMSharedHelperMD5HashOfFileAtPath((uint64_t)v7);

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    uint64_t v10 = [v5 path];
    id v9 = [v10 lastPathComponent];
  }
  if (v6) {
    v11 = v6;
  }
  else {
    v11 = @"<unknown>";
  }
  uint64_t v12 = [NSString stringWithFormat:@"%@_%@", v11, v9];

  return v12;
}

- (void)_setSensitiveValue:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(IMCommSafetyRequestsManager *)self cachedResults];
  v7 = [NSNumber numberWithBool:v4];
  [v8 setValue:v7 forKey:v6];
}

- (void)isSensitiveImage:(id)a3 withChatID:(id)a4 completionHandler:(id)a5
{
}

- (void)isSensitiveContent:(id)a3 withChatID:(id)a4 completionHandler:(id)a5
{
}

- (void)isSensitiveContent:(id)a3 contentAttachmentType:(int64_t)a4 withChatID:(id)a5 completionHandler:(id)a6
{
}

- (void)isSensitiveContent:(id)a3 contentAttachmentType:(int64_t)a4 useBlastDoor:(BOOL)a5 withChatID:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  operationQueue = self->operationQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1A07F24A0;
  v19[3] = &unk_1E5A12150;
  id v20 = v12;
  v21 = self;
  id v22 = v13;
  id v23 = v14;
  int64_t v24 = a4;
  BOOL v25 = a5;
  id v16 = v13;
  id v17 = v14;
  id v18 = v12;
  [(NSOperationQueue *)operationQueue addOperationWithBlock:v19];
}

- (id)cachedResultForContentAttachment:(id)a3 withChatID:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(IMCommSafetyRequestsManager *)self _identifierForURL:v6 withChatID:v7];
    id v9 = [(IMCommSafetyRequestsManager *)self cachedResults];
    uint64_t v10 = [v9 objectForKey:v8];

    if (v7 && !v10)
    {
      if (IMOSLoggingEnabled())
      {
        v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = [v6 absoluteString];
          int v16 = 138412546;
          id v17 = v12;
          __int16 v18 = 2112;
          id v19 = v7;
          _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Failed to retrieve cached result for fileURL '%@' and chatID '%@", (uint8_t *)&v16, 0x16u);
        }
      }
      id v13 = [(IMCommSafetyRequestsManager *)self cachedResults];
      id v14 = [(IMCommSafetyRequestsManager *)self _identifierForURL:v6 withChatID:0];
      uint64_t v10 = [v13 objectForKey:v14];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)isSensitiveCGImage:(CGImage *)a3 withOrientation:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = [(IMCommSafetyRequestsManager *)self userSafetyClient];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A07F328C;
  v11[3] = &unk_1E5A12178;
  id v12 = v8;
  id v10 = v8;
  [v9 analyzeCGImage:a3 withOrientation:v5 completionHandler:v11];
}

- (BOOL)_shouldForceSensitivityResult
{
  v2 = +[IMDefaults sharedInstance];
  v3 = [v2 getValueFromDomain:@"com.apple.messages" forKey:@"kMarkSensitiveKey"];

  uint64_t v4 = [v3 integerValue];
  if (v4 == 1)
  {
    uint64_t v5 = +[IMDefaults sharedInstance];
    [v5 setValue:&unk_1EF305850 forDomain:@"com.apple.messages" forKey:@"kMarkSensitiveKey"];
  }
  return v4 != 0;
}

- (id)userSafetyClient
{
  return self->_userSafetyClient;
}

- (void)setUserSafetyClient:(id)a3
{
}

- (void)setService:(id)a3
{
}

- (NSMutableDictionary)cachedResults
{
  return self->_cachedResults;
}

- (void)setCachedResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResults, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong(&self->_userSafetyClient, 0);

  objc_storeStrong((id *)&self->operationQueue, 0);
}

@end