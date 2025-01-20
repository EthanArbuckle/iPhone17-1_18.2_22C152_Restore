@interface EDListUnsubscribeHandler
+ (id)log;
- (EDListUnsubscribeHandler)init;
- (EFScheduler)scheduler;
- (EMListUnsubscribeDetector)detector;
- (void)ignoreWithCommand:(id)a3 completion:(id)a4;
- (void)unsubscribeHTMLWithCommand:(id)a3 timeout:(double)a4 completion:(id)a5;
- (void)unsubscribeMailtoWithCommand:(id)a3 completion:(id)a4;
- (void)unsubscribeWithCommand:(id)a3 completion:(id)a4;
@end

@implementation EDListUnsubscribeHandler

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__EDListUnsubscribeHandler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_42 != -1) {
    dispatch_once(&log_onceToken_42, block);
  }
  v2 = (void *)log_log_42;

  return v2;
}

void __31__EDListUnsubscribeHandler_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_42;
  log_log_42 = (uint64_t)v1;
}

- (EDListUnsubscribeHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)EDListUnsubscribeHandler;
  v2 = [(EDListUnsubscribeHandler *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.mobilemail.ListUnsubscribeScheduler" qualityOfService:17];
    scheduler = v2->_scheduler;
    v2->_scheduler = (EFScheduler *)v3;

    v2->_detectorLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (EMListUnsubscribeDetector)detector
{
  p_detectorLock = &self->_detectorLock;
  os_unfair_lock_lock(&self->_detectorLock);
  detector = self->_detector;
  if (!detector)
  {
    v5 = (EMListUnsubscribeDetector *)objc_alloc_init(MEMORY[0x1E4F602E8]);
    objc_super v6 = self->_detector;
    self->_detector = v5;

    detector = self->_detector;
  }
  v7 = detector;
  os_unfair_lock_unlock(p_detectorLock);

  return v7;
}

- (void)ignoreWithCommand:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(EDListUnsubscribeHandler *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDListUnsubscribeHandler ignoreWithCommand:completion:]", "EDListUnsubscribeHandler.m", 45, "0");
}

- (void)unsubscribeWithCommand:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v7 isMailtoOperation]) {
    [(EDListUnsubscribeHandler *)self unsubscribeMailtoWithCommand:v7 completion:v6];
  }
  else {
    [(EDListUnsubscribeHandler *)self unsubscribeHTMLWithCommand:v7 timeout:v6 completion:15.0];
  }
}

- (void)unsubscribeMailtoWithCommand:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(EDListUnsubscribeHandler *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDListUnsubscribeHandler unsubscribeMailtoWithCommand:completion:]", "EDListUnsubscribeHandler.m", 57, "0");
}

- (void)unsubscribeHTMLWithCommand:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(EDListUnsubscribeHandler *)self scheduler];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__EDListUnsubscribeHandler_unsubscribeHTMLWithCommand_timeout_completion___block_invoke;
  v13[3] = &unk_1E6C016F8;
  id v11 = v8;
  double v17 = a4;
  id v14 = v11;
  v15 = self;
  id v12 = v9;
  id v16 = v12;
  [v10 performBlock:v13];
}

void __74__EDListUnsubscribeHandler_unsubscribeHTMLWithCommand_timeout_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) postValues];
  uint64_t v3 = [v2 oneClickURL];
  v4 = [v2 postContent];
  v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id v11 = [v4 dataUsingEncoding:4];
    EFPostUTF8FormData();
    id v12 = 0;

    if (v12)
    {
      v13 = +[EDListUnsubscribeHandler log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = objc_msgSend(v12, "ef_publicDescription");
        __74__EDListUnsubscribeHandler_unsubscribeHTMLWithCommand_timeout_completion___block_invoke_cold_1(v14, buf, v13);
      }
      goto LABEL_14;
    }
LABEL_13:
    v13 = [*(id *)(a1 + 40) detector];
    [v13 acceptCommand:*(void *)(a1 + 32)];
    id v12 = 0;
LABEL_14:

    goto LABEL_15;
  }
  id v7 = (void *)MEMORY[0x1E4F28C58];
  id v8 = [NSString stringWithFormat:@"Cannot perform HTML unsubscribe. url was nil: %d, postContent was nil: %d", v3 == 0, v4 == 0];
  objc_msgSend(v7, "em_internalErrorWithReason:", v8);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = +[EDListUnsubscribeHandler log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    v10 = objc_msgSend(v12, "ef_publicDescription");
    __74__EDListUnsubscribeHandler_unsubscribeHTMLWithCommand_timeout_completion___block_invoke_cold_2(v10, buf, v9);
  }

  if (!v12) {
    goto LABEL_13;
  }
LABEL_15:
  uint64_t v15 = *(void *)(a1 + 48);
  if (v15) {
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v12);
  }
}

- (EFScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);

  objc_storeStrong((id *)&self->_detector, 0);
}

void __74__EDListUnsubscribeHandler_unsubscribeHTMLWithCommand_timeout_completion___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Error performing HTML unsubscribe: %{public}@", buf, 0xCu);
}

void __74__EDListUnsubscribeHandler_unsubscribeHTMLWithCommand_timeout_completion___block_invoke_cold_2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1DB39C000, log, OS_LOG_TYPE_FAULT, "Error performing HTML unsubscribe: %{public}@", buf, 0xCu);
}

@end