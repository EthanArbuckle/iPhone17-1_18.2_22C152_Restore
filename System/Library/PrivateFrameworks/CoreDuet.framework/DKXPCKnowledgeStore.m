@interface DKXPCKnowledgeStore
@end

@implementation DKXPCKnowledgeStore

uint64_t __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_2_19(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 40) handleResults:v5 error:v6];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v9 = +[_CDLogging knowledgeChannel];
  v10 = v9;
  if (v7) {
    BOOL v11 = v6 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11) {
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
  }
  BOOL v13 = os_log_type_enabled(v9, v12);
  if (isKindOfClass)
  {
    if (!v13) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = v7 != 0;
    *(_WORD *)v31 = 2048;
    *(void *)&v31[2] = [v7 count];
    *(_WORD *)&v31[10] = 2112;
    *(void *)&v31[12] = v6;
    v14 = "Completed executeQuery with success=%d, count=%lu. Error: %@.";
    v15 = v10;
    os_log_type_t v16 = v12;
    uint32_t v17 = 28;
  }
  else
  {
    if (!v13) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v7 != 0;
    *(_WORD *)v31 = 2112;
    *(void *)&v31[2] = v6;
    v14 = "Completed executeQuery with success=%d. Error: %@.";
    v15 = v10;
    os_log_type_t v16 = v12;
    uint32_t v17 = 18;
  }
  _os_log_impl(&dword_18ECEB000, v15, v16, v14, buf, v17);
LABEL_13:

  v18 = *(void **)(a1 + 56);
  if (v18)
  {
    v19 = *(void **)(a1 + 48);
    if (!v19) {
      __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_3_cold_1();
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_2_19;
    v26[3] = &unk_1E560F278;
    id v29 = v18;
    id v27 = v7;
    id v28 = v6;
    v20 = v26;
    v21 = v19;
    v22 = (void *)os_transaction_create();
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)v31 = 3221225472;
    *(void *)&v31[8] = __cd_dispatch_async_capture_tx_block_invoke_11;
    *(void *)&v31[16] = &unk_1E560D978;
    id v32 = v22;
    id v33 = v20;
    id v23 = v22;
    dispatch_async(v21, buf);
  }
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  }
  uint64_t v24 = *(void *)(*(void *)(a1 + 72) + 8);
  v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v7;
}

void __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();
  }

  id v5 = (void *)a1[5];
  if (v5)
  {
    id v6 = (void *)a1[4];
    if (!v6) {
      __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_1();
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_2;
    v13[3] = &unk_1E560D978;
    id v15 = v5;
    id v14 = v3;
    v7 = v13;
    v8 = v6;
    v9 = (void *)os_transaction_create();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_11;
    block[3] = &unk_1E560D978;
    id v17 = v9;
    id v18 = v7;
    id v10 = v9;
    dispatch_async(v8, block);
  }
  uint64_t v11 = *(void *)(a1[6] + 8);
  os_log_type_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
}

uint64_t __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_3(void *a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[_CDLogging knowledgeChannel];
  v8 = v7;
  if (((v6 == 0) & a2) != 0) {
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v7, v9))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = a2;
    LOWORD(v21) = 2112;
    *(void *)((char *)&v21 + 2) = v6;
    _os_log_impl(&dword_18ECEB000, v8, v9, "Completed saveObjects with success=%d. Error: %@.", buf, 0x12u);
  }

  id v10 = (void *)a1[6];
  if (v10)
  {
    uint64_t v11 = (void *)a1[5];
    if (!v11) {
      __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_3_cold_1();
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_2_7;
    v16[3] = &unk_1E560F140;
    id v18 = v10;
    char v19 = a2;
    id v17 = v6;
    os_log_type_t v12 = v16;
    BOOL v13 = v11;
    id v14 = (void *)os_transaction_create();
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&long long v21 = 3221225472;
    *((void *)&v21 + 1) = __cd_dispatch_async_capture_tx_block_invoke_11;
    v22 = &unk_1E560D978;
    id v23 = v14;
    id v24 = v12;
    id v15 = v14;
    dispatch_async(v13, buf);
  }
  if (v6) {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
  }
}

