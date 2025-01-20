@interface INVocabularyConnection
@end

@implementation INVocabularyConnection

uint64_t __42___INVocabularyConnection_settingsService__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(v2 + 8) remoteObjectProxy];
  }
  else
  {
    [(id)v2 _connect];
    uint64_t v3 = [(id)objc_claimAutoreleasedReturnValue() remoteObjectProxy];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }

  return MEMORY[0x1F41817F8]();
}

void __35___INVocabularyConnection__connect__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315650;
    v6 = "-[_INVocabularyConnection _connect]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    __int16 v9 = 2112;
    id v10 = WeakRetained;
    _os_log_impl(&dword_18CB2F000, v4, OS_LOG_TYPE_INFO, "%s connection %@ by %@ was interrupted", (uint8_t *)&v5, 0x20u);
  }
}

void __35___INVocabularyConnection__connect__block_invoke_69(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315650;
    v6 = "-[_INVocabularyConnection _connect]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    __int16 v9 = 2112;
    id v10 = WeakRetained;
    _os_log_impl(&dword_18CB2F000, v4, OS_LOG_TYPE_INFO, "%s connection %@ by %@ was invalidated", (uint8_t *)&v5, 0x20u);
  }
  [WeakRetained _clearConnection];
}

void __43___INVocabularyConnection__clearConnection__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  [*(id *)(*(void *)(a1 + 32) + 8) setInvalidationHandler:0];
  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

@end