@interface CNTCCVersion1
+ (id)bundleIdentifierForIdentity:(id)a3;
+ (id)createAppAuthorizationRecordFromTCCAppInfo:(id)a3 bundleIdentifier:(id)a4;
- (BOOL)isAuthorizationRestricted;
- (BOOL)isUnitTesting;
- (NSNumber)isUnitTestingCachedValue;
- (NSNumber)simulateStatus;
- (id)authorizationRecordForBundleIdentifier:(id)a3;
- (id)authorizationRecords;
- (id)bundleIdentifierForAuditToken:(id)a3 assumedIdentity:(id)a4;
- (id)isUnitTestingImpl;
- (int64_t)checkAuthorizationStatusOfAuditToken:(id *)a3;
- (int64_t)checkAuthorizationStatusOfAuditToken:(id)a3 assumedIdentity:(id)a4;
- (int64_t)checkAuthorizationStatusOfCurrentProcess;
- (void)requestAuthorization:(int64_t)a3 auditToken:(id)a4 assumedIdentity:(id)a5 completionHandler:(id)a6;
- (void)saveAuthorizationRecord:(id)a3;
- (void)setAuthorizationStatus:(int64_t)a3 forBundleIdentifier:(id)a4 noKillApp:(BOOL)a5;
- (void)setIsUnitTestingCachedValue:(id)a3;
- (void)setSimulateStatus:(id)a3;
- (void)simulateStatus:(int64_t)a3;
- (void)stopSimulation;
@end

@implementation CNTCCVersion1

- (int64_t)checkAuthorizationStatusOfCurrentProcess
{
  if (checkAuthorizationStatusOfCurrentProcess_cn_once_token_1 != -1) {
    dispatch_once(&checkAuthorizationStatusOfCurrentProcess_cn_once_token_1, &__block_literal_global_29);
  }
  id v3 = (id)checkAuthorizationStatusOfCurrentProcess_cn_once_object_1;
  v4 = [(CNTCCVersion1 *)self simulateStatus];

  if (v4)
  {
    v5 = [(CNTCCVersion1 *)self simulateStatus];
    int64_t v6 = [v5 integerValue];
LABEL_8:

    goto LABEL_9;
  }
  if (![(CNTCCVersion1 *)self isUnitTesting])
  {
    v5 = [NSNumber numberWithUnsignedInt:TCCAccessPreflight()];
    v7 = [v3 objectForKeyedSubscript:v5];
    int64_t v6 = [v7 integerValue];

    goto LABEL_8;
  }
  int64_t v6 = 3;
LABEL_9:

  return v6;
}

void __57__CNTCCVersion1_checkAuthorizationStatusOfCurrentProcess__block_invoke()
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v3[0] = &unk_1EE04A7F8;
  v3[1] = &unk_1EE04A828;
  v4[0] = &unk_1EE04A810;
  v4[1] = &unk_1EE04A840;
  v3[2] = &unk_1EE04A858;
  v4[2] = &unk_1EE04A870;
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:3];
  uint64_t v1 = [v0 copy];
  v2 = (void *)checkAuthorizationStatusOfCurrentProcess_cn_once_object_1;
  checkAuthorizationStatusOfCurrentProcess_cn_once_object_1 = v1;
}

- (int64_t)checkAuthorizationStatusOfAuditToken:(id *)a3
{
  v4 = [(CNTCCVersion1 *)self simulateStatus];

  if (v4)
  {
    v5 = [(CNTCCVersion1 *)self simulateStatus];
    int64_t v6 = [v5 integerValue];

    return v6;
  }
  else if ([(CNTCCVersion1 *)self isUnitTesting])
  {
    return 3;
  }
  else if (TCCAccessCheckAuditToken())
  {
    return 3;
  }
  else
  {
    return 1;
  }
}

- (int64_t)checkAuthorizationStatusOfAuditToken:(id)a3 assumedIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int64_t v8 = 0;
  }
  else
  {
    if (v6)
    {
      objc_msgSend(v6, "audit_token");
      int64_t v9 = [(CNTCCVersion1 *)self checkAuthorizationStatusOfAuditToken:&v11];
    }
    else
    {
      int64_t v9 = [(CNTCCVersion1 *)self checkAuthorizationStatusOfCurrentProcess];
    }
    int64_t v8 = v9;
  }

  return v8;
}

- (BOOL)isAuthorizationRestricted
{
  id v3 = [(CNTCCVersion1 *)self simulateStatus];

  return !v3 && ![(CNTCCVersion1 *)self isUnitTesting] && TCCAccessRestricted() != 0;
}

