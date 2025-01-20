@interface BRCTimerScheduler
- (BOOL)isCancelled;
- (BRCTimerScheduler)initWithAccountSession:(id)a3 timerName:(id)a4 sqlTable:(id)a5 field:(id)a6 timerHandler:(id)a7;
- (void)cancel;
- (void)close;
- (void)reschedule;
- (void)resume;
@end

@implementation BRCTimerScheduler

- (BRCTimerScheduler)initWithAccountSession:(id)a3 timerName:(id)a4 sqlTable:(id)a5 field:(id)a6 timerHandler:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)BRCTimerScheduler;
  v17 = [(BRCTimerScheduler *)&v23 init];
  v18 = v17;
  if (v17)
  {
    v17->_isCancelled = 0;
    objc_storeStrong((id *)&v17->_session, a3);
    v18->_suspended = 1;
    objc_storeStrong((id *)&v18->_name, a4);
    objc_storeStrong((id *)&v18->_sqlTable, a5);
    objc_storeStrong((id *)&v18->_field, a6);
    uint64_t v19 = MEMORY[0x1D94389C0](v16);
    id handler = v18->_handler;
    v18->_id handler = (id)v19;
  }
  return v18;
}

- (void)close
{
  if (!self->_isCancelled) {
    [(BRCTimerScheduler *)self cancel];
  }
}

- (void)resume
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: can't resume timer scheduler when already canceled: %@%@");
}

uint64_t __27__BRCTimerScheduler_resume__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 64))
  {
    uint64_t v2 = result;
    (*(void (**)(void))(*(void *)(v1 + 56) + 16))();
    v3 = *(void **)(v2 + 32);
    return [v3 reschedule];
  }
  return result;
}

void __27__BRCTimerScheduler_resume__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

uint64_t __27__BRCTimerScheduler_resume__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) reschedule];
}

- (void)cancel
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: timer scheduler already canceled: %@%@");
}

- (void)reschedule
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Reschedule %@%@");
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_field, 0);
  objc_storeStrong((id *)&self->_sqlTable, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end