@interface CESRSpeechProfileAdminServiceConnection
- (BOOL)_isCustomerInstall:(id)a3;
- (CESRSpeechProfileAdminServiceConnection)initWithServiceQueue:(id)a3 speechProfileSiteManager:(id)a4;
- (int64_t)_deleteUserExclusiveSitesWithUserId:(id)a3;
- (void)_clearAllState;
- (void)beginEvaluation:(id)a3 completion:(id)a4;
- (void)beginEvaluationWithSerializedSets:(id)a3 completion:(id)a4;
- (void)endEvaluation:(id)a3;
- (void)rebuildSpeechProfileForUserId:(id)a3 completion:(id)a4;
- (void)triggerMaintenance:(BOOL)a3 completion:(id)a4;
@end

@implementation CESRSpeechProfileAdminServiceConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechProfileSiteManager, 0);

  objc_storeStrong((id *)&self->_serviceQueue, 0);
}

- (void)endEvaluation:(id)a3
{
  id v4 = a3;
  v5 = (void *)os_transaction_create();
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CESRSpeechProfileAdminServiceConnection_endEvaluation___block_invoke;
  block[3] = &unk_1E61C39D0;
  id v10 = v5;
  id v11 = v4;
  block[4] = self;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(serviceQueue, block);
}

uint64_t __57__CESRSpeechProfileAdminServiceConnection_endEvaluation___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) _isCustomerInstall:*(void *)(a1 + 48)];
  if ((result & 1) == 0)
  {
    v3 = +[CESRSpeechProfileEvaluationStatus sharedStatus];
    char v4 = [v3 isEvaluationEnabled];

    if (v4)
    {
      [*(id *)(a1 + 32) _clearAllState];
      v5 = +[CESRSpeechProfileEvaluationStatus sharedStatus];
      [v5 setEvaluationEnabled:0];

      uint64_t result = *(void *)(a1 + 48);
      if (result)
      {
        v6 = *(uint64_t (**)(void))(result + 16);
        return v6();
      }
    }
    else
    {
      id v7 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315138;
        v9 = "-[CESRSpeechProfileAdminServiceConnection endEvaluation:]_block_invoke";
        _os_log_error_impl(&dword_1B8CCB000, v7, OS_LOG_TYPE_ERROR, "%s Evaluation is not enabled. Use the beginEvaluation API to enable evaluation.", (uint8_t *)&v8, 0xCu);
      }
      uint64_t result = *(void *)(a1 + 48);
      if (result) {
        return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
      }
    }
  }
  return result;
}

- (void)beginEvaluationWithSerializedSets:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)os_transaction_create();
  serviceQueue = self->_serviceQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__CESRSpeechProfileAdminServiceConnection_beginEvaluationWithSerializedSets_completion___block_invoke;
  v13[3] = &unk_1E61C3A90;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v6;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(serviceQueue, v13);
}

uint64_t __88__CESRSpeechProfileAdminServiceConnection_beginEvaluationWithSerializedSets_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) _isCustomerInstall:*(void *)(a1 + 56)];
  if ((result & 1) == 0)
  {
    v3 = +[CESRSpeechProfileEvaluationStatus sharedStatus];
    int v4 = [v3 isEvaluationEnabled];

    if (v4)
    {
      v5 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315138;
        v9 = "-[CESRSpeechProfileAdminServiceConnection beginEvaluationWithSerializedSets:completion:]_block_invoke";
        _os_log_error_impl(&dword_1B8CCB000, v5, OS_LOG_TYPE_ERROR, "%s Evaluation is already enabled. Use the endEvaluation API to disable evaluation.", (uint8_t *)&v8, 0xCu);
      }
      uint64_t result = *(void *)(a1 + 56);
      if (result) {
        return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
      }
    }
    else
    {
      id v6 = +[CESRSpeechProfileEvaluationStatus sharedStatus];
      [v6 setEvaluationEnabled:1];

      [*(id *)(*(void *)(a1 + 32) + 16) rebuildAllSpeechProfilesWithSerializedSets:*(void *)(a1 + 48)];
      uint64_t result = *(void *)(a1 + 56);
      if (result)
      {
        id v7 = *(uint64_t (**)(void))(result + 16);
        return v7();
      }
    }
  }
  return result;
}

- (void)beginEvaluation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)os_transaction_create();
  serviceQueue = self->_serviceQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__CESRSpeechProfileAdminServiceConnection_beginEvaluation_completion___block_invoke;
  v13[3] = &unk_1E61C3A90;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v6;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(serviceQueue, v13);
}

