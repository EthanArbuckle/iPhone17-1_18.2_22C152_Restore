@interface FPRTCReportingSessionManager
+ (NSDictionary)sessionInfo;
+ (id)defaultManager;
- (FPRTCReportingSessionManager)init;
- (id)sessionForDomainID:(id)a3 providerVersion:(id)a4;
- (id)sessionForProviderID:(id)a3 version:(id)a4;
- (id)sessionWithCommonProperties:(id)a3;
- (void)flushMessagesWithCompletion:(id)a3;
- (void)postMultipleReports:(id)a3 type:(unint64_t)a4 userinfo:(id)a5 session:(id)a6 observer:(id)a7;
- (void)postReportWithCategory:(unint64_t)a3 type:(unint64_t)a4 payload:(id)a5 error:(id)a6 decoratedPayload:(id)a7 session:(id)a8 observer:(id)a9;
- (void)postReportWithCategory:(unint64_t)a3 type:(unint64_t)a4 payload:(id)a5 userinfo:(id)a6 error:(id)a7 decoratedPayload:(id)a8 session:(id)a9 observer:(id)a10;
- (void)waitUntilTelemetrySessionIsAvailable:(unint64_t)a3 retryDuration:(unint64_t)a4;
@end

@implementation FPRTCReportingSessionManager

+ (NSDictionary)sessionInfo
{
  v10[6] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F62A68];
  v9[0] = *MEMORY[0x263F62A60];
  v9[1] = v2;
  v10[0] = &unk_27001C548;
  v10[1] = &unk_27001C560;
  v9[2] = *MEMORY[0x263F62AA8];
  v3 = NSNumber;
  atomic_fetch_add(nextSessionID_sessionId, 1u);
  v4 = objc_msgSend(v3, "numberWithUnsignedInt:");
  uint64_t v5 = *MEMORY[0x263F62A50];
  v10[2] = v4;
  v10[3] = @"com.apple.FileProviderDaemon";
  uint64_t v6 = *MEMORY[0x263F62A40];
  v9[3] = v5;
  v9[4] = v6;
  v9[5] = *MEMORY[0x263F62A78];
  v10[4] = MEMORY[0x263EFFA80];
  v10[5] = MEMORY[0x263EFFA88];
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:6];

  return (NSDictionary *)v7;
}

- (FPRTCReportingSessionManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)FPRTCReportingSessionManager;
  uint64_t v2 = [(FPRTCReportingSessionManager *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.FileProvider.rtcreporting", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    dispatch_group_t v6 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v6;
  }
  return v2;
}

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global);
  }
  uint64_t v2 = (void *)defaultManager_defaultManager;

  return v2;
}

uint64_t __46__FPRTCReportingSessionManager_defaultManager__block_invoke()
{
  defaultManager_defaultManager = objc_alloc_init(FPRTCReportingSessionManager);

  return MEMORY[0x270F9A758]();
}

- (id)sessionForProviderID:(id)a3 version:(id)a4
{
  v21[2] = *MEMORY[0x263EF8340];
  if (a4)
  {
    v20[0] = @"provider";
    v20[1] = @"providerVersion";
    v21[0] = a3;
    v21[1] = a4;
    dispatch_group_t v6 = NSDictionary;
    id v7 = a4;
    id v8 = a3;
    objc_super v9 = (id *)v21;
    v10 = (__CFString **)v20;
    v11 = v6;
    uint64_t v12 = 2;
  }
  else
  {
    v18 = @"provider";
    id v19 = a3;
    v13 = NSDictionary;
    id v7 = 0;
    id v14 = a3;
    objc_super v9 = &v19;
    v10 = &v18;
    v11 = v13;
    uint64_t v12 = 1;
  }
  v15 = [v11 dictionaryWithObjects:v9 forKeys:v10 count:v12];

  v16 = [(FPRTCReportingSessionManager *)self sessionWithCommonProperties:v15];

  return v16;
}

- (id)sessionWithCommonProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[FPRTCReportingSession alloc] initWithWithCommonProperties:v4 manager:self];

  return v5;
}

