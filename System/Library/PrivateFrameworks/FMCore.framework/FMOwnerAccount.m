@interface FMOwnerAccount
+ (id)authTokenForSubAccount:(id)a3 type:(int64_t)a4 error:(id *)a5;
+ (id)hostNameForAccount:(id)a3 type:(int64_t)a4;
+ (id)ownerAccount;
+ (id)ownerAccountWithType:(int64_t)a3;
+ (id)personIdForAccount:(id)a3 error:(id *)a4;
+ (id)primaryAccountWithStore:(id)a3 error:(id *)a4;
+ (id)sharedInstance;
+ (id)subAccountForAccount:(id)a3 type:(int64_t)a4;
+ (void)renewCredentialsWithBundleId:(id)a3 force:(BOOL)a4 reason:(id)a5 completion:(id)a6;
- (ACAccount)account;
- (BOOL)legacyBehavior;
- (FMOwnerAccount)init;
- (FMOwnerAccount)initWithAuthToken:(id)a3 personId:(id)a4;
- (NSString)authToken;
- (NSString)firstName;
- (NSString)hostName;
- (NSString)lastName;
- (NSString)personId;
- (NSString)username;
- (id)description;
- (id)hostNameOfType:(int64_t)a3;
- (id)tokenOfType:(int64_t)a3;
- (void)accountChanged;
- (void)dealloc;
- (void)initializeAccount;
- (void)setAccount:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setHostName:(id)a3;
- (void)setLastName:(id)a3;
- (void)setLegacyBehavior:(BOOL)a3;
- (void)setPersonId:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation FMOwnerAccount

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance___instance;
  return v2;
}

uint64_t __32__FMOwnerAccount_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(FMOwnerAccount);
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

  v2 = (void *)sharedInstance___instance;
  return [v2 setLegacyBehavior:1];
}

- (FMOwnerAccount)init
{
  v7.receiver = self;
  v7.super_class = (Class)FMOwnerAccount;
  v2 = [(FMOwnerAccount *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(FMOwnerAccount *)v2 initializeAccount];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)accountChanged, (CFStringRef)*MEMORY[0x1E4F178D8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v3 selector:sel_accountChanged name:@"accountChangedNotification" object:0];
  }
  return v3;
}

- (void)initializeAccount
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0EC4000, log, OS_LOG_TYPE_ERROR, "FMOwnerAccount: Cannot retreive iCloud account", v1, 2u);
}

- (NSString)username
{
  if ([(FMOwnerAccount *)self legacyBehavior])
  {
    v3 = [(FMOwnerAccount *)self account];
    v4 = [v3 username];
  }
  else
  {
    v4 = self->_username;
  }
  return v4;
}

- (BOOL)legacyBehavior
{
  return self->_legacyBehavior;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setLegacyBehavior:(BOOL)a3
{
  self->_legacyBehavior = a3;
}

- (FMOwnerAccount)initWithAuthToken:(id)a3 personId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMOwnerAccount;
  v9 = [(FMOwnerAccount *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authToken, a3);
    objc_storeStrong((id *)&v10->_personId, a4);
  }

  return v10;
}

- (void)dealloc
{
  if ([(FMOwnerAccount *)self legacyBehavior])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F178D8], 0);
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self];
  }
  v5.receiver = self;
  v5.super_class = (Class)FMOwnerAccount;
  [(FMOwnerAccount *)&v5 dealloc];
}

- (void)accountChanged
{
  v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_1D0EC4000, v3, OS_LOG_TYPE_DEFAULT, "FMOwnerAccount: Account changed", v5, 2u);
  }

  account = self->_account;
  self->_account = 0;

  [(FMOwnerAccount *)self initializeAccount];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(FMOwnerAccount *)self username];
  v6 = [(FMOwnerAccount *)self personId];
  id v7 = [v3 stringWithFormat:@"<%@: %p %@[%@]>", v4, self, v5, v6];

  return v7;
}

- (NSString)personId
{
  if ([(FMOwnerAccount *)self legacyBehavior])
  {
    v3 = [(FMOwnerAccount *)self account];
    objc_msgSend(v3, "aa_personID");
    uint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = self->_personId;
  }
  return v4;
}

