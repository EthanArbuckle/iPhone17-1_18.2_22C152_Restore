@interface CNCoalescingTimer
+ (OS_os_log)os_log;
- (BOOL)isSomeoneWaiting;
- (BOOL)open;
- (CNCancelable)scheduledToken;
- (CNCoalescingTimer)initWithDelay:(double)a3 options:(unint64_t)a4 block:(id)a5 schedulerProvider:(id)a6 downstreamScheduler:(id)a7;
- (CNCoalescingTimer)initWithDelay:(double)a3 options:(unint64_t)a4 delegate:(id)a5;
- (CNScheduler)delayScheduler;
- (CNScheduler)downstreamScheduler;
- (CNUnfairLock)resourceLock;
- (double)delay;
- (id)block;
- (unint64_t)options;
- (void)dealloc;
- (void)handleEvent;
- (void)nts_closeDoor;
- (void)nts_letSomeoneIn;
- (void)nts_makeSomeoneWait;
- (void)nts_openDoor;
- (void)setOpen:(BOOL)a3;
- (void)setScheduledToken:(id)a3;
- (void)setSomeoneWaiting:(BOOL)a3;
@end

@implementation CNCoalescingTimer

- (CNCoalescingTimer)initWithDelay:(double)a3 options:(unint64_t)a4 delegate:(id)a5
{
  id v8 = a5;
  objc_initWeak(&location, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__CNCoalescingTimer_initWithDelay_options_delegate___block_invoke;
  v16[3] = &unk_1E569FDB8;
  objc_copyWeak(&v18, &location);
  v17 = self;
  v9 = +[CNEnvironmentBase currentEnvironment];
  v10 = [v9 schedulerProvider];
  v11 = +[CNEnvironmentBase currentEnvironment];
  v12 = [v11 schedulerProvider];
  v13 = [v12 backgroundScheduler];
  v14 = [(CNCoalescingTimer *)v17 initWithDelay:a4 options:v16 block:v10 schedulerProvider:v13 downstreamScheduler:a3];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v14;
}

- (CNCoalescingTimer)initWithDelay:(double)a3 options:(unint64_t)a4 block:(id)a5 schedulerProvider:(id)a6 downstreamScheduler:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CNCoalescingTimer;
  v15 = [(CNCoalescingTimer *)&v25 init];
  v16 = v15;
  if (v15)
  {
    v15->_delay = a3;
    uint64_t v17 = [v12 copy];
    id block = v16->_block;
    v16->_id block = (id)v17;

    v16->_options = a4;
    objc_storeStrong((id *)&v16->_downstreamScheduler, a7);
    v19 = objc_alloc_init(CNUnfairLock);
    resourceLock = v16->_resourceLock;
    v16->_resourceLock = v19;

    uint64_t v21 = [v13 backgroundScheduler];
    delayScheduler = v16->_delayScheduler;
    v16->_delayScheduler = (CNScheduler *)v21;

    *(_WORD *)&v16->_open = 1;
    v23 = v16;
  }

  return v16;
}

+ (OS_os_log)os_log
{
  if (os_log_cn_once_token_1_0 != -1) {
    dispatch_once(&os_log_cn_once_token_1_0, &__block_literal_global_15);
  }
  v2 = (void *)os_log_cn_once_object_1_0;

  return (OS_os_log *)v2;
}

uint64_t __27__CNCoalescingTimer_os_log__block_invoke()
{
  os_log_cn_once_object_1_0 = (uint64_t)os_log_create("com.apple.contacts.foundation", "coalescing-timer");

  return MEMORY[0x1F41817F8]();
}

void __52__CNCoalescingTimer_initWithDelay_options_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained timerDidEmitEvent:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  [(CNCancelable *)self->_scheduledToken cancel];
  v3.receiver = self;
  v3.super_class = (Class)CNCoalescingTimer;
  [(CNCoalescingTimer *)&v3 dealloc];
}

- (void)handleEvent
{
  objc_super v3 = [(CNCoalescingTimer *)self resourceLock];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__CNCoalescingTimer_handleEvent__block_invoke;
  v4[3] = &unk_1E569F9D8;
  v4[4] = self;
  CNRunWithLock(v3, v4);
}

uint64_t __32__CNCoalescingTimer_handleEvent__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) options] & 1) != 0
    && objc_msgSend(*(id *)(a1 + 32), "nts_isDoorOpened"))
  {
    v2 = *(void **)(a1 + 32);
    return objc_msgSend(v2, "nts_letSomeoneIn");
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "nts_isDoorOpened")) {
      objc_msgSend(*(id *)(a1 + 32), "nts_closeDoor");
    }
    v4 = *(void **)(a1 + 32);
    return objc_msgSend(v4, "nts_makeSomeoneWait");
  }
}

- (void)nts_letSomeoneIn
{
  [(CNCoalescingTimer *)self setSomeoneWaiting:0];
  [(CNCoalescingTimer *)self nts_closeDoor];
  id v4 = [(CNCoalescingTimer *)self downstreamScheduler];
  objc_super v3 = [(CNCoalescingTimer *)self block];
  [v4 performBlock:v3];
}

- (void)nts_makeSomeoneWait
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19091D000, log, OS_LOG_TYPE_DEBUG, "Coalescing event", v1, 2u);
}

- (void)nts_openDoor
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19091D000, log, OS_LOG_TYPE_DEBUG, "Emitting coalesced event", v1, 2u);
}

- (void)nts_closeDoor
{
  [(CNCoalescingTimer *)self setOpen:0];
  objc_super v3 = [(CNCoalescingTimer *)self delayScheduler];
  [(CNCoalescingTimer *)self delay];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__CNCoalescingTimer_nts_closeDoor__block_invoke;
  v5[3] = &unk_1E569F9D8;
  v5[4] = self;
  id v4 = objc_msgSend(v3, "afterDelay:performBlock:", v5);
  [(CNCoalescingTimer *)self setScheduledToken:v4];
}

void __34__CNCoalescingTimer_nts_closeDoor__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) resourceLock];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__CNCoalescingTimer_nts_closeDoor__block_invoke_2;
  v3[3] = &unk_1E569F9D8;
  v3[4] = *(void *)(a1 + 32);
  CNRunWithLock(v2, v3);
}

uint64_t __34__CNCoalescingTimer_nts_closeDoor__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_openDoor");
}

- (CNCancelable)scheduledToken
{
  return self->_scheduledToken;
}

- (void)setScheduledToken:(id)a3
{
}

- (CNUnfairLock)resourceLock
{
  return self->_resourceLock;
}

- (CNScheduler)delayScheduler
{
  return self->_delayScheduler;
}

- (CNScheduler)downstreamScheduler
{
  return self->_downstreamScheduler;
}

- (id)block
{
  return self->_block;
}

- (double)delay
{
  return self->_delay;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)open
{
  return self->_open;
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (BOOL)isSomeoneWaiting
{
  return self->_someoneWaiting;
}

- (void)setSomeoneWaiting:(BOOL)a3
{
  self->_someoneWaiting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_downstreamScheduler, 0);
  objc_storeStrong((id *)&self->_delayScheduler, 0);
  objc_storeStrong((id *)&self->_resourceLock, 0);

  objc_storeStrong((id *)&self->_scheduledToken, 0);
}

@end