@interface CNOffMainThreadScheduler
@end

@implementation CNOffMainThreadScheduler

uint64_t __42___CNOffMainThreadScheduler_performBlock___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v2 = +[_CNOffMainThreadScheduler os_log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __42___CNOffMainThreadScheduler_performBlock___block_invoke_cold_1();
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __35___CNOffMainThreadScheduler_os_log__block_invoke()
{
  os_log_cn_once_object_1_1 = (uint64_t)os_log_create("com.apple.contacts.reactive-extensions", "scheduling");

  return MEMORY[0x1F41817F8]();
}

uint64_t __59___CNOffMainThreadScheduler_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v2 = +[_CNOffMainThreadScheduler os_log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __42___CNOffMainThreadScheduler_performBlock___block_invoke_cold_1();
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __52___CNOffMainThreadScheduler_performCancelableBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v4 = +[_CNOffMainThreadScheduler os_log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42___CNOffMainThreadScheduler_performBlock___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __69___CNOffMainThreadScheduler_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v4 = +[_CNOffMainThreadScheduler os_log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42___CNOffMainThreadScheduler_performBlock___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __53___CNOffMainThreadScheduler_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v2 = +[_CNOffMainThreadScheduler os_log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __42___CNOffMainThreadScheduler_performBlock___block_invoke_cold_1();
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __70___CNOffMainThreadScheduler_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v2 = +[_CNOffMainThreadScheduler os_log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __42___CNOffMainThreadScheduler_performBlock___block_invoke_cold_1();
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __42___CNOffMainThreadScheduler_performBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  [MEMORY[0x1E4F29060] isMainThread];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19091D000, v0, v1, "Work was requested to be performed off the main thread, but scheduler %{public}@ is performing on the main thread", v2, v3, v4, v5, v6);
}

@end