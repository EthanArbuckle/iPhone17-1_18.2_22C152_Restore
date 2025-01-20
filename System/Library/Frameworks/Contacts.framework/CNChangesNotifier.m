@interface CNChangesNotifier
+ (id)sharedNotifier;
+ (id)sharedNotifierWithNotificationWrapper:(id)a3 schedulerProvider:(id)a4 loggerProvider:(id)a5;
+ (void)flushSharedNotifier;
- (BOOL)forwardsSelfGeneratedDistributedSaveNotifications;
- (CNChangesNotifier)initWithNotificationWrapper:(id)a3 schedulerProvider:(id)a4 loggerProvider:(id)a5;
- (CNChangesNotifierProxy)notifierProxy;
- (void)dealloc;
- (void)didChangeMeContactSuccessfully:(BOOL)a3 fromContactStore:(id)a4 requestIdentifier:(id)a5;
- (void)didSaveChangesSuccessfully:(BOOL)a3 fromContactStore:(id)a4 requestIdentifier:(id)a5;
- (void)setExternalNotificationCoalescingDelay:(double)a3;
- (void)setForwardsSelfGeneratedDistributedSaveNotifications:(BOOL)a3;
- (void)setNotifierProxy:(id)a3;
- (void)waitForCurrentTasksToFinish;
- (void)willSaveChanges;
@end

@implementation CNChangesNotifier

uint64_t __82__CNChangesNotifier_initWithNotificationWrapper_schedulerProvider_loggerProvider___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addObserver:a3 notification:a2];
}

+ (id)sharedNotifier
{
  v3 = [MEMORY[0x1E4F5A4F0] defaultProvider];
  v4 = +[CNContactsLoggerProvider defaultProvider];
  v5 = [a1 sharedNotifierWithNotificationWrapper:0 schedulerProvider:v3 loggerProvider:v4];

  return v5;
}

+ (id)sharedNotifierWithNotificationWrapper:(id)a3 schedulerProvider:(id)a4 loggerProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__CNChangesNotifier_sharedNotifierWithNotificationWrapper_schedulerProvider_loggerProvider___block_invoke;
  v17[3] = &unk_1E56B7440;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v21 = a1;
  uint64_t v11 = s_onceToken_0;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  if (v11 != -1) {
    dispatch_once(&s_onceToken_0, v17);
  }
  id v15 = (id)s_sharedNotifier;

  return v15;
}

uint64_t __92__CNChangesNotifier_sharedNotifierWithNotificationWrapper_schedulerProvider_loggerProvider___block_invoke(uint64_t a1)
{
  s_sharedNotifier = [objc_alloc(*(Class *)(a1 + 56)) initWithNotificationWrapper:*(void *)(a1 + 32) schedulerProvider:*(void *)(a1 + 40) loggerProvider:*(void *)(a1 + 48)];

  return MEMORY[0x1F41817F8]();
}

- (CNChangesNotifier)initWithNotificationWrapper:(id)a3 schedulerProvider:(id)a4 loggerProvider:(id)a5
{
  id v8 = (CNChangeNotifierDistributedCenterWrapper *)a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CNChangesNotifier;
  id v11 = [(CNChangesNotifier *)&v25 init];
  if (v11)
  {
    id v12 = -[CNChangesNotifierProxy initWithSchedulerProvider:loggerProvider:]((id *)[CNChangesNotifierProxy alloc], v9, v10);
    id v13 = (void *)*((void *)v11 + 1);
    *((void *)v11 + 1) = v12;

    if (!v8) {
      id v8 = objc_alloc_init(CNChangeNotifierDistributedCenterWrapper);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__CNChangesNotifier_initWithNotificationWrapper_schedulerProvider_loggerProvider___block_invoke;
    aBlock[3] = &unk_1E56B7468;
    id v14 = v8;
    v24 = v14;
    id v15 = _Block_copy(aBlock);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __82__CNChangesNotifier_initWithNotificationWrapper_schedulerProvider_loggerProvider___block_invoke_2;
    v21[3] = &unk_1E56B7468;
    id v8 = v14;
    v22 = v8;
    v16 = _Block_copy(v21);
    v17 = (void *)*MEMORY[0x1E4F49850];
    -[CNChangesNotifierProxy addListenerForNotificationName:registration:removal:](*((void *)v11 + 1), (void *)*MEMORY[0x1E4F49850], v15, v16);
    -[CNChangesNotifierProxy forwardNotificationName:asNotificationName:](*((void *)v11 + 1), v17, @"CNContactStoreDidChangeNotification");
    id v18 = (void *)*MEMORY[0x1E4F49848];
    -[CNChangesNotifierProxy addListenerForNotificationName:registration:removal:](*((void *)v11 + 1), (void *)*MEMORY[0x1E4F49848], v15, v16);
    -[CNChangesNotifierProxy forwardNotificationName:asNotificationName:](*((void *)v11 + 1), v18, @"CNContactStoreMeContactDidChangeNotification");
    -[CNChangesNotifierProxy coalesceNotificationName:](*((void *)v11 + 1), v17);
    id v19 = v11;
  }
  return (CNChangesNotifier *)v11;
}

uint64_t __82__CNChangesNotifier_initWithNotificationWrapper_schedulerProvider_loggerProvider___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) removeObserver:a3 notification:a2];
}

- (void)dealloc
{
  -[CNChangesNotifierProxy removeAllRegisteredNotificationSources]((uint64_t)self->_notifierProxy);
  v3.receiver = self;
  v3.super_class = (Class)CNChangesNotifier;
  [(CNChangesNotifier *)&v3 dealloc];
}

- (void)willSaveChanges
{
}

- (void)didSaveChangesSuccessfully:(BOOL)a3 fromContactStore:(id)a4 requestIdentifier:(id)a5
{
  if (a3) {
    -[CNChangesNotifierProxy postNotificationName:fromSender:saveIdentifier:isFromExternalProcess:](self->_notifierProxy, @"CNContactStoreDidChangeNotification", a4, a5, 0);
  }
  notifierProxy = self->_notifierProxy;

  -[CNChangesNotifierProxy stopSupressionOfNotificationName:]((uint64_t)notifierProxy, @"CNContactStoreDidChangeNotification");
}

- (void)didChangeMeContactSuccessfully:(BOOL)a3 fromContactStore:(id)a4 requestIdentifier:(id)a5
{
  if (a3) {
    -[CNChangesNotifierProxy postNotificationName:fromSender:saveIdentifier:isFromExternalProcess:](self->_notifierProxy, @"CNContactStoreMeContactDidChangeNotification", a4, a5, 0);
  }
}

- (void)waitForCurrentTasksToFinish
{
  id v2 = [(CNChangesNotifier *)self notifierProxy];
  [v2 waitForCurrentTasksToFinish];
}

+ (void)flushSharedNotifier
{
  id v2 = (void *)s_sharedNotifier;
  s_sharedNotifier = 0;

  s_onceToken_0 = 0;
}

- (BOOL)forwardsSelfGeneratedDistributedSaveNotifications
{
  return [(CNChangesNotifierProxy *)self->_notifierProxy forwardsSelfGeneratedDistributedSaveNotifications];
}

- (void)setForwardsSelfGeneratedDistributedSaveNotifications:(BOOL)a3
{
}

- (void)setExternalNotificationCoalescingDelay:(double)a3
{
}

- (CNChangesNotifierProxy)notifierProxy
{
  return self->_notifierProxy;
}

- (void)setNotifierProxy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end