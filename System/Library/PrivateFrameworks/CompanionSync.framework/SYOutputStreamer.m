@interface SYOutputStreamer
@end

@implementation SYOutputStreamer

void __61___SYOutputStreamer_initWithCompressedFileURL_callbackQueue___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a3 == 8)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      v8 = (void *)qword_26AB047B0;
      if (os_log_type_enabled((os_log_t)qword_26AB047B0, OS_LOG_TYPE_ERROR)) {
        __61___SYOutputStreamer_initWithCompressedFileURL_callbackQueue___block_invoke_cold_1((uint64_t)v7, v8, v5);
      }
      v9 = [v5 streamError];
      [v7 _completeAllItemsWithError:v9];
    }
    else if (a3 == 4)
    {
      [WeakRetained _tryToSendData];
    }
  }
}

void __61___SYOutputStreamer_initWithCompressedFileURL_callbackQueue___block_invoke_56(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _tryToSendData];
    id WeakRetained = v2;
  }
}

void __42___SYOutputStreamer_writeData_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = objc_alloc(MEMORY[0x263F087E8]);
  id v3 = (id)[v2 initWithDomain:*MEMORY[0x263F07F70] code:4 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v3);
}

uint64_t __42___SYOutputStreamer_writeData_completion___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __35___SYOutputStreamer__tryToSendData__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) callback];
  v1[2](v1, 1, 0);
}

void __48___SYOutputStreamer__completeAllItemsWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callback];
  (*((void (**)(id, void, void))v2 + 2))(v2, 0, *(void *)(a1 + 40));
}

void __40___SYOutputStreamer_stream_handleEvent___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) streamError];
  [v1 _completeAllItemsWithError:v2];
}

void __61___SYOutputStreamer_initWithCompressedFileURL_callbackQueue___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 streamError];
  v6 = _SYObfuscate(v5);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_4_1(&dword_21C7C9000, v7, v8, "Output streamer %{public}@: Error from underlying stream: %{public}@", v9, v10, v11, v12, v13);
}

@end