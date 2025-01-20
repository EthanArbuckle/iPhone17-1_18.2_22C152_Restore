@interface CKVocabularyAdministrator
+ (id)makeAdministrator;
+ (void)initialize;
- (CKVocabularyAdministrator)init;
- (CKVocabularyAdministrator)initWithAdminService:(id)a3 queue:(id)a4;
- (CKVocabularyAdministrator)initWithAdminService:(id)a3 timeout:(double)a4 queue:(id)a5;
- (id)rawSpeechProfileConverter;
- (id)rawSpeechProfileConverterOmittingItemTypes:(id)a3;
- (id)simulateEventHandling:(BOOL)a3;
- (int64_t)_synchronouslyWrapRequest:(id)a3;
- (int64_t)beginEvaluation:(id)a3 options:(unsigned __int16)a4;
- (int64_t)endEvaluation;
- (int64_t)executeEvaluationTask:(unsigned __int16)a3;
- (void)_triggerMigration:(BOOL)a3 completeAfterTrigger:(BOOL)a4 completion:(id)a5;
- (void)beginEvaluation:(id)a3 options:(unsigned __int16)a4 completion:(id)a5;
- (void)captureVocabularySnapshot:(id)a3;
- (void)captureVocabularySnapshot:(id)a3 completion:(id)a4;
- (void)deleteAllItemsWithUserId:(id)a3 completion:(id)a4;
- (void)deleteAllItemsWithUserId:(id)a3 deviceId:(id)a4 completion:(id)a5;
- (void)endEvaluation:(id)a3;
- (void)executeEvaluationTask:(unsigned __int16)a3 completion:(id)a4;
- (void)rebuildSpeechProfileForUserId:(id)a3 completion:(id)a4;
- (void)triggerMaintenance:(id)a3;
- (void)triggerMigration:(BOOL)a3 completion:(id)a4;
- (void)triggerMigration:(id)a3;
@end

@implementation CKVocabularyAdministrator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_adminService, 0);
}

- (int64_t)_synchronouslyWrapRequest:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  dispatch_group_t v5 = dispatch_group_create();
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__CKVocabularyAdministrator__synchronouslyWrapRequest___block_invoke;
  aBlock[3] = &unk_1E5CF9E48;
  v19 = &v20;
  aBlock[4] = self;
  v6 = v5;
  v18 = v6;
  v7 = _Block_copy(aBlock);
  dispatch_group_enter(v6);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__CKVocabularyAdministrator__synchronouslyWrapRequest___block_invoke_26;
  v15[3] = &unk_1E5CF9DA8;
  v15[4] = self;
  id v8 = v7;
  id v16 = v8;
  v4[2](v4, v15);
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
  if (dispatch_group_wait(v6, v9))
  {
    queue = self->_queue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__CKVocabularyAdministrator__synchronouslyWrapRequest___block_invoke_3;
    v13[3] = &unk_1E5CF9DD0;
    id v14 = v8;
    dispatch_sync(queue, v13);
  }
  int64_t v11 = v21[3];

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __55__CKVocabularyAdministrator__synchronouslyWrapRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(void *)(v2 + 24))
  {
    *(void *)(v2 + 24) = a2;
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 4)
    {
      v4 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        dispatch_group_t v5 = (void *)MEMORY[0x1E4F28ED0];
        double v6 = *(double *)(*(void *)(a1 + 32) + 16);
        v7 = v4;
        id v8 = [v5 numberWithDouble:v6];
        int v9 = 136315394;
        v10 = "-[CKVocabularyAdministrator _synchronouslyWrapRequest:]_block_invoke";
        __int16 v11 = 2112;
        v12 = v8;
        _os_log_error_impl(&dword_1A77B3000, v7, OS_LOG_TYPE_ERROR, "%s Timed out waiting for admin service. timeout: %@ seconds", (uint8_t *)&v9, 0x16u);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __55__CKVocabularyAdministrator__synchronouslyWrapRequest___block_invoke_26(uint64_t a1, uint64_t a2)
{
  v3 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__CKVocabularyAdministrator__synchronouslyWrapRequest___block_invoke_2;
  v4[3] = &unk_1E5CF9D80;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __55__CKVocabularyAdministrator__synchronouslyWrapRequest___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__CKVocabularyAdministrator__synchronouslyWrapRequest___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (int64_t)executeEvaluationTask:(unsigned __int16)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__CKVocabularyAdministrator_executeEvaluationTask___block_invoke;
  v4[3] = &unk_1E5CF9EE8;
  void v4[4] = self;
  unsigned __int16 v5 = a3;
  return [(CKVocabularyAdministrator *)self _synchronouslyWrapRequest:v4];
}

uint64_t __51__CKVocabularyAdministrator_executeEvaluationTask___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) executeEvaluationTask:*(unsigned __int16 *)(a1 + 40) completion:a2];
}

