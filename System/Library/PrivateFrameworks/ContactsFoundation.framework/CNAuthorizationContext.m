@interface CNAuthorizationContext
+ (BOOL)shouldIgnoreAssumedIdentity:(id)a3;
+ (BOOL)shouldIgnoreAssumedIdentityForBundleIdentifier:(id)a3;
+ (CNAuthorizationContext)sharedInstance;
+ (id)os_log;
- (BOOL)cachedAddressingGrammarAccessGranted;
- (BOOL)cachedNotesAccessGranted;
- (BOOL)checkClientIsFirstOrSecondParty;
- (BOOL)checkTCCEntitlementNamesAllowContacts:(id)a3;
- (BOOL)doesClientHaveEntitlement:(id)a3;
- (BOOL)isAccessDenied;
- (BOOL)isAccessGranted;
- (BOOL)isAccessGrantedRequestingAccessIfNeeded;
- (BOOL)isAccessRestricted;
- (BOOL)isAccessUnknown;
- (BOOL)isAddressingGrammarAccessGrantedImpl;
- (BOOL)isClientFirstOrSecondParty;
- (BOOL)isClientFirstOrSecondPartyImpl;
- (BOOL)isClientTCCAllowed;
- (BOOL)isClientTCCAllowedImpl;
- (BOOL)isClientTCCCoupledProcess;
- (BOOL)isClientTCCKilledOnAuthorizationChange;
- (BOOL)isClientTCCRegionalAllowed;
- (BOOL)isClientTCCRegionalAllowedImpl;
- (BOOL)isClientTCCUncoupledProcess;
- (BOOL)isFirstPartyAddressingGrammarEntitled;
- (BOOL)isFirstPartyNotesEntitled;
- (BOOL)isFullAccessGranted;
- (BOOL)isGreenTeaDevice;
- (BOOL)isLimitedAccessGranted;
- (BOOL)isNotesAccessGrantedImpl;
- (BOOL)isThirdPartyNotesEntitled;
- (BOOL)isUnitTesting;
- (BOOL)requestAccessWithError:(id *)a3;
- (BOOL)shouldAlwaysQueryAuthorizationStatus;
- (BOOL)shouldAlwaysQueryAuthorizationStatusImpl;
- (CNAuditToken)cnAuditToken;
- (CNAuthorizationContext)init;
- (CNAuthorizationContext)initWithAuditToken:(id)a3 assumedIdentity:(id)a4;
- (CNAuthorizationContext)initWithAuditToken:(id)a3 assumedIdentity:(id)a4 tccServices:(id)a5;
- (CNTCC)tccServices;
- (CNUnfairLock)addressingGrammarAccessStatusLock;
- (CNUnfairLock)authorizationStatusLock;
- (CNUnfairLock)notesAccessStatusLock;
- (NSNumber)authorizationStatusCachedValue;
- (NSNumber)isAddressingGrammarAccessGrantedCachedValue;
- (NSNumber)isClientFirstOrSecondPartyCachedValue;
- (NSNumber)isClientTCCAllowedCachedValue;
- (NSNumber)isClientTCCRegionalAllowedCachedValue;
- (NSNumber)isNotesAccessGrantedCachedValue;
- (NSNumber)shouldAlwaysQueryAuthorizationStatusCachedValue;
- (NSString)clientBundleIdentifier;
- (NSString)clientBundleIdentifierCachedValue;
- (OS_tcc_identity)assumedIdentity;
- (id)clientBundleIdentifierImpl;
- (id)errorForStatus:(int64_t)a3;
- (id)requestAuthorizationFuture:(int64_t)a3;
- (int64_t)cachedAuthorizationStatus;
- (int64_t)resolveRequestAuthorizationFuture:(id)a3;
- (void)checkClientIsFirstOrSecondParty;
- (void)isClientTCCKilledOnAuthorizationChange;
- (void)isThirdPartyNotesEntitled;
- (void)requestAuthorization:(int64_t)a3 completionHandler:(id)a4;
- (void)resetCachedStatus;
- (void)saveAuthorizationRecord:(id)a3 dontKillApp:(BOOL)a4;
- (void)setAddressingGrammarAccessStatusLock:(id)a3;
- (void)setAssumedIdentity:(id)a3;
- (void)setAuthorizationStatus:(int64_t)a3 forBundleIdentifier:(id)a4 noKillApp:(BOOL)a5;
- (void)setAuthorizationStatusCachedValue:(id)a3;
- (void)setAuthorizationStatusLock:(id)a3;
- (void)setClientBundleIdentifierCachedValue:(id)a3;
- (void)setCnAuditToken:(id)a3;
- (void)setIsAddressingGrammarAccessGrantedCachedValue:(id)a3;
- (void)setIsClientFirstOrSecondPartyCachedValue:(id)a3;
- (void)setIsClientTCCAllowedCachedValue:(id)a3;
- (void)setIsClientTCCRegionalAllowedCachedValue:(id)a3;
- (void)setIsNotesAccessGrantedCachedValue:(id)a3;
- (void)setNotesAccessStatusLock:(id)a3;
- (void)setShouldAlwaysQueryAuthorizationStatusCachedValue:(id)a3;
- (void)setTccServices:(id)a3;
- (void)simulateStatus:(int64_t)a3;
- (void)stopSimulation;
@end

