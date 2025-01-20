@interface _MSStickerDragPreviewContainerView
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
- (UIImage)image;
- (UIView)currentDropPreviewSnapshot;
- (UIView)previewView;
- (_MSStickerDragPreviewContainerView)initWithIsDropAnimation:(BOOL)a3;
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

@implementation _MSStickerDragPreviewContainerView

- (_MSStickerDragPreviewContainerView)initWithIsDropAnimation:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_MSStickerDragPreviewContainerView;
  v4 = -[_MSStickerDragPreviewContainerView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_isDropAnimation = a3;
    [(_MSStickerDragPreviewContainerView *)v4 setClipsToBounds:0];
  }
  return v5;
}

+ (id)meshTransformWithContentScale:(double)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68___MSStickerDragPreviewContainerView_meshTransformWithContentScale___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  *(double *)&block[4] = a3;
  if (meshTransformWithContentScale__onceToken != -1) {
    dispatch_once(&meshTransformWithContentScale__onceToken, block);
  }
  v3 = (void *)meshTransformWithContentScale____mesh;

  return v3;
}

+ (id)springAnimationWithKeyPath:(id)a3 speed:(float)a4
{
  v5 = [MEMORY[0x1E4F39C90] animationWithKeyPath:a3];
  [v5 setMass:2.0];
  [v5 setStiffness:300.0];
  [v5 setDamping:400.0];
  *(float *)&double v6 = a4;
  [v5 setSpeed:v6];
  [v5 setDuration:0.91];
  id v7 = objc_alloc(MEMORY[0x1E4F39C10]);
  LODWORD(v8) = 1041212815;
  LODWORD(v9) = 999867313;
  LODWORD(v10) = 1058228603;
  LODWORD(v11) = 1064805775;
  v12 = (void *)[v7 initWithControlPoints:v8 :v9 :v10 :v11];
  [v5 setTimingFunction:v12];

  [v5 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v5 setRemovedOnCompletion:0];

  return v5;
}

+ (id)shadowPropertiesForDrag
{
  v2 = (objc_class *)MEMORY[0x1E4E865C0](@"_UIDragPreviewShadowProperties", @"UIKit");
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
  [(_MSStickerDragPreviewContainerView *)self bounds];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (CGSize)rasterizedImageSize
{
  [(_MSStickerDragPreviewContainerView *)self bounds];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)peelMaskImageFromImage:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v5 = a3;
  [v5 size];
  double v7 = v6;
  double v9 = v8;
  double v10 = [MEMORY[0x1E4F42D90] mainScreen];
  [v10 scale];
  CGFloat v12 = v11;
  v17.width = v7;
  v17.height = v9;
  UIGraphicsBeginImageContextWithOptions(v17, 0, v12);

  v13 = [MEMORY[0x1E4F428B8] blackColor];
  [v13 setFill];

  v18.origin.x = v3;
  v18.origin.y = v4;
  v18.size.width = v7;
  v18.size.height = v9;
  UIRectFillUsingBlendMode(v18, kCGBlendModeCopy);
  objc_msgSend(v5, "drawInRect:blendMode:alpha:", 22, v3, v4, v7, v9, 1.0);

  v14 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v14;
}

