@interface FinishDelayedFrames
@end

@implementation FinishDelayedFrames

uint64_t __dssxpc_FinishDelayedFrames_block_invoke(uint64_t a1)
{
  VTDecompressionSessionFinishDelayedFrames(*(VTDecompressionSessionRef *)(a1 + 32));
  if (!FigXPCCreateBasicMessage())
  {
    FigXPCMessageSetInt32();
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), 0);
  }
  FigXPCRelease();
  v2 = *(const void **)(a1 + 32);
  if (v2) {
    CFRelease(v2);
  }
  return FigXPCRelease();
}

@end