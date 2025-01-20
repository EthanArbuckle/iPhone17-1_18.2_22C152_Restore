@interface VTVideoCodecService
@end

@implementation VTVideoCodecService

uint64_t __VTVideoCodecService_ShouldUseSeparateCodecProcessForDecode_block_invoke()
{
  if (deviceIsDarwinOSProduct_onceToken != -1) {
    dispatch_once(&deviceIsDarwinOSProduct_onceToken, &__block_literal_global_21);
  }
  if (deviceIsDarwinOSProduct_isDarwinOS) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = _os_feature_enabled_impl();
  }
  VTVideoCodecService_ShouldUseSeparateCodecProcessForDecode_featureEnabled = result;
  return result;
}

uint64_t __VTVideoCodecService_ShouldUseXPCRemoteTileDecompressionSession_block_invoke()
{
  uint64_t result = FigGetCFPreferenceNumberWithDefault();
  VTVideoCodecService_ShouldUseXPCRemoteTileDecompressionSession_prefersMIG = result;
  return result;
}

uint64_t __VTVideoCodecService_ShouldUseOOPDecodeForVideoPlayer_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  VTVideoCodecService_ShouldUseOOPDecodeForVideoPlayer_featureEnabled = result;
  return result;
}

uint64_t __VTVideoCodecService_ShouldUseSeparateCodecProcessForEncode_block_invoke()
{
  v0 = (const void *)MGCopyAnswer();
  int v1 = FigCFEqual();
  if (v0) {
    CFRelease(v0);
  }
  if (!v1)
  {
    if (deviceIsDarwinOSProduct_onceToken != -1) {
      dispatch_once(&deviceIsDarwinOSProduct_onceToken, &__block_literal_global_21);
    }
    if (deviceIsDarwinOSProduct_isDarwinOS) {
      uint64_t result = 0;
    }
    else {
      uint64_t result = _os_feature_enabled_impl();
    }
    goto LABEL_12;
  }
  uint64_t result = _os_feature_enabled_impl();
  VTVideoCodecService_ShouldUseSeparateCodecProcessForEncode_featureEnabled = result;
  if ((result & 1) == 0)
  {
    uint64_t result = _os_feature_enabled_impl();
    if (result)
    {
      uint64_t result = 1;
LABEL_12:
      VTVideoCodecService_ShouldUseSeparateCodecProcessForEncode_featureEnabled = result;
    }
  }
  return result;
}

@end