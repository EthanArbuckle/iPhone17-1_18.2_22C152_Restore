@interface AROrientationTrackingConfiguration
+ (BOOL)supportsFrameSemantics:(unint64_t)a3;
+ (id)_querySupportedVideoFormats;
+ (id)recommendedVideoFormatFor4KResolution;
+ (id)recommendedVideoFormatForHighResolutionFrameCapturing;
+ (id)supportedVideoFormats;
- (AROrientationTrackingConfiguration)init;
- (id)description;
@end

@implementation AROrientationTrackingConfiguration

- (AROrientationTrackingConfiguration)init
{
  v4.receiver = self;
  v4.super_class = (Class)AROrientationTrackingConfiguration;
  v2 = [(ARConfiguration *)&v4 initPrivate];
  if (v2 && ARShouldSupport1440pAndAutofocus()) {
    [(ARConfiguration *)v2 setAutoFocusEnabled:1];
  }
  return v2;
}

+ (id)supportedVideoFormats
{
  if (supportedVideoFormats_supportedFormats_1 && ![(id)supportedVideoFormats_supportedFormats_1 count])
  {
    uint64_t v3 = [a1 _querySupportedVideoFormats];
    objc_super v4 = (void *)supportedVideoFormats_supportedFormats_1;
    supportedVideoFormats_supportedFormats_1 = v3;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__AROrientationTrackingConfiguration_supportedVideoFormats__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedVideoFormats_onceToken_2 != -1) {
    dispatch_once(&supportedVideoFormats_onceToken_2, block);
  }
  id v5 = (id)supportedVideoFormats_supportedFormats_1;
  if (([(id)objc_opt_class() shouldProvideX420VideoFormat] & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_46];
    uint64_t v7 = [v5 filteredArrayUsingPredicate:v6];

    id v5 = (id)v7;
  }
  if (([(id)objc_opt_class() shouldProvideNonBinnedVideoFormats] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_3];
    uint64_t v9 = [v5 filteredArrayUsingPredicate:v8];

    id v5 = (id)v9;
  }
  return v5;
}

void __59__AROrientationTrackingConfiguration_supportedVideoFormats__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _querySupportedVideoFormats];
  v2 = (void *)supportedVideoFormats_supportedFormats_1;
  supportedVideoFormats_supportedFormats_1 = v1;
}

uint64_t __59__AROrientationTrackingConfiguration_supportedVideoFormats__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isX420PixelFormat] ^ 1;
}

uint64_t __59__AROrientationTrackingConfiguration_supportedVideoFormats__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 deviceFormat];
  uint64_t v3 = [v2 isVideoBinned];

  return v3;
}

+ (id)_querySupportedVideoFormats
{
  v2 = objc_opt_new();
  uint64_t v3 = +[ARVideoFormat supportedVideoFormatsForDevicePosition:1 deviceType:*MEMORY[0x1E4F15830]];
  [v2 addObjectsFromArray:v3];

  if (ARLinkedOnOrAfterSydney())
  {
    objc_super v4 = +[ARVideoFormat supportedVideoFormatsForStillImageCapture];
    [v2 addObjectsFromArray:v4];

    id v5 = +[ARVideoFormat supportedVideoFormatsForHiResOrX420];
    [v2 addObjectsFromArray:v5];
  }
  return v2;
}

+ (id)recommendedVideoFormatFor4KResolution
{
  return +[ARWorldTrackingConfiguration recommendedVideoFormatFor4KResolution];
}

+ (id)recommendedVideoFormatForHighResolutionFrameCapturing
{
  return +[ARWorldTrackingConfiguration recommendedVideoFormatForHighResolutionFrameCapturing];
}

+ (BOOL)supportsFrameSemantics:(unint64_t)a3
{
  objc_super v4 = objc_opt_class();
  return [v4 supportsFrameSemantics:a3];
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  objc_super v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  BOOL v7 = [(ARConfiguration *)self isAutoFocusEnabled];
  v8 = @"Disabled";
  if (v7) {
    v8 = @"Enabled";
  }
  [v6 appendFormat:@" autoFocus=%@", v8];
  uint64_t v9 = [(ARConfiguration *)self descriptionWithoutBrackets];
  [v6 appendString:v9];

  [v6 appendString:@">"];
  return v6;
}

@end