@interface Deactivate
@end

@implementation Deactivate

void __carEndpoint_Deactivate_block_invoke(uint64_t a1)
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2000000000;
  int v22 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2000000000;
  char v18 = 0;
  if (carEndpoint_isDissociated(*(void *)(a1 + 32)))
  {
    *((unsigned char *)v16 + 24) = 1;
    uint64_t v2 = *(void *)(a1 + 32);
    v3 = *(NSObject **)(v2 + 144);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 0x40000000;
    block[2] = __carEndpoint_Deactivate_block_invoke_2;
    block[3] = &unk_1E6894B60;
    block[4] = &v19;
    block[5] = v2;
    dispatch_sync(v3, block);
  }
  else
  {
    CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 40);
    if (v4) {
      Value = CFDictionaryGetValue(v4, (const void *)*MEMORY[0x1E4F20538]);
    }
    else {
      Value = 0;
    }
    carEndpoint_deactivateInternal(*(const void **)(a1 + 48), 0, (uint64_t)Value, (_DWORD *)v20 + 6);
  }
  if (*(void *)(a1 + 56))
  {
    CFRetain(*(CFTypeRef *)(a1 + 48));
    v6 = **(NSObject ***)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 0x40000000;
    v10[2] = __carEndpoint_Deactivate_block_invoke_3;
    v10[3] = &unk_1E6894B88;
    int8x16_t v11 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    v10[4] = &v19;
    v10[5] = &v15;
    uint64_t v7 = *(void *)(a1 + 72);
    uint64_t v12 = *(void *)(a1 + 64);
    uint64_t v13 = v7;
    dispatch_async(v6, v10);
  }
  int v8 = *((_DWORD *)v20 + 6);
  if (v8) {
    carEndpoint_postActivationNotification(*(const void **)(a1 + 48), (const void *)*MEMORY[0x1E4F20720], v8);
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
  v9 = *(const void **)(a1 + 40);
  if (v9) {
    CFRelease(v9);
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

uint64_t __carEndpoint_Deactivate_block_invoke_2(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(*(void *)(result + 40) + 208);
  return result;
}

void __carEndpoint_Deactivate_block_invoke_3(uint64_t a1)
{
  v3 = *(void (**)(uint64_t, void, void, uint64_t, void))(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 56);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    uint64_t v4 = 4294950573;
  }
  else {
    uint64_t v4 = 0;
  }
  v3(v2, *(void *)(a1 + 64), *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v4, *(void *)(a1 + 72));
  CFRelease(*(CFTypeRef *)(a1 + 56));
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (gLogCategory_APEndpointCarPlay <= 30
      && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
    {
LABEL_10:
      LogPrintF();
    }
  }
  else if (gLogCategory_APEndpointCarPlay <= 30 {
         && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_10;
  }
}

@end