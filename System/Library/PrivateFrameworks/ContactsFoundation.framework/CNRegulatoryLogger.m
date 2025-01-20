@interface CNRegulatoryLogger
+ (id)sharedInstanceForAddressBook;
- (BOOL)isGreenTeaDiagnosticsEnabled;
- (BOOL)isPrivacyAccountingDiagnosticsEnabled;
- (CNAuditToken)cnAuditToken;
- (CNRegulatoryLogger)initWithAuditToken:(id)a3 assumedIdentity:(id)a4;
- (CNRegulatoryLogger)initWithAuditToken:(id)a3 assumedIdentity:(id)a4 logCategory:(const char *)a5;
- (NSString)processDescription;
- (OS_os_log)os_log;
- (OS_tcc_identity)assumedIdentity;
- (PAAccessLogger)privacyAccountingLogger;
- (PAApplication)privacyAccountingAccessor;
- (ct_green_tea_logger_s)greenTeaLogger;
- (id)accessorForAuditTokenValidatingAssumedIdentity;
- (id)privacyAccountingAccessorImpl;
- (id)processDescriptionImpl;
- (unint64_t)greenTeaDiagnosticEventCounter;
- (unint64_t)greenTeaDiagnosticLogFaultForEventCount;
- (void)accessorForAuditTokenValidatingAssumedIdentity;
- (void)dealloc;
- (void)deletingContactsData;
- (void)displayingOOPContactPicker;
- (void)logContactPickerAccessEvent;
- (void)logContactsDataAccessEvent;
- (void)logContactsDataAccessEventWithAssetIdentifiers:(id)a3;
- (void)logGreenTeaEvent:(id)a3;
- (void)logPrivacyAccountingAccessEvent:(id)a3;
- (void)modifyingContactsData;
- (void)readingContactsData;
- (void)receivingContactsDataFromOOPContactPicker;
- (void)setGreenTeaDiagnosticEventCounter:(unint64_t)a3;
- (void)setGreenTeaDiagnosticLogFaultForEventCount:(unint64_t)a3;
- (void)setPrivacyAccountingAccessor:(id)a3;
- (void)setPrivacyAccountingLogger:(id)a3;
- (void)setProcessDescription:(id)a3;
- (void)willLogContactPickerAccessEvent;
- (void)willLogContactsDataAccessEvent;
- (void)willLogContactsDataAccessEventWithAssetIdentifiers:(id)a3;
- (void)willNotLogContactPickerAccessEventAsLoggingDisabled;
- (void)willNotLogContactPickerAccessEventAsLoggingInProcess;
- (void)willNotLogContactsDataAccessEventAsLoggingDisabled;
@end

@implementation CNRegulatoryLogger

id __45__CNRegulatoryLogger_privacyAccountingLogger__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    uint64_t v3 = [(objc_class *)getPAAccessLoggerClass() sharedInstance];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 48);
  }

  return v2;
}

- (void)readingContactsData
{
}

- (CNRegulatoryLogger)initWithAuditToken:(id)a3 assumedIdentity:(id)a4
{
  return [(CNRegulatoryLogger *)self initWithAuditToken:a3 assumedIdentity:a4 logCategory:0];
}

+ (id)sharedInstanceForAddressBook
{
  v2 = [[CNRegulatoryLogger alloc] initWithAuditToken:0 assumedIdentity:0 logCategory:"CNRegulatoryLoggerForAB"];

  return v2;
}

- (CNRegulatoryLogger)initWithAuditToken:(id)a3 assumedIdentity:(id)a4 logCategory:(const char *)a5
{
  id v9 = a3;
  id v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CNRegulatoryLogger;
  v11 = [(CNRegulatoryLogger *)&v23 init];
  if (v11)
  {
    if (a5) {
      v12 = a5;
    }
    else {
      v12 = "CNRegulatoryLogger";
    }
    os_log_t v13 = os_log_create("com.apple.contacts", v12);
    os_log = v11->_os_log;
    v11->_os_log = (OS_os_log *)v13;

    if (!v9)
    {
      if (ct_green_tea_logging_enabled()) {
        v11->_greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
      }
      v15 = +[CNUserDefaults standardPreferences];
      v16 = [v15 stringForKey:@"CNGreenTeaDiagnosticsForProcessName"];

      v17 = [MEMORY[0x1E4F28F80] processInfo];
      v18 = [v17 processName];
      v11->_isGreenTeaDiagnosticsEnabled = [v16 isEqualToString:v18];

      v19 = +[CNUserDefaults standardPreferences];
      v11->_greenTeaDiagnosticLogFaultForEventCount = [v19 integerForKey:@"CNGreenTeaDiagnosticsLogFaultForEventCount"];

      v11->_greenTeaDiagnosticEventCounter = 0;
    }
    objc_storeStrong((id *)&v11->_cnAuditToken, a3);
    objc_storeStrong((id *)&v11->_assumedIdentity, a4);
    v20 = +[CNUserDefaults standardPreferences];
    v11->_isPrivacyAccountingDiagnosticsEnabled = [v20 userHasOptedInToPreference:@"CNPrivacyAccountingDiagnosticsEnabled"];

    v21 = v11;
  }

  return v11;
}