uint64_t __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_2_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  v4 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();
  }

  id v5 = (void *)a1[5];
  if (v5)
  {
    id v6 = (void *)a1[4];
    if (!v6) {
      __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_2_cold_1();
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_2_9;
    v13[3] = &unk_1E560D978;
    id v15 = v5;
    id v14 = v3;
    v7 = v13;
    v8 = v6;
    os_log_type_t v9 = (void *)os_transaction_create();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_11;
    block[3] = &unk_1E560D978;
    id v17 = v9;
    id v18 = v7;
    id v10 = v9;
    dispatch_async(v8, block);
  }
  uint64_t v11 = *(void *)(a1[6] + 8);
  os_log_type_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
}

uint64_t __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_2_9(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_3(void *a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[_CDLogging knowledgeChannel];
  v8 = v7;
  if (((v6 == 0) & a2) != 0) {
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v7, v9))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = a2;
    LOWORD(v21) = 2112;
    *(void *)((char *)&v21 + 2) = v6;
    _os_log_impl(&dword_18ECEB000, v8, v9, "Completed deleteObjects with success=%d. Error: %@.", buf, 0x12u);
  }

  id v10 = (void *)a1[6];
  if (v10)
  {
    uint64_t v11 = (void *)a1[5];
    if (!v11) {
      __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_3_cold_1();
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_2_10;
    v16[3] = &unk_1E560F140;
    id v18 = v10;
    char v19 = a2;
    id v17 = v6;
    os_log_type_t v12 = v16;
    BOOL v13 = v11;
    id v14 = (void *)os_transaction_create();
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&long long v21 = 3221225472;
    *((void *)&v21 + 1) = __cd_dispatch_async_capture_tx_block_invoke_11;
    v22 = &unk_1E560D978;
    id v23 = v14;
    id v24 = v12;
    id v15 = v14;
    dispatch_async(v13, buf);
  }
  if (v6) {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
  }
}

uint64_t __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_2_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_11(void *a1, void *a2)
{
  id v3 = a2;
  v4 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();
  }

  id v5 = (void *)a1[5];
  if (v5)
  {
    id v6 = (void *)a1[4];
    if (!v6) {
      __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_11_cold_1();
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_2;
    v13[3] = &unk_1E560D978;
    id v15 = v5;
    id v14 = v3;
    v7 = v13;
    v8 = v6;
    os_log_type_t v9 = (void *)os_transaction_create();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_11;
    block[3] = &unk_1E560D978;
    id v17 = v9;
    id v18 = v7;
    id v10 = v9;
    dispatch_async(v8, block);
  }
  uint64_t v11 = *(void *)(a1[6] + 8);
  os_log_type_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
}

uint64_t __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_3(void *a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[_CDLogging knowledgeChannel];
  v8 = v7;
  if (v6) {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  if (os_log_type_enabled(v7, v9))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = a2;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_18ECEB000, v8, v9, "Completed deleteAllEventsInEventStreamNamed with count=%lu. Error: %@.", buf, 0x16u);
  }

  *(void *)(*(void *)(a1[7] + 8) + 24) = a2;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a3);
  }
  id v10 = (void *)a1[6];
  if (v10)
  {
    uint64_t v11 = (void *)a1[5];
    if (!v11) {
      __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_3_cold_1();
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_2_12;
    v16[3] = &unk_1E5610910;
    id v17 = v10;
    long long v18 = *(_OWORD *)(a1 + 7);
    os_log_type_t v12 = v16;
    BOOL v13 = v11;
    id v14 = (void *)os_transaction_create();
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&buf[16] = __cd_dispatch_async_capture_tx_block_invoke_11;
    v20 = &unk_1E560D978;
    id v21 = v14;
    id v22 = v12;
    id v15 = v14;
    dispatch_async(v13, buf);
  }
}

