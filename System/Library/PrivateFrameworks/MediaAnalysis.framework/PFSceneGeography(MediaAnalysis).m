@interface PFSceneGeography(MediaAnalysis)
+ (id)vcp_sharedSceneGeography;
@end

@implementation PFSceneGeography(MediaAnalysis)

+ (id)vcp_sharedSceneGeography
{
  if (+[PFSceneGeography(MediaAnalysis) vcp_sharedSceneGeography]::once != -1) {
    dispatch_once(&+[PFSceneGeography(MediaAnalysis) vcp_sharedSceneGeography]::once, &__block_literal_global_11);
  }
  v0 = (void *)+[PFSceneGeography(MediaAnalysis) vcp_sharedSceneGeography]::instance;
  return v0;
}

@end