@interface CKBrowserDragStickerView
+ (id)meshTransform;
+ (id)springAnimationWithKeyPath:(id)a3 speed:(float)a4;
- (BOOL)canPeel;
- (BOOL)canRotate;
- (BOOL)isPressed;
- (BOOL)isScaledDown;
- (BOOL)userExplicitlyUnpausedAnimation;
- (CADisplayLink)displayLink;
- (CALayer)dropShadowLayer;
- (CALayer)meshLayer;
- (CALayer)peelImageLayer;
- (CALayer)peelLayer;
- (CALayer)peelMaskLayer;
- (CALayer)perspectiveLayer;
- (CALayer)shadowLayer;
- (CALayer)shineLayer;
- (CGPoint)anchorOffset;
- (CGPoint)dragViewCenter;
- (CGPoint)dropShadowLayerStartPosition;
- (CGPoint)initialDragStartPosition;
- (CGPoint)meshLayerStartPosition;
- (CGPoint)peelLayerStartPosition;
- (CGPoint)shadowLayerStartPosition;
- (CGPoint)shineLayerStartPosition;
- (CGRect)sourceRect;
- (CGSize)initialSize;
- (CGSize)rasterizedImageSize;
- (CKAnimatedImage)dragImage;
- (CKBrowserDragStickerView)initWithSourceRect:(CGRect)a3 dragImage:(id)a4;
- (CKBrowserDragStickerView)initWithSourceRect:(CGRect)a3 draggedSticker:(id)a4;
- (CKBrowserDraggedSticker)draggedSticker;
- (CKElasticFunction)elasticFunctionPositionX;
- (CKElasticFunction)elasticFunctionPositionY;
- (CKElasticFunction)elasticFunctionRotation;
- (CKElasticFunction)elasticFunctionScaleX;
- (CKElasticFunction)elasticFunctionScaleY;
- (NSArray)dragImageFrames;
- (NSMutableDictionary)peelMaskImageCache;
- (UIImage)currentFrameImage;
- (UIView)plusImageView;
- (UIView)whiteBackground;
- (double)dragViewRotation;
- (double)dragViewScale;
- (double)dragViewScaleUp;
- (double)elasticLastTime;
- (double)elasticRemainingTime;
- (double)elasticRotationAngle;
- (double)elasticScaleX;
- (double)elasticScaleY;
- (double)initialScale;
- (double)rotationAngle;
- (id)peelMaskImageFromImage:(id)a3;
- (id)scaleImage:(id)a3 toSize:(CGSize)a4;
- (void)_displayLinkCallback:(id)a3;
- (void)animatePeelWithCompletion:(id)a3;
- (void)animateScaleDown;
- (void)animationTimerFired:(double)a3;
- (void)applyTransforms;
- (void)attachElasticEffectsForLocation:(CGPoint)a3;
- (void)dealloc;
- (void)detachElasticEffects;
- (void)reversePeelAnimationToPoint:(CGPoint)a3 forPlacement:(BOOL)a4 shouldShrink:(BOOL)a5 completionBlock:(id)a6;
- (void)setAnchorOffset:(CGPoint)a3;
- (void)setCanPeel:(BOOL)a3;
- (void)setCanRotate:(BOOL)a3;
- (void)setCurrentFrameImage:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setDragImage:(id)a3;
- (void)setDragImageFrames:(id)a3;
- (void)setDragViewScale:(double)a3;
- (void)setDropShadowLayer:(id)a3;
- (void)setDropShadowLayerStartPosition:(CGPoint)a3;
- (void)setElasticFunctionPositionX:(id)a3;
- (void)setElasticFunctionPositionY:(id)a3;
- (void)setElasticFunctionRotation:(id)a3;
- (void)setElasticFunctionScaleX:(id)a3;
- (void)setElasticFunctionScaleY:(id)a3;
- (void)setElasticLastTime:(double)a3;
- (void)setElasticRemainingTime:(double)a3;
- (void)setElasticRotationAngle:(double)a3;
- (void)setElasticScaleX:(double)a3;
- (void)setElasticScaleY:(double)a3;
- (void)setInitialDragStartPosition:(CGPoint)a3;
- (void)setInitialScale:(double)a3;
- (void)setInitialSize:(CGSize)a3;
- (void)setMeshLayer:(id)a3;
- (void)setMeshLayerStartPosition:(CGPoint)a3;
- (void)setPeelImageLayer:(id)a3;
- (void)setPeelLayer:(id)a3;
- (void)setPeelLayerStartPosition:(CGPoint)a3;
- (void)setPeelMaskImageCache:(id)a3;
- (void)setPeelMaskLayer:(id)a3;
- (void)setPerspectiveLayer:(id)a3;
- (void)setPlusImageView:(id)a3;
- (void)setPlusImageViewHidden:(BOOL)a3;
- (void)setPressed:(BOOL)a3;
- (void)setRasterizedImageSize:(CGSize)a3;
- (void)setRotationAngle:(double)a3;
- (void)setScaledDown:(BOOL)a3;
- (void)setShadowLayer:(id)a3;
- (void)setShadowLayerStartPosition:(CGPoint)a3;
- (void)setShineLayer:(id)a3;
- (void)setShineLayerStartPosition:(CGPoint)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setUpPeelLayers;
- (void)setUserExplicitlyUnpausedAnimation:(BOOL)a3;
- (void)setWhiteBackground:(id)a3;
- (void)updateAnimationTimerObserving;
- (void)updateElasticEffectsForLocation:(CGPoint)a3;
@end

@implementation CKBrowserDragStickerView

+ (id)meshTransform
{
  if (meshTransform_onceToken != -1) {
    dispatch_once(&meshTransform_onceToken, &__block_literal_global_197);
  }
  v2 = (void *)meshTransform___mesh;

  return v2;
}

void __41__CKBrowserDragStickerView_meshTransform__block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  memcpy(__dst, &unk_18F81D398, sizeof(__dst));
  memcpy(v2, &unk_18F81D708, sizeof(v2));
  uint64_t v0 = [MEMORY[0x1E4F39C18] meshTransformWithVertexCount:22 vertices:__dst faceCount:10 faces:v2 depthNormalization:*MEMORY[0x1E4F39ED8]];
  v1 = (void *)meshTransform___mesh;
  meshTransform___mesh = v0;
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

