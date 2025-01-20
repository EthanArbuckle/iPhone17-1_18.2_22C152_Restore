@interface StickerPhotosUtil
- ($B6DA3D8FAB1629C12E7AA8FD40BC825C)videoPreviewTimeRangeForImageAnalysisInteraction:(SEL)a3;
- (CGRect)videoPreviewNormalizedCropRectForImageAnalysisInteraction:(id)a3;
- (id)imageAnalysisInteraction:(id)a3 videoPreviewSubjectMatteAtCompositionTime:(id *)a4;
- (void)imageAnalysisInteraction:(id)a3 createStickerRepresentationsAtIndexSet:(id)a4 type:(unint64_t)a5 stickerIDs:(id)a6 progress:(id)a7 completion:(id)a8;
- (void)loadImageFromItemProvider:(id)a3 completion:(id)a4;
- (void)loadLivePhotoFromItemProvider:(id)a3 completion:(id)a4;
- (void)setUsesLightDimmingViewInLightModeForImageAnalysisInteraction:(id)a3;
@end

@implementation StickerPhotosUtil

- (void)loadLivePhotoFromItemProvider:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  id v6 = [v7 loadObjectOfClass:objc_opt_class() completionHandler:v5];
}

- (void)loadImageFromItemProvider:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  id v6 = [v7 loadObjectOfClass:objc_opt_class() completionHandler:v5];
}

- (void)imageAnalysisInteraction:(id)a3 createStickerRepresentationsAtIndexSet:(id)a4 type:(unint64_t)a5 stickerIDs:(id)a6 progress:(id)a7 completion:(id)a8
{
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  id v16 = a4;
  id v17 = a3;
  if (objc_opt_respondsToSelector())
  {
    [v17 createStickerRepresentationsAtIndexSet:v16 type:a5 stickerIDs:v13 progress:v14 completion:v15];
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100006718;
    v18[3] = &unk_10009A6C0;
    id v19 = v15;
    [v17 createStickerRepresentationsAtIndexSet:v16 completion:v18];

    id v17 = v19;
  }
}

- (id)imageAnalysisInteraction:(id)a3 videoPreviewSubjectMatteAtCompositionTime:(id *)a4
{
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    long long v8 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    id v6 = [v5 videoPreviewSubjectMatteAtCompositionTime:&v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- ($B6DA3D8FAB1629C12E7AA8FD40BC825C)videoPreviewTimeRangeForImageAnalysisInteraction:(SEL)a3
{
  id v5 = a4;
  if (objc_opt_respondsToSelector())
  {
    if (v5)
    {
      [v5 videoPreviewTimeRange];
    }
    else
    {
      *(_OWORD *)&retstr->var0.int64_t var3 = 0u;
      *(_OWORD *)&retstr->var1.var1 = 0u;
      *(_OWORD *)&retstr->var0.var0 = 0u;
    }
  }
  else
  {
    CMTime start = kCMTimeZero;
    CMTime v7 = start;
    CMTimeRangeMake((CMTimeRange *)retstr, &start, &v7);
  }

  return result;
}

- (CGRect)videoPreviewNormalizedCropRectForImageAnalysisInteraction:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    [v3 videoPreviewNormalizedCropRect];
    CGFloat x = v4;
    CGFloat y = v6;
    CGFloat width = v8;
    CGFloat height = v10;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)setUsesLightDimmingViewInLightModeForImageAnalysisInteraction:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    [v3 setUsesLightDimmingViewInLightMode:1];
  }
}

@end