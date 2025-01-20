@interface AKAppleIDSession
+ (BOOL)supportsSecureCoding;
- (AKAnisetteServiceProtocol)anisetteDataProvider;
- (AKAppleIDSession)init;
- (AKAppleIDSession)initWithCoder:(id)a3;
- (AKAppleIDSession)initWithIdentifier:(id)a3;
- (AKDevice)pairedDevice;
- (BOOL)shouldDenyRequestForURL:(id)a3 task:(id)a4;
- (id)_generateAppleIDHeadersForRequest:(id)a3 error:(id *)a4;
- (id)_genericAppleIDHeadersDictionaryForRequest:(id)a3;
- (id)_nativeAnisetteController;
- (id)_pairedDeviceAnisetteController;
- (id)appleIDHeadersForRequest:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)relevantHTTPStatusCodes;
- (void)URLSession:(id)a3 task:(id)a4 getAppleIDHeadersForResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 getAppleIDRequestOrHeadersForResponse:(id)a5 completionHandler:(id)a6;
- (void)_generateAppleIDHeadersForSessionTask:(id)a3 withCompletion:(id)a4;
- (void)_handleAnissetteURLResponse:(id)a3 forRequest:(id)a4 withCompletion:(id)a5;
- (void)_handleServerTimeAdjustmentWithTime:(id)a3 completion:(id)a4;
- (void)_handleURLSwitchingResponse:(id)a3 forRequest:(id)a4 withCompletion:(id)a5;
- (void)_reportOnRequest:(id)a3 response:(id)a4 attestationData:(id)a5;
- (void)_resetDeviceIdentityWithCompletion:(id)a3;
- (void)appleIDHeadersForRequest:(id)a3 completion:(id)a4;
- (void)appleIDHeadersUsingAnisetteWithCompletion:(id)a3;
- (void)appleIDHeadersWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleResponse:(id)a3 forRequest:(id)a4 shouldRetry:(BOOL *)a5;
- (void)setAnisetteDataProvider:(id)a3;
- (void)setPairedDevice:(id)a3;
@end

@implementation AKAppleIDSession

- (AKAppleIDSession)init
{
  return [(AKAppleIDSession *)self initWithIdentifier:0];
}

- (id)appleIDHeadersForRequest:(id)a3
{
  return [(AKAppleIDSession *)self _generateAppleIDHeadersForRequest:a3 error:0];
}

- (void)appleIDHeadersForRequest:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, void *, id))a4;
  id v9 = 0;
  v7 = [(AKAppleIDSession *)self _generateAppleIDHeadersForRequest:a3 error:&v9];
  id v8 = v9;
  if (v6) {
    v6[2](v6, v7, v8);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[AKAppleIDSession alloc] initWithIdentifier:self->_serviceID];
  objc_storeStrong((id *)&v4->_anisetteDataProvider, self->_anisetteDataProvider);
  objc_storeStrong((id *)&v4->_pairedDevice, self->_pairedDevice);
  uint64_t v5 = [(AKAnisetteData *)self->_proxiedAnisetteData copy];
  proxiedAnisetteData = v4->_proxiedAnisetteData;
  v4->_proxiedAnisetteData = (AKAnisetteData *)v5;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anisetteDataProvider, 0);
  objc_storeStrong((id *)&self->_pairedDevice, 0);
  objc_storeStrong((id *)&self->_anisetteControllerLock, 0);
  objc_storeStrong((id *)&self->_proxiedAnisetteData, 0);
  objc_storeStrong((id *)&self->_pairedDeviceAnisetteController, 0);
  objc_storeStrong((id *)&self->_nativeAnisetteController, 0);

  objc_storeStrong((id *)&self->_serviceID, 0);
}

- (id)relevantHTTPStatusCodes
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EE43E980, &unk_1EE43E998, &unk_1EE43E9B0, 0);
}

- (id)_generateAppleIDHeadersForRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [(AKAppleIDSession *)self _genericAppleIDHeadersDictionaryForRequest:v5];
  v7 = [v5 URL];
  id v8 = [(AKAppleIDSession *)self _nativeAnisetteController];
  id v24 = 0;
  id v9 = [v8 attestationDataForRequest:v5 error:&v24];
  id v10 = v24;

  v11 = _AKTrafficLogSubsystem();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDSession _generateAppleIDHeadersForRequest:error:].cold.4();
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[AKAppleIDSession _generateAppleIDHeadersForRequest:error:]();
  }

  if (v9)
  {
    [(AKAppleIDSession *)self _reportOnRequest:v5 response:0 attestationData:v9];
    v13 = [v9 attestationHeaders];
    [v6 addEntriesFromDictionary:v13];
  }
  if (self->_proxiedAnisetteData)
  {
    v14 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[AKAppleIDSession _generateAppleIDHeadersForRequest:error:]();
    }

    objc_msgSend(MEMORY[0x1E4F18D50], "ak_proxiedHeadersForDevice:anisetteData:", self->_pairedDevice, self->_proxiedAnisetteData);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15) {
      [v6 addEntriesFromDictionary:v15];
    }
  }
  else
  {
    v16 = [(AKAppleIDSession *)self _pairedDeviceAnisetteController];

    if (!v16) {
      goto LABEL_22;
    }
    v17 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[AKAppleIDSession _generateAppleIDHeadersForRequest:error:]();
    }

    v18 = [(AKAppleIDSession *)self _pairedDeviceAnisetteController];
    id v23 = 0;
    v19 = [v18 anisetteDataForURLRequest:v5 error:&v23];
    id v15 = v23;

    if (v19)
    {
      v20 = objc_msgSend(MEMORY[0x1E4F18D50], "ak_proxiedHeadersForDevice:anisetteData:", self->_pairedDevice, v19);
      if (v20) {
        [v6 addEntriesFromDictionary:v20];
      }
    }
  }

