@interface HKGraphRenderView
- (CGRect)_tightBoundingRectForText:(id)a3 inTextRect:(CGRect)a4 axisRect:(CGRect)a5;
- (CGRect)axisRect;
- (CGSize)drawAttributedText:(id)a3 atPoint:(CGPoint)a4 axisRect:(CGRect)a5 horizontalAlignment:(int64_t)a6 verticalAlignment:(int64_t)a7 exclusion:(id)a8;
- (CGSize)drawText:(id)a3 atPoint:(CGPoint)a4 spaceAvailable:(id)a5 horizontalAlignment:(int64_t)a6 verticalAlignment:(int64_t)a7 hyphenationFactor:(id)a8 textColor:(id)a9 font:(id)a10 clipToAxis:(BOOL)a11 exclusion:(id)a12 isSystemSymbol:(BOOL)a13 isTallText:(BOOL)a14;
- (HKGraphRenderDelegate)renderDelegate;
- (HKGraphRenderView)initWithFrame:(CGRect)a3;
- (double)_verticalPosition:(double)a3 withTopMargin:(double)a4 bottomMargin:(double)a5 boundedByAxisRect:(CGRect)a6;
- (void)drawPath:(id)a3 strokeColor:(id)a4 fillColor:(id)a5 markerImage:(id)a6 useGradientFill:(BOOL)a7 blendMode:(int)a8 clipToAxes:(BOOL)a9;
- (void)drawRect:(CGRect)a3;
- (void)fillRect:(CGRect)a3 withFillStyle:(id)a4 axisRect:(CGRect)a5 alpha:(double)a6;
- (void)setAxisRect:(CGRect)a3;
- (void)setRenderDelegate:(id)a3;
@end

@implementation HKGraphRenderView

- (HKGraphRenderView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HKGraphRenderView;
  v3 = -[HKGraphRenderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v3->_axisRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v3->_axisRect.size = v5;
    v6 = [(HKGraphRenderView *)v3 layer];
    [v6 setDrawsAsynchronously:1];

    v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(HKGraphRenderView *)v4 setBackgroundColor:v7];
  }
  return v4;
}

- (void)drawPath:(id)a3 strokeColor:(id)a4 fillColor:(id)a5 markerImage:(id)a6 useGradientFill:(BOOL)a7 blendMode:(int)a8 clipToAxes:(BOOL)a9
{
  BOOL v10 = a7;
  v40[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  CGContextRef CurrentContext = 0;
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState((CGContextRef)v37[3]);
  if (a9 && !CGRectEqualToRect(self->_axisRect, *MEMORY[0x1E4F1DB20])) {
    CGContextClipToRect((CGContextRef)v37[3], self->_axisRect);
  }
  if (a8) {
    CGContextSetBlendMode((CGContextRef)v37[3], (CGBlendMode)a8);
  }
  if (v16)
  {
    [v16 setStroke];
    [v15 stroke];
  }
  if (v17)
  {
    [v15 addClip];
    if (v10)
    {
      space = CGColorSpaceCreateDeviceRGB();
      id v19 = [v17 colorWithAlphaComponent:0.5];
      v40[0] = [v19 CGColor];
      v20 = [MEMORY[0x1E4FB1618] blackColor];
      id v21 = [v20 colorWithAlphaComponent:0.5];
      v40[1] = [v21 CGColor];
      CFArrayRef v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
      v23 = CGGradientCreateWithColors(space, v22, 0);

      v24 = (CGContext *)v37[3];
      [(HKGraphRenderView *)self bounds];
      v41.y = v25 * 0.5;
      v41.x = 0.0;
      CGContextDrawLinearGradient(v24, v23, v41, *MEMORY[0x1E4F1DAD8], 3u);
      CGColorSpaceRelease(space);
      CGGradientRelease(v23);
    }
    else
    {
      [v17 setFill];
      [v15 fill];
    }
  }
  if (v18)
  {
    [v18 size];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __101__HKGraphRenderView_drawPath_strokeColor_fillColor_markerImage_useGradientFill_blendMode_clipToAxes___block_invoke;
    v29[3] = &unk_1E6D56538;
    v31 = &v36;
    double v32 = v26 * -0.5;
    double v33 = v27 * -0.5;
    double v34 = v26;
    double v35 = v27;
    id v30 = v18;
    objc_msgSend(v15, "hk_applyBlock:", v29);
  }
  CGContextRestoreGState((CGContextRef)v37[3]);
  _Block_object_dispose(&v36, 8);
}

void __101__HKGraphRenderView_drawPath_strokeColor_fillColor_markerImage_useGradientFill_blendMode_clipToAxes___block_invoke(uint64_t a1, int a2, CGFloat a3, CGFloat a4)
{
  if (a2 != 4)
  {
    v6 = *(CGContext **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    CGRect v16 = CGRectOffset(*(CGRect *)(a1 + 48), a3, a4);
    CGFloat x = v16.origin.x;
    CGFloat y = v16.origin.y;
    CGFloat width = v16.size.width;
    CGFloat height = v16.size.height;
    v11 = (CGImage *)[*(id *)(a1 + 32) CGImage];
    CGFloat v12 = x;
    CGFloat v13 = y;
    CGFloat v14 = width;
    CGFloat v15 = height;
    CGContextDrawImage(v6, *(CGRect *)&v12, v11);
  }
}

- (void)fillRect:(CGRect)a3 withFillStyle:(id)a4 axisRect:(CGRect)a5 alpha:(double)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  double v11 = a3.origin.y;
  double v12 = a3.origin.x;
  id v13 = a4;
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v12, v11, v10, v9);
  id v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "renderPath:context:axisRect:alpha:", objc_msgSend(v15, "CGPath"), CurrentContext, x, y, width, height, a6);
}

