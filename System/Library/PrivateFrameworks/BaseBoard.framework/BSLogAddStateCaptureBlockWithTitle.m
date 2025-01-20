@interface BSLogAddStateCaptureBlockWithTitle
@end

@implementation BSLogAddStateCaptureBlockWithTitle

_DWORD *___BSLogAddStateCaptureBlockWithTitle_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48) && *(_DWORD *)(a2 + 16) != 3) {
    return 0;
  }
  v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v12 = 0;
  v4 = BSLogStateCaptureEncodePlist(v3, 1, &v12);
  id v5 = v12;
  v6 = v5;
  if (v4)
  {
    size_t v7 = [v4 length];
    v8 = malloc_type_calloc(1uLL, v7 + 200, 0x68029F96uLL);
    _DWORD *v8 = 1;
    v8[1] = v7;
    [*(id *)(a1 + 32) UTF8String];
    __strlcpy_chk();
    memcpy(v8 + 50, (const void *)[v4 bytes], v7);
  }
  else
  {
    if (v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      v11 = [v6 descriptionWithMultilinePrefix:0];
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      v16 = v11;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error: BSLogAddStateCaptureBlockWithTitle(%@) state data format error: %@", buf, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

void ___BSLogAddStateCaptureBlockWithTitle_block_invoke()
{
  dispatch_queue_t Serial = BSDispatchQueueCreateSerial(@"BSSharedStateCapturingQueue");
  v1 = (void *)qword_1EB21B360;
  qword_1EB21B360 = (uint64_t)Serial;
}

@end