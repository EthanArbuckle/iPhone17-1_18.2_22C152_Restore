@interface IsHEVCDecoderHardwareAccelerated
@end

@implementation IsHEVCDecoderHardwareAccelerated

uint64_t __mv_IsHEVCDecoderHardwareAccelerated_block_invoke()
{
  uint64_t result = VTIsHardwareDecodeSupported(0x68766331u);
  if (result) {
    sHEVCDecoderIsHardwareAccelerated = 1;
  }
  return result;
}

@end