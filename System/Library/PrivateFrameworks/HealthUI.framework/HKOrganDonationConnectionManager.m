@interface HKOrganDonationConnectionManager
+ (BOOL)_organDonationDisabled;
+ (BOOL)hasStoredRegistrant;
+ (BOOL)isOrganDonationRegistrationAvailable;
+ (BOOL)shouldShowStoreDemoOrganDonation;
+ (id)_gatewayHost;
+ (id)_host;
+ (id)_keychainQueryDictionaryForIdentifier:(id)a3;
+ (id)_port;
+ (id)_scheme;
+ (id)_tokenWithIdentifier:(id)a3 shouldReturnData:(BOOL)a4;
+ (id)storeDemoModeModifiedDate;
+ (int64_t)_hostConfiguration;
+ (int64_t)registrationSubmissionHostConfiguration;
+ (void)openDonateLifeMicroSiteInSafari;
+ (void)organDonationSignificantDate:(id)a3;
+ (void)refreshOrganDonationFeatureAvailability;
- (HKAnalyticsEventSubmissionManager)analyticsEventSubmissionManager;
- (HKHealthStore)healthStore;
- (HKOrganDonationConnectionManager)initWithHealthStore:(id)a3;
- (HKOrganDonationConnectionManagerDelegate)delegate;
- (NSString)accessToken;
- (NSString)refreshToken;
- (NSTimer)accessTokenInvalidationTimer;
- (NSURLSession)defaultSession;
- (id)_base64URLEncoding:(id)a3;
- (id)_genericJSONDataTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (id)_getRequestWithURL:(id)a3 bearerToken:(id)a4;
- (id)_jsonBodyPostRequestWithURL:(id)a3 method:(id)a4 postData:(id)a5 bearerToken:(id)a6;
- (id)_jsonObjectWithData:(id)a3 response:(id)a4;
- (id)_jwtWithPayload:(id)a3 grantType:(id)a4;
- (id)_refreshBearerTokenJWTWithRefreshToken:(id)a3;
- (id)_registrationJWTWithRegistrant:(id)a3;
- (id)_urlWithPath:(id)a3;
- (id)jwtHeader;
- (id)jwtPayloadWithRegistrant:(id)a3;
- (id)payload;
- (void)_deleteTokenWithIdentifier:(id)a3;
- (void)_flushTokenDependentRequestsWithStatus:(int64_t)a3;
- (void)_handleServerErrorWithResponse:(id)a3 originRequest:(id)a4 payload:(id)a5 completion:(id)a6;
- (void)_handleURLTaskError:(id)a3 withCompletion:(id)a4;
- (void)_invalidateAccessToken:(id)a3;
- (void)_refreshAccessTokenIfNeeded;
- (void)_scheduleAccessTokenDependentRequest:(id)a3 withCompletion:(id)a4;
- (void)_sendQueuedTokenDependentRequests;
- (void)_transitionToState:(int64_t)a3;
- (void)_updateAccessTokenAndScheduleInvalidationTimer:(id)a3 expiresIn:(double)a4;
- (void)_upsertTokenInKeychain:(id)a3 identifier:(id)a4;
- (void)cleanUp;
- (void)deleteRegistrantWithCompletion:(id)a3;
- (void)openRegisterMeSiteInSafariIfAuthenticated;
- (void)refreshBearerTokenWithRefreshToken:(id)a3 completion:(id)a4;
- (void)reloadRegistrantWithCompletion:(id)a3;
- (void)setAccessToken:(id)a3;
- (void)setAccessTokenInvalidationTimer:(id)a3;
- (void)setAnalyticsEventSubmissionManager:(id)a3;
- (void)setDefaultSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setRefreshToken:(id)a3;
- (void)submitOrganDonationEventWithErrorType:(int)a3;
- (void)submitRegistrant:(id)a3 completion:(id)a4;
- (void)updateRegistrantWithParams:(id)a3 completion:(id)a4;
@end

@implementation HKOrganDonationConnectionManager

+ (id)_keychainQueryDictionaryForIdentifier:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setObject:*MEMORY[0x1E4F3B998] forKey:*MEMORY[0x1E4F3B978]];
  [v6 setObject:@"com.apple.HealthUI.OrganDonation" forKey:*MEMORY[0x1E4F3B5C0]];
  v7 = [v5 dataUsingEncoding:4];

  [v6 setObject:v7 forKey:*MEMORY[0x1E4F3B7B8]];
  v8 = [a1 _host];
  v9 = [v8 dataUsingEncoding:4];

  [v6 setObject:v9 forKey:*MEMORY[0x1E4F3B848]];
  [v6 setObject:*MEMORY[0x1E4F3B7F8] forKey:*MEMORY[0x1E4F3B7C8]];
  v10 = [a1 _port];
  [v6 setObject:v10 forKey:*MEMORY[0x1E4F3B7C0]];

  [v6 setObject:*MEMORY[0x1E4F3B5F0] forKey:*MEMORY[0x1E4F3B5E8]];
  [v6 setObject:*MEMORY[0x1E4F3B5B0] forKey:*MEMORY[0x1E4F3B558]];
  [v6 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3B878]];
  [v6 setObject:@"com.apple.Health" forKey:*MEMORY[0x1E4F3B550]];

  return v6;
}