uint64_t __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_2_12(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

uint64_t __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_14(void *a1, void *a2)
{
  id v3 = a2;
  v4 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();
  }

  id v5 = (void *)a1[5];
  if (v5)
  {
    id v6 = (void *)a1[4];
    if (!v6) {
      __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_14_cold_1();
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_2;
    v13[3] = &unk_1E560D978;
    id v15 = v5;
    id v14 = v3;
    v7 = v13;
    v8 = v6;
    os_log_type_t v9 = (void *)os_transaction_create();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_11;
    block[3] = &unk_1E560D978;
    id v17 = v9;
    id v18 = v7;
    id v10 = v9;
    dispatch_async(v8, block);
  }
  uint64_t v11 = *(void *)(a1[6] + 8);
  os_log_type_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
}

uint64_t __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_3(void *a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[_CDLogging knowledgeChannel];
  v8 = v7;
  if (v6) {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  if (os_log_type_enabled(v7, v9))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = a2;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_18ECEB000, v8, v9, "Completed deleteAllEventsMatchingPredicate with count=%lu. Error: %@.", buf, 0x16u);
  }

  *(void *)(*(void *)(a1[7] + 8) + 24) = a2;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a3);
  }
  id v10 = (void *)a1[6];
  if (v10)
  {
    uint64_t v11 = (void *)a1[5];
    if (!v11) {
      __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_3_cold_1();
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_2_15;
    v16[3] = &unk_1E5610910;
    id v17 = v10;
    long long v18 = *(_OWORD *)(a1 + 7);
    os_log_type_t v12 = v16;
    BOOL v13 = v11;
    id v14 = (void *)os_transaction_create();
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&buf[16] = __cd_dispatch_async_capture_tx_block_invoke_11;
    v20 = &unk_1E560D978;
    id v21 = v14;
    id v22 = v12;
    id v15 = v14;
    dispatch_async(v13, buf);
  }
}

uint64_t __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_2_15(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

void __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[_DKQuery queryNotExecutableError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  v4 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();
  }

  id v5 = (void *)a1[5];
  if (v5)
  {
    id v6 = (void *)a1[4];
    if (!v6) {
      __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_2_cold_1();
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_2_17;
    v13[3] = &unk_1E560D978;
    id v15 = v5;
    id v14 = v3;
    v7 = v13;
    v8 = v6;
    os_log_type_t v9 = (void *)os_transaction_create();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_11;
    block[3] = &unk_1E560D978;
    id v17 = v9;
    id v18 = v7;
    id v10 = v9;
    dispatch_async(v8, block);
  }
  uint64_t v11 = *(void *)(a1[6] + 8);
  os_log_type_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
}

uint64_t __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_2_17(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __45___DKXPCKnowledgeStore_synchronizeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();
  }

  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __45___DKXPCKnowledgeStore_synchronizeWithError___block_invoke_21(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[_CDLogging knowledgeChannel];
  v8 = v7;
  if (((v6 == 0) & a2) != 0) {
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v7, v9))
  {
    v10[0] = 67109378;
    v10[1] = a2;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_18ECEB000, v8, v9, "Completed synchronizeWithError with success=%d. Error: %@.", (uint8_t *)v10, 0x12u);
  }

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

void __60___DKXPCKnowledgeStore_synchronizeWithUrgency_client_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();
  }

  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __60___DKXPCKnowledgeStore_synchronizeWithUrgency_client_error___block_invoke_22(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[_CDLogging knowledgeChannel];
  v8 = v7;
  if (((v6 == 0) & a2) != 0) {
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v7, v9))
  {
    v10[0] = 67109378;
    v10[1] = a2;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_18ECEB000, v8, v9, "Completed synchronizeWithUrgency with success=%d. Error: %@.", (uint8_t *)v10, 0x12u);
  }

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

void __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();
  }

  id v5 = *(void **)(a1 + 40);
  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    if (!v6) {
      __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_cold_1();
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_2;
    v11[3] = &unk_1E560D978;
    id v13 = v5;
    id v12 = v3;
    v7 = v11;
    v8 = v6;
    os_log_type_t v9 = (void *)os_transaction_create();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_11;
    block[3] = &unk_1E560D978;
    id v15 = v9;
    id v16 = v7;
    id v10 = v9;
    dispatch_async(v8, block);
  }
}

uint64_t __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[_CDLogging knowledgeChannel];
  v7 = v6;
  if (((v5 == 0) & a2) != 0) {
    os_log_type_t v8 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v6, v8))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = a2;
    LOWORD(v19) = 2112;
    *(void *)((char *)&v19 + 2) = v5;
    _os_log_impl(&dword_18ECEB000, v7, v8, "Completed synchronizeWithUrgency with success=%d. Error: %@.", buf, 0x12u);
  }

  os_log_type_t v9 = *(void **)(a1 + 48);
  if (v9)
  {
    id v10 = *(void **)(a1 + 40);
    if (!v10) {
      __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_3_cold_1();
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_2_23;
    v15[3] = &unk_1E560D978;
    id v17 = v9;
    id v16 = v5;
    __int16 v11 = v15;
    id v12 = v10;
    id v13 = (void *)os_transaction_create();
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&long long v19 = 3221225472;
    *((void *)&v19 + 1) = __cd_dispatch_async_capture_tx_block_invoke_11;
    v20 = &unk_1E560D978;
    id v21 = v13;
    id v22 = v11;
    id v14 = v13;
    dispatch_async(v12, buf);
  }
}

