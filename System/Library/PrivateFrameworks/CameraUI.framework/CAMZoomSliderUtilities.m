@interface CAMZoomSliderUtilities
+ (void)layoutZoomSlider:(CGFloat)a3 forLayoutStyle:(CGFloat)a4 bottomBarAlignmentRect:(CGFloat)a5 bottomBarTransparent:(CGFloat)a6 shutterButtonAlignmentRect:(CGFloat)a7 previewViewAlignmentRect:(CGFloat)a8 viewfinderViewAlignmentRect:(uint64_t)a9;
+ (void)layoutZoomSlider:(id)a3 forLayoutStyle:(int64_t)a4 bottomBar:(id)a5 previewView:(id)a6 viewfinderView:(id)a7;
@end

@implementation CAMZoomSliderUtilities

+ (void)layoutZoomSlider:(id)a3 forLayoutStyle:(int64_t)a4 bottomBar:(id)a5 previewView:(id)a6 viewfinderView:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v59 = [v15 superview];
  BOOL v16 = [v14 backgroundStyle] == 1;
  [v14 layoutIfNeeded];
  v17 = [v14 shutterButton];
  [v17 frame];
  objc_msgSend(v17, "alignmentRectForFrame:");
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v26 = [v17 superview];
  objc_msgSend(v26, "convertRect:toView:", v59, v19, v21, v23, v25);
  double v57 = v28;
  double v58 = v27;
  double v55 = v30;
  double v56 = v29;

  [v14 bounds];
  objc_msgSend(v14, "convertRect:toView:", v59);
  double v53 = v32;
  double v54 = v31;
  double v51 = v34;
  double v52 = v33;

  [v13 bounds];
  objc_msgSend(v13, "convertRect:toView:", v59);
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v42 = v41;

  [v12 bounds];
  objc_msgSend(v12, "convertRect:toView:", v59);
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t v48 = v47;
  uint64_t v50 = v49;

  objc_msgSend(a1, "layoutZoomSlider:forLayoutStyle:bottomBarAlignmentRect:bottomBarTransparent:shutterButtonAlignmentRect:previewViewAlignmentRect:viewfinderViewAlignmentRect:", v15, a4, v16, v54, v53, v52, v51, v58, v57, v56, v55, v36, v38, v40, v42, v44,
    v46,
    v48,
    v50);
}

+ (void)layoutZoomSlider:(CGFloat)a3 forLayoutStyle:(CGFloat)a4 bottomBarAlignmentRect:(CGFloat)a5 bottomBarTransparent:(CGFloat)a6 shutterButtonAlignmentRect:(CGFloat)a7 previewViewAlignmentRect:(CGFloat)a8 viewfinderViewAlignmentRect:(uint64_t)a9
{
  id v34 = a11;
  BOOL v35 = +[CAMBottomBar wantsVerticalBarForLayoutStyle:a12];
  v62.origin.x = a1;
  v62.origin.y = a2;
  v62.size.width = a3;
  v62.size.height = a4;
  BOOL IsEmpty = CGRectIsEmpty(v62);
  v63.origin.x = a5;
  v63.origin.y = a6;
  v63.size.width = a7;
  v63.size.height = a8;
  BOOL v37 = CGRectIsEmpty(v63);
  uint64_t v38 = [v34 minimumTrackImageForState:0];
  [v38 size];
  long long v40 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v59 = *MEMORY[0x263F000D0];
  long long v60 = v40;
  long long v61 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  if (v35)
  {
    CGAffineTransformMakeRotation(&v58, -1.57079633);
    UIIntegralTransform();
    v64.origin.x = a18;
    v64.origin.y = a19;
    v64.size.width = a20;
    v64.size.height = a21;
    double MinX = CGRectGetMinX(v64);
    v65.origin.x = a18;
    v65.origin.y = a19;
    v65.size.width = a20;
    v65.size.height = a21;
    CGRectGetHeight(v65);
    UIRoundToViewScale();
    double v43 = v42;
    double v44 = 25.0;
    double v45 = 0.0;
    double Width = 64.0;
    double v47 = 320.0;
    double v48 = 0.0;
  }
  else
  {
    CGFloat rect = a4;
    double v56 = v39;
    CGFloat v54 = a8;
    uint64_t v49 = [MEMORY[0x263F82B60] mainScreen];
    [v49 scale];
    double v45 = 1.0 / v50 * 2.0 + 35.0;

    if ((IsEmpty | a13))
    {
      CGFloat v51 = a18;
      if (v37)
      {
        v66.size.width = a16;
        v66.size.height = a17;
        v66.origin.x = a14;
        v66.origin.y = a15;
        double MaxY = CGRectGetMaxY(v66);
        double v44 = 20.0;
        double v45 = 10.0;
      }
      else
      {
        v68.origin.x = a5;
        v68.size.height = v54;
        v68.origin.y = a6;
        v68.size.width = a7;
        double MaxY = CGRectGetMinY(v68);
        double v44 = 20.0;
      }
      double v48 = 30.0;
    }
    else
    {
      v67.origin.x = a1;
      v67.origin.y = a2;
      v67.size.width = a3;
      v67.size.height = rect;
      double MaxY = CGRectGetMinY(v67) + 10.0;
      double v45 = v45 + 10.0;
      double v44 = 20.0;
      double v48 = 30.0;
      CGFloat v51 = a18;
    }
    v69.origin.x = v51;
    v69.origin.y = a19;
    v69.size.width = a20;
    v69.size.height = a21;
    CGFloat v53 = CGRectGetMinX(v69);
    v70.origin.x = v51;
    double MinX = v53;
    v70.origin.y = a19;
    v70.size.width = a20;
    v70.size.height = a21;
    double Width = CGRectGetWidth(v70);
    double v47 = v45 + v56 + v48;
    double v43 = MaxY - v47;
  }
  objc_msgSend(v34, "setAlignmentRectInsets:", v48, v44, v45, v44);
  v57[0] = v59;
  v57[1] = v60;
  v57[2] = v61;
  [v34 setTransform:v57];
  objc_msgSend(v34, "setFrame:", MinX, v43, Width, v47);
}

@end