+ (int64_t)_hostConfiguration
{
  if (![MEMORY[0x1E4F2B860] isAppleInternalInstall]) {
    return 2;
  }
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"donateLifeHost"];

  return v3;
}

+ (BOOL)isOrganDonationRegistrationAvailable
{
  int v3 = [MEMORY[0x1E4F2B860] hasTelephonyCapability];
  if (v3)
  {
    int v3 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_isUSLocale");
    if (v3)
    {
      if ([a1 _hostConfiguration] == 3) {
        LOBYTE(v3) = 0;
      }
      else {
        LOBYTE(v3) = [a1 _organDonationDisabled] ^ 1;
      }
    }
  }
  return v3;
}

+ (BOOL)hasStoredRegistrant
{
  v2 = [a1 _tokenWithIdentifier:@"refresh_token" shouldReturnData:0];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)_tokenWithIdentifier:(id)a3 shouldReturnData:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  CFDictionaryRef v7 = [a1 _keychainQueryDictionaryForIdentifier:v6];
  CFDictionaryRef v8 = v7;
  if (v4) {
    [(__CFDictionary *)v7 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3BC70]];
  }
  CFTypeRef result = 0;
  OSStatus v9 = SecItemCopyMatching(v8, &result);
  if (v9 != -25300)
  {
    if (!v9)
    {
      v10 = (void *)result;
      v11 = (void *)[[NSString alloc] initWithData:result encoding:4];

      goto LABEL_9;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      +[HKOrganDonationConnectionManager _tokenWithIdentifier:shouldReturnData:]();
    }
  }
  v11 = 0;
LABEL_9:

  return v11;
}

+ (id)_port
{
  return &unk_1F3C202A8;
}

+ (BOOL)_organDonationDisabled
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"donateLifeDisabled"];

  return v3;
}

+ (id)_host
{
  unint64_t v2 = [a1 _hostConfiguration];
  if (v2 > 3) {
    return @"dlaapibeta.lifelogics.org";
  }
  else {
    return off_1E6D51490[v2];
  }
}

- (HKOrganDonationConnectionManager)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKOrganDonationConnectionManager;
  id v6 = [(HKOrganDonationConnectionManager *)&v17 init];
  CFDictionaryRef v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    [(HKOrganDonationConnectionManager *)v7 _transitionToState:0];
    CFDictionaryRef v8 = (void *)MEMORY[0x1E4F290E0];
    OSStatus v9 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
    v10 = [v8 sessionWithConfiguration:v9];

    [(HKOrganDonationConnectionManager *)v7 setDefaultSession:v10];
    uint64_t v11 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0x10000];
    taskQueue = v7->_taskQueue;
    v7->_taskQueue = (NSMapTable *)v11;

    [(HKOrganDonationConnectionManager *)v7 _refreshAccessTokenIfNeeded];
    id v13 = objc_alloc(MEMORY[0x1E4F2ABE8]);
    uint64_t v14 = [v13 initWithLoggingCategory:*MEMORY[0x1E4F29FB0] healthDataSource:v5];
    analyticsEventSubmissionManager = v7->_analyticsEventSubmissionManager;
    v7->_analyticsEventSubmissionManager = (HKAnalyticsEventSubmissionManager *)v14;
  }
  return v7;
}

+ (id)_gatewayHost
{
  unint64_t v2 = [a1 _hostConfiguration];
  if (v2 > 3) {
    return @"dlabeta.lifelogics.org";
  }
  else {
    return off_1E6D514B0[v2];
  }
}

+ (id)_scheme
{
  return @"https";
}

- (void)cleanUp
{
  char v3 = [(HKOrganDonationConnectionManager *)self defaultSession];
  [v3 invalidateAndCancel];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessTokenInvalidationTimer);
  [WeakRetained invalidate];

  taskQueue = self->_taskQueue;
  [(NSMapTable *)taskQueue removeAllObjects];
}

- (void)_transitionToState:(int64_t)a3
{
  if (self->_managerState != a3)
  {
    self->_managerState = a3;
    switch(a3)
    {
      case 0:
        [(HKOrganDonationConnectionManager *)self _refreshAccessTokenIfNeeded];
        break;
      case 2:
        [(HKOrganDonationConnectionManager *)self _sendQueuedTokenDependentRequests];
        break;
      case 3:
        uint64_t v3 = 3;
        goto LABEL_4;
      case 4:
      case 5:
        uint64_t v3 = 4;
LABEL_4:
        [(HKOrganDonationConnectionManager *)self _flushTokenDependentRequestsWithStatus:v3];
        break;
      default:
        return;
    }
  }
}

- (void)submitRegistrant:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CFDictionaryRef v8 = [(HKOrganDonationConnectionManager *)self _urlWithPath:@"/v1/oauth/token"];
  OSStatus v9 = [v7 jsonDictionaryRepresentation];

  v10 = [(HKOrganDonationConnectionManager *)self _registrationJWTWithRegistrant:v9];
  if (v10)
  {
    id v17 = 0;
    uint64_t v11 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v10 options:0 error:&v17];
    id v12 = v17;
    id v13 = [(HKOrganDonationConnectionManager *)self _jsonBodyPostRequestWithURL:v8 method:@"POST" postData:v11 bearerToken:0];
    [(HKOrganDonationConnectionManager *)self _transitionToState:1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__HKOrganDonationConnectionManager_submitRegistrant_completion___block_invoke;
    v15[3] = &unk_1E6D513D8;
    v15[4] = self;
    id v16 = v6;
    uint64_t v14 = [(HKOrganDonationConnectionManager *)self _genericJSONDataTaskWithRequest:v13 completionHandler:v15];
    [v14 resume];
  }
  else
  {
    (*((void (**)(id, void, uint64_t))v6 + 2))(v6, 0, 4);
  }
}

