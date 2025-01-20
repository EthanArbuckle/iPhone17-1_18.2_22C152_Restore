@interface Activate
@end

@implementation Activate

void __carEndpoint_Activate_block_invoke(uint64_t a1)
{
  int v16 = 0;
  v2 = dispatch_semaphore_create(0);
  if (carEndpoint_isDissociated(*(void *)(a1 + 32)))
  {
    int v3 = -16723;
  }
  else
  {
    int v3 = carEndpoint_activateInternal(*(const void **)(a1 + 40), *(const __CFDictionary **)(a1 + 48), v2, &v16);
    if (!v3) {
      goto LABEL_5;
    }
  }
  APSLogErrorAt();
LABEL_5:
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 144);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = __carEndpoint_Activate_block_invoke_2;
  block[3] = &__block_descriptor_tmp_101;
  block[4] = v4;
  dispatch_sync(v5, block);
  if (!v3)
  {
    int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 212);
    if (v3)
    {
      if (gLogCategory_APEndpointCarPlay <= 90
        && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      dispatch_semaphore_signal(v2);
      carEndpoint_deactivateInternal(*(const void **)(a1 + 40), 0, @"Activation failed, endpointStatus error ", 0);
      int v16 = 0;
    }
  }
  CFRetain(*(CFTypeRef *)(a1 + 40));
  dispatch_retain(v2);
  v6 = **(NSObject ***)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 0x40000000;
  v12[2] = __carEndpoint_Activate_block_invoke_3;
  v12[3] = &__block_descriptor_tmp_107;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 64);
  v12[4] = *(void *)(a1 + 56);
  v12[5] = v7;
  int v9 = v16;
  int v13 = v16;
  int v14 = v3;
  uint64_t v10 = *(void *)(a1 + 72);
  v12[6] = v8;
  v12[7] = v10;
  v12[8] = v2;
  dispatch_async(v6, v12);
  if (v9) {
    carEndpoint_postActivationNotification(*(const void **)(a1 + 40), (const void *)*MEMORY[0x1E4F20718], v9);
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
  v11 = *(const void **)(a1 + 48);
  if (v11) {
    CFRelease(v11);
  }
  dispatch_release(v2);
}

uint64_t __carEndpoint_Activate_block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 324) = 0;
  return result;
}

void __carEndpoint_Activate_block_invoke_3(uint64_t a1)
{
  v2 = *(void (**)(void, void, void, void, void))(a1 + 32);
  if (v2) {
    v2(*(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned int *)(a1 + 72), *(unsigned int *)(a1 + 76), *(void *)(a1 + 56));
  }
  if (gLogCategory_APEndpointCarPlay <= 30
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(_DWORD *)(a1 + 76)) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 64));
  int v3 = *(const void **)(a1 + 40);
  CFRelease(v3);
}

void __endpointCluster_Activate_block_invoke(uint64_t a1, const void *a2)
{
}

@end