- (void)executeEvaluationTask:(unsigned __int16)a3 completion:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  if (+[CKVAssistantSettingsBridge isCustomerInstall])
  {
    v7 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CKVocabularyAdministrator executeEvaluationTask:completion:]";
      _os_log_impl(&dword_1A77B3000, v7, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
    }
LABEL_7:
    if (v6) {
      v6[2](v6, 3);
    }
    goto LABEL_15;
  }
  if (v4 >= 2)
  {
    id v8 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      int v9 = (void *)MEMORY[0x1E4F28ED0];
      v10 = v8;
      __int16 v11 = [v9 numberWithUnsignedShort:v4];
      *(_DWORD *)buf = 136315394;
      v21 = "-[CKVocabularyAdministrator executeEvaluationTask:completion:]";
      __int16 v22 = 2112;
      uint64_t v23 = v11;
      _os_log_impl(&dword_1A77B3000, v10, OS_LOG_TYPE_INFO, "%s evaluationTaskId: %@ is not valid.", buf, 0x16u);
    }
    goto LABEL_7;
  }
  if (v4) {
    uint64_t v12 = 4 * (v4 == 1);
  }
  else {
    uint64_t v12 = 2;
  }
  uint64_t v13 = (void *)CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    id v14 = v13;
    v15 = CKVTaskIdDescription(v12);
    *(_DWORD *)buf = 136315394;
    v21 = "-[CKVocabularyAdministrator executeEvaluationTask:completion:]";
    __int16 v22 = 2112;
    uint64_t v23 = v15;
    _os_log_impl(&dword_1A77B3000, v14, OS_LOG_TYPE_INFO, "%s Submitting request to execute task (%@)", buf, 0x16u);
  }
  adminService = self->_adminService;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__CKVocabularyAdministrator_executeEvaluationTask_completion___block_invoke;
  v17[3] = &unk_1E5CF9EC0;
  v18 = v6;
  __int16 v19 = v12;
  [(CKVAdminService *)adminService handleTask:v12 reason:17 completion:v17];

LABEL_15:
}

uint64_t __62__CKVocabularyAdministrator_executeEvaluationTask_completion___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(result + 32);
  if (v2)
  {
    uint64_t v4 = result;
    unsigned __int16 v5 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      int v6 = *(unsigned __int16 *)(v4 + 40);
      v7 = v5;
      uint64_t v8 = CKVTaskIdDescription(v6);
      int v9 = (void *)v8;
      v10 = @"failed";
      uint64_t v13 = "-[CKVocabularyAdministrator executeEvaluationTask:completion:]_block_invoke";
      int v12 = 136315650;
      if (a2 == 1) {
        v10 = @"completed";
      }
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_1A77B3000, v7, OS_LOG_TYPE_INFO, "%s Task (%@) %@", (uint8_t *)&v12, 0x20u);

      uint64_t v2 = *(void *)(v4 + 32);
    }
    if (a2 == 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v11);
  }
  return result;
}

- (int64_t)endEvaluation
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__CKVocabularyAdministrator_endEvaluation__block_invoke;
  v3[3] = &unk_1E5CF9E98;
  v3[4] = self;
  return [(CKVocabularyAdministrator *)self _synchronouslyWrapRequest:v3];
}

uint64_t __42__CKVocabularyAdministrator_endEvaluation__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) endEvaluation:a2];
}