LABEL_22:
  v21 = (void *)[v6 copy];

  return v21;
}

- (id)_genericAppleIDHeadersDictionaryForRequest:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v4 valueForHTTPHeaderField:@"X-Apple-I-Client-Time"];

  if (v6 && [v6 length])
  {
    v12 = @"X-Apple-I-Client-Time";
    v13[0] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E4F18D50], "ak_clientTimeHeader");
  }
  id v8 = v7;
  if ([v7 count]) {
    [v5 addEntriesFromDictionary:v8];
  }
  id v9 = objc_msgSend(MEMORY[0x1E4F18D50], "ak_localeHeader");
  if ([v9 count]) {
    [v5 addEntriesFromDictionary:v9];
  }
  id v10 = objc_msgSend(MEMORY[0x1E4F18D50], "ak_timeZoneHeader");
  if ([v10 count]) {
    [v5 addEntriesFromDictionary:v10];
  }

  return v5;
}

- (void)handleResponse:(id)a3 forRequest:(id)a4 shouldRetry:(BOOL *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v10 = [v8 statusCode];
  if ((unint64_t)(v10 - 433) > 0xA || ((1 << (v10 + 79)) & 0x703) == 0)
  {
    v13 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "statusCode"));
      id v15 = [v9 URL];
      -[AKAppleIDSession handleResponse:forRequest:shouldRetry:](v14, v15, (uint64_t)v23, v13);
    }
  }
  else
  {
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__AKAppleIDSession_handleResponse_forRequest_shouldRetry___block_invoke;
    v16[3] = &unk_1E57616B0;
    v18 = &v19;
    v13 = v12;
    v17 = v13;
    [(AKAppleIDSession *)self _handleAnissetteURLResponse:v8 forRequest:v9 withCompletion:v16];
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (a5) {
    *a5 = *((unsigned char *)v20 + 24);
  }
  _Block_object_dispose(&v19, 8);
}

- (AKAppleIDSession)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKAppleIDSession;
  id v5 = [(AKAppleIDSession *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    serviceID = v5->_serviceID;
    v5->_serviceID = (NSString *)v6;

    id v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    anisetteControllerLock = v5->_anisetteControllerLock;
    v5->_anisetteControllerLock = v8;

    [(NSLock *)v5->_anisetteControllerLock setName:@"AKAnisetteControllerLock"];
  }

  return v5;
}

- (void)_reportOnRequest:(id)a3 response:(id)a4 attestationData:(id)a5
{
  unint64_t v8 = (unint64_t)a3;
  id v9 = a4;
  unint64_t v10 = (unint64_t)a5;
  objc_super v11 = +[AKDevice currentDevice];
  if (([v11 isInternalBuild] & 1) == 0) {
    goto LABEL_10;
  }
  dispatch_semaphore_t v12 = +[AKDevice currentDevice];
  int v13 = [v12 isVirtualMachine];

  if (v13)
  {
    objc_super v11 = objc_opt_new();
    if (v8 | v10)
    {
      v14 = [(id)v8 URL];
      id v15 = [v14 host];
      [v11 setEndPointVIP:v15];

      v16 = [(id)v8 HTTPMethod];
      [v11 setRequestMethod:v16];

      v17 = [(id)v8 HTTPBody];
      objc_msgSend(v11, "setBodySize:", objc_msgSend(v17, "length"));

      v18 = (void *)MEMORY[0x1E4F28D90];
      uint64_t v19 = [(id)v10 attestationHeaders];
      uint64_t v29 = 0;
      v20 = [v18 dataWithJSONObject:v19 options:0 error:&v29];
      uint64_t v21 = v29;

      if (!v21) {
        objc_msgSend(v11, "setHeaderSize:", objc_msgSend(v20, "length"));
      }
    }
    else
    {
      if (!v9) {
        goto LABEL_10;
      }
      char v22 = [v9 URL];
      id v23 = [v22 host];
      [v11 setEndPointVIP:v23];

      uint64_t v24 = [v9 statusCode];
      unint64_t v25 = [v9 statusCode] - 200;
      v26 = [v9 URL];
      v27 = [v26 host];
      [v11 setEndPointVIP:v27];

      [v11 setErrorCode:v24];
      [v11 setErrorDomain:@"AKAuthenticationServerError"];
      if (v25 < 0x64) {
        goto LABEL_10;
      }
    }
    v28 = [(AKAppleIDSession *)self _nativeAnisetteController];
    [v28 postAttestationAnalytics:v11 completion:&__block_literal_global_33];

LABEL_10:
  }
}

