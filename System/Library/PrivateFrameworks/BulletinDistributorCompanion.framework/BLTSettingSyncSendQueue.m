@interface BLTSettingSyncSendQueue
- (BLTSettingSyncSendQueue)init;
- (BLTSettingSyncSendQueue)initWithMaxConcurrentSendCount:(unint64_t)a3;
- (NSDictionary)iconAllowList;
- (id)sectionIconSender;
- (id)sectionInfoSender;
- (id)sectionParametersProvider;
- (id)sectionRemoveSender;
- (void)_sendEffectiveSectionInfo:(id)a3 waitForAcknowledgement:(BOOL)a4 withQueue:(id)a5 spoolToFile:(BOOL)a6 andCompletion:(id)a7;
- (void)_sendSectionIcon:(id)a3 forSectionID:(id)a4 forSubtypeID:(int64_t)a5 waitForAcknowledgement:(BOOL)a6 withQueue:(id)a7 spoolToFile:(BOOL)a8 andCompletion:(id)a9;
- (void)_sendSectionInfoWithSectionID:(unint64_t)a3 usingProvider:(id)a4 updateProgress:(id)a5 sendCompleted:(id)a6 sendAttempt:(unint64_t)a7 waitForAcknowledgement:(BOOL)a8 group:(id)a9 spoolToFile:(BOOL)a10;
- (void)sendEffectiveSectionInfosUsingProvider:(id)a3 count:(unint64_t)a4 sectionInfoSendCompleted:(id)a5 completion:(id)a6 progress:(id)a7 spoolToFile:(BOOL)a8;
- (void)sendRemoveSectionWithSectionID:(id)a3 sent:(id)a4;
- (void)sendSectionSubtypeParameterIcons:(id)a3 sectionID:(id)a4 waitForAcknowledgement:(BOOL)a5 spoolToFile:(BOOL)a6 completion:(id)a7;
- (void)sendSpooledRequestsNowWithSender:(id)a3 completion:(id)a4 progress:(id)a5;
- (void)setIconAllowList:(id)a3;
- (void)setSectionIconSender:(id)a3;
- (void)setSectionInfoSender:(id)a3;
- (void)setSectionParametersProvider:(id)a3;
- (void)setSectionRemoveSender:(id)a3;
@end

@implementation BLTSettingSyncSendQueue

- (BLTSettingSyncSendQueue)init
{
  return [(BLTSettingSyncSendQueue *)self initWithMaxConcurrentSendCount:1];
}

