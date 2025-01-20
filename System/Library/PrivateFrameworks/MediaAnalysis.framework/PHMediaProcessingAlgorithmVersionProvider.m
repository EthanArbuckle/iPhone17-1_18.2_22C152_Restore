@interface PHMediaProcessingAlgorithmVersionProvider
@end

@implementation PHMediaProcessingAlgorithmVersionProvider

void __102__PHMediaProcessingAlgorithmVersionProvider_MediaAnalysis__mad_sharedVersionProviderWithPhotoLibrary___block_invoke(uint64_t a1)
{
  int64_t v2 = +[VCPVideoCaptionAnalyzer mode];
  id v3 = objc_alloc(*(Class *)(a1 + 40));
  __int16 v4 = VCPPhotosSceneProcessingVersionInternal();
  __int16 v5 = objc_msgSend(*(id *)(a1 + 32), "mad_faceProcessingInternalVersion");
  __int16 v6 = VCPPhotosVisualSearchAlgorithmVersion();
  if (v2 == 1) {
    __int16 v7 = VCPPhotosCaptionProcessingVersion;
  }
  else {
    __int16 v7 = 0;
  }
  HIWORD(v11) = v7;
  LOWORD(v11) = 70;
  LOWORD(v10) = VCPPhotosPECProcessingVersion;
  uint64_t v8 = objc_msgSend(v3, "initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:", v4, v5, (__int16)VCPPhotosOCRProcessingVersion, v6, 1, v10, 70, v11);
  v9 = (void *)mad_sharedVersionProviderWithPhotoLibrary__instance;
  mad_sharedVersionProviderWithPhotoLibrary__instance = v8;
}

@end