- (double)dragViewScaleUp
{
  [(_MSStickerDragPreviewContainerView *)self rasterizedImageSize];
  double v4 = v3;
  [(_MSStickerDragPreviewContainerView *)self initialSize];
  if (v4 < v5
    || ([(_MSStickerDragPreviewContainerView *)self rasterizedImageSize],
        double v7 = v6,
        [(_MSStickerDragPreviewContainerView *)self initialSize],
        double result = 1.0,
        v7 < v9))
  {
    [(_MSStickerDragPreviewContainerView *)self rasterizedImageSize];
    double v11 = v10;
    [(_MSStickerDragPreviewContainerView *)self rasterizedImageSize];
    double v13 = v12;
    [(_MSStickerDragPreviewContainerView *)self initialSize];
    double v15 = v14;
    double v17 = v16;
    [(_MSStickerDragPreviewContainerView *)self rasterizedImageSize];
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
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([(_MSStickerDragPreviewContainerView *)self dropAnimationIsComplete])
  {
    double v3 = [(_MSStickerDragPreviewContainerView *)self clientDropCompletion];
    if (v3)
    {

LABEL_14:
      double v11 = ms_defaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        if ([(_MSStickerDragPreviewContainerView *)self dropAnimationIsComplete]) {
          double v12 = @"YES";
        }
        else {
          double v12 = @"NO";
        }
        double v13 = [(_MSStickerDragPreviewContainerView *)self clientDropCompletion];
        double v14 = _Block_copy(v13);
        if ([(_MSStickerDragPreviewContainerView *)self defersFinalDropAnimationCompletion])
        {
          double v15 = @"YES";
        }
        else
        {
          double v15 = @"NO";
        }
        double v16 = [(_MSStickerDragPreviewContainerView *)self finalUIKitDropCompletion];
        double v17 = _Block_copy(v16);
        int v22 = 134219010;
        v23 = self;
        __int16 v24 = 2112;
        v25 = v12;
        __int16 v26 = 2112;
        v27 = v14;
        __int16 v28 = 2112;
        v29 = v15;
        __int16 v30 = 2112;
        v31 = v17;
        _os_log_impl(&dword_1E4A76000, v11, OS_LOG_TYPE_DEFAULT, "<_MSStickerDragPreviewContainerView: %p> finalizeDropIfNecessary finalizing drop. dropAnimationIsComplete: %@, clientDropCompletion: %@, defersFinalDropAnimationCompletion: %@, finalUIKitDropCompletion: %@", (uint8_t *)&v22, 0x34u);
      }
      double v18 = [(_MSStickerDragPreviewContainerView *)self clientDropCompletion];

      if (v18)
      {
        double v19 = [(_MSStickerDragPreviewContainerView *)self clientDropCompletion];
        v19[2]();

        [(_MSStickerDragPreviewContainerView *)self setClientDropCompletion:0];
      }
      v20 = [(_MSStickerDragPreviewContainerView *)self finalUIKitDropCompletion];

      if (v20)
      {
        v21 = [(_MSStickerDragPreviewContainerView *)self finalUIKitDropCompletion];
        v21[2]();

        [(_MSStickerDragPreviewContainerView *)self setFinalUIKitDropCompletion:0];
      }
      return;
    }
    if (![(_MSStickerDragPreviewContainerView *)self defersFinalDropAnimationCompletion])goto LABEL_14; {
  }
    }
  double v4 = ms_defaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if ([(_MSStickerDragPreviewContainerView *)self dropAnimationIsComplete]) {
      double v5 = @"YES";
    }
    else {
      double v5 = @"NO";
    }
    double v6 = [(_MSStickerDragPreviewContainerView *)self clientDropCompletion];
    double v7 = _Block_copy(v6);
    if ([(_MSStickerDragPreviewContainerView *)self defersFinalDropAnimationCompletion])
    {
      double v8 = @"YES";
    }
    else
    {
      double v8 = @"NO";
    }
    double v9 = [(_MSStickerDragPreviewContainerView *)self finalUIKitDropCompletion];
    double v10 = _Block_copy(v9);
    int v22 = 134219010;
    v23 = self;
    __int16 v24 = 2112;
    v25 = v5;
    __int16 v26 = 2112;
    v27 = v7;
    __int16 v28 = 2112;
    v29 = v8;
    __int16 v30 = 2112;
    v31 = v10;
    _os_log_impl(&dword_1E4A76000, v4, OS_LOG_TYPE_DEFAULT, "<_MSStickerDragPreviewContainerView: %p> finalizeDropIfNecessary not finalizing yet. dropAnimationIsComplete: %@, clientDropCompletion: %@, defersFinalDropAnimationCompletion: %@, finalUIKitDropCompletion: %@", (uint8_t *)&v22, 0x34u);
  }
}

- (void)performAfterDropAnimation:(id)a3
{
  [(_MSStickerDragPreviewContainerView *)self setClientDropCompletion:a3];

  [(_MSStickerDragPreviewContainerView *)self finalizeDropIfNecessary];
}

- (void)setDefersFinalDropAnimationCompletion:(BOOL)a3
{
  if (self->_defersFinalDropAnimationCompletion != a3)
  {
    self->_defersFinalDropAnimationCompletion = a3;
    [(_MSStickerDragPreviewContainerView *)self finalizeDropIfNecessary];
  }
}