- (void)endEvaluation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  BOOL v5 = +[CKVAssistantSettingsBridge isCustomerInstall];
  int v6 = CKLogContextVocabulary;
  BOOL v7 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      int v12 = "-[CKVocabularyAdministrator endEvaluation:]";
      _os_log_impl(&dword_1A77B3000, v6, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
    }
    if (v4) {
      v4[2](v4, 3);
    }
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      int v12 = "-[CKVocabularyAdministrator endEvaluation:]";
      _os_log_impl(&dword_1A77B3000, v6, OS_LOG_TYPE_INFO, "%s Submitting request to end evaluation", buf, 0xCu);
    }
    adminService = self->_adminService;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__CKVocabularyAdministrator_endEvaluation___block_invoke;
    v9[3] = &unk_1E5CF9DF8;
    v10 = v4;
    [(CKVAdminService *)adminService endEvaluation:v9];
  }
}

uint64_t __43__CKVocabularyAdministrator_endEvaluation___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = @"NOT ";
    if (a2 == 1) {
      BOOL v5 = &stru_1EFD77130;
    }
    int v8 = 136315394;
    int v9 = "-[CKVocabularyAdministrator endEvaluation:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1A77B3000, v4, OS_LOG_TYPE_INFO, "%s Evaluation mode %@deactivated", (uint8_t *)&v8, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2 == 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v7);
  }
  return result;
}

- (int64_t)beginEvaluation:(id)a3 options:(unsigned __int16)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__CKVocabularyAdministrator_beginEvaluation_options___block_invoke;
  v10[3] = &unk_1E5CF9E70;
  v10[4] = self;
  id v11 = v6;
  unsigned __int16 v12 = a4;
  id v7 = v6;
  int64_t v8 = [(CKVocabularyAdministrator *)self _synchronouslyWrapRequest:v10];

  return v8;
}

uint64_t __53__CKVocabularyAdministrator_beginEvaluation_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) beginEvaluation:*(void *)(a1 + 40) options:*(unsigned __int16 *)(a1 + 48) completion:a2];
}

- (void)beginEvaluation:(id)a3 options:(unsigned __int16)a4 completion:(id)a5
{
  int v6 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (+[CKVAssistantSettingsBridge isCustomerInstall])
  {
    __int16 v10 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CKVocabularyAdministrator beginEvaluation:options:completion:]";
      _os_log_impl(&dword_1A77B3000, v10, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
      if (!v9) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else
  {
    if (v8)
    {
      id v11 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[CKVocabularyAdministrator beginEvaluation:options:completion:]";
        __int16 v18 = 1024;
        int v19 = v6;
        _os_log_impl(&dword_1A77B3000, v11, OS_LOG_TYPE_INFO, "%s Submitting request to begin evaluation with options: %X", buf, 0x12u);
      }
      adminService = self->_adminService;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __64__CKVocabularyAdministrator_beginEvaluation_options_completion___block_invoke;
      v14[3] = &unk_1E5CF9DF8;
      id v15 = v9;
      [(CKVAdminService *)adminService beginEvaluation:v8 clean:(v6 & 1) == 0 completion:v14];

      goto LABEL_12;
    }
    uint64_t v13 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CKVocabularyAdministrator beginEvaluation:options:completion:]";
      _os_log_error_impl(&dword_1A77B3000, v13, OS_LOG_TYPE_ERROR, "%s Profile cannot be nil.", buf, 0xCu);
      if (!v9) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  if (v9) {
LABEL_11:
  }
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 3);
LABEL_12:
}

uint64_t __64__CKVocabularyAdministrator_beginEvaluation_options_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = @"NOT ";
    if (a2 == 1) {
      BOOL v5 = &stru_1EFD77130;
    }
    int v8 = 136315394;
    id v9 = "-[CKVocabularyAdministrator beginEvaluation:options:completion:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1A77B3000, v4, OS_LOG_TYPE_INFO, "%s Evaluation mode %@activated", (uint8_t *)&v8, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2 == 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v7);
  }
  return result;
}

- (id)rawSpeechProfileConverterOmittingItemTypes:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[CKVEvaluationProfileBuilder alloc] initWithOmittedItemTypes:v3];

  return v4;
}

- (id)rawSpeechProfileConverter
{
  uint64_t v2 = [[CKVEvaluationProfileBuilder alloc] initWithOmittedItemTypes:0];
  return v2;
}

