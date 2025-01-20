@interface BWStillImageConditionalRouterOverCaptureConfiguration
+ (id)overCaptureConfiguration;
- (BWStillImageConditionalRouterOverCaptureConfiguration)init;
- (unsigned)narrowFieldOfViewOutputIndex;
- (unsigned)wideFieldOfViewOutputIndex;
@end

@implementation BWStillImageConditionalRouterOverCaptureConfiguration

+ (id)overCaptureConfiguration
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (BWStillImageConditionalRouterOverCaptureConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWStillImageConditionalRouterOverCaptureConfiguration;
  id v2 = [(BWStillImageConditionalRouterConfiguration *)&v5 initWithNumberOfOutputs:3];
  v3 = v2;
  if (v2) {
    [(BWStillImageConditionalRouterConfiguration *)v2 setShouldEmitSampleBufferDecisionProvider:&__block_literal_global_118];
  }
  return v3;
}

uint64_t __61__BWStillImageConditionalRouterOverCaptureConfiguration_init__block_invoke(int a1, CMAttachmentBearerRef target, _DWORD *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  *a3 = 0;
  CFTypeRef v5 = CMGetAttachment(target, @"BWStillImageCaptureSettings", 0);
  if (v5
    && (v6 = (void *)v5,
        (uint64_t v7 = objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54128])) != 0))
  {
    v8 = (void *)v7;
    if ((unint64_t)objc_msgSend((id)objc_msgSend(v6, "captureStreamSettings"), "count") >= 2)
    {
      v9 = (void *)[MEMORY[0x1E4F1CA48] array];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v10 = (void *)[v6 captureStreamSettings];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if ([v15 hasValidFrames]) {
              objc_msgSend(v9, "addObject:", objc_msgSend(v15, "portType"));
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v12);
      }
      uint64_t v16 = *MEMORY[0x1E4F52DD8];
      if ([v9 containsObject:*MEMORY[0x1E4F52DD8]]
        && [v9 containsObject:*MEMORY[0x1E4F52DF0]])
      {
        *a3 = [v8 isEqualToString:v16];
      }
      uint64_t v17 = *MEMORY[0x1E4F52DE8];
      if ([v9 containsObject:*MEMORY[0x1E4F52DE8]]
        && [v9 containsObject:v16])
      {
        *a3 = [v8 isEqualToString:v17];
      }
    }
  }
  else
  {
    FigDebugAssert3();
  }
  return 1;
}

- (unsigned)narrowFieldOfViewOutputIndex
{
  return 0;
}

- (unsigned)wideFieldOfViewOutputIndex
{
  return 1;
}

@end