- (NSString)firstName
{
  if ([(FMOwnerAccount *)self legacyBehavior])
  {
    v3 = [(FMOwnerAccount *)self account];
    objc_msgSend(v3, "aa_firstName");
    uint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = self->_firstName;
  }
  return v4;
}

- (NSString)lastName
{
  if ([(FMOwnerAccount *)self legacyBehavior])
  {
    v3 = [(FMOwnerAccount *)self account];
    objc_msgSend(v3, "aa_lastName");
    uint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = self->_lastName;
  }
  return v4;
}

- (id)tokenOfType:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  v6 = objc_msgSend(v5, "aa_primaryAppleAccount");
  id v7 = v6;
  if (a3)
  {
    id v8 = 0;
    v9 = 0;
    id v10 = 0;
    id v11 = 0;
  }
  else
  {
    if ([v6 isProvisionedForDataclass:*MEMORY[0x1E4F17B10]])
    {
      v9 = objc_msgSend(v7, "aa_fmfAccount");
    }
    else
    {
      v9 = 0;
    }
    id v18 = 0;
    id v8 = [v9 credentialWithError:&v18];
    id v11 = v18;
    uint64_t v12 = [v8 credentialItemForKey:*MEMORY[0x1E4F178F8]];
    id v10 = (id)v12;
    if (!v11 && v12)
    {
      [(FMOwnerAccount *)self setAccount:v7];
      id v10 = v10;
      id v11 = 0;
      v13 = v10;
      goto LABEL_15;
    }
    v14 = LogCategory_Unspecified();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [v9 username];
      *(_DWORD *)buf = 138412546;
      int64_t v20 = (int64_t)v15;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl(&dword_1D0EC4000, v14, OS_LOG_TYPE_DEFAULT, "Count not retrieve app token for FMF account [%@]. Error: %@", buf, 0x16u);
    }
  }
  v16 = LogCategory_Unspecified();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v20 = a3;
    _os_log_impl(&dword_1D0EC4000, v16, OS_LOG_TYPE_INFO, "Unknown FMAuthTokenType: %ld", buf, 0xCu);
  }

  v13 = 0;
LABEL_15:

  return v13;
}

- (id)hostNameOfType:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(FMOwnerAccount *)self account];
  id v5 = [v4 dataclassProperties];

  if (a3)
  {
    v6 = LogCategory_Unspecified();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      int64_t v11 = a3;
      _os_log_impl(&dword_1D0EC4000, v6, OS_LOG_TYPE_DEFAULT, "Unknown FMAuthTokenType: %ld", (uint8_t *)&v10, 0xCu);
    }

    id v7 = 0;
  }
  else
  {
    id v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F17B10]];
    id v7 = [v8 objectForKeyedSubscript:@"appHostname"];
  }
  return v7;
}

+ (id)authTokenForSubAccount:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  id v7 = [a3 credentialWithError:&v19];
  id v8 = v19;
  if (a4 == 1)
  {
    int v10 = (id *)MEMORY[0x1E4F17910];
    goto LABEL_5;
  }
  id v9 = 0;
  if (!a4)
  {
    int v10 = (id *)MEMORY[0x1E4F178F8];
LABEL_5:
    id v9 = *v10;
  }
  int64_t v11 = [v7 credentialItemForKey:v9];
  uint64_t v12 = v11;
  if (v8 || !v11)
  {
    v14 = LogCategory_Unspecified();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v8;
      _os_log_impl(&dword_1D0EC4000, v14, OS_LOG_TYPE_INFO, "Count not retrieve token for account. Error: %@", buf, 0xCu);
    }

    v15 = objc_opt_new();
    objc_msgSend(v15, "fm_safeSetObject:forKey:", v8, *MEMORY[0x1E4F28A50]);
    v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.fmcore.FMOwnerAccountError" code:2 userInfo:v15];
    v17 = v16;
    if (a5) {
      *a5 = v16;
    }

    id v13 = 0;
  }
  else
  {
    id v13 = v11;
  }

  return v13;
}