- (void)rebuildSpeechProfileForUserId:(id)a3 completion:(id)a4
{
  id v6 = a4;
  adminService = self->_adminService;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__CKVocabularyAdministrator_rebuildSpeechProfileForUserId_completion___block_invoke;
  v9[3] = &unk_1E5CF9DF8;
  id v10 = v6;
  id v8 = v6;
  [(CKVAdminService *)adminService rebuildSpeechProfileForUserId:a3 completion:v9];
}

uint64_t __70__CKVocabularyAdministrator_rebuildSpeechProfileForUserId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2 == 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

- (void)deleteAllItemsWithUserId:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  if (![v8 length])
  {
    uint64_t v12 = CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315138;
    v17 = "-[CKVocabularyAdministrator deleteAllItemsWithUserId:deviceId:completion:]";
    uint64_t v13 = "%s userId cannot be empty.";
    goto LABEL_11;
  }
  if (![v9 length])
  {
    uint64_t v12 = CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      if (!v10) {
        goto LABEL_9;
      }
LABEL_8:
      v10[2](v10, 3);
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    v17 = "-[CKVocabularyAdministrator deleteAllItemsWithUserId:deviceId:completion:]";
    uint64_t v13 = "%s deviceId cannot be empty.";
LABEL_11:
    _os_log_error_impl(&dword_1A77B3000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
    if (!v10) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  adminService = self->_adminService;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__CKVocabularyAdministrator_deleteAllItemsWithUserId_deviceId_completion___block_invoke;
  v14[3] = &unk_1E5CF9DF8;
  id v15 = v10;
  [(CKVAdminService *)adminService deleteAllItemsWithUserId:v8 deviceId:v9 completion:v14];

LABEL_9:
}

uint64_t __74__CKVocabularyAdministrator_deleteAllItemsWithUserId_deviceId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2 == 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

- (void)deleteAllItemsWithUserId:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  if (![v6 length])
  {
    id v9 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[CKVocabularyAdministrator deleteAllItemsWithUserId:completion:]";
      _os_log_error_impl(&dword_1A77B3000, v9, OS_LOG_TYPE_ERROR, "%s userId cannot be empty.", buf, 0xCu);
      if (!v7) {
        goto LABEL_6;
      }
    }
    else if (!v7)
    {
      goto LABEL_6;
    }
    v7[2](v7, 3);
    goto LABEL_6;
  }
  adminService = self->_adminService;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__CKVocabularyAdministrator_deleteAllItemsWithUserId_completion___block_invoke;
  v10[3] = &unk_1E5CF9DF8;
  id v11 = v7;
  [(CKVAdminService *)adminService deleteAllItemsWithUserId:v6 completion:v10];

LABEL_6:
}

uint64_t __65__CKVocabularyAdministrator_deleteAllItemsWithUserId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2 == 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

- (id)simulateEventHandling:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (+[CKVAssistantSettingsBridge isCustomerInstall])
  {
    BOOL v5 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[CKVocabularyAdministrator simulateEventHandling:]";
      _os_log_impl(&dword_1A77B3000, v5, OS_LOG_TYPE_INFO, "%s Event simulation is not supported on customer install.", (uint8_t *)&buf, 0xCu);
    }
    id v6 = 0;
  }
  else
  {
    uint64_t v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__1958;
    uint64_t v24 = __Block_byref_object_dispose__1959;
    id v25 = 0;
    adminService = self->_adminService;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51__CKVocabularyAdministrator_simulateEventHandling___block_invoke;
    v14[3] = &unk_1E5CF9E48;
    p_long long buf = &buf;
    void v14[4] = self;
    id v9 = v7;
    id v15 = v9;
    [(CKVAdminService *)adminService startEventSimulation:v3 completion:v14];
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
    if (dispatch_group_wait(v9, v10))
    {
      id v11 = (id)CKLogContextVocabulary;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_timeout];
        *(_DWORD *)v17 = 136315394;
        uint64_t v18 = "-[CKVocabularyAdministrator simulateEventHandling:]";
        __int16 v19 = 2112;
        uint64_t v20 = v13;
        _os_log_error_impl(&dword_1A77B3000, v11, OS_LOG_TYPE_ERROR, "%s Timed out waiting for admin service to start simulation. timeout: %@ seconds", v17, 0x16u);
      }
    }
    id v6 = *(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }
  return v6;
}