- (void)logGreenTeaEvent:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CNRegulatoryLogger *)self greenTeaLogger])
  {
    [(CNRegulatoryLogger *)self greenTeaLogger];
    v5 = getCTGreenTeaOsLogHandle();
    v6 = v5;
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_19091D000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
  }
  if ([(CNRegulatoryLogger *)self isGreenTeaDiagnosticsEnabled])
  {
    v7 = [NSString stringWithFormat:@"Triggered GreenTea logging event: %@", v4];
    unint64_t v8 = [(CNRegulatoryLogger *)self greenTeaDiagnosticEventCounter] + 1;
    [(CNRegulatoryLogger *)self setGreenTeaDiagnosticEventCounter:v8];
    unint64_t v9 = [(CNRegulatoryLogger *)self greenTeaDiagnosticLogFaultForEventCount];
    id v10 = [(CNRegulatoryLogger *)self os_log];
    v11 = v10;
    if (v8 == v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[CNRegulatoryLogger logGreenTeaEvent:]((uint64_t)v7, v11);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_19091D000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
  }
}

- (BOOL)isGreenTeaDiagnosticsEnabled
{
  return self->_isGreenTeaDiagnosticsEnabled;
}

- (ct_green_tea_logger_s)greenTeaLogger
{
  return self->_greenTeaLogger;
}

- (void)dealloc
{
  if (self->_greenTeaLogger) {
    ct_green_tea_logger_destroy();
  }
  v3.receiver = self;
  v3.super_class = (Class)CNRegulatoryLogger;
  [(CNRegulatoryLogger *)&v3 dealloc];
}

id __47__CNRegulatoryLogger_privacyAccountingAccessor__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  objc_super v3 = (void *)v2[7];
  if (!v3)
  {
    uint64_t v4 = [v2 privacyAccountingAccessorImpl];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v4;

    objc_super v3 = *(void **)(*(void *)(a1 + 32) + 56);
  }

  return v3;
}

- (id)privacyAccountingAccessorImpl
{
  uint64_t v3 = [(CNRegulatoryLogger *)self cnAuditToken];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = [(CNRegulatoryLogger *)self assumedIdentity];

    if (v5)
    {
      uint64_t v6 = [(CNRegulatoryLogger *)self accessorForAuditTokenValidatingAssumedIdentity];
LABEL_4:
      v7 = (void *)v6;
      goto LABEL_13;
    }
  }
  unint64_t v8 = [(CNRegulatoryLogger *)self cnAuditToken];

  if (v8)
  {
    id v9 = objc_alloc(getPAApplicationClass());
    id v10 = [(CNRegulatoryLogger *)self cnAuditToken];
    v11 = v10;
    if (v10) {
      objc_msgSend(v10, "audit_token");
    }
    else {
      memset(v17, 0, sizeof(v17));
    }
    uint64_t v15 = [v9 initWithAuditToken:v17];
  }
  else
  {
    v12 = [(CNRegulatoryLogger *)self assumedIdentity];

    Class PAApplicationClass = getPAApplicationClass();
    if (!v12)
    {
      uint64_t v6 = [(objc_class *)PAApplicationClass applicationForCurrentProcess];
      goto LABEL_4;
    }
    id v14 = [PAApplicationClass alloc];
    v11 = [(CNRegulatoryLogger *)self assumedIdentity];
    uint64_t v15 = [v14 initWithInProcessAssumedIdentity:v11];
  }
  v7 = (void *)v15;

LABEL_13:

  return v7;
}

- (CNAuditToken)cnAuditToken
{
  return self->_cnAuditToken;
}

