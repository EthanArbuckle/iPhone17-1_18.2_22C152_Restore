@interface STKDragPreviewContainerView
+ (CGAffineTransform)targetPreviewTransform;
+ (id)meshTransformWithContentScale:(double)a3;
+ (id)shadowPropertiesForDrag;
+ (id)springAnimationWithKeyPath:(id)a3 speed:(float)a4;
- (BOOL)defersFinalDropAnimationCompletion;
- (BOOL)dropAnimationIsComplete;
- (BOOL)isDropAnimation;
- (BOOL)showDebugBorders;
- (BOOL)useEmojiKeyboardMeshTransform;
- (CALayer)dropShadowLayer;
- (CALayer)meshLayer;
- (CALayer)peelImageLayer;
- (CALayer)peelLayer;
- (CALayer)peelMaskLayer;
- (CALayer)perspectiveLayer;
- (CALayer)shadowLayer;
- (CALayer)shineLayer;
- (CGPoint)dropShadowLayerStartPosition;
- (CGPoint)meshLayerStartPosition;
- (CGPoint)originalCenter;
- (CGPoint)peelLayerStartPosition;
- (CGPoint)shadowLayerStartPosition;
- (CGPoint)shineLayerStartPosition;
- (CGSize)initialSize;
- (CGSize)rasterizedImageSize;
- (STKDragPreviewContainerView)initWithIsDropAnimation:(BOOL)a3;
- (UIImage)image;
- (UIView)currentDropPreviewSnapshot;
- (UIView)previewView;
- (double)dragViewScale;
- (double)dragViewScaleUp;
- (id)clientDropCompletion;
- (id)finalUIKitDropCompletion;
- (id)peelMaskImageFromImage:(id)a3;
- (void)_animateDropAlongsideAnimator:(id)a3 completion:(id)a4;
- (void)_animateLiftAlongsideAnimator:(id)a3 completion:(id)a4;
- (void)_animateLiftCancellationAlongsideAnimator:(id)a3 completion:(id)a4;
- (void)_preparePreviewContainerWithPreview:(id)a3 source:(id)a4 initialTransform:(CGAffineTransform *)a5;
- (void)finalizeDropIfNecessary;
- (void)performAfterDropAnimation:(id)a3;
- (void)reversePeelAnimationToPoint:(CGPoint)a3 forPlacement:(BOOL)a4 shouldShrink:(BOOL)a5 completionBlock:(id)a6;
- (void)setClientDropCompletion:(id)a3;
- (void)setCurrentDropPreviewSnapshot:(id)a3;
- (void)setDefersFinalDropAnimationCompletion:(BOOL)a3;
- (void)setDropAnimationIsComplete:(BOOL)a3;
- (void)setDropShadowLayer:(id)a3;
- (void)setDropShadowLayerStartPosition:(CGPoint)a3;
- (void)setFinalUIKitDropCompletion:(id)a3;
- (void)setImage:(id)a3;
- (void)setIsDropAnimation:(BOOL)a3;
- (void)setMeshLayer:(id)a3;
- (void)setMeshLayerStartPosition:(CGPoint)a3;
- (void)setOriginalCenter:(CGPoint)a3;
- (void)setPeelImageLayer:(id)a3;
- (void)setPeelLayer:(id)a3;
- (void)setPeelLayerStartPosition:(CGPoint)a3;
- (void)setPeelMaskLayer:(id)a3;
- (void)setPerspectiveLayer:(id)a3;
- (void)setPreviewView:(id)a3;
- (void)setShadowLayer:(id)a3;
- (void)setShadowLayerStartPosition:(CGPoint)a3;
- (void)setShineLayer:(id)a3;
- (void)setShineLayerStartPosition:(CGPoint)a3;
- (void)setUseEmojiKeyboardMeshTransform:(BOOL)a3;
@end

@implementation STKDragPreviewContainerView

- (STKDragPreviewContainerView)initWithIsDropAnimation:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STKDragPreviewContainerView;
  v4 = -[STKDragPreviewContainerView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_isDropAnimation = a3;
    [(STKDragPreviewContainerView *)v4 setClipsToBounds:0];
  }
  return v5;
}

+ (id)meshTransformWithContentScale:(double)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__STKDragPreviewContainerView_meshTransformWithContentScale___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  *(double *)&block[4] = a3;
  if (meshTransformWithContentScale__onceToken != -1) {
    dispatch_once(&meshTransformWithContentScale__onceToken, block);
  }
  v3 = (void *)meshTransformWithContentScale____mesh;

  return v3;
}