@implementation CNAuthorizationContext

id __51__CNAuthorizationContext_cachedAuthorizationStatus__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) integerValue];
  if (([*(id *)(a1 + 32) shouldAlwaysQueryAuthorizationStatus] & 1) != 0 || !v2)
  {
    v4 = [*(id *)(a1 + 32) tccServices];
    v5 = [*(id *)(a1 + 32) cnAuditToken];
    v6 = [*(id *)(a1 + 32) assumedIdentity];
    uint64_t v7 = [v4 checkAuthorizationStatusOfAuditToken:v5 assumedIdentity:v6];

    v3 = [NSNumber numberWithInteger:v7];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), v3);
  }
  else
  {
    v3 = [NSNumber numberWithInteger:v2];
  }

  return v3;
}

- (BOOL)shouldAlwaysQueryAuthorizationStatus
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__CNAuthorizationContext_shouldAlwaysQueryAuthorizationStatus__block_invoke;
  v5[3] = &unk_1E569F360;
  v5[4] = self;
  uint64_t v2 = cn_objectResultWithObjectLock(self, v5);
  char v3 = [v2 BOOLValue];

  return v3;
}

id __62__CNAuthorizationContext_shouldAlwaysQueryAuthorizationStatus__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  char v3 = (void *)v2[5];
  if (!v3)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "shouldAlwaysQueryAuthorizationStatusImpl"));
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    char v3 = *(void **)(*(void *)(a1 + 32) + 40);
  }

  return v3;
}

- (int64_t)cachedAuthorizationStatus
{
  authorizationStatusLock = self->_authorizationStatusLock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__CNAuthorizationContext_cachedAuthorizationStatus__block_invoke;
  v6[3] = &unk_1E56A0688;
  v6[4] = self;
  char v3 = CNResultWithLock(authorizationStatusLock, v6);
  int64_t v4 = [v3 integerValue];

  return v4;
}

id __62__CNAuthorizationContext_cachedAddressingGrammarAccessGranted__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  if (([*(id *)(a1 + 32) shouldAlwaysQueryAuthorizationStatus] & 1) != 0 || !v2)
  {
    char v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isAddressingGrammarAccessGrantedImpl"));

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), v3);
    id v2 = v3;
  }
  id v4 = v2;

  return v4;
}

id __50__CNAuthorizationContext_cachedNotesAccessGranted__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  if (([*(id *)(a1 + 32) shouldAlwaysQueryAuthorizationStatus] & 1) != 0 || !v2)
  {
    char v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isNotesAccessGrantedImpl"));

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), v3);
    id v2 = v3;
  }
  id v4 = v2;

  return v4;
}

id __44__CNAuthorizationContext_isClientTCCAllowed__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  char v3 = (void *)v2[8];
  if (!v3)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "isClientTCCAllowedImpl"));
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v4;

    char v3 = *(void **)(*(void *)(a1 + 32) + 64);
  }

  return v3;
}

- (BOOL)shouldAlwaysQueryAuthorizationStatusImpl
{
  if ([(CNAuthorizationContext *)self isUnitTesting])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(CNAuthorizationContext *)self isGreenTeaDevice];
    if (v3
      && ([(CNAuthorizationContext *)self isClientTCCUncoupledProcess]
       || (BOOL v3 = [(CNAuthorizationContext *)self isClientTCCCoupledProcess])))
    {
      LOBYTE(v3) = ![(CNAuthorizationContext *)self isClientTCCKilledOnAuthorizationChange];
    }
  }
  return v3;
}

- (OS_tcc_identity)assumedIdentity
{
  return self->_assumedIdentity;
}

- (BOOL)isAddressingGrammarAccessGrantedImpl
{
  BOOL v3 = [(CNAuthorizationContext *)self isAccessGranted];
  if (v3)
  {
    LOBYTE(v3) = [(CNAuthorizationContext *)self isFirstPartyAddressingGrammarEntitled];
  }
  return v3;
}

id __52__CNAuthorizationContext_isClientTCCRegionalAllowed__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)v2[9];
  if (!v3)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "isClientTCCRegionalAllowedImpl"));
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v4;

    BOOL v3 = *(void **)(*(void *)(a1 + 32) + 72);
  }

  return v3;
}

