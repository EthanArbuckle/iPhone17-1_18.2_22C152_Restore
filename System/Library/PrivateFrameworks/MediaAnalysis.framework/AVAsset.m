@interface AVAsset
@end

@implementation AVAsset

void __55__AVAsset_MediaAnalysis__vcp_keyFrameWithMaxDimension___block_invoke(uint64_t a1, CGImage *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a2)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(const void **)(v7 + 48);
    v9 = (__CVBuffer **)(v7 + 48);
    v8 = v10;
    if (v10)
    {
      CFRelease(v8);
      *v9 = 0;
    }
    CGImage_CreateCVPixelBuffer(a2, v9);
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEFAULT, "Failed to decode first frame (%@)", (uint8_t *)&v12, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __64__AVAsset_MediaAnalysis__vcp_frameAtTimeStamp_withMaxDimension___block_invoke(uint64_t a1, CGImage *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a2)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(const void **)(v7 + 48);
    v9 = (__CVBuffer **)(v7 + 48);
    v8 = v10;
    if (v10)
    {
      CFRelease(v8);
      *v9 = 0;
    }
    CGImage_CreateCVPixelBuffer(a2, v9);
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEFAULT, "Failed to decode first frame (%@)", (uint8_t *)&v12, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end