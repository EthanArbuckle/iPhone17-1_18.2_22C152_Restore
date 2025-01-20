@interface Dissociate
@end

@implementation Dissociate

void __screenstreamudp_Dissociate_block_invoke(uint64_t a1)
{
}

uint64_t __carEndpoint_Dissociate_block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(*(void *)(result + 40) + 152);
  uint64_t v1 = *(void *)(result + 40);
  *(unsigned char *)(v1 + 152) = 1;
  *(_DWORD *)(v1 + 208) = *(_DWORD *)(v1 + 204);
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v2 = *(void *)(v1 + 216);
    if (v2)
    {
      uint64_t v3 = result;
      uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v4) {
        uint64_t v5 = v4;
      }
      else {
        uint64_t v5 = 0;
      }
      v6 = *(void (**)(uint64_t, void, void, void, void))(v5 + 96);
      if (v6) {
        v6(v2, 0, 0, 0, 0);
      }
      result = APSenderSessionGetCMBaseObject(*(void *)(*(void *)(v3 + 40) + 216));
      if (result)
      {
        uint64_t v7 = result;
        uint64_t VTable = CMBaseObjectGetVTable();
        uint64_t v10 = *(void *)(VTable + 8);
        result = VTable + 8;
        uint64_t v9 = v10;
        uint64_t v11 = v10 ? v9 : 0;
        v12 = *(uint64_t (**)(uint64_t))(v11 + 24);
        if (v12)
        {
          return v12(v7);
        }
      }
    }
  }
  return result;
}

void __carEndpoint_Dissociate_block_invoke_2(uint64_t a1)
{
  int v2 = 0;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    if (gLogCategory_APEndpointCarPlay <= 30
      && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    carEndpoint_deactivateInternal(*(const void **)(a1 + 40), 1, @"Dissociating", &v2);
    carEndpoint_postActivationNotification(*(const void **)(a1 + 40), (const void *)*MEMORY[0x1E4F20710], v2);
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __screenstream_Dissociate_block_invoke(uint64_t a1)
{
}

@end