void __61__STKDragPreviewContainerView_meshTransformWithContentScale___block_invoke(uint64_t a1)
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  double v1 = *(double *)(a1 + 32) + -1.0;
  v5[0] = 0.0 - v1;
  v5[1] = 0.0;
  long long v6 = xmmword_2454061F0;
  v5[2] = 0.0 - v1;
  double v7 = v1 + 1.0;
  uint64_t v8 = 0;
  double v9 = v1 + 1.0;
  long long v10 = xmmword_2454061F0;
  double v11 = 0.0 - v1;
  uint64_t v12 = 0x3FB999999999999ALL;
  long long v14 = xmmword_245406200;
  double v13 = 0.0 - v1;
  double v15 = v1 + 1.0;
  uint64_t v16 = 0x3FB999999999999ALL;
  double v17 = v1 + 1.0;
  long long v18 = xmmword_245406200;
  double v19 = 0.0 - v1;
  uint64_t v20 = 0x3FC999999999999ALL;
  long long v22 = xmmword_245406210;
  double v21 = 0.0 - v1;
  double v23 = v1 + 1.0;
  uint64_t v24 = 0x3FC999999999999ALL;
  double v25 = v1 + 1.0;
  long long v26 = xmmword_245406210;
  double v27 = 0.0 - v1;
  uint64_t v28 = 0x3FD3333333333333;
  double v29 = 0.0 - v1;
  uint64_t v30 = 0x3FD3333333333333;
  uint64_t v31 = 0x405E000000000000;
  double v32 = v1 + 1.0;
  uint64_t v33 = 0x3FD3333333333333;
  double v34 = v1 + 1.0;
  long long v35 = xmmword_245406220;
  double v36 = 0.0 - v1;
  uint64_t v37 = 0x3FD999999999999ALL;
  double v38 = 0.0 - v1;
  uint64_t v39 = 0x3FD999999999999ALL;
  uint64_t v40 = 0x405E000000000000;
  double v41 = v1 + 1.0;
  uint64_t v42 = 0x3FD999999999999ALL;
  double v43 = v1 + 1.0;
  long long v44 = xmmword_245406230;
  double v45 = 0.0 - v1;
  uint64_t v46 = 0x3FE0000000000000;
  double v47 = 0.0 - v1;
  uint64_t v48 = 0x3FE0000000000000;
  uint64_t v49 = 0x405E000000000000;
  double v50 = v1 + 1.0;
  uint64_t v51 = 0x3FE0000000000000;
  double v52 = v1 + 1.0;
  long long v53 = xmmword_245406240;
  double v54 = 0.0 - v1;
  uint64_t v55 = 0x3FE3333333333333;
  double v56 = 0.0 - v1;
  uint64_t v57 = 0x3FE3333333333333;
  uint64_t v58 = 0;
  double v59 = v1 + 1.0;
  uint64_t v60 = 0x3FE3333333333333;
  double v61 = v1 + 1.0;
  long long v62 = xmmword_245406250;
  double v63 = 0.0 - v1;
  uint64_t v64 = 0x3FE6666666666666;
  double v65 = 0.0 - v1;
  uint64_t v66 = 0x3FE6666666666666;
  uint64_t v67 = 0;
  double v68 = v1 + 1.0;
  uint64_t v69 = 0x3FE6666666666666;
  double v70 = v1 + 1.0;
  long long v71 = xmmword_245406260;
  double v72 = 0.0 - v1;
  uint64_t v73 = 0x3FE999999999999ALL;
  double v74 = 0.0 - v1;
  uint64_t v75 = 0x3FE999999999999ALL;
  uint64_t v76 = 0;
  double v77 = v1 + 1.0;
  uint64_t v78 = 0x3FE999999999999ALL;
  double v79 = v1 + 1.0;
  long long v80 = xmmword_245406270;
  double v81 = 0.0 - v1;
  uint64_t v82 = 0x3FECCCCCCCCCCCCDLL;
  double v83 = 0.0 - v1;
  uint64_t v84 = 0x3FECCCCCCCCCCCCDLL;
  uint64_t v85 = 0;
  double v86 = v1 + 1.0;
  uint64_t v87 = 0x3FECCCCCCCCCCCCDLL;
  double v88 = v1 + 1.0;
  long long v89 = xmmword_245406280;
  double v90 = 0.0 - v1;
  uint64_t v91 = 0x3FF0000000000000;
  double v92 = 0.0 - v1;
  uint64_t v93 = 0x3FF0000000000000;
  uint64_t v94 = 0;
  double v95 = v1 + 1.0;
  uint64_t v96 = 0x3FF0000000000000;
  double v97 = v1 + 1.0;
  long long v98 = xmmword_245406290;
  memcpy(__dst, &unk_2454062C8, sizeof(__dst));
  uint64_t v2 = [MEMORY[0x263F15810] meshTransformWithVertexCount:22 vertices:v5 faceCount:10 faces:__dst depthNormalization:*MEMORY[0x263F15A28]];
  v3 = (void *)meshTransformWithContentScale____mesh;
  meshTransformWithContentScale____mesh = v2;
}

+ (id)springAnimationWithKeyPath:(id)a3 speed:(float)a4
{
  v5 = [MEMORY[0x263F15890] animationWithKeyPath:a3];
  [v5 setMass:2.0];
  [v5 setStiffness:300.0];
  [v5 setDamping:400.0];
  *(float *)&double v6 = a4;
  [v5 setSpeed:v6];
  [v5 setDuration:0.91];
  id v7 = objc_alloc(MEMORY[0x263F15808]);
  LODWORD(v8) = 1041212815;
  LODWORD(v9) = 999867313;
  LODWORD(v10) = 1058228603;
  LODWORD(v11) = 1064805775;
  uint64_t v12 = (void *)[v7 initWithControlPoints:v8 :v9 :v10 :v11];
  [v5 setTimingFunction:v12];

  [v5 setFillMode:*MEMORY[0x263F15AB0]];
  [v5 setRemovedOnCompletion:0];

  return v5;
}