- (BOOL)isClientTCCRegionalAllowedImpl
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"com.apple.private.tcc.allow-or-regional-prompt";
  v5[1] = @"com.apple.private.tcc.allow-or-regional-prompt.overridable";
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  LOBYTE(self) = [(CNAuthorizationContext *)self checkTCCEntitlementNamesAllowContacts:v3];

  return (char)self;
}

- (CNAuthorizationContext)initWithAuditToken:(id)a3 assumedIdentity:(id)a4 tccServices:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CNAuthorizationContext;
  v12 = [(CNAuthorizationContext *)&v24 init];
  if (v12)
  {
    if (v11)
    {
      v13 = (CNTCC *)v11;
    }
    else
    {
      v13 = +[CNTCCFactory defaultTCC];
    }
    tccServices = v12->_tccServices;
    v12->_tccServices = v13;

    objc_storeStrong((id *)&v12->_cnAuditToken, a3);
    objc_storeStrong((id *)&v12->_assumedIdentity, a4);
    authorizationStatusCachedValue = v12->_authorizationStatusCachedValue;
    v12->_authorizationStatusCachedValue = (NSNumber *)&unk_1EE04A888;

    v16 = objc_alloc_init(CNUnfairLock);
    authorizationStatusLock = v12->_authorizationStatusLock;
    v12->_authorizationStatusLock = v16;

    v18 = objc_alloc_init(CNUnfairLock);
    notesAccessStatusLock = v12->_notesAccessStatusLock;
    v12->_notesAccessStatusLock = v18;

    v20 = objc_alloc_init(CNUnfairLock);
    addressingGrammarAccessStatusLock = v12->_addressingGrammarAccessStatusLock;
    v12->_addressingGrammarAccessStatusLock = v20;

    v22 = v12;
  }

  return v12;
}

+ (CNAuthorizationContext)sharedInstance
{
  if (sharedInstance_cn_once_token_2_1 != -1) {
    dispatch_once(&sharedInstance_cn_once_token_2_1, &__block_literal_global_4_2);
  }
  id v2 = (void *)sharedInstance_cn_once_object_2_1;

  return (CNAuthorizationContext *)v2;
}

- (void)requestAuthorization:(int64_t)a3 completionHandler:(id)a4
{
  v6 = (void (**)(id, void, void *))a4;
  int64_t v7 = [(CNAuthorizationContext *)self authorizationStatus];
  if (v7)
  {
    int64_t v8 = v7;
    id v9 = [(CNAuthorizationContext *)self errorForStatus:v7];
    v6[2](v6, v8, v9);
  }
  else
  {
    id v9 = [(CNAuthorizationContext *)self requestAuthorizationFuture:a3];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__CNAuthorizationContext_requestAuthorization_completionHandler___block_invoke;
    v13[3] = &unk_1E56A0638;
    v13[4] = self;
    id v10 = v6;
    id v14 = v10;
    [v9 addSuccessBlock:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__CNAuthorizationContext_requestAuthorization_completionHandler___block_invoke_2;
    v11[3] = &unk_1E56A0660;
    v12 = v10;
    [v9 addFailureBlock:v11];
  }
}

- (id)errorForStatus:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CNContactsFoundationErrorDomain", 7, 0, v3);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (BOOL)requestAccessWithError:(id *)a3
{
  BOOL v4 = [(CNAuthorizationContext *)self isAccessGrantedRequestingAccessIfNeeded];
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:7 userInfo:0];
    v6 = v5;
    if (a3) {
      *a3 = v5;
    }
  }
  return v4;
}

- (BOOL)isNotesAccessGrantedImpl
{
  BOOL v3 = [(CNAuthorizationContext *)self isAccessGranted];
  if (v3)
  {
    if ([(CNAuthorizationContext *)self isFirstPartyNotesEntitled])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = [(CNAuthorizationContext *)self isThirdPartyNotesEntitled];
    }
  }
  return v3;
}

- (BOOL)isAccessGranted
{
  if ([(CNAuthorizationContext *)self isFullAccessGranted]) {
    return 1;
  }

  return [(CNAuthorizationContext *)self isLimitedAccessGranted];
}

- (BOOL)isLimitedAccessGranted
{
  return [(CNAuthorizationContext *)self authorizationStatus] == 2;
}

- (BOOL)isAccessGrantedRequestingAccessIfNeeded
{
  int64_t v3 = [(CNAuthorizationContext *)self authorizationStatus];
  if (!v3)
  {
    BOOL v4 = [(CNAuthorizationContext *)self requestAuthorizationFuture:0];
    int64_t v3 = [(CNAuthorizationContext *)self resolveRequestAuthorizationFuture:v4];
  }
  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)isFullAccessGranted
{
  return [(CNAuthorizationContext *)self authorizationStatus] == 3;
}