- (void)setDropAnimationIsComplete:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_dropAnimationIsComplete != a3)
  {
    BOOL v3 = a3;
    double v5 = ms_defaultLog();
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
      _os_log_impl(&dword_1E4A76000, v5, OS_LOG_TYPE_DEFAULT, "<_MSStickerDragPreviewContainerView: %p> setDropAnimationIsComplete: %@", (uint8_t *)&v7, 0x16u);
    }

    self->_dropAnimationIsComplete = v3;
    [(_MSStickerDragPreviewContainerView *)self finalizeDropIfNecessary];
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
    [v14 setToValue:&unk_1F406F190];
  }
  else
  {
    double v16 = NSNumber;
    if (v7) {
      [(_MSStickerDragPreviewContainerView *)self dragViewScale];
    }
    else {
      [(_MSStickerDragPreviewContainerView *)self dragViewScaleUp];
    }
    double v17 = objc_msgSend(v16, "numberWithDouble:");
    [v15 setToValue:v17];
  }
  double v18 = [(_MSStickerDragPreviewContainerView *)self meshLayer];
  double v19 = [v18 presentationLayer];
  [v19 position];
  double v21 = v20;
  double v23 = v22;

  __int16 v24 = objc_opt_class();
  LODWORD(v25) = 1050253722;
  __int16 v26 = [v24 springAnimationWithKeyPath:@"position" speed:v25];
  v27 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v21, v23);
  [v26 setFromValue:v27];

  __int16 v28 = (void *)MEMORY[0x1E4F29238];
  [(_MSStickerDragPreviewContainerView *)self meshLayerStartPosition];
  v29 = objc_msgSend(v28, "valueWithCGPoint:");
  [v26 setToValue:v29];

  __int16 v30 = [(_MSStickerDragPreviewContainerView *)self peelLayer];
  v31 = [v30 presentationLayer];
  [v31 position];
  double v33 = v32;
  double v35 = v34;

  v36 = objc_opt_class();
  LODWORD(v37) = 1050253722;
  v38 = [v36 springAnimationWithKeyPath:@"position" speed:v37];
  v39 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v33, v35);
  [v38 setFromValue:v39];

  v40 = (void *)MEMORY[0x1E4F29238];
  [(_MSStickerDragPreviewContainerView *)self peelLayerStartPosition];
  v41 = objc_msgSend(v40, "valueWithCGPoint:");
  [v38 setToValue:v41];

  v42 = [(_MSStickerDragPreviewContainerView *)self shineLayer];
  v43 = [v42 presentationLayer];
  [v43 position];
  double v45 = v44;
  double v47 = v46;

  v48 = objc_opt_class();
  LODWORD(v49) = 1050253722;
  v50 = [v48 springAnimationWithKeyPath:@"position" speed:v49];
  v51 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v45, v47);
  [v50 setFromValue:v51];

  v52 = (void *)MEMORY[0x1E4F29238];
  [(_MSStickerDragPreviewContainerView *)self shineLayerStartPosition];
  v53 = objc_msgSend(v52, "valueWithCGPoint:");
  [v50 setToValue:v53];

  v54 = [(_MSStickerDragPreviewContainerView *)self shadowLayer];
  v55 = [v54 presentationLayer];
  [v55 position];
  double v57 = v56;
  double v59 = v58;

  v60 = objc_opt_class();
  LODWORD(v61) = 1066192077;
  v62 = [v60 springAnimationWithKeyPath:@"position" speed:v61];
  v63 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v57, v59);
  [v62 setFromValue:v63];

  v64 = (void *)MEMORY[0x1E4F29238];
  [(_MSStickerDragPreviewContainerView *)self shadowLayerStartPosition];
  v65 = objc_msgSend(v64, "valueWithCGPoint:");
  [v62 setToValue:v65];

  [v62 setBeginTime:CACurrentMediaTime() + 0.18];
  if (v6)
  {
    v66 = [(_MSStickerDragPreviewContainerView *)self layer];
    [v66 position];
    double v68 = v67;
    double v70 = v69;

    v71 = objc_opt_class();
    LODWORD(v72) = 1066192077;
    v73 = [v71 springAnimationWithKeyPath:@"position" speed:v72];
    v74 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v68, v70);
    [v73 setFromValue:v74];

    v75 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", x, y);
    [v73 setToValue:v75];

    v76 = objc_opt_class();
    LODWORD(v77) = 1066192077;
    v78 = [v76 springAnimationWithKeyPath:@"opacity" speed:v77];
    [v78 setFromValue:&unk_1F406F1A0];
    [v78 setToValue:&unk_1F406F1B0];
  }
  else
  {
    v73 = 0;
    v78 = 0;
  }
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.310000002];
  v79 = [(_MSStickerDragPreviewContainerView *)self layer];
  [v79 addAnimation:v100 forKey:@"scaleUpAnimation"];

  v80 = [(_MSStickerDragPreviewContainerView *)self meshLayer];
  [v80 addAnimation:v26 forKey:@"meshAnimation"];

  v81 = [(_MSStickerDragPreviewContainerView *)self peelLayer];
  [v81 addAnimation:v38 forKey:@"peelAnimation"];

  v82 = [(_MSStickerDragPreviewContainerView *)self shineLayer];
  [v82 addAnimation:v50 forKey:@"shineAnimation"];

  v83 = [(_MSStickerDragPreviewContainerView *)self shadowLayer];
  [v83 addAnimation:v62 forKey:@"shadowAnimation"];

  if (v73)
  {
    v84 = [(_MSStickerDragPreviewContainerView *)self layer];
    [v84 addAnimation:v73 forKey:@"moveAnimation"];
  }
  if (v78)
  {
    v85 = [(_MSStickerDragPreviewContainerView *)self layer];
    [v85 addAnimation:v78 forKey:@"opacityAnimation"];
  }
  [MEMORY[0x1E4F39CF8] commit];
  if (v99)
  {
    dispatch_time_t v86 = dispatch_time(0, 750000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __108___MSStickerDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke;
    block[3] = &unk_1E6E98A40;
    id v105 = v11;
    id v87 = v11;
    dispatch_after(v86, MEMORY[0x1E4F14428], block);
    v88 = v105;
  }
  else
  {
    CGFloat v89 = *MEMORY[0x1E4F1DAD8];
    CGFloat v90 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [(_MSStickerDragPreviewContainerView *)self rasterizedImageSize];
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
    v97 = (void *)MEMORY[0x1E4F42FF0];
    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = __108___MSStickerDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_2;
    v103[3] = &unk_1E6E98CF8;
    v103[4] = self;
    *(CGFloat *)&v103[5] = v95;
    *(double *)&v103[6] = y - Height * 0.5;
    *(CGFloat *)&v103[7] = v92;
    *(CGFloat *)&v103[8] = v94;
    v101[0] = MEMORY[0x1E4F143A8];
    v101[1] = 3221225472;
    v101[2] = __108___MSStickerDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_3;
    v101[3] = &unk_1E6E98980;
    id v102 = v11;
    id v98 = v11;
    [v97 animateWithDuration:0 delay:v103 usingSpringWithDamping:v101 initialSpringVelocity:0.75 options:0.0 animations:0.6 completion:0.0];
    v88 = v102;
  }
}