void __64__HKOrganDonationConnectionManager_submitRegistrant_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    [*(id *)(a1 + 32) submitOrganDonationEventWithErrorType:0];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__HKOrganDonationConnectionManager_submitRegistrant_completion___block_invoke_2;
    v10[3] = &unk_1E6D513B0;
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = v8;
    uint64_t v12 = v9;
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
  (*(void (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v6, a3, v7);
}

void __64__HKOrganDonationConnectionManager_submitRegistrant_completion___block_invoke_2(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"access_token"];
  unint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"refresh_token"];
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"expires_in"];
  [v3 doubleValue];
  double v5 = v4;

  [*(id *)(a1 + 40) setRefreshToken:v2];
  [*(id *)(a1 + 40) _updateAccessTokenAndScheduleInvalidationTimer:v6 expiresIn:v5];
  [*(id *)(a1 + 40) _transitionToState:2];
}

- (void)_refreshAccessTokenIfNeeded
{
  uint64_t v3 = [(id)objc_opt_class() _tokenWithIdentifier:@"refresh_token" shouldReturnData:1];
  refreshToken = self->_refreshToken;
  self->_refreshToken = v3;

  if ([(NSString *)self->_refreshToken length])
  {
    if ((unint64_t)(self->_managerState - 1) >= 2)
    {
      [(HKOrganDonationConnectionManager *)self _transitionToState:1];
      double v5 = self->_refreshToken;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __63__HKOrganDonationConnectionManager__refreshAccessTokenIfNeeded__block_invoke;
      v6[3] = &unk_1E6D51400;
      v6[4] = self;
      [(HKOrganDonationConnectionManager *)self refreshBearerTokenWithRefreshToken:v5 completion:v6];
    }
  }
}

void __63__HKOrganDonationConnectionManager__refreshAccessTokenIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!a3)
  {
    id v10 = v5;
    id v6 = [v5 objectForKeyedSubscript:@"access_token"];
    if ([v6 length])
    {
      uint64_t v7 = [v10 objectForKeyedSubscript:@"expires_in"];
      [v7 doubleValue];
      double v9 = v8;

      [*(id *)(a1 + 32) _updateAccessTokenAndScheduleInvalidationTimer:v6 expiresIn:v9];
      [*(id *)(a1 + 32) _transitionToState:2];
    }

    id v5 = v10;
  }
}

- (void)refreshBearerTokenWithRefreshToken:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(HKOrganDonationConnectionManager *)self _urlWithPath:@"/v1/oauth/token"];
  double v9 = [(HKOrganDonationConnectionManager *)self _refreshBearerTokenJWTWithRefreshToken:v7];

  if (v9)
  {
    id v16 = 0;
    id v10 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v9 options:0 error:&v16];
    id v11 = v16;
    uint64_t v12 = [(HKOrganDonationConnectionManager *)self _jsonBodyPostRequestWithURL:v8 method:@"POST" postData:v10 bearerToken:0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __82__HKOrganDonationConnectionManager_refreshBearerTokenWithRefreshToken_completion___block_invoke;
    v14[3] = &unk_1E6D513D8;
    v14[4] = self;
    id v15 = v6;
    id v13 = [(HKOrganDonationConnectionManager *)self _genericJSONDataTaskWithRequest:v12 completionHandler:v14];
    [v13 resume];
  }
  else
  {
    (*((void (**)(id, void, uint64_t))v6 + 2))(v6, 0, 4);
  }
}

void __82__HKOrganDonationConnectionManager_refreshBearerTokenWithRefreshToken_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    [*(id *)(a1 + 32) submitOrganDonationEventWithErrorType:4];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)reloadRegistrantWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HKOrganDonationConnectionManager *)self _urlWithPath:@"/v1/registrants/me"];
  id v6 = [(HKOrganDonationConnectionManager *)self _getRequestWithURL:v5 bearerToken:self->_accessToken];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__HKOrganDonationConnectionManager_reloadRegistrantWithCompletion___block_invoke;
  v8[3] = &unk_1E6D513D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(HKOrganDonationConnectionManager *)self _scheduleAccessTokenDependentRequest:v6 withCompletion:v8];
}

