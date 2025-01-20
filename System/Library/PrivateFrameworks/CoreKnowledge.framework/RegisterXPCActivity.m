@interface RegisterXPCActivity
@end

@implementation RegisterXPCActivity

void ___RegisterXPCActivity_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state)
  {
    if (state == 2 && *(void *)(a1 + 32))
    {
      if (!xpc_activity_set_state(v3, 4))
      {
        v5 = CKLogContextVocabulary;
        if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v11 = "_RegisterXPCActivity_block_invoke";
          _os_log_error_impl(&dword_1A77B3000, v5, OS_LOG_TYPE_ERROR, "%s Failed setting activity state to continue", buf, 0xCu);
        }
      }
      uint64_t v6 = *(void *)(a1 + 32);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = ___RegisterXPCActivity_block_invoke_6;
      v8[3] = &unk_1E5CF9B68;
      v9 = v3;
      (*(void (**)(uint64_t, _xpc_activity_s *, void *))(v6 + 16))(v6, v9, v8);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, _xpc_activity_s *))(v7 + 16))(v7, v3);
    }
  }
}

void ___RegisterXPCActivity_block_invoke_6(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    if (xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3)) {
      return;
    }
    v2 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      v5 = "_RegisterXPCActivity_block_invoke";
      _os_log_error_impl(&dword_1A77B3000, v2, OS_LOG_TYPE_ERROR, "%s Tried to defer activity but failed", (uint8_t *)&v4, 0xCu);
    }
  }
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
  {
    v3 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      v5 = "_RegisterXPCActivity_block_invoke";
      _os_log_error_impl(&dword_1A77B3000, v3, OS_LOG_TYPE_ERROR, "%s Failed setting activity state to done", (uint8_t *)&v4, 0xCu);
    }
  }
}

@end