- (id)_pairedDeviceAnisetteController
{
  [(NSLock *)self->_anisetteControllerLock lock];
  if (!self->_pairedDeviceAnisetteController && self->_pairedDevice)
  {
    v3 = [[AKAnisetteProvisioningController alloc] initForDevice:self->_pairedDevice provider:self->_anisetteDataProvider];
    pairedDeviceAnisetteController = self->_pairedDeviceAnisetteController;
    self->_pairedDeviceAnisetteController = v3;
  }
  [(NSLock *)self->_anisetteControllerLock unlock];
  id v5 = self->_pairedDeviceAnisetteController;

  return v5;
}

- (id)_nativeAnisetteController
{
  [(NSLock *)self->_anisetteControllerLock lock];
  if (!self->_nativeAnisetteController)
  {
    v3 = objc_alloc_init(AKAnisetteProvisioningController);
    nativeAnisetteController = self->_nativeAnisetteController;
    self->_nativeAnisetteController = v3;
  }
  [(NSLock *)self->_anisetteControllerLock unlock];
  id v5 = self->_nativeAnisetteController;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAppleIDSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AKAppleIDSession;
  id v5 = [(AKAppleIDSession *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serviceID"];
    serviceID = v5->_serviceID;
    v5->_serviceID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_pairedDevice"];
    pairedDevice = v5->_pairedDevice;
    v5->_pairedDevice = (AKDevice *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxiedAnisetteData"];
    proxiedAnisetteData = v5->_proxiedAnisetteData;
    v5->_proxiedAnisetteData = (AKAnisetteData *)v10;

    dispatch_semaphore_t v12 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    anisetteControllerLock = v5->_anisetteControllerLock;
    v5->_anisetteControllerLock = v12;

    [(NSLock *)v5->_anisetteControllerLock setName:@"AKAnisetteControllerLock"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  serviceID = self->_serviceID;
  id v5 = a3;
  [v5 encodeObject:serviceID forKey:@"_serviceID"];
  [v5 encodeObject:self->_pairedDevice forKey:@"_pairedDevice"];
  [v5 encodeObject:self->_proxiedAnisetteData forKey:@"_proxiedAnisetteData"];
}

- (BOOL)shouldDenyRequestForURL:(id)a3 task:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[AKDevice currentDevice];
  int v8 = [v7 isInternalBuild];

  if (v8)
  {
    id v9 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[AKAppleIDSession shouldDenyRequestForURL:task:]();
    }

    uint64_t v10 = +[AKConfiguration sharedConfiguration];
    objc_super v11 = [v10 configurationValueForKey:@"com.apple.authkit.anisette.deny.url"];

    if (v11)
    {
      dispatch_semaphore_t v12 = _AKTrafficLogSubsystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[AKAppleIDSession shouldDenyRequestForURL:task:]();
      }
    }
    int v13 = [v5 absoluteString];
    int v8 = [v11 isEqualToString:v13];

    if (v8)
    {
      v14 = _AKTrafficLogSubsystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[AKAppleIDSession shouldDenyRequestForURL:task:]();
      }
    }
  }

  return v8;
}

- (void)URLSession:(id)a3 task:(id)a4 getAppleIDRequestOrHeadersForResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  dispatch_semaphore_t v12 = [v9 originalRequest];
  int v13 = [v12 URL];

  if ([(AKAppleIDSession *)self shouldDenyRequestForURL:v13 task:v9])
  {
LABEL_13:
    (*((void (**)(id, void, void, void))v11 + 2))(v11, 0, 0, 0);
    goto LABEL_14;
  }
  if (!v10)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke;
    v27[3] = &unk_1E5761638;
    id v28 = v11;
    [(AKAppleIDSession *)self _generateAppleIDHeadersForSessionTask:v9 withCompletion:v27];

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[AKAppleIDSession URLSession:task:getAppleIDRequestOrHeadersForResponse:completionHandler:]();
    }

    goto LABEL_13;
  }
  id v14 = v10;
  if ([v14 statusCode] == 434 || objc_msgSend(v14, "statusCode") == 433)
  {
    objc_super v15 = [v9 originalRequest];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_53;
    v23[3] = &unk_1E5761660;
    v16 = &v24;
    id v24 = v13;
    v17 = (id *)v25;
    v25[0] = v9;
    v25[1] = self;
    id v26 = v11;
    [(AKAppleIDSession *)self _handleAnissetteURLResponse:v14 forRequest:v15 withCompletion:v23];
  }
  else
  {
    if ([v14 statusCode] != 435) {
      goto LABEL_8;
    }
    uint64_t v19 = [v9 originalRequest];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_2;
    v20[3] = &unk_1E5761688;
    v16 = &v21;
    id v21 = v13;
    v17 = &v22;
    id v22 = v11;
    [(AKAppleIDSession *)self _handleURLSwitchingResponse:v14 forRequest:v19 withCompletion:v20];
  }