void __67__HKOrganDonationConnectionManager_reloadRegistrantWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v8 = v5;
  if (a3)
  {
    [*(id *)(a1 + 32) submitOrganDonationEventWithErrorType:1];
    id v5 = v8;
  }
  id v6 = [v5 objectForKeyedSubscript:@"inactive"];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    [*(id *)(a1 + 32) setRefreshToken:0];
    [*(id *)(a1 + 32) setAccessToken:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateRegistrantWithParams:(id)a3 completion:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HKOrganDonationConnectionManager *)self _urlWithPath:@"/v1/registrants/me"];
  id v9 = (void *)MEMORY[0x1E4F28D90];
  v19 = @"registrant";
  v20[0] = v6;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  id v18 = 0;
  id v11 = [v9 dataWithJSONObject:v10 options:0 error:&v18];
  id v12 = v18;

  if (v12)
  {
    _HKInitializeLogging();
    id v13 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      -[HKOrganDonationConnectionManager updateRegistrantWithParams:completion:]((uint64_t)v6, v13);
    }
  }
  uint64_t v14 = [(HKOrganDonationConnectionManager *)self _jsonBodyPostRequestWithURL:v8 method:@"PATCH" postData:v11 bearerToken:self->_accessToken];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__HKOrganDonationConnectionManager_updateRegistrantWithParams_completion___block_invoke;
  v16[3] = &unk_1E6D513D8;
  v16[4] = self;
  id v17 = v7;
  id v15 = v7;
  [(HKOrganDonationConnectionManager *)self _scheduleAccessTokenDependentRequest:v14 withCompletion:v16];
}

void __74__HKOrganDonationConnectionManager_updateRegistrantWithParams_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v7 = a2;
  if (a3)
  {
    [v5 submitOrganDonationEventWithErrorType:2];
  }
  else
  {
    id v6 = [(id)objc_opt_class() _tokenWithIdentifier:@"refresh_token" shouldReturnData:1];
    [*(id *)(a1 + 32) setRefreshToken:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deleteRegistrantWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HKOrganDonationConnectionManager *)self _urlWithPath:@"/v1/registrants/me"];
  id v6 = [(HKOrganDonationConnectionManager *)self _jsonBodyPostRequestWithURL:v5 method:@"DELETE" postData:0 bearerToken:self->_accessToken];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__HKOrganDonationConnectionManager_deleteRegistrantWithCompletion___block_invoke;
  v8[3] = &unk_1E6D513D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(HKOrganDonationConnectionManager *)self _scheduleAccessTokenDependentRequest:v6 withCompletion:v8];
}

void __67__HKOrganDonationConnectionManager_deleteRegistrantWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  if (a3)
  {
    [v5 submitOrganDonationEventWithErrorType:3];
  }
  else
  {
    [v5 setRefreshToken:0];
    [*(id *)(a1 + 32) setAccessToken:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)openRegisterMeSiteInSafariIfAuthenticated
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HKOrganDonationConnectionManager *)self accessToken];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F29088]);
    id v6 = [(id)objc_opt_class() _scheme];
    [v5 setScheme:v6];

    id v7 = [(id)objc_opt_class() _gatewayHost];
    [v5 setHost:v7];

    [v5 setPath:@"/ios_gateway"];
    id v8 = (void *)MEMORY[0x1E4F290C8];
    id v9 = [(HKOrganDonationConnectionManager *)self accessToken];
    id v10 = [v8 queryItemWithName:@"at" value:v9];

    v14[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v5 setQueryItems:v11];

    id v12 = [v5 URL];
    if (v12)
    {
      id v13 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v13 openURL:v12 withOptions:0];
    }
  }
}

- (void)_scheduleAccessTokenDependentRequest:(id)a3 withCompletion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  int64_t managerState = self->_managerState;
  if (managerState != 1)
  {
    if (managerState == 2)
    {
      id v8 = [(HKOrganDonationConnectionManager *)self _genericJSONDataTaskWithRequest:v10 completionHandler:v6];
      [v8 resume];
      goto LABEL_6;
    }
    [(HKOrganDonationConnectionManager *)self _refreshAccessTokenIfNeeded];
  }
  taskQueue = self->_taskQueue;
  id v8 = _Block_copy(v6);
  [(NSMapTable *)taskQueue setObject:v8 forKey:v10];
LABEL_6:
}

- (id)_urlWithPath:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F29088];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [(id)objc_opt_class() _scheme];
  [v5 setScheme:v6];

  id v7 = [(id)objc_opt_class() _host];
  [v5 setHost:v7];

  [v5 setPath:v4];
  id v8 = [v5 URL];

  return v8;
}

- (void)submitOrganDonationEventWithErrorType:(int)a3
{
  id v4 = [[HKOrganDonationFlowErrorAnalyticEvent alloc] initWithErrorType:*(void *)&a3];
  analyticsEventSubmissionManager = self->_analyticsEventSubmissionManager;
  uint64_t v6 = 0;
  [(HKAnalyticsEventSubmissionManager *)analyticsEventSubmissionManager submitEvent:v4 error:&v6];
}

+ (void)openDonateLifeMicroSiteInSafari
{
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  unint64_t v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://registerme.org/ios"];
  [v3 openURL:v2 withOptions:0];
}

+ (int64_t)registrationSubmissionHostConfiguration
{
  if (![MEMORY[0x1E4F2B860] isAppleInternalInstall]) {
    return 2;
  }
  unint64_t v3 = [a1 _hostConfiguration];
  if (v3 > 3) {
    return 1;
  }
  else {
    return qword_1E0F053E8[v3];
  }
}

+ (void)refreshOrganDonationFeatureAvailability
{
  id v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://health-assets.cdn-apple.com/hippocrates/manifest.json"];
  unint64_t v2 = [MEMORY[0x1E4F290D0] requestWithURL:v5];
  unint64_t v3 = [MEMORY[0x1E4F290E0] sharedSession];
  id v4 = [v3 dataTaskWithRequest:v2 completionHandler:&__block_literal_global_3];

  [v4 resume];
}