- (BLTSettingSyncSendQueue)initWithMaxConcurrentSendCount:(unint64_t)a3
{
  v22.receiver = self;
  v22.super_class = (Class)BLTSettingSyncSendQueue;
  v4 = [(BLTSettingSyncSendQueue *)&v22 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.bulletindistributord.sectioninfosenderqueue", v5);
    sectionInfoSenderQueue = v4->_sectionInfoSenderQueue;
    v4->_sectionInfoSenderQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.bulletindistributord.sectioninfoprocessingqueue", v8);
    sectionInfoProcessingQueue = v4->_sectionInfoProcessingQueue;
    v4->_sectionInfoProcessingQueue = (OS_dispatch_queue *)v9;

    dispatch_semaphore_t v11 = dispatch_semaphore_create(a3);
    sectionInfoSemaphore = v4->_sectionInfoSemaphore;
    v4->_sectionInfoSemaphore = (OS_dispatch_semaphore *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.bulletindistributord.subsectionparametericonsenderqueue", v13);
    subsectionParameterIconSenderQueue = v4->_subsectionParameterIconSenderQueue;
    v4->_subsectionParameterIconSenderQueue = (OS_dispatch_queue *)v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.bulletindistributord.subsectionparametericonprocessingqueue", v16);
    subsectionParameterIconProcessingQueue = v4->_subsectionParameterIconProcessingQueue;
    v4->_subsectionParameterIconProcessingQueue = (OS_dispatch_queue *)v17;

    dispatch_semaphore_t v19 = dispatch_semaphore_create(a3);
    subsectionParameterIconSemaphore = v4->_subsectionParameterIconSemaphore;
    v4->_subsectionParameterIconSemaphore = (OS_dispatch_semaphore *)v19;
  }
  return v4;
}

- (void)_sendSectionInfoWithSectionID:(unint64_t)a3 usingProvider:(id)a4 updateProgress:(id)a5 sendCompleted:(id)a6 sendAttempt:(unint64_t)a7 waitForAcknowledgement:(BOOL)a8 group:(id)a9 spoolToFile:(BOOL)a10
{
  BOOL v25 = a8;
  dispatch_queue_t v14 = (void (**)(id, unint64_t))a4;
  v15 = (void (**)(void))a5;
  id v16 = a6;
  id v17 = a9;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sectionInfoSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v18 = _os_activity_create(&dword_222F4C000, "Send Section Info", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v18, &state);
  dispatch_semaphore_t v19 = (void *)MEMORY[0x223CAC5D0]();
  v20 = v14[2](v14, a3);
  v21 = [v20 sectionID];
  objc_super v22 = v21;
  if (v20)
  {
    sectionInfoProcessingQueue = self->_sectionInfoProcessingQueue;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke;
    v26[3] = &unk_2646842A8;
    v26[4] = self;
    id v27 = v21;
    BOOL v34 = v25;
    BOOL v35 = a10;
    v29 = v15;
    id v30 = v16;
    unint64_t v32 = a7;
    id v28 = v17;
    unint64_t v33 = a3;
    v31 = v14;
    [(BLTSettingSyncSendQueue *)self _sendEffectiveSectionInfo:v20 waitForAcknowledgement:v25 withQueue:sectionInfoProcessingQueue spoolToFile:a10 andCompletion:v26];
  }
  else
  {
    v15[2](v15);
    (*((void (**)(id, void))v16 + 2))(v16, 0);
  }

  os_activity_scope_leave(&state);
}

void __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke(uint64_t a1, int a2, int a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  dispatch_queue_t v6 = blt_settings_log();
  v7 = v6;
  if (!a2 || !a3)
  {
    if (a2)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = v14;
        _os_log_impl(&dword_222F4C000, v7, OS_LOG_TYPE_DEFAULT, "Sent section info but nano failed to acknowledge with section ID %@", buf, 0xCu);
      }

      v15 = blt_settings_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 80);
        *(_DWORD *)buf = 134217984;
        uint64_t v42 = v16;
        _os_log_impl(&dword_222F4C000, v15, OS_LOG_TYPE_DEFAULT, "Current send attempts: %lu", buf, 0xCu);
      }

      unint64_t v17 = *(void *)(a1 + 80);
      v18 = blt_settings_log();
      v7 = v18;
      if (v17 < 3)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          uint64_t v42 = v19;
          _os_log_impl(&dword_222F4C000, v7, OS_LOG_TYPE_DEFAULT, "Enqueuing section ID %@ for future resend attempt", buf, 0xCu);
        }

        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
        uint64_t v20 = *(void *)(a1 + 32);
        v21 = *(NSObject **)(v20 + 8);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke_9;
        block[3] = &unk_264684280;
        uint64_t v22 = *(void *)(a1 + 88);
        block[4] = v20;
        uint64_t v30 = v22;
        id v27 = *(id *)(a1 + 72);
        id v28 = *(id *)(a1 + 56);
        id v23 = *(id *)(a1 + 64);
        uint64_t v24 = *(void *)(a1 + 80);
        id v29 = v23;
        uint64_t v31 = v24;
        char v32 = *(unsigned char *)(a1 + 96);
        id v26 = *(id *)(a1 + 48);
        char v33 = *(unsigned char *)(a1 + 97);
        dispatch_async(v21, block);

        goto LABEL_24;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke_cold_1(a1, v7);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke_cold_2(a1, v7);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_24:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    return;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222F4C000, v7, OS_LOG_TYPE_DEFAULT, "Section info sent", buf, 2u);
  }

  v8 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  if ([v8 BOOLValue]
    && ([*(id *)(a1 + 32) sectionParametersProvider],
        dispatch_queue_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    v10 = [*(id *)(a1 + 32) sectionParametersProvider];
    dispatch_semaphore_t v11 = *(void **)(a1 + 40);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke_5;
    v34[3] = &unk_264684258;
    id v12 = v11;
    uint64_t v13 = *(void *)(a1 + 32);
    id v35 = v12;
    uint64_t v36 = v13;
    __int16 v39 = *(_WORD *)(a1 + 96);
    id v37 = *(id *)(a1 + 56);
    id v38 = *(id *)(a1 + 64);
    char v40 = a3;
    ((void (**)(void, id, void *))v10)[2](v10, v12, v34);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = blt_settings_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v5;
    _os_log_impl(&dword_222F4C000, v4, OS_LOG_TYPE_DEFAULT, "Attempting to send subsection parameter icons for section ID %@", buf, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  dispatch_queue_t v6 = *(void **)(a1 + 40);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 65);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke_6;
  v10[3] = &unk_264684230;
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  char v13 = *(unsigned char *)(a1 + 66);
  [v6 sendSectionSubtypeParameterIcons:v3 sectionID:v7 waitForAcknowledgement:v8 spoolToFile:v9 completion:v10];
}

uint64_t __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke_9(uint64_t a1)
{
  LOBYTE(v2) = *(unsigned char *)(a1 + 89);
  return [*(id *)(a1 + 32) _sendSectionInfoWithSectionID:*(void *)(a1 + 72) usingProvider:*(void *)(a1 + 48) updateProgress:*(void *)(a1 + 56) sendCompleted:*(void *)(a1 + 64) sendAttempt:*(void *)(a1 + 80) + 1 waitForAcknowledgement:*(unsigned __int8 *)(a1 + 88) group:*(void *)(a1 + 40) spoolToFile:v2];
}

- (void)sendEffectiveSectionInfosUsingProvider:(id)a3 count:(unint64_t)a4 sectionInfoSendCompleted:(id)a5 completion:(id)a6 progress:(id)a7 spoolToFile:(BOOL)a8
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v30 = a3;
  id v14 = a5;
  id v28 = a6;
  id v15 = a7;
  dispatch_group_t v16 = dispatch_group_create();
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  v52[3] = 0;
  id v17 = objc_alloc_init(MEMORY[0x263F08958]);
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke;
  v47[3] = &unk_2646842D0;
  id v27 = v17;
  id v48 = v27;
  v50 = v52;
  id v29 = v15;
  id v49 = v29;
  unint64_t v51 = a4;
  v18 = (void *)MEMORY[0x223CAC810](v47);
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_2;
  v43[3] = &unk_264684320;
  id v26 = v14;
  id v46 = v26;
  uint64_t v19 = v16;
  v44 = v19;
  v45 = self;
  uint64_t v20 = (void *)MEMORY[0x223CAC810](v43);
  if (a4)
  {
    uint64_t v21 = 0;
    do
    {
      uint64_t v22 = blt_settings_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v54 = v21;
        _os_log_impl(&dword_222F4C000, v22, OS_LOG_TYPE_DEFAULT, "Queueing section ID Index %lu for send", buf, 0xCu);
      }

      dispatch_group_enter(v19);
      sectionInfoSenderQueue = self->_sectionInfoSenderQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_12;
      block[3] = &unk_264684370;
      block[4] = self;
      uint64_t v41 = v21;
      id v37 = v30;
      id v38 = v18;
      id v39 = v20;
      id v40 = v29;
      uint64_t v36 = v19;
      BOOL v42 = a8;
      dispatch_async(sectionInfoSenderQueue, block);

      ++v21;
    }
    while (a4 != v21);
  }
  uint64_t v24 = self->_sectionInfoSenderQueue;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_3_15;
  v31[3] = &unk_264684398;
  char v33 = v52;
  unint64_t v34 = a4;
  id v32 = v28;
  id v25 = v28;
  dispatch_group_notify(v19, v24, v31);

  _Block_object_dispose(v52, 8);
}