+ (id)shadowPropertiesForDrag
{
  uint64_t v2 = (objc_class *)MEMORY[0x24569F6B0](@"_UIDragPreviewShadowProperties", @"UIKit");
  if (v2)
  {
    id v3 = objc_alloc_init(v2);
    if (objc_opt_respondsToSelector()) {
      [v3 setShadowType:1];
    }
    if (objc_opt_respondsToSelector())
    {
      memset(&v7, 0, sizeof(v7));
      CGAffineTransformMakeTranslation(&v7, 0.0, 23.0);
      CGAffineTransform v5 = v7;
      CGAffineTransformScale(&v6, &v5, 1.12, 1.12);
      CGAffineTransform v7 = v6;
      [v3 setLiftedTransform:&v6];
    }
    if (objc_opt_respondsToSelector()) {
      [v3 setLiftedAlpha:0.23];
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (CGAffineTransform)targetPreviewTransform
{
  return CGAffineTransformMakeScale(retstr, 1.25, 1.25);
}

- (CGSize)initialSize
{
  [(STKDragPreviewContainerView *)self bounds];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (CGSize)rasterizedImageSize
{
  [(STKDragPreviewContainerView *)self bounds];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)peelMaskImageFromImage:(id)a3
{
  double v3 = *MEMORY[0x263F00148];
  double v4 = *(double *)(MEMORY[0x263F00148] + 8);
  id v5 = a3;
  [v5 size];
  double v7 = v6;
  double v9 = v8;
  double v10 = [MEMORY[0x263F82B60] mainScreen];
  [v10 scale];
  CGFloat v12 = v11;
  v17.width = v7;
  v17.height = v9;
  UIGraphicsBeginImageContextWithOptions(v17, 0, v12);

  double v13 = [MEMORY[0x263F825C8] blackColor];
  [v13 setFill];

  v18.origin.x = v3;
  v18.origin.y = v4;
  v18.size.width = v7;
  v18.size.height = v9;
  UIRectFillUsingBlendMode(v18, kCGBlendModeCopy);
  objc_msgSend(v5, "drawInRect:blendMode:alpha:", 22, v3, v4, v7, v9, 1.0);

  long long v14 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v14;
}

- (double)dragViewScaleUp
{
  [(STKDragPreviewContainerView *)self rasterizedImageSize];
  double v4 = v3;
  [(STKDragPreviewContainerView *)self initialSize];
  if (v4 < v5
    || ([(STKDragPreviewContainerView *)self rasterizedImageSize],
        double v7 = v6,
        [(STKDragPreviewContainerView *)self initialSize],
        double result = 1.0,
        v7 < v9))
  {
    [(STKDragPreviewContainerView *)self rasterizedImageSize];
    double v11 = v10;
    [(STKDragPreviewContainerView *)self rasterizedImageSize];
    double v13 = v12;
    [(STKDragPreviewContainerView *)self initialSize];
    double v15 = v14;
    double v17 = v16;
    [(STKDragPreviewContainerView *)self rasterizedImageSize];
    if (v11 <= v13) {
      return v15 / v18;
    }
    else {
      return v17 / v19;
    }
  }
  return result;
}

- (double)dragViewScale
{
  return 1.0;
}

- (void)finalizeDropIfNecessary
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if ([(STKDragPreviewContainerView *)self dropAnimationIsComplete])
  {
    double v3 = [(STKDragPreviewContainerView *)self clientDropCompletion];
    if (v3)
    {

LABEL_14:
      double v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        if ([(STKDragPreviewContainerView *)self dropAnimationIsComplete]) {
          double v12 = @"YES";
        }
        else {
          double v12 = @"NO";
        }
        double v13 = [(STKDragPreviewContainerView *)self clientDropCompletion];
        double v14 = _Block_copy(v13);
        if ([(STKDragPreviewContainerView *)self defersFinalDropAnimationCompletion])
        {
          double v15 = @"YES";
        }
        else
        {
          double v15 = @"NO";
        }
        double v16 = [(STKDragPreviewContainerView *)self finalUIKitDropCompletion];
        double v17 = _Block_copy(v16);
        int v22 = 134219010;
        double v23 = self;
        __int16 v24 = 2112;
        double v25 = v12;
        __int16 v26 = 2112;
        double v27 = v14;
        __int16 v28 = 2112;
        double v29 = v15;
        __int16 v30 = 2112;
        uint64_t v31 = v17;
        _os_log_impl(&dword_2451E4000, v11, OS_LOG_TYPE_DEFAULT, "<STKDragPreviewContainerView: %p> finalizeDropIfNecessary finalizing drop. dropAnimationIsComplete: %@, clientDropCompletion: %@, defersFinalDropAnimationCompletion: %@, finalUIKitDropCompletion: %@", (uint8_t *)&v22, 0x34u);
      }
      double v18 = [(STKDragPreviewContainerView *)self clientDropCompletion];

      if (v18)
      {
        double v19 = [(STKDragPreviewContainerView *)self clientDropCompletion];
        v19[2]();

        [(STKDragPreviewContainerView *)self setClientDropCompletion:0];
      }
      uint64_t v20 = [(STKDragPreviewContainerView *)self finalUIKitDropCompletion];

      if (v20)
      {
        double v21 = [(STKDragPreviewContainerView *)self finalUIKitDropCompletion];
        v21[2]();

        [(STKDragPreviewContainerView *)self setFinalUIKitDropCompletion:0];
      }
      return;
    }
    if (![(STKDragPreviewContainerView *)self defersFinalDropAnimationCompletion]) {
      goto LABEL_14;
    }
  }
  double v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if ([(STKDragPreviewContainerView *)self dropAnimationIsComplete]) {
      double v5 = @"YES";
    }
    else {
      double v5 = @"NO";
    }
    double v6 = [(STKDragPreviewContainerView *)self clientDropCompletion];
    double v7 = _Block_copy(v6);
    if ([(STKDragPreviewContainerView *)self defersFinalDropAnimationCompletion]) {
      double v8 = @"YES";
    }
    else {
      double v8 = @"NO";
    }
    double v9 = [(STKDragPreviewContainerView *)self finalUIKitDropCompletion];
    double v10 = _Block_copy(v9);
    int v22 = 134219010;
    double v23 = self;
    __int16 v24 = 2112;
    double v25 = v5;
    __int16 v26 = 2112;
    double v27 = v7;
    __int16 v28 = 2112;
    double v29 = v8;
    __int16 v30 = 2112;
    uint64_t v31 = v10;
    _os_log_impl(&dword_2451E4000, v4, OS_LOG_TYPE_DEFAULT, "<STKDragPreviewContainerView: %p> finalizeDropIfNecessary not finalizing yet. dropAnimationIsComplete: %@, clientDropCompletion: %@, defersFinalDropAnimationCompletion: %@, finalUIKitDropCompletion: %@", (uint8_t *)&v22, 0x34u);
  }
}

- (void)performAfterDropAnimation:(id)a3
{
  [(STKDragPreviewContainerView *)self setClientDropCompletion:a3];

  [(STKDragPreviewContainerView *)self finalizeDropIfNecessary];
}

- (void)setDefersFinalDropAnimationCompletion:(BOOL)a3
{
  if (self->_defersFinalDropAnimationCompletion != a3)
  {
    self->_defersFinalDropAnimationCompletion = a3;
    [(STKDragPreviewContainerView *)self finalizeDropIfNecessary];
  }
}

- (void)setDropAnimationIsComplete:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_dropAnimationIsComplete != a3)
  {
    BOOL v3 = a3;
    double v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = @"NO";
      if (v3) {
        double v6 = @"YES";
      }
      int v7 = 134218242;
      double v8 = self;
      __int16 v9 = 2112;
      double v10 = v6;
      _os_log_impl(&dword_2451E4000, v5, OS_LOG_TYPE_DEFAULT, "<STKDragPreviewContainerView: %p> setDropAnimationIsComplete: %@", (uint8_t *)&v7, 0x16u);
    }

    self->_dropAnimationIsComplete = v3;
    [(STKDragPreviewContainerView *)self finalizeDropIfNecessary];
  }
}

