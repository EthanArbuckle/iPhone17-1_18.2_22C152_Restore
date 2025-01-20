@interface AXXIPCSimpleSendDataWithFencePort
@end

@implementation AXXIPCSimpleSendDataWithFencePort

void ____AXXIPCSimpleSendDataWithFencePort_block_invoke(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = ____AXXIPCSimpleSendDataWithFencePort_block_invoke_2;
  v1[3] = &unk_1E55873F0;
  v1[4] = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v1);
}

void ____AXXIPCSimpleSendDataWithFencePort_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    int v2 = AXLogIPC();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      ____AXXIPCSendData_block_invoke_2_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  else
  {
    *(unsigned char *)(v1 + 24) = 1;
    if ((*(_DWORD *)(a1 + 40) + 1) >= 2)
    {
      uint64_t v14 = 0;
      v15 = &v14;
      uint64_t v16 = 0x2050000000;
      v11 = (void *)getUIWindowClass_softClass;
      uint64_t v17 = getUIWindowClass_softClass;
      if (!getUIWindowClass_softClass)
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __getUIWindowClass_block_invoke;
        v13[3] = &unk_1E5585E30;
        v13[4] = &v14;
        __getUIWindowClass_block_invoke((uint64_t)v13);
        v11 = (void *)v15[3];
      }
      id v12 = v11;
      _Block_object_dispose(&v14, 8);
      [v12 _synchronizeDrawingAcrossProcessesOverPort:*(unsigned int *)(a1 + 40)];
    }
  }
}

@end