uint64_t __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) lock];
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(double))(v2 + 16))((double)*(unint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)/ (double)*(unint64_t *)(a1 + 56));
  }
  id v3 = *(void **)(a1 + 32);
  return [v3 unlock];
}

void __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_2(uint64_t a1, uint64_t a2, char a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_3;
  block[3] = &unk_2646842F8;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = a2;
  char v13 = a3;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = v6;
  uint64_t v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_4;
  block[3] = &unk_2646842F8;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v10 = v3;
  uint64_t v11 = v4;
  char v12 = *(unsigned char *)(a1 + 64);
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  dispatch_async(v2, block);
}

intptr_t __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v3 = *(NSObject **)(*(void *)(a1 + 40) + 24);
  return dispatch_semaphore_signal(v3);
}

void __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_12(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_2_13;
  v10[3] = &unk_264684348;
  id v6 = *(id *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  id v11 = v6;
  uint64_t v12 = v7;
  LOBYTE(v9) = *(unsigned char *)(a1 + 88);
  [v2 _sendSectionInfoWithSectionID:v3 usingProvider:v4 updateProgress:v5 sendCompleted:v10 sendAttempt:0 waitForAcknowledgement:v8 != 0 group:*(void *)(a1 + 40) spoolToFile:v9];
}

uint64_t __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_2_13(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

uint64_t __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_3_15(void *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = blt_settings_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[6];
    uint64_t v4 = *(void *)(*(void *)(a1[5] + 8) + 24);
    int v6 = 134218240;
    uint64_t v7 = v4;
    __int16 v8 = 2048;
    uint64_t v9 = v3;
    _os_log_impl(&dword_222F4C000, v2, OS_LOG_TYPE_DEFAULT, "Section info send queue completed; sent %lu of %lu items",
      (uint8_t *)&v6,
      0x16u);
  }

  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sendRemoveSectionWithSectionID:(id)a3 sent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sectionInfoSenderQueue = self->_sectionInfoSenderQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__BLTSettingSyncSendQueue_sendRemoveSectionWithSectionID_sent___block_invoke;
  block[3] = &unk_264683E50;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(sectionInfoSenderQueue, block);
}

void __63__BLTSettingSyncSendQueue_sendRemoveSectionWithSectionID_sent___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sectionRemoveSender];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) sectionRemoveSender];
    (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
}