uint64_t __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_2_23(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __42___DKXPCKnowledgeStore_deleteRemoteState___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();
  }

  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __42___DKXPCKnowledgeStore_deleteRemoteState___block_invoke_24(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[_CDLogging knowledgeChannel];
  os_log_type_t v8 = v7;
  if (((v6 == 0) & a2) != 0) {
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v7, v9))
  {
    v10[0] = 67109378;
    v10[1] = a2;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_18ECEB000, v8, v9, "Completed deleteRemoteState with success=%d. Error: %@.", (uint8_t *)v10, 0x12u);
  }

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

void __54___DKXPCKnowledgeStore_sourceDeviceIdentityWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();
  }

  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __54___DKXPCKnowledgeStore_sourceDeviceIdentityWithError___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = +[_CDLogging knowledgeChannel];
  os_log_type_t v8 = v7;
  if (v6) {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  if (os_log_type_enabled(v7, v9))
  {
    v12[0] = 67109378;
    v12[1] = v6 == 0;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_18ECEB000, v8, v9, "Completed sourceDeviceIdentityWithError with success=%d. Error: %@.", (uint8_t *)v12, 0x12u);
  }

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

void __34___DKXPCKnowledgeStore_deviceUUID__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();
  }
}

void __34___DKXPCKnowledgeStore_deviceUUID__block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = +[_CDLogging knowledgeChannel];
  os_log_type_t v8 = v7;
  if (v6) {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  if (os_log_type_enabled(v7, v9))
  {
    v12[0] = 67109378;
    v12[1] = v6 == 0;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_18ECEB000, v8, v9, "Completed deviceUUIDWithReply with success=%d. Error: %@.", (uint8_t *)v12, 0x12u);
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  __int16 v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

void __66___DKXPCKnowledgeStore_disableSyncPolicyForFeature_transportType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();
  }
}

void __66___DKXPCKnowledgeStore_disableSyncPolicyForFeature_transportType___block_invoke_29(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[_CDLogging knowledgeChannel];
  id v6 = v5;
  if (a2) {
    os_log_type_t v7 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v5, v7))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_18ECEB000, v6, v7, "Completed disableSyncPolicyWithReply with success=%d. Error: %@.", (uint8_t *)v8, 0x12u);
  }
}

void __69___DKXPCKnowledgeStore_isSyncPolicyDisabledForFeature_transportType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();
  }
}

void __69___DKXPCKnowledgeStore_isSyncPolicyDisabledForFeature_transportType___block_invoke_34(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[_CDLogging knowledgeChannel];
  os_log_type_t v7 = v6;
  if (v5) {
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
  }
  else {
    os_log_type_t v8 = OS_LOG_TYPE_INFO;
  }
  if (os_log_type_enabled(v6, v8))
  {
    int v9 = 134218498;
    uint64_t v10 = a2;
    __int16 v11 = 1024;
    BOOL v12 = v5 == 0;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_18ECEB000, v7, v8, "Completed isSyncPolicyDisabled->%lu with success=%d. Error: %@.", (uint8_t *)&v9, 0x1Cu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2 != 0;
}

void __51___DKXPCKnowledgeStore_confirmConnectionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();
  }

  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __51___DKXPCKnowledgeStore_confirmConnectionWithError___block_invoke_35(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_log_type_t v7 = +[_CDLogging knowledgeChannel];
  os_log_type_t v8 = v7;
  BOOL v9 = v6 == 0;
  char v10 = v9 & a2;
  if ((v9 & a2) != 0) {
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v7, v11))
  {
    v12[0] = 67109378;
    v12[1] = a2;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_18ECEB000, v8, v11, "Completed confirmConnectionWithError with success=%d. Error: %@.", (uint8_t *)v12, 0x12u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v10 & 1;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

void __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_1()
{
}

void __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "XPC error: %@\n", v2, v3, v4, v5, v6);
}

void __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_3_cold_1()
{
}

void __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_2_cold_1()
{
}

void __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_3_cold_1()
{
}

void __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_11_cold_1()
{
}

void __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_3_cold_1()
{
}

void __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_14_cold_1()
{
}

void __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_3_cold_1()
{
}

void __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_2_cold_1()
{
}

void __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_3_cold_1()
{
}

void __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_cold_1()
{
}

void __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_3_cold_1()
{
}

@end