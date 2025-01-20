@interface WaitForAsynchronousFrames
@end

@implementation WaitForAsynchronousFrames

uint64_t __dssxpc_WaitForAsynchronousFrames_block_invoke(uint64_t a1)
{
  OSStatus v2 = VTDecompressionSessionWaitForAsynchronousFrames(*(VTDecompressionSessionRef *)(a1 + 32));
  if (!FigXPCCreateBasicMessage())
  {
    xpc_dictionary_set_int64(0, "Result", v2);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), 0);
  }
  FigXPCRelease();
  v3 = *(const void **)(a1 + 32);
  if (v3) {
    CFRelease(v3);
  }
  return FigXPCRelease();
}

@end