- (CGSize)drawText:(id)a3 atPoint:(CGPoint)a4 spaceAvailable:(id)a5 horizontalAlignment:(int64_t)a6 verticalAlignment:(int64_t)a7 hyphenationFactor:(id)a8 textColor:(id)a9 font:(id)a10 clipToAxis:(BOOL)a11 exclusion:(id)a12 isSystemSymbol:(BOOL)a13 isTallText:(BOOL)a14
{
  double y = a4.y;
  double x = a4.x;
  v54[3] = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v52 = a5;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a12;
  double v25 = objc_opt_new();
  [v25 setAlignment:a6];
  if (v21)
  {
    [v21 floatValue];
    objc_msgSend(v25, "setHyphenationFactor:");
  }
  v50 = v22;
  v51 = v21;
  v49 = v23;
  if (a13)
  {
    double v26 = [MEMORY[0x1E4FB1830] configurationWithFont:v23 scale:-1];
    double v27 = [MEMORY[0x1E4FB1818] _systemImageNamed:v20 withConfiguration:v26];
    v28 = [v27 imageWithTintColor:v22];

    id v29 = objc_alloc_init(MEMORY[0x1E4FB0870]);
    [v29 setImage:v28];
    [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v29];
    v31 = id v30 = v20;
    double v32 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1F3B9CF20];
    [v32 appendAttributedString:v31];
    double v33 = (void *)[v32 copy];

    id v20 = v30;
  }
  else
  {
    uint64_t v34 = *MEMORY[0x1E4FB0700];
    v53[0] = *MEMORY[0x1E4FB06F8];
    v53[1] = v34;
    v54[0] = v23;
    v54[1] = v22;
    v53[2] = *MEMORY[0x1E4FB0738];
    v54[2] = v25;
    double v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:3];
    double v33 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v20 attributes:v26];
  }

  if (v52)
  {
    [v52 doubleValue];
    double v36 = v35;
  }
  else
  {
    double v36 = 1.79769313e308;
  }
  objc_msgSend(v33, "size", self);
  double v39 = v38;
  if (v37 <= v36)
  {
    double v36 = v37;
  }
  else
  {
    BOOL v40 = v37 < floor(v36 + v36);
    double v41 = 3.0;
    if (v40) {
      double v41 = 2.0;
    }
    double v39 = v38 * v41;
  }
  if (a6 == 1)
  {
    double x = x + v36 * -0.5;
  }
  else if (a6 == 2)
  {
    double x = x - v36;
  }
  if (a7 == 3)
  {
    double v42 = 0.0;
    if (a14) {
      double v42 = 2.0;
    }
    double y = y - (v42 + v39);
    if (!v24) {
      goto LABEL_28;
    }
  }
  else
  {
    if (a7 == 2) {
      double y = y + v39 * -0.5;
    }
    if (!v24) {
      goto LABEL_28;
    }
  }
  if (objc_msgSend(v24, "excludeRect:", x, y, v36, v39))
  {
    double v36 = *MEMORY[0x1E4F1DB30];
    double v39 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    goto LABEL_31;
  }
LABEL_28:
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  if (a11)
  {
    CGContextAddRect(CurrentContext, v47[13]);
    CGContextClip(CurrentContext);
  }
  objc_msgSend(v33, "drawInRect:", x, y, v36, v39);
  CGContextRestoreGState(CurrentContext);
LABEL_31:

  double v44 = v36;
  double v45 = v39;
  result.double height = v45;
  result.double width = v44;
  return result;
}