void __75__HKOrganDonationConnectionManager_refreshOrganDonationFeatureAvailability__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (a2)
  {
    id v15 = 0;
    id v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a2 options:0 error:&v15];
    id v9 = v15;
    if (v8)
    {
      id v10 = [v8 objectForKeyedSubscript:@"status"];
      uint64_t v11 = [v10 isEqualToString:@"disabled"];
      id v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v12 setBool:v11 forKey:@"donateLifeDisabled"];
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v14 = (void *)*MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
        __75__HKOrganDonationConnectionManager_refreshOrganDonationFeatureAvailability__block_invoke_cold_2(v14, v6);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v13 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __75__HKOrganDonationConnectionManager_refreshOrganDonationFeatureAvailability__block_invoke_cold_1(v13);
    }
  }
}

- (id)_jsonObjectWithData:(id)a3 response:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    id v28 = 0;
    id v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:4 error:&v28];
    id v8 = v28;
    if (v8)
    {
      _HKInitializeLogging();
      id v9 = (void *)*MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
        __75__HKOrganDonationConnectionManager_refreshOrganDonationFeatureAvailability__block_invoke_cold_2(v9, v6);
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = v8;
      id v21 = v6;
      id v22 = v5;
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v10 = [v7 allKeys];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            id v16 = objc_msgSend(v7, "objectForKey:", v15, v20, v21, v22);
            id v17 = [MEMORY[0x1E4F1CA98] null];
            char v18 = [v16 isEqual:v17];

            if ((v18 & 1) == 0) {
              [v23 setObject:v16 forKey:v15];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v12);
      }

      id v6 = v21;
      id v5 = v22;
      id v8 = v20;
    }
    else
    {
      id v23 = 0;
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (id)_genericJSONDataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HKOrganDonationConnectionManager *)self defaultSession];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__HKOrganDonationConnectionManager__genericJSONDataTaskWithRequest_completionHandler___block_invoke;
  v13[3] = &unk_1E6D51470;
  id v14 = v6;
  uint64_t v15 = self;
  id v16 = v7;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = [v8 dataTaskWithRequest:v10 completionHandler:v13];

  return v11;
}

void __86__HKOrganDonationConnectionManager__genericJSONDataTaskWithRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    _HKInitializeLogging();
    id v9 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __86__HKOrganDonationConnectionManager__genericJSONDataTaskWithRequest_completionHandler___block_invoke_cold_1(a1, v9);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__HKOrganDonationConnectionManager__genericJSONDataTaskWithRequest_completionHandler___block_invoke_431;
    block[3] = &unk_1E6D51340;
    block[4] = *(void *)(a1 + 40);
    id v22 = v8;
    id v23 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v10 = v7;
    uint64_t v11 = [*(id *)(a1 + 40) _jsonObjectWithData:a2 response:v10];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __86__HKOrganDonationConnectionManager__genericJSONDataTaskWithRequest_completionHandler___block_invoke_2;
    v16[3] = &unk_1E6D51448;
    id v17 = v10;
    int8x16_t v15 = *(int8x16_t *)(a1 + 32);
    id v12 = (id)v15.i64[0];
    int8x16_t v18 = vextq_s8(v15, v15, 8uLL);
    id v19 = v11;
    id v20 = *(id *)(a1 + 48);
    id v13 = v11;
    id v14 = v10;
    dispatch_async(MEMORY[0x1E4F14428], v16);
  }
}

uint64_t __86__HKOrganDonationConnectionManager__genericJSONDataTaskWithRequest_completionHandler___block_invoke_431(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleURLTaskError:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
}

uint64_t __86__HKOrganDonationConnectionManager__genericJSONDataTaskWithRequest_completionHandler___block_invoke_2(uint64_t *a1)
{
  if ((unint64_t)([(id)a1[4] statusCode] - 200) >= 0x64)
  {
    uint64_t v5 = a1[4];
    id v4 = (void *)a1[5];
    uint64_t v6 = a1[6];
    uint64_t v7 = a1[7];
    uint64_t v8 = a1[8];
    return [v4 _handleServerErrorWithResponse:v5 originRequest:v6 payload:v7 completion:v8];
  }
  else
  {
    unint64_t v2 = *(uint64_t (**)(void))(a1[8] + 16);
    return v2();
  }
}

- (id)_jsonBodyPostRequestWithURL:(id)a3 method:(id)a4 postData:(id)a5 bearerToken:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = (void *)MEMORY[0x1E4F28E88];
  id v12 = a4;
  id v13 = [v11 requestWithURL:a3];
  [v13 setHTTPMethod:v12];

  [v13 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  if (v10)
  {
    id v14 = [NSString stringWithFormat:@"Bearer %@", v10];
    [v13 setValue:v14 forHTTPHeaderField:@"Authorization"];
  }
  if (v9) {
    [v13 setHTTPBody:v9];
  }

  return v13;
}

- (id)_getRequestWithURL:(id)a3 bearerToken:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28E88];
  id v6 = a4;
  uint64_t v7 = [v5 requestWithURL:a3];
  [v7 setHTTPMethod:@"GET"];
  uint64_t v8 = [NSString stringWithFormat:@"Bearer %@", v6];

  [v7 setValue:v8 forHTTPHeaderField:@"Authorization"];
  return v7;
}