- (void)dealloc
{
  [(CADisplayLink *)self->_displayLink invalidate];
  v3 = +[CKImageAnimationTimer sharedTimer];
  [v3 removeAnimationTimerObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKBrowserDragStickerView;
  [(CKBrowserDragStickerView *)&v4 dealloc];
}

- (CKBrowserDragStickerView)initWithSourceRect:(CGRect)a3 dragImage:(id)a4
{
  double width = a3.size.width;
  double height = a3.size.height;
  CGFloat x = a3.origin.x;
  CGFloat y = a3.origin.y;
  id v5 = a4;
  v46.receiver = self;
  v46.super_class = (Class)CKBrowserDragStickerView;
  double v6 = [(CKBrowserDragStickerView *)&v46 init];
  if (v6)
  {
    id v7 = +[CKUIBehavior sharedBehaviors];
    double v8 = [v5 frames];
    [(CKBrowserDragStickerView *)v6 setDragImageFrames:v8];
    [v5 size];
    double v10 = v9;
    double v12 = v11;
    [v5 scale];
    double v14 = v13;
    v15 = [MEMORY[0x1E4F42D90] mainScreen];
    [v15 scale];
    objc_msgSend(v7, "stickerSizeScaledWithInitialSize:imageScale:userScale:rectifiedScreenScale:maxWidth:", v10, v12, v14, 1.0, v16, 1.79769313e308);
    double v18 = v17;
    double v20 = v19;

    double v21 = width / v18;
    if (v12 > v10) {
      double v21 = height / v20;
    }
    double v22 = fmin(v21, 1.0);
    v23 = [MEMORY[0x1E4F42D90] mainScreen];
    [v23 scale];
    UIRectIntegralWithScale();
    double v25 = v24;
    double v27 = v26;

    [(CKBrowserDragStickerView *)v6 setDragViewScale:1.0];
    [(CKBrowserDragStickerView *)v6 setInitialScale:v22];
    -[CKBrowserDragStickerView setInitialSize:](v6, "setInitialSize:", width, height);
    -[CKBrowserDragStickerView setRasterizedImageSize:](v6, "setRasterizedImageSize:", v25, v27);
    if ([v8 count])
    {
      v28 = [v8 firstObject];
      [(CKBrowserDragStickerView *)v6 setCurrentFrameImage:v28];
    }
    else
    {
      [(CKBrowserDragStickerView *)v6 setCurrentFrameImage:0];
    }
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(CKBrowserDragStickerView *)v6 setPeelMaskImageCache:v29];

    v30 = (float64x2_t *)MEMORY[0x1E4F1DB28];
    -[CKBrowserDragStickerView setBounds:](v6, "setBounds:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), v25, v27);
    float64x2_t v31 = v30[1];
    if (CKMainScreenScale_once_79 != -1)
    {
      float64x2_t v41 = v30[1];
      dispatch_once(&CKMainScreenScale_once_79, &__block_literal_global_463_1);
      float64x2_t v31 = v41;
    }
    double v32 = *(double *)&CKMainScreenScale_sMainScreenScale_79;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_79 == 0.0) {
      double v32 = 1.0;
    }
    v33.f64[0] = x;
    v33.f64[1] = y;
    v34.f64[0] = width;
    v34.f64[1] = height;
    __asm { FMOV            V2.2D, #0.5 }
    -[CKBrowserDragStickerView setCenter:](v6, "setCenter:", vmulq_n_f64(vaddq_f64(vmulq_n_f64(v33, v32), vrndmq_f64(vmulq_f64(vsubq_f64(vmulq_n_f64(v34, v32), vmulq_n_f64(v31, v32)), _Q2))), 1.0 / v32), *(_OWORD *)&v41);
    [(CKBrowserDragStickerView *)v6 setUpPeelLayers];
    [(CKBrowserDragStickerView *)v6 setDragImage:v5];
  }
  return v6;
}

- (CKBrowserDragStickerView)initWithSourceRect:(CGRect)a3 draggedSticker:(id)a4
{
  double width = a3.size.width;
  double height = a3.size.height;
  CGFloat x = a3.origin.x;
  CGFloat y = a3.origin.y;
  id v5 = a4;
  v45.receiver = self;
  v45.super_class = (Class)CKBrowserDragStickerView;
  double v6 = [(CKBrowserDragStickerView *)&v45 init];
  if (v6)
  {
    id v7 = +[CKUIBehavior sharedBehaviors];
    double v8 = [v5 animatedImage];
    double v9 = [v8 frames];

    [(CKBrowserDragStickerView *)v6 setDragImageFrames:v9];
    [v5 frame];
    double v11 = v10;
    double v13 = v12;
    [v5 scale];
    double v15 = v14;
    [v7 stickerScreenScale];
    objc_msgSend(v7, "stickerSizeScaledWithInitialSize:imageScale:userScale:rectifiedScreenScale:maxWidth:", v11, v13, v15, 1.0, v16, 1.79769313e308);
    double v19 = width / v18;
    if (v13 > v11) {
      double v19 = height / v17;
    }
    double v20 = fmin(v19, 1.0);
    double v21 = [MEMORY[0x1E4F42D90] mainScreen];
    [v21 scale];
    UIRectIntegralWithScale();
    double v23 = v22;
    double v25 = v24;

    [(CKBrowserDragStickerView *)v6 setDragViewScale:1.0];
    [(CKBrowserDragStickerView *)v6 setInitialScale:v20];
    -[CKBrowserDragStickerView setInitialSize:](v6, "setInitialSize:", width, height);
    -[CKBrowserDragStickerView setRasterizedImageSize:](v6, "setRasterizedImageSize:", v23, v25);
    if ([v9 count])
    {
      double v26 = [v9 firstObject];
      [(CKBrowserDragStickerView *)v6 setCurrentFrameImage:v26];
    }
    else
    {
      [(CKBrowserDragStickerView *)v6 setCurrentFrameImage:0];
    }
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(CKBrowserDragStickerView *)v6 setPeelMaskImageCache:v27];

    v28 = (float64x2_t *)MEMORY[0x1E4F1DB28];
    -[CKBrowserDragStickerView setBounds:](v6, "setBounds:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), v23, v25);
    float64x2_t v29 = v28[1];
    if (CKMainScreenScale_once_79 != -1)
    {
      float64x2_t v40 = v28[1];
      dispatch_once(&CKMainScreenScale_once_79, &__block_literal_global_463_1);
      float64x2_t v29 = v40;
    }
    double v30 = *(double *)&CKMainScreenScale_sMainScreenScale_79;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_79 == 0.0) {
      double v30 = 1.0;
    }
    v31.f64[0] = x;
    v31.f64[1] = y;
    v32.f64[0] = width;
    v32.f64[1] = height;
    __asm { FMOV            V2.2D, #0.5 }
    -[CKBrowserDragStickerView setCenter:](v6, "setCenter:", vmulq_n_f64(vaddq_f64(vmulq_n_f64(v31, v30), vrndmq_f64(vmulq_f64(vsubq_f64(vmulq_n_f64(v32, v30), vmulq_n_f64(v29, v30)), _Q2))), 1.0 / v30), *(_OWORD *)&v40);
    [(CKBrowserDragStickerView *)v6 setUpPeelLayers];
    v38 = [v5 animatedImage];
    [(CKBrowserDragStickerView *)v6 setDragImage:v38];
  }
  return v6;
}

- (void)setUpPeelLayers
{
  v77[1] = *MEMORY[0x1E4F143B8];
  v3 = [(CKBrowserDragStickerView *)self currentFrameImage];
  objc_super v4 = -[CKBrowserDragStickerView scaleImage:toSize:](self, "scaleImage:toSize:", v3, self->_rasterizedImageSize.width, self->_rasterizedImageSize.height);

  [(CKBrowserDragStickerView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(CKBrowserDragStickerView *)self layer];
  [v9 anchorPoint];
  double v11 = v10;

  double v12 = [MEMORY[0x1E4F39D10] layer];
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v68[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v68[3] = v13;
  v68[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  uint64_t v14 = *(void *)(MEMORY[0x1E4F39B10] + 80);
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v68[0] = *MEMORY[0x1E4F39B10];
  v68[1] = v15;
  long long v16 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  long long v71 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v72 = v16;
  uint64_t v69 = v14;
  unint64_t v70 = 0xBF747AE140000000;
  [v12 setSublayerTransform:v68];
  objc_msgSend(v12, "setPosition:", v6 * 0.5, v8 * 0.5);
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, v6, v8);
  double v17 = [(CKBrowserDragStickerView *)self layer];
  [v17 addSublayer:v12];

  v67 = v12;
  [(CKBrowserDragStickerView *)self setPerspectiveLayer:v12];
  double v18 = [MEMORY[0x1E4F39BE8] layer];
  double v19 = [(id)objc_opt_class() meshTransform];
  [v18 setMeshTransform:v19];

  objc_msgSend(v18, "setPosition:", v6 * v11, -v8);
  objc_msgSend(v18, "setBounds:", 0.0, 0.0, v6 + v6, v8 * 5.0);
  [v18 setRasterizationScale:2.8];
  [v12 addSublayer:v18];
  [(CKBrowserDragStickerView *)self setMeshLayer:v18];
  [v18 position];
  -[CKBrowserDragStickerView setMeshLayerStartPosition:](self, "setMeshLayerStartPosition:");
  double v20 = [MEMORY[0x1E4F39BE8] layer];
  objc_msgSend(v20, "setPosition:", (v6 + v6) * v11, v8 * 5.0 - v8);
  objc_msgSend(v20, "setBounds:", 0.0, 0.0, v6, v8);
  [v18 addSublayer:v20];
  [(CKBrowserDragStickerView *)self setPeelLayer:v20];
  [v20 position];
  -[CKBrowserDragStickerView setPeelLayerStartPosition:](self, "setPeelLayerStartPosition:");
  double v21 = [MEMORY[0x1E4F39BE8] layer];
  id v62 = v4;
  objc_msgSend(v21, "setContents:", objc_msgSend(v62, "CGImage"));
  uint64_t v22 = *MEMORY[0x1E4F3A3D8];
  uint64_t v60 = *MEMORY[0x1E4F3A3D8];
  [v21 setContentsGravity:*MEMORY[0x1E4F3A3D8]];
  [v20 bounds];
  objc_msgSend(v21, "setFrame:");
  v76 = @"contents";
  double v23 = [MEMORY[0x1E4F1CA98] null];
  v77[0] = v23;
  double v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:&v76 count:1];
  [v21 setActions:v24];

  [(CKBrowserDragStickerView *)self setPeelImageLayer:v21];
  [v20 addSublayer:v21];
  double v25 = [(CKBrowserDragStickerView *)self peelMaskImageFromImage:v62];
  v65 = [MEMORY[0x1E4F39BE8] layer];
  id v66 = v25;
  objc_msgSend(v65, "setContents:", objc_msgSend(v66, "CGImage"));
  [v20 bounds];
  objc_msgSend(v65, "setFrame:");
  [v65 setContentsGravity:v22];
  [v20 setMask:v65];
  [(CKBrowserDragStickerView *)self setPeelMaskLayer:v65];
  double v26 = [MEMORY[0x1E4F42A80] ckImageNamed:@"StickerShine"];
  [v26 size];
  double v28 = v27;
  [v20 bounds];
  CGFloat Width = CGRectGetWidth(v78);
  double v30 = Width + Width;
  if (v28 < v30) {
    double v28 = v30;
  }
  float64x2_t v31 = [MEMORY[0x1E4F39BE8] layer];
  id v64 = v26;
  objc_msgSend(v31, "setContents:", objc_msgSend(v64, "CGImage"));
  [v20 bounds];
  double v32 = round(CGRectGetWidth(v79) - v28) * 0.5;
  [v64 size];
  double v34 = -v33;
  [v64 size];
  objc_msgSend(v31, "setFrame:", v32, v34, v28, v35);
  LODWORD(v36) = 1035489772;
  [v31 setOpacity:v36];
  v37 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
  [v31 setCompositingFilter:v37];

  [v20 addSublayer:v31];
  [(CKBrowserDragStickerView *)self setShineLayer:v31];
  [v31 position];
  -[CKBrowserDragStickerView setShineLayerStartPosition:](self, "setShineLayerStartPosition:");
  v38 = [MEMORY[0x1E4F42A80] ckImageNamed:@"StickerShadow"];
  [v38 size];
  double v40 = v39;
  [v20 bounds];
  CGFloat v41 = CGRectGetWidth(v80);
  double v42 = v41 + v41;
  if (v40 < v42) {
    double v40 = v42;
  }
  v43 = [MEMORY[0x1E4F39BE8] layer];
  id v61 = v38;
  objc_msgSend(v43, "setContents:", objc_msgSend(v61, "CGImage"));
  [v20 bounds];
  double v44 = round(CGRectGetWidth(v81) - v40) * 0.5;
  [v61 size];
  double v46 = -10.0 - v45;
  [v61 size];
  objc_msgSend(v43, "setFrame:", v44, v46, v40, v47);
  LODWORD(v48) = 1043542835;
  [v43 setOpacity:v48];
  [v20 addSublayer:v43];
  [(CKBrowserDragStickerView *)self setShadowLayer:v43];
  [v43 position];
  -[CKBrowserDragStickerView setShadowLayerStartPosition:](self, "setShadowLayerStartPosition:");
  v49 = [MEMORY[0x1E4F39BE8] layer];
  id v63 = v62;
  objc_msgSend(v49, "setContents:", objc_msgSend(v63, "CGImage"));
  [v49 setContentsGravity:v60];
  v50 = [(CKBrowserDragStickerView *)self layer];
  [v21 bounds];
  objc_msgSend(v50, "convertRect:fromLayer:", v21);
  objc_msgSend(v49, "setFrame:");

  id v51 = [MEMORY[0x1E4F428B8] colorWithWhite:0.75 alpha:1.0];
  objc_msgSend(v49, "setContentsMultiplyColor:", objc_msgSend(v51, "CGColor"));

  LODWORD(v52) = 1041194025;
  [v49 setOpacity:v52];
  v53 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E0]];
  [v49 setCompositingFilter:v53];

  v74 = @"contents";
  v54 = [MEMORY[0x1E4F1CA98] null];
  v75 = v54;
  v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
  [v49 setActions:v55];

  v56 = [(CKBrowserDragStickerView *)self layer];
  [v56 insertSublayer:v49 below:v67];

  [(CKBrowserDragStickerView *)self setDropShadowLayer:v49];
  [v49 position];
  -[CKBrowserDragStickerView setDropShadowLayerStartPosition:](self, "setDropShadowLayerStartPosition:");
  v57 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  [v57 setValue:&unk_1EDF17378 forKey:@"inputRadius"];
  [v57 setName:@"blurFilter"];
  v58 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A048]];
  [v58 setValue:&unk_1EDF17388 forKey:@"inputAmount"];
  v73[0] = v57;
  v73[1] = v58;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:2];
  [v49 setFilters:v59];
}