- (void)sendSpooledRequestsNowWithSender:(id)a3 completion:(id)a4 progress:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  sectionInfoSenderQueue = self->_sectionInfoSenderQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__BLTSettingSyncSendQueue_sendSpooledRequestsNowWithSender_completion_progress___block_invoke;
  block[3] = &unk_2646843E8;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(sectionInfoSenderQueue, block);
}

void __80__BLTSettingSyncSendQueue_sendSpooledRequestsNowWithSender_completion_progress___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __80__BLTSettingSyncSendQueue_sendSpooledRequestsNowWithSender_completion_progress___block_invoke_3;
  v3[3] = &unk_2646843C0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, &__block_literal_global_4, v3);
}

uint64_t __80__BLTSettingSyncSendQueue_sendSpooledRequestsNowWithSender_completion_progress___block_invoke_3(uint64_t a1, __n128 a2)
{
  double v2 = a2.n128_f64[0];
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    uint64_t result = (*(uint64_t (**)(__n128))(result + 16))(a2);
  }
  if (v2 + -1.0 > -0.00000011920929)
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      id v5 = *(uint64_t (**)(__n128))(result + 16);
      a2.n128_f64[0] = v2 + -1.0;
      return v5(a2);
    }
  }
  return result;
}

- (void)sendSectionSubtypeParameterIcons:(id)a3 sectionID:(id)a4 waitForAcknowledgement:(BOOL)a5 spoolToFile:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = [v12 defaultSubtypeParameters];
  id v16 = [v15 sectionIconOverride];
  subsectionParameterIconSenderQueue = self->_subsectionParameterIconSenderQueue;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __116__BLTSettingSyncSendQueue_sendSectionSubtypeParameterIcons_sectionID_waitForAcknowledgement_spoolToFile_completion___block_invoke;
  v22[3] = &unk_264684438;
  id v23 = v16;
  id v24 = v13;
  BOOL v28 = a5;
  BOOL v29 = a6;
  id v25 = self;
  id v26 = v12;
  id v27 = v14;
  id v18 = v14;
  id v19 = v12;
  id v20 = v13;
  id v21 = v16;
  dispatch_async(subsectionParameterIconSenderQueue, v22);
}