LABEL_8:

LABEL_14:
}

uint64_t __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_53(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_53_cold_1();
    }

    uint64_t v5 = *(void *)(a1 + 40);
    id v4 = *(void **)(a1 + 48);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_54;
    v7[3] = &unk_1E5761638;
    id v8 = *(id *)(a1 + 56);
    [v4 _generateAppleIDHeadersForSessionTask:v5 withCompletion:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v6();
  }
}

uint64_t __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = _AKLogSystem();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = [v5 URL];
      int v12 = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      objc_super v15 = v10;
      _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "Redirecting urlRequest from URL: %@ to alternate URL: %@", (uint8_t *)&v12, 0x16u);
    }
    id v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_2_cold_1();
    }

    id v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v11();
}

- (void)URLSession:(id)a3 task:(id)a4 getAppleIDHeadersForResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  int v12 = [v9 originalRequest];
  uint64_t v13 = [v12 URL];

  if ([(AKAppleIDSession *)self shouldDenyRequestForURL:v13 task:v9])
  {
LABEL_10:
    (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
    goto LABEL_11;
  }
  if (!v10)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __83__AKAppleIDSession_URLSession_task_getAppleIDHeadersForResponse_completionHandler___block_invoke;
    v22[3] = &unk_1E5761638;
    id v23 = v11;
    [(AKAppleIDSession *)self _generateAppleIDHeadersForSessionTask:v9 withCompletion:v22];
    objc_super v15 = v23;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v16 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[AKAppleIDSession URLSession:task:getAppleIDRequestOrHeadersForResponse:completionHandler:]();
    }

    goto LABEL_10;
  }
  __int16 v14 = [v9 originalRequest];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__AKAppleIDSession_URLSession_task_getAppleIDHeadersForResponse_completionHandler___block_invoke_57;
  v17[3] = &unk_1E5761660;
  id v18 = v13;
  id v19 = v9;
  v20 = self;
  id v21 = v11;
  [(AKAppleIDSession *)self _handleAnissetteURLResponse:v10 forRequest:v14 withCompletion:v17];

  objc_super v15 = v18;
LABEL_6:

LABEL_11:
}

uint64_t __83__AKAppleIDSession_URLSession_task_getAppleIDHeadersForResponse_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__AKAppleIDSession_URLSession_task_getAppleIDHeadersForResponse_completionHandler___block_invoke_57(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_53_cold_1();
    }

    uint64_t v5 = *(void *)(a1 + 40);
    id v4 = *(void **)(a1 + 48);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __83__AKAppleIDSession_URLSession_task_getAppleIDHeadersForResponse_completionHandler___block_invoke_58;
    v7[3] = &unk_1E5761638;
    id v8 = *(id *)(a1 + 56);
    [v4 _generateAppleIDHeadersForSessionTask:v5 withCompletion:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v6();
  }
}

uint64_t __83__AKAppleIDSession_URLSession_task_getAppleIDHeadersForResponse_completionHandler___block_invoke_58(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)appleIDHeadersWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  uint64_t v5 = [(AKAppleIDSession *)self _genericAppleIDHeadersDictionaryForRequest:0];
  id v6 = [(AKAppleIDSession *)self _nativeAnisetteController];
  id v14 = 0;
  v7 = [v6 attestationDataForRequest:0 error:&v14];
  id v8 = v14;

  id v9 = _AKTrafficLogSubsystem();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDSession appleIDHeadersWithCompletion:]();
    }

    if (v4) {
      v4[2](v4, 0, v8);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[AKAppleIDSession appleIDHeadersWithCompletion:]();
    }

    [(AKAppleIDSession *)self _reportOnRequest:0 response:0 attestationData:v7];
    id v11 = [v7 attestationHeaders];

    if (v11)
    {
      int v12 = [v7 attestationHeaders];
      [v5 addEntriesFromDictionary:v12];
    }
    if (v4)
    {
      uint64_t v13 = (void *)[v5 copy];
      ((void (**)(id, void *, id))v4)[2](v4, v13, 0);
    }
  }
}

- (void)appleIDHeadersUsingAnisetteWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  uint64_t v5 = [(AKAppleIDSession *)self _genericAppleIDHeadersDictionaryForRequest:0];
  id v6 = [(AKAppleIDSession *)self _nativeAnisetteController];
  id v13 = 0;
  v7 = [v6 anisetteDataWithError:&v13];
  id v8 = v13;

  id v9 = _AKTrafficLogSubsystem();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDSession appleIDHeadersWithCompletion:]();
    }

    if (v4) {
      v4[2](v4, 0, v8);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[AKAppleIDSession appleIDHeadersWithCompletion:]();
    }

    if (v7)
    {
      id v11 = objc_msgSend(MEMORY[0x1E4F18D50], "ak_anisetteHeadersWithData:", v7);
      if (v11) {
        [v5 addEntriesFromDictionary:v11];
      }
    }
    if (v4)
    {
      int v12 = (void *)[v5 copy];
      ((void (**)(id, void *, id))v4)[2](v4, v12, 0);
    }
  }
}

intptr_t __58__AKAppleIDSession_handleResponse_forRequest_shouldRetry___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_generateAppleIDHeadersForSessionTask:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 originalRequest];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke;
  v20[3] = &unk_1E57616D8;
  id v21 = v7;
  id v9 = v7;
  id v10 = (void *)MEMORY[0x1996FE880](v20);
  id v11 = [(AKAppleIDSession *)self _nativeAnisetteController];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_2;
  v15[3] = &unk_1E5761750;
  id v16 = v8;
  id v17 = v6;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v6;
  id v14 = v8;
  [v11 attestationDataForRequest:v14 completion:v15];
}

void __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = (id)[a2 copy];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

void __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] URL];
  id v8 = _AKTrafficLogSubsystem();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = a1[5];
      *(_DWORD *)buf = 138412802;
      uint64_t v29 = v7;
      __int16 v30 = 2114;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_error_impl(&dword_193494000, v9, OS_LOG_TYPE_ERROR, "Unable to append header for request %@! Task %{public}@ Error: %@.", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_2_cold_2();
  }

  id v11 = [a1[6] _genericAppleIDHeadersDictionaryForRequest:a1[4]];
  id v12 = [v5 attestationHeaders];

  if (v12)
  {
    [a1[6] _reportOnRequest:a1[4] response:0 attestationData:v5];
    id v13 = [v5 attestationHeaders];
    [v11 addEntriesFromDictionary:v13];
  }
  id v14 = a1[6];
  if (v14[4])
  {
    objc_super v15 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_2_cold_1();
    }

    id v16 = objc_msgSend(MEMORY[0x1E4F18D50], "ak_proxiedHeadersForDevice:anisetteData:", *((void *)a1[6] + 6), *((void *)a1[6] + 4));
    if (v16) {
      [v11 addEntriesFromDictionary:v16];
    }
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    id v17 = [v14 _pairedDeviceAnisetteController];

    if (v17)
    {
      id v18 = dispatch_get_global_queue(25, 0);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_64;
      v21[3] = &unk_1E5761728;
      id v22 = v7;
      id v19 = a1[5];
      id v20 = a1[6];
      id v23 = v19;
      id v24 = v20;
      id v25 = a1[4];
      id v26 = v11;
      id v27 = a1[7];
      dispatch_async(v18, v21);
    }
    else
    {
      (*((void (**)(void))a1[7] + 2))();
    }
  }
}

void __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_64(uint64_t a1)
{
  uint64_t v2 = _AKTrafficLogSubsystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_64_cold_1();
  }

  id v3 = [*(id *)(a1 + 48) _pairedDeviceAnisetteController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_65;
  v5[3] = &unk_1E5761700;
  uint64_t v4 = *(void *)(a1 + 56);
  v5[4] = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 72);
  [v3 anisetteDataForURLRequest:v4 completion:v5];
}

uint64_t __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_65(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F18D50], "ak_proxiedHeadersForDevice:anisetteData:", *(void *)(*(void *)(a1 + 32) + 48), a2);
    if (v3) {
      [*(id *)(a1 + 40) addEntriesFromDictionary:v3];
    }
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v4();
}