+ (id)hostNameForAccount:(id)a3 type:(int64_t)a4
{
  id v5 = [a3 dataclassProperties];
  v6 = v5;
  if (a4 == 1)
  {
    uint64_t v9 = *MEMORY[0x1E4F17AB0];
    int v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F17AB0]];
    id v7 = [v10 objectForKeyedSubscript:@"appHostname"];

    int64_t v11 = [v6 objectForKeyedSubscript:v9];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"hostname"];

    if (v7) {
      id v13 = v7;
    }
    else {
      id v13 = v12;
    }
    id v8 = v13;

    goto LABEL_8;
  }
  if (!a4)
  {
    id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F17B10]];
    id v8 = [v7 objectForKeyedSubscript:@"appHostname"];
LABEL_8:

    goto LABEL_10;
  }
  id v8 = 0;
LABEL_10:

  return v8;
}

+ (id)subAccountForAccount:(id)a3 type:(int64_t)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4 == 1)
  {
    uint64_t v7 = objc_msgSend(v5, "aa_fmipAccount");
    goto LABEL_5;
  }
  if (!a4)
  {
    uint64_t v7 = objc_msgSend(v5, "aa_fmfAccount");
LABEL_5:
    id v8 = (void *)v7;
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

+ (id)primaryAccountWithStore:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  }
  id v8 = v7;
  uint64_t v9 = objc_msgSend(v7, "aa_primaryAppleAccount");
  if (!v9)
  {
    int v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.fmcore.FMOwnerAccountError" code:1 userInfo:0];
    int64_t v11 = v10;
    if (a4) {
      *a4 = v10;
    }
  }
  return v9;
}

+ (id)personIdForAccount:(id)a3 error:(id *)a4
{
  id v5 = objc_msgSend(a3, "aa_personID");
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.fmcore.FMOwnerAccountError" code:3 userInfo:0];
    id v7 = v6;
    if (a4) {
      *a4 = v6;
    }
  }
  return v5;
}

+ (id)ownerAccount
{
  v2 = objc_opt_new();
  v3 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__FMOwnerAccount_ownerAccount__block_invoke;
  block[3] = &unk_1E689E780;
  id v4 = v2;
  id v7 = v4;
  dispatch_async(v3, block);

  return v4;
}

void __30__FMOwnerAccount_ownerAccount__block_invoke(uint64_t a1)
{
  id v5 = 0;
  v2 = +[FMOwnerAccount primaryAccountWithStore:0 error:&v5];
  id v3 = v5;
  if (v3)
  {
    [*(id *)(a1 + 32) finishWithError:v3];
  }
  else
  {
    id v4 = [[FMInternalOwnerAccount alloc] initWithAccount:v2];
    [*(id *)(a1 + 32) finishWithResult:v4];
  }
}

+ (id)ownerAccountWithType:(int64_t)a3
{
  id v5 = objc_opt_new();
  v6 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__FMOwnerAccount_ownerAccountWithType___block_invoke;
  block[3] = &unk_1E689EA68;
  id v7 = v5;
  id v10 = v7;
  id v11 = a1;
  int64_t v12 = a3;
  dispatch_async(v6, block);

  return v7;
}

void __39__FMOwnerAccount_ownerAccountWithType___block_invoke(uint64_t a1)
{
  id v18 = 0;
  v2 = +[FMOwnerAccount primaryAccountWithStore:0 error:&v18];
  id v3 = v18;
  if (v3)
  {
    [*(id *)(a1 + 32) finishWithError:v3];
  }
  else
  {
    id v17 = 0;
    id v4 = +[FMOwnerAccount personIdForAccount:v2 error:&v17];
    id v5 = v17;
    if (v5)
    {
      [*(id *)(a1 + 32) finishWithError:v5];
    }
    else
    {
      v6 = [*(id *)(a1 + 40) subAccountForAccount:v2 type:*(void *)(a1 + 48)];
      uint64_t v7 = *(void *)(a1 + 48);
      id v16 = 0;
      id v8 = +[FMOwnerAccount authTokenForSubAccount:v6 type:v7 error:&v16];
      id v9 = v16;
      if (v9)
      {
        [*(id *)(a1 + 32) finishWithError:v9];
      }
      else
      {
        id v10 = [*(id *)(a1 + 40) hostNameForAccount:v2 type:*(void *)(a1 + 48)];
        v15 = v8;
        id v11 = [[FMOwnerAccount alloc] initWithAuthToken:v8 personId:v4];
        [(FMOwnerAccount *)v11 setHostName:v10];
        int64_t v12 = objc_msgSend(v2, "aa_firstName");
        [(FMOwnerAccount *)v11 setFirstName:v12];

        id v13 = objc_msgSend(v2, "aa_lastName");
        [(FMOwnerAccount *)v11 setLastName:v13];

        v14 = [v2 username];
        [(FMOwnerAccount *)v11 setUsername:v14];

        [*(id *)(a1 + 32) finishWithResult:v11];
        id v8 = v15;
      }
    }
  }
}

