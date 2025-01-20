@interface LTSpeechTranslationRequest
@end

@implementation LTSpeechTranslationRequest

void __65___LTSpeechTranslationRequest__startTranslationWithService_done___block_invoke(id *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v3 = [a1[5] copy];
    v4 = (void *)*((void *)WeakRetained + 18);
    *((void *)WeakRetained + 18) = v3;

    objc_storeStrong((id *)WeakRetained + 17, a1[4]);
    v5 = (void *)*((void *)WeakRetained + 17);
    v6 = [WeakRetained requestContext];
    [v5 startSpeechTranslationWithContext:v6];

    if ([*((id *)WeakRetained + 15) count])
    {
      v7 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24639B000, v7, OS_LOG_TYPE_DEFAULT, "Drain queued buffers first", buf, 2u);
      }
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v8 = *((id *)WeakRetained + 15);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(const void **)(*((void *)&v16 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [WeakRetained _appendAudioPCMBuffer:v13];
            }
            else
            {
              CFTypeID v14 = CFGetTypeID(v13);
              if (v14 == CMSampleBufferGetTypeID()) {
                objc_msgSend(WeakRetained, "_appendAudioSampleBuffer:simulateRealtime:", v13, 0, (void)v16);
              }
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v10);
      }
    }
    v15 = (void *)*((void *)WeakRetained + 15);
    *((void *)WeakRetained + 15) = 0;
  }
}

void __52___LTSpeechTranslationRequest_appendAudioPCMBuffer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    if (WeakRetained[17])
    {
      [*(id *)(a1 + 40) _appendAudioPCMBuffer:*(void *)(a1 + 32)];
    }
    else
    {
      uint64_t v3 = (void *)WeakRetained[15];
      if (v3)
      {
        id v4 = v3;
      }
      else
      {
        id v4 = [MEMORY[0x263EFF980] array];
      }
      v5 = (void *)*((void *)v6 + 15);
      *((void *)v6 + 15) = v4;

      [*((id *)v6 + 15) addObject:*(void *)(a1 + 32)];
    }
    id WeakRetained = v6;
  }
}

void __55___LTSpeechTranslationRequest_append_simulateRealtime___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    if (WeakRetained[17])
    {
      [*(id *)(a1 + 40) _appendAudioSampleBuffer:*(void *)(a1 + 32) simulateRealtime:*(unsigned __int8 *)(a1 + 56)];
    }
    else
    {
      uint64_t v3 = (void *)WeakRetained[15];
      if (v3)
      {
        id v4 = v3;
      }
      else
      {
        id v4 = [MEMORY[0x263EFF980] array];
      }
      v5 = (void *)*((void *)v6 + 15);
      *((void *)v6 + 15) = v4;

      [*((id *)v6 + 15) addObject:*(void *)(a1 + 32)];
    }
    id WeakRetained = v6;
  }
}

uint64_t __59___LTSpeechTranslationRequest__drainAndClearAudioConverter__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = 2;
  return 0;
}

id __56___LTSpeechTranslationRequest__convertAndFeedPCMBuffer___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v3 + 24))
  {
    id v4 = 0;
    *a3 = 1;
  }
  else
  {
    *(unsigned char *)(v3 + 24) = 1;
    *a3 = 0;
    id v4 = *(id *)(a1 + 32);
  }

  return v4;
}

void __39___LTSpeechTranslationRequest_endAudio__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained _drainAndClearAudioConverter];
    [v2[17] endAudio];
    id WeakRetained = v2;
  }
}

@end