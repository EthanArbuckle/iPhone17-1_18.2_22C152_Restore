@interface CMAMessagesExtensionUtilities
+ (CGRect)shutterButtonAlignmentRectForReferenceBounds:(CGRect)a3 layoutStyle:(int64_t)a4 screenScale:(double)a5;
@end

@implementation CMAMessagesExtensionUtilities

+ (CGRect)shutterButtonAlignmentRectForReferenceBounds:(CGRect)a3 layoutStyle:(int64_t)a4 screenScale:(double)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11 = +[CAMCaptureCapabilities capabilities];
  unsigned int v12 = [v11 isCTMSupported];

  if (v12)
  {
    +[CAMDynamicShutterControl shutterButtonSpecForLayoutStyle:a4];
    id v13 = objc_msgSend(objc_alloc((Class)CAMFullscreenViewfinderLayout), "initWithReferenceBounds:shutterIntrinsicSize:", 0.0, 0.0, fmin(width, height), fmax(width, height), v39, v39);
    [v13 alignmentRectForShutterControl];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
  }
  else
  {
    +[PUReviewScreenUtilities cameraBottomBarFrameForReferenceBounds:](PUReviewScreenUtilities, "cameraBottomBarFrameForReferenceBounds:", x, y, width, height);
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    v30 = +[UITraitCollection traitCollectionWithDisplayScale:a5];
    +[CAMBottomBar shutterButtonAlignmentRectInBounds:forLayoutStyle:traitCollection:safeAreaInsets:](CAMBottomBar, "shutterButtonAlignmentRectInBounds:forLayoutStyle:traitCollection:safeAreaInsets:", a4, v30, v23, v25, v27, v29, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    double v15 = v31;
    double v17 = v32;
    double v19 = v33;
    double v21 = v34;
  }
  double v35 = v15;
  double v36 = v17;
  double v37 = v19;
  double v38 = v21;
  result.size.double height = v38;
  result.size.double width = v37;
  result.origin.double y = v36;
  result.origin.double x = v35;
  return result;
}

@end