- (BOOL)isFirstPartyAddressingGrammarEntitled
{
  if ([(CNAuthorizationContext *)self isClientTCCAllowed]) {
    return 1;
  }

  return [(CNAuthorizationContext *)self isClientTCCRegionalAllowed];
}

- (BOOL)isFirstPartyNotesEntitled
{
  if ([(CNAuthorizationContext *)self isClientTCCAllowed]) {
    return 1;
  }

  return [(CNAuthorizationContext *)self isClientTCCRegionalAllowed];
}

- (BOOL)isClientTCCAllowed
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__CNAuthorizationContext_isClientTCCAllowed__block_invoke;
  void v5[3] = &unk_1E569F360;
  v5[4] = self;
  id v2 = cn_objectResultWithObjectLock(self, v5);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isClientTCCRegionalAllowed
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__CNAuthorizationContext_isClientTCCRegionalAllowed__block_invoke;
  void v5[3] = &unk_1E569F360;
  v5[4] = self;
  id v2 = cn_objectResultWithObjectLock(self, v5);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (CNAuthorizationContext)initWithAuditToken:(id)a3 assumedIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    char v8 = 0;
  }
  else {
    char v8 = [(id)objc_opt_class() shouldIgnoreAssumedIdentity:v7];
  }
  id v9 = [(id)objc_opt_class() sharedInstance];
  id v10 = v9;
  if ((v8 & 1) == 0)
  {

    self = [(CNAuthorizationContext *)self initWithAuditToken:v6 assumedIdentity:v7 tccServices:0];
    id v10 = self;
  }

  return v10;
}

uint64_t __40__CNAuthorizationContext_sharedInstance__block_invoke()
{
  sharedInstance_cn_once_object_2_1 = [[CNAuthorizationContext alloc] initWithAuditToken:0 assumedIdentity:0 tccServices:0];

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)shouldIgnoreAssumedIdentity:(id)a3
{
  if (!a3) {
    return 1;
  }
  id v4 = a3;
  uint64_t v5 = [(objc_class *)+[CNTCCFactory defaultClass] bundleIdentifierForIdentity:v4];

  char v6 = [a1 shouldIgnoreAssumedIdentityForBundleIdentifier:v5];
  id v7 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[CNAuthorizationContext shouldIgnoreAssumedIdentity:v7];
  }

  return v6;
}

+ (BOOL)shouldIgnoreAssumedIdentityForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length]) {
    char v5 = [&unk_1EE04A8B8 containsObject:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (id)os_log
{
  if (os_log_cn_once_token_1_5 != -1) {
    dispatch_once(&os_log_cn_once_token_1_5, &__block_literal_global_34);
  }
  id v2 = (void *)os_log_cn_once_object_1_5;

  return v2;
}

- (BOOL)isGreenTeaDevice
{
  id v2 = +[CNEnvironmentBase currentEnvironment];
  char v3 = [v2 isGreenTeaDevice];

  return v3;
}

- (BOOL)isClientTCCAllowedImpl
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"com.apple.private.tcc.allow";
  v5[1] = @"com.apple.private.tcc.allow.overridable";
  char v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  LOBYTE(self) = [(CNAuthorizationContext *)self checkTCCEntitlementNamesAllowContacts:v3];

  return (char)self;
}

- (BOOL)checkTCCEntitlementNamesAllowContacts:(id)a3
{
  id v4 = a3;
  char v5 = [(CNAuthorizationContext *)self cnAuditToken];

  char v6 = +[CNEnvironmentBase currentEnvironment];
  id v7 = [v6 entitlementVerifier];
  char v8 = v7;
  if (v5)
  {
    id v9 = [(CNAuthorizationContext *)self cnAuditToken];
    id v10 = v9;
    if (v9) {
      objc_msgSend(v9, "audit_token");
    }
    else {
      memset(v17, 0, sizeof(v17));
    }
    id v16 = 0;
    LOBYTE(v11) = [v8 auditToken:v17 hasArrayWithStringValue:@"kTCCServiceAddressBook" forAnyEntitlement:v4 error:&v16];
    id v12 = v16;
  }
  else
  {
    id v15 = 0;
    uint64_t v11 = [v7 currentProcessHasArrayWithStringValue:@"kTCCServiceAddressBook" forAnyEntitlement:v4 error:&v15];
    id v12 = v15;
  }

  if (v12)
  {
    v13 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CNAuthorizationContext checkTCCEntitlementNamesAllowContacts:]();
    }
  }
  return v11;
}

- (CNAuditToken)cnAuditToken
{
  return self->_cnAuditToken;
}

- (BOOL)isUnitTesting
{
  id v2 = [(CNAuthorizationContext *)self tccServices];
  char v3 = [v2 isUnitTesting];

  return v3;
}

