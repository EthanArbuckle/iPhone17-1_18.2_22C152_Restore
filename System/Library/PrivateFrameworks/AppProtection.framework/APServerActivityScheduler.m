@interface APServerActivityScheduler
- (void)registerWeeklyActivityWithName:(id)a3 work:(id)a4;
@end

@implementation APServerActivityScheduler

- (void)registerWeeklyActivityWithName:(id)a3 work:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);
  xpc_dictionary_set_int64(v7, (const char *)*MEMORY[0x263EF81D8], *MEMORY[0x263EF8218]);
  xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x263EF82A0], 1);
  id v8 = v6;
  v9 = (const char *)[v8 UTF8String];

  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __65__APServerActivityScheduler_registerWeeklyActivityWithName_work___block_invoke;
  handler[3] = &unk_26522C180;
  id v12 = v5;
  id v10 = v5;
  xpc_activity_register(v9, v7, handler);
}

void __65__APServerActivityScheduler_registerWeeklyActivityWithName_work___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    if (xpc_activity_set_state((xpc_activity_t)v3, 4))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __65__APServerActivityScheduler_registerWeeklyActivityWithName_work___block_invoke_2;
      v6[3] = &unk_26522C108;
      xpc_object_t v7 = v3;
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
      id v5 = v7;
    }
    else
    {
      id v5 = APDefaultFrameworkLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __65__APServerActivityScheduler_registerWeeklyActivityWithName_work___block_invoke_cold_1(v5);
      }
    }
  }
}

void __65__APServerActivityScheduler_registerWeeklyActivityWithName_work___block_invoke_2(uint64_t a1)
{
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
  {
    v1 = APDefaultFrameworkLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __65__APServerActivityScheduler_registerWeeklyActivityWithName_work___block_invoke_2_cold_1(v1);
    }
  }
}

void __65__APServerActivityScheduler_registerWeeklyActivityWithName_work___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_247D2E000, log, OS_LOG_TYPE_ERROR, "Couldn't mark activity continuing?", v1, 2u);
}

void __65__APServerActivityScheduler_registerWeeklyActivityWithName_work___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_247D2E000, log, OS_LOG_TYPE_ERROR, "Couldn't mark activity done?", v1, 2u);
}

@end