- (void)animatePeelWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(CKBrowserDragStickerView *)self canPeel])
  {
    double v5 = objc_opt_class();
    LODWORD(v6) = 1053609165;
    double v46 = [v5 springAnimationWithKeyPath:@"filters.blurFilter.inputRadius" speed:v6];
    [v46 setToValue:&unk_1EDF17398];
    [v46 setBeginTime:CACurrentMediaTime() + 0.1];
    double v7 = objc_opt_class();
    LODWORD(v8) = 1053609165;
    double v9 = [v7 springAnimationWithKeyPath:@"position" speed:v8];
    double v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 23.0);
    [v9 setByValue:v10];

    double v11 = v9;
    [v9 setBeginTime:CACurrentMediaTime() + 0.1];
    double v12 = objc_opt_class();
    LODWORD(v13) = 1061997773;
    uint64_t v14 = [v12 springAnimationWithKeyPath:@"opacity" speed:v13];
    [v14 setToValue:&unk_1EDF173A8];
    [v14 setBeginTime:CACurrentMediaTime() + 0.1];
    long long v15 = objc_opt_class();
    LODWORD(v16) = 1061997773;
    double v17 = [v15 springAnimationWithKeyPath:@"transform.scale.xy" speed:v16];
    [v17 setToValue:&unk_1EDF173B8];
    [v17 setBeginTime:CACurrentMediaTime() + 0.1];
    [(CKBrowserDragStickerView *)self bounds];
    double v19 = v18;
    double v20 = v18 * 2.1;
    double v21 = objc_opt_class();
    LODWORD(v22) = 1050253722;
    double v23 = [v21 springAnimationWithKeyPath:@"position" speed:v22];
    double v24 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, v20);
    [v23 setByValue:v24];

    [v23 setBeginTime:CACurrentMediaTime() + -0.31];
    double v25 = objc_opt_class();
    LODWORD(v26) = 1050253722;
    double v27 = [v25 springAnimationWithKeyPath:@"position" speed:v26];
    double v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, -(v19 * 2.1));
    [v27 setByValue:v28];

    [v27 setBeginTime:CACurrentMediaTime() + -0.31];
    float64x2_t v29 = objc_opt_class();
    LODWORD(v30) = 1053609165;
    float64x2_t v31 = [v29 springAnimationWithKeyPath:@"position" speed:v30];
    double v32 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 135.0);
    [v31 setByValue:v32];

    [v31 setBeginTime:CACurrentMediaTime() + -0.12];
    double v33 = objc_opt_class();
    LODWORD(v34) = 1061997773;
    double v35 = [v33 springAnimationWithKeyPath:@"position" speed:v34];
    double v36 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 130.0);
    [v35 setByValue:v36];

    [v35 setBeginTime:CACurrentMediaTime() + 0.1];
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setAnimationDuration:0.310000002];
    v37 = [(CKBrowserDragStickerView *)self dropShadowLayer];
    [v37 addAnimation:v46 forKey:@"dropShadowBlurAnimation"];

    v38 = [(CKBrowserDragStickerView *)self dropShadowLayer];
    [v38 addAnimation:v11 forKey:@"dropShadowPositionAnimation"];

    double v39 = [(CKBrowserDragStickerView *)self dropShadowLayer];
    [v39 addAnimation:v14 forKey:@"dropShadowOpacityAnimation"];

    double v40 = [(CKBrowserDragStickerView *)self dropShadowLayer];
    [v40 addAnimation:v17 forKey:@"dropShadowScaleAnimation"];

    CGFloat v41 = [(CKBrowserDragStickerView *)self meshLayer];
    [v41 addAnimation:v23 forKey:@"meshAnimation"];

    double v42 = [(CKBrowserDragStickerView *)self peelLayer];
    [v42 addAnimation:v27 forKey:@"peelAnimation"];

    v43 = [(CKBrowserDragStickerView *)self shineLayer];
    [v43 addAnimation:v31 forKey:@"shineAnimation"];

    double v44 = [(CKBrowserDragStickerView *)self shadowLayer];
    [v44 addAnimation:v35 forKey:@"shadowAnimation"];

    [MEMORY[0x1E4F39CF8] commit];
    dispatch_time_t v45 = dispatch_time(0, 910000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__CKBrowserDragStickerView_animatePeelWithCompletion___block_invoke;
    block[3] = &unk_1E5620F48;
    id v48 = v4;
    dispatch_after(v45, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __54__CKBrowserDragStickerView_animatePeelWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)animateScaleDown
{
  v3 = objc_opt_class();
  LODWORD(v4) = 1061997773;
  double v5 = [v3 springAnimationWithKeyPath:@"transform.scale.xy" speed:v4];
  [(CKBrowserDragStickerView *)self dragViewScaleUp];
  double v7 = [NSNumber numberWithDouble:v6 * (self->_dragViewScale * self->_elasticScaleX)];
  [v5 setFromValue:v7];

  double v8 = [NSNumber numberWithDouble:self->_dragViewScale * self->_elasticScaleX * 0.714285714];
  [v5 setToValue:v8];

  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.310000002];
  double v9 = [(CKBrowserDragStickerView *)self layer];
  [v9 addAnimation:v5 forKey:@"scaleDownAnimation"];

  [MEMORY[0x1E4F39CF8] commit];
  dispatch_time_t v10 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CKBrowserDragStickerView_animateScaleDown__block_invoke;
  block[3] = &unk_1E5620C40;
  void block[4] = self;
  dispatch_after(v10, MEMORY[0x1E4F14428], block);
}

