@interface CNBlockFutureImpl
@end

@implementation CNBlockFutureImpl

uint64_t __43___CNBlockFutureImpl_implicitlyResumeQueue__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) workBlockScheduled];
  if (result)
  {
    uint64_t result = objc_msgSend(*(id *)(a1 + 32), "nts_mayResumeQueue");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __33___CNBlockFutureImpl_resumeQueue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_resumeQueue");
}

void __38___CNBlockFutureImpl_addFailureBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = [WeakRetained futureResult];
    v5 = [v4 result];

    if (!v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      v7 = [v4 error];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
  }
  else
  {
    v4 = +[_CNBlockFutureImpl log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __38___CNBlockFutureImpl_addFailureBlock___block_invoke_cold_1();
    }
  }
}

void __38___CNBlockFutureImpl_addSuccessBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = [WeakRetained futureResult];
    v5 = [v4 result];

    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      v7 = [v4 result];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
  }
  else
  {
    v4 = +[_CNBlockFutureImpl log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __38___CNBlockFutureImpl_addSuccessBlock___block_invoke_cold_1();
    }
  }
}

uint64_t __25___CNBlockFutureImpl_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "futures");
  uint64_t v1 = log_cn_once_object_1;
  log_cn_once_object_1 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void __54___CNBlockFutureImpl_implWithSchedulerProvider_block___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = 0;
  v3 = (*(void (**)(void))(v2 + 16))();
  id v4 = v5;
  [*(id *)(a1 + 32) finishWithResult:v3 error:v4];
}

void __58___CNBlockFutureImpl_lazyImplWithSchedulerProvider_block___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v6 = 0;
  v3 = (*(void (**)(void))(v2 + 16))();
  id v4 = v6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained finishWithResult:v3 error:v4];
}

void __37___CNBlockFutureImpl_addWriterBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

void __73___CNBlockFutureImpl_futureResultFromAsynchronousLookupBeforeDate_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (!WeakRetained)
  {
    v8 = +[_CNBlockFutureImpl log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __73___CNBlockFutureImpl_futureResultFromAsynchronousLookupBeforeDate_error___block_invoke_cold_1();
    }
    goto LABEL_6;
  }
  id v4 = [WeakRetained stateLock];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 lockWhenCondition:1 beforeDate:*(void *)(a1 + 40)];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v5 = [v3 futureResultFromImmediateLookup];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = [v3 stateLock];
    [v8 unlock];
LABEL_6:
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __73___CNBlockFutureImpl_futureResultFromAsynchronousLookupBeforeDate_error___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73___CNBlockFutureImpl_futureResultFromAsynchronousLookupBeforeDate_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_19091D000, v0, v1, "The result cannot be looked up because the future has deallocated", v2, v3, v4, v5, v6);
}

void __38___CNBlockFutureImpl_addSuccessBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_19091D000, v0, v1, "A success block was registered and might have run, depending on the result, but the result is not available because the future has deallocated", v2, v3, v4, v5, v6);
}

void __38___CNBlockFutureImpl_addFailureBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_19091D000, v0, v1, "A failure block was registered and might have run, depending on the result, but the result is not available because the future has deallocated", v2, v3, v4, v5, v6);
}

@end