- (OS_tcc_identity)assumedIdentity
{
  return self->_assumedIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processDescription, 0);
  objc_storeStrong((id *)&self->_assumedIdentity, 0);
  objc_storeStrong((id *)&self->_cnAuditToken, 0);
  objc_storeStrong((id *)&self->_privacyAccountingAccessor, 0);
  objc_storeStrong((id *)&self->_privacyAccountingLogger, 0);

  objc_storeStrong((id *)&self->_os_log, 0);
}

- (void)logContactsDataAccessEventWithAssetIdentifiers:(id)a3
{
  id v9 = a3;
  if ([v9 count])
  {
    uint64_t v4 = [(CNRegulatoryLogger *)self privacyAccountingLogger];
    char v5 = [v4 loggingEnabled];

    if (v5)
    {
      [(CNRegulatoryLogger *)self willLogContactsDataAccessEventWithAssetIdentifiers:v9];
      id v6 = objc_alloc(getPATCCAccessClass());
      v7 = [(CNRegulatoryLogger *)self privacyAccountingAccessor];
      unint64_t v8 = (void *)[v6 initWithAccessor:v7 forService:*MEMORY[0x1E4FA9A10] assetIdentifiers:v9];

      [(CNRegulatoryLogger *)self logPrivacyAccountingAccessEvent:v8];
    }
    else
    {
      [(CNRegulatoryLogger *)self willNotLogContactsDataAccessEventAsLoggingDisabled];
    }
  }
}

- (void)logPrivacyAccountingAccessEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(CNRegulatoryLogger *)self privacyAccountingLogger];
  [v5 log:v4];
}

- (void)logContactsDataAccessEvent
{
  uint64_t v3 = [(CNRegulatoryLogger *)self privacyAccountingLogger];
  char v4 = [v3 loggingEnabled];

  if (v4)
  {
    [(CNRegulatoryLogger *)self willLogContactsDataAccessEvent];
    id v5 = objc_alloc(getPATCCAccessClass());
    id v6 = [(CNRegulatoryLogger *)self privacyAccountingAccessor];
    id v7 = (id)[v5 initWithAccessor:v6 forService:*MEMORY[0x1E4FA9A10]];

    [(CNRegulatoryLogger *)self logPrivacyAccountingAccessEvent:v7];
  }
  else
  {
    [(CNRegulatoryLogger *)self willNotLogContactsDataAccessEventAsLoggingDisabled];
  }
}

- (PAAccessLogger)privacyAccountingLogger
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__CNRegulatoryLogger_privacyAccountingLogger__block_invoke;
  v4[3] = &unk_1E569F360;
  v4[4] = self;
  v2 = cn_objectResultWithObjectLock(self, v4);

  return (PAAccessLogger *)v2;
}

- (void)willLogContactsDataAccessEvent
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(CNRegulatoryLogger *)self isPrivacyAccountingDiagnosticsEnabled])
  {
    uint64_t v3 = [(CNRegulatoryLogger *)self cnAuditToken];

    char v4 = [(CNRegulatoryLogger *)self os_log];
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v5)
      {
        id v6 = [(CNRegulatoryLogger *)self processDescription];
        int v8 = 138412290;
        id v9 = v6;
        id v7 = "Logging out-of-process contacts data access event for %@";
LABEL_7:
        _os_log_impl(&dword_19091D000, v4, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v8, 0xCu);
      }
    }
    else if (v5)
    {
      id v6 = [(CNRegulatoryLogger *)self processDescription];
      int v8 = 138412290;
      id v9 = v6;
      id v7 = "Logging in-process contacts data access event for %@";
      goto LABEL_7;
    }
  }
}

- (void)willNotLogContactsDataAccessEventAsLoggingDisabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(CNRegulatoryLogger *)self isPrivacyAccountingDiagnosticsEnabled])
  {
    uint64_t v3 = [(CNRegulatoryLogger *)self cnAuditToken];

    char v4 = [(CNRegulatoryLogger *)self os_log];
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v5)
      {
        id v6 = [(CNRegulatoryLogger *)self processDescription];
        int v8 = 138412290;
        id v9 = v6;
        id v7 = "Logging disabled with out-of-process contacts data access event for %@";
LABEL_7:
        _os_log_impl(&dword_19091D000, v4, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v8, 0xCu);
      }
    }
    else if (v5)
    {
      id v6 = [(CNRegulatoryLogger *)self processDescription];
      int v8 = 138412290;
      id v9 = v6;
      id v7 = "Logging disabled with in-process contacts data access event for %@";
      goto LABEL_7;
    }
  }
}

