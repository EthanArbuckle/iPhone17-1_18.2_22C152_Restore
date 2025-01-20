@interface CKVTaskManager
+ (id)dailyDonateTasks;
+ (id)defaultManager;
+ (id)migrationDonateTasks;
+ (id)siriLanguageDependentDonateTasks;
+ (id)verificationTasks;
- (BOOL)_didLocalizationChange:(unsigned __int16)a3;
- (BOOL)_didTriggerMigration:(id)a3 reason:(unsigned __int16)a4;
- (BOOL)_enumerateLocalInstancesOfSet:(id)a3 priorBookmark:(id)a4 newBookmark:(id *)a5 hasDelta:(BOOL *)a6 addedInstancesBlock:(id)a7;
- (BOOL)_isClearRequiredForSet:(id)a3 installedAppBundleIds:(id)a4;
- (BOOL)_isDeleteRequiredForSet:(id)a3 installedAppBundleIds:(id)a4;
- (BOOL)_isSet:(id)a3 excludedFromInstalledAppBundleIds:(id)a4;
- (BOOL)_loadOrCreateTaskInfo;
- (BOOL)_validateFilesystemState;
- (BOOL)clearAllState;
- (BOOL)handleTask:(unsigned __int16)a3 reason:(unsigned __int16)a4 shouldDefer:(id)a5 completion:(id)a6;
- (CKVDonateTaskProvider)donateTaskProvider;
- (CKVTaskManager)initWithManagerName:(id)a3 rootDirectoryURL:(id)a4 setEnumerator:(id)a5 settings:(id)a6;
- (CKVTaskManagerInfo)info;
- (CKVTaskSettings)settings;
- (id)_cleanUpDeletedAppDonationsTaskBlock:(unsigned __int16)a3;
- (id)_derivativeTaskBlockForTask:(unsigned __int16)a3 reason:(unsigned __int16)a4;
- (id)_descriptorForSiriLocale;
- (id)_findContactSet;
- (id)_findInstalledAppSet;
- (id)_firstSetWithItemType:(unsigned __int16)a3 inSets:(id)a4;
- (id)_firstSetWithItemType:(unsigned __int16)a3 matchingDescriptor:(id)a4 inSets:(id)a5;
- (id)_maintenanceTaskBlockWithReason:(unsigned __int16)a3 shouldDefer:(id)a4;
- (id)_siriLanguageChangedTaskBlockWithReason:(unsigned __int16)a3;
- (id)_taskBlockForTask:(unsigned __int16)a3 reason:(unsigned __int16)a4 shouldDefer:(id)a5;
- (id)_verificationTaskBlockForTask:(unsigned __int16)a3 reason:(unsigned __int16)a4;
- (id)_wakePodcastsTaskBlockWithReason:(unsigned __int16)a3;
- (id)_wrapperForTaskBlock:(id)a3 checkingEnablement:(unsigned __int16)a4 reason:(unsigned __int16)a5;
- (void)_enumerateLocalInstancesOfSet:(id)a3 hasDelta:(BOOL *)a4 fromBookmark:(BOOL *)a5;
- (void)_postNotification:(const char *)a3 forChangeToItemType:(unsigned __int16)a4;
- (void)_runInstalledAppDerivativeTasksWithReason:(unsigned __int16)a3;
- (void)_submitTask:(unsigned __int16)a3 reason:(unsigned __int16)a4 taskBlock:(id)a5 completion:(id)a6;
- (void)enableSimulatedTasks:(BOOL)a3;
@end

@implementation CKVTaskManager

- (BOOL)handleTask:(unsigned __int16)a3 reason:(unsigned __int16)a4 shouldDefer:(id)a5 completion:(id)a6
{
  uint64_t v7 = a4;
  uint64_t v8 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  if (v8 == 103)
  {
    [(CKVTaskManager *)self _didTriggerMigration:v11 reason:v7];
LABEL_8:
    BOOL v13 = 1;
    goto LABEL_9;
  }
  if ((unsigned __int16)(v8 - 106) > 0xFF96u)
  {
    v14 = [(CKVTaskManager *)self _taskBlockForTask:v8 reason:v7 shouldDefer:v10];
    [(CKVTaskManager *)self _submitTask:v8 reason:v7 taskBlock:v14 completion:v11];

    goto LABEL_8;
  }
  v12 = (void *)CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)MEMORY[0x1E4F28ED0];
    v17 = v12;
    v18 = [v16 numberWithUnsignedShort:v8];
    int v19 = 136315394;
    v20 = "-[CKVTaskManager handleTask:reason:shouldDefer:completion:]";
    __int16 v21 = 2112;
    v22 = v18;
    _os_log_error_impl(&dword_1A77B3000, v17, OS_LOG_TYPE_ERROR, "%s Failed to handle unknown task: %@", (uint8_t *)&v19, 0x16u);
  }
  BOOL v13 = 0;
LABEL_9:

  return v13;
}

- (id)_taskBlockForTask:(unsigned __int16)a3 reason:(unsigned __int16)a4 shouldDefer:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  id v8 = a5;
  if ((v6 - 1) > 0xA)
  {
    id v10 = 0;
    switch((int)v6)
    {
      case 'e':
        uint64_t v9 = [(CKVTaskManager *)self _siriLanguageChangedTaskBlockWithReason:v5];
        goto LABEL_3;
      case 'f':
        uint64_t v9 = [(CKVTaskManager *)self _maintenanceTaskBlockWithReason:v5 shouldDefer:v8];
        goto LABEL_3;
      case 'h':
        uint64_t v9 = [(CKVTaskManager *)self _wakePodcastsTaskBlockWithReason:v5];
        goto LABEL_3;
      case 'i':
        uint64_t v9 = [(CKVTaskManager *)self _cleanUpDeletedAppDonationsTaskBlock:v5];
        goto LABEL_3;
      default:
        break;
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__CKVTaskManager__taskBlockForTask_reason_shouldDefer___block_invoke;
    v13[3] = &unk_1E5CF9CF0;
    v13[4] = self;
    __int16 v14 = v6;
    __int16 v15 = v5;
    uint64_t v9 = (uint64_t)_Block_copy(v13);
LABEL_3:
    id v10 = (void *)v9;
  }
  id v11 = [(CKVTaskManager *)self _wrapperForTaskBlock:v10 checkingEnablement:v6 reason:v5];

  return v11;
}

- (id)_wrapperForTaskBlock:(id)a3 checkingEnablement:(unsigned __int16)a4 reason:(unsigned __int16)a5
{
  id v8 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__CKVTaskManager__wrapperForTaskBlock_checkingEnablement_reason___block_invoke;
  aBlock[3] = &unk_1E5CF9C78;
  aBlock[4] = self;
  id v13 = v8;
  unsigned __int16 v14 = a4;
  unsigned __int16 v15 = a5;
  id v9 = v8;
  id v10 = _Block_copy(aBlock);

  return v10;
}

void __65__CKVTaskManager__wrapperForTaskBlock_checkingEnablement_reason___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 40))
  {
    id v11 = (void *)CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR)) {
      return;
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    id v13 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v14 = *(unsigned __int16 *)(a1 + 48);
    unsigned __int16 v15 = v11;
    v16 = [v13 numberWithUnsignedShort:v14];
    v17 = CKVTaskIdDescription(*(unsigned __int16 *)(a1 + 48));
    int v21 = 136315906;
    v22 = "-[CKVTaskManager _wrapperForTaskBlock:checkingEnablement:reason:]_block_invoke";
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    __int16 v25 = 2112;
    v26 = v16;
    __int16 v27 = 2112;
    v28 = v17;
    _os_log_error_impl(&dword_1A77B3000, v15, OS_LOG_TYPE_ERROR, "%s (%@) Missing taskBlock for task (%@) \"%@\"", (uint8_t *)&v21, 0x2Au);
LABEL_10:

    return;
  }
  int v2 = [*(id *)(*(void *)(a1 + 32) + 24) isTaskEnabled:*(unsigned __int16 *)(a1 + 48) reason:*(unsigned __int16 *)(a1 + 50)];
  v3 = (void *)CKLogContextVocabulary;
  BOOL v4 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
  if (!v2)
  {
    if (!v4) {
      return;
    }
    uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8);
    int v19 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v20 = *(unsigned __int16 *)(a1 + 48);
    unsigned __int16 v15 = v3;
    v16 = [v19 numberWithUnsignedShort:v20];
    v17 = CKVTaskIdDescription(*(unsigned __int16 *)(a1 + 48));
    int v21 = 136315906;
    v22 = "-[CKVTaskManager _wrapperForTaskBlock:checkingEnablement:reason:]_block_invoke";
    __int16 v23 = 2112;
    uint64_t v24 = v18;
    __int16 v25 = 2112;
    v26 = v16;
    __int16 v27 = 2112;
    v28 = v17;
    _os_log_impl(&dword_1A77B3000, v15, OS_LOG_TYPE_INFO, "%s (%@) Ignoring task (%@) \"%@\" not enabled for current device configuration", (uint8_t *)&v21, 0x2Au);
    goto LABEL_10;
  }
  if (v4)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v7 = *(unsigned __int16 *)(a1 + 48);
    id v8 = v3;
    id v9 = [v6 numberWithUnsignedShort:v7];
    id v10 = CKVTaskIdDescription(*(unsigned __int16 *)(a1 + 48));
    int v21 = 136315906;
    v22 = "-[CKVTaskManager _wrapperForTaskBlock:checkingEnablement:reason:]_block_invoke";
    __int16 v23 = 2112;
    uint64_t v24 = v5;
    __int16 v25 = 2112;
    v26 = v9;
    __int16 v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_1A77B3000, v8, OS_LOG_TYPE_INFO, "%s (%@) Running task (%@) \"%@\"", (uint8_t *)&v21, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __55__CKVTaskManager__taskBlockForTask_reason_shouldDefer___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(*(void *)(a1 + 32) + 24) localization];
  int v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "taskForId:usingLocalization:", *(unsigned __int16 *)(a1 + 40));
  [v2 runWithType:*(unsigned __int16 *)(a1 + 40) reason:*(unsigned __int16 *)(a1 + 42)];
  int v3 = *(unsigned __int16 *)(a1 + 40);
  if (v3 == 10)
  {
    BOOL v4 = *(void **)(a1 + 32);
    uint64_t v5 = "com.apple.siri.vocabulary.findmy_devices_changed";
    uint64_t v6 = 27122;
LABEL_6:
    [v4 _postNotification:v5 forChangeToItemType:v6];
    goto LABEL_8;
  }
  if (v3 != 3)
  {
    if (v3 != 2) {
      goto LABEL_8;
    }
    BOOL v4 = *(void **)(a1 + 32);
    uint64_t v5 = "com.apple.siri.vocabulary.contacts_changed";
    uint64_t v6 = 19668;
    goto LABEL_6;
  }
  [*(id *)(a1 + 32) _runInstalledAppDerivativeTasksWithReason:*(unsigned __int16 *)(a1 + 42)];