uint64_t __116__BLTSettingSyncSendQueue_sendSectionSubtypeParameterIcons_sectionID_waitForAcknowledgement_spoolToFile_completion___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  double v2 = blt_settings_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = @"data";
    if (!*(void *)(a1 + 32)) {
      id v4 = @"nil";
    }
    *(_DWORD *)buf = 138412546;
    id v39 = v4;
    __int16 v40 = 2112;
    uint64_t v41 = v3;
    _os_log_impl(&dword_222F4C000, v2, OS_LOG_TYPE_DEFAULT, "Sending sectionSubtypeParameters icon (%@) for %@ defaults", buf, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v9 = v5[2];
  uint64_t v10 = *(unsigned __int8 *)(a1 + 73);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __116__BLTSettingSyncSendQueue_sendSectionSubtypeParameterIcons_sectionID_waitForAcknowledgement_spoolToFile_completion___block_invoke_24;
  v37[3] = &unk_264684410;
  v37[4] = v5;
  [v5 _sendSectionIcon:v7 forSectionID:v6 forSubtypeID:0x7FFFFFFFFFFFFFFFLL waitForAcknowledgement:v8 withQueue:v9 spoolToFile:v10 andCompletion:v37];
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 48) + 48), 0xFFFFFFFFFFFFFFFFLL);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [*(id *)(a1 + 56) allSubtypes];
  uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v31 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v34 != v31) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v15 = objc_msgSend(*(id *)(a1 + 56), "parametersForSubtype:", objc_msgSend(v14, "integerValue"));
        id v16 = [v15 sectionIconOverride];
        id v17 = blt_settings_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = [v16 variants];
          uint64_t v19 = [v18 count];
          uint64_t v20 = *(void *)(a1 + 40);
          id v21 = @"data";
          if (!v19) {
            id v21 = @"nil";
          }
          *(_DWORD *)buf = 138412802;
          id v39 = v21;
          __int16 v40 = 2112;
          uint64_t v41 = v20;
          __int16 v42 = 2112;
          uint64_t v43 = v14;
          _os_log_impl(&dword_222F4C000, v17, OS_LOG_TYPE_DEFAULT, "Sending sectionSubtypeParameters icon (%@) for %@ %@", buf, 0x20u);
        }
        uint64_t v23 = *(void *)(a1 + 40);
        uint64_t v22 = *(void **)(a1 + 48);
        uint64_t v24 = [v14 integerValue];
        uint64_t v25 = *(unsigned __int8 *)(a1 + 72);
        uint64_t v26 = *(void *)(a1 + 48);
        uint64_t v27 = *(void *)(v26 + 16);
        uint64_t v28 = *(unsigned __int8 *)(a1 + 73);
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __116__BLTSettingSyncSendQueue_sendSectionSubtypeParameterIcons_sectionID_waitForAcknowledgement_spoolToFile_completion___block_invoke_25;
        v32[3] = &unk_264684410;
        v32[4] = v26;
        [v22 _sendSectionIcon:v16 forSectionID:v23 forSubtypeID:v24 waitForAcknowledgement:v25 withQueue:v27 spoolToFile:v28 andCompletion:v32];
        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 48) + 48), 0xFFFFFFFFFFFFFFFFLL);
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
    }
    while (v12);
  }

  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

