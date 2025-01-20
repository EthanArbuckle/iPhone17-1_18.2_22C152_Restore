@interface SendMessageCreatingReply
@end

@implementation SendMessageCreatingReply

void *__stream_SendMessageCreatingReply_block_invoke(void *result)
{
  v1 = result;
  uint64_t v2 = result[9];
  if (*(unsigned char *)(v2 + 72))
  {
    result = (void *)APSLogErrorAt();
    uint64_t v5 = *(void *)(v1[4] + 8);
    int v6 = -16617;
LABEL_12:
    *(_DWORD *)(v5 + 24) = v6;
    return result;
  }
  if (!*(unsigned char *)(result[10] + 9))
  {
    result = (void *)APSLogErrorAt();
    uint64_t v5 = *(void *)(v1[4] + 8);
    int v6 = -16614;
    goto LABEL_12;
  }
  if (*(void *)(v2 + 168))
  {
    if (gLogCategory_APTransportStream <= 90)
    {
      if (gLogCategory_APTransportStream != -1 || (result = (void *)_LogCategory_Initialize(), result)) {
        result = (void *)LogPrintF();
      }
    }
    uint64_t v5 = *(void *)(v1[4] + 8);
    int v6 = -6709;
    goto LABEL_12;
  }
  *(_DWORD *)(*(void *)(result[5] + 8) + 24) = *(_DWORD *)(v2 + 176);
  *(void *)(*(void *)(result[6] + 8) + 24) = dispatch_semaphore_create(0);
  uint64_t v3 = v1[9];
  *(_DWORD *)(v3 + 152) = 0;
  *(void *)(v3 + 168) = *(void *)(*(void *)(v1[6] + 8) + 24);
  dispatch_retain(*(dispatch_object_t *)(v1[9] + 168));
  CFRetain((CFTypeRef)v1[7]);
  v4 = (const void *)v1[8];
  if (v4) {
    CFRetain(v4);
  }
  return (void *)APSDispatchAsyncFHelper();
}

void __stream_SendMessageCreatingReply_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v2 + 72))
  {
    APSLogErrorAt();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -16617;
  }
  else
  {
    if (*(unsigned char *)(a1 + 56)) {
      int v3 = -6722;
    }
    else {
      int v3 = *(_DWORD *)(v2 + 152);
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      APSLogErrorAt();
    }
    else
    {
      v4 = *(void **)(a1 + 48);
      if (v4)
      {
        void *v4 = *(void *)(v2 + 160);
        *(void *)(*(void *)(a1 + 40) + 160) = 0;
      }
    }
  }
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 40) + 168);
  if (v5)
  {
    dispatch_release(v5);
    *(void *)(*(void *)(a1 + 40) + 168) = 0;
  }
}

void __stream_SendMessageCreatingReply_block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(const void **)(*(void *)(a1 + 32) + 160);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(a1 + 32) + 160) = 0;
  }
}

@end