- (id)sessionForDomainID:(id)a3 providerVersion:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "fp_toProviderID");
  id v8 = [(FPRTCReportingSessionManager *)self sessionForProviderID:v7 version:v6];

  return v8;
}

- (void)postReportWithCategory:(unint64_t)a3 type:(unint64_t)a4 payload:(id)a5 userinfo:(id)a6 error:(id)a7 decoratedPayload:(id)a8 session:(id)a9 observer:(id)a10
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __117__FPRTCReportingSessionManager_postReportWithCategory_type_payload_userinfo_error_decoratedPayload_session_observer___block_invoke;
  block[3] = &unk_265314290;
  block[4] = self;
  id v30 = v19;
  id v31 = v18;
  id v32 = v15;
  id v33 = v17;
  id v34 = v20;
  unint64_t v36 = a3;
  unint64_t v37 = a4;
  id v35 = v16;
  id v22 = v16;
  id v23 = v20;
  id v24 = v17;
  id v25 = v15;
  id v26 = v18;
  id v27 = v19;
  dispatch_async(queue, block);
}

void __117__FPRTCReportingSessionManager_postReportWithCategory_type_payload_userinfo_error_decoratedPayload_session_observer___block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2
    && *(void *)(a1 + 48)
    && (objc_msgSend(v2, "executeModifyDecoratedPayloadHook:type:payload:error:decoratedPayload:", *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 56), *(void *)(a1 + 64)), !objc_msgSend(*(id *)(a1 + 48), "count")))
  {
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 72) reportDiscardedOnSession:*(void *)(a1 + 40) category:*(void *)(a1 + 88) type:*(void *)(a1 + 96) payload:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
    }
    id v14 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    dispatch_group_leave(v14);
  }
  else
  {
    v3 = *(void **)(a1 + 48);
    if (!v3) {
      v3 = *(void **)(a1 + 56);
    }
    id v4 = v3;
    uint64_t v5 = (void *)MEMORY[0x263F62A08];
    id v6 = +[FPRTCReportingSessionManager sessionInfo];
    uint64_t v7 = *(void *)(a1 + 80);
    uint64_t v8 = *(unsigned __int16 *)(a1 + 88);
    uint64_t v9 = *(unsigned __int16 *)(a1 + 96);
    id v15 = 0;
    int v10 = [v5 sendOneMessageWithSessionInfo:v6 userInfo:v7 category:v8 type:v9 payload:v4 error:&v15];
    id v11 = v15;

    uint64_t v12 = fp_current_or_default_log();
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __117__FPRTCReportingSessionManager_postReportWithCategory_type_payload_userinfo_error_decoratedPayload_session_observer___block_invoke_cold_1(v4, v13);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __117__FPRTCReportingSessionManager_postReportWithCategory_type_payload_userinfo_error_decoratedPayload_session_observer___block_invoke_cold_2(v11);
    }

    [*(id *)(a1 + 72) reportSentOnSession:*(void *)(a1 + 40) category:*(void *)(a1 + 88) type:*(void *)(a1 + 96) payload:v4 error:v11];
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 16));
  }
}

- (void)postMultipleReports:(id)a3 type:(unint64_t)a4 userinfo:(id)a5 session:(id)a6 observer:(id)a7
{
  v29[2] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v13)
  {
    uint64_t v16 = *MEMORY[0x263F62AC8];
    v28[0] = *MEMORY[0x263F62AB8];
    v28[1] = v16;
    v29[0] = @"fileprovider";
    v29[1] = @"fpfs";
    id v13 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke;
  block[3] = &unk_265314308;
  block[4] = self;
  id v23 = v13;
  id v24 = v12;
  id v25 = v14;
  id v26 = v15;
  unint64_t v27 = a4;
  id v18 = v15;
  id v19 = v14;
  id v20 = v12;
  id v21 = v13;
  dispatch_async(queue, block);
}