void __44__CKBrowserDragStickerView_animateScaleDown__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) layer];
  [v1 removeAnimationForKey:@"scaleDownAnimation"];
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
  uint64_t v14 = [v12 springAnimationWithKeyPath:@"transform.scale.xy" speed:v13];
  long long v15 = v14;
  BOOL v127 = v6;
  BOOL v128 = v7;
  v132 = v14;
  v129 = v11;
  if (v6)
  {
    [v14 setToValue:&unk_1EDF173C8];
  }
  else
  {
    double v16 = NSNumber;
    if (v7) {
      [(CKBrowserDragStickerView *)self dragViewScale];
    }
    else {
      [(CKBrowserDragStickerView *)self dragViewScaleUp];
    }
    double v17 = objc_msgSend(v16, "numberWithDouble:");
    [v15 setToValue:v17];
  }
  double v18 = [(CKBrowserDragStickerView *)self dropShadowLayer];
  double v19 = [v18 presentationLayer];
  [v19 position];
  double v21 = v20;
  double v23 = v22;
  double v24 = [(CKBrowserDragStickerView *)self dropShadowLayer];
  objc_msgSend(v24, "setPosition:", v21, v23);

  double v25 = objc_opt_class();
  LODWORD(v26) = 1066192077;
  double v27 = [v25 springAnimationWithKeyPath:@"position" speed:v26];
  double v28 = (void *)MEMORY[0x1E4F29238];
  [(CKBrowserDragStickerView *)self dropShadowLayerStartPosition];
  float64x2_t v29 = objc_msgSend(v28, "valueWithCGPoint:");
  [v27 setToValue:v29];

  v131 = v27;
  [v27 setBeginTime:CACurrentMediaTime() + 0.18];
  double v30 = [(CKBrowserDragStickerView *)self dropShadowLayer];
  float64x2_t v31 = [v30 presentationLayer];
  [v31 opacity];
  LODWORD(v23) = v32;
  double v33 = [(CKBrowserDragStickerView *)self dropShadowLayer];
  LODWORD(v34) = LODWORD(v23);
  [v33 setOpacity:v34];

  double v35 = objc_opt_class();
  LODWORD(v36) = 1066192077;
  v37 = [v35 springAnimationWithKeyPath:@"opacity" speed:v36];
  [v37 setToValue:&unk_1EDF173D8];
  v130 = v37;
  [v37 setBeginTime:CACurrentMediaTime() + 0.18];
  v38 = [(CKBrowserDragStickerView *)self dropShadowLayer];
  double v39 = [(CKBrowserDragStickerView *)self dropShadowLayer];
  double v40 = [v39 presentationLayer];
  CGFloat v41 = [v40 valueForKey:@"transform.scale.xy"];
  [v38 setValue:v41 forKey:@"transform.scale.xy"];

  double v42 = objc_opt_class();
  LODWORD(v43) = 1066192077;
  double v44 = [v42 springAnimationWithKeyPath:@"transform.scale.xy" speed:v43];
  [v44 setToValue:&unk_1EDF173E8];
  [v44 setBeginTime:CACurrentMediaTime() + 0.18];
  dispatch_time_t v45 = [(CKBrowserDragStickerView *)self meshLayer];
  double v46 = [v45 presentationLayer];
  [v46 position];
  double v48 = v47;
  double v50 = v49;

  id v51 = objc_opt_class();
  LODWORD(v52) = 1050253722;
  v53 = [v51 springAnimationWithKeyPath:@"position" speed:v52];
  v54 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v48, v50);
  [v53 setFromValue:v54];

  v55 = (void *)MEMORY[0x1E4F29238];
  [(CKBrowserDragStickerView *)self meshLayerStartPosition];
  v56 = objc_msgSend(v55, "valueWithCGPoint:");
  [v53 setToValue:v56];

  v57 = [(CKBrowserDragStickerView *)self peelLayer];
  v58 = [v57 presentationLayer];
  [v58 position];
  double v60 = v59;
  double v62 = v61;

  id v63 = objc_opt_class();
  LODWORD(v64) = 1050253722;
  v65 = [v63 springAnimationWithKeyPath:@"position" speed:v64];
  id v66 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v60, v62);
  [v65 setFromValue:v66];

  v67 = (void *)MEMORY[0x1E4F29238];
  [(CKBrowserDragStickerView *)self peelLayerStartPosition];
  v68 = objc_msgSend(v67, "valueWithCGPoint:");
  [v65 setToValue:v68];

  uint64_t v69 = [(CKBrowserDragStickerView *)self shineLayer];
  unint64_t v70 = [v69 presentationLayer];
  [v70 position];
  double v72 = v71;
  double v74 = v73;

  v75 = objc_opt_class();
  LODWORD(v76) = 1050253722;
  v77 = [v75 springAnimationWithKeyPath:@"position" speed:v76];
  CGRect v78 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v72, v74);
  [v77 setFromValue:v78];

  CGRect v79 = (void *)MEMORY[0x1E4F29238];
  [(CKBrowserDragStickerView *)self shineLayerStartPosition];
  CGRect v80 = objc_msgSend(v79, "valueWithCGPoint:");
  [v77 setToValue:v80];

  CGRect v81 = [(CKBrowserDragStickerView *)self shadowLayer];
  v82 = [v81 presentationLayer];
  [v82 position];
  double v84 = v83;
  double v86 = v85;

  v87 = objc_opt_class();
  LODWORD(v88) = 1066192077;
  v89 = [v87 springAnimationWithKeyPath:@"position" speed:v88];
  v90 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v84, v86);
  [v89 setFromValue:v90];

  v91 = (void *)MEMORY[0x1E4F29238];
  [(CKBrowserDragStickerView *)self shadowLayerStartPosition];
  v92 = objc_msgSend(v91, "valueWithCGPoint:");
  [v89 setToValue:v92];

  [v89 setBeginTime:CACurrentMediaTime() + 0.18];
  if (v127)
  {
    v93 = [(CKBrowserDragStickerView *)self layer];
    [v93 position];
    double v95 = v94;
    double v97 = v96;

    v98 = objc_opt_class();
    LODWORD(v99) = 1066192077;
    v100 = [v98 springAnimationWithKeyPath:@"position" speed:v99];
    v101 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v95, v97);
    [v100 setFromValue:v101];

    v102 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", x, y);
    [v100 setToValue:v102];

    v103 = objc_opt_class();
    LODWORD(v104) = 1066192077;
    v105 = [v103 springAnimationWithKeyPath:@"opacity" speed:v104];
    [v105 setFromValue:&unk_1EDF17378];
    [v105 setToValue:&unk_1EDF173D8];
  }
  else
  {
    v100 = 0;
    v105 = 0;
  }
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.310000002];
  v106 = [(CKBrowserDragStickerView *)self layer];
  [v106 addAnimation:v132 forKey:@"scaleUpAnimation"];

  v107 = [(CKBrowserDragStickerView *)self dropShadowLayer];
  [v107 addAnimation:v131 forKey:@"dropShadowPositionAnimation"];

  v108 = [(CKBrowserDragStickerView *)self dropShadowLayer];
  [v108 addAnimation:v130 forKey:@"dropShadowOpacityAnimation"];

  v109 = [(CKBrowserDragStickerView *)self dropShadowLayer];
  [v109 addAnimation:v44 forKey:@"dropShadowScaleAnimation"];

  v110 = [(CKBrowserDragStickerView *)self meshLayer];
  [v110 addAnimation:v53 forKey:@"meshAnimation"];

  v111 = [(CKBrowserDragStickerView *)self peelLayer];
  [v111 addAnimation:v65 forKey:@"peelAnimation"];

  v112 = [(CKBrowserDragStickerView *)self shineLayer];
  [v112 addAnimation:v77 forKey:@"shineAnimation"];

  v113 = [(CKBrowserDragStickerView *)self shadowLayer];
  [v113 addAnimation:v89 forKey:@"shadowAnimation"];

  if (v100)
  {
    v114 = [(CKBrowserDragStickerView *)self layer];
    [v114 addAnimation:v100 forKey:@"moveAnimation"];
  }
  if (v105)
  {
    v115 = [(CKBrowserDragStickerView *)self layer];
    [v115 addAnimation:v105 forKey:@"opacityAnimation"];
  }
  [MEMORY[0x1E4F39CF8] commit];
  if (v128)
  {
    dispatch_time_t v116 = dispatch_time(0, 750000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__CKBrowserDragStickerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke;
    block[3] = &unk_1E5620F48;
    v117 = v129;
    v137 = v129;
    id v118 = v129;
    dispatch_after(v116, MEMORY[0x1E4F14428], block);
    v119 = v137;
  }
  else
  {
    v138.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
    CGFloat v120 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    CGFloat width = self->_rasterizedImageSize.width;
    CGFloat height = self->_rasterizedImageSize.height;
    v138.origin.double y = v120;
    v138.size.CGFloat width = width;
    v138.size.CGFloat height = height;
    CGFloat v123 = x - CGRectGetWidth(v138) * 0.5;
    v139.origin.double x = v123;
    v139.origin.double y = v120;
    v139.size.CGFloat width = width;
    v139.size.CGFloat height = height;
    CGFloat v124 = CGRectGetHeight(v139);
    v125 = (void *)MEMORY[0x1E4F42FF0];
    v135[0] = MEMORY[0x1E4F143A8];
    v135[1] = 3221225472;
    v135[2] = __98__CKBrowserDragStickerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_2;
    v135[3] = &unk_1E5621968;
    v135[4] = self;
    *(CGFloat *)&v135[5] = v123;
    *(double *)&v135[6] = y - v124 * 0.5;
    *(CGFloat *)&v135[7] = width;
    *(CGFloat *)&v135[8] = height;
    v133[0] = MEMORY[0x1E4F143A8];
    v133[1] = 3221225472;
    v133[2] = __98__CKBrowserDragStickerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_3;
    v133[3] = &unk_1E5622358;
    v117 = v129;
    v134 = v129;
    id v126 = v129;
    [v125 animateWithDuration:0 delay:v135 usingSpringWithDamping:v133 initialSpringVelocity:0.75 options:0.0 animations:0.6 completion:0.0];
    v119 = v134;
  }
}

