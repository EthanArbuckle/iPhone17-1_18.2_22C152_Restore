@interface BWStillImageConditionalRouterOptimizedEnhancedPortraitConfiguration
+ (id)optimizedEnhancedPortraitConfiguration;
- (BWStillImageConditionalRouterOptimizedEnhancedPortraitConfiguration)init;
- (unsigned)deepFusionImageOutputIndex;
- (unsigned)mainImageOutputIndex;
@end

@implementation BWStillImageConditionalRouterOptimizedEnhancedPortraitConfiguration

- (unsigned)mainImageOutputIndex
{
  return 0;
}

- (unsigned)deepFusionImageOutputIndex
{
  return 1;
}

- (BWStillImageConditionalRouterOptimizedEnhancedPortraitConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWStillImageConditionalRouterOptimizedEnhancedPortraitConfiguration;
  v2 = [(BWStillImageConditionalRouterConfiguration *)&v5 initWithNumberOfOutputs:2];
  v3 = v2;
  if (v2) {
    [(BWStillImageConditionalRouterConfiguration *)v2 setShouldEmitSampleBufferDecisionProvider:&__block_literal_global_136];
  }
  return v3;
}

+ (id)optimizedEnhancedPortraitConfiguration
{
  v2 = objc_alloc_init(BWStillImageConditionalRouterOptimizedEnhancedPortraitConfiguration);
  return v2;
}

uint64_t __75__BWStillImageConditionalRouterOptimizedEnhancedPortraitConfiguration_init__block_invoke(int a1, CMAttachmentBearerRef target, _DWORD *a3)
{
  *a3 = 0;
  if (objc_msgSend((id)CMGetAttachment(target, @"StillImageBufferFrameType", 0), "unsignedIntValue") == 13)*a3 = 1; {
  return 1;
  }
}

@end