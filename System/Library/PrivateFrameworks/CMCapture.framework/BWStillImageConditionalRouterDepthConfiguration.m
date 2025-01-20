@interface BWStillImageConditionalRouterDepthConfiguration
+ (id)depthConfiguration;
- (BWStillImageConditionalRouterDepthConfiguration)init;
- (unsigned)rawOutputIndex;
- (unsigned)yuvOutputIndex;
@end

@implementation BWStillImageConditionalRouterDepthConfiguration

+ (id)depthConfiguration
{
  v2 = objc_alloc_init(BWStillImageConditionalRouterDepthConfiguration);
  return v2;
}

- (BWStillImageConditionalRouterDepthConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWStillImageConditionalRouterDepthConfiguration;
  v2 = [(BWStillImageConditionalRouterConfiguration *)&v5 initWithNumberOfOutputs:2];
  v3 = v2;
  if (v2)
  {
    [(BWStillImageConditionalRouterConfiguration *)v2 setShouldEmitSampleBufferDecisionProvider:&__block_literal_global_103];
    [(BWStillImageConditionalRouterConfiguration *)v3 setShouldEmitNodeErrorDecisionProvider:&__block_literal_global_106];
  }
  return v3;
}

uint64_t __55__BWStillImageConditionalRouterDepthConfiguration_init__block_invoke(uint64_t a1, const void *a2, _DWORD *a3)
{
  unint64_t v4 = (unint64_t)BWStillImageCaptureFrameFlagsForSampleBuffer(a2);
  if (a3) {
    *a3 = v4 >> 62 != 0;
  }
  return 1;
}

uint64_t __55__BWStillImageConditionalRouterDepthConfiguration_init__block_invoke_2(uint64_t a1, void *a2, _DWORD *a3)
{
  int v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "stillImageSettings"), "captureSettings"), "captureStreamSettings"), "firstObject"), "isSensorRawCapture");
  if (a3) {
    *a3 = v4;
  }
  return 1;
}

- (unsigned)yuvOutputIndex
{
  return 0;
}

- (unsigned)rawOutputIndex
{
  return 1;
}

@end