- (void)reversePeelAnimationToPoint:(CGPoint)a3 forPlacement:(BOOL)a4 shouldShrink:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  double y = a3.y;
  double x = a3.x;
  id v11 = a6;
  double v12 = objc_opt_class();
  LODWORD(v13) = 1061997773;
  double v14 = [v12 springAnimationWithKeyPath:@"transform.scale.xy" speed:v13];
  double v15 = v14;
  v100 = v14;
  BOOL v99 = v7;
  if (v6)
  {
    [v14 setToValue:&unk_26FA2CB38];
  }
  else
  {
    double v16 = NSNumber;
    if (v7) {
      [(STKDragPreviewContainerView *)self dragViewScale];
    }
    else {
      [(STKDragPreviewContainerView *)self dragViewScaleUp];
    }
    double v17 = objc_msgSend(v16, "numberWithDouble:");
    [v15 setToValue:v17];
  }
  double v18 = [(STKDragPreviewContainerView *)self meshLayer];
  double v19 = [v18 presentationLayer];
  [v19 position];
  double v21 = v20;
  double v23 = v22;

  __int16 v24 = objc_opt_class();
  LODWORD(v25) = 1050253722;
  __int16 v26 = [v24 springAnimationWithKeyPath:@"position" speed:v25];
  double v27 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v21, v23);
  [v26 setFromValue:v27];

  __int16 v28 = (void *)MEMORY[0x263F08D40];
  [(STKDragPreviewContainerView *)self meshLayerStartPosition];
  double v29 = objc_msgSend(v28, "valueWithCGPoint:");
  [v26 setToValue:v29];

  __int16 v30 = [(STKDragPreviewContainerView *)self peelLayer];
  uint64_t v31 = [v30 presentationLayer];
  [v31 position];
  double v33 = v32;
  double v35 = v34;

  double v36 = objc_opt_class();
  LODWORD(v37) = 1050253722;
  double v38 = [v36 springAnimationWithKeyPath:@"position" speed:v37];
  uint64_t v39 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v33, v35);
  [v38 setFromValue:v39];

  uint64_t v40 = (void *)MEMORY[0x263F08D40];
  [(STKDragPreviewContainerView *)self peelLayerStartPosition];
  double v41 = objc_msgSend(v40, "valueWithCGPoint:");
  [v38 setToValue:v41];

  uint64_t v42 = [(STKDragPreviewContainerView *)self shineLayer];
  double v43 = [v42 presentationLayer];
  [v43 position];
  double v45 = v44;
  double v47 = v46;

  uint64_t v48 = objc_opt_class();
  LODWORD(v49) = 1050253722;
  double v50 = [v48 springAnimationWithKeyPath:@"position" speed:v49];
  uint64_t v51 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v45, v47);
  [v50 setFromValue:v51];

  double v52 = (void *)MEMORY[0x263F08D40];
  [(STKDragPreviewContainerView *)self shineLayerStartPosition];
  long long v53 = objc_msgSend(v52, "valueWithCGPoint:");
  [v50 setToValue:v53];

  double v54 = [(STKDragPreviewContainerView *)self shadowLayer];
  uint64_t v55 = [v54 presentationLayer];
  [v55 position];
  double v57 = v56;
  double v59 = v58;

  uint64_t v60 = objc_opt_class();
  LODWORD(v61) = 1066192077;
  long long v62 = [v60 springAnimationWithKeyPath:@"position" speed:v61];
  double v63 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v57, v59);
  [v62 setFromValue:v63];

  uint64_t v64 = (void *)MEMORY[0x263F08D40];
  [(STKDragPreviewContainerView *)self shadowLayerStartPosition];
  double v65 = objc_msgSend(v64, "valueWithCGPoint:");
  [v62 setToValue:v65];

  [v62 setBeginTime:CACurrentMediaTime() + 0.18];
  if (v6)
  {
    uint64_t v66 = [(STKDragPreviewContainerView *)self layer];
    [v66 position];
    double v68 = v67;
    double v70 = v69;

    long long v71 = objc_opt_class();
    LODWORD(v72) = 1066192077;
    uint64_t v73 = [v71 springAnimationWithKeyPath:@"position" speed:v72];
    double v74 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v68, v70);
    [v73 setFromValue:v74];

    uint64_t v75 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", x, y);
    [v73 setToValue:v75];

    uint64_t v76 = objc_opt_class();
    LODWORD(v77) = 1066192077;
    uint64_t v78 = [v76 springAnimationWithKeyPath:@"opacity" speed:v77];
    [v78 setFromValue:&unk_26FA2CB48];
    [v78 setToValue:&unk_26FA2CB58];
  }
  else
  {
    uint64_t v73 = 0;
    uint64_t v78 = 0;
  }
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setAnimationDuration:0.310000002];
  double v79 = [(STKDragPreviewContainerView *)self layer];
  [v79 addAnimation:v100 forKey:@"scaleUpAnimation"];

  long long v80 = [(STKDragPreviewContainerView *)self meshLayer];
  [v80 addAnimation:v26 forKey:@"meshAnimation"];

  double v81 = [(STKDragPreviewContainerView *)self peelLayer];
  [v81 addAnimation:v38 forKey:@"peelAnimation"];

  uint64_t v82 = [(STKDragPreviewContainerView *)self shineLayer];
  [v82 addAnimation:v50 forKey:@"shineAnimation"];

  double v83 = [(STKDragPreviewContainerView *)self shadowLayer];
  [v83 addAnimation:v62 forKey:@"shadowAnimation"];

  if (v73)
  {
    uint64_t v84 = [(STKDragPreviewContainerView *)self layer];
    [v84 addAnimation:v73 forKey:@"moveAnimation"];
  }
  if (v78)
  {
    uint64_t v85 = [(STKDragPreviewContainerView *)self layer];
    [v85 addAnimation:v78 forKey:@"opacityAnimation"];
  }
  [MEMORY[0x263F158F8] commit];
  if (v99)
  {
    dispatch_time_t v86 = dispatch_time(0, 750000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __101__STKDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke;
    block[3] = &unk_2651CC9B8;
    id v105 = v11;
    id v87 = v11;
    dispatch_after(v86, MEMORY[0x263EF83A0], block);
    double v88 = v105;
  }
  else
  {
    CGFloat v89 = *MEMORY[0x263F00148];
    CGFloat v90 = *(double *)(MEMORY[0x263F00148] + 8);
    [(STKDragPreviewContainerView *)self rasterizedImageSize];
    CGFloat v92 = v91;
    CGFloat v94 = v93;
    v106.origin.double x = v89;
    v106.origin.double y = v90;
    v106.size.width = v92;
    v106.size.height = v94;
    CGFloat v95 = x - CGRectGetWidth(v106) * 0.5;
    v107.origin.double x = v95;
    v107.origin.double y = v90;
    v107.size.width = v92;
    v107.size.height = v94;
    CGFloat Height = CGRectGetHeight(v107);
    double v97 = (void *)MEMORY[0x263F82E00];
    v103[0] = MEMORY[0x263EF8330];
    v103[1] = 3221225472;
    v103[2] = __101__STKDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_2;
    v103[3] = &unk_2651CC9E0;
    v103[4] = self;
    *(CGFloat *)&v103[5] = v95;
    *(double *)&v103[6] = y - Height * 0.5;
    *(CGFloat *)&v103[7] = v92;
    *(CGFloat *)&v103[8] = v94;
    v101[0] = MEMORY[0x263EF8330];
    v101[1] = 3221225472;
    v101[2] = __101__STKDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_3;
    v101[3] = &unk_2651CCA08;
    id v102 = v11;
    id v98 = v11;
    [v97 animateWithDuration:0 delay:v103 usingSpringWithDamping:v101 initialSpringVelocity:0.75 options:0.0 animations:0.6 completion:0.0];
    double v88 = v102;
  }
}