- (void)_handleAnissetteURLResponse:(id)a3 forRequest:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [a4 URL];
  id v11 = +[AKConfiguration sharedConfiguration];
  uint64_t v12 = [v11 shouldEnableAttestationLogging];

  if (v12 == 1)
  {
    id v13 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:].cold.9();
    }
  }
  unint64_t v14 = [v8 statusCode] - 433;
  if (v14 <= 0xA && ((1 << v14) & 0x703) != 0)
  {
    id v15 = v8;
    id v16 = [v15 allHeaderFields];
    id v17 = [v16 objectForKey:@"X-Apple-I-MD-Cmd-Target"];
    int v18 = [v17 isEqual:@"paired"];

    if (v18) {
      [(AKAppleIDSession *)self _pairedDeviceAnisetteController];
    }
    else {
    id v19 = [(AKAppleIDSession *)self _nativeAnisetteController];
    }
    if (v19)
    {
      switch(v14)
      {
        case 0uLL:
          id v20 = _AKTrafficLogSubsystem();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:].cold.6();
          }

          id v21 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", 433);
          id v22 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_generalErrorWithCode:errorDomain:underlyingError:", -8022, @"AKAnisetteError", v21);
          id v23 = objc_msgSend(MEMORY[0x1E4F46FC8], "ak_analyticsEventWithEventName:error:", @"com.apple.authkit.midInvalidated", v22);
          id v24 = +[AKAnalyticsReporterRTC rtcAnalyticsReporter];
          [v24 sendEvent:v23];

          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_79;
          v44[3] = &unk_1E5761778;
          id v46 = v9;
          id v45 = v19;
          [v45 eraseWithCompletion:v44];

          goto LABEL_38;
        case 1uLL:
          id v27 = _AKTrafficLogSubsystem();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:].cold.5();
          }

          id v28 = [v15 allHeaderFields];
          id v21 = [v28 objectForKey:@"X-Apple-I-MD-DATA"];

          id v22 = objc_msgSend(v21, "aaf_toBase64DecodedData");
          if (v22)
          {
            v47[0] = MEMORY[0x1E4F143A8];
            v47[1] = 3221225472;
            v47[2] = __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke;
            v47[3] = &unk_1E575EF90;
            id v48 = v9;
            [v19 syncWithSIMData:v22 completion:v47];
          }
          else
          {
            id v33 = _AKLogSystem();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:].cold.4();
            }

            (*((void (**)(id, void))v9 + 2))(v9, 0);
          }
LABEL_38:

          goto LABEL_39;
        case 8uLL:
          __int16 v30 = [(AKAppleIDSession *)self _nativeAnisetteController];
          uint64_t v35 = MEMORY[0x1E4F143A8];
          uint64_t v36 = 3221225472;
          v37 = __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_83;
          v38 = &unk_1E57617A0;
          id v40 = v9;
          id v39 = v10;
          [v30 resetDeviceIdentityWithCompletion:&v35];

          break;
        case 9uLL:
          id v31 = _AKLogSystem();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:].cold.8();
          }

          goto LABEL_32;
        case 0xAuLL:
          __int16 v32 = [v15 allHeaderFields];
          id v21 = [v32 objectForKey:@"x-apple-server-time"];

          if (v21)
          {
            v41[0] = MEMORY[0x1E4F143A8];
            v41[1] = 3221225472;
            v41[2] = __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_81;
            v41[3] = &unk_1E57617A0;
            id v43 = v9;
            id v42 = v10;
            [(AKAppleIDSession *)self _handleServerTimeAdjustmentWithTime:v21 completion:v41];
          }
          else
          {
            uint64_t v34 = _AKLogSystem();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:].cold.7();
            }

            (*((void (**)(id, void))v9 + 2))(v9, 0);
          }
LABEL_39:

          break;
        default:
          uint64_t v29 = _AKLogSystem();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:]();
          }

LABEL_32:
          (*((void (**)(id, void))v9 + 2))(v9, 0);
          break;
      }
      -[AKAppleIDSession _reportOnRequest:response:attestationData:](self, "_reportOnRequest:response:attestationData:", 0, v15, 0, v35, v36, v37, v38);
    }
    else
    {
      id v25 = _AKTrafficLogSubsystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:]();
      }

      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
  else
  {
    id v26 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:]();
    }

    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AKTrafficLogSubsystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_cold_2();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_79(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = _AKTrafficLogSubsystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_79_cold_1();
    }

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_80;
    v9[3] = &unk_1E575EF90;
    id v8 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    [v8 provisionWithCompletion:v9];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_79_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_80(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = _AKTrafficLogSubsystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_80_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_80_cold_2();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_81(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _AKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_81_cold_2();
    }
  }
  else
  {
    uint64_t v4 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_81_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_83(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _AKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_83_cold_2();
    }
  }
  else
  {
    uint64_t v4 = _AKTrafficLogSubsystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_81_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_handleURLSwitchingResponse:(id)a3 forRequest:(id)a4 withCompletion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [v9 URL];
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)uint64_t v29 = v7;
    *(_WORD *)&v29[8] = 2112;
    *(void *)&v29[10] = v10;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "Handling response %@ for URL %@...", buf, 0x16u);
  }

  uint64_t v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)uint64_t v29 = 435;
    *(_WORD *)&v29[4] = 2112;
    *(void *)&v29[6] = v10;
    _os_log_impl(&dword_193494000, v12, OS_LOG_TYPE_DEFAULT, "URL Switching state code (%d) received for URL: %@", buf, 0x12u);
  }

  id v13 = (void *)[v9 mutableCopy];
  unint64_t v14 = objc_msgSend(v13, "ak_valueForEncodedHeaderWithKey:", @"X-Apple-I-UrlSwitch-Info");
  id v15 = [v14 componentsSeparatedByString:@":"];

  if ((unint64_t)[v15 count] > 1)
  {
    id v17 = [v15 firstObject];
    int v18 = [v15 lastObject];
    id v19 = [v7 valueForHTTPHeaderField:@"X-Apple-I-Data"];
    if ([v19 length])
    {
      id v20 = +[AKURLBag bagForAltDSID:v17];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __74__AKAppleIDSession__handleURLSwitchingResponse_forRequest_withCompletion___block_invoke;
      v23[3] = &unk_1E57617C8;
      id v24 = v20;
      id v25 = v18;
      id v27 = v8;
      id v26 = v13;
      id v21 = v20;
      [v21 forceUpdateBagWithUrlSwitchData:v19 completion:v23];
    }
    else
    {
      id v22 = _AKLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[AKAppleIDSession _handleURLSwitchingResponse:forRequest:withCompletion:]();
      }

      objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7087);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, id))v8 + 2))(v8, 0, v21);
    }
  }
  else
  {
    id v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDSession _handleURLSwitchingResponse:forRequest:withCompletion:]();
    }

    id v17 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7087);
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v17);
  }
}