uint64_t __98__CKBrowserDragStickerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __98__CKBrowserDragStickerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return [*(id *)(a1 + 32) setAlpha:0.999];
}

uint64_t __98__CKBrowserDragStickerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)applyTransforms
{
  BOOL v3 = [(CKBrowserDragStickerView *)self isScaledDown];
  double v4 = 0.714285714;
  CGFloat v5 = 1.0;
  if (!v3) {
    double v4 = 1.0;
  }
  double dragViewScale = self->_dragViewScale;
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeScale(&v15, v4 * dragViewScale * self->_elasticScaleX, v4 * dragViewScale * self->_elasticScaleY);
  CGFloat v7 = self->_rotationAngle + self->_elasticRotationAngle;
  CGAffineTransform v13 = v15;
  CGAffineTransformRotate(&v14, &v13, v7);
  CGAffineTransform v15 = v14;
  if (![(CKBrowserDragStickerView *)self isScaledDown])
  {
    [(CKBrowserDragStickerView *)self dragViewScaleUp];
    CGFloat v5 = v8;
  }
  CGAffineTransform v13 = v15;
  CGAffineTransformScale(&v14, &v13, v5, v5);
  CGAffineTransform v15 = v14;
  [(CKBrowserDragStickerView *)self dragViewCenter];
  double v10 = v9;
  double v12 = v11;
  CGAffineTransform v14 = v15;
  [(CKBrowserDragStickerView *)self setTransform:&v14];
  if (!CKIsRunningInMacCatalyst()) {
    -[CKBrowserDragStickerView setCenter:](self, "setCenter:", v10, v12);
  }
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
  [(CKBrowserDragStickerView *)self applyTransforms];
}

