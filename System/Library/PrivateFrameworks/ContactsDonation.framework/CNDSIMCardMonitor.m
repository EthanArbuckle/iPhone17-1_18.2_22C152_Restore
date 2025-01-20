@interface CNDSIMCardMonitor
+ (id)continuousPhoneNumberObservableWithCoreTelephonyClient:(id)a3 services:(id)a4 serverConnection:(__CTServerConnection *)a5;
+ (id)infoWithCompletion:(id)a3;
+ (id)os_log;
+ (id)phoneNumberChangedObservableWithCoreTelephonyServices:(id)a3 serverConnection:(__CTServerConnection *)a4;
+ (id)phoneNumberObservableWithCoreTelephonyClient:(id)a3;
+ (void)infoWithClient:(id)a3 completion:(id)a4;
- (CNCancelable)subjectToken;
- (CNDCoreTelephonyServices)coreTelephonyServices;
- (CNDSIMCardMonitor)init;
- (CNDSIMCardMonitor)initWithCoreTelephonyClient:(id)a3 services:(id)a4;
- (CNReplaySubject)subject;
- (CoreTelephonyClient)coreTelephonyClient;
- (OS_dispatch_queue)serverConnectionQueue;
- (__CTServerConnection)serverConnection;
- (id)addInfoChangeHandler:(id)a3;
- (void)configureStateIfNecessary;
- (void)dealloc;
- (void)nts_configureConnectionIfNecessary;
- (void)nts_configureSubjectIfNecessary;
- (void)setServerConnection:(__CTServerConnection *)a3;
- (void)setServerConnectionQueue:(id)a3;
- (void)setSubjectToken:(id)a3;
@end

@implementation CNDSIMCardMonitor

+ (id)os_log
{
  if (os_log_cn_once_token_1 != -1) {
    dispatch_once(&os_log_cn_once_token_1, &__block_literal_global_0);
  }
  v2 = (void *)os_log_cn_once_object_1;

  return v2;
}

uint64_t __27__CNDSIMCardMonitor_os_log__block_invoke()
{
  os_log_cn_once_object_1 = (uint64_t)os_log_create("com.apple.contacts.donation", "sim");

  return MEMORY[0x270F9A758]();
}

- (CNDSIMCardMonitor)init
{
  id v3 = objc_alloc_init(MEMORY[0x263F02D30]);
  v4 = objc_alloc_init(CNDCoreTelephonyServices);
  v5 = [(CNDSIMCardMonitor *)self initWithCoreTelephonyClient:v3 services:v4];

  return v5;
}

- (CNDSIMCardMonitor)initWithCoreTelephonyClient:(id)a3 services:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_0 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_0, &__block_literal_global_125);
  }
  v9 = CNGuardOSLog_cn_once_object_0_0;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_0, OS_LOG_TYPE_FAULT))
  {
    -[CNDSIMCardMonitor initWithCoreTelephonyClient:services:](v9);
    if (v8) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (v8) {
      goto LABEL_10;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_0 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_0, &__block_literal_global_125);
  }
  v10 = CNGuardOSLog_cn_once_object_0_0;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_0, OS_LOG_TYPE_FAULT)) {
    -[CNDSIMCardMonitor initWithCoreTelephonyClient:services:](v10);
  }
LABEL_10:
  v19.receiver = self;
  v19.super_class = (Class)CNDSIMCardMonitor;
  v11 = [(CNDSIMCardMonitor *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_coreTelephonyClient, a3);
    objc_storeStrong((id *)&v12->_coreTelephonyServices, a4);
    id v13 = objc_alloc(MEMORY[0x263F33650]);
    v14 = [MEMORY[0x263F33668] defaultProvider];
    uint64_t v15 = [v13 initWithCapacity:1 schedulerProvider:v14];
    subject = v12->_subject;
    v12->_subject = (CNReplaySubject *)v15;

    v17 = v12;
  }

  return v12;
}