void __51__CKVocabularyAdministrator_simulateEventHandling___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = CKLogContextVocabulary;
  if (a2 == 1)
  {
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[CKVocabularyAdministrator simulateEventHandling:]_block_invoke";
      _os_log_impl(&dword_1A77B3000, v3, OS_LOG_TYPE_INFO, "%s Successfuly start an event simulation.", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v4 = [[CKVocabularyAdminEventSimulator alloc] initWithAdminService:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    id v8 = (void *)MEMORY[0x1E4F28ED0];
    id v9 = v3;
    dispatch_time_t v10 = [v8 numberWithInteger:a2];
    int v11 = 136315394;
    uint64_t v12 = "-[CKVocabularyAdministrator simulateEventHandling:]_block_invoke";
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_error_impl(&dword_1A77B3000, v9, OS_LOG_TYPE_ERROR, "%s Failed to start an event simulation due to service error result: %@", (uint8_t *)&v11, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)captureVocabularySnapshot:(id)a3
{
}

- (void)captureVocabularySnapshot:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  if (+[CKVAssistantSettingsBridge isCustomerInstall])
  {
    id v8 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v13 = "-[CKVocabularyAdministrator captureVocabularySnapshot:completion:]";
      _os_log_impl(&dword_1A77B3000, v8, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
    }
    if (v7) {
      v7[2](v7, 3, 0);
    }
  }
  else
  {
    adminService = self->_adminService;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__CKVocabularyAdministrator_captureVocabularySnapshot_completion___block_invoke;
    v10[3] = &unk_1E5CF9E20;
    int v11 = v7;
    [(CKVAdminService *)adminService captureVocabularySnapshot:v6 completion:v10];
  }
}

uint64_t __66__CKVocabularyAdministrator_captureVocabularySnapshot_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2 == 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

- (void)triggerMaintenance:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  if (+[CKVAssistantSettingsBridge isCustomerInstall])
  {
    uint64_t v5 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      dispatch_time_t v10 = "-[CKVocabularyAdministrator triggerMaintenance:]";
      _os_log_impl(&dword_1A77B3000, v5, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
    }
    if (v4) {
      v4[2](v4, 3);
    }
  }
  else
  {
    adminService = self->_adminService;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__CKVocabularyAdministrator_triggerMaintenance___block_invoke;
    v7[3] = &unk_1E5CF9DF8;
    id v8 = v4;
    [(CKVAdminService *)adminService triggerMaintenance:v7];
  }
}

uint64_t __48__CKVocabularyAdministrator_triggerMaintenance___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2 == 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

- (void)_triggerMigration:(BOOL)a3 completeAfterTrigger:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  id v9 = @"completed";
  if (v5) {
    id v9 = @"triggered";
  }
  dispatch_time_t v10 = v9;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__CKVocabularyAdministrator__triggerMigration_completeAfterTrigger_completion___block_invoke;
  aBlock[3] = &unk_1E5CF9D58;
  id v25 = v26;
  uint64_t v11 = v10;
  uint64_t v23 = v11;
  id v12 = v8;
  id v24 = v12;
  __int16 v13 = _Block_copy(aBlock);
  adminService = self->_adminService;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__CKVocabularyAdministrator__triggerMigration_completeAfterTrigger_completion___block_invoke_11;
  v20[3] = &unk_1E5CF9DA8;
  v20[4] = self;
  id v15 = v13;
  id v21 = v15;
  [(CKVAdminService *)adminService triggerMigration:v6 completeAfterTrigger:v5 completion:v20];
  if (v5)
  {
    dispatch_time_t v16 = dispatch_time(0, 3000000000);
    queue = self->_queue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __79__CKVocabularyAdministrator__triggerMigration_completeAfterTrigger_completion___block_invoke_3;
    v18[3] = &unk_1E5CF9DD0;
    id v19 = v15;
    dispatch_after(v16, queue, v18);
  }
  _Block_object_dispose(v26, 8);
}

