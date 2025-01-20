@interface AXXIPCSendDataWithAsyncReply
@end

@implementation AXXIPCSendDataWithAsyncReply

void ____AXXIPCSendDataWithAsyncReply_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    v6 = AXLogIPC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ____AXXIPCSendData_block_invoke_2_cold_2(v6, v7, v8, v9, v10, v11, v12, v13);
    }
LABEL_7:

    goto LABEL_8;
  }
  *(unsigned char *)(v5 + 24) = 1;
  int v14 = *(_DWORD *)(a1 + 40);
  id v15 = v3;
  mach_error_t v16 = _AXIPCReplyToAsyncRequest(v14, [v15 bytes], objc_msgSend(v15, "length"));
  if (v16)
  {
    mach_error_t v17 = v16;
    v6 = AXLogIPC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ____AXXIPCSendDataWithAsyncReply_block_invoke_cold_1(v17);
    }
    goto LABEL_7;
  }
LABEL_8:
}

void ____AXXIPCSendDataWithAsyncReply_block_invoke_cold_1(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_2(&dword_18D308000, v1, v2, "async reply to message failed: %{public}s", v3, v4, v5, v6, v7);
}

@end