- (void)dealloc
{
  serverConnection = self->_serverConnection;
  if (serverConnection) {
    CFRelease(serverConnection);
  }
  [(CNCancelable *)self->_subjectToken cancel];
  v4.receiver = self;
  v4.super_class = (Class)CNDSIMCardMonitor;
  [(CNDSIMCardMonitor *)&v4 dealloc];
}

- (void)setServerConnection:(__CTServerConnection *)a3
{
  if (self->_serverConnection != a3)
  {
    if (a3) {
      objc_super v4 = (__CTServerConnection *)CFRetain(a3);
    }
    else {
      objc_super v4 = 0;
    }
    self->_serverConnection = v4;
  }
}

- (id)addInfoChangeHandler:(id)a3
{
  id v4 = a3;
  [(CNDSIMCardMonitor *)self configureStateIfNecessary];
  v5 = [(CNDSIMCardMonitor *)self subject];
  v6 = [MEMORY[0x263F33610] observerWithResultBlock:v4];

  id v7 = [v5 subscribe:v6];

  return v7;
}

- (void)configureStateIfNecessary
{
  obj = self;
  objc_sync_enter(obj);
  [(CNDSIMCardMonitor *)obj nts_configureConnectionIfNecessary];
  [(CNDSIMCardMonitor *)obj nts_configureSubjectIfNecessary];
  objc_sync_exit(obj);
}

- (void)nts_configureConnectionIfNecessary
{
  if (!self->_serverConnection)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.contacts.ContactsDonation.CNDSIMCardMonitor", 0);
    [(CNDSIMCardMonitor *)self setServerConnectionQueue:v3];

    id v6 = [(CNDSIMCardMonitor *)self coreTelephonyServices];
    uint64_t v4 = *MEMORY[0x263EFFB08];
    v5 = [(CNDSIMCardMonitor *)self serverConnectionQueue];
    -[CNDSIMCardMonitor setServerConnection:](self, "setServerConnection:", [v6 _CTServerConnectionCreateOnTargetQueue:v4 :@"com.apple.contacts.ContactsDonation.CNDSIMCardMonitor" :v5 :0]);
  }
}

- (void)nts_configureSubjectIfNecessary
{
  dispatch_queue_t v3 = [(CNDSIMCardMonitor *)self subjectToken];

  if (!v3)
  {
    uint64_t v4 = objc_opt_class();
    v5 = [(CNDSIMCardMonitor *)self coreTelephonyClient];
    id v6 = [(CNDSIMCardMonitor *)self coreTelephonyServices];
    objc_msgSend(v4, "continuousPhoneNumberObservableWithCoreTelephonyClient:services:serverConnection:", v5, v6, -[CNDSIMCardMonitor serverConnection](self, "serverConnection"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    id v7 = [(CNDSIMCardMonitor *)self subject];
    id v8 = [v9 subscribe:v7];
    [(CNDSIMCardMonitor *)self setSubjectToken:v8];
  }
}

+ (id)continuousPhoneNumberObservableWithCoreTelephonyClient:(id)a3 services:(id)a4 serverConnection:(__CTServerConnection *)a5
{
  id v8 = a3;
  id v9 = [a1 phoneNumberChangedObservableWithCoreTelephonyServices:a4 serverConnection:a5];
  v10 = [v9 startWith:&unk_26C4FAF20];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __102__CNDSIMCardMonitor_continuousPhoneNumberObservableWithCoreTelephonyClient_services_serverConnection___block_invoke;
  v14[3] = &unk_2641FBFD8;
  id v15 = v8;
  id v16 = a1;
  id v11 = v8;
  v12 = [v10 concatMap:v14];

  return v12;
}

uint64_t __102__CNDSIMCardMonitor_continuousPhoneNumberObservableWithCoreTelephonyClient_services_serverConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) phoneNumberObservableWithCoreTelephonyClient:*(void *)(a1 + 32)];
}

+ (id)phoneNumberChangedObservableWithCoreTelephonyServices:(id)a3 serverConnection:(__CTServerConnection *)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x263F33608];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __92__CNDSIMCardMonitor_phoneNumberChangedObservableWithCoreTelephonyServices_serverConnection___block_invoke;
  v10[3] = &unk_2641FC050;
  id v11 = v5;
  v12 = a4;
  id v7 = v5;
  id v8 = [v6 observableWithBlock:v10];

  return v8;
}