LABEL_8:
}

- (void)_submitTask:(unsigned __int16)a3 reason:(unsigned __int16)a4 taskBlock:(id)a5 completion:(id)a6
{
  uint64_t v7 = a4;
  uint64_t v8 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = (void *)CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    managerName = self->_managerName;
    uint64_t v14 = (void *)MEMORY[0x1E4F28ED0];
    unsigned __int16 v15 = v12;
    v16 = [v14 numberWithUnsignedShort:v8];
    v17 = CKVTaskIdDescription(v8);
    uint64_t v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedShort:v7];
    int v19 = 136316162;
    uint64_t v20 = "-[CKVTaskManager _submitTask:reason:taskBlock:completion:]";
    __int16 v21 = 2112;
    v22 = managerName;
    __int16 v23 = 2112;
    uint64_t v24 = v16;
    __int16 v25 = 2112;
    v26 = v17;
    __int16 v27 = 2112;
    v28 = v18;
    _os_log_impl(&dword_1A77B3000, v15, OS_LOG_TYPE_INFO, "%s (%@) Submitting task (%@) \"%@\" with reason (%@)", (uint8_t *)&v19, 0x34u);
  }
  [(CKVTaskCoalescer *)self->_coalescer submitTaskWithId:v8 taskBlock:v10 completion:v11];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_donateTaskProvider, 0);
  objc_storeStrong((id *)&self->_setEnumerator, 0);
  objc_storeStrong((id *)&self->_coalescer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_rootDirectoryURL, 0);
  objc_storeStrong((id *)&self->_managerName, 0);
}

- (CKVTaskManagerInfo)info
{
  return self->_info;
}

- (CKVDonateTaskProvider)donateTaskProvider
{
  return self->_donateTaskProvider;
}

- (CKVTaskSettings)settings
{
  return self->_settings;
}

- (id)_derivativeTaskBlockForTask:(unsigned __int16)a3 reason:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (a3 == 9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__CKVTaskManager__derivativeTaskBlockForTask_reason___block_invoke;
    v10[3] = &unk_1E5CF9CF0;
    v10[4] = self;
    __int16 v11 = 9;
    unsigned __int16 v12 = a4;
    uint64_t v7 = _Block_copy(v10);
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [(CKVTaskManager *)self _wrapperForTaskBlock:v7 checkingEnablement:v5 reason:v4];

  return v8;
}

void __53__CKVTaskManager__derivativeTaskBlockForTask_reason___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) _findInstalledAppSet];
  if (v2)
  {
    int v3 = objc_opt_new();
    uint64_t v4 = [*(id *)(a1 + 32) _blockToCollectInstalledAppBundleIds:v3];
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 56) changeRegistry];
    uint64_t v6 = [v5 bookmarkForSet:v2];
    uint64_t v7 = *(void **)(a1 + 32);
    id v41 = 0;
    char v8 = [v7 _enumerateLocalInstancesOfSet:v2 priorBookmark:v6 newBookmark:&v41 hasDelta:0 addedInstancesBlock:v4];
    id v9 = v41;
    p_base_prots = &CKTimedDispatch.base_prots;
    if (v8) {
      goto LABEL_7;
    }
    if (!v6) {
      goto LABEL_13;
    }
    [v3 removeAllObjects];
    __int16 v11 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[CKVTaskManager _derivativeTaskBlockForTask:reason:]_block_invoke";
      _os_log_impl(&dword_1A77B3000, v11, OS_LOG_TYPE_INFO, "%s Retrying InstalledApp enumeration without a bookmark", buf, 0xCu);
    }
    unsigned __int16 v12 = *(void **)(a1 + 32);
    id v40 = v9;
    char v13 = [v12 _enumerateLocalInstancesOfSet:v2 priorBookmark:0 newBookmark:&v40 hasDelta:0 addedInstancesBlock:v4];
    id v14 = v40;

    id v9 = v14;
    if (v13)
    {
LABEL_7:
      uint64_t v15 = [v3 count];
      v16 = CKLogContextVocabulary;
      BOOL v17 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
      if (v15)
      {
        if (v17)
        {
          int v18 = *(unsigned __int16 *)(a1 + 40);
          int v19 = v16;
          uint64_t v20 = CKVTaskIdDescription(v18);
          *(_DWORD *)buf = 136315650;
          v43 = "-[CKVTaskManager _derivativeTaskBlockForTask:reason:]_block_invoke";
          __int16 v44 = 2112;
          v45 = v20;
          __int16 v46 = 2112;
          v47 = v3;
          _os_log_impl(&dword_1A77B3000, v19, OS_LOG_TYPE_INFO, "%s Running task \"%@\" with added / updated appBundleIds: [%@]", buf, 0x20u);
        }
        uint64_t v21 = *(void *)(a1 + 32);
        v22 = *(void **)(v21 + 48);
        uint64_t v23 = *(unsigned __int16 *)(a1 + 40);
        uint64_t v24 = [*(id *)(v21 + 24) localization];
        __int16 v25 = [v22 derivativeTaskForId:v23 usingLocalization:v24 modifiedItemIds:v3];

        [v25 runWithType:*(unsigned __int16 *)(a1 + 40) reason:*(unsigned __int16 *)(a1 + 42)];
        p_base_prots = (__objc2_prot_list **)(&CKTimedDispatch + 40);
      }
      else if (v17)
      {
        *(_DWORD *)buf = 136315138;
        v43 = "-[CKVTaskManager _derivativeTaskBlockForTask:reason:]_block_invoke";
        _os_log_impl(&dword_1A77B3000, v16, OS_LOG_TYPE_INFO, "%s Zero InstalledApp adds / updates", buf, 0xCu);
      }
      id v39 = 0;
      int v32 = [v5 updateBookmark:v9 forSet:v2 error:&v39];
      id v33 = v39;
      v34 = v33;
      if (!v32
        || (id v38 = v33,
            char v35 = [v5 commitAllBookmarkUpdates:&v38],
            id v36 = v38,
            v34,
            v34 = v36,
            (v35 & 1) == 0))
      {
        v37 = p_base_prots[468];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v43 = "-[CKVTaskManager _derivativeTaskBlockForTask:reason:]_block_invoke";
          __int16 v44 = 2112;
          v45 = v34;
          _os_log_error_impl(&dword_1A77B3000, v37, OS_LOG_TYPE_ERROR, "%s Failed to commit updated InstalledApp bookmark to registry: %@", buf, 0x16u);
        }
      }
    }
    else
    {
LABEL_13:
      v28 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        int v29 = *(unsigned __int16 *)(a1 + 40);
        v30 = v28;
        v31 = CKVTaskIdDescription(v29);
        *(_DWORD *)buf = 136315394;
        v43 = "-[CKVTaskManager _derivativeTaskBlockForTask:reason:]_block_invoke";
        __int16 v44 = 2112;
        v45 = v31;
        _os_log_error_impl(&dword_1A77B3000, v30, OS_LOG_TYPE_ERROR, "%s Cannot run task \"%@\" without successful enumeration of InstalledApp set", buf, 0x16u);
      }
    }

    goto LABEL_23;
  }
  v26 = (void *)CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    int v27 = *(unsigned __int16 *)(a1 + 40);
    int v3 = v26;
    uint64_t v4 = CKVTaskIdDescription(v27);
    *(_DWORD *)buf = 136315394;
    v43 = "-[CKVTaskManager _derivativeTaskBlockForTask:reason:]_block_invoke";
    __int16 v44 = 2112;
    v45 = v4;
    _os_log_error_impl(&dword_1A77B3000, v3, OS_LOG_TYPE_ERROR, "%s Cannot run task \"%@\" without InstalledApp set", buf, 0x16u);
LABEL_23:
  }
}

- (id)_verificationTaskBlockForTask:(unsigned __int16)a3 reason:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (a3 == 2)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__CKVTaskManager__verificationTaskBlockForTask_reason___block_invoke;
    v10[3] = &unk_1E5CF9CF0;
    v10[4] = self;
    __int16 v11 = 2;
    unsigned __int16 v12 = a4;
    uint64_t v7 = _Block_copy(v10);
  }
  else
  {
    uint64_t v7 = 0;
  }
  char v8 = [(CKVTaskManager *)self _wrapperForTaskBlock:v7 checkingEnablement:v5 reason:v4];

  return v8;
}

void __55__CKVTaskManager__verificationTaskBlockForTask_reason___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 48) verificationTaskForId:*(unsigned __int16 *)(a1 + 40)];
  int v3 = [v2 wasLastDonationAccepted];
  uint64_t v4 = [v2 lastDonationAcceptedDate];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 56) lastMaintenance];
  if (v3 && [v4 compare:v5] == -1)
  {
    uint64_t v6 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      int v7 = *(unsigned __int16 *)(a1 + 40);
      char v8 = v6;
      id v9 = CKVTaskIdDescription(v7);
      id v10 = [v4 ISO8601String];
      __int16 v11 = [v5 ISO8601String];
      *(_DWORD *)buf = 136315906;
      id v14 = "-[CKVTaskManager _verificationTaskBlockForTask:reason:]_block_invoke";
      __int16 v15 = 2112;
      v16 = v9;
      __int16 v17 = 2112;
      int v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      _os_log_impl(&dword_1A77B3000, v8, OS_LOG_TYPE_INFO, "%s Skipping verification task (%@). No changes have been accepted (%@) since the last maintenance task (%@).", buf, 0x2Au);
    }
  }
  else
  {
    LOWORD(v12) = *(_WORD *)(a1 + 40);
    BYTE2(v12) = v3;
    objc_msgSend(v2, "runWithType:reason:completion:", MEMORY[0x1E4F143A8], 3221225472, __55__CKVTaskManager__verificationTaskBlockForTask_reason___block_invoke_141, &unk_1E5CF9D18, *(void *)(a1 + 32), v12);
  }
}

