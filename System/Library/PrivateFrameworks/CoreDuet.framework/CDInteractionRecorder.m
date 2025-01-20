@interface CDInteractionRecorder
@end

@implementation CDInteractionRecorder

void __87___CDInteractionRecorder_deleteInteractionsWithBundleId_synchronous_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

uint64_t __45___CDInteractionRecorder_interactionRecorder__block_invoke()
{
  v0 = [[_CDInteractionRecorder alloc] initWithServiceName:@"com.apple.coreduetd.people"];
  uint64_t v1 = interactionRecorder_recorder;
  interactionRecorder_recorder = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke()
{
  dispatch_group_t v0 = dispatch_group_create();
  uint64_t v1 = (void *)recordInteractions_synchronous_completionHandler__group;
  recordInteractions_synchronous_completionHandler__group = (uint64_t)v0;

  uint64_t v2 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"recordInteractions:synchronous:completionHandler:"];
  uint64_t v3 = recordInteractions_synchronous_completionHandler__queue;
  recordInteractions_synchronous_completionHandler__queue = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

void __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_15(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_2;
  v11[3] = &unk_1E56104C8;
  v11[4] = a1[6];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_3;
  v7[3] = &unk_1E5610518;
  uint64_t v4 = a1[4];
  uint64_t v5 = (void *)a1[5];
  id v8 = v3;
  uint64_t v9 = v4;
  uint64_t v10 = a1[7];
  id v6 = v3;
  objc_msgSend(v5, "_pas_enumerateChunksOfSize:usingBlock:", 128, v7);
  dispatch_group_leave((dispatch_group_t)recordInteractions_synchronous_completionHandler__group);
  atomic_store(0, recordInteractions_synchronous_completionHandler__flag);
}

void __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
}

void __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v7 = a2;
  uint64_t v8 = [v6 enforceDataLimits];
  uint64_t v9 = [*(id *)(a1 + 40) enforcePrivacy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_4;
  v10[3] = &unk_1E56104F0;
  v10[4] = *(void *)(a1 + 48);
  [v5 recordInteractions:v7 enforceDataLimits:v8 enforcePrivacy:v9 reply:v10];

  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) ^ 1;
}

void __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_4(uint64_t a1, int a2)
{
  char v2 = a2;
  if (a2)
  {
    uint64_t v4 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_18ECEB000, v4, OS_LOG_TYPE_DEFAULT, "[sync path] batch sent successfully", v5, 2u);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
}

void __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  dispatch_group_leave((dispatch_group_t)recordInteractions_synchronous_completionHandler__group);
  atomic_store(0, recordInteractions_synchronous_completionHandler__flag);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

void __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_2_20(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (atomic_exchange((atomic_uchar *volatile)recordInteractions_synchronous_completionHandler__flag, 1u))
  {
    dispatch_group_enter((dispatch_group_t)recordInteractions_synchronous_completionHandler__group);
    uint64_t v3 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 134217984;
      uint64_t v10 = v4;
      _os_log_impl(&dword_18ECEB000, v3, OS_LOG_TYPE_DEFAULT, "[async path] beginning recordInteractions (%tu interactions)", buf, 0xCu);
    }

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_21;
    v7[3] = &unk_1E560D640;
    id v8 = *(id *)(a1 + 48);
    uint64_t v5 = (void *)MEMORY[0x192FB31A0](v7);
    id v6 = [*(id *)(*(void *)(a1 + 40) + 8) remoteObjectProxyWithErrorHandler:v5];
    recordInteractionsAsync(v6, *(void **)(a1 + 32), 0, [*(id *)(a1 + 40) enforceDataLimits], objc_msgSend(*(id *)(a1 + 40), "enforcePrivacy"), *(void **)(a1 + 48));
  }
  else
  {
    char v2 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18ECEB000, v2, OS_LOG_TYPE_DEFAULT, "[async path] It's not our turn yet...", buf, 2u);
    }

    dispatch_group_notify((dispatch_group_t)recordInteractions_synchronous_completionHandler__group, (dispatch_queue_t)recordInteractions_synchronous_completionHandler__queue, *(dispatch_block_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  }
}

void __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_21(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_21_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __110___CDInteractionRecorder_queryInteractionsUsingPredicate_synchronous_sortDescriptors_limit_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __86___CDInteractionRecorder_queryInteractionsUsingPredicate_sortDescriptors_limit_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __88___CDInteractionRecorder_countInteractionsUsingPredicate_synchronous_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __64___CDInteractionRecorder_countInteractionsUsingPredicate_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __106___CDInteractionRecorder_queryContactsUsingPredicate_synchronous_sortDescriptors_limit_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __82___CDInteractionRecorder_queryContactsUsingPredicate_sortDescriptors_limit_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __84___CDInteractionRecorder_countContactsUsingPredicate_synchronous_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __60___CDInteractionRecorder_countContactsUsingPredicate_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __130___CDInteractionRecorder_deleteInteractionsMatchingPredicate_synchronous_sortDescriptors_limit_debuggingReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __106___CDInteractionRecorder_deleteInteractionsMatchingPredicate_sortDescriptors_limit_debuggingReason_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __63___CDInteractionRecorder_deleteInteractionsWithBundleId_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __95___CDInteractionRecorder_deleteInteractionsWithBundleId_synchronous_account_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __71___CDInteractionRecorder_deleteInteractionsWithBundleId_account_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __104___CDInteractionRecorder_deleteInteractionsWithBundleId_synchronous_domainIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __80___CDInteractionRecorder_deleteInteractionsWithBundleId_domainIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __105___CDInteractionRecorder_deleteInteractionsWithBundleId_synchronous_domainIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __81___CDInteractionRecorder_deleteInteractionsWithBundleId_domainIdentifiers_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_21_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "[async path] xpc error: %{public}@", v2, v3, v4, v5, v6);
}

@end