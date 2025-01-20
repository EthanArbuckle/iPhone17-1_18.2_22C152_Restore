@interface CDXPCEventPublisher
@end

@implementation CDXPCEventPublisher

void __55___CDXPCEventPublisher_sendEvent_toSubscriber_handler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained sendEvent:*(void *)(a1 + 32) toSubscriber:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
  }
  else
  {
    v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduetd" code:4 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __56___CDXPCEventPublisher_activatePublisherWithStreamName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v6 = (id *)(a1 + 32);
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained handleEventWithAction:a2 token:a3 descriptor:v7];
}

void __56___CDXPCEventPublisher_activatePublisherWithStreamName___block_invoke_2(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __56___CDXPCEventPublisher_activatePublisherWithStreamName___block_invoke_2_cold_1(a1, v2);
  }
}

void __60___CDXPCEventPublisher_sendEvent_toSubscriber_replyHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained sendEvent:*(void *)(a1 + 32) toSubscriber:*(void *)(a1 + 40) replyHandler:*(void *)(a1 + 48)];
  }
  else
  {
    v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreduetd" code:4 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __60___CDXPCEventPublisher_sendEvent_toSubscriber_replyHandler___block_invoke_8(void *a1, void *a2)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[_CDXPCCodecs errorFromReply:v3];
  uint64_t v5 = a1[4];
  v6 = *(NSObject **)(v5 + 40);
  if (v4)
  {
    if (os_log_type_enabled(*(os_log_t *)(v5 + 40), OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[5];
      uint64_t v8 = *(void *)(a1[4] + 16);
      int v18 = 138543874;
      uint64_t v19 = v8;
      __int16 v20 = 2114;
      uint64_t v21 = v7;
      __int16 v22 = 2112;
      v23[0] = v4;
      _os_log_error_impl(&dword_18ECEB000, v6, OS_LOG_TYPE_ERROR, "Received error in reply on stream %{public}@ from subscriber %{public}@: %@", (uint8_t *)&v18, 0x20u);
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(v5 + 40), OS_LOG_TYPE_DEBUG))
  {
    if (os_variant_has_internal_diagnostics())
    {
      v9 = (void *)MEMORY[0x192FB36A0](v3);
      v10 = *(NSObject **)(a1[4] + 40);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = a1[5];
        uint64_t v13 = *(void *)(a1[4] + 16);
        v14 = v10;
        int v18 = 138544130;
        uint64_t v19 = v13;
        __int16 v20 = 2114;
        uint64_t v21 = v12;
        __int16 v22 = 1024;
        LODWORD(v23[0]) = xpc_dictionary_get_count(v3);
        WORD2(v23[0]) = 2080;
        *(void *)((char *)v23 + 6) = v9;
        _os_log_debug_impl(&dword_18ECEB000, v14, OS_LOG_TYPE_DEBUG, "Fetched reply on stream %{public}@ from subscriber %{public}@ with %d keys: %s", (uint8_t *)&v18, 0x26u);

        if (!v9) {
          goto LABEL_11;
        }
      }
      else if (!v9)
      {
        goto LABEL_11;
      }
      free(v9);
      goto LABEL_11;
    }
    v11 = *(NSObject **)(a1[4] + 40);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = a1[5];
      uint64_t v16 = *(void *)(a1[4] + 16);
      v17 = v11;
      int v18 = 138543874;
      uint64_t v19 = v16;
      __int16 v20 = 2114;
      uint64_t v21 = v15;
      __int16 v22 = 1024;
      LODWORD(v23[0]) = xpc_dictionary_get_count(v3);
      _os_log_debug_impl(&dword_18ECEB000, v17, OS_LOG_TYPE_DEBUG, "Fetched reply on stream %{public}@ from subscriber %{public}@ with %d keys", (uint8_t *)&v18, 0x1Cu);
    }
  }
LABEL_11:
  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __51___CDXPCEventPublisher_addToken_descriptor_userID___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addSubscriber:*(void *)(a1 + 40)];
}

uint64_t __36___CDXPCEventPublisher_removeToken___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeSubscriberWithToken:*(void *)(a1 + 40) streamName:*(void *)(*(void *)(a1 + 32) + 16)];
}

void __56___CDXPCEventPublisher_activatePublisherWithStreamName___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  xpc_strerror();
  OUTLINED_FUNCTION_0_11();
  _os_log_error_impl(&dword_18ECEB000, v2, OS_LOG_TYPE_ERROR, "Unexpected error from publisher for stream %{public}s: %s", v3, 0x16u);
}

@end