void __55__CKVTaskManager__verificationTaskBlockForTask_reason___block_invoke_141(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a2 < 0)
  {
    uint64_t v12 = (void *)CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v13 = *(unsigned __int16 *)(a1 + 40);
    uint64_t v4 = v12;
    id v14 = CKVTaskIdDescription(v13);
    *(_DWORD *)buf = 136315394;
    __int16 v17 = "-[CKVTaskManager _verificationTaskBlockForTask:reason:]_block_invoke";
    __int16 v18 = 2112;
    uint64_t v19 = (uint64_t)v14;
    _os_log_error_impl(&dword_1A77B3000, v4, OS_LOG_TYPE_ERROR, "%s Failed to run verification task (%@).", buf, 0x16u);

    goto LABEL_16;
  }
  if (*(_WORD *)(a1 + 40) == 2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _findContactSet];
    if (v3)
    {
      uint64_t v4 = v3;
      __int16 v15 = 0;
      [*(id *)(a1 + 32) _enumerateLocalInstancesOfSet:v3 hasDelta:(char *)&v15 + 1 fromBookmark:&v15];
      uint64_t v5 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        int v6 = *(unsigned __int16 *)(a1 + 40);
        int v7 = v5;
        uint64_t v8 = CKVTaskIdDescription(v6);
        id v9 = (void *)v8;
        if ((_BYTE)v15) {
          BOOL v10 = HIBYTE(v15) == 0;
        }
        else {
          BOOL v10 = 1;
        }
        __int16 v11 = @"confirmed a ";
        *(_DWORD *)buf = 136315650;
        __int16 v17 = "-[CKVTaskManager _verificationTaskBlockForTask:reason:]_block_invoke";
        if (!v10) {
          __int16 v11 = @"fixed an in";
        }
        __int16 v18 = 2112;
        uint64_t v19 = v8;
        __int16 v20 = 2112;
        uint64_t v21 = v11;
        _os_log_impl(&dword_1A77B3000, v7, OS_LOG_TYPE_INFO, "%s Verification task (%@) %@consistent set", buf, 0x20u);
      }
      if ((_BYTE)v15)
      {
        if (*(unsigned char *)(a1 + 42)) {
          +[CKVAnalytics sendDonateVerification:*(unsigned __int16 *)(a1 + 40) isConsistent:HIBYTE(v15) == 0];
        }
      }
LABEL_16:
    }
  }
}

- (void)_postNotification:(const char *)a3 forChangeToItemType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  setEnumerator = self->_setEnumerator;
  id v17 = 0;
  uint64_t v8 = [(CCSetEnumerator *)setEnumerator allSetsWithItemType:a4 error:&v17];
  id v9 = v17;
  if (v8)
  {
    BOOL v10 = [(CKVTaskManager *)self _firstSetWithItemType:v4 inSets:v8];
    if (v10)
    {
      char v16 = 0;
      [(CKVTaskManager *)self _enumerateLocalInstancesOfSet:v10 hasDelta:&v16 fromBookmark:0];
      if (v16)
      {
        notify_post(a3);
        __int16 v11 = (void *)CKLogContextVocabulary;
        if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = NSString;
          int v13 = v11;
          id v14 = [v12 stringWithUTF8String:a3];
          *(_DWORD *)buf = 136315394;
          uint64_t v19 = "-[CKVTaskManager _postNotification:forChangeToItemType:]";
          __int16 v20 = 2112;
          id v21 = v14;
          _os_log_impl(&dword_1A77B3000, v13, OS_LOG_TYPE_INFO, "%s Posted change notification: \"%@\"", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    __int16 v15 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "-[CKVTaskManager _postNotification:forChangeToItemType:]";
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_error_impl(&dword_1A77B3000, v15, OS_LOG_TYPE_ERROR, "%s Failed to discover all sets: %@", buf, 0x16u);
    }
  }
}

- (BOOL)_enumerateLocalInstancesOfSet:(id)a3 priorBookmark:(id)a4 newBookmark:(id *)a5 hasDelta:(BOOL *)a6 addedInstancesBlock:(id)a7
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  BOOL v10 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v11 = a4;
  id v12 = a7;
  int v13 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    id v14 = @"prior bookmark";
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[CKVTaskManager _enumerateLocalInstancesOfSet:priorBookmark:newBookmark:hasDelta:addedInstancesBlock:]";
    *(_WORD *)&buf[12] = 2112;
    if (!v11) {
      id v14 = @"NO bookmark";
    }
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    v57 = v10;
    _os_log_impl(&dword_1A77B3000, v13, OS_LOG_TYPE_INFO, "%s Enumerating from %@ for set: %@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v57 = __Block_byref_object_copy__1743;
  v58 = __Block_byref_object_dispose__1744;
  id v59 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 1;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x2020000000;
  int v43 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  int v39 = 0;
  __int16 v15 = [v10 changePublisher];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __103__CKVTaskManager__enumerateLocalInstancesOfSet_priorBookmark_newBookmark_hasDelta_addedInstancesBlock___block_invoke;
  v32[3] = &unk_1E5CF9CA0;
  v34 = buf;
  char v16 = v10;
  id v33 = v16;
  char v35 = &v44;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __103__CKVTaskManager__enumerateLocalInstancesOfSet_priorBookmark_newBookmark_hasDelta_addedInstancesBlock___block_invoke_132;
  v28[3] = &unk_1E5CF9CC8;
  v30 = &v40;
  v31 = &v36;
  id v17 = v12;
  id v29 = v17;
  id v18 = (id)[v15 sinkWithBookmark:v11 completion:v32 receiveInput:v28];

  int v19 = *((unsigned __int8 *)v45 + 24);
  if (*((unsigned char *)v45 + 24))
  {
    int v20 = *((_DWORD *)v41 + 6);
    if (v20 || *((_DWORD *)v37 + 6))
    {
      id v21 = CKLogContextVocabulary;
      BOOL v22 = 1;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        int v23 = *((_DWORD *)v37 + 6);
        uint64_t v24 = @"prior";
        if (!v11) {
          uint64_t v24 = @"nil";
        }
        *(_DWORD *)uint64_t v48 = 136316162;
        v49 = "-[CKVTaskManager _enumerateLocalInstancesOfSet:priorBookmark:newBookmark:hasDelta:addedInstancesBlock:]";
        __int16 v50 = 1024;
        *(_DWORD *)v51 = v20;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v23;
        __int16 v52 = 2112;
        v53 = v24;
        __int16 v54 = 2112;
        v55 = v16;
        _os_log_impl(&dword_1A77B3000, v21, OS_LOG_TYPE_INFO, "%s Completed local instance enumeration counting %u adds and %u removes from %@ bookmark for set: %@", v48, 0x2Cu);
      }
    }
    else
    {
      __int16 v25 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t v48 = 136315394;
        v49 = "-[CKVTaskManager _enumerateLocalInstancesOfSet:priorBookmark:newBookmark:hasDelta:addedInstancesBlock:]";
        __int16 v50 = 2112;
        *(void *)v51 = v16;
        _os_log_impl(&dword_1A77B3000, v25, OS_LOG_TYPE_INFO, "%s Completed enumeration with no local changes to set: %@", v48, 0x16u);
      }
      BOOL v22 = 0;
    }
    if (a6) {
      *a6 = v22;
    }
    if (a5) {
      *a5 = *(id *)(*(void *)&buf[8] + 40);
    }
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(buf, 8);

  return v19 != 0;
}

void __103__CKVTaskManager__enumerateLocalInstancesOfSet_priorBookmark_newBookmark_hasDelta_addedInstancesBlock___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 state])
  {
    int v7 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[4];
      id v9 = v7;
      BOOL v10 = [v5 error];
      int v11 = 136315650;
      id v12 = "-[CKVTaskManager _enumerateLocalInstancesOfSet:priorBookmark:newBookmark:hasDelta:addedInstancesBlock:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      char v16 = v10;
      _os_log_error_impl(&dword_1A77B3000, v9, OS_LOG_TYPE_ERROR, "%s Failed to enumerate set: %@ error: %@", (uint8_t *)&v11, 0x20u);
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
}