- (BOOL)isAccessRestricted
{
  id v2 = [(CNAuthorizationContext *)self tccServices];
  char v3 = [v2 isAuthorizationRestricted];

  return v3;
}

- (CNTCC)tccServices
{
  return self->_tccServices;
}

- (BOOL)cachedNotesAccessGranted
{
  notesAccessStatusLock = self->_notesAccessStatusLock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__CNAuthorizationContext_cachedNotesAccessGranted__block_invoke;
  v6[3] = &unk_1E56A0688;
  v6[4] = self;
  char v3 = CNResultWithLock(notesAccessStatusLock, v6);
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)cachedAddressingGrammarAccessGranted
{
  notesAccessStatusLock = self->_notesAccessStatusLock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__CNAuthorizationContext_cachedAddressingGrammarAccessGranted__block_invoke;
  v6[3] = &unk_1E56A0688;
  v6[4] = self;
  char v3 = CNResultWithLock(notesAccessStatusLock, v6);
  char v4 = [v3 BOOLValue];

  return v4;
}

uint64_t __32__CNAuthorizationContext_os_log__block_invoke()
{
  os_log_cn_once_object_1_5 = (uint64_t)os_log_create("com.apple.contacts", "authorization-context");

  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressingGrammarAccessStatusLock, 0);
  objc_storeStrong((id *)&self->_notesAccessStatusLock, 0);
  objc_storeStrong((id *)&self->_authorizationStatusLock, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifierCachedValue, 0);
  objc_storeStrong((id *)&self->_isClientFirstOrSecondPartyCachedValue, 0);
  objc_storeStrong((id *)&self->_isClientTCCRegionalAllowedCachedValue, 0);
  objc_storeStrong((id *)&self->_isClientTCCAllowedCachedValue, 0);
  objc_storeStrong((id *)&self->_isAddressingGrammarAccessGrantedCachedValue, 0);
  objc_storeStrong((id *)&self->_isNotesAccessGrantedCachedValue, 0);
  objc_storeStrong((id *)&self->_shouldAlwaysQueryAuthorizationStatusCachedValue, 0);
  objc_storeStrong((id *)&self->_authorizationStatusCachedValue, 0);
  objc_storeStrong((id *)&self->_tccServices, 0);
  objc_storeStrong((id *)&self->_assumedIdentity, 0);

  objc_storeStrong((id *)&self->_cnAuditToken, 0);
}

- (CNAuthorizationContext)init
{
  return [(CNAuthorizationContext *)self initWithAuditToken:0 assumedIdentity:0];
}

- (BOOL)isAccessDenied
{
  return [(CNAuthorizationContext *)self authorizationStatus] == 1;
}

- (BOOL)isAccessUnknown
{
  return [(CNAuthorizationContext *)self authorizationStatus] == 0;
}

- (BOOL)isClientFirstOrSecondParty
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__CNAuthorizationContext_isClientFirstOrSecondParty__block_invoke;
  void v5[3] = &unk_1E569F360;
  v5[4] = self;
  id v2 = cn_objectResultWithObjectLock(self, v5);
  char v3 = [v2 BOOLValue];

  return v3;
}

id __52__CNAuthorizationContext_isClientFirstOrSecondParty__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  char v3 = (void *)v2[10];
  if (!v3)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "isClientFirstOrSecondPartyImpl"));
    uint64_t v5 = *(void *)(a1 + 32);
    char v6 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v4;

    char v3 = *(void **)(*(void *)(a1 + 32) + 80);
  }

  return v3;
}

- (NSString)clientBundleIdentifier
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__CNAuthorizationContext_clientBundleIdentifier__block_invoke;
  void v5[3] = &unk_1E569F360;
  v5[4] = self;
  id v2 = cn_objectResultWithObjectLock(self, v5);
  char v3 = off_1EE025F60((uint64_t)&__block_literal_global_4_4, v2);

  return (NSString *)v3;
}

id __48__CNAuthorizationContext_clientBundleIdentifier__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  char v3 = (void *)v2[11];
  if (!v3)
  {
    uint64_t v4 = [v2 clientBundleIdentifierImpl];
    uint64_t v5 = *(void *)(a1 + 32);
    char v6 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v4;

    char v3 = *(void **)(*(void *)(a1 + 32) + 88);
  }

  return v3;
}

void __65__CNAuthorizationContext_requestAuthorization_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "errorForStatus:", objc_msgSend(a2, "integerValue"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __65__CNAuthorizationContext_requestAuthorization_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)simulateStatus:(int64_t)a3
{
  id v4 = [(CNAuthorizationContext *)self tccServices];
  [v4 simulateStatus:a3];
}

- (void)stopSimulation
{
  id v2 = [(CNAuthorizationContext *)self tccServices];
  [v2 stopSimulation];
}