- (void)_sendQueuedTokenDependentRequests
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v3 = [(NSMapTable *)self->_taskQueue keyEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        id v9 = [NSString stringWithFormat:@"Bearer %@", self->_accessToken];
        [v8 setValue:v9 forHTTPHeaderField:@"Authorization"];

        id v10 = [(NSMapTable *)self->_taskQueue objectForKey:v8];
        uint64_t v11 = [(HKOrganDonationConnectionManager *)self _genericJSONDataTaskWithRequest:v8 completionHandler:v10];
        [v11 resume];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  [(NSMapTable *)self->_taskQueue removeAllObjects];
}

- (void)_flushTokenDependentRequestsWithStatus:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [(NSMapTable *)self->_taskQueue keyEnumerator];
  uint64_t v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        id v10 = [NSString stringWithFormat:@"Bearer %@", self->_accessToken];
        [v9 setValue:v10 forHTTPHeaderField:@"Authorization"];

        uint64_t v11 = [(NSMapTable *)self->_taskQueue objectForKey:v9];
        v11[2](v11, 0, a3);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  [(NSMapTable *)self->_taskQueue removeAllObjects];
}

- (void)_updateAccessTokenAndScheduleInvalidationTimer:(id)a3 expiresIn:(double)a4
{
  self->_accessTokenStatus = 0;
  objc_storeStrong((id *)&self->_accessToken, a3);
  id v7 = a3;
  id obj = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__invalidateAccessToken_ selector:0 userInfo:0 repeats:a4];

  objc_storeWeak((id *)&self->_accessTokenInvalidationTimer, obj);
}

- (void)_invalidateAccessToken:(id)a3
{
  accessToken = self->_accessToken;
  self->_accessToken = 0;

  [(HKOrganDonationConnectionManager *)self _refreshAccessTokenIfNeeded];
}

- (void)_handleURLTaskError:(id)a3 withCompletion:(id)a4
{
  id v7 = (void (**)(id, void, uint64_t))a4;
  if ([a3 code] == -1009) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 4;
  }
  if (v7) {
    v7[2](v7, 0, v6);
  }
  [(HKOrganDonationConnectionManager *)self _transitionToState:v6];
}

- (void)_handleServerErrorWithResponse:(id)a3 originRequest:(id)a4 payload:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = (void (**)(id, id, uint64_t))a6;
  if ((unint64_t)([v10 statusCode] - 400) > 0x63)
  {
    uint64_t v18 = 4;
    uint64_t v17 = 4;
    if (!v13) {
      goto LABEL_11;
    }
LABEL_10:
    v13[2](v13, v12, v18);
    goto LABEL_11;
  }
  [(HKOrganDonationConnectionManager *)self setAccessToken:0];
  long long v14 = [v11 URL];
  long long v15 = [v14 path];
  int v16 = [v15 hasSuffix:@"/v1/oauth/token"];

  if (v16)
  {
    [(HKOrganDonationConnectionManager *)self setRefreshToken:0];
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = 5;
  }
  if ([v10 statusCode] == 404 || objc_msgSend(v10, "statusCode") == 410)
  {
    [(HKOrganDonationConnectionManager *)self setRefreshToken:0];
    uint64_t v18 = 2;
    if (!v13) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v18 = 1;
  if (v13) {
    goto LABEL_10;
  }
LABEL_11:
  [(HKOrganDonationConnectionManager *)self _transitionToState:v17];
  _HKInitializeLogging();
  id v19 = (void *)*MEMORY[0x1E4F29FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
    -[HKOrganDonationConnectionManager _handleServerErrorWithResponse:originRequest:payload:completion:](v19, v10);
  }
}

- (void)setRefreshToken:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_refreshToken, a3);
  uint64_t v5 = (void *)_TokenRefreshDate;
  _TokenRefreshDate = 0;

  if ([v6 length]) {
    [(HKOrganDonationConnectionManager *)self _upsertTokenInKeychain:v6 identifier:@"refresh_token"];
  }
  else {
    [(HKOrganDonationConnectionManager *)self _deleteTokenWithIdentifier:@"refresh_token"];
  }
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (void)_upsertTokenInKeychain:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CFDictionaryRef v8 = [(id)objc_opt_class() _keychainQueryDictionaryForIdentifier:v6];
  id v9 = [v7 dataUsingEncoding:4];

  id v10 = [(id)objc_opt_class() _tokenWithIdentifier:v6 shouldReturnData:0];

  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v11 setObject:v9 forKey:*MEMORY[0x1E4F3BD38]];
    OSStatus v12 = SecItemUpdate(v8, (CFDictionaryRef)v11);

    if (v12) {
      goto LABEL_3;
    }
LABEL_6:
    long long v13 = [(HKOrganDonationConnectionManager *)self delegate];
    [v13 organDonationConnectionManagerDidStoreCredential:self];

    notify_post("HKOrganDonationRegistrationDidUpdate");
    goto LABEL_7;
  }
  [(__CFDictionary *)v8 setObject:v9 forKey:*MEMORY[0x1E4F3BD38]];
  if (!SecItemAdd(v8, 0)) {
    goto LABEL_6;
  }
LABEL_3:
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
    -[HKOrganDonationConnectionManager _upsertTokenInKeychain:identifier:]();
  }
LABEL_7:
}