void __103__CKVTaskManager__enumerateLocalInstancesOfSet_priorBookmark_newBookmark_hasDelta_addedInstancesBlock___block_invoke_132(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 addedLocalInstances];
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) += [v4 count];

  id v5 = [v3 removedLocalInstances];
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) += [v5 count];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = objc_msgSend(v3, "addedLocalInstances", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = a1[4];
        if (v11) {
          (*(void (**)(uint64_t, void))(v11 + 16))(v11, *(void *)(*((void *)&v12 + 1) + 8 * v10));
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_enumerateLocalInstancesOfSet:(id)a3 hasDelta:(BOOL *)a4 fromBookmark:(BOOL *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(CKVTaskManagerInfo *)self->_info changeRegistry];
  uint64_t v10 = [v9 bookmarkForSet:v8];
  id v25 = 0;
  BOOL v11 = [(CKVTaskManager *)self _enumerateLocalInstancesOfSet:v8 priorBookmark:v10 newBookmark:&v25 hasDelta:a4 addedInstancesBlock:0];
  id v12 = v25;
  if (!v10 || v11)
  {
    if (!v11)
    {
      id v16 = 0;
      if (!a5) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else
  {
    long long v13 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int v27 = "-[CKVTaskManager _enumerateLocalInstancesOfSet:hasDelta:fromBookmark:]";
      __int16 v28 = 2112;
      id v29 = v8;
      _os_log_impl(&dword_1A77B3000, v13, OS_LOG_TYPE_INFO, "%s Retrying enumeration without a bookmark for set: %@", buf, 0x16u);
    }

    id v24 = v12;
    BOOL v14 = [(CKVTaskManager *)self _enumerateLocalInstancesOfSet:v8 priorBookmark:0 newBookmark:&v24 hasDelta:0 addedInstancesBlock:0];
    id v15 = v24;

    uint64_t v10 = 0;
    id v16 = 0;
    id v12 = v15;
    if (!v14) {
      goto LABEL_15;
    }
  }
  id v23 = 0;
  int v17 = [v9 updateBookmark:v12 forSet:v8 error:&v23];
  id v18 = v23;
  int v19 = v18;
  if (v17)
  {
    id v22 = v18;
    char v20 = [v9 commitAllBookmarkUpdates:&v22];
    id v16 = v22;

    if (v20) {
      goto LABEL_15;
    }
  }
  else
  {
    id v16 = v18;
  }
  id v21 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    int v27 = "-[CKVTaskManager _enumerateLocalInstancesOfSet:hasDelta:fromBookmark:]";
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v16;
    _os_log_error_impl(&dword_1A77B3000, v21, OS_LOG_TYPE_ERROR, "%s Failed to commit registry update for set: %@ error: %@", buf, 0x20u);
    if (!a5) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_15:
  if (a5) {
LABEL_16:
  }
    *a5 = v10 != 0;
LABEL_17:
}

- (id)_descriptorForSiriLocale
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v2 = [(CKVTaskSettings *)self->_settings localization];
  id v3 = [v2 siriLanguageCode];

  uint64_t v4 = +[CKVLocalization supportedNSLocaleFromLanguageCode:v3];
  id v5 = objc_alloc(MEMORY[0x1E4F57FD0]);
  uint64_t v6 = *MEMORY[0x1E4F57F60];
  uint64_t v7 = [v4 localeIdentifier];
  id v12 = 0;
  id v8 = (void *)[v5 initWithKey:v6 value:v7 error:&v12];
  id v9 = v12;

  uint64_t v10 = CKLogContextVocabulary;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      BOOL v14 = "-[CKVTaskManager _descriptorForSiriLocale]";
      __int16 v15 = 2112;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_1A77B3000, v10, OS_LOG_TYPE_INFO, "%s Resolved locale descriptor: %@ from siriLanguageCode: %@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    BOOL v14 = "-[CKVTaskManager _descriptorForSiriLocale]";
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_error_impl(&dword_1A77B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to resolve locale descriptor from siriLanguageCode: %@ error: %@", buf, 0x20u);
  }

  return v8;
}

- (id)_firstSetWithItemType:(unsigned __int16)a3 matchingDescriptor:(id)a4 inSets:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v66 objects:v80 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v67 != v13) {
          objc_enumerationMutation(v10);
        }
        __int16 v15 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        if ([v15 itemType] == v6) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v66 objects:v80 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    id v16 = [v9 firstObject];
    if ((unint64_t)[v9 count] < 2)
    {
      if ([v9 count] == 1)
      {
        uint64_t v38 = (void *)CKLogContextVocabulary;
        if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
        {
          int v39 = (void *)MEMORY[0x1E4F70B80];
          uint64_t v40 = v38;
          id v41 = [v39 descriptionForTypeIdentifier:v6];
          *(_DWORD *)buf = 136315650;
          v71 = "-[CKVTaskManager _firstSetWithItemType:matchingDescriptor:inSets:]";
          __int16 v72 = 2112;
          uint64_t v73 = (uint64_t)v41;
          __int16 v74 = 2112;
          id v75 = v16;
          _os_log_impl(&dword_1A77B3000, v40, OS_LOG_TYPE_INFO, "%s Exactly one set found with itemType: %@ set: %@", buf, 0x20u);
        }
      }
    }
    else
    {
      __int16 v17 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        id v18 = (void *)MEMORY[0x1E4F70B80];
        uint64_t v19 = v17;
        char v20 = [v18 descriptionForTypeIdentifier:v6];
        *(_DWORD *)buf = 136315650;
        v71 = "-[CKVTaskManager _firstSetWithItemType:matchingDescriptor:inSets:]";
        __int16 v72 = 2112;
        uint64_t v73 = (uint64_t)v20;
        __int16 v74 = 2112;
        id v75 = v9;
        _os_log_impl(&dword_1A77B3000, v19, OS_LOG_TYPE_INFO, "%s More than one set with itemType: %@ sets: %@", buf, 0x20u);
      }
      if (v7)
      {
        v53 = v16;
        id v54 = v10;
        id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v55 = v9;
        obuint64_t j = v9;
        uint64_t v21 = [obj countByEnumeratingWithState:&v62 objects:v79 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v63;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v63 != v23) {
                objc_enumerationMutation(obj);
              }
              id v25 = *(void **)(*((void *)&v62 + 1) + 8 * j);
              long long v58 = 0u;
              long long v59 = 0u;
              long long v60 = 0u;
              long long v61 = 0u;
              v26 = [v25 descriptors];
              uint64_t v27 = [v26 countByEnumeratingWithState:&v58 objects:v78 count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = *(void *)v59;
                while (2)
                {
                  for (uint64_t k = 0; k != v28; ++k)
                  {
                    if (*(void *)v59 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    if ([*(id *)(*((void *)&v58 + 1) + 8 * k) isEqual:v7])
                    {
                      [v57 addObject:v25];
                      goto LABEL_30;
                    }
                  }
                  uint64_t v28 = [v26 countByEnumeratingWithState:&v58 objects:v78 count:16];
                  if (v28) {
                    continue;
                  }
                  break;
                }
              }
LABEL_30:
            }
            uint64_t v22 = [obj countByEnumeratingWithState:&v62 objects:v79 count:16];
          }
          while (v22);
        }

        if ([v57 count] == 1)
        {
          uint64_t v31 = [v57 firstObject];

          uint64_t v32 = (void *)CKLogContextVocabulary;
          id v10 = v54;
          id v9 = v55;
          if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
          {
            id v33 = (void *)MEMORY[0x1E4F70B80];
            v34 = v32;
            char v35 = [v33 descriptionForTypeIdentifier:v6];
            *(_DWORD *)buf = 136315906;
            v71 = "-[CKVTaskManager _firstSetWithItemType:matchingDescriptor:inSets:]";
            __int16 v72 = 2112;
            uint64_t v73 = v31;
            __int16 v74 = 2112;
            id v75 = v35;
            __int16 v76 = 2112;
            id v77 = v7;
            uint64_t v36 = "%s Found set: %@ with itemType: %@ and descriptor: %@";
LABEL_46:
            _os_log_impl(&dword_1A77B3000, v34, OS_LOG_TYPE_INFO, v36, buf, 0x2Au);
          }
        }
        else
        {
          id v10 = v54;
          id v9 = v55;
          if ((unint64_t)[v57 count] < 2)
          {
            v45 = (void *)CKLogContextVocabulary;
            if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
            {
              uint64_t v46 = (void *)MEMORY[0x1E4F70B80];
              char v47 = v45;
              uint64_t v48 = [v46 descriptionForTypeIdentifier:v6];
              *(_DWORD *)buf = 136315906;
              v71 = "-[CKVTaskManager _firstSetWithItemType:matchingDescriptor:inSets:]";
              __int16 v72 = 2112;
              uint64_t v73 = (uint64_t)v48;
              __int16 v74 = 2112;
              id v75 = v7;
              __int16 v76 = 2112;
              id v77 = obj;
              _os_log_impl(&dword_1A77B3000, v47, OS_LOG_TYPE_INFO, "%s No sets have itemType: %@ and descriptor: %@. Arbitrarily selecting the first of sets: %@", buf, 0x2Au);
            }
            uint64_t v31 = (uint64_t)v53;
            goto LABEL_50;
          }
          uint64_t v31 = [v57 firstObject];

          int v43 = (void *)CKLogContextVocabulary;
          if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
          {
            uint64_t v44 = (void *)MEMORY[0x1E4F70B80];
            v34 = v43;
            char v35 = [v44 descriptionForTypeIdentifier:v6];
            *(_DWORD *)buf = 136315906;
            v71 = "-[CKVTaskManager _firstSetWithItemType:matchingDescriptor:inSets:]";
            __int16 v72 = 2112;
            uint64_t v73 = (uint64_t)v35;
            __int16 v74 = 2112;
            id v75 = v7;
            __int16 v76 = 2112;
            id v77 = v57;
            uint64_t v36 = "%s Multiple sets with itemType: %@ have descriptor: %@ arbitrarily selecting the first set: %@";
            goto LABEL_46;
          }
        }
LABEL_50:

        id v16 = (void *)v31;
        goto LABEL_51;
      }
      uint64_t v42 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v71 = "-[CKVTaskManager _firstSetWithItemType:matchingDescriptor:inSets:]";
        __int16 v72 = 2112;
        uint64_t v73 = (uint64_t)v16;
        _os_log_impl(&dword_1A77B3000, v42, OS_LOG_TYPE_INFO, "%s Arbitratily selecting the first set: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v37 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      __int16 v50 = (void *)MEMORY[0x1E4F70B80];
      v51 = v37;
      __int16 v52 = [v50 descriptionForTypeIdentifier:v6];
      *(_DWORD *)buf = 136315650;
      v71 = "-[CKVTaskManager _firstSetWithItemType:matchingDescriptor:inSets:]";
      __int16 v72 = 2112;
      uint64_t v73 = (uint64_t)v52;
      __int16 v74 = 2112;
      id v75 = v10;
      _os_log_error_impl(&dword_1A77B3000, v51, OS_LOG_TYPE_ERROR, "%s No set found with itemType: %@ from sets: %@", buf, 0x20u);
    }
    id v16 = 0;
  }
LABEL_51:

  return v16;
}

- (id)_firstSetWithItemType:(unsigned __int16)a3 inSets:(id)a4
{
  return [(CKVTaskManager *)self _firstSetWithItemType:a3 matchingDescriptor:0 inSets:a4];
}

- (void)enableSimulatedTasks:(BOOL)a3
{
  BOOL v3 = a3;
  -[CKVDonateTaskProvider enableSimulatedTasks:](self->_donateTaskProvider, "enableSimulatedTasks:");
  settings = self->_settings;
  [(CKVTaskSettings *)settings setTaskCoalescenceDisabled:v3];
}

- (BOOL)_isDeleteRequiredForSet:(id)a3 installedAppBundleIds:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 itemType];
  BOOL v9 = 0;
  if (v8 > 25882)
  {
    if (v8 <= 38250)
    {
      if (v8 > 32964)
      {
        if (v8 == 32965 || v8 == 34307) {
          goto LABEL_37;
        }
        int v10 = 36059;
      }
      else
      {
        if (v8 == 25883 || v8 == 26512) {
          goto LABEL_37;
        }
        int v10 = 30598;
      }
    }
    else if (v8 <= 47340)
    {
      if (v8 == 38251 || v8 == 42611) {
        goto LABEL_37;
      }
      int v10 = 44935;
    }
    else if (v8 > 61351)
    {
      if (v8 == 63369) {
        goto LABEL_37;
      }
      int v10 = 61352;
    }
    else
    {
      if (v8 == 47341) {
        goto LABEL_37;
      }
      int v10 = 53482;
    }
LABEL_36:
    if (v8 != v10) {
      goto LABEL_42;
    }
    goto LABEL_37;
  }
  if (v8 <= 12009)
  {
    if (v8 > 7718)
    {
      if (v8 == 7719 || v8 == 7822) {
        goto LABEL_37;
      }
      int v10 = 8194;
    }
    else
    {
      if (v8 == 800 || v8 == 3615) {
        goto LABEL_37;
      }
      int v10 = 5595;
    }
    goto LABEL_36;
  }
  if (v8 <= 14705)
  {
    if (v8 == 12010 || v8 == 13884) {
      goto LABEL_37;
    }
    int v10 = 14025;
    goto LABEL_36;
  }
  if (v8 > 15571)
  {
    if (v8 == 15572) {
      goto LABEL_37;
    }
    int v10 = 16251;
    goto LABEL_36;
  }
  if (v8 != 14706)
  {
    int v10 = 14816;
    goto LABEL_36;
  }
