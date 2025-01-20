@interface BRCAutoCancelOperation
- (BOOL)hasObservers;
- (BOOL)shouldRetryForError:(id)a3;
- (BRCAutoCancelOperation)initWithName:(id)a3 syncContext:(id)a4 sessionContext:(id)a5 group:(id)a6;
- (id)createActivity;
- (void)_initializeCancelTimer;
- (void)beginObservingChanges;
- (void)dealloc;
- (void)endObservingChanges;
@end

@implementation BRCAutoCancelOperation

- (BRCAutoCancelOperation)initWithName:(id)a3 syncContext:(id)a4 sessionContext:(id)a5 group:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)BRCAutoCancelOperation;
  v6 = [(_BRCOperation *)&v10 initWithName:a3 syncContext:a4 sessionContext:a5 group:a6];
  if (v6)
  {
    dispatch_group_t v7 = dispatch_group_create();
    observersGroup = v6->_observersGroup;
    v6->_observersGroup = (OS_dispatch_group *)v7;
  }
  return v6;
}

- (void)beginObservingChanges
{
  dispatch_group_enter((dispatch_group_t)self->_observersGroup);
  cancelTimer = self->_cancelTimer;
  if (cancelTimer)
  {
    dispatch_source_cancel(cancelTimer);
  }
}

- (void)endObservingChanges
{
}

- (void)_initializeCancelTimer
{
  v3 = [(_BRCOperation *)self callbackQueue];
  objc_initWeak(&location, self);
  observersGroup = self->_observersGroup;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__BRCAutoCancelOperation__initializeCancelTimer__block_invoke;
  block[3] = &unk_1E6996998;
  objc_copyWeak(&v8, &location);
  id v7 = v3;
  v5 = v3;
  dispatch_group_notify(observersGroup, v5, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __48__BRCAutoCancelOperation__initializeCancelTimer__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1 + 32));
    v5 = +[BRCUserDefaults defaultsForMangledID:0];
    dispatch_time_t v6 = dispatch_time(0, [v5 listDirChangesCancelDelay]);

    dispatch_source_set_timer(v4, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __48__BRCAutoCancelOperation__initializeCancelTimer__block_invoke_2;
    v18[3] = &unk_1E6993C50;
    objc_copyWeak(&v19, v2);
    id v7 = v4;
    id v8 = v18;
    v9 = v7;
    objc_super v10 = v8;
    v11 = v10;
    v12 = v10;
    if (*MEMORY[0x1E4F59658])
    {
      v12 = ((void (*)(void *))*MEMORY[0x1E4F59658])(v10);
    }
    dispatch_block_t v13 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v12);
    dispatch_source_set_event_handler(v9, v13);

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __48__BRCAutoCancelOperation__initializeCancelTimer__block_invoke_2;
    v16[3] = &unk_1E6993C50;
    objc_copyWeak(&v17, v2);
    dispatch_source_set_cancel_handler(v9, v16);
    v14 = (void *)WeakRetained[64];
    WeakRetained[64] = v9;
    v15 = v9;

    dispatch_resume(v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
  }
}

void __48__BRCAutoCancelOperation__initializeCancelTimer__block_invoke_2(uint64_t a1)
{
  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_group_t v3 = WeakRetained[64];
    WeakRetained[64] = 0;

    if (([(dispatch_group_t *)v2 isFinished] & 1) == 0
      && ([(dispatch_group_t *)v2 isCancelled] & 1) == 0)
    {
      if (dispatch_group_wait(v2[63], 0))
      {
        v4 = brc_bread_crumbs();
        v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          __48__BRCAutoCancelOperation__initializeCancelTimer__block_invoke_2_cold_2();
        }

        [(dispatch_group_t *)v2 _initializeCancelTimer];
      }
      else
      {
        dispatch_time_t v6 = brc_bread_crumbs();
        id v7 = brc_default_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          __48__BRCAutoCancelOperation__initializeCancelTimer__block_invoke_2_cold_1();
        }

        [(dispatch_group_t *)v2 cancel];
      }
    }
  }
}

{
  void *WeakRetained;
  void *v2;
  void *v3;
  uint64_t vars8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[64];
    WeakRetained[64] = 0;
    dispatch_group_t v3 = WeakRetained;

    WeakRetained = v3;
  }
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "BRCAutoCancelOperation/? (subclass activity missing)", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)hasObservers
{
  return dispatch_group_wait((dispatch_group_t)self->_observersGroup, 0) != 0;
}

- (void)dealloc
{
  for (i = self->_observersGroup; dispatch_group_wait(i, 0); i = self->_observersGroup)
    dispatch_group_leave((dispatch_group_t)self->_observersGroup);
  v4.receiver = self;
  v4.super_class = (Class)BRCAutoCancelOperation;
  [(_BRCOperation *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelTimer, 0);
  objc_storeStrong((id *)&self->_observersGroup, 0);
}

void __48__BRCAutoCancelOperation__initializeCancelTimer__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] No one is waiting on %@ anymore so cancelling%@");
}

void __48__BRCAutoCancelOperation__initializeCancelTimer__block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] We have observers again for %@ so not cancelling yet%@");
}

@end