- (CGSize)drawAttributedText:(id)a3 atPoint:(CGPoint)a4 axisRect:(CGRect)a5 horizontalAlignment:(int64_t)a6 verticalAlignment:(int64_t)a7 exclusion:(id)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v15 = a4.y;
  double v16 = a4.x;
  id v18 = a3;
  id v19 = a8;
  [v18 size];
  double v21 = v20;
  double v23 = v22;
  double v24 = v16 + v20 * -0.5;
  double v25 = v16 - v21;
  if (a6 != 2) {
    double v25 = v16;
  }
  if (a6 == 1) {
    double v26 = v24;
  }
  else {
    double v26 = v25;
  }
  double v27 = v23 * 0.5;
  double v28 = v27 + v27;
  double v29 = v15 - v23 * 0.5;
  if (a7 == 2)
  {
    double v30 = 0.0;
  }
  else
  {
    double v29 = v15;
    double v30 = v23 * 0.5;
  }
  if (a7 == 2) {
    double v31 = v27 + v27;
  }
  else {
    double v31 = v23 * 0.5;
  }
  if (a7 == 3) {
    double v32 = v15 - (v27 + v27);
  }
  else {
    double v32 = v29;
  }
  if (a7 == 3)
  {
    double v33 = 0.0;
  }
  else
  {
    double v28 = v30;
    double v33 = v31;
  }
  -[HKGraphRenderView _verticalPosition:withTopMargin:bottomMargin:boundedByAxisRect:](self, "_verticalPosition:withTopMargin:bottomMargin:boundedByAxisRect:", v32, v28, v33, x, y, width, height);
  double v35 = v34;
  -[HKGraphRenderView _tightBoundingRectForText:inTextRect:axisRect:](self, "_tightBoundingRectForText:inTextRect:axisRect:", v18, v26, v34, v21, v23, x, y, width, height);
  if (v19 && objc_msgSend(v19, "excludeRect:"))
  {
    double v21 = *MEMORY[0x1E4F1DB30];
    double v23 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    objc_msgSend(v18, "drawInRect:", v26, v35, v21, v23);
    CGContextRestoreGState(CurrentContext);
  }

  double v37 = v21;
  double v38 = v23;
  result.double height = v38;
  result.double width = v37;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  double v9 = [(HKGraphRenderView *)self renderDelegate];
  objc_msgSend(v9, "graphRenderer:shouldRenderSceneWithContext:chartRect:", self, CurrentContext, x, y, width, height);

  CGContextRestoreGState(CurrentContext);
}

- (double)_verticalPosition:(double)a3 withTopMargin:(double)a4 bottomMargin:(double)a5 boundedByAxisRect:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  if (!CGRectIsNull(a6))
  {
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    double v13 = a4 - a3 - CGRectGetMinY(v17);
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v18);
    if (v13 <= 0.0)
    {
      double v15 = a5 - MaxY - a3;
      if (v15 > 0.0) {
        return a3 - v15;
      }
    }
    else
    {
      return v13 + a3;
    }
  }
  return a3;
}

- (CGRect)_tightBoundingRectForText:(id)a3 inTextRect:(CGRect)a4 axisRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  double v7 = a4.size.height;
  CGFloat v8 = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat rect_8 = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  v34.CGFloat width = width;
  v34.CGFloat height = height;
  UIGraphicsBeginImageContextWithOptions(v34, 1, 0.0);
  id v12 = objc_alloc_init(MEMORY[0x1E4FB0860]);
  [v12 setWantsMultilineDeviceMetrics:1];
  double v13 = y;
  double v14 = v8;
  CGFloat v15 = v8;
  CGFloat v16 = v7;
  objc_msgSend(v11, "drawWithRect:options:context:", 9, v12, x, v13, v14, v7);

  [v12 multilineDeviceMetricsRect];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  v35.origin.double x = x;
  v35.origin.CGFloat y = rect_8;
  v35.size.CGFloat width = v15;
  v35.size.CGFloat height = v7;
  double MidX = CGRectGetMidX(v35);
  v36.origin.double x = v18;
  v36.origin.CGFloat y = v20;
  v36.size.CGFloat width = v22;
  v36.size.CGFloat height = v24;
  double v26 = MidX - CGRectGetWidth(v36) * 0.5;
  v37.origin.double x = x;
  v37.origin.CGFloat y = rect_8;
  v37.size.CGFloat width = v15;
  v37.size.CGFloat height = v16;
  double MidY = CGRectGetMidY(v37);
  v38.origin.double x = v18;
  v38.origin.CGFloat y = v20;
  v38.size.CGFloat width = v22;
  v38.size.CGFloat height = v24;
  double v28 = MidY - CGRectGetHeight(v38) * 0.5;
  UIGraphicsEndImageContext();

  double v29 = v26;
  double v30 = v28;
  double v31 = v22;
  double v32 = v24;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.double x = v29;
  return result;
}

- (HKGraphRenderDelegate)renderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->renderDelegate);
  return (HKGraphRenderDelegate *)WeakRetained;
}

- (void)setRenderDelegate:(id)a3
{
}

- (CGRect)axisRect
{
  double x = self->_axisRect.origin.x;
  double y = self->_axisRect.origin.y;
  double width = self->_axisRect.size.width;
  double height = self->_axisRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAxisRect:(CGRect)a3
{
  self->_axisRect = a3;
}

- (void).cxx_destruct
{
}

@end