LABEL_37:
  if (![(CKVTaskManager *)self _isSet:v6 excludedFromInstalledAppBundleIds:v7])
  {
LABEL_41:
    BOOL v9 = 0;
    goto LABEL_42;
  }
  uint64_t v11 = [v6 changePublisher];
  uint64_t v12 = [v11 sharedItemCount];

  uint64_t v13 = CKLogContextVocabulary;
  BOOL v14 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v14)
    {
      int v17 = 136315650;
      id v18 = "-[CKVTaskManager _isDeleteRequiredForSet:installedAppBundleIds:]";
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 1024;
      int v22 = v12;
      _os_log_impl(&dword_1A77B3000, v13, OS_LOG_TYPE_INFO, "%s Skipping delete for nonempty set: %@ with %u shared items", (uint8_t *)&v17, 0x1Cu);
    }
    goto LABEL_41;
  }
  if (v14)
  {
    id v16 = v13;
    int v17 = 136315650;
    id v18 = "-[CKVTaskManager _isDeleteRequiredForSet:installedAppBundleIds:]";
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 1024;
    int v22 = [v7 count];
    BOOL v9 = 1;
    _os_log_impl(&dword_1A77B3000, v16, OS_LOG_TYPE_INFO, "%s Delete required for empty set: %@ whose sourceIdentifier does not match any of the %u installed appBundleIds", (uint8_t *)&v17, 0x1Cu);
  }
  else
  {
    BOOL v9 = 1;
  }
LABEL_42:

  return v9;
}

- (BOOL)_isClearRequiredForSet:(id)a3 installedAppBundleIds:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 itemType];
  BOOL v9 = 0;
  if (v8 <= 14024)
  {
    if (v8 == 3615) {
      goto LABEL_8;
    }
    int v10 = 8194;
  }
  else
  {
    if (v8 == 14025 || v8 == 36059) {
      goto LABEL_8;
    }
    int v10 = 34307;
  }
  if (v8 != v10) {
    goto LABEL_15;
  }
LABEL_8:
  if (![(CKVTaskManager *)self _isSet:v6 excludedFromInstalledAppBundleIds:v7])
  {
LABEL_14:
    BOOL v9 = 0;
    goto LABEL_15;
  }
  uint64_t v11 = [v6 changePublisher];
  uint64_t v12 = [v11 localItemInstanceCount];

  uint64_t v13 = CKLogContextVocabulary;
  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 136315394;
      int v17 = "-[CKVTaskManager _isClearRequiredForSet:installedAppBundleIds:]";
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_debug_impl(&dword_1A77B3000, v13, OS_LOG_TYPE_DEBUG, "%s Skipping clear for already empty set: %@", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_14;
  }
  BOOL v9 = 1;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    BOOL v14 = v13;
    int v16 = 136315906;
    int v17 = "-[CKVTaskManager _isClearRequiredForSet:installedAppBundleIds:]";
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 1024;
    int v21 = v12;
    __int16 v22 = 1024;
    int v23 = [v7 count];
    _os_log_impl(&dword_1A77B3000, v14, OS_LOG_TYPE_INFO, "%s Clear required for set: %@ with %u local item instances whose sourceIdentifier does not match any of the %u installed appBundleIds", (uint8_t *)&v16, 0x22u);
  }
LABEL_15:

  return v9;
}

- (BOOL)_isSet:(id)a3 excludedFromInstalledAppBundleIds:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 descriptorWithKey:*MEMORY[0x1E4F57F68]];
  int v8 = [v7 value];

  if (v8)
  {
    if (![v6 containsObject:v8])
    {
      BOOL v11 = 1;
      goto LABEL_9;
    }
    BOOL v9 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315650;
      BOOL v14 = "-[CKVTaskManager _isSet:excludedFromInstalledAppBundleIds:]";
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2112;
      __int16 v18 = v8;
      _os_log_debug_impl(&dword_1A77B3000, v9, OS_LOG_TYPE_DEBUG, "%s No cleanup required for set: %@ which is associated with installed app: %@", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    int v10 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      BOOL v14 = "-[CKVTaskManager _isSet:excludedFromInstalledAppBundleIds:]";
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_1A77B3000, v10, OS_LOG_TYPE_INFO, "%s Skipping cleanup for set: %@ with no sourceIdentifier", (uint8_t *)&v13, 0x16u);
    }
  }
  BOOL v11 = 0;
LABEL_9:

  return v11;
}

- (id)_cleanUpDeletedAppDonationsTaskBlock:(unsigned __int16)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__CKVTaskManager__cleanUpDeletedAppDonationsTaskBlock___block_invoke;
  aBlock[3] = &unk_1E5CF9B68;
  aBlock[4] = self;
  BOOL v3 = _Block_copy(aBlock);
  return v3;
}

void __55__CKVTaskManager__cleanUpDeletedAppDonationsTaskBlock___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 48) allInstalledAppBundleIdentifiers];
  if ([(__CFString *)v2 count])
  {
    BOOL v3 = *(void **)(*(void *)(a1 + 32) + 40);
    id v48 = 0;
    uint64_t v4 = [v3 allSets:&v48];
    id v5 = (__CFString *)v48;
    id v6 = v5;
    if (v4)
    {
      id v33 = v5;
      int v36 = _os_feature_enabled_impl();
      id v7 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        int v8 = @"NO";
        if (v36) {
          int v8 = @"YES";
        }
        *(_DWORD *)buf = 136315394;
        __int16 v50 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
        __int16 v51 = 2112;
        __int16 v52 = v8;
        _os_log_impl(&dword_1A77B3000, v7, OS_LOG_TYPE_INFO, "%s enableSetDeletion = %@", buf, 0x16u);
      }
      long long v46 = 0u;
      long long v47 = 0u;
      long long v45 = 0u;
      long long v44 = 0u;
      v34 = v4;
      obuint64_t j = v4;
      uint64_t v9 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
      if (v9)
      {
        uint64_t v11 = v9;
        uint64_t v12 = *(void *)v45;
        *(void *)&long long v10 = 136315138;
        long long v32 = v10;
LABEL_9:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v45 != v12) {
            objc_enumerationMutation(obj);
          }
          BOOL v14 = *(__CFString **)(*((void *)&v44 + 1) + 8 * v13);
          if (objc_msgSend(*(id *)(a1 + 32), "_isClearRequiredForSet:installedAppBundleIds:", v14, v2, v32))
          {
            __int16 v15 = CKLogContextVocabulary;
            if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              __int16 v50 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
              __int16 v51 = 2112;
              __int16 v52 = v14;
              _os_log_impl(&dword_1A77B3000, v15, OS_LOG_TYPE_INFO, "%s Submitting clear for set: %@", buf, 0x16u);
            }
            dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
            __int16 v17 = (void *)MEMORY[0x1E4F57FD8];
            uint64_t v18 = [(__CFString *)v14 itemType];
            uint64_t v19 = [(__CFString *)v14 descriptors];
            v42[0] = MEMORY[0x1E4F143A8];
            v42[1] = 3221225472;
            v42[2] = __55__CKVTaskManager__cleanUpDeletedAppDonationsTaskBlock___block_invoke_111;
            v42[3] = &unk_1E5CF9C28;
            v42[4] = v14;
            __int16 v20 = v16;
            int v43 = v20;
            [v17 fullSetDonationWithItemType:v18 descriptors:v19 completion:v42];

            dispatch_time_t v21 = dispatch_time(0, 300000000000);
            if (dispatch_semaphore_wait(v20, v21))
            {
              __int16 v22 = CKLogContextVocabulary;
              if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                __int16 v50 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
                __int16 v51 = 2112;
                __int16 v52 = v14;
                __int16 v53 = 2112;
                id v54 = &unk_1EFD7D590;
                _os_log_error_impl(&dword_1A77B3000, v22, OS_LOG_TYPE_ERROR, "%s Timed out waiting to clear set: %@ timeout: %@ seconds", buf, 0x20u);
              }
            }
          }
          if (v36
            && [*(id *)(a1 + 32) _isDeleteRequiredForSet:v14 installedAppBundleIds:v2])
          {
            dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
            __int16 v41 = 0;
            __int16 v41 = [(__CFString *)v14 itemType];
            id v40 = [(__CFString *)v14 descriptors];
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __55__CKVTaskManager__cleanUpDeletedAppDonationsTaskBlock___block_invoke_113;
            aBlock[3] = &unk_1E5CF9C50;
            aBlock[4] = v14;
            uint64_t v24 = v23;
            uint64_t v38 = v24;
            id v39 = _Block_copy(aBlock);
            id v25 = [MEMORY[0x1E4F57FD8] methodSignatureForSelector:sel_deleteSetWithItemType_descriptors_completion_];
            v26 = CKLogContextVocabulary;
            if (v25)
            {
              if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                __int16 v50 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
                __int16 v51 = 2112;
                __int16 v52 = v14;
                _os_log_impl(&dword_1A77B3000, v26, OS_LOG_TYPE_INFO, "%s Submitting delete for set: %@", buf, 0x16u);
              }
              uint64_t v27 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v25];
              [v27 setTarget:objc_opt_class()];
              [v27 setSelector:sel_deleteSetWithItemType_descriptors_completion_];
              [v27 setArgument:&v41 atIndex:2];
              [v27 setArgument:&v40 atIndex:3];
              [v27 setArgument:&v39 atIndex:4];
              [v27 invoke];
              dispatch_time_t v28 = dispatch_time(0, 300000000000);
              if (dispatch_semaphore_wait(v24, v28))
              {
                uint64_t v29 = CKLogContextVocabulary;
                if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  __int16 v50 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
                  __int16 v51 = 2112;
                  __int16 v52 = v14;
                  __int16 v53 = 2112;
                  id v54 = &unk_1EFD7D590;
                  _os_log_error_impl(&dword_1A77B3000, v29, OS_LOG_TYPE_ERROR, "%s Timed out waiting to delete set: %@ timeout: %@ seconds", buf, 0x20u);
                }
              }
            }
            else if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v32;
              __int16 v50 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
              _os_log_error_impl(&dword_1A77B3000, v26, OS_LOG_TYPE_ERROR, "%s Failed to resolve deleteSet method signature", buf, 0xCu);
            }

            if (!v25) {
              break;
            }
          }
          if (v11 == ++v13)
          {
            uint64_t v11 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
            if (v11) {
              goto LABEL_9;
            }
            break;
          }
        }
      }

      id v6 = v33;
      uint64_t v4 = v34;
    }
    else
    {
      uint64_t v31 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v50 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
        __int16 v51 = 2112;
        __int16 v52 = v6;
        _os_log_error_impl(&dword_1A77B3000, v31, OS_LOG_TYPE_ERROR, "%s Failed to enumerate all sets: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    __int16 v30 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v50 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
      __int16 v51 = 2112;
      __int16 v52 = v2;
      _os_log_error_impl(&dword_1A77B3000, v30, OS_LOG_TYPE_ERROR, "%s Failed to resolve installed appBundleIds: %@", buf, 0x16u);
    }
  }
}