- (BOOL)isPrivacyAccountingDiagnosticsEnabled
{
  return self->_isPrivacyAccountingDiagnosticsEnabled;
}

- (PAApplication)privacyAccountingAccessor
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__CNRegulatoryLogger_privacyAccountingAccessor__block_invoke;
  v4[3] = &unk_1E569F360;
  v4[4] = self;
  v2 = cn_objectResultWithObjectLock(self, v4);

  return (PAApplication *)v2;
}

- (void)modifyingContactsData
{
}

- (void)deletingContactsData
{
}

- (void)displayingOOPContactPicker
{
}

- (void)receivingContactsDataFromOOPContactPicker
{
}

- (void)logContactPickerAccessEvent
{
  uint64_t v3 = [(CNRegulatoryLogger *)self privacyAccountingLogger];
  char v4 = [v3 loggingEnabled];

  if (v4)
  {
    BOOL v5 = [(CNRegulatoryLogger *)self cnAuditToken];

    if (v5)
    {
      [(CNRegulatoryLogger *)self willLogContactPickerAccessEvent];
      id v6 = objc_alloc((Class)getPAOutOfProcessPickerAccessClass[0]());
      id v7 = [(CNRegulatoryLogger *)self privacyAccountingAccessor];
      id v8 = (id)[v6 initWithAccessor:v7 forType:2];

      [(CNRegulatoryLogger *)self logPrivacyAccountingAccessEvent:v8];
    }
    else
    {
      [(CNRegulatoryLogger *)self willNotLogContactPickerAccessEventAsLoggingInProcess];
    }
  }
  else
  {
    [(CNRegulatoryLogger *)self willNotLogContactPickerAccessEventAsLoggingDisabled];
  }
}

- (id)accessorForAuditTokenValidatingAssumedIdentity
{
  uint64_t v3 = softLinkPAAuthenticatedClientIdentity[0];
  char v4 = [(CNRegulatoryLogger *)self cnAuditToken];
  BOOL v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "audit_token");
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
  }
  id v6 = [(CNRegulatoryLogger *)self assumedIdentity];
  id v7 = ((void (*)(_OWORD *, void *))v3)(&v12, v6);

  if (v7)
  {
    uint64_t v8 = [objc_alloc(getPAApplicationClass()) initWithTCCIdentity:v7];
  }
  else
  {
    id v9 = [(CNRegulatoryLogger *)self os_log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CNRegulatoryLogger accessorForAuditTokenValidatingAssumedIdentity](self);
    }

    uint64_t v8 = [(objc_class *)getPAApplicationClass() applicationForCurrentProcess];
  }
  uint64_t v10 = (void *)v8;

  return v10;
}

- (void)willLogContactsDataAccessEventWithAssetIdentifiers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CNRegulatoryLogger *)self isPrivacyAccountingDiagnosticsEnabled])
  {
    BOOL v5 = [v4 allObjects];
    id v6 = objc_msgSend(v5, "_cn_map:", &__block_literal_global_6);

    id v7 = [(CNRegulatoryLogger *)self cnAuditToken];

    uint64_t v8 = [(CNRegulatoryLogger *)self os_log];
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v9)
      {
        uint64_t v10 = [(CNRegulatoryLogger *)self processDescription];
        int v12 = 138412546;
        long long v13 = v10;
        __int16 v14 = 2112;
        uint64_t v15 = v6;
        v11 = "Logging out-of-process contacts data access event for %@, %@";
LABEL_7:
        _os_log_impl(&dword_19091D000, v8, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v12, 0x16u);
      }
    }
    else if (v9)
    {
      uint64_t v10 = [(CNRegulatoryLogger *)self processDescription];
      int v12 = 138412546;
      long long v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      v11 = "Logging in-process contacts data access event for %@, %@";
      goto LABEL_7;
    }
  }
}

id __73__CNRegulatoryLogger_willLogContactsDataAccessEventWithAssetIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)NSString;
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithData:v3 encoding:4];

  return v4;
}

- (void)willNotLogContactPickerAccessEventAsLoggingDisabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(CNRegulatoryLogger *)self isPrivacyAccountingDiagnosticsEnabled])
  {
    id v3 = [(CNRegulatoryLogger *)self cnAuditToken];

    id v4 = [(CNRegulatoryLogger *)self os_log];
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v5)
      {
        id v6 = [(CNRegulatoryLogger *)self processDescription];
        int v8 = 138412290;
        BOOL v9 = v6;
        id v7 = "Logging disabled with out-of-process contact picker access event for %@.";
LABEL_7:
        _os_log_impl(&dword_19091D000, v4, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v8, 0xCu);
      }
    }
    else if (v5)
    {
      id v6 = [(CNRegulatoryLogger *)self processDescription];
      int v8 = 138412290;
      BOOL v9 = v6;
      id v7 = "Logging disabled when asked to log an in-process contact picker access event for %@";
      goto LABEL_7;
    }
  }
}

