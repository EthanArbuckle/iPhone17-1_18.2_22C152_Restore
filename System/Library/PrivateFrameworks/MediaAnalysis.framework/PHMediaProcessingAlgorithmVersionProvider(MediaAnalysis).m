@interface PHMediaProcessingAlgorithmVersionProvider(MediaAnalysis)
+ (id)mad_sharedVersionProviderWithPhotoLibrary:()MediaAnalysis;
@end

@implementation PHMediaProcessingAlgorithmVersionProvider(MediaAnalysis)

+ (id)mad_sharedVersionProviderWithPhotoLibrary:()MediaAnalysis
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __102__PHMediaProcessingAlgorithmVersionProvider_MediaAnalysis__mad_sharedVersionProviderWithPhotoLibrary___block_invoke;
  v9[3] = &unk_1E629B400;
  id v10 = v4;
  uint64_t v11 = a1;
  uint64_t v5 = mad_sharedVersionProviderWithPhotoLibrary__once;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&mad_sharedVersionProviderWithPhotoLibrary__once, v9);
  }
  id v7 = (id)mad_sharedVersionProviderWithPhotoLibrary__instance;

  return v7;
}

@end