void __74__AKAppleIDSession__handleURLSwitchingResponse_forRequest_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [*(id *)(a1 + 32) urlAtKey:*(void *)(a1 + 40)];
    if (v6)
    {
      [*(id *)(a1 + 48) setURL:v6];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      id v8 = _AKLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __74__AKAppleIDSession__handleURLSwitchingResponse_forRequest_withCompletion___block_invoke_cold_1();
      }

      id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7088);
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __74__AKAppleIDSession__handleURLSwitchingResponse_forRequest_withCompletion___block_invoke_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __62__AKAppleIDSession__reportOnRequest_response_attestationData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _AKLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __62__AKAppleIDSession__reportOnRequest_response_attestationData___block_invoke_cold_1();
    }
  }
}

- (void)_resetDeviceIdentityWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAppleIDSession *)self _nativeAnisetteController];
  [v5 resetDeviceIdentityWithCompletion:v4];
}

- (void)_handleServerTimeAdjustmentWithTime:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AKAppleIDSession *)self _nativeAnisetteController];
  [v8 setTimeAdjustmentWithServerTime:v7 completion:v6];
}

- (AKDevice)pairedDevice
{
  return self->_pairedDevice;
}

- (void)setPairedDevice:(id)a3
{
}

- (AKAnisetteServiceProtocol)anisetteDataProvider
{
  return self->_anisetteDataProvider;
}

- (void)setAnisetteDataProvider:(id)a3
{
}

- (void)shouldDenyRequestForURL:task:.cold.1()
{
  OUTLINED_FUNCTION_13();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = [v1 absoluteString];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_3(&dword_193494000, v0, v3, "Denying Anisette to URL:%@ Task: %{public}@ ...", v4);
}

- (void)shouldDenyRequestForURL:task:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Anisette deny url is set: %@", v2, v3, v4, v5, v6);
}

- (void)shouldDenyRequestForURL:task:.cold.3()
{
  OUTLINED_FUNCTION_13();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 absoluteString];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_3(&dword_193494000, v0, v3, "Checking for deny listing URL:%@ Task: %{public}@ ...", v4);
}

- (void)URLSession:task:getAppleIDRequestOrHeadersForResponse:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_5_2(&dword_193494000, v0, v1, "Not going to do anything with non-HTTP response from URL: %@ Task: %{public}@.");
}

void __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_53_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_3(&dword_193494000, v0, v1, "Trying to get new Anisette headers to retry request for URL:%@ Task: %{public}@ ...", v2);
}

void __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Url Switch request failed with error: %@, ignoring URL Switch", v2, v3, v4, v5, v6);
}

- (void)appleIDHeadersWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Creating header data from Anisette.", v2, v3, v4, v5, v6);
}

- (void)appleIDHeadersWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Unable to create headers! Error: %@", v2, v3, v4, v5, v6);
}

- (void)handleResponse:(uint64_t)a3 forRequest:(NSObject *)a4 shouldRetry:.cold.1(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_3_3(&dword_193494000, a4, a3, "No handling for HTTP status code %@ in response for URL %@", (uint8_t *)a3);
}

- (void)_generateAppleIDHeadersForRequest:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Fetching paired device Anisette data for headers to URL: %@.", v2, v3, v4, v5, v6);
}

- (void)_generateAppleIDHeadersForRequest:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Using proxied Anisette data for headers to URL: %@.", v2, v3, v4, v5, v6);
}

- (void)_generateAppleIDHeadersForRequest:error:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Passing along decorated request for: %@", v2, v3, v4, v5, v6);
}

