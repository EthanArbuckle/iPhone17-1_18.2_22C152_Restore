@interface SetReadyToSendBatchCallback
@end

@implementation SetReadyToSendBatchCallback

const void *__stream_SetReadyToSendBatchCallback_block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  if (*(unsigned char *)(v2 + 24))
  {
    result = (const void *)APSLogErrorAt();
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = -16617;
  }
  else
  {
    result = *(const void **)(v2 + 40);
    if (result) {
      result = CFRetain(result);
    }
    *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  }
  return result;
}

void *__stream_SetReadyToSendBatchCallback_block_invoke_2(void *result)
{
  uint64_t v1 = result[4];
  uint64_t v2 = result[5];
  if (v1)
  {
    *(void *)(v2 + 88) = v1;
    uint64_t v1 = result[6];
  }
  else
  {
    *(void *)(v2 + 88) = 0;
  }
  *(void *)(result[5] + 96) = v1;
  return result;
}

@end