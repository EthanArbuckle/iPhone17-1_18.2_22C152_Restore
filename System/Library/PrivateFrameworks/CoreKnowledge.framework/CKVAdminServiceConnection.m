@interface CKVAdminServiceConnection
- (BOOL)_isCustomerInstall:(id)a3;
- (CKVAdminServiceConnection)initWithServiceQueue:(id)a3 taskManager:(id)a4 semAdministrator:(id)a5;
- (void)beginEvaluation:(id)a3 clean:(BOOL)a4 completion:(id)a5;
- (void)captureVocabularySnapshot:(id)a3 completion:(id)a4;
- (void)deleteAllItemsWithUserId:(id)a3 completion:(id)a4;
- (void)deleteAllItemsWithUserId:(id)a3 deviceId:(id)a4 completion:(id)a5;
- (void)endEvaluation:(id)a3;
- (void)finishEventSimulation:(id)a3;
- (void)handleTask:(unsigned __int16)a3 reason:(unsigned __int16)a4 completion:(id)a5;
- (void)rebuildSpeechProfileForUserId:(id)a3 completion:(id)a4;
- (void)startEventSimulation:(BOOL)a3 completion:(id)a4;
- (void)triggerMaintenance:(id)a3;
- (void)triggerMigration:(BOOL)a3 completeAfterTrigger:(BOOL)a4 completion:(id)a5;
@end

@implementation CKVAdminServiceConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_semAdministrator, 0);
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
}

- (void)endEvaluation:(id)a3
{
  id v4 = a3;
  serviceQueue = self->_serviceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__CKVAdminServiceConnection_endEvaluation___block_invoke;
  v7[3] = &unk_1E5CF9B90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serviceQueue, v7);
}

uint64_t __43__CKVAdminServiceConnection_endEvaluation___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) _isCustomerInstall:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 32) isEvaluationEnabled])
    {
      [*(id *)(*(void *)(a1 + 32) + 24) endEvaluation];
      [*(id *)(*(void *)(a1 + 32) + 32) setEvaluationEnabled:0];
      [*(id *)(*(void *)(a1 + 32) + 32) setEvaluationWithProfile:0];
      uint64_t result = *(void *)(a1 + 40);
      if (result)
      {
        v3 = *(uint64_t (**)(void))(result + 16);
        return v3();
      }
    }
    else
    {
      id v4 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136315138;
        id v6 = "-[CKVAdminServiceConnection endEvaluation:]_block_invoke";
        _os_log_error_impl(&dword_1A77B3000, v4, OS_LOG_TYPE_ERROR, "%s Evaluation is not enabled. Use beginEvaluation API to enable evaluation.", (uint8_t *)&v5, 0xCu);
      }
      uint64_t result = *(void *)(a1 + 40);
      if (result) {
        return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
      }
    }
  }
  return result;
}

- (void)beginEvaluation:(id)a3 clean:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  serviceQueue = self->_serviceQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__CKVAdminServiceConnection_beginEvaluation_clean_completion___block_invoke;
  v13[3] = &unk_1E5CF9B18;
  id v14 = v8;
  id v15 = v9;
  v13[4] = self;
  BOOL v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(serviceQueue, v13);
}