void __55__CKVTaskManager__cleanUpDeletedAppDonationsTaskBlock___block_invoke_111(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v5 = a3;
  int v6 = [a2 finish:&v11];
  id v7 = v11;

  int v8 = CKLogContextVocabulary;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1A77B3000, v8, OS_LOG_TYPE_INFO, "%s Successfully cleared set: %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    uint64_t v13 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_error_impl(&dword_1A77B3000, v8, OS_LOG_TYPE_ERROR, "%s Failed to clear set: %@ error: %@", buf, 0x20u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __55__CKVTaskManager__cleanUpDeletedAppDonationsTaskBlock___block_invoke_113(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a2;
  uint64_t v4 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = @"success";
    if (v3) {
      int v6 = v3;
    }
    int v7 = 136315650;
    int v8 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1A77B3000, v4, OS_LOG_TYPE_INFO, "%s Deletion completed for set: %@ with result: %@", (uint8_t *)&v7, 0x20u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __55__CKVTaskManager__blockToCollectInstalledAppBundleIds___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 content];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 bundleIdentifier];
    if (v5) {
      [*(id *)(a1 + 32) addObject:v5];
    }
  }
  else
  {
    int v6 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315650;
      int v8 = "-[CKVTaskManager _blockToCollectInstalledAppBundleIds:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v3;
      __int16 v11 = 2112;
      uint64_t v12 = v4;
      _os_log_error_impl(&dword_1A77B3000, v6, OS_LOG_TYPE_ERROR, "%s Unexpected instance: %@ content: %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)_runInstalledAppDerivativeTasksWithReason:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v5 = [(CKVTaskManager *)self _derivativeTaskBlockForTask:9 reason:a3];
  v5[2]();
  int v6 = [(CKVTaskManager *)self _taskBlockForTask:105 reason:v3 shouldDefer:0];

  v6[2]();
}

- (id)_findContactSet
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  setEnumerator = self->_setEnumerator;
  id v12 = 0;
  uint64_t v4 = [(CCSetEnumerator *)setEnumerator allSetsWithItemType:19668 error:&v12];
  id v5 = v12;
  if (v4)
  {
    int v6 = [(CKVTaskManager *)self _firstSetWithItemType:19668 inSets:v4];
    int v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v10 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v14 = "-[CKVTaskManager _findContactSet]";
        __int16 v15 = 2112;
        id v16 = v4;
        _os_log_error_impl(&dword_1A77B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to find expected Contact set in sets: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    __int16 v9 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v14 = "-[CKVTaskManager _findContactSet]";
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_error_impl(&dword_1A77B3000, v9, OS_LOG_TYPE_ERROR, "%s Failed to enumerate sets: %@", buf, 0x16u);
    }
    int v7 = 0;
  }

  return v7;
}

- (id)_findInstalledAppSet
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  setEnumerator = self->_setEnumerator;
  id v12 = 0;
  uint64_t v4 = [(CCSetEnumerator *)setEnumerator allSetsWithItemType:36434 error:&v12];
  id v5 = v12;
  if (v4)
  {
    int v6 = [(CKVTaskManager *)self _descriptorForSiriLocale];
    int v7 = [(CKVTaskManager *)self _firstSetWithItemType:36434 matchingDescriptor:v6 inSets:v4];

    if (v7)
    {
      id v8 = v7;
    }
    else
    {
      id v10 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v14 = "-[CKVTaskManager _findInstalledAppSet]";
        __int16 v15 = 2112;
        id v16 = v4;
        _os_log_error_impl(&dword_1A77B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to find expected InstalledApp set in sets: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    __int16 v9 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v14 = "-[CKVTaskManager _findInstalledAppSet]";
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_error_impl(&dword_1A77B3000, v9, OS_LOG_TYPE_ERROR, "%s Failed to enumerate sets: %@", buf, 0x16u);
    }
    int v7 = 0;
  }

  return v7;
}

- (id)_wakePodcastsTaskBlockWithReason:(unsigned __int16)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__CKVTaskManager__wakePodcastsTaskBlockWithReason___block_invoke;
  aBlock[3] = &__block_descriptor_34_e5_v8__0l;
  unsigned __int16 v6 = a3;
  uint64_t v3 = _Block_copy(aBlock);
  return v3;
}

void __51__CKVTaskManager__wakePodcastsTaskBlockWithReason___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v1 = *(unsigned __int16 *)(a1 + 32);
  int v2 = CKLogContextVocabulary;
  BOOL v3 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
  if (v1 == 14)
  {
    if (v3)
    {
      uint64_t v4 = (void *)MEMORY[0x1E4F28ED0];
      id v5 = v2;
      unsigned __int16 v6 = [v4 numberWithUnsignedShort:14];
      int v7 = 136315394;
      id v8 = "-[CKVTaskManager _wakePodcastsTaskBlockWithReason:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v6;
      _os_log_impl(&dword_1A77B3000, v5, OS_LOG_TYPE_INFO, "%s Skipping Podcasts wake for reason: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    if (v3)
    {
      int v7 = 136315138;
      id v8 = "-[CKVTaskManager _wakePodcastsTaskBlockWithReason:]_block_invoke";
      _os_log_impl(&dword_1A77B3000, v2, OS_LOG_TYPE_INFO, "%s Waking Podcasts app up", (uint8_t *)&v7, 0xCu);
    }
    [MEMORY[0x1E4F92118] openPodcastsWithOriginBundleId:@"com.apple.siriknowledged"];
  }
}

- (id)_siriLanguageChangedTaskBlockWithReason:(unsigned __int16)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__CKVTaskManager__siriLanguageChangedTaskBlockWithReason___block_invoke;
  v5[3] = &unk_1E5CF9BB8;
  v5[4] = self;
  unsigned __int16 v6 = a3;
  BOOL v3 = _Block_copy(v5);
  return v3;
}

uint64_t __58__CKVTaskManager__siriLanguageChangedTaskBlockWithReason___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    int v5 = 136315394;
    unsigned __int16 v6 = "-[CKVTaskManager _siriLanguageChangedTaskBlockWithReason:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1A77B3000, v2, OS_LOG_TYPE_INFO, "%s (%@) Handling Siri language code change notification  - refreshing localization settings", (uint8_t *)&v5, 0x16u);
  }
  [*(id *)(*(void *)(a1 + 32) + 24) refreshLocalization];
  return [*(id *)(a1 + 32) _didLocalizationChange:*(unsigned __int16 *)(a1 + 40)];
}

- (id)_maintenanceTaskBlockWithReason:(unsigned __int16)a3 shouldDefer:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__CKVTaskManager__maintenanceTaskBlockWithReason_shouldDefer___block_invoke;
  v6[3] = &unk_1E5CF9BB8;
  v6[4] = self;
  unsigned __int16 v7 = a3;
  uint64_t v4 = _Block_copy(v6);
  return v4;
}