- (void)willNotLogContactPickerAccessEventAsLoggingInProcess
{
  v1 = [a1 processDescription];
  OUTLINED_FUNCTION_0(&dword_19091D000, v2, v3, "Unexpected request to log an in-process contact picker access event for %@", v4, v5, v6, v7, 2u);
}

- (void)willLogContactPickerAccessEvent
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(CNRegulatoryLogger *)self isPrivacyAccountingDiagnosticsEnabled])
  {
    uint64_t v3 = [(CNRegulatoryLogger *)self os_log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = [(CNRegulatoryLogger *)self processDescription];
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_19091D000, v3, OS_LOG_TYPE_INFO, "Logging out-of-process contact picker access event for %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (NSString)processDescription
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__CNRegulatoryLogger_processDescription__block_invoke;
  v4[3] = &unk_1E569F360;
  v4[4] = self;
  uint64_t v2 = cn_objectResultWithObjectLock(self, v4);

  return (NSString *)v2;
}

id __40__CNRegulatoryLogger_processDescription__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[10];
  if (!v3)
  {
    uint64_t v4 = [v2 processDescriptionImpl];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v4;

    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 80);
  }

  return v3;
}

- (id)processDescriptionImpl
{
  uint64_t v3 = [(CNRegulatoryLogger *)self cnAuditToken];

  if (v3)
  {
    uint64_t v4 = [(CNRegulatoryLogger *)self cnAuditToken];
    uint64_t v5 = +[CNAuditTokenUtilities processNameForAuditToken:v4];

    if (v5) {
      goto LABEL_8;
    }
    uint64_t v6 = [(CNRegulatoryLogger *)self cnAuditToken];
    uint64_t v5 = +[CNAuditTokenUtilities bundleIdentifierForAuditToken:v6];

    if (v5) {
      goto LABEL_8;
    }
    uint64_t v7 = NSString;
    int v8 = [(CNRegulatoryLogger *)self cnAuditToken];
    uint64_t v9 = +[CNAuditTokenUtilities processIdentifierForAuditToken:v8];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v5 = [v10 processName];

    if (v5) {
      goto LABEL_8;
    }
    uint64_t v7 = NSString;
    int v8 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v9 = [v8 processIdentifier];
  }
  uint64_t v5 = objc_msgSend(v7, "stringWithFormat:", @"PID = %d", v9);

LABEL_8:
  v11 = [(CNRegulatoryLogger *)self assumedIdentity];

  if (v11)
  {
    int v12 = NSString;
    long long v13 = [(CNRegulatoryLogger *)self assumedIdentity];
    id v14 = [v12 stringWithFormat:@"%@ [%s]", v5, tcc_identity_get_identifier()];
  }
  else
  {
    id v14 = v5;
  }

  return v14;
}

- (OS_os_log)os_log
{
  return self->_os_log;
}

- (unint64_t)greenTeaDiagnosticLogFaultForEventCount
{
  return self->_greenTeaDiagnosticLogFaultForEventCount;
}

- (void)setGreenTeaDiagnosticLogFaultForEventCount:(unint64_t)a3
{
  self->_greenTeaDiagnosticLogFaultForEventCount = a3;
}

- (unint64_t)greenTeaDiagnosticEventCounter
{
  return self->_greenTeaDiagnosticEventCounter;
}

- (void)setGreenTeaDiagnosticEventCounter:(unint64_t)a3
{
  self->_greenTeaDiagnosticEventCounter = a3;
}

- (void)setPrivacyAccountingLogger:(id)a3
{
}

- (void)setPrivacyAccountingAccessor:(id)a3
{
}

- (void)setProcessDescription:(id)a3
{
}

- (void)logGreenTeaEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19091D000, a2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v2, 0xCu);
}

- (void)accessorForAuditTokenValidatingAssumedIdentity
{
  v1 = [a1 processDescription];
  OUTLINED_FUNCTION_0(&dword_19091D000, v2, v3, "Failed to validate assumed identity for %@, will log as contactsd.", v4, v5, v6, v7, 2u);
}

@end