- (void)_generateAppleIDHeadersForRequest:error:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_193494000, v0, OS_LOG_TYPE_ERROR, "Unable to append header for request %@! Error: %@", v1, 0x16u);
}

void __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_5_2(&dword_193494000, v0, v1, "Using proxied Anisette data for headers to URL: %@ Task %{public}@.");
}

void __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_5_2(&dword_193494000, v0, v1, "Passing along decorated request for URL: %@ Task %{public}@.");
}

void __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_64_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_3(&dword_193494000, v0, v1, "Fetching paired device Anisette data for headers to URL: %@. Task: %{public}@.", v2);
}

- (void)_handleAnissetteURLResponse:forRequest:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_13();
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "statusCode"));
  int v5 = 138412546;
  uint8_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v1;
  OUTLINED_FUNCTION_3_3(&dword_193494000, v0, v4, "No handling for HTTP status code %@ in response for URL %@", (uint8_t *)&v5);
}

- (void)_handleAnissetteURLResponse:forRequest:withCompletion:.cold.2()
{
  OUTLINED_FUNCTION_13();
  uint64_t v3 = v2;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "statusCode"));
  int v5 = [v3 allHeaderFields];
  int v6 = 138412802;
  __int16 v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v1;
  __int16 v10 = 2112;
  id v11 = v5;
  _os_log_error_impl(&dword_193494000, v0, OS_LOG_TYPE_ERROR, "No instance of AKAnisetteProvisioningController to handle HTTP code %@ in response to %@ %@.", (uint8_t *)&v6, 0x20u);
}

- (void)_handleAnissetteURLResponse:forRequest:withCompletion:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Unhandled status code (%ld). Not retrying.", v2, v3, v4, v5, v6);
}

- (void)_handleAnissetteURLResponse:forRequest:withCompletion:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "HTTP 434 without sync data received!", v2, v3, v4, v5, v6);
}

- (void)_handleAnissetteURLResponse:forRequest:withCompletion:.cold.5()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109378;
  OUTLINED_FUNCTION_14();
  _os_log_debug_impl(&dword_193494000, v0, OS_LOG_TYPE_DEBUG, "Sync status code (%d) received for URL: %@", (uint8_t *)v1, 0x12u);
}

- (void)_handleAnissetteURLResponse:forRequest:withCompletion:.cold.6()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109378;
  OUTLINED_FUNCTION_14();
  _os_log_debug_impl(&dword_193494000, v0, OS_LOG_TYPE_DEBUG, "Reprovision status code (%d) received for URL: %@", (uint8_t *)v1, 0x12u);
}

- (void)_handleAnissetteURLResponse:forRequest:withCompletion:.cold.7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "HTTP BAA error 443 without server time received!", v2, v3, v4, v5, v6);
}

- (void)_handleAnissetteURLResponse:forRequest:withCompletion:.cold.8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "The host certificate for the device is invalid. It needs to be renewed to proceed.", v2, v3, v4, v5, v6);
}

- (void)_handleAnissetteURLResponse:forRequest:withCompletion:.cold.9()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_2(&dword_193494000, v0, v1, "Handling response %@ for URL %@...");
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Anisette sync was successful!", v2, v3, v4, v5, v6);
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Anisette sync failed! Error: %@", v2, v3, v4, v5, v6);
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_79_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Erased Anisette data successfully. Time to provision!", v2, v3, v4, v5, v6);
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_79_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Unable to reprovision because Anisette data could not be erased! Error: %@", v2, v3, v4, v5, v6);
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_80_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Successfully provisioned new Anisette data.", v2, v3, v4, v5, v6);
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_80_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Provisioning new Anisette data failed! Error: %@", v2, v3, v4, v5, v6);
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_81_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_81_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Could not set server adjusted time. Error: %@, not retrying", v2, v3, v4, v5, v6);
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_83_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Could not reset the BAA certs for renewal. Error: %@, not retrying", v2, v3, v4, v5, v6);
}

- (void)_handleURLSwitchingResponse:forRequest:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "No Value found for URLSwitching header ignoring URL Switching request", v2, v3, v4, v5, v6);
}

- (void)_handleURLSwitchingResponse:forRequest:withCompletion:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "No Value found for Response URLSwitch data header ignoring URL Switching request", v2, v3, v4, v5, v6);
}

void __74__AKAppleIDSession__handleURLSwitchingResponse_forRequest_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "No URL found for UrlKey after URLBag update, ignoring URL Switching request", v2, v3, v4, v5, v6);
}

void __74__AKAppleIDSession__handleURLSwitchingResponse_forRequest_withCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "URLBag failed to update with error: %@, ignoring URL Switching request", v2, v3, v4, v5, v6);
}

void __62__AKAppleIDSession__reportOnRequest_response_attestationData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Error posting attestation analytics - %@", v2, v3, v4, v5, v6);
}

@end