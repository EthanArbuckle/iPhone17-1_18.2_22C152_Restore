@interface VNRecognizeDocumentsRequest(MediaAnalysis)
+ (id)mad_defaultRequest;
@end

@implementation VNRecognizeDocumentsRequest(MediaAnalysis)

+ (id)mad_defaultRequest
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F45908]);
  [v0 setRevision:1];
  if (DeviceHasANE())
  {
    v1 = [MEMORY[0x1E4F458E8] defaultANEDevice];
    [v0 setProcessingDevice:v1];
  }
  v2 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  [v0 setRecognitionLanguages:v2];

  [v0 setMaximumCandidateCount:3];
  [v0 setUsesLanguageDetection:1];
  return v0;
}

@end