- (void)_preparePreviewContainerWithPreview:(id)a3 source:(id)a4 initialTransform:(CGAffineTransform *)a5
{
  v151[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v130 = a4;
  [(_MSStickerDragPreviewContainerView *)self bounds];
  double width = v8;
  double height = v10;
  double v12 = [(_MSStickerDragPreviewContainerView *)self layer];
  [v12 anchorPoint];
  double v14 = v13;
  double v16 = v15;

  memset(&v149, 0, sizeof(v149));
  long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v148.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v148.c = v17;
  *(_OWORD *)&v148.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformScale(&v149, &v148, 1.25, 1.25);
  CGAffineTransform m = v149;
  memset(&v148, 0, sizeof(v148));
  CGAffineTransformInvert(&v148, &m);
  if ([(_MSStickerDragPreviewContainerView *)self isDropAnimation])
  {
    objc_msgSend(v7, "convertSize:fromView:", self, width, height);
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    objc_msgSend(v7, "convertPoint:fromView:", self, v14, v16);
    double v14 = v22;
    CGAffineTransform m = v148;
    v152.origin.double x = 0.0;
    v152.origin.double y = 0.0;
    v152.size.double width = v19;
    v152.size.double height = v21;
    CGRect v153 = CGRectApplyAffineTransform(v152, &m);
    double width = v153.size.width;
    double height = v153.size.height;
  }
  BOOL v23 = [(_MSStickerDragPreviewContainerView *)self isDropAnimation];
  [(_MSStickerDragPreviewContainerView *)self bounds];
  double x = v24;
  double y = v25;
  double v30 = v26;
  double v31 = v27;
  if (v23)
  {
    CGRect v154 = CGRectInset(*(CGRect *)&v24, width * 0.125, height * 0.125);
    double x = v154.origin.x;
    double y = v154.origin.y;
    double v30 = v154.size.width;
    double v31 = v154.size.height;
  }
  double v32 = [MEMORY[0x1E4F39D10] layer];
  long long v33 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v142[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v142[3] = v33;
  v142[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  uint64_t v34 = *(void *)(MEMORY[0x1E4F39B10] + 80);
  long long v35 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v142[0] = *MEMORY[0x1E4F39B10];
  v142[1] = v35;
  long long v36 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  long long v145 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v146 = v36;
  uint64_t v143 = v34;
  unint64_t v144 = 0xBF6B4E81C0000000;
  [v32 setSublayerTransform:v142];
  objc_msgSend(v32, "setFrame:", x, y, v30, v31);
  double v37 = [(_MSStickerDragPreviewContainerView *)self layer];
  [v37 addSublayer:v32];

  [(_MSStickerDragPreviewContainerView *)self setPerspectiveLayer:v32];
  double v128 = width;
  double v38 = height * 1.1;
  double v39 = width * 1.25;
  double v40 = v14 * width;
  v41 = [MEMORY[0x1E4F39BE8] layer];
  if ([(_MSStickerDragPreviewContainerView *)self isDropAnimation]) {
    double v42 = 1.2;
  }
  else {
    double v42 = 1.0;
  }
  v43 = [(id)objc_opt_class() meshTransformWithContentScale:v42];
  [v41 setMeshTransform:v43];

  objc_msgSend(v41, "setPosition:", v40, -(height * 1.1 - height * v14));
  objc_msgSend(v41, "setBounds:", 0.0, 0.0, v39, v38 + v38 + height * 1.25);
  [v41 setRasterizationScale:2.8];
  [v32 addSublayer:v41];
  [(_MSStickerDragPreviewContainerView *)self setMeshLayer:v41];
  [v41 position];
  -[_MSStickerDragPreviewContainerView setMeshLayerStartPosition:](self, "setMeshLayerStartPosition:");
  double v44 = [MEMORY[0x1E4F39BE8] layer];
  objc_msgSend(v44, "setPosition:", v14 * v39, v38 + (v38 + v38 + height * 1.25) * 0.5);
  objc_msgSend(v44, "setBounds:", 0.0, 0.0, v128, height);
  [v41 addSublayer:v44];
  [(_MSStickerDragPreviewContainerView *)self setPeelLayer:v44];
  [v44 position];
  -[_MSStickerDragPreviewContainerView setPeelLayerStartPosition:](self, "setPeelLayerStartPosition:");
  [(_MSStickerDragPreviewContainerView *)self addSubview:v7];
  [(_MSStickerDragPreviewContainerView *)self setPreviewView:v7];
  double v45 = [v7 layer];
  uint64_t v46 = *MEMORY[0x1E4F3A3D8];
  [v45 setContentsGravity:*MEMORY[0x1E4F3A3D8]];
  [v44 bounds];
  double MidX = CGRectGetMidX(v155);
  [v44 bounds];
  objc_msgSend(v45, "setPosition:", MidX, CGRectGetMidY(v156));
  v150 = @"contents";
  v48 = [MEMORY[0x1E4F1CA98] null];
  v151[0] = v48;
  double v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v151 forKeys:&v150 count:1];
  [v45 setActions:v49];

  [(_MSStickerDragPreviewContainerView *)self setPeelImageLayer:v45];
  [v44 addSublayer:v45];
  v50 = [(_MSStickerDragPreviewContainerView *)self image];

  if (v50)
  {
    v51 = [(_MSStickerDragPreviewContainerView *)self image];
    v52 = [(_MSStickerDragPreviewContainerView *)self peelMaskImageFromImage:v51];

    id v53 = v52;
    v54 = [v53 CGImage];
  }
  else
  {
    v55 = [v130 layer];
    double v56 = [v55 contents];

    if (v56)
    {
      double v57 = [v130 layer];
      uint64_t v58 = [v57 contents];

      id v59 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
      [(_MSStickerDragPreviewContainerView *)self setCurrentDropPreviewSnapshot:v59];

      [v130 frame];
      double v61 = v60;
      double v63 = v62;
      double v65 = v64;
      double v67 = v66;
      double v68 = [(_MSStickerDragPreviewContainerView *)self currentDropPreviewSnapshot];
      objc_msgSend(v68, "setFrame:", v61, v63, v65, v67);

      id v53 = [(_MSStickerDragPreviewContainerView *)self currentDropPreviewSnapshot];
      double v69 = [v53 layer];
      [v69 setContents:v58];

      v54 = (void *)v58;
    }
    else
    {
      id v53 = [v130 snapshotViewAfterScreenUpdates:1];
      double v70 = [v53 layer];
      uint64_t v71 = [v70 contents];

      v54 = (void *)v71;
      [(_MSStickerDragPreviewContainerView *)self setCurrentDropPreviewSnapshot:v53];
    }
  }

  if (v54)
  {
    v129 = v32;
    double v72 = [MEMORY[0x1E4F39BE8] layer];
    [v72 setContents:v54];
    [v7 bounds];
    objc_msgSend(v72, "setFrame:");
    [v72 setContentsGravity:v46];
    [(_MSStickerDragPreviewContainerView *)self setPeelMaskLayer:v72];
    id v73 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    [v45 bounds];
    objc_msgSend(v73, "setBounds:");
    [v45 position];
    objc_msgSend(v73, "setPosition:");
    v126 = v54;
    id v127 = v7;
    if (v45)
    {
      [v45 transform];
    }
    else
    {
      long long v140 = 0u;
      long long v141 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      long long v134 = 0u;
      long long v135 = 0u;
    }
    v133[4] = v138;
    v133[5] = v139;
    v133[6] = v140;
    v133[7] = v141;
    v133[0] = v134;
    v133[1] = v135;
    v133[2] = v136;
    v133[3] = v137;
    [v73 setTransform:v133];
    [v73 setMask:v72];
    [v44 addSublayer:v73];
    uint64_t v74 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v125 = (void *)v74;
    v75 = [MEMORY[0x1E4F42A80] imageNamed:@"StickerShine" inBundle:v74 compatibleWithTraitCollection:0];
    [v75 size];
    double v77 = v76;
    [v73 bounds];
    CGFloat v78 = CGRectGetWidth(v157);
    double v79 = v78 + v78;
    if (v77 < v79) {
      double v77 = v79;
    }
    v80 = [MEMORY[0x1E4F39BE8] layer];
    id v81 = v75;
    objc_msgSend(v80, "setContents:", objc_msgSend(v81, "CGImage"));
    [v73 bounds];
    double v82 = round(CGRectGetWidth(v158) - v77) * 0.5;
    [v81 size];
    double v84 = -v83;
    [v81 size];
    objc_msgSend(v80, "setFrame:", v82, v84, v77, v85);
    LODWORD(v86) = 1035489772;
    [v80 setOpacity:v86];
    id v87 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
    [v80 setCompositingFilter:v87];

    [v73 addSublayer:v80];
    [(_MSStickerDragPreviewContainerView *)self setShineLayer:v80];
    [v80 position];
    -[_MSStickerDragPreviewContainerView setShineLayerStartPosition:](self, "setShineLayerStartPosition:");
    v88 = [MEMORY[0x1E4F42A80] imageNamed:@"StickerShadow" inBundle:v74 compatibleWithTraitCollection:0];
    [v88 size];
    double v90 = v89;
    [v73 bounds];
    CGFloat v91 = CGRectGetWidth(v159);
    double v92 = v91 + v91;
    if (v90 < v92) {
      double v90 = v92;
    }
    double v93 = [MEMORY[0x1E4F39BE8] layer];
    id v94 = v88;
    objc_msgSend(v93, "setContents:", objc_msgSend(v94, "CGImage"));
    [v73 bounds];
    double v95 = round(CGRectGetWidth(v160) - v90) * 0.5;
    [v94 size];
    double v97 = -10.0 - v96;
    [v94 size];
    objc_msgSend(v93, "setFrame:", v95, v97, v90, v98);
    LODWORD(v99) = 1043542835;
    [v93 setOpacity:v99];
    [v73 addSublayer:v93];
    [(_MSStickerDragPreviewContainerView *)self setShadowLayer:v93];
    [v93 position];
    -[_MSStickerDragPreviewContainerView setShadowLayerStartPosition:](self, "setShadowLayerStartPosition:");

    v54 = v126;
    id v7 = v127;
    double v32 = v129;
  }
  if ([(_MSStickerDragPreviewContainerView *)self showDebugBorders])
  {
    id v100 = [MEMORY[0x1E4F428B8] blueColor];
    objc_msgSend(v41, "setBorderColor:", objc_msgSend(v100, "CGColor"));

    [v41 setBorderWidth:1.0];
    id v101 = [MEMORY[0x1E4F428B8] redColor];
    id v102 = v54;
    uint64_t v103 = [v101 CGColor];
    [(_MSStickerDragPreviewContainerView *)self layer];
    v104 = v32;
    v106 = id v105 = v7;
    uint64_t v107 = v103;
    v54 = v102;
    [v106 setBorderColor:v107];

    id v7 = v105;
    double v32 = v104;

    v108 = [(_MSStickerDragPreviewContainerView *)self layer];
    [v108 setBorderWidth:1.0];

    id v109 = [MEMORY[0x1E4F428B8] greenColor];
    objc_msgSend(v44, "setBorderColor:", objc_msgSend(v109, "CGColor"));

    [v44 setBorderWidth:1.0];
    id v110 = [MEMORY[0x1E4F428B8] yellowColor];
    objc_msgSend(v104, "setBorderColor:", objc_msgSend(v110, "CGColor"));

    [v104 setBorderWidth:1.0];
    id v111 = [MEMORY[0x1E4F428B8] systemPurpleColor];
    objc_msgSend(v45, "setBorderColor:", objc_msgSend(v111, "CGColor"));

    [v45 setBorderWidth:1.0];
  }
  if ([(_MSStickerDragPreviewContainerView *)self isDropAnimation])
  {
    double v112 = -(height * 1.1);
    CGAffineTransform m = v148;
    CATransform3DMakeAffineTransform(&v132, &m);
    CATransform3D v131 = v132;
    [v32 setTransform:&v131];
    [v41 position];
    double v114 = v113;
    [v41 position];
    objc_msgSend(v41, "setPosition:", v114, v115 + v38 * 2.0);
    [v44 position];
    double v117 = v116;
    [v44 position];
    objc_msgSend(v44, "setPosition:", v117, v118 + v112 * 2.0);
    [(CALayer *)self->_shineLayer position];
    double v120 = v119;
    [(CALayer *)self->_shineLayer position];
    -[CALayer setPosition:](self->_shineLayer, "setPosition:", v120, v121 + 135.0);
    [(CALayer *)self->_shadowLayer position];
    double v123 = v122;
    [(CALayer *)self->_shadowLayer position];
    -[CALayer setPosition:](self->_shadowLayer, "setPosition:", v123, v124 + 130.0);
  }
}

- (BOOL)showDebugBorders
{
  return MEMORY[0x1F4123788](@"com.apple.Messages", @"showStickerDragDebugBorders");
}

- (void)_animateLiftAlongsideAnimator:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79___MSStickerDragPreviewContainerView__animateLiftAlongsideAnimator_completion___block_invoke;
  v8[3] = &unk_1E6E98818;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 addAnimations:v8];
}

