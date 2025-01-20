@interface EnqueueSampleBuffer
@end

@implementation EnqueueSampleBuffer

uint64_t __audioRendererCentral_EnqueueSampleBuffer_block_invoke()
{
  uint64_t result = CMBaseObjectGetDerivedStorage();
  if (!*(void *)(result + 88))
  {
    uint64_t v1 = result;
    FigServer_GetClientPIDFromAuditToken();
    uint64_t result = FigOSTransactionCreate();
    *(void *)(v1 + 88) = result;
  }
  return result;
}

@end