void __62__CKVTaskManager__maintenanceTaskBlockWithReason_shouldDefer___block_invoke(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  p_base_prots = &CKTimedDispatch.base_prots;
  uint64_t v3 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
    *(_DWORD *)buf = 136315394;
    long long v58 = "-[CKVTaskManager _maintenanceTaskBlockWithReason:shouldDefer:]_block_invoke";
    __int16 v59 = 2112;
    id v60 = v4;
    _os_log_impl(&dword_1A77B3000, v3, OS_LOG_TYPE_INFO, "%s (%@) Starting maintenance", buf, 0x16u);
  }
  int v5 = [*(id *)(a1 + 32) _didTriggerMigration:0 reason:*(unsigned __int16 *)(a1 + 40)];
  unsigned __int16 v6 = CKLogContextVocabulary;
  BOOL v7 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)buf = 136315394;
      long long v58 = "-[CKVTaskManager _maintenanceTaskBlockWithReason:shouldDefer:]_block_invoke";
      __int16 v59 = 2112;
      id v60 = v8;
      _os_log_impl(&dword_1A77B3000, v6, OS_LOG_TYPE_INFO, "%s (%@) Skipping maintenance as migration has been triggered", buf, 0x16u);
    }
  }
  else
  {
    if (v7)
    {
      uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)buf = 136315394;
      long long v58 = "-[CKVTaskManager _maintenanceTaskBlockWithReason:shouldDefer:]_block_invoke";
      __int16 v59 = 2112;
      id v60 = v9;
      _os_log_impl(&dword_1A77B3000, v6, OS_LOG_TYPE_INFO, "%s (%@) Refreshing localization settings", buf, 0x16u);
    }
    [*(id *)(*(void *)(a1 + 32) + 24) refreshLocalization];
    if ([*(id *)(a1 + 32) _didLocalizationChange:*(unsigned __int16 *)(a1 + 40)])
    {
      id v10 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v11 = [(id)objc_opt_class() siriLanguageDependentDonateTasks];
      id v12 = [v10 setWithArray:v11];
    }
    else
    {
      id v12 = 0;
    }
    uint64_t v13 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = *(void **)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)buf = 136315394;
      long long v58 = "-[CKVTaskManager _maintenanceTaskBlockWithReason:shouldDefer:]_block_invoke";
      __int16 v59 = 2112;
      id v60 = v14;
      _os_log_impl(&dword_1A77B3000, v13, OS_LOG_TYPE_INFO, "%s (%@) Running daily donate tasks", buf, 0x16u);
    }
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    __int16 v15 = [(id)objc_opt_class() dailyDonateTasks];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v63 count:16];
    if (v16)
    {
      uint64_t v18 = v16;
      uint64_t v19 = *(void *)v53;
      *(void *)&long long v17 = 136315650;
      long long v46 = v17;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v53 != v19) {
            objc_enumerationMutation(v15);
          }
          dispatch_time_t v21 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          unsigned __int16 v22 = objc_msgSend(v21, "unsignedIntValue", v46);
          if ([v12 containsObject:v21])
          {
            dispatch_semaphore_t v23 = p_base_prots[468];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              uint64_t v24 = *(void **)(*(void *)(a1 + 32) + 8);
              id v25 = v23;
              v26 = CKVTaskIdDescription(v22);
              *(_DWORD *)buf = v46;
              long long v58 = "-[CKVTaskManager _maintenanceTaskBlockWithReason:shouldDefer:]_block_invoke";
              __int16 v59 = 2112;
              id v60 = v24;
              p_base_prots = (__objc2_prot_list **)(&CKTimedDispatch + 40);
              __int16 v61 = 2112;
              long long v62 = v26;
              _os_log_impl(&dword_1A77B3000, v25, OS_LOG_TYPE_INFO, "%s (%@) Skipping task (%@) which already ran after localization refresh.", buf, 0x20u);
            }
          }
          else
          {
            uint64_t v27 = [*(id *)(a1 + 32) _taskBlockForTask:v22 reason:*(unsigned __int16 *)(a1 + 40) shouldDefer:0];
            v27[2]();
          }
        }
        uint64_t v18 = [v15 countByEnumeratingWithState:&v52 objects:v63 count:16];
      }
      while (v18);
    }

    if ([*(id *)(*(void *)(a1 + 32) + 56) didCompleteMigrationMoreRecentlyThanMaintenance])
    {
      dispatch_time_t v28 = p_base_prots[468];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        uint64_t v29 = *(void **)(*(void *)(a1 + 32) + 8);
        *(_DWORD *)buf = 136315394;
        long long v58 = "-[CKVTaskManager _maintenanceTaskBlockWithReason:shouldDefer:]_block_invoke";
        __int16 v59 = 2112;
        id v60 = v29;
        _os_log_impl(&dword_1A77B3000, v28, OS_LOG_TYPE_INFO, "%s (%@) First maintenance post migration", buf, 0x16u);
      }
      __int16 v30 = [*(id *)(a1 + 32) _taskBlockForTask:104 reason:*(unsigned __int16 *)(a1 + 40) shouldDefer:0];
      v30[2]();
    }
    uint64_t v31 = p_base_prots[468];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      long long v32 = *(void **)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)buf = 136315394;
      long long v58 = "-[CKVTaskManager _maintenanceTaskBlockWithReason:shouldDefer:]_block_invoke";
      __int16 v59 = 2112;
      id v60 = v32;
      _os_log_impl(&dword_1A77B3000, v31, OS_LOG_TYPE_INFO, "%s (%@) Running verification tasks", buf, 0x16u);
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v33 = [(id)objc_opt_class() verificationTasks];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v49 != v36) {
            objc_enumerationMutation(v33);
          }
          objc_msgSend(*(id *)(a1 + 32), "_verificationTaskBlockForTask:reason:", (unsigned __int16)objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * j), "unsignedIntValue"), *(unsigned __int16 *)(a1 + 40));
          uint64_t v38 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v38[2]();
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v35);
    }

    id v39 = [*(id *)(a1 + 32) _taskBlockForTask:105 reason:*(unsigned __int16 *)(a1 + 40) shouldDefer:0];
    v39[2]();
    id v40 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      __int16 v41 = *(void **)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)buf = 136315394;
      long long v58 = "-[CKVTaskManager _maintenanceTaskBlockWithReason:shouldDefer:]_block_invoke";
      __int16 v59 = 2112;
      id v60 = v41;
      _os_log_impl(&dword_1A77B3000, v40, OS_LOG_TYPE_INFO, "%s (%@) Maintenance completed.", buf, 0x16u);
    }
    uint64_t v42 = *(void **)(*(void *)(a1 + 32) + 56);
    id v47 = 0;
    char v43 = [v42 recordMaintenanceCompleted:&v47];
    id v44 = v47;
    if ((v43 & 1) == 0)
    {
      long long v45 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        long long v58 = "-[CKVTaskManager _maintenanceTaskBlockWithReason:shouldDefer:]_block_invoke";
        __int16 v59 = 2112;
        id v60 = v44;
        _os_log_error_impl(&dword_1A77B3000, v45, OS_LOG_TYPE_ERROR, "%s Failed to record maintenance completed: %@", buf, 0x16u);
      }
    }
  }
}

- (BOOL)_didLocalizationChange:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(CKVTaskManagerInfo *)self->_info siriLanguageCode];
  uint64_t v6 = [(CKVTaskManagerInfo *)self->_info dictationLanguageCodes];
  BOOL v7 = [(CKVTaskSettings *)self->_settings localization];
  uint64_t v8 = [v7 siriLanguageCode];

  uint64_t v9 = [(CKVTaskSettings *)self->_settings localization];
  uint64_t v10 = [v9 dictationLanguageCodes];

  if (v8 | v5) {
    int v11 = [(id)v8 isEqual:v5] ^ 1;
  }
  else {
    int v11 = 0;
  }
  int v12 = v10 | v6;
  if (v10 | v6) {
    int v12 = [(id)v10 isEqual:v6] ^ 1;
  }
  LODWORD(v13) = v11 | v12;
  __int16 v14 = (void *)CKLogContextVocabulary;
  BOOL v15 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
  if (v13 == 1)
  {
    if (v15)
    {
      uint64_t v16 = v14;
      uint64_t v13 = _localizationDescription((void *)v8, (void *)v10);
      long long v17 = _localizationDescription((void *)v5, (void *)v6);
      *(_DWORD *)buf = 136315650;
      id v39 = "-[CKVTaskManager _didLocalizationChange:]";
      __int16 v40 = 2112;
      __int16 v41 = v13;
      __int16 v42 = 2112;
      char v43 = v17;
      _os_log_impl(&dword_1A77B3000, v16, OS_LOG_TYPE_INFO, "%s Refreshed localization settings: %@ differ from stored settings: %@", buf, 0x20u);

      LOBYTE(v13) = 1;
    }
    if (v11)
    {
      uint64_t v31 = v5;
      uint64_t v18 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v39 = "-[CKVTaskManager _didLocalizationChange:]";
        _os_log_impl(&dword_1A77B3000, v18, OS_LOG_TYPE_INFO, "%s Triggering Siri-language dependent donations", buf, 0xCu);
      }
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v19 = [(id)objc_opt_class() siriLanguageDependentDonateTasks];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v34 != v22) {
              objc_enumerationMutation(v19);
            }
            -[CKVTaskManager _taskBlockForTask:reason:shouldDefer:](self, "_taskBlockForTask:reason:shouldDefer:", (unsigned __int16)[*(id *)(*((void *)&v33 + 1) + 8 * i) unsignedIntValue], v3, 0);
            uint64_t v24 = (void (**)(void))objc_claimAutoreleasedReturnValue();
            v24[2]();
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v21);
      }

      uint64_t v5 = v31;
      LOBYTE(v13) = 1;
    }
    info = self->_info;
    id v32 = 0;
    BOOL v26 = [(CKVTaskManagerInfo *)info updateSiriLanguageCode:v8 dictationLanguageCodes:v10 error:&v32];
    uint64_t v27 = v32;
    if (!v26)
    {
      dispatch_time_t v28 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v39 = "-[CKVTaskManager _didLocalizationChange:]";
        __int16 v40 = 2112;
        __int16 v41 = v27;
        _os_log_error_impl(&dword_1A77B3000, v28, OS_LOG_TYPE_ERROR, "%s Failed to record updated localization: %@", buf, 0x16u);
      }
    }
    goto LABEL_25;
  }
  if (v15)
  {
    uint64_t v27 = v14;
    uint64_t v29 = _localizationDescription((void *)v5, (void *)v6);
    *(_DWORD *)buf = 136315394;
    id v39 = "-[CKVTaskManager _didLocalizationChange:]";
    __int16 v40 = 2112;
    __int16 v41 = v29;
    _os_log_impl(&dword_1A77B3000, v27, OS_LOG_TYPE_INFO, "%s Refreshed localization settings unchanged from stored settings: %@", buf, 0x16u);

LABEL_25:
  }

  return (char)v13;
}

- (BOOL)_didTriggerMigration:(id)a3 reason:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(void))a3;
  if ([(CKVTaskSettings *)self->_settings isTaskEnabled:103 reason:v4])
  {
    if (v4 == 20)
    {
      uint64_t v24 = v6;
      BOOL v7 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        managerName = self->_managerName;
        *(_DWORD *)buf = 136315394;
        long long v36 = "-[CKVTaskManager _didTriggerMigration:reason:]";
        __int16 v37 = 2112;
        uint64_t v38 = managerName;
        _os_log_impl(&dword_1A77B3000, v7, OS_LOG_TYPE_INFO, "%s (%@) Skipping migration requirement check for reason: Cascade Donate Now", buf, 0x16u);
        BOOL v7 = CKLogContextVocabulary;
      }
      goto LABEL_9;
    }
    BOOL v11 = [(CKVTaskManagerInfo *)self->_info shouldRunMigration];
    BOOL v7 = CKLogContextVocabulary;
    if (v11)
    {
      uint64_t v24 = v6;
LABEL_9:
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v12 = self->_managerName;
        *(_DWORD *)buf = 136315394;
        long long v36 = "-[CKVTaskManager _didTriggerMigration:reason:]";
        __int16 v37 = 2112;
        uint64_t v38 = v12;
        _os_log_impl(&dword_1A77B3000, v7, OS_LOG_TYPE_INFO, "%s (%@) Starting migration.", buf, 0x16u);
      }
      [(CKVTaskSettings *)self->_settings refreshLocalization];
      uint64_t v13 = dispatch_group_create();
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      __int16 v14 = [(id)objc_opt_class() migrationDonateTasks];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v31 != v17) {
              objc_enumerationMutation(v14);
            }
            unsigned __int16 v19 = [*(id *)(*((void *)&v30 + 1) + 8 * i) unsignedIntValue];
            dispatch_group_enter(v13);
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            v28[2] = __46__CKVTaskManager__didTriggerMigration_reason___block_invoke;
            v28[3] = &unk_1E5CF9B68;
            uint64_t v29 = v13;
            [(CKVTaskManager *)self handleTask:v19 reason:1 shouldDefer:0 completion:v28];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v16);
      }

      uint64_t v20 = dispatch_queue_create("DonateAll", 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__CKVTaskManager__didTriggerMigration_reason___block_invoke_2;
      block[3] = &unk_1E5CF9B90;
      block[4] = self;
      uint64_t v6 = v25;
      uint64_t v27 = v25;
      dispatch_group_notify(v13, v20, block);

      BOOL v21 = 1;
      goto LABEL_25;
    }
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = self->_managerName;
      *(_DWORD *)buf = 136315394;
      long long v36 = "-[CKVTaskManager _didTriggerMigration:reason:]";
      __int16 v37 = 2112;
      uint64_t v38 = v22;
      uint64_t v10 = "%s (%@) Migration not required";
      goto LABEL_21;
    }
  }
  else
  {
    BOOL v7 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = self->_managerName;
      *(_DWORD *)buf = 136315394;
      long long v36 = "-[CKVTaskManager _didTriggerMigration:reason:]";
      __int16 v37 = 2112;
      uint64_t v38 = v9;
      uint64_t v10 = "%s (%@) Skipping migration as vocabulary donation is not enabled on this platform.";
LABEL_21:
      _os_log_impl(&dword_1A77B3000, v7, OS_LOG_TYPE_INFO, v10, buf, 0x16u);
    }
  }
  if (v6) {
    v6[2](v6);
  }
  BOOL v21 = 0;
