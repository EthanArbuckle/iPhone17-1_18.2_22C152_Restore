@interface SetMessageCallbacks
@end

@implementation SetMessageCallbacks

void *__stream_SetMessageCallbacks_block_invoke(void *result)
{
  *(void *)(result[4] + 112) = result[5];
  *(void *)(result[4] + 120) = result[6];
  if (result[7])
  {
    if (gLogCategory_APTransportStreamUnbuffered <= 60)
    {
      if (gLogCategory_APTransportStreamUnbuffered != -1) {
        return (void *)LogPrintF();
      }
      result = (void *)_LogCategory_Initialize();
      if (result) {
        return (void *)LogPrintF();
      }
    }
  }
  return result;
}

void *__stream_SetMessageCallbacks_block_invoke_0(void *result)
{
  *(void *)(result[4] + 200) = result[5];
  *(void *)(result[4] + 208) = result[6];
  *(void *)(result[4] + 192) = result[7];
  return result;
}

@end