id __92__CNDSIMCardMonitor_phoneNumberChangedObservableWithCoreTelephonyServices_serverConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *MEMORY[0x263F033C8];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __92__CNDSIMCardMonitor_phoneNumberChangedObservableWithCoreTelephonyServices_serverConnection___block_invoke_2;
  v16[3] = &unk_2641FC000;
  id v17 = v3;
  id v7 = v3;
  [v4 _CTServerConnectionRegisterBlockForNotification:v5 :v6 :v16];
  id v8 = (void *)MEMORY[0x263F33570];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __92__CNDSIMCardMonitor_phoneNumberChangedObservableWithCoreTelephonyServices_serverConnection___block_invoke_3;
  v13[3] = &unk_2641FC028;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v14 = v9;
  uint64_t v15 = v10;
  id v11 = [v8 tokenWithCancelationBlock:v13];

  return v11;
}

uint64_t __92__CNDSIMCardMonitor_phoneNumberChangedObservableWithCoreTelephonyServices_serverConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:@"change"];
}

uint64_t __92__CNDSIMCardMonitor_phoneNumberChangedObservableWithCoreTelephonyServices_serverConnection___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _CTServerConnectionUnregisterForNotification:*(void *)(a1 + 40) :*MEMORY[0x263F033C8]];
}

+ (id)phoneNumberObservableWithCoreTelephonyClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F33608];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__CNDSIMCardMonitor_phoneNumberObservableWithCoreTelephonyClient___block_invoke;
  v9[3] = &unk_2641FC050;
  id v10 = v4;
  id v11 = a1;
  id v6 = v4;
  id v7 = [v5 observableWithBlock:v9];

  return v7;
}

id __66__CNDSIMCardMonitor_phoneNumberObservableWithCoreTelephonyClient___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F33570]);
  uint64_t v7 = a1 + 32;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v7 + 8);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__CNDSIMCardMonitor_phoneNumberObservableWithCoreTelephonyClient___block_invoke_2;
  v13[3] = &unk_2641FC0A0;
  id v8 = v4;
  id v14 = v8;
  id v15 = v3;
  id v9 = v3;
  [v6 infoWithClient:v5 completion:v13];
  id v10 = v15;
  id v11 = v8;

  return v11;
}

void __66__CNDSIMCardMonitor_phoneNumberObservableWithCoreTelephonyClient___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__CNDSIMCardMonitor_phoneNumberObservableWithCoreTelephonyClient___block_invoke_3;
  v10[3] = &unk_2641FC078;
  id v11 = v5;
  id v12 = v6;
  uint64_t v7 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v8 = v6;
  id v9 = v5;
  [v7 performBlock:v10];
}

uint64_t __66__CNDSIMCardMonitor_phoneNumberObservableWithCoreTelephonyClient___block_invoke_3(void *a1)
{
  return [MEMORY[0x263F33610] sendResult:a1[4] error:a1[5] toObserver:a1[6]];
}

+ (id)infoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F02D30]);
  id v6 = objc_alloc_init(MEMORY[0x263F33570]);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __40__CNDSIMCardMonitor_infoWithCompletion___block_invoke;
  v12[3] = &unk_2641FC0F0;
  id v7 = v6;
  id v13 = v7;
  id v14 = v4;
  id v8 = v4;
  [a1 infoWithClient:v5 completion:v12];
  id v9 = v14;
  id v10 = v7;

  return v10;
}

void __40__CNDSIMCardMonitor_infoWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__CNDSIMCardMonitor_infoWithCompletion___block_invoke_2;
  v11[3] = &unk_2641FC0C8;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  [v7 performBlock:v11];
}

uint64_t __40__CNDSIMCardMonitor_infoWithCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)infoWithClient:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke;
  v10[3] = &unk_2641FC140;
  id v12 = v7;
  id v13 = a1;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [v8 getSubscriptionInfo:v10];
}