- (void)setDragViewScale:(double)a3
{
  double v3 = fmin(a3, 2.0);
  if (v3 < 1.0) {
    double v3 = 1.0;
  }
  if (self->_dragViewScale != v3)
  {
    self->_double dragViewScale = v3;
    [(CKBrowserDragStickerView *)self applyTransforms];
  }
}

- (void)setPlusImageViewHidden:(BOOL)a3
{
  if (a3)
  {
    double v4 = (void *)MEMORY[0x1E4F42FF0];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    double v28 = __51__CKBrowserDragStickerView_setPlusImageViewHidden___block_invoke;
    float64x2_t v29 = &unk_1E5620C40;
    double v30 = self;
    CGFloat v5 = &v26;
  }
  else
  {
    BOOL v6 = [(CKBrowserDragStickerView *)self plusImageView];

    if (!v6)
    {
      CGFloat v7 = [MEMORY[0x1E4F42A98] configurationWithPointSize:38.0];
      double v8 = [MEMORY[0x1E4F42A80] systemImageNamed:@"plus.circle.fill"];
      double v9 = [v8 imageWithSymbolConfiguration:v7];

      double v10 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v9];
      double v11 = [MEMORY[0x1E4F428B8] systemGreenColor];
      [v10 setTintColor:v11];

      id v12 = objc_alloc(MEMORY[0x1E4F42FF0]);
      CGAffineTransform v13 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      CGAffineTransform v14 = [MEMORY[0x1E4F428B8] whiteColor];
      [v13 setBackgroundColor:v14];

      [(CKBrowserDragStickerView *)self addSubview:v13];
      [(CKBrowserDragStickerView *)self addSubview:v10];
      [(CKBrowserDragStickerView *)self bounds];
      objc_msgSend(v10, "setCenter:", v15 + -7.0, 7.0);
      [v10 frame];
      CGRect v32 = CGRectInset(v31, 4.0, 4.0);
      objc_msgSend(v13, "setFrame:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
      [v13 bounds];
      double v17 = v16 * 0.5;
      double v18 = [v13 layer];
      [v18 setCornerRadius:v17];

      [(CKBrowserDragStickerView *)self setPlusImageView:v10];
      [(CKBrowserDragStickerView *)self setWhiteBackground:v13];
      double v19 = [(CKBrowserDragStickerView *)self plusImageView];
      [v19 setAlpha:0.0];

      double v20 = [(CKBrowserDragStickerView *)self whiteBackground];
      [v20 setAlpha:0.0];
    }
    double v4 = (void *)MEMORY[0x1E4F42FF0];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    double v23 = __51__CKBrowserDragStickerView_setPlusImageViewHidden___block_invoke_2;
    double v24 = &unk_1E5620C40;
    double v25 = self;
    CGFloat v5 = &v21;
  }
  objc_msgSend(v4, "animateWithDuration:animations:", v5, 0.2, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30);
}

void __51__CKBrowserDragStickerView_setPlusImageViewHidden___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) plusImageView];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) whiteBackground];
  [v3 setAlpha:0.0];
}

void __51__CKBrowserDragStickerView_setPlusImageViewHidden___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) plusImageView];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) whiteBackground];
  [v3 setAlpha:1.0];
}

- (CGPoint)dragViewCenter
{
  [(CKBrowserDragStickerView *)self frame];
  float64x2_t v6 = *(float64x2_t *)(MEMORY[0x1E4F1DB28] + 16);
  if (CKMainScreenScale_once_79 != -1)
  {
    double v20 = v5;
    float64_t v21 = v4.f64[0];
    double v18 = v3;
    float64_t v19 = v2.f64[0];
    float64x2_t v17 = *(float64x2_t *)(MEMORY[0x1E4F1DB28] + 16);
    dispatch_once(&CKMainScreenScale_once_79, &__block_literal_global_463_1);
    float64x2_t v6 = v17;
    float64_t v3 = v18;
    v2.f64[0] = v19;
    float64_t v5 = v20;
    v4.f64[0] = v21;
  }
  if (*(double *)&CKMainScreenScale_sMainScreenScale_79 == 0.0) {
    double v7 = 1.0;
  }
  else {
    double v7 = *(double *)&CKMainScreenScale_sMainScreenScale_79;
  }
  v2.f64[1] = v3;
  float64x2_t v8 = vmulq_n_f64(v2, v7);
  v4.f64[1] = v5;
  float64x2_t v9 = vsubq_f64(vmulq_n_f64(v4, v7), vmulq_n_f64(v6, v7));
  __asm { FMOV            V2.2D, #0.5 }
  float64x2_t v15 = vmulq_n_f64(vaddq_f64(v8, vrndmq_f64(vmulq_f64(v9, _Q2))), 1.0 / v7);
  double v16 = v15.f64[1];
  result.double x = v15.f64[0];
  result.double y = v16;
  return result;
}

- (double)dragViewRotation
{
  float64x2_t v2 = [(CKBrowserDragStickerView *)self layer];
  float64_t v3 = [v2 valueForKeyPath:@"transform.rotation"];
  [v3 floatValue];
  double v5 = v4;

  return v5;
}

- (double)dragViewScaleUp
{
  [(CKBrowserDragStickerView *)self rasterizedImageSize];
  double v4 = v3;
  [(CKBrowserDragStickerView *)self initialSize];
  if (v4 < v5
    || ([(CKBrowserDragStickerView *)self rasterizedImageSize],
        double v7 = v6,
        [(CKBrowserDragStickerView *)self initialSize],
        double result = 1.0,
        v7 < v9))
  {
    [(CKBrowserDragStickerView *)self rasterizedImageSize];
    double v11 = v10;
    [(CKBrowserDragStickerView *)self rasterizedImageSize];
    double v13 = v12;
    [(CKBrowserDragStickerView *)self initialSize];
    double v15 = v14;
    double v17 = v16;
    [(CKBrowserDragStickerView *)self rasterizedImageSize];
    if (v11 <= v13) {
      return v15 / v18;
    }
    else {
      return v17 / v19;
    }
  }
  return result;
}

- (id)scaleImage:(id)a3 toSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = (void *)MEMORY[0x1E4F42D90];
  id v7 = a3;
  float64x2_t v8 = [v6 mainScreen];
  [v8 scale];
  CGFloat v10 = (v9 + v9) * 1.4;
  v14.double width = width;
  v14.double height = height;
  UIGraphicsBeginImageContextWithOptions(v14, 0, v10);

  objc_msgSend(v7, "drawInRect:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height);
  double v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v11;
}

- (id)peelMaskImageFromImage:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v5 = a3;
  [v5 size];
  double v7 = v6;
  double v9 = v8;
  CGFloat v10 = [MEMORY[0x1E4F42D90] mainScreen];
  [v10 scale];
  CGFloat v12 = v11;
  v17.double width = v7;
  v17.double height = v9;
  UIGraphicsBeginImageContextWithOptions(v17, 0, v12);

  double v13 = [MEMORY[0x1E4F428B8] blackColor];
  [v13 setFill];

  v18.origin.double x = v3;
  v18.origin.double y = v4;
  v18.size.double width = v7;
  v18.size.double height = v9;
  UIRectFillUsingBlendMode(v18, kCGBlendModeCopy);
  objc_msgSend(v5, "drawInRect:blendMode:alpha:", 22, v3, v4, v7, v9, 1.0);

  CGSize v14 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v14;
}