+ (void)renewCredentialsWithBundleId:(id)a3 force:(BOOL)a4 reason:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, id))a6;
  int64_t v12 = LogCategory_Unspecified();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0EC4000, v12, OS_LOG_TYPE_DEFAULT, "FMOwnerAccount renewCredentialsWithBundleId:force:reason:completion:", buf, 2u);
  }

  id v13 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  id v26 = 0;
  v14 = +[FMOwnerAccount primaryAccountWithStore:v13 error:&v26];
  id v15 = v26;
  if (v15)
  {
    id v16 = LogCategory_Unspecified();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[FMOwnerAccount renewCredentialsWithBundleId:force:reason:completion:]((uint64_t)v15, v16);
    }

    if (v11) {
      v11[2](v11, v15);
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F1CA60] dictionary];
    id v18 = v9;
    uint64_t v19 = *MEMORY[0x1E4F17A40];
    int64_t v20 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
    uint64_t v21 = v19;
    id v9 = v18;
    objc_msgSend(v17, "fm_safelyMapKey:toObject:", v21, v20);

    objc_msgSend(v17, "fm_safelyMapKey:toObject:", *MEMORY[0x1E4F17A10], v18);
    uint64_t v22 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
    objc_msgSend(v17, "fm_safelyMapKey:toObject:", @"AARenewShouldForceInteraction", v22);

    objc_msgSend(v17, "fm_safelyMapKey:toObject:", *MEMORY[0x1E4F17A18], v10);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __71__FMOwnerAccount_renewCredentialsWithBundleId_force_reason_completion___block_invoke;
    v23[3] = &unk_1E689EA90;
    id v24 = v14;
    v25 = v11;
    [v13 renewCredentialsForAccount:v24 options:v17 completion:v23];
  }
}

void __71__FMOwnerAccount_renewCredentialsWithBundleId_force_reason_completion___block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2 > 2) {
    v6 = 0;
  }
  else {
    v6 = off_1E689EAB0[a2];
  }
  uint64_t v7 = LogCategory_Unspecified();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = objc_msgSend(*(id *)(a1 + 32), "aa_personID");
    int v13 = 138412546;
    v14 = v8;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1D0EC4000, v7, OS_LOG_TYPE_DEFAULT, "renewCredentials of account %@ completed with status %@", (uint8_t *)&v13, 0x16u);
  }
  if (a2 || v5)
  {
    id v10 = LogCategory_Unspecified();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __71__FMOwnerAccount_renewCredentialsWithBundleId_force_reason_completion___block_invoke_cold_1((uint64_t)v5, v10);
    }

    id v11 = objc_opt_new();
    objc_msgSend(v11, "fm_safeSetObject:forKey:", v5, *MEMORY[0x1E4F28A50]);
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.fmcore.FMOwnerAccountError" code:4 userInfo:v11];
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v9);
  }
}

- (void)setPersonId:(id)a3
{
}

- (void)setUsername:(id)a3
{
}

- (void)setFirstName:(id)a3
{
}

- (void)setLastName:(id)a3
{
}

- (NSString)authToken
{
  return self->_authToken;
}

- (NSString)hostName
{
  return self->_hostName;
}

- (void)setHostName:(id)a3
{
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_personId, 0);
}

+ (void)renewCredentialsWithBundleId:(uint64_t)a1 force:(NSObject *)a2 reason:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0EC4000, a2, OS_LOG_TYPE_ERROR, "FMOwnerAccount primaryAccountError %@", (uint8_t *)&v2, 0xCu);
}

void __71__FMOwnerAccount_renewCredentialsWithBundleId_force_reason_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0EC4000, a2, OS_LOG_TYPE_ERROR, "renewCredentials failed %@", (uint8_t *)&v2, 0xCu);
}

@end