uint64_t __101__STKDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __101__STKDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_2(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v5[0] = *MEMORY[0x263F000D0];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v2 setTransform:v5];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return [*(id *)(a1 + 32) setAlpha:0.999];
}

uint64_t __101__STKDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_preparePreviewContainerWithPreview:(id)a3 source:(id)a4 initialTransform:(CGAffineTransform *)a5
{
  v138[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v126 = a4;
  [(STKDragPreviewContainerView *)self bounds];
  double width = v8;
  double height = v10;
  double v12 = [(STKDragPreviewContainerView *)self layer];
  [v12 anchorPoint];
  double v14 = v13;
  double v16 = v15;

  memset(&v136, 0, sizeof(v136));
  long long v17 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v135.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v135.c = v17;
  *(_OWORD *)&v135.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  CGAffineTransformScale(&v136, &v135, 1.25, 1.25);
  CGAffineTransform m = v136;
  memset(&v135, 0, sizeof(v135));
  CGAffineTransformInvert(&v135, &m);
  if ([(STKDragPreviewContainerView *)self isDropAnimation])
  {
    objc_msgSend(v7, "convertSize:fromView:", self, width, height);
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    objc_msgSend(v7, "convertPoint:fromView:", self, v14, v16);
    double v14 = v22;
    CGAffineTransform m = v135;
    v139.origin.double x = 0.0;
    v139.origin.double y = 0.0;
    v139.size.double width = v19;
    v139.size.double height = v21;
    CGRect v140 = CGRectApplyAffineTransform(v139, &m);
    double width = v140.size.width;
    double height = v140.size.height;
  }
  BOOL v23 = [(STKDragPreviewContainerView *)self isDropAnimation];
  [(STKDragPreviewContainerView *)self bounds];
  double x = v24;
  double y = v25;
  double v30 = v26;
  double v31 = v27;
  if (v23)
  {
    CGRect v141 = CGRectInset(*(CGRect *)&v24, width * 0.125, height * 0.125);
    double x = v141.origin.x;
    double y = v141.origin.y;
    double v30 = v141.size.width;
    double v31 = v141.size.height;
  }
  double v32 = [MEMORY[0x263F15908] layer];
  long long v33 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v129[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v129[3] = v33;
  v129[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  uint64_t v34 = *(void *)(MEMORY[0x263F15740] + 80);
  long long v35 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v129[0] = *MEMORY[0x263F15740];
  v129[1] = v35;
  long long v36 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  long long v132 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  long long v133 = v36;
  uint64_t v130 = v34;
  unint64_t v131 = 0xBF6B4E81C0000000;
  [v32 setSublayerTransform:v129];
  objc_msgSend(v32, "setFrame:", x, y, v30, v31);
  double v37 = [(STKDragPreviewContainerView *)self layer];
  [v37 addSublayer:v32];

  [(STKDragPreviewContainerView *)self setPerspectiveLayer:v32];
  double v38 = height * 1.1;
  double v39 = width * 1.25;
  double v124 = width;
  double v40 = v14 * width;
  double v41 = [MEMORY[0x263F157E8] layer];
  if ([(STKDragPreviewContainerView *)self isDropAnimation]) {
    double v42 = 1.2;
  }
  else {
    double v42 = 1.0;
  }
  double v43 = [(id)objc_opt_class() meshTransformWithContentScale:v42];
  [v41 setMeshTransform:v43];

  objc_msgSend(v41, "setPosition:", v40, -(height * 1.1 - height * v14));
  objc_msgSend(v41, "setBounds:", 0.0, 0.0, v39, v38 + v38 + height * 1.25);
  [v41 setRasterizationScale:2.8];
  v123 = v32;
  [v32 addSublayer:v41];
  [(STKDragPreviewContainerView *)self setMeshLayer:v41];
  [v41 position];
  -[STKDragPreviewContainerView setMeshLayerStartPosition:](self, "setMeshLayerStartPosition:");
  double v44 = [MEMORY[0x263F157E8] layer];
  objc_msgSend(v44, "setPosition:", v14 * v39, v38 + (v38 + v38 + height * 1.25) * 0.5);
  objc_msgSend(v44, "setBounds:", 0.0, 0.0, v124, height);
  [v41 addSublayer:v44];
  [(STKDragPreviewContainerView *)self setPeelLayer:v44];
  [v44 position];
  -[STKDragPreviewContainerView setPeelLayerStartPosition:](self, "setPeelLayerStartPosition:");
  [(STKDragPreviewContainerView *)self addSubview:v7];
  [(STKDragPreviewContainerView *)self setPreviewView:v7];
  double v45 = [v7 layer];
  uint64_t v46 = *MEMORY[0x263F15E18];
  [v45 setContentsGravity:*MEMORY[0x263F15E18]];
  [v44 bounds];
  double MidX = CGRectGetMidX(v142);
  [v44 bounds];
  objc_msgSend(v45, "setPosition:", MidX, CGRectGetMidY(v143));
  v137 = @"contents";
  uint64_t v48 = [MEMORY[0x263EFF9D0] null];
  v138[0] = v48;
  double v49 = [NSDictionary dictionaryWithObjects:v138 forKeys:&v137 count:1];
  [v45 setActions:v49];

  [(STKDragPreviewContainerView *)self setPeelImageLayer:v45];
  [v44 addSublayer:v45];
  double v50 = [(STKDragPreviewContainerView *)self image];

  if (v50)
  {
    uint64_t v51 = [(STKDragPreviewContainerView *)self image];
    double v52 = [(STKDragPreviewContainerView *)self peelMaskImageFromImage:v51];

    id v53 = v52;
    double v54 = [v53 CGImage];
  }
  else
  {
    uint64_t v55 = [v126 layer];
    double v56 = [v55 contents];

    if (v56)
    {
      double v57 = [v126 layer];
      double v54 = [v57 contents];

      id v58 = objc_alloc_init(MEMORY[0x263F82E00]);
      [(STKDragPreviewContainerView *)self setCurrentDropPreviewSnapshot:v58];

      [v126 frame];
      double v60 = v59;
      double v62 = v61;
      double v64 = v63;
      double v66 = v65;
      double v67 = [(STKDragPreviewContainerView *)self currentDropPreviewSnapshot];
      objc_msgSend(v67, "setFrame:", v60, v62, v64, v66);

      id v53 = [(STKDragPreviewContainerView *)self currentDropPreviewSnapshot];
      double v68 = [v53 layer];
      [v68 setContents:v54];
    }
    else
    {
      id v53 = [v126 snapshotViewAfterScreenUpdates:1];
      double v69 = [v53 layer];
      double v54 = [v69 contents];

      [(STKDragPreviewContainerView *)self setCurrentDropPreviewSnapshot:v53];
    }
  }

  v125 = v54;
  if (v54)
  {
    double v70 = [MEMORY[0x263F157E8] layer];
    [v70 setContents:v54];
    [v7 bounds];
    objc_msgSend(v70, "setFrame:");
    [v70 setContentsGravity:v46];
    [(STKDragPreviewContainerView *)self setPeelMaskLayer:v70];
    id v71 = objc_alloc_init(MEMORY[0x263F157E8]);
    [v7 frame];
    objc_msgSend(v71, "setFrame:");
    [v71 setMask:v70];
    [v44 addSublayer:v71];
    uint64_t v72 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v73 = objc_msgSend(MEMORY[0x263F827E8], "imageNamed:inBundle:compatibleWithTraitCollection:", @"StickerShine");
    [v73 size];
    double v75 = v74;
    [v71 bounds];
    CGFloat v76 = CGRectGetWidth(v144);
    double v77 = v76 + v76;
    if (v75 < v77) {
      double v75 = v77;
    }
    [MEMORY[0x263F157E8] layer];
    uint64_t v78 = v122 = v7;
    id v79 = v73;
    objc_msgSend(v78, "setContents:", objc_msgSend(v79, "CGImage"));
    [v71 bounds];
    double v80 = round(CGRectGetWidth(v145) - v75) * 0.5;
    [v79 size];
    double v82 = -v81;
    [v79 size];
    objc_msgSend(v78, "setFrame:", v80, v82, v75, v83);
    LODWORD(v84) = 1035489772;
    [v78 setOpacity:v84];
    [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D58]];
    uint64_t v85 = v121 = v45;
    [v78 setCompositingFilter:v85];

    [v71 addSublayer:v78];
    [(STKDragPreviewContainerView *)self setShineLayer:v78];
    [v78 position];
    -[STKDragPreviewContainerView setShineLayerStartPosition:](self, "setShineLayerStartPosition:");
    dispatch_time_t v86 = (void *)v72;
    id v87 = [MEMORY[0x263F827E8] imageNamed:@"StickerShadow" inBundle:v72 compatibleWithTraitCollection:0];
    [v87 size];
    double v89 = v88;
    [v71 bounds];
    CGFloat v90 = CGRectGetWidth(v146);
    double v91 = v90 + v90;
    if (v89 < v91) {
      double v89 = v91;
    }
    CGFloat v92 = [MEMORY[0x263F157E8] layer];
    id v93 = v87;
    objc_msgSend(v92, "setContents:", objc_msgSend(v93, "CGImage"));
    [v71 bounds];
    double v94 = round(CGRectGetWidth(v147) - v89) * 0.5;
    [v93 size];
    double v96 = -10.0 - v95;
    [v93 size];
    objc_msgSend(v92, "setFrame:", v94, v96, v89, v97);
    LODWORD(v98) = 1043542835;
    [v92 setOpacity:v98];
    [v71 addSublayer:v92];
    [(STKDragPreviewContainerView *)self setShadowLayer:v92];
    [v92 position];
    -[STKDragPreviewContainerView setShadowLayerStartPosition:](self, "setShadowLayerStartPosition:");

    double v45 = v121;
    double v54 = v125;

    id v7 = v122;
  }
  if ([(STKDragPreviewContainerView *)self showDebugBorders])
  {
    id v99 = [MEMORY[0x263F825C8] blueColor];
    objc_msgSend(v41, "setBorderColor:", objc_msgSend(v99, "CGColor"));

    [v41 setBorderWidth:1.0];
    id v100 = [MEMORY[0x263F825C8] redColor];
    uint64_t v101 = [v100 CGColor];
    [(STKDragPreviewContainerView *)self layer];
    v103 = id v102 = v45;
    [v103 setBorderColor:v101];

    double v45 = v102;
    v104 = [(STKDragPreviewContainerView *)self layer];
    [v104 setBorderWidth:1.0];

    id v105 = [MEMORY[0x263F825C8] greenColor];
    objc_msgSend(v44, "setBorderColor:", objc_msgSend(v105, "CGColor"));

    [v44 setBorderWidth:1.0];
    id v106 = [MEMORY[0x263F825C8] yellowColor];
    objc_msgSend(v123, "setBorderColor:", objc_msgSend(v106, "CGColor"));

    [v123 setBorderWidth:1.0];
    double v54 = v125;
    id v107 = [MEMORY[0x263F825C8] systemPurpleColor];
    objc_msgSend(v102, "setBorderColor:", objc_msgSend(v107, "CGColor"));

    [v102 setBorderWidth:1.0];
  }
  if ([(STKDragPreviewContainerView *)self isDropAnimation])
  {
    double v108 = -(height * 1.1);
    CGAffineTransform m = v135;
    CATransform3DMakeAffineTransform(&v128, &m);
    CATransform3D v127 = v128;
    [v123 setTransform:&v127];
    [v41 position];
    double v110 = v109;
    [v41 position];
    objc_msgSend(v41, "setPosition:", v110, v111 + v38 * 2.0);
    [v44 position];
    double v113 = v112;
    [v44 position];
    objc_msgSend(v44, "setPosition:", v113, v114 + v108 * 2.0);
    [(CALayer *)self->_shineLayer position];
    double v116 = v115;
    [(CALayer *)self->_shineLayer position];
    -[CALayer setPosition:](self->_shineLayer, "setPosition:", v116, v117 + 135.0);
    [(CALayer *)self->_shadowLayer position];
    double v119 = v118;
    [(CALayer *)self->_shadowLayer position];
    -[CALayer setPosition:](self->_shadowLayer, "setPosition:", v119, v120 + 130.0);
  }
}

- (BOOL)showDebugBorders
{
  return MEMORY[0x270F3CD18](@"com.apple.Messages", @"showStickerDragDebugBorders");
}

- (void)_animateLiftAlongsideAnimator:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__STKDragPreviewContainerView__animateLiftAlongsideAnimator_completion___block_invoke;
  v8[3] = &unk_2651CCA30;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 addAnimations:v8];
}

