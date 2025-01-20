@interface CNUIMeContactMonitor
+ (id)log;
+ (id)makeMeContactMonitor;
+ (id)makeUnifiedMeContactMonitor;
+ (id)meContactMonitor;
+ (id)unifiedMeContactMonitor;
- (BOOL)isMeContact:(id)a3;
- (CNCancelable)meNotificationToken;
- (CNContactStore)contactStore;
- (CNMeContactComparisonStrategy)strategy;
- (CNReaderWriterScheduler)lock;
- (CNUIMeContactMonitor)init;
- (CNUIMeContactMonitor)initWithComparisonStrategy:(id)a3;
- (CNUIMeContactMonitor)initWithComparisonStrategy:(id)a3 contactStore:(id)a4;
- (CNUIMeContactMonitor)initWithComparisonStrategy:(id)a3 contactStore:(id)a4 notificationCenter:(id)a5 schedulerProvider:(id)a6;
- (CNUIMeContactMonitor)initWithContactStore:(id)a3;
- (NSArray)meContactIdentifiers;
- (NSNotificationCenter)notificationCenter;
- (void)dealloc;
- (void)meChanged:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setLock:(id)a3;
- (void)setMeNotificationToken:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setStrategy:(id)a3;
- (void)startMonitoring;
@end

@implementation CNUIMeContactMonitor

+ (id)log
{
  if (log_cn_once_token_1_0 != -1) {
    dispatch_once(&log_cn_once_token_1_0, &__block_literal_global_22);
  }
  v2 = (void *)log_cn_once_object_1_0;
  return v2;
}

uint64_t __27__CNUIMeContactMonitor_log__block_invoke()
{
  log_cn_once_object_1_0 = (uint64_t)os_log_create("contactsui", "me-contact-monitor");
  return MEMORY[0x270F9A758]();
}

+ (id)meContactMonitor
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__CNUIMeContactMonitor_meContactMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (meContactMonitor_cn_once_token_2 != -1) {
    dispatch_once(&meContactMonitor_cn_once_token_2, block);
  }
  v2 = (void *)meContactMonitor_cn_once_object_2;
  return v2;
}

uint64_t __40__CNUIMeContactMonitor_meContactMonitor__block_invoke(uint64_t a1)
{
  meContactMonitor_cn_once_object_2 = [*(id *)(a1 + 32) makeMeContactMonitor];
  return MEMORY[0x270F9A758]();
}

+ (id)makeMeContactMonitor
{
  v3 = objc_alloc_init(CNUIMeContactComparisonStrategyIdentifier);
  v4 = (void *)[objc_alloc((Class)a1) initWithComparisonStrategy:v3];
  [v4 startMonitoring];

  return v4;
}

+ (id)unifiedMeContactMonitor
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__CNUIMeContactMonitor_unifiedMeContactMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (unifiedMeContactMonitor_cn_once_token_3 != -1) {
    dispatch_once(&unifiedMeContactMonitor_cn_once_token_3, block);
  }
  v2 = (void *)unifiedMeContactMonitor_cn_once_object_3;
  return v2;
}

uint64_t __47__CNUIMeContactMonitor_unifiedMeContactMonitor__block_invoke(uint64_t a1)
{
  unifiedMeContactMonitor_cn_once_object_3 = [*(id *)(a1 + 32) makeUnifiedMeContactMonitor];
  return MEMORY[0x270F9A758]();
}

+ (id)makeUnifiedMeContactMonitor
{
  v3 = objc_alloc_init(CNUIMeContactComparisonStrategyUnified);
  id v4 = objc_alloc_init(MEMORY[0x263EFEA68]);
  [v4 setIncludeLocalContacts:1];
  [v4 setIncludeDonatedContacts:1];
  v5 = (void *)[objc_alloc(MEMORY[0x263EFEA58]) initWithConfiguration:v4];
  v6 = (void *)[objc_alloc((Class)a1) initWithComparisonStrategy:v3 contactStore:v5];
  [v6 startMonitoring];

  return v6;
}

- (CNUIMeContactMonitor)init
{
  v3 = objc_alloc_init(CNUIMeContactComparisonStrategyIdentifier);
  id v4 = [(CNUIMeContactMonitor *)self initWithComparisonStrategy:v3];

  return v4;
}

- (CNUIMeContactMonitor)initWithContactStore:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(CNUIMeContactComparisonStrategyIdentifier);
  v6 = [(CNUIMeContactMonitor *)self initWithComparisonStrategy:v5 contactStore:v4];

  return v6;
}

- (CNUIMeContactMonitor)initWithComparisonStrategy:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFEA68];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setIncludeLocalContacts:1];
  v7 = (void *)[objc_alloc(MEMORY[0x263EFEA58]) initWithConfiguration:v6];
  v8 = [(CNUIMeContactMonitor *)self initWithComparisonStrategy:v5 contactStore:v7];

  return v8;
}