void __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a2 subscriptionsInUse];
  if (v6)
  {
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke_21;
    v22 = &unk_2641FC118;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    id v23 = v7;
    uint64_t v24 = v8;
    id v9 = objc_msgSend(v6, "_cn_compactMap:", &v19);
    id v10 = objc_msgSend(*(id *)(a1 + 48), "os_log", v19, v20, v21, v22);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [v9 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v26 = v11;
      _os_log_impl(&dword_214267000, v10, OS_LOG_TYPE_INFO, "Read %lu values from SIM", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v12 = objc_msgSend(*(id *)(a1 + 48), "os_log");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke_cold_1((uint64_t)v5, v12, v13, v14, v15, v16, v17, v18);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

CNDSIMCardItem *__47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke_21(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSimHidden] & 1) != 0 || (objc_msgSend(v3, "isSimDataOnly"))
  {
    id v4 = 0;
    goto LABEL_21;
  }
  id v5 = *(void **)(a1 + 32);
  id v34 = 0;
  id v6 = [v5 getSimLabel:v3 error:&v34];
  id v7 = v34;
  if (!v6)
  {
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 40), "os_log");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke_21_cold_1((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);
    }
    goto LABEL_10;
  }
  uint64_t v8 = *MEMORY[0x263F334E0];
  id v9 = objc_msgSend(v6, "unique_id");
  int v10 = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  if (!v10)
  {
    uint64_t v18 = *(void **)(a1 + 32);
    id v33 = 0;
    uint64_t v19 = [v18 getPhoneNumber:v3 error:&v33];
    uint64_t v11 = v33;
    if (v19)
    {
      uint64_t v20 = [v19 number];
      int v21 = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v20);

      if (!v21)
      {
        v29 = [CNDSIMCardItem alloc];
        v22 = objc_msgSend(v6, "unique_id");
        v30 = [v19 number];
        id v4 = [(CNDSIMCardItem *)v29 initWithIdentifier:v22 value:v30];

        goto LABEL_19;
      }
      v22 = objc_msgSend(*(id *)(a1 + 40), "os_log");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v32[0] = 0;
        _os_log_impl(&dword_214267000, v22, OS_LOG_TYPE_INFO, "No phone number for passed in subscription, skipping.", (uint8_t *)v32, 2u);
      }
    }
    else
    {
      v22 = objc_msgSend(*(id *)(a1 + 40), "os_log");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke_21_cold_3((uint64_t)v7, v22, v23, v24, v25, v26, v27, v28);
      }
    }
    id v4 = 0;
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v11 = objc_msgSend(*(id *)(a1 + 40), "os_log");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke_21_cold_2(v11);
  }
LABEL_10:
  id v4 = 0;
LABEL_20:

LABEL_21:

  return v4;
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (CNDCoreTelephonyServices)coreTelephonyServices
{
  return self->_coreTelephonyServices;
}

- (CNReplaySubject)subject
{
  return self->_subject;
}

- (CNCancelable)subjectToken
{
  return self->_subjectToken;
}

- (void)setSubjectToken:(id)a3
{
}

- (__CTServerConnection)serverConnection
{
  return self->_serverConnection;
}

- (OS_dispatch_queue)serverConnectionQueue
{
  return self->_serverConnectionQueue;
}

- (void)setServerConnectionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConnectionQueue, 0);
  objc_storeStrong((id *)&self->_subjectToken, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_coreTelephonyServices, 0);

  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

- (void)initWithCoreTelephonyClient:(os_log_t)log services:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_214267000, log, OS_LOG_TYPE_FAULT, "parameter ‘services’ must be nonnull", v1, 2u);
}

- (void)initWithCoreTelephonyClient:(os_log_t)log services:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_214267000, log, OS_LOG_TYPE_FAULT, "parameter ‘client’ must be nonnull", v1, 2u);
}

void __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke_21_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke_21_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_214267000, log, OS_LOG_TYPE_ERROR, "Skipping subscription with no identifier", v1, 2u);
}

void __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke_21_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end