- (void)attachElasticEffectsForLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = +[CKElasticFunction functionWithTension:550.0 friction:20.0 initialValue:a3.x];
  elasticFunctionPositionX = self->_elasticFunctionPositionX;
  self->_elasticFunctionPositionX = v6;

  [(CKElasticFunction *)self->_elasticFunctionPositionX setInput:x];
  double v8 = +[CKElasticFunction functionWithTension:550.0 friction:20.0 initialValue:y];
  elasticFunctionPositionY = self->_elasticFunctionPositionY;
  self->_elasticFunctionPositionY = v8;

  [(CKElasticFunction *)self->_elasticFunctionPositionY setInput:y];
  CGFloat v10 = +[CKElasticFunction functionWithTension:350.0 friction:15.0 initialValue:0.0];
  elasticFunctionRotation = self->_elasticFunctionRotation;
  self->_elasticFunctionRotation = v10;

  self->_elasticRotationAngle = 0.0;
  CGFloat v12 = +[CKElasticFunction functionWithTension:350.0 friction:20.0 initialValue:100.0];
  elasticFunctionScaleX = self->_elasticFunctionScaleX;
  self->_elasticFunctionScaleX = v12;

  [(CKElasticFunction *)self->_elasticFunctionScaleX setInput:100.0];
  self->_elasticScaleX = 1.0;
  CGSize v14 = +[CKElasticFunction functionWithTension:350.0 friction:20.0 initialValue:100.0];
  elasticFunctionScaleY = self->_elasticFunctionScaleY;
  self->_elasticFunctionScaleY = v14;

  [(CKElasticFunction *)self->_elasticFunctionScaleY setInput:100.0];
  self->_elasticScaleY = 1.0;
  if (!self->_displayLink)
  {
    double v16 = [MEMORY[0x1E4F42D90] mainScreen];
    CGSize v17 = [v16 displayLinkWithTarget:self selector:sel__displayLinkCallback_];
    displayLink = self->_displayLink;
    self->_displayLink = v17;

    double v19 = self->_displayLink;
    double v20 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [(CADisplayLink *)v19 addToRunLoop:v20 forMode:*MEMORY[0x1E4F1C4B0]];

    self->_elasticLastTime = CACurrentMediaTime();
    self->_elasticRemainingTime = 0.0;
  }
}

- (void)updateElasticEffectsForLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(CKBrowserDragStickerView *)self isPressed])
  {
    [(CKElasticFunction *)self->_elasticFunctionPositionX setInput:x];
    [(CKElasticFunction *)self->_elasticFunctionPositionY setInput:y];
    elasticFunctionRotation = self->_elasticFunctionRotation;
    [(CKElasticFunction *)self->_elasticFunctionPositionX velocity];
    [(CKElasticFunction *)elasticFunctionRotation setInput:(v7 + 1000.0) / 2000.0 * -24.0 + 12.0];
    elasticFunctionScaleX = self->_elasticFunctionScaleX;
    [(CKElasticFunction *)self->_elasticFunctionPositionY velocity];
    [(CKElasticFunction *)elasticFunctionScaleX setInput:v9 / 1000.0 * -4.0 + 100.0];
    elasticFunctionScaleY = self->_elasticFunctionScaleY;
    [(CKElasticFunction *)self->_elasticFunctionPositionY velocity];
    double v12 = v11 / 1000.0 * 12.0 + 100.0;
    [(CKElasticFunction *)elasticFunctionScaleY setInput:v12];
  }
}

- (void)detachElasticEffects
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  elasticFunctionPositionX = self->_elasticFunctionPositionX;
  self->_elasticFunctionPositionX = 0;

  elasticFunctionPositionY = self->_elasticFunctionPositionY;
  self->_elasticFunctionPositionY = 0;

  elasticFunctionRotation = self->_elasticFunctionRotation;
  self->_elasticFunctionRotation = 0;

  elasticFunctionScaleX = self->_elasticFunctionScaleX;
  self->_elasticFunctionScaleX = 0;

  elasticFunctionScaleY = self->_elasticFunctionScaleY;
  self->_elasticFunctionScaleY = 0;
}

- (void)_displayLinkCallback:(id)a3
{
  double v4 = CACurrentMediaTime();
  double elasticLastTime = self->_elasticLastTime;
  self->_double elasticLastTime = v4;
  double v6 = v4 - elasticLastTime + self->_elasticRemainingTime;
  self->_elasticRemainingTime = v6;
  if (v6 >= 0.001)
  {
    do
    {
      [(CKElasticFunction *)self->_elasticFunctionPositionX step];
      [(CKElasticFunction *)self->_elasticFunctionPositionY step];
      [(CKElasticFunction *)self->_elasticFunctionRotation step];
      [(CKElasticFunction *)self->_elasticFunctionScaleX step];
      [(CKElasticFunction *)self->_elasticFunctionScaleY step];
      double v7 = self->_elasticRemainingTime - 0.001;
      self->_elasticRemainingTime = v7;
    }
    while (v7 >= 0.001);
  }
  [(CKElasticFunction *)self->_elasticFunctionPositionX output];
  double v9 = v8;
  [(CKElasticFunction *)self->_elasticFunctionPositionY output];
  double v11 = v10;
  BOOL v12 = [(CKBrowserDragStickerView *)self isScaledDown];
  double v13 = [MEMORY[0x1E4F42D90] mainScreen];
  [v13 bounds];
  double Height = CGRectGetHeight(v30);

  if ([(CKBrowserDragStickerView *)self canPeel] && !v12)
  {
    double v15 = 100.0;
    if (Height < 568.0) {
      double v15 = 85.0;
    }
    if (vabdd_f64(v11, self->_initialDragStartPosition.y) >= v15)
    {
      [(CKBrowserDragStickerView *)self setScaledDown:1];
      [(CKBrowserDragStickerView *)self animateScaleDown];
    }
  }
  [(CKBrowserDragStickerView *)self anchorOffset];
  double v17 = v16;
  double v19 = v18;
  if (!CKIsRunningInMacCatalyst()) {
    -[CKBrowserDragStickerView setCenter:](self, "setCenter:", v9 - v17, v11 - v19);
  }
  [(CKElasticFunction *)self->_elasticFunctionRotation output];
  double v21 = v20 * 3.14159265 / 180.0;
  double v22 = fabs(v21);
  double v23 = -v21;
  if (v22 <= 0.001) {
    double v23 = 0.0;
  }
  self->_elasticRotationAngle = v23;
  [(CKElasticFunction *)self->_elasticFunctionScaleX output];
  double v25 = v24 / 100.0;
  [(CKElasticFunction *)self->_elasticFunctionScaleY output];
  double v27 = v26 / 100.0;
  if (fabs(v25 + -1.0) <= 0.001) {
    double v28 = 1.0;
  }
  else {
    double v28 = v25;
  }
  self->_elasticScaleX = v28;
  if (fabs(v27 + -1.0) <= 0.001) {
    double v27 = 1.0;
  }
  self->_elasticScaleY = v27;

  [(CKBrowserDragStickerView *)self applyTransforms];
}

- (void)updateAnimationTimerObserving
{
  double v3 = [(CKBrowserDragStickerView *)self dragImageFrames];
  if ((unint64_t)[v3 count] <= 1)
  {
  }
  else
  {
    double v4 = [(CKBrowserDragStickerView *)self window];

    if (v4)
    {
      id v5 = +[CKImageAnimationTimer sharedTimer];
      [v5 addAnimationTimerObserver:self];
      goto LABEL_6;
    }
  }
  id v5 = +[CKImageAnimationTimer sharedTimer];
  [v5 removeAnimationTimerObserver:self];
LABEL_6:
}