- (void)_deleteTokenWithIdentifier:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = [(id)objc_opt_class() _keychainQueryDictionaryForIdentifier:v4];
  id v6 = [(id)objc_opt_class() _tokenWithIdentifier:v4 shouldReturnData:0];

  if (v6)
  {
    if (SecItemDelete(v5))
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
        -[HKOrganDonationConnectionManager _deleteTokenWithIdentifier:]();
      }
    }
    else
    {
      id v7 = [(HKOrganDonationConnectionManager *)self delegate];
      [v7 organDonationConnectionManagerDidRemoveCredential:self];

      notify_post("HKOrganDonationRegistrationDidUpdate");
    }
  }
}

+ (void)organDonationSignificantDate:(id)a3
{
  id v4 = (void (**)(id, void, BOOL))a3;
  CFDictionaryRef v5 = (void *)_TokenCreationDate;
  if (_TokenRefreshDate) {
    BOOL v6 = _TokenCreationDate == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v7 = [a1 _keychainQueryDictionaryForIdentifier:@"refresh_token"];
    [v7 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3BC68]];
    CFTypeRef result = 0;
    uint64_t v8 = SecItemCopyMatching((CFDictionaryRef)v7, &result);
    if (v8)
    {
      uint64_t v9 = v8;
      _HKInitializeLogging();
      id v10 = *MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
        +[HKOrganDonationConnectionManager organDonationSignificantDate:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    else
    {
      uint64_t v17 = (void *)result;
      uint64_t v18 = [(id)result objectForKey:*MEMORY[0x1E4F3B790]];
      id v19 = (void *)_TokenRefreshDate;
      _TokenRefreshDate = v18;

      uint64_t v20 = [v17 objectForKey:*MEMORY[0x1E4F3B668]];
      id v21 = (void *)_TokenCreationDate;
      _TokenCreationDate = v20;
    }
    CFDictionaryRef v5 = (void *)_TokenCreationDate;
  }
  uint64_t v22 = objc_msgSend(v5, "compare:");
  id v23 = &_TokenCreationDate;
  if (v22 == -1) {
    id v23 = &_TokenRefreshDate;
  }
  v4[2](v4, *v23, v22 != -1);
}

+ (id)storeDemoModeModifiedDate
{
  unint64_t v2 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  unint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [v2 components:30 fromDate:v3];
  [v4 setHour:9];
  [v4 setMinute:41];
  CFDictionaryRef v5 = [v2 dateFromComponents:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v6 setDay:-1];
  id v7 = [v2 dateByAddingComponents:v6 toDate:v5 options:0];

  return v7;
}

+ (BOOL)shouldShowStoreDemoOrganDonation
{
  int v3 = [MEMORY[0x1E4F2B860] isRunningStoreDemoMode];
  if (v3)
  {
    LOBYTE(v3) = [a1 isOrganDonationRegistrationAvailable];
  }
  return v3;
}

- (id)_registrationJWTWithRegistrant:(id)a3
{
  id v4 = [(HKOrganDonationConnectionManager *)self jwtPayloadWithRegistrant:a3];
  CFDictionaryRef v5 = [(HKOrganDonationConnectionManager *)self _jwtWithPayload:v4 grantType:@"urn:dla:oauth:grant-type:jwt-bearer-registrant-info"];

  return v5;
}

- (id)_refreshBearerTokenJWTWithRefreshToken:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = [(HKOrganDonationConnectionManager *)self payload];
  id v6 = [(HKOrganDonationConnectionManager *)self _jwtWithPayload:v5 grantType:@"urn:dla:oauth:grant-type:jwt-bearer-refresh"];

  if (v6)
  {
    id v7 = (void *)[v6 mutableCopy];
    [v7 setObject:v4 forKey:@"refresh_token"];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_jwtWithPayload:(id)a3 grantType:(id)a4
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _DecodedString((uint64_t)&_ConsumerSecret);
  PrivateSecKeyRefFromP12 = _createPrivateSecKeyRefFromP12(v8);

  if (PrivateSecKeyRefFromP12)
  {
    id v10 = (void *)MEMORY[0x1E4F28D90];
    uint64_t v11 = [(HKOrganDonationConnectionManager *)self jwtHeader];
    id v34 = 0;
    v31 = [v10 dataWithJSONObject:v11 options:0 error:&v34];
    id v12 = v34;

    uint64_t v13 = [v31 base64EncodedStringWithOptions:0];
    long long v27 = [(HKOrganDonationConnectionManager *)self _base64URLEncoding:v13];

    id v33 = v12;
    uint64_t v14 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:0 error:&v33];
    id v30 = v33;

    uint64_t v15 = (void *)[[NSString alloc] initWithData:v14 encoding:4];
    v29 = [v15 stringByReplacingOccurrencesOfString:@"\\/" withString:@"/"];

    id v28 = [v29 dataUsingEncoding:4];

    uint64_t v16 = [v28 base64EncodedStringWithOptions:0];
    uint64_t v17 = [(HKOrganDonationConnectionManager *)self _base64URLEncoding:v16];

    [NSString stringWithFormat:@"%@.%@", v27, v17];
    uint64_t v18 = v32 = v6;
    id v19 = [v18 dataUsingEncoding:4];
    uint64_t v20 = _SignStringWithSHA256RSA(v19, PrivateSecKeyRefFromP12);
    [v20 base64EncodedStringWithOptions:0];
    v22 = id v21 = v7;
    id v23 = [(HKOrganDonationConnectionManager *)self _base64URLEncoding:v22];

    id v7 = v21;
    long long v24 = [NSString stringWithFormat:@"%@.%@", v18, v23];
    CFRelease(PrivateSecKeyRefFromP12);
    v35[0] = @"grant_type";
    v35[1] = @"assertion";
    v36[0] = v21;
    v36[1] = v24;
    long long v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];

    id v6 = v32;
  }
  else
  {
    long long v25 = 0;
  }

  return v25;
}

