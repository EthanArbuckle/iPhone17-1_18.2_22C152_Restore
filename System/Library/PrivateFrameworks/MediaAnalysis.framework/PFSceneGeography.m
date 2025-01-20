@interface PFSceneGeography
@end

@implementation PFSceneGeography

void __59__PFSceneGeography_MediaAnalysis__vcp_sharedSceneGeography__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F8CD50]);
  v1 = (void *)+[PFSceneGeography(MediaAnalysis) vcp_sharedSceneGeography]::instance;
  +[PFSceneGeography(MediaAnalysis) vcp_sharedSceneGeography]::instance = (uint64_t)v0;

  if (!+[PFSceneGeography(MediaAnalysis) vcp_sharedSceneGeography]::instance && (int)MediaAnalysisLogLevel() >= 3)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_ERROR, "Failed to initialize PFSceneGeography", v3, 2u);
    }
  }
}

@end