- (BOOL)isClientTCCUncoupledProcess
{
  id v3 = [(CNAuthorizationContext *)self assumedIdentity];

  if (!v3) {
    return 0;
  }

  return [(CNAuthorizationContext *)self doesClientHaveEntitlement:@"com.apple.private.attribution.explicitly-assumed-identities"];
}

- (BOOL)isClientTCCCoupledProcess
{
  return [(CNAuthorizationContext *)self doesClientHaveEntitlement:@"com.apple.private.attribution.implicitly-assumed-identity"];
}

- (BOOL)doesClientHaveEntitlement:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CNAuthorizationContext *)self cnAuditToken];

  char v6 = +[CNEnvironmentBase currentEnvironment];
  id v7 = [v6 entitlementVerifier];
  if (v5)
  {
    char v8 = [(CNAuthorizationContext *)self cnAuditToken];
    id v9 = v8;
    if (v8) {
      objc_msgSend(v8, "audit_token");
    }
    else {
      memset(v21, 0, sizeof(v21));
    }
    v31[0] = v4;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    id v20 = 0;
    id v10 = [v7 valuesForAuditToken:v21 forEntitlements:v12 error:&v20];
    id v11 = v20;
  }
  else
  {
    id v30 = v4;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    id v19 = 0;
    id v10 = [v7 valuesForCurrentProcessForEntitlements:v9 error:&v19];
    id v11 = v19;
  }

  if (v11)
  {
    v13 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v16 = [(CNAuthorizationContext *)self cnAuditToken];
      if (v16) {
        v17 = @"audit token";
      }
      else {
        v17 = @"current process";
      }
      v18 = [v11 userInfo];
      *(_DWORD *)buf = 138413058;
      v23 = v17;
      __int16 v24 = 2112;
      id v25 = v4;
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 2112;
      v29 = v18;
      _os_log_error_impl(&dword_19091D000, v13, OS_LOG_TYPE_ERROR, "Error checking %@ entitlement %@: %@ %@", buf, 0x2Au);
    }
  }
  BOOL v14 = off_1EE024B00((uint64_t)&__block_literal_global_24, v10);

  return !v14;
}

- (BOOL)isClientTCCKilledOnAuthorizationChange
{
  id v3 = [(CNAuthorizationContext *)self cnAuditToken];

  id v4 = +[CNEnvironmentBase currentEnvironment];
  uint64_t v5 = [v4 entitlementVerifier];
  char v6 = v5;
  if (v3)
  {
    id v7 = [(CNAuthorizationContext *)self cnAuditToken];
    char v8 = v7;
    if (v7) {
      objc_msgSend(v7, "audit_token");
    }
    else {
      memset(v15, 0, sizeof(v15));
    }
    id v14 = 0;
    LOBYTE(v9) = [v6 auditToken:v15 hasBooleanEntitlement:@"com.apple.private.tcc.kill-on-assumed-identity-authorization-change" error:&v14];
    id v10 = v14;
  }
  else
  {
    id v13 = 0;
    uint64_t v9 = [v5 currentProcessHasBooleanEntitlement:@"com.apple.private.tcc.kill-on-assumed-identity-authorization-change" error:&v13];
    id v10 = v13;
  }

  if (v10)
  {
    id v11 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CNAuthorizationContext isClientTCCKilledOnAuthorizationChange]();
    }
  }
  return v9;
}

- (BOOL)isThirdPartyNotesEntitled
{
  id v3 = [(CNAuthorizationContext *)self cnAuditToken];

  id v4 = +[CNEnvironmentBase currentEnvironment];
  uint64_t v5 = [v4 entitlementVerifier];
  char v6 = v5;
  if (v3)
  {
    id v7 = [(CNAuthorizationContext *)self cnAuditToken];
    char v8 = v7;
    if (v7) {
      objc_msgSend(v7, "audit_token");
    }
    else {
      memset(v15, 0, sizeof(v15));
    }
    id v14 = 0;
    LOBYTE(v9) = [v6 auditToken:v15 hasBooleanEntitlement:@"com.apple.developer.contacts.notes" error:&v14];
    id v10 = v14;
  }
  else
  {
    id v13 = 0;
    uint64_t v9 = [v5 currentProcessHasBooleanEntitlement:@"com.apple.developer.contacts.notes" error:&v13];
    id v10 = v13;
  }

  if (v10)
  {
    id v11 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CNAuthorizationContext isThirdPartyNotesEntitled]();
    }
  }
  return v9;
}

- (BOOL)isClientFirstOrSecondPartyImpl
{
  if ([(CNAuthorizationContext *)self checkClientIsFirstOrSecondParty]) {
    return 1;
  }

  return [(CNAuthorizationContext *)self doesClientHaveEntitlement:@"com.apple.private.contacts"];
}