void __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v2 = objc_alloc(MEMORY[0x263F62A08]);
  v3 = +[FPRTCReportingSessionManager sessionInfo];
  id v18 = (id)[v2 initWithSessionInfo:v3 userInfo:*(void *)(a1 + 40) frameworksToCheck:0];

  id v4 = (void *)v14[5];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_24;
  v7[3] = &unk_2653142E0;
  v7[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 72);
  id v8 = v5;
  uint64_t v12 = v6;
  id v9 = *(id *)(a1 + 56);
  id v11 = &v13;
  id v10 = *(id *)(a1 + 64);
  [v4 startConfigurationWithCompletionHandler:v7];

  _Block_object_dispose(&v13, 8);
}

void __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_24(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v28 = v3;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v43 = 0u;
    long long v42 = 0u;
    id obj = *(id *)(a1 + 40);
    uint64_t v31 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
    id v5 = 0;
    if (v31)
    {
      uint64_t v30 = *(void *)v43;
      uint64_t v35 = *MEMORY[0x263F62A18];
      uint64_t v34 = *MEMORY[0x263F62A30];
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v43 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = v6;
          uint64_t v7 = *(void **)(*((void *)&v42 + 1) + 8 * v6);
          unsigned int v8 = [v7 unsignedIntValue];
          id v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v33 = v9;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v48 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v39;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                id v14 = v5;
                if (*(void *)v39 != v12) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                uint64_t v16 = (void *)[v15 mutableCopy];
                id v17 = [NSNumber numberWithUnsignedInteger:v8];
                [v16 setObject:v17 forKey:v35];

                id v18 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
                [v16 setObject:v18 forKey:v34];

                id v19 = *(void **)(a1 + 48);
                if (v19) {
                  [v19 executeModifyDecoratedPayloadHook:v8 type:*(void *)(a1 + 72) payload:v15 error:0 decoratedPayload:v16];
                }
                id v20 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
                uint64_t v21 = *(unsigned __int16 *)(a1 + 72);
                id v37 = v14;
                int v22 = [v20 sendMessageWithCategory:(unsigned __int16)v8 type:v21 payload:v16 error:&v37];
                id v5 = v37;

                id v23 = fp_current_or_default_log();
                id v24 = v23;
                if (v22)
                {
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
                    __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_24_cold_2((uint64_t)v47, (uint64_t)v16);
                  }
                }
                else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_24_cold_3((uint64_t)v46, (uint64_t)v5);
                }

                [*(id *)(a1 + 56) reportSentOnSession:*(void *)(a1 + 48) category:v8 type:*(void *)(a1 + 72) payload:v16 error:v5];
              }
              uint64_t v11 = [v33 countByEnumeratingWithState:&v38 objects:v48 count:16];
            }
            while (v11);
          }

          uint64_t v6 = v32 + 1;
        }
        while (v32 + 1 != v31);
        uint64_t v31 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
      }
      while (v31);
    }

    uint64_t v25 = *(void *)(a1 + 64);
    id v26 = *(void **)(*(void *)(v25 + 8) + 40);
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_25;
    v36[3] = &unk_2653142B8;
    v36[4] = *(void *)(a1 + 32);
    v36[5] = v25;
    [v26 flushMessagesWithCompletion:v36];

    id v4 = v28;
  }
  else
  {
    unint64_t v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_24_cold_1(v27);
    }

    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 16));
  }
}

void __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_25(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_25_cold_1(v3);
    }
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 16));
}

- (void)postReportWithCategory:(unint64_t)a3 type:(unint64_t)a4 payload:(id)a5 error:(id)a6 decoratedPayload:(id)a7 session:(id)a8 observer:(id)a9
{
  v25[2] = *MEMORY[0x263EF8340];
  uint64_t v16 = *MEMORY[0x263F62AC8];
  v24[0] = *MEMORY[0x263F62AB8];
  v24[1] = v16;
  v25[0] = @"fileprovider";
  v25[1] = @"fpfs";
  id v17 = NSDictionary;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = [v17 dictionaryWithObjects:v25 forKeys:v24 count:2];
  [(FPRTCReportingSessionManager *)self postReportWithCategory:a3 type:a4 payload:v22 userinfo:v23 error:v21 decoratedPayload:v20 session:v19 observer:v18];
}

