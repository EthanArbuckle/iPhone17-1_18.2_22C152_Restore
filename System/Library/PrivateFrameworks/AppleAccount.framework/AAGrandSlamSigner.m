@interface AAGrandSlamSigner
- (AAGrandSlamSigner)initWithAccountStore:(id)a3 grandSlamAccount:(id)a4 appTokenID:(id)a5;
- (AAGrandSlamSigner)initWithAppleAccount:(id)a3 grandSlamAccount:(id)a4 accountStore:(id)a5 appTokenID:(id)a6;
- (ACAccount)grandSlamAccount;
- (ACAccountStore)accountStore;
- (BOOL)signURLRequest:(id)a3;
- (BOOL)signURLRequest:(id)a3 isUserInitiated:(BOOL)a4;
- (BOOL)useAltDSID;
- (NSString)headerFieldKey;
- (void)setHeaderFieldKey:(id)a3;
- (void)setUseAltDSID:(BOOL)a3;
@end

@implementation AAGrandSlamSigner

- (AAGrandSlamSigner)initWithAccountStore:(id)a3 grandSlamAccount:(id)a4 appTokenID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AAGrandSlamSigner;
  v12 = [(AAGrandSlamSigner *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountStore, a3);
    objc_storeStrong((id *)&v13->_grandSlamAccount, a4);
    uint64_t v14 = [v11 copy];
    appTokenID = v13->_appTokenID;
    v13->_appTokenID = (NSString *)v14;

    headerFieldKey = v13->_headerFieldKey;
    v13->_headerFieldKey = (NSString *)@"X-Apple-GS-Token";
  }
  return v13;
}

- (AAGrandSlamSigner)initWithAppleAccount:(id)a3 grandSlamAccount:(id)a4 accountStore:(id)a5 appTokenID:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a4;
  v12 = [v11 accountStore];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v9 accountStore];
  }
  v15 = v14;

  v16 = [(AAGrandSlamSigner *)self initWithAccountStore:v15 grandSlamAccount:v11 appTokenID:v10];
  return v16;
}

- (BOOL)signURLRequest:(id)a3
{
  return [(AAGrandSlamSigner *)self signURLRequest:a3 isUserInitiated:0];
}

- (BOOL)signURLRequest:(id)a3 isUserInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  v38[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  grandSlamAccount = self->_grandSlamAccount;
  if (grandSlamAccount)
  {
    v8 = [(ACAccount *)grandSlamAccount aida_alternateDSID];

    if (!v8)
    {
      BOOL v24 = 0;
      goto LABEL_16;
    }
    id v9 = [(ACAccountStore *)self->_accountStore credentialForAccount:self->_grandSlamAccount serviceID:self->_appTokenID];
    *(void *)v30 = 0;
    v31 = v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__6;
    v34 = __Block_byref_object_dispose__6;
    id v35 = [v9 token];
    if (*((void *)v31 + 5)) {
      goto LABEL_7;
    }
    id v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "Could not get GS auth on first try. Will need to prompt for password", buf, 2u);
    }

    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    v37[0] = *MEMORY[0x1E4F17A40];
    v12 = [NSNumber numberWithBool:v4];
    v38[0] = v12;
    v37[1] = *MEMORY[0x1E4F17A20];
    appTokenID = self->_appTokenID;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&appTokenID count:1];
    v38[1] = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];

    accountStore = self->_accountStore;
    v16 = self->_grandSlamAccount;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __52__AAGrandSlamSigner_signURLRequest_isUserInitiated___block_invoke;
    v26[3] = &unk_1E5A48A58;
    v26[4] = self;
    v28 = v30;
    v17 = v11;
    v27 = v17;
    [(ACAccountStore *)accountStore renewCredentialsForAccount:v16 options:v14 completion:v26];
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);

    if (*((void *)v31 + 5))
    {
LABEL_7:
      objc_super v18 = [(ACAccount *)self->_grandSlamAccount aida_dsid];
      if (self->_useAltDSID)
      {
        uint64_t v19 = [(ACAccount *)self->_grandSlamAccount aida_alternateDSID];

        objc_super v18 = v19;
      }
      v20 = [NSString stringWithFormat:@"%@:%@", v18, *((void *)v31 + 5)];
      v21 = [v20 dataUsingEncoding:4];
      v22 = [v21 base64EncodedStringWithOptions:0];

      [v6 setValue:v22 forHTTPHeaderField:self->_headerFieldKey];
      v23 = [(ACAccount *)self->_grandSlamAccount aida_dsid];
      objc_msgSend(v6, "aa_addDeviceProvisioningInfoHeadersWithDSID:", v23);

      BOOL v24 = 1;
    }
    else
    {
      objc_super v18 = _AALogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A11D8000, v18, OS_LOG_TYPE_DEFAULT, "Error: still no GS token even after calling renewCredentialsForAccount.", buf, 2u);
      }
      BOOL v24 = 0;
    }

    _Block_object_dispose(v30, 8);
  }
  else
  {
    id v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "GrandSlam signing failed because no GS account was provided.", v30, 2u);
    }
    BOOL v24 = 0;
  }

LABEL_16:
  return v24;
}

void __52__AAGrandSlamSigner_signURLRequest_isUserInitiated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = _AALogSystem();
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
    id v6 = [*(id *)(*(void *)(a1 + 32) + 8) credentialForAccount:*(void *)(*(void *)(a1 + 32) + 16) serviceID:*(void *)(*(void *)(a1 + 32) + 24)];
    uint64_t v7 = [v6 token];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (ACAccount)grandSlamAccount
{
  return self->_grandSlamAccount;
}

- (BOOL)useAltDSID
{
  return self->_useAltDSID;
}

- (void)setUseAltDSID:(BOOL)a3
{
  self->_useAltDSID = a3;
}

- (NSString)headerFieldKey
{
  return self->_headerFieldKey;
}

- (void)setHeaderFieldKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerFieldKey, 0);
  objc_storeStrong((id *)&self->_appTokenID, 0);
  objc_storeStrong((id *)&self->_grandSlamAccount, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end