- (BOOL)checkClientIsFirstOrSecondParty
{
  id v3 = [(CNAuthorizationContext *)self cnAuditToken];

  id v4 = +[CNEnvironmentBase currentEnvironment];
  uint64_t v5 = [v4 entitlementVerifier];
  char v6 = v5;
  if (v3)
  {
    id v7 = [(CNAuthorizationContext *)self cnAuditToken];
    char v8 = v7;
    if (v7) {
      objc_msgSend(v7, "audit_token");
    }
    else {
      memset(v15, 0, sizeof(v15));
    }
    id v14 = 0;
    LOBYTE(v9) = [v6 auditToken:v15 isFirstOrSecondPartyWithError:&v14];
    id v10 = v14;
  }
  else
  {
    id v13 = 0;
    uint64_t v9 = [v5 currentProcessIsFirstOrSecondPartyWithError:&v13];
    id v10 = v13;
  }

  if (v10)
  {
    id v11 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CNAuthorizationContext checkClientIsFirstOrSecondParty]();
    }
  }
  return v9;
}

- (id)clientBundleIdentifierImpl
{
  id v3 = [(CNAuthorizationContext *)self tccServices];
  id v4 = [(CNAuthorizationContext *)self cnAuditToken];
  uint64_t v5 = [(CNAuthorizationContext *)self assumedIdentity];
  char v6 = [v3 bundleIdentifierForAuditToken:v4 assumedIdentity:v5];

  id v7 = off_1EE0257E0((uint64_t)&__block_literal_global_2_2, v6);

  return v7;
}

- (id)requestAuthorizationFuture:(int64_t)a3
{
  uint64_t v5 = objc_alloc_init(CNPromise);
  char v6 = [(CNAuthorizationContext *)self tccServices];
  id v7 = [(CNAuthorizationContext *)self cnAuditToken];
  char v8 = [(CNAuthorizationContext *)self assumedIdentity];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __53__CNAuthorizationContext_requestAuthorizationFuture___block_invoke;
  id v15 = &unk_1E56A06B0;
  id v16 = self;
  v17 = v5;
  uint64_t v9 = v5;
  [v6 requestAuthorization:a3 auditToken:v7 assumedIdentity:v8 completionHandler:&v12];

  id v10 = [(CNPromise *)v9 future];

  return v10;
}

void __53__CNAuthorizationContext_requestAuthorizationFuture___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [NSNumber numberWithInteger:a2];
  id v4 = [*(id *)(a1 + 32) authorizationStatusLock];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  char v8 = __53__CNAuthorizationContext_requestAuthorizationFuture___block_invoke_2;
  uint64_t v9 = &unk_1E569F310;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v3;
  id v5 = v3;
  CNRunWithLock(v4, &v6);

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v5, v6, v7, v8, v9, v10);
}

void __53__CNAuthorizationContext_requestAuthorizationFuture___block_invoke_2(uint64_t a1)
{
}

- (int64_t)resolveRequestAuthorizationFuture:(id)a3
{
  id v8 = 0;
  id v3 = [a3 result:&v8];
  id v4 = v8;
  if (!v3)
  {
    id v5 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CNAuthorizationContext resolveRequestAuthorizationFuture:](v4, v5);
    }

    id v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  int64_t v6 = [v3 integerValue];

  return v6;
}

- (void)saveAuthorizationRecord:(id)a3 dontKillApp:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CNAuthorizationContext *)self tccServices];
  [v7 saveAuthorizationRecord:v6 dontKillApp:v4];
}

- (void)setAuthorizationStatus:(int64_t)a3 forBundleIdentifier:(id)a4 noKillApp:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [(CNAuthorizationContext *)self tccServices];
  [v9 setAuthorizationStatus:a3 forBundleIdentifier:v8 noKillApp:v5];
}

- (void)resetCachedStatus
{
  id v3 = [(CNAuthorizationContext *)self authorizationStatusLock];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__CNAuthorizationContext_resetCachedStatus__block_invoke;
  v8[3] = &unk_1E569F9D8;
  v8[4] = self;
  CNRunWithLock(v3, v8);

  BOOL v4 = [(CNAuthorizationContext *)self notesAccessStatusLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__CNAuthorizationContext_resetCachedStatus__block_invoke_2;
  v7[3] = &unk_1E569F9D8;
  v7[4] = self;
  CNRunWithLock(v4, v7);

  BOOL v5 = [(CNAuthorizationContext *)self addressingGrammarAccessStatusLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__CNAuthorizationContext_resetCachedStatus__block_invoke_3;
  v6[3] = &unk_1E569F9D8;
  v6[4] = self;
  CNRunWithLock(v5, v6);
}

void __43__CNAuthorizationContext_resetCachedStatus__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = &unk_1EE04A888;
}

void __43__CNAuthorizationContext_resetCachedStatus__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 48);
  *(void *)(v1 + 48) = 0;
}