- (void)flushMessagesWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_29);
  p_queue = &self->_queue;
  queue = self->_queue;
  uint64_t v6 = p_queue[1];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__FPRTCReportingSessionManager_flushMessagesWithCompletion___block_invoke_2;
  block[3] = &unk_265314330;
  id v10 = v4;
  id v8 = v4;
  dispatch_group_notify(v6, queue, block);
}

uint64_t __60__FPRTCReportingSessionManager_flushMessagesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)waitUntilTelemetrySessionIsAvailable:(unint64_t)a3 retryDuration:(unint64_t)a4
{
  v27[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F62AC8];
  v26[0] = *MEMORY[0x263F62AB8];
  v26[1] = v6;
  v27[0] = @"fileprovider";
  v27[1] = @"fpfs";
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  if (a3)
  {
    int64_t v8 = 1000000000 * a4;
    unint64_t v9 = a3 - 1;
    uint64_t v10 = MEMORY[0x263EF8330];
    do
    {
      id v11 = objc_alloc(MEMORY[0x263F62A08]);
      uint64_t v12 = +[FPRTCReportingSessionManager sessionInfo];
      uint64_t v13 = (void *)[v11 initWithSessionInfo:v12 userInfo:v7 frameworksToCheck:0];

      uint64_t v22 = 0;
      id v23 = &v22;
      uint64_t v24 = 0x2020000000;
      char v25 = 0;
      dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
      v19[0] = v10;
      v19[1] = 3221225472;
      v19[2] = __83__FPRTCReportingSessionManager_waitUntilTelemetrySessionIsAvailable_retryDuration___block_invoke;
      v19[3] = &unk_265314358;
      id v21 = &v22;
      uint64_t v15 = v14;
      id v20 = v15;
      [v13 startConfigurationWithCompletionHandler:v19];
      dispatch_time_t v16 = dispatch_time(0, v8);
      dispatch_semaphore_wait(v15, v16);

      sleep(1u);
      BOOL v17 = *((unsigned char *)v23 + 24) != 0;

      _Block_object_dispose(&v22, 8);
      if (v9) {
        char v18 = v17;
      }
      else {
        char v18 = 1;
      }
      --v9;
    }
    while ((v18 & 1) == 0);
  }
}

intptr_t __83__FPRTCReportingSessionManager_waitUntilTelemetrySessionIsAvailable_retryDuration___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 != 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __117__FPRTCReportingSessionManager_postReportWithCategory_type_payload_userinfo_error_decoratedPayload_session_observer___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = [a1 description];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_24E024000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] FPRTCReporting: RTC message sent %@", v4, 0xCu);
}

void __117__FPRTCReportingSessionManager_postReportWithCategory_type_payload_userinfo_error_decoratedPayload_session_observer___block_invoke_cold_2(void *a1)
{
  v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24E024000, v2, v3, "[ERROR] FPRTCReporting: error: unable to send RTC message: %@", v4, v5, v6, v7, v8);
}

void __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_24_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24E024000, log, OS_LOG_TYPE_ERROR, "[ERROR] Failed to configure RTC session", v1, 2u);
}

void __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_24_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = objc_msgSend((id)OUTLINED_FUNCTION_2(a1, a2), "description");
  *(_DWORD *)uint64_t v4 = 138412290;
  void *v3 = v5;
  _os_log_debug_impl(&dword_24E024000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] FPRTCReporting: RTC message sent %@", v4, 0xCu);
}

void __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_24_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = objc_msgSend((id)OUTLINED_FUNCTION_2(a1, a2), "fp_prettyDescription");
  *(_DWORD *)uint64_t v4 = 138412290;
  void *v3 = v5;
  _os_log_error_impl(&dword_24E024000, v2, OS_LOG_TYPE_ERROR, "[ERROR] FPRTCReporting: error: unable to send RTC message: %@", v4, 0xCu);
}

void __83__FPRTCReportingSessionManager_postMultipleReports_type_userinfo_session_observer___block_invoke_25_cold_1(void *a1)
{
  v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24E024000, v2, v3, "[ERROR] FPRTCReporting: flushsing session failed: %@", v4, v5, v6, v7, v8);
}

@end