uint64_t __79__CKVocabularyAdministrator__triggerMigration_completeAfterTrigger_completion___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v3 = (void *)result;
    if (a2 == 3)
    {
      uint64_t v7 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        id v8 = (void *)v3[4];
        int v14 = 136315650;
        id v15 = "-[CKVocabularyAdministrator _triggerMigration:completeAfterTrigger:completion:]_block_invoke";
        __int16 v16 = 2112;
        v17 = &unk_1EFD7D5A0;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_error_impl(&dword_1A77B3000, v7, OS_LOG_TYPE_ERROR, "%s Timed out after %@s waiting for migration to be %@", (uint8_t *)&v14, 0x20u);
      }
    }
    else
    {
      if (a2 == 1)
      {
        uint64_t v4 = CKLogContextVocabulary;
        uint64_t v5 = 1;
        if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
        {
          BOOL v6 = (void *)v3[4];
          int v14 = 136315394;
          id v15 = "-[CKVocabularyAdministrator _triggerMigration:completeAfterTrigger:completion:]_block_invoke";
          __int16 v16 = 2112;
          v17 = v6;
          uint64_t v5 = 1;
          _os_log_impl(&dword_1A77B3000, v4, OS_LOG_TYPE_INFO, "%s Successfuly %@ migration.", (uint8_t *)&v14, 0x16u);
        }
        goto LABEL_11;
      }
      id v9 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        dispatch_time_t v10 = (void *)v3[4];
        uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
        id v12 = v9;
        __int16 v13 = [v11 numberWithInteger:a2];
        int v14 = 136315650;
        id v15 = "-[CKVocabularyAdministrator _triggerMigration:completeAfterTrigger:completion:]_block_invoke";
        __int16 v16 = 2112;
        v17 = v10;
        __int16 v18 = 2112;
        id v19 = v13;
        _os_log_error_impl(&dword_1A77B3000, v12, OS_LOG_TYPE_ERROR, "%s Migration failed to be %@ due to service error result: %@", (uint8_t *)&v14, 0x20u);
      }
    }
    uint64_t v5 = 2;
LABEL_11:
    *(void *)(*(void *)(v3[6] + 8) + 24) = v5;
    uint64_t result = v3[5];
    if (result) {
      return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(v3[6] + 8) + 24));
    }
  }
  return result;
}

void __79__CKVocabularyAdministrator__triggerMigration_completeAfterTrigger_completion___block_invoke_11(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__CKVocabularyAdministrator__triggerMigration_completeAfterTrigger_completion___block_invoke_2;
  v4[3] = &unk_1E5CF9D80;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __79__CKVocabularyAdministrator__triggerMigration_completeAfterTrigger_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__CKVocabularyAdministrator__triggerMigration_completeAfterTrigger_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)triggerMigration:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  if (+[CKVAssistantSettingsBridge isCustomerInstall])
  {
    uint64_t v7 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      id v9 = "-[CKVocabularyAdministrator triggerMigration:completion:]";
      _os_log_impl(&dword_1A77B3000, v7, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", (uint8_t *)&v8, 0xCu);
    }
    if (v6) {
      v6[2](v6, 3);
    }
  }
  else
  {
    [(CKVocabularyAdministrator *)self _triggerMigration:v4 completeAfterTrigger:0 completion:v6];
  }
}

- (void)triggerMigration:(id)a3
{
}

- (CKVocabularyAdministrator)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"You must use +makeAdministrator factory method" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CKVocabularyAdministrator)initWithAdminService:(id)a3 timeout:(double)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKVocabularyAdministrator;
  uint64_t v11 = [(CKVocabularyAdministrator *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_adminService, a3);
    v12->_timeout = a4;
    objc_storeStrong((id *)&v12->_queue, a5);
  }

  return v12;
}

- (CKVocabularyAdministrator)initWithAdminService:(id)a3 queue:(id)a4
{
  return [(CKVocabularyAdministrator *)self initWithAdminService:a3 timeout:a4 queue:30.0];
}

+ (void)initialize
{
  if (CKLogInit_onceToken != -1) {
    dispatch_once(&CKLogInit_onceToken, &__block_literal_global_471);
  }
}

+ (id)makeAdministrator
{
  id v2 = +[CKVAdministratorFactory sharedAdministratorFactory];
  uint64_t v3 = [v2 administrator];

  return v3;
}

@end