void __62__CKVAdminServiceConnection_beginEvaluation_clean_completion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) _isCustomerInstall:*(void *)(a1 + 48)] & 1) == 0)
  {
    int v2 = [*(id *)(*(void *)(a1 + 32) + 32) isEvaluationEnabled];
    v3 = CKLogContextVocabulary;
    if (v2 && os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[CKVAdminServiceConnection beginEvaluation:clean:completion:]_block_invoke";
      _os_log_error_impl(&dword_1A77B3000, v3, OS_LOG_TYPE_ERROR, "%s Evaluation is already enabled. Resetting all state.", buf, 0xCu);
      v3 = CKLogContextVocabulary;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[CKVAdminServiceConnection beginEvaluation:clean:completion:]_block_invoke";
      _os_log_impl(&dword_1A77B3000, v3, OS_LOG_TYPE_INFO, "%s Enabling evaluaton", buf, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 32) setEvaluationEnabled:1];
    id v4 = [*(id *)(a1 + 40) profileInfo];
    int v5 = [v4 datasetCount];

    if (v5) {
      [*(id *)(*(void *)(a1 + 32) + 32) setEvaluationWithProfile:1];
    }
    if (((*(unsigned char *)(a1 + 56) == 0) & ~v2) == 0) {
      [*(id *)(*(void *)(a1 + 32) + 16) clearAllState];
    }
    id v6 = *(void **)(a1 + 40);
    id v20 = 0;
    uint64_t v7 = [v6 serializedSets:&v20];
    id v8 = v20;
    if (v7)
    {
      int v9 = [*(id *)(*(void *)(a1 + 32) + 24) beginEvaluationWithSerializedSets:v7];
      v10 = CKLogContextVocabulary;
      if (v9 == 1)
      {
        if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v22 = "-[CKVAdminServiceConnection beginEvaluation:clean:completion:]_block_invoke_2";
          _os_log_impl(&dword_1A77B3000, v10, OS_LOG_TYPE_INFO, "%s Evaluation ready", buf, 0xCu);
        }
        uint64_t v11 = *(void *)(a1 + 48);
        if (v11) {
          (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, 1);
        }
        goto LABEL_24;
      }
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[CKVAdminServiceConnection beginEvaluation:clean:completion:]_block_invoke_2";
        __int16 v23 = 2112;
        id v24 = v7;
        _os_log_error_impl(&dword_1A77B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to begin SiriEntityMatcher evaluation with serialized sets: %@", buf, 0x16u);
      }
      id v15 = *(void **)(a1 + 32);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __62__CKVAdminServiceConnection_beginEvaluation_clean_completion___block_invoke_13;
      v16[3] = &unk_1E5CF9DF8;
      id v17 = *(id *)(a1 + 48);
      [v15 endEvaluation:v16];
      id v14 = v17;
    }
    else
    {
      id v12 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[CKVAdminServiceConnection beginEvaluation:clean:completion:]_block_invoke";
        __int16 v23 = 2112;
        id v24 = v8;
        _os_log_error_impl(&dword_1A77B3000, v12, OS_LOG_TYPE_ERROR, "%s Failed to convert KVProfile to serialized sets: %@", buf, 0x16u);
      }
      v13 = *(void **)(a1 + 32);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __62__CKVAdminServiceConnection_beginEvaluation_clean_completion___block_invoke_11;
      v18[3] = &unk_1E5CF9DF8;
      id v19 = *(id *)(a1 + 48);
      [v13 endEvaluation:v18];
      id v14 = v19;
    }

LABEL_24:
  }
}

uint64_t __62__CKVAdminServiceConnection_beginEvaluation_clean_completion___block_invoke_11(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  }
  return result;
}

uint64_t __62__CKVAdminServiceConnection_beginEvaluation_clean_completion___block_invoke_13(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  }
  return result;
}

- (void)rebuildSpeechProfileForUserId:(id)a3 completion:(id)a4
{
  id v5 = a4;
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__CKVAdminServiceConnection_rebuildSpeechProfileForUserId_completion___block_invoke;
  block[3] = &unk_1E5CF9DD0;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(serviceQueue, block);
}

uint64_t __70__CKVAdminServiceConnection_rebuildSpeechProfileForUserId_completion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    id v5 = "-[CKVAdminServiceConnection rebuildSpeechProfileForUserId:completion:]_block_invoke";
    _os_log_error_impl(&dword_1A77B3000, v2, OS_LOG_TYPE_ERROR, "%s No longer supported", (uint8_t *)&v4, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  }
  return result;
}

- (BOOL)_isCustomerInstall:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = (void (**)(id, uint64_t))a3;
  BOOL v4 = +[CKVAssistantSettingsBridge isCustomerInstall];
  if (v4)
  {
    id v5 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      id v8 = "-[CKVAdminServiceConnection _isCustomerInstall:]";
      _os_log_impl(&dword_1A77B3000, v5, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", (uint8_t *)&v7, 0xCu);
    }
    if (v3) {
      v3[2](v3, 2);
    }
  }

  return v4;
}

- (void)deleteAllItemsWithUserId:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v6 = a5;
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__CKVAdminServiceConnection_deleteAllItemsWithUserId_deviceId_completion___block_invoke;
  block[3] = &unk_1E5CF9DD0;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(serviceQueue, block);
}

uint64_t __74__CKVAdminServiceConnection_deleteAllItemsWithUserId_deviceId_completion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    id v5 = "-[CKVAdminServiceConnection deleteAllItemsWithUserId:deviceId:completion:]_block_invoke";
    _os_log_error_impl(&dword_1A77B3000, v2, OS_LOG_TYPE_ERROR, "%s deleteAllItemsWithUserId:deviceId:completion: no longer supported.", (uint8_t *)&v4, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  }
  return result;
}

- (void)deleteAllItemsWithUserId:(id)a3 completion:(id)a4
{
  id v5 = a4;
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CKVAdminServiceConnection_deleteAllItemsWithUserId_completion___block_invoke;
  block[3] = &unk_1E5CF9DD0;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(serviceQueue, block);
}