intptr_t __116__BLTSettingSyncSendQueue_sendSectionSubtypeParameterIcons_sectionID_waitForAcknowledgement_spoolToFile_completion___block_invoke_24(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 48));
}

intptr_t __116__BLTSettingSyncSendQueue_sendSectionSubtypeParameterIcons_sectionID_waitForAcknowledgement_spoolToFile_completion___block_invoke_25(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 48));
}

- (void)_sendEffectiveSectionInfo:(id)a3 waitForAcknowledgement:(BOOL)a4 withQueue:(id)a5 spoolToFile:(BOOL)a6 andCompletion:(id)a7
{
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v16 = a3;
  id v12 = a5;
  id v13 = a7;
  id v14 = [(BLTSettingSyncSendQueue *)self sectionInfoSender];

  if (v14)
  {
    id v15 = [(BLTSettingSyncSendQueue *)self sectionInfoSender];
    ((void (**)(void, id, id, BOOL, id, BOOL))v15)[2](v15, v16, v12, v10, v13, v8);
  }
}

- (void)_sendSectionIcon:(id)a3 forSectionID:(id)a4 forSubtypeID:(int64_t)a5 waitForAcknowledgement:(BOOL)a6 withQueue:(id)a7 spoolToFile:(BOOL)a8 andCompletion:(id)a9
{
  BOOL v9 = a8;
  BOOL v11 = a6;
  id v22 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a9;
  id v18 = [(BLTSettingSyncSendQueue *)self sectionIconSender];

  if (v18)
  {
    uint64_t v19 = (void *)MEMORY[0x223CAC5D0]();
    uint64_t v20 = BLTPBSectionIconFromBBSectionIcon(v22, v15);
    id v21 = [(BLTSettingSyncSendQueue *)self sectionIconSender];
    ((void (**)(void, void *, id, int64_t, id, BOOL, id, BOOL))v21)[2](v21, v20, v15, a5, v16, v11, v17, v9);
  }
}

- (NSDictionary)iconAllowList
{
  return self->_iconAllowList;
}

- (void)setIconAllowList:(id)a3
{
}

- (id)sectionParametersProvider
{
  return self->_sectionParametersProvider;
}

- (void)setSectionParametersProvider:(id)a3
{
}

- (id)sectionInfoSender
{
  return self->_sectionInfoSender;
}

- (void)setSectionInfoSender:(id)a3
{
}

- (id)sectionIconSender
{
  return self->_sectionIconSender;
}

- (void)setSectionIconSender:(id)a3
{
}

- (id)sectionRemoveSender
{
  return self->_sectionRemoveSender;
}

- (void)setSectionRemoveSender:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sectionRemoveSender, 0);
  objc_storeStrong(&self->_sectionIconSender, 0);
  objc_storeStrong(&self->_sectionInfoSender, 0);
  objc_storeStrong(&self->_sectionParametersProvider, 0);
  objc_storeStrong((id *)&self->_iconAllowList, 0);
  objc_storeStrong((id *)&self->_subsectionParameterIconSemaphore, 0);
  objc_storeStrong((id *)&self->_subsectionParameterIconProcessingQueue, 0);
  objc_storeStrong((id *)&self->_subsectionParameterIconSenderQueue, 0);
  objc_storeStrong((id *)&self->_sectionInfoSemaphore, 0);
  objc_storeStrong((id *)&self->_sectionInfoProcessingQueue, 0);
  objc_storeStrong((id *)&self->_sectionInfoSenderQueue, 0);
}

void __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "Max send attempts exceeded for section ID %@; dropping settings",
    (uint8_t *)&v3,
    0xCu);
}

void __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "Failed to send section info so abandoning with section ID %@", (uint8_t *)&v3, 0xCu);
}

@end