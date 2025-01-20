@interface BWStillImageConditionalRouterLandmarksConfiguration
+ (id)landmarksConfiguration;
- (BWStillImageConditionalRouterLandmarksConfiguration)init;
- (unsigned)defaultOutputIndex;
- (unsigned)landmarksOutputIndex;
@end

@implementation BWStillImageConditionalRouterLandmarksConfiguration

+ (id)landmarksConfiguration
{
  v2 = objc_alloc_init(BWStillImageConditionalRouterLandmarksConfiguration);
  return v2;
}

- (BWStillImageConditionalRouterLandmarksConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWStillImageConditionalRouterLandmarksConfiguration;
  v2 = [(BWStillImageConditionalRouterConfiguration *)&v5 initWithNumberOfOutputs:2];
  v3 = v2;
  if (v2) {
    [(BWStillImageConditionalRouterConfiguration *)v2 setShouldEmitSampleBufferDecisionProvider:&__block_literal_global_33];
  }
  return v3;
}

uint64_t __59__BWStillImageConditionalRouterLandmarksConfiguration_init__block_invoke(int a1, CMAttachmentBearerRef target, _DWORD *a3)
{
  objc_super v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  v6 = (void *)CMGetAttachment(target, @"BWStillImageCaptureSettings", 0);
  v7 = objc_msgSend(v6, "captureStreamSettingsForPortType:", objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]));
  if ([v6 captureType] == 2)
  {
    unsigned int v8 = [v7 captureFlags];
    int v9 = (objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F54188]), "BOOLValue") ^ 1) & HIWORD(v8);
    if (!a3) {
      return 1;
    }
    goto LABEL_5;
  }
  int v9 = 0;
  if (a3) {
LABEL_5:
  }
    *a3 = v9;
  return 1;
}

- (unsigned)defaultOutputIndex
{
  return 0;
}

- (unsigned)landmarksOutputIndex
{
  return 1;
}

@end