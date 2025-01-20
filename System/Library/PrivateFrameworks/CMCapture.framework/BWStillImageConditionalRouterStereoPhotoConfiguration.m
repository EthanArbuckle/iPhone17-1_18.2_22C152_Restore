@interface BWStillImageConditionalRouterStereoPhotoConfiguration
+ (id)stereoPhotoConfiguration;
- (BWStillImageConditionalRouterStereoPhotoConfiguration)init;
- (unsigned)mainImageOutputIndex;
- (unsigned)stereoPhotoOutoutIndex;
@end

@implementation BWStillImageConditionalRouterStereoPhotoConfiguration

+ (id)stereoPhotoConfiguration
{
  v2 = objc_alloc_init(BWStillImageConditionalRouterStereoPhotoConfiguration);
  return v2;
}

- (BWStillImageConditionalRouterStereoPhotoConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWStillImageConditionalRouterStereoPhotoConfiguration;
  v2 = [(BWStillImageConditionalRouterConfiguration *)&v5 initWithNumberOfOutputs:2];
  v3 = v2;
  if (v2) {
    [(BWStillImageConditionalRouterConfiguration *)v2 setShouldEmitSampleBufferDecisionProvider:&__block_literal_global_149];
  }
  return v3;
}

uint64_t __61__BWStillImageConditionalRouterStereoPhotoConfiguration_init__block_invoke(uint64_t a1, const void *a2, unsigned int *a3)
{
  *a3 = (BWStillImageProcessingFlagsForSampleBuffer(a2) >> 20) & 1;
  return 1;
}

- (unsigned)mainImageOutputIndex
{
  return 0;
}

- (unsigned)stereoPhotoOutoutIndex
{
  return 1;
}

@end