void __72__STKDragPreviewContainerView__animateLiftAlongsideAnimator_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) center];
  objc_msgSend(*(id *)(a1 + 32), "setOriginalCenter:");
  [*(id *)(a1 + 32) bounds];
  double v3 = v2 * 1.1 + v2 * 1.1;
  double v4 = objc_opt_class();
  LODWORD(v5) = 1050253722;
  id v6 = [v4 springAnimationWithKeyPath:@"position" speed:v5];
  id v7 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", 0.0, v3);
  [v6 setByValue:v7];

  [v6 setBeginTime:CACurrentMediaTime() + -0.31];
  double v8 = objc_opt_class();
  LODWORD(v9) = 1050253722;
  double v10 = [v8 springAnimationWithKeyPath:@"position" speed:v9];
  id v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", 0.0, -v3);
  [v10 setByValue:v11];

  [v10 setBeginTime:CACurrentMediaTime() + -0.31];
  double v12 = objc_opt_class();
  LODWORD(v13) = 1053609165;
  double v14 = [v12 springAnimationWithKeyPath:@"position" speed:v13];
  double v15 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", 0.0, 135.0);
  [v14 setByValue:v15];

  [v14 setBeginTime:CACurrentMediaTime() + -0.12];
  double v16 = objc_opt_class();
  LODWORD(v17) = 1061997773;
  double v18 = [v16 springAnimationWithKeyPath:@"position" speed:v17];
  CGFloat v19 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", 0.0, 130.0);
  [v18 setByValue:v19];

  [v18 setBeginTime:CACurrentMediaTime() + 0.1];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setAnimationDuration:0.310000002];
  double v20 = [*(id *)(a1 + 32) meshLayer];
  [v20 addAnimation:v6 forKey:@"meshAnimation"];

  CGFloat v21 = [*(id *)(a1 + 32) peelLayer];
  [v21 addAnimation:v10 forKey:@"peelAnimation"];

  double v22 = [*(id *)(a1 + 32) shineLayer];
  [v22 addAnimation:v14 forKey:@"shineAnimation"];

  BOOL v23 = [*(id *)(a1 + 32) shadowLayer];
  [v23 addAnimation:v18 forKey:@"shadowAnimation"];

  [MEMORY[0x263F158F8] commit];
  dispatch_time_t v24 = dispatch_time(0, 910000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__STKDragPreviewContainerView__animateLiftAlongsideAnimator_completion___block_invoke_2;
  block[3] = &unk_2651CC9B8;
  id v26 = *(id *)(a1 + 40);
  dispatch_after(v24, MEMORY[0x263EF83A0], block);
}