LABEL_25:

  return v21;
}

void __46__CKVTaskManager__didTriggerMigration_reason___block_invoke(uint64_t a1)
{
}

void __46__CKVTaskManager__didTriggerMigration_reason___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v2 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
    *(_DWORD *)buf = 136315394;
    id v25 = "-[CKVTaskManager _didTriggerMigration:reason:]_block_invoke_2";
    __int16 v26 = 2112;
    id v27 = v3;
    _os_log_impl(&dword_1A77B3000, v2, OS_LOG_TYPE_INFO, "%s (%@) Running verification tasks following migration donate tasks", buf, 0x16u);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [(id)objc_opt_class() verificationTasks];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(a1 + 32), "_verificationTaskBlockForTask:reason:", (unsigned __int16)objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "unsignedIntValue"), 1);
        uint64_t v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v9[2]();
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  [*(id *)(a1 + 32) handleTask:104 reason:1 shouldDefer:0 completion:0];
  uint64_t v10 = *(void *)(a1 + 32);
  BOOL v11 = *(void **)(v10 + 56);
  uint64_t v12 = *(void *)(v10 + 24);
  id v18 = 0;
  char v13 = [v11 recordMigrationCompletedWithSettings:v12 error:&v18];
  id v14 = v18;
  uint64_t v15 = CKLogContextVocabulary;
  if ((v13 & 1) == 0 && os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v25 = "-[CKVTaskManager _didTriggerMigration:reason:]_block_invoke";
    __int16 v26 = 2112;
    id v27 = v14;
    _os_log_error_impl(&dword_1A77B3000, v15, OS_LOG_TYPE_ERROR, "%s Failed to record migration completed: %@", buf, 0x16u);
    uint64_t v15 = CKLogContextVocabulary;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = *(void **)(*(void *)(a1 + 32) + 8);
    *(_DWORD *)buf = 136315394;
    id v25 = "-[CKVTaskManager _didTriggerMigration:reason:]_block_invoke";
    __int16 v26 = 2112;
    id v27 = v16;
    _os_log_impl(&dword_1A77B3000, v15, OS_LOG_TYPE_INFO, "%s (%@) Migration completed.", buf, 0x16u);
  }
  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(void))(v17 + 16))();
  }
}

- (BOOL)clearAllState
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    rootDirectoryURL = self->_rootDirectoryURL;
    *(_DWORD *)buf = 136315394;
    long long v21 = "-[CKVTaskManager clearAllState]";
    __int16 v22 = 2112;
    dispatch_semaphore_t v23 = rootDirectoryURL;
    _os_log_impl(&dword_1A77B3000, v3, OS_LOG_TYPE_INFO, "%s Clearing root directory: %@", buf, 0x16u);
  }
  v19[2] = 0;
  int v5 = KVRemoveItemIfExistsAtURL();
  uint64_t v6 = (NSURL *)0;
  if (!v5)
  {
LABEL_9:
    uint64_t v13 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      id v18 = self->_rootDirectoryURL;
      *(_DWORD *)buf = 136315650;
      long long v21 = "-[CKVTaskManager clearAllState]";
      __int16 v22 = 2112;
      dispatch_semaphore_t v23 = v18;
      __int16 v24 = 2112;
      id v25 = v6;
      uint64_t v15 = "%s Failed to reset task handler root directory (%@) error: %@";
      uint64_t v16 = v13;
      uint32_t v17 = 32;
      goto LABEL_15;
    }
LABEL_10:
    BOOL v12 = 0;
    goto LABEL_11;
  }
  v19[1] = v6;
  uint64_t v7 = KVGetOrCreateDirectoryURL();
  uint64_t v8 = v6;

  if (!v7)
  {
    uint64_t v6 = v8;
    goto LABEL_9;
  }
  [(CKVTaskManager *)self _loadOrCreateTaskInfo];
  info = self->_info;
  v19[0] = v8;
  BOOL v10 = [(CKVTaskManagerInfo *)info updateSchemaVersion:&unk_1EFD7D5C8 error:v19];
  uint64_t v6 = (NSURL *)v19[0];

  BOOL v11 = CKLogContextVocabulary;
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v21 = "-[CKVTaskManager clearAllState]";
      __int16 v22 = 2112;
      dispatch_semaphore_t v23 = v6;
      uint64_t v15 = "%s Failed to record schema version: %@";
      uint64_t v16 = v11;
      uint32_t v17 = 22;
LABEL_15:
      _os_log_error_impl(&dword_1A77B3000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  BOOL v12 = 1;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v21 = "-[CKVTaskManager clearAllState]";
    __int16 v22 = 2112;
    dispatch_semaphore_t v23 = (NSURL *)&unk_1EFD7D5C8;
    _os_log_impl(&dword_1A77B3000, v11, OS_LOG_TYPE_INFO, "%s Root directory initialized with schema version: %@", buf, 0x16u);
  }
LABEL_11:

  return v12;
}

- (BOOL)_loadOrCreateTaskInfo
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [CKVTaskManagerInfo alloc];
  rootDirectoryURL = self->_rootDirectoryURL;
  id v11 = 0;
  int v5 = [(CKVTaskManagerInfo *)v3 initWithRootDirectoryURL:rootDirectoryURL error:&v11];
  id v6 = v11;
  info = self->_info;
  self->_info = v5;

  uint64_t v8 = self->_info;
  if (!v8)
  {
    uint64_t v9 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "-[CKVTaskManager _loadOrCreateTaskInfo]";
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl(&dword_1A77B3000, v9, OS_LOG_TYPE_ERROR, "%s Failed to load / create info: %@", buf, 0x16u);
    }
  }

  return v8 != 0;
}

- (BOOL)_validateFilesystemState
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = KVGetOrCreateDirectoryURL();
  uint64_t v4 = (__CFString *)0;

  if (v3)
  {
    [(CKVTaskManager *)self _loadOrCreateTaskInfo];
    int v5 = [(CKVTaskManagerInfo *)self->_info schemaVersion];
    if ([&unk_1EFD7D5C8 isEqual:v5])
    {
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v8 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = @"empty";
        *(_DWORD *)buf = 136315650;
        uint64_t v13 = "-[CKVTaskManager _validateFilesystemState]";
        __int16 v14 = 2112;
        if (v5) {
          uint64_t v9 = v5;
        }
        id v15 = (NSURL *)&unk_1EFD7D5C8;
        __int16 v16 = 2112;
        uint32_t v17 = v9;
        _os_log_impl(&dword_1A77B3000, v8, OS_LOG_TYPE_INFO, "%s Current schema (expected: %@) not initialized yet (found: %@)", buf, 0x20u);
      }
      BOOL v6 = [(CKVTaskManager *)self clearAllState];
    }
  }
  else
  {
    uint64_t v7 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      rootDirectoryURL = self->_rootDirectoryURL;
      *(_DWORD *)buf = 136315650;
      uint64_t v13 = "-[CKVTaskManager _validateFilesystemState]";
      __int16 v14 = 2112;
      id v15 = rootDirectoryURL;
      __int16 v16 = 2112;
      uint32_t v17 = v4;
      _os_log_error_impl(&dword_1A77B3000, v7, OS_LOG_TYPE_ERROR, "%s Failed to resolve / create root directory: %@ error: %@", buf, 0x20u);
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (CKVTaskManager)initWithManagerName:(id)a3 rootDirectoryURL:(id)a4 setEnumerator:(id)a5 settings:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CKVTaskManager;
  id v15 = [(CKVTaskManager *)&v25 init];
  __int16 v16 = v15;
  if (!v15) {
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v15->_managerName, a3);
  objc_storeStrong((id *)&v16->_settings, a6);
  objc_storeStrong((id *)&v16->_setEnumerator, a5);
  objc_storeStrong((id *)&v16->_rootDirectoryURL, a4);
  if (![(CKVTaskManager *)v16 _validateFilesystemState]) {
    goto LABEL_6;
  }
  uint32_t v17 = [CKVDonateTaskFactory alloc];
  uint64_t v18 = [(CKVTaskManagerInfo *)v16->_info donateDirectory];
  uint64_t v19 = [(CKVDonateTaskFactory *)v17 initWithDirectory:v18 timeout:300.0];
  donateTaskProvider = v16->_donateTaskProvider;
  v16->_donateTaskProvider = (CKVDonateTaskProvider *)v19;

  if (!v16->_donateTaskProvider) {
    goto LABEL_6;
  }
  long long v21 = [[CKVTaskCoalescer alloc] initWithManagerName:v16->_managerName coalescenceInterval:25 coalescenceDelay:v14 dispatchQoS:10.0 settings:2.0];
  coalescer = v16->_coalescer;
  v16->_coalescer = v21;

  if (v16->_coalescer) {
LABEL_5:
  }
    dispatch_semaphore_t v23 = v16;
  else {
LABEL_6:
  }
    dispatch_semaphore_t v23 = 0;

  return v23;
}

+ (id)siriLanguageDependentDonateTasks
{
  return &unk_1EFD7D730;
}

+ (id)verificationTasks
{
  return &unk_1EFD7D718;
}

+ (id)dailyDonateTasks
{
  return &unk_1EFD7D700;
}

+ (id)migrationDonateTasks
{
  return &unk_1EFD7D6E8;
}

+ (id)defaultManager
{
  id v2 = objc_alloc((Class)objc_opt_class());
  uint64_t v3 = KVTaskManagerRootDirectoryURL();
  uint64_t v4 = [MEMORY[0x1E4F57FB8] setEnumerator];
  int v5 = +[CKVTaskSettings defaultSettings];
  BOOL v6 = (void *)[v2 initWithManagerName:@"Default" rootDirectoryURL:v3 setEnumerator:v4 settings:v5];

  return v6;
}

@end