void __70__CESRSpeechProfileAdminServiceConnection_beginEvaluation_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _isCustomerInstall:*(void *)(a1 + 56)]) {
    return;
  }
  v2 = +[CESRSpeechProfileEvaluationStatus sharedStatus];
  int v3 = [v2 isEvaluationEnabled];

  if (!v3)
  {
    id v6 = *(void **)(a1 + 48);
    id v14 = 0;
    id v7 = [v6 toSerializedSets:&v14];
    id v8 = v14;
    if (v7)
    {
      v9 = +[CESRSpeechProfileEvaluationStatus sharedStatus];
      [v9 setEvaluationEnabled:1];

      [*(id *)(*(void *)(a1 + 32) + 16) rebuildAllSpeechProfilesWithSerializedSets:v7];
      uint64_t v10 = *(void *)(a1 + 56);
      if (!v10)
      {
LABEL_15:

        return;
      }
      id v11 = *(void (**)(void))(v10 + 16);
    }
    else
    {
      id v12 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v16 = "-[CESRSpeechProfileAdminServiceConnection beginEvaluation:completion:]_block_invoke";
        __int16 v17 = 2112;
        id v18 = v8;
        _os_log_error_impl(&dword_1B8CCB000, v12, OS_LOG_TYPE_ERROR, "%s Failed to serialize sets from KVProfile, error: %@", buf, 0x16u);
      }
      uint64_t v13 = *(void *)(a1 + 56);
      if (!v13) {
        goto LABEL_15;
      }
      id v11 = *(void (**)(void))(v13 + 16);
    }
    v11();
    goto LABEL_15;
  }
  int v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v16 = "-[CESRSpeechProfileAdminServiceConnection beginEvaluation:completion:]_block_invoke";
    _os_log_error_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_ERROR, "%s Evaluation is already enabled. Use the endEvaluation API to disable evaluation.", buf, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 2);
  }
}

- (void)rebuildSpeechProfileForUserId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)os_transaction_create();
  serviceQueue = self->_serviceQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__CESRSpeechProfileAdminServiceConnection_rebuildSpeechProfileForUserId_completion___block_invoke;
  v13[3] = &unk_1E61C3A90;
  v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(serviceQueue, v13);
}

uint64_t __84__CESRSpeechProfileAdminServiceConnection_rebuildSpeechProfileForUserId_completion___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 16) rebuildSpeechProfileSiteWithUserId:a1[5]];
  uint64_t result = a1[7];
  if (result)
  {
    int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)triggerMaintenance:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  id v7 = (void *)os_transaction_create();
  if (v4)
  {
    serviceQueue = self->_serviceQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__CESRSpeechProfileAdminServiceConnection_triggerMaintenance_completion___block_invoke;
    block[3] = &unk_1E61C38C0;
    block[4] = self;
    dispatch_sync(serviceQueue, block);
  }
  [(CESRSpeechProfileSiteManagement *)self->_speechProfileSiteManager performMaintenance:0];
  if (v6) {
    v6[2](v6, 1);
  }
}

uint64_t __73__CESRSpeechProfileAdminServiceConnection_triggerMaintenance_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearAllState];
}

- (BOOL)_isCustomerInstall:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = (void (**)(id, uint64_t))a3;
  BOOL v4 = +[CESRUtilities isCustomerInstall];
  if (v4)
  {
    uint64_t v5 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      id v8 = "-[CESRSpeechProfileAdminServiceConnection _isCustomerInstall:]";
      _os_log_impl(&dword_1B8CCB000, v5, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", (uint8_t *)&v7, 0xCu);
    }
    if (v3) {
      v3[2](v3, 2);
    }
  }

  return v4;
}

- (int64_t)_deleteUserExclusiveSitesWithUserId:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 length])
  {
    id v6 = *MEMORY[0x1E4F4E380];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      int64_t v5 = 2;
      goto LABEL_8;
    }
    int v12 = 136315394;
    uint64_t v13 = "-[CESRSpeechProfileAdminServiceConnection _deleteUserExclusiveSitesWithUserId:]";
    __int16 v14 = 2112;
    id v15 = v4;
    int v7 = "%s Invalid userId: %@";
    id v8 = v6;
    uint32_t v9 = 22;
LABEL_10:
    _os_log_error_impl(&dword_1B8CCB000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v12, v9);
    goto LABEL_7;
  }
  if (([(CESRSpeechProfileSiteManagement *)self->_speechProfileSiteManager clearSpeechProfileSiteWithUserId:v4] & 1) == 0)
  {
    id v10 = *MEMORY[0x1E4F4E380];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v12 = 136315138;
    uint64_t v13 = "-[CESRSpeechProfileAdminServiceConnection _deleteUserExclusiveSitesWithUserId:]";
    int v7 = "%s Clear failed.";
    id v8 = v10;
    uint32_t v9 = 12;
    goto LABEL_10;
  }
  int64_t v5 = 1;
LABEL_8:

  return v5;
}

- (void)_clearAllState
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int64_t v5 = "-[CESRSpeechProfileAdminServiceConnection _clearAllState]";
    _os_log_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_INFO, "%s Resetting all state across all modules.", (uint8_t *)&v4, 0xCu);
  }
  [(CESRSpeechProfileSiteManagement *)self->_speechProfileSiteManager clearAllState];
}

- (CESRSpeechProfileAdminServiceConnection)initWithServiceQueue:(id)a3 speechProfileSiteManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CESRSpeechProfileAdminServiceConnection;
  uint32_t v9 = [(CESRSpeechProfileAdminServiceConnection *)&v13 init];
  id v10 = v9;
  if (!v9
    || (objc_storeStrong((id *)&v9->_serviceQueue, a3), v10->_serviceQueue)
    && (objc_storeStrong((id *)&v10->_speechProfileSiteManager, a4), v10->_speechProfileSiteManager))
  {
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

@end