uint64_t __72__STKDragPreviewContainerView__animateLiftAlongsideAnimator_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_animateLiftCancellationAlongsideAnimator:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __84__STKDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke;
    v15[3] = &unk_2651CCA30;
    v15[4] = self;
    id v16 = v6;
    [a3 addAnimations:v15];
    double v8 = v16;
  }
  else
  {
    [(STKDragPreviewContainerView *)self originalCenter];
    double v10 = v9;
    double v12 = v11;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __84__STKDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke_3;
    v13[3] = &unk_2651CC9B8;
    id v14 = v7;
    -[STKDragPreviewContainerView reversePeelAnimationToPoint:forPlacement:shouldShrink:completionBlock:](self, "reversePeelAnimationToPoint:forPlacement:shouldShrink:completionBlock:", 0, 0, v13, v10, v12);
    double v8 = v14;
  }
}

void __84__STKDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  [v2 originalCenter];
  double v4 = v3;
  double v6 = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__STKDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke_2;
  v7[3] = &unk_2651CC9B8;
  id v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "reversePeelAnimationToPoint:forPlacement:shouldShrink:completionBlock:", 0, 0, v7, v4, v6);
}

uint64_t __84__STKDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __84__STKDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_animateDropAlongsideAnimator:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    double v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_2451E4000, v8, OS_LOG_TYPE_DEFAULT, "<STKDragPreviewContainerView: %p> _animateDropAlongsideAnimator animator: %@", buf, 0x16u);
  }

  [(STKDragPreviewContainerView *)self setFinalUIKitDropCompletion:v7];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__STKDragPreviewContainerView__animateDropAlongsideAnimator_completion___block_invoke;
  v9[3] = &unk_2651CCA58;
  v9[4] = self;
  [v6 addAnimations:v9];
}