- (id)_base64URLEncoding:(id)a3
{
  int v3 = (void *)[a3 mutableCopy];
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"=", &stru_1F3B9CF20, 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"+", @"-", 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"/", @"_", 0, 0, objc_msgSend(v3, "length"));
  return v3;
}

- (id)jwtHeader
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"alg";
  v4[1] = @"typ";
  v5[0] = @"RS256";
  v5[1] = @"JWT";
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (id)payload
{
  v10[3] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSince1970];
  uint64_t v4 = (uint64_t)v3;

  v9[0] = @"iss";
  CFDictionaryRef v5 = _DecodedString((uint64_t)&_ConsumerId);
  v10[0] = v5;
  v10[1] = @"https://donatelifeamerica.com/api/";
  v9[1] = @"aud";
  v9[2] = @"iat";
  id v6 = [NSNumber numberWithInteger:v4];
  v10[2] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (id)jwtPayloadWithRegistrant:(id)a3
{
  void v13[4] = *MEMORY[0x1E4F143B8];
  double v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  CFDictionaryRef v5 = [v3 date];
  [v5 timeIntervalSince1970];
  uint64_t v7 = (uint64_t)v6;

  v12[0] = @"iss";
  uint64_t v8 = _DecodedString((uint64_t)&_ConsumerId);
  v13[0] = v8;
  v13[1] = @"https://donatelifeamerica.com/api/";
  v12[1] = @"aud";
  v12[2] = @"iat";
  uint64_t v9 = [NSNumber numberWithInteger:v7];
  v12[3] = @"registrant";
  v13[2] = v9;
  v13[3] = v4;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];

  return v10;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKAnalyticsEventSubmissionManager)analyticsEventSubmissionManager
{
  return self->_analyticsEventSubmissionManager;
}

- (void)setAnalyticsEventSubmissionManager:(id)a3
{
}

- (HKOrganDonationConnectionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKOrganDonationConnectionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURLSession)defaultSession
{
  return self->_defaultSession;
}

- (void)setDefaultSession:(id)a3
{
}

- (NSString)accessToken
{
  return self->_accessToken;
}

- (void)setAccessToken:(id)a3
{
}

- (NSTimer)accessTokenInvalidationTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessTokenInvalidationTimer);
  return (NSTimer *)WeakRetained;
}

- (void)setAccessTokenInvalidationTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessTokenInvalidationTimer);
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_defaultSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_analyticsEventSubmissionManager, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
}

- (void)updateRegistrantWithParams:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Error serializing json object for updating registrant: %@", (uint8_t *)&v2, 0xCu);
}

void __75__HKOrganDonationConnectionManager_refreshOrganDonationFeatureAvailability__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_6_0() description];
  OUTLINED_FUNCTION_0_1(&dword_1E0B26000, v4, v5, "Error downloading the od availability manifest from cdn: %{public}@, response: %{public}@", v6, v7, v8, v9, 2u);
}

void __75__HKOrganDonationConnectionManager_refreshOrganDonationFeatureAvailability__block_invoke_cold_2(void *a1, void *a2)
{
  id v4 = a1;
  [(id)OUTLINED_FUNCTION_6_0() URL];
  objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [(id)OUTLINED_FUNCTION_5_0() description];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1E0B26000, v6, v7, "Error deserializing json data for response at URL: %{public}@, error: %{public}@", v8, v9, v10, v11, v12);
}

void __86__HKOrganDonationConnectionManager__genericJSONDataTaskWithRequest_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [(id)OUTLINED_FUNCTION_6_0() URL];
  objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [(id)OUTLINED_FUNCTION_5_0() description];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1E0B26000, v6, v7, "Error finishing data task with URL: %{public}@, error: %{public}@", v8, v9, v10, v11, v12);
}

- (void)_handleServerErrorWithResponse:(void *)a1 originRequest:(void *)a2 payload:completion:.cold.1(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  uint64_t v5 = [(id)OUTLINED_FUNCTION_5_0() URL];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2048;
  uint64_t v9 = [a2 statusCode];
  _os_log_error_impl(&dword_1E0B26000, v2, OS_LOG_TYPE_ERROR, "Http error with URL: %{public}@, status code: %li", (uint8_t *)&v6, 0x16u);
}

- (void)_upsertTokenInKeychain:identifier:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_0(&dword_1E0B26000, v0, v1, "Error storing token from keychain with identifier: %@ (%i)");
}

- (void)_deleteTokenWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_0(&dword_1E0B26000, v0, v1, "Error deleting token from keychain with identifier: %@ (%i)");
}

+ (void)_tokenWithIdentifier:shouldReturnData:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_0(&dword_1E0B26000, v0, v1, "Error loading token from keychain with identifier: %@ (%i)");
}

+ (void)organDonationSignificantDate:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end