@interface CAMPanoramaUtilities
+ (CGSize)bufferSize;
+ (CGSize)defaultPreviewSize;
+ (CGSize)panoramaViewSizeForCaptureSize:(CGSize)a3 referenceBounds:(CGRect)a4 layoutStyle:(int64_t)a5;
+ (CGSize)previewStripSizeForCaptureSize:(CGSize)a3 referenceBounds:(CGRect)a4 layoutStyle:(int64_t)a5;
+ (UIEdgeInsets)panoramaViewLayoutInsetsForLayoutStyle:(int64_t)a3 referenceBounds:(CGRect)a4;
+ (UIEdgeInsets)panoramaViewPreviewStripInsetsForLayoutStyle:(int64_t)a3;
+ (double)singlePreviewFrameWidthForPreviewHeight:(double)a3;
@end

@implementation CAMPanoramaUtilities

+ (CGSize)defaultPreviewSize
{
  v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 _referenceBounds];

  v4 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  [a1 bufferSize];
  objc_msgSend(a1, "previewStripSizeForCaptureSize:referenceBounds:layoutStyle:", v5);
  result.height = v7;
  result.width = v6;
  return result;
}

+ (CGSize)previewStripSizeForCaptureSize:(CGSize)a3 referenceBounds:(CGRect)a4 layoutStyle:(int64_t)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v10 = a3.height;
  double v11 = a3.width;
  objc_msgSend(a1, "panoramaViewPreviewStripInsetsForLayoutStyle:");
  double v14 = v13;
  double v16 = v15;
  objc_msgSend(a1, "panoramaViewLayoutInsetsForLayoutStyle:referenceBounds:", a5, x, y, width, height);
  double v19 = width - v14 - v16 - v17 - v18;
  double v20 = floor(v10 / v11 * v19);
  result.double height = v20;
  result.double width = v19;
  return result;
}

+ (CGSize)panoramaViewSizeForCaptureSize:(CGSize)a3 referenceBounds:(CGRect)a4 layoutStyle:(int64_t)a5
{
  double width = a4.size.width;
  double height = a4.size.height;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.height;
  double v9 = a3.width;
  objc_msgSend(a1, "panoramaViewPreviewStripInsetsForLayoutStyle:");
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  objc_msgSend(a1, "previewStripSizeForCaptureSize:referenceBounds:layoutStyle:", a5, v9, v8, x, y, width, height);
  double v20 = v18 + v14 + v19;
  double v22 = v16 + v12 + v21;
  result.double height = v22;
  result.double width = v20;
  return result;
}

+ (UIEdgeInsets)panoramaViewLayoutInsetsForLayoutStyle:(int64_t)a3 referenceBounds:(CGRect)a4
{
  double v4 = *MEMORY[0x263F834E8];
  double v5 = *(double *)(MEMORY[0x263F834E8] + 16);
  if (a3 == 1)
  {
    double v6 = dbl_209C7B070[a4.size.width < 1024.0];
    uint64_t v15 = 0;
    memset(v14, 0, sizeof(v14));
    CAMShutterButtonSpecForLayoutStyle(1, (uint64_t)v14);
    double v7 = *(double *)v14;
    double v8 = +[CAMCaptureCapabilities capabilities];
    int v9 = [v8 shouldAllowCameraToggleForMode:3 devicePosition:0 videoConfiguration:0 videoStabilizationStrength:0];

    double v10 = v6 + v7 * 0.5;
    if (v9) {
      double v11 = v6 + v7 * 0.5;
    }
    else {
      double v11 = 30.0;
    }
  }
  else
  {
    double v11 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v10 = *(double *)(MEMORY[0x263F834E8] + 24);
  }
  double v12 = v4;
  double v13 = v5;
  result.right = v10;
  result.bottom = v13;
  result.left = v11;
  result.top = v12;
  return result;
}

+ (UIEdgeInsets)panoramaViewPreviewStripInsetsForLayoutStyle:(int64_t)a3
{
  double v3 = *MEMORY[0x263F834E8];
  double v4 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v5 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v6 = *(double *)(MEMORY[0x263F834E8] + 24);
  if (unint64_t)a3 <= 4 && ((0x17u >> a3))
  {
    double v6 = dbl_209C7B080[a3];
    double v5 = 2.0;
    double v4 = v6;
    double v3 = 2.0;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (CGSize)bufferSize
{
  v2 = +[CAMPanoramaConfiguration sharedInstance];
  double v3 = (double)[v2 maxWidth];
  double v4 = (double)[v2 sampleBufferWidth];

  double v5 = v3;
  double v6 = v4;
  result.double height = v6;
  result.double width = v5;
  return result;
}

+ (double)singlePreviewFrameWidthForPreviewHeight:(double)a3
{
  return ceil(a3 * 3.0 * 0.25);
}

@end