- (void)_animateLiftCancellationAlongsideAnimator:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __91___MSStickerDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke;
    v19[3] = &unk_1E6E987F0;
    v19[4] = self;
    [v6 addAnimations:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __91___MSStickerDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke_3;
    v17[3] = &unk_1E6E98D20;
    id v18 = v7;
    id v8 = v7;
    [v6 addCompletion:v17];
    id v9 = v18;
  }
  else
  {
    [(_MSStickerDragPreviewContainerView *)self originalCenter];
    double v11 = v10;
    double v13 = v12;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __91___MSStickerDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke_4;
    v15[3] = &unk_1E6E98A40;
    id v16 = v7;
    id v14 = v7;
    -[_MSStickerDragPreviewContainerView reversePeelAnimationToPoint:forPlacement:shouldShrink:completionBlock:](self, "reversePeelAnimationToPoint:forPlacement:shouldShrink:completionBlock:", 0, 0, v15, v11, v13);
    id v9 = v16;
  }
}

- (void)_animateDropAlongsideAnimator:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = ms_defaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    double v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_1E4A76000, v8, OS_LOG_TYPE_DEFAULT, "<_MSStickerDragPreviewContainerView: %p> _animateDropAlongsideAnimator animator: %@", buf, 0x16u);
  }

  [(_MSStickerDragPreviewContainerView *)self setFinalUIKitDropCompletion:v7];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79___MSStickerDragPreviewContainerView__animateDropAlongsideAnimator_completion___block_invoke;
  v9[3] = &unk_1E6E987F0;
  v9[4] = self;
  [v6 addAnimations:v9];
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