uint64_t __65__CKVAdminServiceConnection_deleteAllItemsWithUserId_completion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    id v5 = "-[CKVAdminServiceConnection deleteAllItemsWithUserId:completion:]_block_invoke";
    _os_log_error_impl(&dword_1A77B3000, v2, OS_LOG_TYPE_ERROR, "%s deleteAllItemsWithUserId:completion: no longer supported.", (uint8_t *)&v4, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  }
  return result;
}

- (void)captureVocabularySnapshot:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serviceQueue = self->_serviceQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__CKVAdminServiceConnection_captureVocabularySnapshot_completion___block_invoke;
  v11[3] = &unk_1E5CF9B90;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(serviceQueue, v11);
}

void __66__CKVAdminServiceConnection_captureVocabularySnapshot_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (+[CKVAssistantSettingsBridge isCustomerInstall])
  {
    int v2 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v15 = "-[CKVAdminServiceConnection captureVocabularySnapshot:completion:]_block_invoke";
      _os_log_impl(&dword_1A77B3000, v2, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
    }
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, 2, 0);
    }
  }
  else
  {
    int v4 = +[CKVSnapshotManager sharedInstance];
    uint64_t v5 = *(void *)(a1 + 32);
    id v13 = 0;
    id v6 = [v4 captureToFileInDirectory:v5 error:&v13];
    id v7 = v13;

    if (!v6)
    {
      id v8 = (id)CKLogContextVocabulary;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        if (v11)
        {
          id v12 = [NSString stringWithFormat:@" to directory: %@", *(void *)(a1 + 32)];
        }
        else
        {
          id v12 = &stru_1EFD77130;
        }
        *(_DWORD *)buf = 136315650;
        id v15 = "-[CKVAdminServiceConnection captureVocabularySnapshot:completion:]_block_invoke";
        __int16 v16 = 2112;
        id v17 = v12;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_error_impl(&dword_1A77B3000, v8, OS_LOG_TYPE_ERROR, "%s Failed to capture snapshot%@: %@", buf, 0x20u);
        if (v11) {
      }
        }
    }
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      if (v6) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = 2;
      }
      (*(void (**)(uint64_t, uint64_t, void *))(v9 + 16))(v9, v10, v6);
    }
  }
}

- (void)triggerMaintenance:(id)a3
{
  id v4 = a3;
  taskManager = self->_taskManager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CKVAdminServiceConnection_triggerMaintenance___block_invoke;
  v7[3] = &unk_1E5CF9B90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CKVTaskManager *)taskManager handleTask:102 reason:15 shouldDefer:0 completion:v7];
}

void __48__CKVAdminServiceConnection_triggerMaintenance___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__CKVAdminServiceConnection_triggerMaintenance___block_invoke_2;
  v2[3] = &unk_1E5CF9AF0;
  id v3 = *(id *)(a1 + 40);
  [v1 triggerMaintenance:0 completion:v2];
}

uint64_t __48__CKVAdminServiceConnection_triggerMaintenance___block_invoke_2(uint64_t a1)
{
  if (!+[CKVAssistantSettingsBridge isCustomerInstall])
  {
    int v2 = +[CKVSnapshotManager sharedInstance];
    [v2 cleanup];
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)triggerMigration:(BOOL)a3 completeAfterTrigger:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__CKVAdminServiceConnection_triggerMigration_completeAfterTrigger_completion___block_invoke;
  block[3] = &unk_1E5CF9AC8;
  BOOL v13 = a3;
  BOOL v14 = a4;
  void block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(serviceQueue, block);
}

void __78__CKVAdminServiceConnection_triggerMigration_completeAfterTrigger_completion___block_invoke(uint64_t a1)
{
  char v2 = *(unsigned char *)(a1 + 48);
  if (v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) clearAllState];
    char v2 = *(unsigned char *)(a1 + 48);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__CKVAdminServiceConnection_triggerMigration_completeAfterTrigger_completion___block_invoke_2;
  v6[3] = &unk_1E5CF9AC8;
  v6[4] = v3;
  char v8 = v2;
  char v9 = *(unsigned char *)(a1 + 49);
  id v7 = *(id *)(a1 + 40);
  [v4 handleTask:103 reason:15 shouldDefer:0 completion:v6];
  if (*(unsigned char *)(a1 + 49))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    }
  }
}

void __78__CKVAdminServiceConnection_triggerMigration_completeAfterTrigger_completion___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__CKVAdminServiceConnection_triggerMigration_completeAfterTrigger_completion___block_invoke_3;
  v3[3] = &unk_1E5CF9AA0;
  char v5 = *(unsigned char *)(a1 + 49);
  id v4 = *(id *)(a1 + 40);
  [v1 triggerMaintenance:v2 completion:v3];
}