void __43__CNAuthorizationContext_resetCachedStatus__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 56);
  *(void *)(v1 + 56) = 0;
}

- (void)setCnAuditToken:(id)a3
{
}

- (void)setAssumedIdentity:(id)a3
{
}

- (void)setTccServices:(id)a3
{
}

- (NSNumber)authorizationStatusCachedValue
{
  return self->_authorizationStatusCachedValue;
}

- (void)setAuthorizationStatusCachedValue:(id)a3
{
}

- (NSNumber)shouldAlwaysQueryAuthorizationStatusCachedValue
{
  return self->_shouldAlwaysQueryAuthorizationStatusCachedValue;
}

- (void)setShouldAlwaysQueryAuthorizationStatusCachedValue:(id)a3
{
}

- (NSNumber)isNotesAccessGrantedCachedValue
{
  return self->_isNotesAccessGrantedCachedValue;
}

- (void)setIsNotesAccessGrantedCachedValue:(id)a3
{
}

- (NSNumber)isAddressingGrammarAccessGrantedCachedValue
{
  return self->_isAddressingGrammarAccessGrantedCachedValue;
}

- (void)setIsAddressingGrammarAccessGrantedCachedValue:(id)a3
{
}

- (NSNumber)isClientTCCAllowedCachedValue
{
  return self->_isClientTCCAllowedCachedValue;
}

- (void)setIsClientTCCAllowedCachedValue:(id)a3
{
}

- (NSNumber)isClientTCCRegionalAllowedCachedValue
{
  return self->_isClientTCCRegionalAllowedCachedValue;
}

- (void)setIsClientTCCRegionalAllowedCachedValue:(id)a3
{
}

- (NSNumber)isClientFirstOrSecondPartyCachedValue
{
  return self->_isClientFirstOrSecondPartyCachedValue;
}

- (void)setIsClientFirstOrSecondPartyCachedValue:(id)a3
{
}

- (NSString)clientBundleIdentifierCachedValue
{
  return self->_clientBundleIdentifierCachedValue;
}

- (void)setClientBundleIdentifierCachedValue:(id)a3
{
}

- (CNUnfairLock)authorizationStatusLock
{
  return self->_authorizationStatusLock;
}

- (void)setAuthorizationStatusLock:(id)a3
{
}

- (CNUnfairLock)notesAccessStatusLock
{
  return self->_notesAccessStatusLock;
}

- (void)setNotesAccessStatusLock:(id)a3
{
}

- (CNUnfairLock)addressingGrammarAccessStatusLock
{
  return self->_addressingGrammarAccessStatusLock;
}

- (void)setAddressingGrammarAccessStatusLock:(id)a3
{
}

+ (void)shouldIgnoreAssumedIdentity:(os_log_t)log .cold.1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = @"ignore";
  if ((a1 & 1) == 0) {
    id v3 = @"honor";
  }
  int v4 = 138412546;
  BOOL v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_19091D000, log, OS_LOG_TYPE_DEBUG, "Will %@ assumed identity for assumed bundle identifier %@", (uint8_t *)&v4, 0x16u);
}

- (void)isClientTCCKilledOnAuthorizationChange
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v1 = [v0 cnAuditToken];
  id v2 = [(id)OUTLINED_FUNCTION_2_0() userInfo];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_19091D000, v3, v4, "Error checking %@ TCC kill on authorization change entitlement: %@ %@", v5, v6, v7, v8, v9);
}

- (void)isThirdPartyNotesEntitled
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v1 = [v0 cnAuditToken];
  id v2 = [(id)OUTLINED_FUNCTION_2_0() userInfo];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_19091D000, v3, v4, "Error checking %@ developer notes entitlement: %@ %@", v5, v6, v7, v8, v9);
}

- (void)checkTCCEntitlementNamesAllowContacts:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v1 = [v0 cnAuditToken];
  id v2 = [(id)OUTLINED_FUNCTION_2_0() userInfo];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_19091D000, v3, v4, "Error checking %@ TCC allow entitlement names: %@ %@", v5, v6, v7, v8, v9);
}

- (void)checkClientIsFirstOrSecondParty
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v1 = [v0 cnAuditToken];
  id v2 = [(id)OUTLINED_FUNCTION_2_0() userInfo];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_19091D000, v3, v4, "Error checking %@ first or second party: %@ %@", v5, v6, v7, v8, v9);
}

- (void)resolveRequestAuthorizationFuture:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 userInfo];
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_19091D000, a2, OS_LOG_TYPE_ERROR, "Error resolving request authorization future: %@ %@", (uint8_t *)&v5, 0x16u);
}

@end