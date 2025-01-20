@interface FigDataQueueBufferInfo
@end

@implementation FigDataQueueBufferInfo

uint64_t __FigDataQueueBufferInfo_GetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  FigDataQueueBufferInfo_GetTypeID_sFigDataQueueBufferInfoTypeID = result;
  return result;
}

@end