uint64_t __78__CKVAdminServiceConnection_triggerMigration_completeAfterTrigger_completion___block_invoke_3(uint64_t result, int a2)
{
  if (!*(unsigned char *)(result + 40))
  {
    uint64_t result = *(void *)(result + 32);
    if (result)
    {
      if (a2 == 1) {
        uint64_t v2 = 1;
      }
      else {
        uint64_t v2 = 2;
      }
      return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
    }
  }
  return result;
}

- (void)handleTask:(unsigned __int16)a3 reason:(unsigned __int16)a4 completion:(id)a5
{
  id v8 = a5;
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CKVAdminServiceConnection_handleTask_reason_completion___block_invoke;
  block[3] = &unk_1E5CF9C78;
  void block[4] = self;
  id v12 = v8;
  unsigned __int16 v13 = a3;
  unsigned __int16 v14 = a4;
  id v10 = v8;
  dispatch_async(serviceQueue, block);
}

void __58__CKVAdminServiceConnection_handleTask_reason_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) _isCustomerInstall:*(void *)(a1 + 40)] & 1) == 0)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 32) isEvaluationEnabled])
    {
      uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
      uint64_t v3 = *(unsigned __int16 *)(a1 + 48);
      uint64_t v4 = *(unsigned __int16 *)(a1 + 50);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __58__CKVAdminServiceConnection_handleTask_reason_completion___block_invoke_1;
      v11[3] = &unk_1E5CF9DD0;
      id v12 = *(id *)(a1 + 40);
      if (([v2 handleTask:v3 reason:v4 shouldDefer:0 completion:v11] & 1) == 0)
      {
        uint64_t v5 = *(void *)(a1 + 40);
        if (v5) {
          (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 2);
        }
      }
    }
    else
    {
      id v6 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        int v8 = *(unsigned __int16 *)(a1 + 48);
        char v9 = v6;
        id v10 = CKVTaskIdDescription(v8);
        *(_DWORD *)buf = 136315394;
        unsigned __int16 v14 = "-[CKVAdminServiceConnection handleTask:reason:completion:]_block_invoke";
        __int16 v15 = 2112;
        __int16 v16 = v10;
        _os_log_error_impl(&dword_1A77B3000, v9, OS_LOG_TYPE_ERROR, "%s Unable to handle task (%@) as evaluation is not enabled", buf, 0x16u);
      }
      uint64_t v7 = *(void *)(a1 + 40);
      if (v7) {
        (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 2);
      }
    }
  }
}

uint64_t __58__CKVAdminServiceConnection_handleTask_reason_completion___block_invoke_1(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)finishEventSimulation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__CKVAdminServiceConnection_finishEventSimulation___block_invoke;
  v6[3] = &unk_1E5CF9DA8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CKVAdminServiceConnection *)self endEvaluation:v6];
}

uint64_t __51__CKVAdminServiceConnection_finishEventSimulation___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) enableSimulatedTasks:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)startEventSimulation:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v13 = 0;
  id v7 = [MEMORY[0x1E4F72008] emptyProfile:&v13];
  id v8 = v13;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__CKVAdminServiceConnection_startEventSimulation_completion___block_invoke;
  v10[3] = &unk_1E5CF9A78;
  BOOL v12 = a3;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(CKVAdminServiceConnection *)self beginEvaluation:v7 clean:1 completion:v10];
}

uint64_t __61__CKVAdminServiceConnection_startEventSimulation_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1) {
    [*(id *)(*(void *)(a1 + 32) + 16) enableSimulatedTasks:*(unsigned __int8 *)(a1 + 48)];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (CKVAdminServiceConnection)initWithServiceQueue:(id)a3 taskManager:(id)a4 semAdministrator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CKVAdminServiceConnection;
  BOOL v12 = [(CKVAdminServiceConnection *)&v18 init];
  id v13 = v12;
  if (!v12) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v12->_serviceQueue, a3);
  if (!v13->_serviceQueue) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v13->_taskManager, a4);
  if (v13->_taskManager
    && (objc_storeStrong((id *)&v13->_semAdministrator, a5), v13->_semAdministrator)
    && ([(CKVTaskManager *)v13->_taskManager settings],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        settings = v13->_settings,
        v13->_settings = (CKVTaskSettings *)v14,
        settings,
        v13->_settings))
  {
LABEL_6:
    __int16 v16 = v13;
  }
  else
  {
LABEL_7:
    __int16 v16 = 0;
  }

  return v16;
}

@end