- (CNUIMeContactMonitor)initWithComparisonStrategy:(id)a3 contactStore:(id)a4
{
  id v6 = (void *)MEMORY[0x263F08A00];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 defaultCenter];
  v10 = [MEMORY[0x263F33668] defaultProvider];
  v11 = [(CNUIMeContactMonitor *)self initWithComparisonStrategy:v8 contactStore:v7 notificationCenter:v9 schedulerProvider:v10];

  return v11;
}

- (CNUIMeContactMonitor)initWithComparisonStrategy:(id)a3 contactStore:(id)a4 notificationCenter:(id)a5 schedulerProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_5 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_5, &__block_literal_global_150);
  }
  v15 = CNGuardOSLog_cn_once_object_0_5;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_5, OS_LOG_TYPE_FAULT))
  {
    -[CNUIMeContactMonitor initWithComparisonStrategy:contactStore:notificationCenter:schedulerProvider:](v15);
    if (v12) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (v12) {
      goto LABEL_10;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_5 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_5, &__block_literal_global_150);
  }
  v16 = CNGuardOSLog_cn_once_object_0_5;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_5, OS_LOG_TYPE_FAULT)) {
    -[CNUIMeContactMonitor initWithComparisonStrategy:contactStore:notificationCenter:schedulerProvider:](v16);
  }
LABEL_10:
  v27.receiver = self;
  v27.super_class = (Class)CNUIMeContactMonitor;
  v17 = [(CNUIMeContactMonitor *)&v27 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_strategy, a3);
    objc_storeStrong((id *)&v18->_contactStore, a4);
    objc_storeStrong((id *)&v18->_notificationCenter, a5);
    uint64_t v19 = [v14 newReaderWriterSchedulerWithName:@"com.apple.contacts.me-contact-monitor"];
    lock = v18->_lock;
    v18->_lock = (CNReaderWriterScheduler *)v19;

    v21 = [MEMORY[0x263F33608] observableOnNotificationCenter:v13 withName:*MEMORY[0x263EFE120] object:0];
    v22 = [MEMORY[0x263F33610] observerWithWeakTarget:v18 resultSelector:sel_meChanged_];
    uint64_t v23 = [v21 subscribe:v22];
    meNotificationToken = v18->_meNotificationToken;
    v18->_meNotificationToken = (CNCancelable *)v23;

    v25 = v18;
  }

  return v18;
}

- (void)dealloc
{
  [(CNCancelable *)self->_meNotificationToken cancel];
  v3.receiver = self;
  v3.super_class = (Class)CNUIMeContactMonitor;
  [(CNUIMeContactMonitor *)&v3 dealloc];
}

- (void)startMonitoring
{
}

- (BOOL)isMeContact:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    id v5 = [(CNUIMeContactMonitor *)self lock];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __36__CNUIMeContactMonitor_isMeContact___block_invoke;
    v8[3] = &unk_264017DB0;
    v10 = &v11;
    v8[4] = self;
    id v9 = v4;
    [v5 performSynchronousReaderBlock:v8];

    BOOL v6 = *((unsigned char *)v12 + 24) != 0;
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

void __36__CNUIMeContactMonitor_isMeContact___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) strategy];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 isMeContact:*(void *)(a1 + 40)];
}

- (NSArray)meContactIdentifiers
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  objc_super v3 = [(CNUIMeContactMonitor *)self lock];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__CNUIMeContactMonitor_meContactIdentifiers__block_invoke;
  v6[3] = &unk_264017DD8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performSynchronousReaderBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __44__CNUIMeContactMonitor_meContactIdentifiers__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) strategy];
  uint64_t v2 = [v5 meContactIdentifiers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)meChanged:(id)a3
{
  id v4 = [(CNUIMeContactMonitor *)self lock];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__CNUIMeContactMonitor_meChanged___block_invoke;
  v5[3] = &unk_264017748;
  v5[4] = self;
  [v4 performSynchronousWriterBlock:v5];
}

void __34__CNUIMeContactMonitor_meChanged___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) strategy];
  uint64_t v2 = [*(id *)(a1 + 32) contactStore];
  [v3 meContactChangedInStore:v2];
}

- (CNMeContactComparisonStrategy)strategy
{
  return self->_strategy;
}

- (void)setStrategy:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (CNReaderWriterScheduler)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (CNCancelable)meNotificationToken
{
  return self->_meNotificationToken;
}

- (void)setMeNotificationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meNotificationToken, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_strategy, 0);
}

- (void)initWithComparisonStrategy:(os_log_t)log contactStore:notificationCenter:schedulerProvider:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20B704000, log, OS_LOG_TYPE_FAULT, "parameter ‘store’ must be nonnull", v1, 2u);
}

- (void)initWithComparisonStrategy:(os_log_t)log contactStore:notificationCenter:schedulerProvider:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20B704000, log, OS_LOG_TYPE_FAULT, "parameter ‘strategy’ must be nonnull", v1, 2u);
}

@end