- (void)requestAuthorization:(int64_t)a3 auditToken:(id)a4 assumedIdentity:(id)a5 completionHandler:(id)a6
{
  id v7 = (void (**)(id, uint64_t))a6;
  int64_t v8 = [(CNTCCVersion1 *)self simulateStatus];

  if (v8)
  {
    int64_t v9 = [(CNTCCVersion1 *)self simulateStatus];
    v7[2](v7, [v9 integerValue]);
  }
  else if ([(CNTCCVersion1 *)self isUnitTesting])
  {
    v7[2](v7, 3);
  }
  else
  {
    v10 = v7;
    TCCAccessRequest();
  }
}

uint64_t __83__CNTCCVersion1_requestAuthorization_auditToken_assumedIdentity_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)bundleIdentifierForAuditToken:(id)a3 assumedIdentity:(id)a4
{
  return 0;
}

+ (id)bundleIdentifierForIdentity:(id)a3
{
  return 0;
}

- (id)authorizationRecords
{
  id v3 = (void *)TCCAccessCopyInformation();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__CNTCCVersion1_authorizationRecords__block_invoke;
  v6[3] = &unk_1E56A04F0;
  v6[4] = self;
  v4 = objc_msgSend(v3, "_cn_compactMap:", v6);

  return v4;
}

id __37__CNTCCVersion1_authorizationRecords__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(id)objc_opt_class() createAppAuthorizationRecordFromTCCAppInfo:v2 bundleIdentifier:0];

  v4 = off_1EE0257E0((uint64_t)&__block_literal_global_2_2, v3);

  return v4;
}

- (id)authorizationRecordForBundleIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (void *)TCCAccessCopyInformationForBundleId();
  v5 = objc_msgSend(v4, "_cn_firstObjectPassingTest:", &__block_literal_global_18);
  if (v5)
  {
    id v6 = [(id)objc_opt_class() createAppAuthorizationRecordFromTCCAppInfo:v5 bundleIdentifier:v3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

BOOL __56__CNTCCVersion1_authorizationRecordForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FA9A00]];

  return CFStringCompare(v2, (CFStringRef)*MEMORY[0x1E4FA9A10], 1uLL) == kCFCompareEqualTo;
}

- (void)saveAuthorizationRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 authorizationStatus];
  id v6 = [v4 bundleIdentifier];

  [(CNTCCVersion1 *)self setAuthorizationStatus:v5 forBundleIdentifier:v6 noKillApp:0];
}

- (void)setAuthorizationStatus:(int64_t)a3 forBundleIdentifier:(id)a4 noKillApp:(BOOL)a5
{
  MEMORY[0x1F415CC30](*MEMORY[0x1E4FA9A10], a4, a3 == 3);
}

+ (id)createAppAuthorizationRecordFromTCCAppInfo:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4FA99D8];
  id v7 = a3;
  int64_t v8 = [v7 objectForKeyedSubscript:v6];

  int64_t v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FA99E8]];

  if (!v5 && v8)
  {
    CFBundleGetIdentifier((CFBundleRef)v8);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v5)
  {
    v10 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v5];
    uint64_t v11 = [v10 localizedName];
    v12 = v11;
    if (v11 && [v11 length])
    {
      if (CFBooleanGetValue((CFBooleanRef)v9)) {
        uint64_t v13 = 3;
      }
      else {
        uint64_t v13 = 1;
      }
      v14 = [[CNTCCAppAuthorizationRecord alloc] initWithBundleIdentifier:v5 localizedName:v12 recordType:0 authorizationStatus:v13];
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)simulateStatus:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(CNTCCVersion1 *)self setSimulateStatus:v4];
}

- (void)stopSimulation
{
}

- (BOOL)isUnitTesting
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__CNTCCVersion1_isUnitTesting__block_invoke;
  v5[3] = &unk_1E569F360;
  v5[4] = self;
  id v2 = cn_objectResultWithObjectLock(self, v5);
  char v3 = [v2 BOOLValue];

  return v3;
}

id __30__CNTCCVersion1_isUnitTesting__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  char v3 = (void *)v2[2];
  if (!v3)
  {
    uint64_t v4 = [v2 isUnitTestingImpl];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;

    char v3 = *(void **)(*(void *)(a1 + 32) + 16);
  }

  return v3;
}

- (id)isUnitTestingImpl
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  char v3 = [v2 executablePath];

  if (([v3 hasSuffix:@"CNTestsHostiOS"] & 1) != 0
    || ([v3 hasSuffix:@"CNTestsHostiOS_XPC"] & 1) != 0
    || ([v3 hasSuffix:@"otest"] & 1) != 0)
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = [v3 hasSuffix:@"xctest"];
  }
  uint64_t v5 = [NSNumber numberWithBool:v4];

  return v5;
}

- (NSNumber)simulateStatus
{
  return self->_simulateStatus;
}

- (void)setSimulateStatus:(id)a3
{
}

- (NSNumber)isUnitTestingCachedValue
{
  return self->_isUnitTestingCachedValue;
}

- (void)setIsUnitTestingCachedValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isUnitTestingCachedValue, 0);

  objc_storeStrong((id *)&self->_simulateStatus, 0);
}

@end