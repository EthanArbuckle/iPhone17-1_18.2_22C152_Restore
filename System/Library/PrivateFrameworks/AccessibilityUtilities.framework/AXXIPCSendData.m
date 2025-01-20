@interface AXXIPCSendData
@end

@implementation AXXIPCSendData

void ____AXXIPCSendData_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ____AXXIPCSendData_block_invoke_2;
  block[3] = &unk_1E55873A0;
  uint64_t v5 = *(void *)(a1 + 32);
  int v10 = *(_DWORD *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, block);
}

void ____AXXIPCSendData_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    v2 = AXLogIPC();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      ____AXXIPCSendData_block_invoke_2_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  else
  {
    *(unsigned char *)(v1 + 24) = 1;
    mach_error_t v10 = _AXIPCAsyncSendDataReply(*(_DWORD *)(a1 + 48), 0, [*(id *)(a1 + 32) bytes], objc_msgSend(*(id *)(a1 + 32), "length"));
    if (!v10) {
      return;
    }
    mach_error_t v11 = v10;
    v2 = AXLogIPC();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      ____AXXIPCSendData_block_invoke_2_cold_1(v11);
    }
  }
}

void ____AXXIPCSendData_block_invoke_2_cold_1(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_2(&dword_18D308000, v1, v2, "reply to message failed: %{public}s", v3, v4, v5, v6, v7);
}

void ____AXXIPCSendData_block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end