uint64_t __72__STKDragPreviewContainerView__animateDropAlongsideAnimator_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  double v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = v3;
    _os_log_impl(&dword_2451E4000, v2, OS_LOG_TYPE_DEFAULT, "<STKDragPreviewContainerView: %p> _animateDropAlongsideAnimator animator callback.", buf, 0xCu);
  }

  double v4 = *(void **)(a1 + 32);
  [v4 center];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__STKDragPreviewContainerView__animateDropAlongsideAnimator_completion___block_invoke_83;
  v6[3] = &unk_2651CCA58;
  v6[4] = *(void *)(a1 + 32);
  return objc_msgSend(v4, "reversePeelAnimationToPoint:forPlacement:shouldShrink:completionBlock:", 1, 0, v6);
}

uint64_t __72__STKDragPreviewContainerView__animateDropAlongsideAnimator_completion___block_invoke_83(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  double v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2451E4000, v2, OS_LOG_TYPE_DEFAULT, "<STKDragPreviewContainerView: %p> _animateDropAlongsideAnimator reversePeelAnimationToPoint callback", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) setDropAnimationIsComplete:1];
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (BOOL)useEmojiKeyboardMeshTransform
{
  return self->_useEmojiKeyboardMeshTransform;
}

- (void)setUseEmojiKeyboardMeshTransform:(BOOL)a3
{
  self->_useEmojiKeyboardMeshTransforCGAffineTransform m = a3;
}

- (BOOL)isDropAnimation
{
  return self->_isDropAnimation;
}

- (void)setIsDropAnimation:(BOOL)a3
{
  self->_isDropAnimation = a3;
}

- (BOOL)dropAnimationIsComplete
{
  return self->_dropAnimationIsComplete;
}

- (id)clientDropCompletion
{
  return self->_clientDropCompletion;
}

- (void)setClientDropCompletion:(id)a3
{
}

- (id)finalUIKitDropCompletion
{
  return self->_finalUIKitDropCompletion;
}

- (void)setFinalUIKitDropCompletion:(id)a3
{
}

- (UIView)currentDropPreviewSnapshot
{
  return self->_currentDropPreviewSnapshot;
}

- (void)setCurrentDropPreviewSnapshot:(id)a3
{
}

- (CALayer)shineLayer
{
  return self->_shineLayer;
}

- (void)setShineLayer:(id)a3
{
}

- (CALayer)shadowLayer
{
  return self->_shadowLayer;
}

- (void)setShadowLayer:(id)a3
{
}

- (CALayer)dropShadowLayer
{
  return self->_dropShadowLayer;
}

- (void)setDropShadowLayer:(id)a3
{
}

- (CALayer)peelLayer
{
  return self->_peelLayer;
}

- (void)setPeelLayer:(id)a3
{
}

- (CALayer)meshLayer
{
  return self->_meshLayer;
}

- (void)setMeshLayer:(id)a3
{
}

- (CALayer)perspectiveLayer
{
  return self->_perspectiveLayer;
}

- (void)setPerspectiveLayer:(id)a3
{
}

- (CALayer)peelImageLayer
{
  return self->_peelImageLayer;
}

- (void)setPeelImageLayer:(id)a3
{
}

- (CALayer)peelMaskLayer
{
  return self->_peelMaskLayer;
}

- (void)setPeelMaskLayer:(id)a3
{
}

- (CGPoint)originalCenter
{
  double x = self->_originalCenter.x;
  double y = self->_originalCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOriginalCenter:(CGPoint)a3
{
  self->_originalCenter = a3;
}

- (UIView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
}

- (CGPoint)meshLayerStartPosition
{
  double x = self->_meshLayerStartPosition.x;
  double y = self->_meshLayerStartPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMeshLayerStartPosition:(CGPoint)a3
{
  self->_meshLayerStartPosition = a3;
}

- (CGPoint)peelLayerStartPosition
{
  double x = self->_peelLayerStartPosition.x;
  double y = self->_peelLayerStartPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPeelLayerStartPosition:(CGPoint)a3
{
  self->_peelLayerStartPosition = a3;
}

- (CGPoint)shineLayerStartPosition
{
  double x = self->_shineLayerStartPosition.x;
  double y = self->_shineLayerStartPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setShineLayerStartPosition:(CGPoint)a3
{
  self->_shineLayerStartPosition = a3;
}

- (CGPoint)shadowLayerStartPosition
{
  double x = self->_shadowLayerStartPosition.x;
  double y = self->_shadowLayerStartPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setShadowLayerStartPosition:(CGPoint)a3
{
  self->_shadowLayerStartPosition = a3;
}

- (CGPoint)dropShadowLayerStartPosition
{
  double x = self->_dropShadowLayerStartPosition.x;
  double y = self->_dropShadowLayerStartPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDropShadowLayerStartPosition:(CGPoint)a3
{
  self->_dropShadowLayerStartPosition = a3;
}

- (BOOL)defersFinalDropAnimationCompletion
{
  return self->_defersFinalDropAnimationCompletion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_peelMaskLayer, 0);
  objc_storeStrong((id *)&self->_peelImageLayer, 0);
  objc_storeStrong((id *)&self->_perspectiveLayer, 0);
  objc_storeStrong((id *)&self->_meshLayer, 0);
  objc_storeStrong((id *)&self->_peelLayer, 0);
  objc_storeStrong((id *)&self->_dropShadowLayer, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_shineLayer, 0);
  objc_storeStrong((id *)&self->_currentDropPreviewSnapshot, 0);
  objc_storeStrong(&self->_finalUIKitDropCompletion, 0);
  objc_storeStrong(&self->_clientDropCompletion, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end