- (void)animationTimerFired:(double)a3
{
  id v5 = [(CKBrowserDragStickerView *)self dragImageFrames];
  unint64_t v6 = [v5 count];

  if (v6 >= 2)
  {
    id v17 = [(CKBrowserDragStickerView *)self dragImageFrames];
    int64_t v7 = [(CKAnimatedImage *)self->_dragImage frameIndexForAnimationTime:a3];
    double v8 = [v17 objectAtIndex:v7];
    [(CKBrowserDragStickerView *)self setCurrentFrameImage:v8];
    double v9 = [(CKBrowserDragStickerView *)self peelImageLayer];
    id v10 = v8;
    objc_msgSend(v9, "setContents:", objc_msgSend(v10, "CGImage"));

    double v11 = [NSNumber numberWithUnsignedInteger:v7];
    BOOL v12 = [(CKBrowserDragStickerView *)self peelMaskImageCache];
    double v13 = [v12 objectForKey:v11];

    if (!v13)
    {
      double v13 = [(CKBrowserDragStickerView *)self peelMaskImageFromImage:v10];
      CGSize v14 = [(CKBrowserDragStickerView *)self peelMaskImageCache];
      [v14 setObject:v13 forKey:v11];
    }
    double v15 = [(CKBrowserDragStickerView *)self peelMaskLayer];
    id v16 = v13;
    objc_msgSend(v15, "setContents:", objc_msgSend(v16, "CGImage"));
  }
}

- (CKBrowserDraggedSticker)draggedSticker
{
  [(CKBrowserDragStickerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CKBrowserDragStickerView *)self window];
  -[CKBrowserDragStickerView convertRect:toView:](self, "convertRect:toView:", v11, v4, v6, v8, v10);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = [CKBrowserDraggedSticker alloc];
  double v21 = [(CKBrowserDragStickerView *)self dragImage];
  [(CKBrowserDragStickerView *)self dragViewScale];
  double v23 = v22;
  [(CKBrowserDragStickerView *)self rotationAngle];
  double v25 = -[CKBrowserDraggedSticker initWithAnimatedImage:frame:scale:rotationAngle:](v20, "initWithAnimatedImage:frame:scale:rotationAngle:", v21, v13, v15, v17, v19, v23, v24);

  return v25;
}

- (CGPoint)initialDragStartPosition
{
  double x = self->_initialDragStartPosition.x;
  double y = self->_initialDragStartPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialDragStartPosition:(CGPoint)a3
{
  self->_initialDragStartPosition = a3;
}

- (double)initialScale
{
  return self->_initialScale;
}

- (void)setInitialScale:(double)a3
{
  self->_initialScale = a3;
}

- (CGSize)initialSize
{
  double width = self->_initialSize.width;
  double height = self->_initialSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setInitialSize:(CGSize)a3
{
  self->_initialSize = a3;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (double)dragViewScale
{
  return self->_dragViewScale;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (void)setPressed:(BOOL)a3
{
  self->_pressed = a3;
}

- (BOOL)userExplicitlyUnpausedAnimation
{
  return self->_userExplicitlyUnpausedAnimation;
}

- (void)setUserExplicitlyUnpausedAnimation:(BOOL)a3
{
  self->_userExplicitlyUnpausedAnimation = a3;
}

- (BOOL)canPeel
{
  return self->_canPeel;
}

- (void)setCanPeel:(BOOL)a3
{
  self->_canPeel = a3;
}

- (UIImage)currentFrameImage
{
  return self->_currentFrameImage;
}

- (void)setCurrentFrameImage:(id)a3
{
}

- (CALayer)perspectiveLayer
{
  return self->_perspectiveLayer;
}

- (void)setPerspectiveLayer:(id)a3
{
}

- (CGSize)rasterizedImageSize
{
  double width = self->_rasterizedImageSize.width;
  double height = self->_rasterizedImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setRasterizedImageSize:(CGSize)a3
{
  self->_rasterizedImageSize = a3;
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

- (NSArray)dragImageFrames
{
  return self->_dragImageFrames;
}

- (void)setDragImageFrames:(id)a3
{
}

- (UIView)plusImageView
{
  return self->_plusImageView;
}

- (void)setPlusImageView:(id)a3
{
}

- (UIView)whiteBackground
{
  return self->_whiteBackground;
}

- (void)setWhiteBackground:(id)a3
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

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (CGPoint)anchorOffset
{
  double x = self->_anchorOffset.x;
  double y = self->_anchorOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAnchorOffset:(CGPoint)a3
{
  self->_anchorOffset = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (double)elasticLastTime
{
  return self->_elasticLastTime;
}

- (void)setElasticLastTime:(double)a3
{
  self->_double elasticLastTime = a3;
}

- (double)elasticRemainingTime
{
  return self->_elasticRemainingTime;
}

- (void)setElasticRemainingTime:(double)a3
{
  self->_elasticRemainingTime = a3;
}

- (CKElasticFunction)elasticFunctionPositionX
{
  return self->_elasticFunctionPositionX;
}

- (void)setElasticFunctionPositionX:(id)a3
{
}

- (CKElasticFunction)elasticFunctionPositionY
{
  return self->_elasticFunctionPositionY;
}

- (void)setElasticFunctionPositionY:(id)a3
{
}

- (CKElasticFunction)elasticFunctionRotation
{
  return self->_elasticFunctionRotation;
}

- (void)setElasticFunctionRotation:(id)a3
{
}

- (double)elasticRotationAngle
{
  return self->_elasticRotationAngle;
}

- (void)setElasticRotationAngle:(double)a3
{
  self->_elasticRotationAngle = a3;
}

- (CKElasticFunction)elasticFunctionScaleX
{
  return self->_elasticFunctionScaleX;
}

- (void)setElasticFunctionScaleX:(id)a3
{
}

- (CKElasticFunction)elasticFunctionScaleY
{
  return self->_elasticFunctionScaleY;
}

- (void)setElasticFunctionScaleY:(id)a3
{
}

- (double)elasticScaleX
{
  return self->_elasticScaleX;
}

- (void)setElasticScaleX:(double)a3
{
  self->_elasticScaleX = a3;
}

- (double)elasticScaleY
{
  return self->_elasticScaleY;
}

- (void)setElasticScaleY:(double)a3
{
  self->_elasticScaleY = a3;
}

- (BOOL)isScaledDown
{
  return self->_scaledDown;
}

- (void)setScaledDown:(BOOL)a3
{
  self->_scaledDown = a3;
}

- (BOOL)canRotate
{
  return self->_canRotate;
}

- (void)setCanRotate:(BOOL)a3
{
  self->_canRotate = a3;
}

- (NSMutableDictionary)peelMaskImageCache
{
  return self->_peelMaskImageCache;
}

- (void)setPeelMaskImageCache:(id)a3
{
}

- (CKAnimatedImage)dragImage
{
  return self->_dragImage;
}

- (void)setDragImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragImage, 0);
  objc_storeStrong((id *)&self->_peelMaskImageCache, 0);
  objc_storeStrong((id *)&self->_elasticFunctionScaleY, 0);
  objc_storeStrong((id *)&self->_elasticFunctionScaleX, 0);
  objc_storeStrong((id *)&self->_elasticFunctionRotation, 0);
  objc_storeStrong((id *)&self->_elasticFunctionPositionY, 0);
  objc_storeStrong((id *)&self->_elasticFunctionPositionX, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_peelMaskLayer, 0);
  objc_storeStrong((id *)&self->_peelImageLayer, 0);
  objc_storeStrong((id *)&self->_whiteBackground, 0);
  objc_storeStrong((id *)&self->_plusImageView, 0);
  objc_storeStrong((id *)&self->_dragImageFrames, 0);
  objc_storeStrong((id *)&self->_meshLayer, 0);
  objc_storeStrong((id *)&self->_peelLayer, 0);
  objc_storeStrong((id *)&self->_dropShadowLayer, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_shineLayer, 0);
  objc_storeStrong((id *)&self->_perspectiveLayer, 0);

  objc_storeStrong((id *)&self->_currentFrameImage, 0);
}

@end