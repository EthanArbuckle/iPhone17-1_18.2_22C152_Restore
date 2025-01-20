@interface AAAppleIDSettingsRequest
+ (Class)responseClass;
- (AAAppleIDSettingsRequest)initWithGrandSlamAccount:(id)a3 accountStore:(id)a4;
- (ACAccount)grandSlamAccount;
- (BOOL)forceGSToken;
- (id)urlRequest;
- (void)setForceGSToken:(BOOL)a3;
@end

@implementation AAAppleIDSettingsRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AAAppleIDSettingsRequest)initWithGrandSlamAccount:(id)a3 accountStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAAppleIDSettingsRequest;
  v9 = [(AAAppleIDSettingsRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_grandSlamAccount, a3);
    objc_storeStrong((id *)&v10->_store, a4);
    v10->_forceGSToken = 1;
  }

  return v10;
}

- (id)urlRequest
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)AAAppleIDSettingsRequest;
  v3 = [(AARequest *)&v27 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"GET"];
  grandSlamAccount = self->_grandSlamAccount;
  if (!grandSlamAccount)
  {
    if ([(AAAppleIDSettingsRequest *)self forceGSToken])
    {
      v6 = _AALogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "GrandSlam signing will fail because no GS account was provided.", buf, 2u);
      }
      goto LABEL_12;
    }
    grandSlamAccount = self->_grandSlamAccount;
  }
  id v7 = [(ACAccount *)grandSlamAccount aida_dsid];
  objc_msgSend(v4, "aa_addDeviceProvisioningInfoHeadersWithDSID:", v7);

  v6 = [(ACAccountStore *)self->_store credentialForAccount:self->_grandSlamAccount serviceID:@"com.apple.gs.appleid.auth"];
  *(void *)buf = 0;
  v22 = buf;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  id v26 = [v6 token];
  if (!*((void *)v22 + 5) && [(AAAppleIDSettingsRequest *)self forceGSToken])
  {
    id v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "Could not get GS auth on first try. Will need to prompt for password", v20, 2u);
    }

    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    store = self->_store;
    v11 = self->_grandSlamAccount;
    v28[0] = @"com.apple.gs.appleid.auth";
    objc_super v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __38__AAAppleIDSettingsRequest_urlRequest__block_invoke;
    v17[3] = &unk_1E5A48A58;
    v17[4] = self;
    v19 = buf;
    v13 = v9;
    v18 = v13;
    [(ACAccountStore *)store renewCredentialsForAccount:v11 services:v12 completion:v17];

    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  }
  v14 = [(ACAccount *)self->_grandSlamAccount aida_alternateDSID];
  objc_msgSend(v4, "aa_addGrandslamAuthorizationHeaderWithAltDSID:grandslamToken:", v14, *((void *)v22 + 5));

  v15 = +[AADeviceInfo udid];
  [v4 addValue:v15 forHTTPHeaderField:@"X-AppleID-Device-Udid"];

  _Block_object_dispose(buf, 8);
LABEL_12:

  return v4;
}

void __38__AAAppleIDSettingsRequest_urlRequest__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218242;
      uint64_t v11 = a2;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "No way to sign request with GS token because renewal of GS credential failed: %ld, %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    v6 = [*(id *)(*(void *)(a1 + 32) + 64) credentialForAccount:*(void *)(*(void *)(a1 + 32) + 80) serviceID:@"com.apple.gs.appleid.auth"];
    uint64_t v7 = [v6 token];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    dispatch_semaphore_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (ACAccount)grandSlamAccount
{
  return self->_grandSlamAccount;
}

- (BOOL)forceGSToken
{
  return self->_forceGSToken;
}

- (void)setForceGSToken:(BOOL)a3
{
  self->_forceGSToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grandSlamAccount, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

@end