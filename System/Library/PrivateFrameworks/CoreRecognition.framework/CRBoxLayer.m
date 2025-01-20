@interface CRBoxLayer
+ (id)layer;
- (BOOL)customInit;
- (CAShapeLayer)reticleLayer;
- (CATextLayer)codeLayer;
- (CRBoxLayer)init;
- (CRBoxLayer)initWithCodeFrameRatio:(double)a3;
- (NSMutableArray)completionBlocks;
- (double)demoSpeed;
- (double)frameRatio;
- (void)addCompletionBlock:(id)a3;
- (void)animateConceal;
- (void)animatePulseColor:(id)a3;
- (void)animateReveal;
- (void)animateToPosition:(CGPoint)a3 transform:(CATransform3D *)a4 opacity:(double)a5 type:(int64_t)a6;
- (void)dealloc;
- (void)layoutSublayers;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)positionForCodeBoxPoints:(id)a3;
- (void)setCodeLayer:(id)a3;
- (void)setCompletionBlocks:(id)a3;
- (void)setCustomInit:(BOOL)a3;
- (void)setDemoSpeed:(double)a3;
- (void)setFrameRatio:(double)a3;
- (void)setReticleLayer:(id)a3;
- (void)setString:(id)a3 mirrored:(BOOL)a4 inverted:(BOOL)a5;
@end

@implementation CRBoxLayer

+ (id)layer
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (CRBoxLayer)init
{
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v4 = [v3 BOOLForKey:@"com.apple.CoreRecognition.RedeemerDemoMode"];
  double v5 = 1.0;
  if (v4) {
    double v5 = 0.25;
  }
  [(CRBoxLayer *)self setDemoSpeed:v5];

  return [(CRBoxLayer *)self initWithCodeFrameRatio:3.79710145];
}

- (CRBoxLayer)initWithCodeFrameRatio:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRBoxLayer;
  int v4 = [(CAReplicatorLayer *)&v7 init];
  double v5 = v4;
  if (v4)
  {
    [(CRBoxLayer *)v4 setFrameRatio:a3];
    v5->_customInit = 1;
    [(CRBoxLayer *)v5 addObserver:v5 forKeyPath:@"hidden" options:3 context:0];
  }
  return v5;
}

- (void)setFrameRatio:(double)a3
{
  if (self->_frameRatio != a3)
  {
    self->_frameRatio = a3;
    [(CRBoxLayer *)self frameRatio];
    double v5 = 971.487179 / v4 + 52.5128205;
    id v6 = +[CRColor colorWithWhite:1.0 alpha:0.5];
    uint64_t v7 = [v6 CGColor];

    -[CRBoxLayer setBounds:](self, "setBounds:", 0.0, 0.0, 1024.0, ceil(v5));
    [(CRBoxLayer *)self setShadowColor:v7];
    [(CRBoxLayer *)self setHidden:1];
    [(CAReplicatorLayer *)self setInstanceCount:3];
    v8 = [(CRBoxLayer *)self reticleLayer];

    if (!v8)
    {
      v9 = [MEMORY[0x263F15880] layer];
      [(CRBoxLayer *)self setReticleLayer:v9];

      v10 = [(CRBoxLayer *)self reticleLayer];
      [(CRBoxLayer *)self addSublayer:v10];
    }
    [(CRBoxLayer *)self bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v19 = [(CRBoxLayer *)self reticleLayer];
    objc_msgSend(v19, "setBounds:", v12, v14, v16, v18);

    v20 = [(CRBoxLayer *)self reticleLayer];
    [v20 setShouldRasterize:1];

    v21 = [(CRBoxLayer *)self reticleLayer];
    [v21 setShadowColor:v7];

    v22 = [(CRBoxLayer *)self reticleLayer];
    LODWORD(v23) = 1.0;
    [v22 setShadowOpacity:v23];

    double v24 = *MEMORY[0x263F001B0];
    double v25 = *(double *)(MEMORY[0x263F001B0] + 8);
    v26 = [(CRBoxLayer *)self reticleLayer];
    objc_msgSend(v26, "setShadowOffset:", v24, v25);

    v27 = [(CRBoxLayer *)self reticleLayer];
    [v27 setShadowRadius:26.2564103];

    id v28 = +[CRColor whiteColor];
    uint64_t v29 = [v28 CGColor];
    v30 = [(CRBoxLayer *)self reticleLayer];
    [v30 setFillColor:v29];

    Mutable = CGPathCreateMutable();
    v32 = [(CRBoxLayer *)self reticleLayer];
    [v32 bounds];
    CGFloat MinX = CGRectGetMinX(v81);
    v34 = [(CRBoxLayer *)self reticleLayer];
    [v34 bounds];
    CGFloat MinY = CGRectGetMinY(v82);
    v36 = [(CRBoxLayer *)self reticleLayer];
    [v36 bounds];
    v84.size.width = CGRectGetWidth(v83);
    v84.origin.x = MinX;
    v84.origin.y = MinY;
    v84.size.height = 5.25128205;
    CGPathAddRect(Mutable, 0, v84);

    v37 = [(CRBoxLayer *)self reticleLayer];
    [v37 bounds];
    CGFloat v38 = CGRectGetMidX(v85) + -2.62564103;
    v39 = [(CRBoxLayer *)self reticleLayer];
    [v39 bounds];
    v87.origin.y = CGRectGetMinY(v86) + 5.25128205;
    v87.origin.x = v38;
    v87.size.width = 5.25128205;
    v87.size.height = 21.0051282;
    CGPathAddRect(Mutable, 0, v87);

    v40 = [(CRBoxLayer *)self reticleLayer];
    [v40 bounds];
    CGFloat v41 = CGRectGetMinX(v88);
    v42 = [(CRBoxLayer *)self reticleLayer];
    [v42 bounds];
    CGFloat v43 = CGRectGetMaxY(v89) + -5.25128205;
    v44 = [(CRBoxLayer *)self reticleLayer];
    [v44 bounds];
    v91.size.width = CGRectGetWidth(v90);
    v91.origin.x = v41;
    v91.origin.y = v43;
    v91.size.height = 5.25128205;
    CGPathAddRect(Mutable, 0, v91);

    v45 = [(CRBoxLayer *)self reticleLayer];
    [v45 bounds];
    CGFloat v46 = CGRectGetMidX(v92) + -2.62564103;
    v47 = [(CRBoxLayer *)self reticleLayer];
    [v47 bounds];
    v94.origin.y = CGRectGetMaxY(v93) + -26.2564103;
    v94.origin.x = v46;
    v94.size.width = 5.25128205;
    v94.size.height = 21.0051282;
    CGPathAddRect(Mutable, 0, v94);

    v48 = [(CRBoxLayer *)self reticleLayer];
    [v48 bounds];
    CGFloat v49 = CGRectGetMinX(v95);
    v50 = [(CRBoxLayer *)self reticleLayer];
    [v50 bounds];
    CGFloat v51 = CGRectGetMinY(v96);
    v52 = [(CRBoxLayer *)self reticleLayer];
    [v52 bounds];
    v98.size.height = CGRectGetHeight(v97);
    v98.origin.x = v49;
    v98.origin.y = v51;
    v98.size.width = 5.25128205;
    CGPathAddRect(Mutable, 0, v98);

    v53 = [(CRBoxLayer *)self reticleLayer];
    [v53 bounds];
    CGFloat v54 = CGRectGetMinX(v99) + 5.25128205;
    v55 = [(CRBoxLayer *)self reticleLayer];
    [v55 bounds];
    v101.origin.y = CGRectGetMidY(v100) + -2.62564103;
    v101.origin.x = v54;
    v101.size.width = 21.0051282;
    v101.size.height = 5.25128205;
    CGPathAddRect(Mutable, 0, v101);

    v56 = [(CRBoxLayer *)self reticleLayer];
    [v56 bounds];
    CGFloat v57 = CGRectGetMaxX(v102) + -5.25128205;
    v58 = [(CRBoxLayer *)self reticleLayer];
    [v58 bounds];
    CGFloat v59 = CGRectGetMinY(v103);
    v60 = [(CRBoxLayer *)self reticleLayer];
    [v60 bounds];
    v105.size.height = CGRectGetHeight(v104);
    v105.origin.x = v57;
    v105.origin.y = v59;
    v105.size.width = 5.25128205;
    CGPathAddRect(Mutable, 0, v105);

    v61 = [(CRBoxLayer *)self reticleLayer];
    [v61 bounds];
    CGFloat v62 = CGRectGetMaxX(v106) + -26.2564103;
    v63 = [(CRBoxLayer *)self reticleLayer];
    [v63 bounds];
    v108.origin.y = CGRectGetMidY(v107) + -2.62564103;
    v108.origin.x = v62;
    v108.size.width = 21.0051282;
    v108.size.height = 5.25128205;
    CGPathAddRect(Mutable, 0, v108);

    v64 = [(CRBoxLayer *)self reticleLayer];
    [v64 setPath:Mutable];

    CGPathRelease(Mutable);
    v65 = [(CRBoxLayer *)self codeLayer];

    if (!v65)
    {
      v66 = [MEMORY[0x263F158E8] layer];
      [(CRBoxLayer *)self setCodeLayer:v66];

      v67 = [(CRBoxLayer *)self codeLayer];
      [(CRBoxLayer *)self addSublayer:v67];
    }
    [(CRBoxLayer *)self bounds];
    double Width = CGRectGetWidth(v109);
    v69 = [(CRBoxLayer *)self codeLayer];
    objc_msgSend(v69, "setBounds:", 0.0, 0.0, Width, 127.0);

    v70 = [(CRBoxLayer *)self codeLayer];
    objc_msgSend(v70, "setAnchorPoint:", 0.5, 0.41);

    v71 = [(CRBoxLayer *)self codeLayer];
    [v71 setShouldRasterize:1];

    v72 = [(CRBoxLayer *)self codeLayer];
    [v72 setShadowColor:v7];

    v73 = [(CRBoxLayer *)self codeLayer];
    LODWORD(v74) = 1.0;
    [v73 setShadowOpacity:v74];

    v75 = [(CRBoxLayer *)self codeLayer];
    objc_msgSend(v75, "setShadowOffset:", v24, v25);

    v76 = [(CRBoxLayer *)self codeLayer];
    [v76 setShadowRadius:26.2564103];

    v77 = [(CRBoxLayer *)self codeLayer];
    [v77 setFont:@"Scancardium"];

    v78 = [(CRBoxLayer *)self codeLayer];
    [v78 setFontSize:126.030769];

    id v79 = [(CRBoxLayer *)self codeLayer];
    [v79 setAlignmentMode:@"center"];
  }
}

- (void)dealloc
{
  if ([(CRBoxLayer *)self customInit]) {
    [(CRBoxLayer *)self removeObserver:self forKeyPath:@"hidden"];
  }
  v3.receiver = self;
  v3.super_class = (Class)CRBoxLayer;
  [(CRBoxLayer *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v12 = a3;
  uint64_t v8 = *MEMORY[0x263F081B8];
  id v9 = a5;
  v10 = [v9 objectForKey:v8];
  double v11 = [v9 objectForKey:*MEMORY[0x263F081C8]];

  LOBYTE(v9) = [v10 isEqual:v11];
  if ((v9 & 1) == 0 && [v12 isEqualToString:@"hidden"])
  {
    if ([(CRBoxLayer *)self isHidden]) {
      [(CRBoxLayer *)self animateConceal];
    }
    else {
      [(CRBoxLayer *)self animateReveal];
    }
  }
}

- (void)layoutSublayers
{
  [(CRBoxLayer *)self bounds];
  double MidX = CGRectGetMidX(v10);
  [(CRBoxLayer *)self bounds];
  double MidY = CGRectGetMidY(v11);
  double v5 = [(CRBoxLayer *)self reticleLayer];
  objc_msgSend(v5, "setPosition:", MidX, MidY);

  [(CRBoxLayer *)self bounds];
  double v6 = CGRectGetMidX(v12);
  [(CRBoxLayer *)self bounds];
  double v7 = CGRectGetMidY(v13);
  id v8 = [(CRBoxLayer *)self codeLayer];
  objc_msgSend(v8, "setPosition:", v6, v7);
}

- (void)positionForCodeBoxPoints:(id)a3
{
  uint64_t v5 = 0;
  uint64_t v38 = *MEMORY[0x263EF8340];
  double v6 = &v31;
  do
  {
    double v7 = [a3 objectAtIndex:v5];
    [v7 CGPointValue];
    *((void *)v6 - 1) = v8;
    *(void *)double v6 = v9;

    ++v5;
    v6 += 2;
  }
  while (v5 != 4);
  double v11 = v30;
  double v10 = v31;
  double v12 = v32;
  double v13 = v33;
  double v14 = v34;
  double v15 = v35;
  double v17 = v36;
  double v16 = v37;
  double v18 = (v30 + v36) * 0.5;
  double v19 = (v31 + v37) * 0.5;
  double v20 = (v32 + v34) * 0.5;
  double v21 = (v33 + v35) * 0.5;
  if (v20 == v18) {
    double v22 = dbl_2177A1920[v21 > v19];
  }
  else {
    double v22 = atan((v21 - v19) / (v20 - v18));
  }
  CGFloat angle = v22;
  [(CRBoxLayer *)self bounds];
  CGFloat Width = CGRectGetWidth(v39);
  memset(&v29, 0, sizeof(v29));
  CATransform3DMakeScale(&v29, v25 / Width * 195.0 / 185.0, v25 / Width * 195.0 / 185.0, 1.0);
  CATransform3D v27 = v29;
  CATransform3DRotate(&v28, &v27, angle, 0.0, 0.0, 1.0);
  CATransform3D v29 = v28;
  [(CRBoxLayer *)self opacity];
  CATransform3D v28 = v29;
  -[CRBoxLayer animateToPosition:transform:opacity:type:](self, "animateToPosition:transform:opacity:type:", &v28, 1, (v11 + v12 + v14 + v17) * 0.25, (v10 + v13 + v15 + v16) * 0.25, v24);
}

- (void)animateReveal
{
  [(CRBoxLayer *)self position];
  double v4 = v3;
  double v6 = v5;
  [(CRBoxLayer *)self transform];
  -[CRBoxLayer animateToPosition:transform:opacity:type:](self, "animateToPosition:transform:opacity:type:", &v7, 0, v4, v6, 1.0);
}

- (void)animateConceal
{
  [(CRBoxLayer *)self position];
  double v4 = v3;
  double v6 = v5;
  [(CRBoxLayer *)self transform];
  -[CRBoxLayer animateToPosition:transform:opacity:type:](self, "animateToPosition:transform:opacity:type:", &v7, 2, v4, v6, 0.0);
}

- (void)animateToPosition:(CGPoint)a3 transform:(CATransform3D *)a4 opacity:(double)a5 type:(int64_t)a6
{
  double y = a3.y;
  double x = a3.x;
  [MEMORY[0x263F158F8] begin];
  [(CRBoxLayer *)self position];
  double v14 = v13;
  double v16 = v15;
  memset(&v84, 0, sizeof(v84));
  [(CRBoxLayer *)self transform];
  [(CRBoxLayer *)self opacity];
  float v18 = v17;
  double v19 = [(CRBoxLayer *)self animationKeys];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    double v21 = [(CRBoxLayer *)self presentationLayer];
    double v22 = [v21 valueForKeyPath:@"position"];
    [v22 CGPointValue];
    double v14 = v23;
    double v16 = v24;

    double v25 = [(CRBoxLayer *)self presentationLayer];
    v26 = [v25 valueForKeyPath:@"transform"];
    CATransform3D v27 = v26;
    if (v26) {
      [v26 CATransform3DValue];
    }
    else {
      memset(&v83, 0, sizeof(v83));
    }
    CATransform3D v84 = v83;

    CATransform3D v29 = [(CRBoxLayer *)self presentationLayer];
    double v30 = [v29 valueForKeyPath:@"opacity"];
    [v30 doubleValue];
    double v28 = v31;
  }
  else
  {
    double v28 = v18;
  }
  double v32 = [(CRBoxLayer *)self animationForKey:@"CRBoxLayerAnimationReveal"];

  double v33 = [(CRBoxLayer *)self animationForKey:@"CRBoxLayerAnimationConceal"];
  BOOL v34 = v33 != 0;

  if (a6) {
    int64_t v35 = a6;
  }
  else {
    int64_t v35 = v34;
  }
  if (v32) {
    BOOL v36 = a6 == 1;
  }
  else {
    BOOL v36 = 0;
  }
  if (v36) {
    int64_t v37 = 0;
  }
  else {
    int64_t v37 = v35;
  }
  CATransform3D v83 = v84;
  NSStringFromSelector(a2);
  uint64_t v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v37 == 2)
  {
    [(CRBoxLayer *)self demoSpeed];
    v50 = @"CRBoxLayerAnimationConceal";
    double v39 = 0.7 / v51;
    goto LABEL_23;
  }
  if (v37 != 1)
  {
    double v39 = 0.25;
    if (v37)
    {
LABEL_24:
      [MEMORY[0x263F158F8] setDisableActions:1];
      goto LABEL_25;
    }
    if (!v32)
    {
      uint64_t v40 = [MEMORY[0x263EFF910] date];
      CGFloat v41 = (void *)animateToPosition_transform_opacity_type__sRevealStart;
      animateToPosition_transform_opacity_type__sRevealStart = v40;

      long long v42 = *(_OWORD *)&a4->m33;
      *(_OWORD *)&v82.m31 = *(_OWORD *)&a4->m31;
      *(_OWORD *)&v82.m33 = v42;
      long long v43 = *(_OWORD *)&a4->m43;
      *(_OWORD *)&v82.m41 = *(_OWORD *)&a4->m41;
      *(_OWORD *)&v82.m43 = v43;
      long long v44 = *(_OWORD *)&a4->m13;
      *(_OWORD *)&v82.m11 = *(_OWORD *)&a4->m11;
      *(_OWORD *)&v82.m13 = v44;
      long long v45 = *(_OWORD *)&a4->m23;
      *(_OWORD *)&v82.m21 = *(_OWORD *)&a4->m21;
      *(_OWORD *)&v82.m23 = v45;
      CATransform3DScale(&v83, &v82, 2.0, 2.0, 1.0);
      double v16 = y;
      double v14 = x;
    }
    [(CRBoxLayer *)self demoSpeed];
    double v47 = 0.5 / v46;
    v48 = [MEMORY[0x263EFF910] date];
    [v48 timeIntervalSinceDate:animateToPosition_transform_opacity_type__sRevealStart];
    double v39 = v47 - v49;

    v50 = @"CRBoxLayerAnimationReveal";
LABEL_23:

    uint64_t v38 = v50;
    goto LABEL_24;
  }
  char v76 = [(CRBoxLayer *)self isHidden];
  [(CRBoxLayer *)self demoSpeed];
  double v78 = v77;

  [MEMORY[0x263F158F8] setDisableActions:1];
  uint64_t v38 = @"CRBoxLayerAnimationMove";
  if (v76) {
    goto LABEL_28;
  }
  double v39 = 0.25 / v78;
LABEL_25:
  [(CRBoxLayer *)self removeAllAnimations];
  v52 = (void *)MEMORY[0x263F158F8];
  v80[0] = MEMORY[0x263EF8330];
  v80[1] = 3221225472;
  v80[2] = __55__CRBoxLayer_animateToPosition_transform_opacity_type___block_invoke;
  v80[3] = &unk_26429EA30;
  v80[4] = self;
  uint64_t v38 = v38;
  CGRect v81 = v38;
  [v52 setCompletionBlock:v80];
  v53 = (void *)MEMORY[0x263F158F8];
  CGFloat v54 = [NSNumber numberWithDouble:v39];
  [v53 setValue:v54 forKey:*MEMORY[0x263F15FC0]];

  v55 = [MEMORY[0x263EFF980] array];
  v56 = [MEMORY[0x263F15760] animationWithKeyPath:@"position"];
  CGFloat v57 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v14, v16);
  [v56 setFromValue:v57];

  v58 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", x, y);
  [v56 setToValue:v58];

  [v55 addObject:v56];
  CGFloat v59 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform"];
  CATransform3D v82 = v83;
  v60 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v82];
  [v59 setFromValue:v60];

  long long v61 = *(_OWORD *)&a4->m33;
  *(_OWORD *)&v82.m31 = *(_OWORD *)&a4->m31;
  *(_OWORD *)&v82.m33 = v61;
  long long v62 = *(_OWORD *)&a4->m43;
  *(_OWORD *)&v82.m41 = *(_OWORD *)&a4->m41;
  *(_OWORD *)&v82.m43 = v62;
  long long v63 = *(_OWORD *)&a4->m13;
  *(_OWORD *)&v82.m11 = *(_OWORD *)&a4->m11;
  *(_OWORD *)&v82.m13 = v63;
  long long v64 = *(_OWORD *)&a4->m23;
  *(_OWORD *)&v82.m21 = *(_OWORD *)&a4->m21;
  *(_OWORD *)&v82.m23 = v64;
  v65 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v82];
  [v59 setToValue:v65];

  [v55 addObject:v59];
  v66 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  v67 = [NSNumber numberWithDouble:v28];
  [v66 setFromValue:v67];

  v68 = [NSNumber numberWithDouble:a5];
  [v66 setToValue:v68];

  [v55 addObject:v66];
  if (v37 == 2)
  {
    v69 = [MEMORY[0x263F157D8] animationWithKeyPath:@"hidden"];
    [v69 setValues:&unk_26C7C5718];
    [v69 setKeyTimes:&unk_26C7C5730];
    [v69 setCalculationMode:@"discrete"];
    [v55 addObject:v69];
  }
  v70 = [MEMORY[0x263F15750] animation];
  [v70 setAnimations:v55];
  [v70 setDuration:v39];
  [v70 setTimingFunction:0];
  [(CRBoxLayer *)self addAnimation:v70 forKey:v38];

LABEL_28:
  -[CRBoxLayer setPosition:](self, "setPosition:", x, y);
  long long v71 = *(_OWORD *)&a4->m33;
  v79[4] = *(_OWORD *)&a4->m31;
  v79[5] = v71;
  long long v72 = *(_OWORD *)&a4->m43;
  v79[6] = *(_OWORD *)&a4->m41;
  v79[7] = v72;
  long long v73 = *(_OWORD *)&a4->m13;
  v79[0] = *(_OWORD *)&a4->m11;
  v79[1] = v73;
  long long v74 = *(_OWORD *)&a4->m23;
  v79[2] = *(_OWORD *)&a4->m21;
  v79[3] = v74;
  [(CRBoxLayer *)self setTransform:v79];
  *(float *)&double v75 = a5;
  [(CRBoxLayer *)self setOpacity:v75];
  [MEMORY[0x263F158F8] commit];
}

void __55__CRBoxLayer_animateToPosition_transform_opacity_type___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) animationKeys];
  char v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v4 = [*(id *)(a1 + 32) completionBlocks];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      uint64_t v8 = MEMORY[0x263EF83A0];
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
          v11[0] = MEMORY[0x263EF8330];
          v11[1] = 3221225472;
          v11[2] = __55__CRBoxLayer_animateToPosition_transform_opacity_type___block_invoke_2;
          v11[3] = &unk_26429EA08;
          uint64_t v13 = v10;
          id v12 = *(id *)(a1 + 40);
          dispatch_async(v8, v11);

          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    [*(id *)(a1 + 32) setCompletionBlocks:0];
  }
}

uint64_t __55__CRBoxLayer_animateToPosition_transform_opacity_type___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setString:(id)a3 mirrored:(BOOL)a4 inverted:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  long long v9 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  long long v10 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  *(_OWORD *)&v25.m31 = v9;
  *(_OWORD *)&v25.m33 = v10;
  long long v11 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  long long v12 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  *(_OWORD *)&v25.m41 = v11;
  *(_OWORD *)&v25.m43 = v12;
  long long v13 = *MEMORY[0x263F15740];
  long long v14 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  *(_OWORD *)&v25.m11 = *MEMORY[0x263F15740];
  *(_OWORD *)&v25.m13 = v14;
  long long v15 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  long long v16 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  *(_OWORD *)&v25.m21 = v15;
  *(_OWORD *)&v25.m23 = v16;
  if (v5)
  {
    *(_OWORD *)&v24.m31 = v9;
    *(_OWORD *)&v24.m33 = v10;
    *(_OWORD *)&v24.m41 = v11;
    *(_OWORD *)&v24.m43 = v12;
    *(_OWORD *)&v24.m11 = v13;
    *(_OWORD *)&v24.m13 = v14;
    *(_OWORD *)&v24.m21 = v15;
    *(_OWORD *)&v24.m23 = v16;
    CATransform3DRotate(&v25, &v24, 3.14159265, 0.0, 0.0, 1.0);
  }
  if (v6)
  {
    CATransform3D v23 = v25;
    CATransform3DRotate(&v24, &v23, 3.14159265, 0.0, 1.0, 0.0);
    CATransform3D v25 = v24;
  }
  if ([v8 length] == 12) {
    double v17 = 110.276923;
  }
  else {
    double v17 = dbl_2177A1D20[[v8 length] == 10];
  }
  float v18 = [(CRBoxLayer *)self codeLayer];
  [v18 setFontSize:v17];

  CATransform3D v22 = v25;
  uint64_t v19 = [(CRBoxLayer *)self codeLayer];
  CATransform3D v21 = v22;
  [v19 setTransform:&v21];

  [MEMORY[0x263F158F8] commit];
  uint64_t v20 = [(CRBoxLayer *)self codeLayer];
  [v20 setString:v8];
}

- (void)animatePulseColor:(id)a3
{
  double v4 = (void *)MEMORY[0x263F158F8];
  id v5 = a3;
  [v4 begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  BOOL v6 = [MEMORY[0x263F157D8] animationWithKeyPath:@"shadowColor"];
  uint64_t v7 = [(CRBoxLayer *)self shadowColor];
  id v8 = v5;
  uint64_t v9 = [v8 CGColor];
  [(CRBoxLayer *)self demoSpeed];
  [v6 setDuration:0.5 / v10];
  long long v11 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v9, v7, v9, v7, v9, v9, 0);
  [v6 setValues:v11];

  [v6 setKeyTimes:&unk_26C7C5748];
  [v6 setCalculationMode:*MEMORY[0x263F15968]];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __32__CRBoxLayer_animatePulseColor___block_invoke;
  v21[3] = &unk_26429EA30;
  v21[4] = self;
  CATransform3D v22 = @"CRBoxLayerAnimationPulseColor";
  [MEMORY[0x263F158F8] setCompletionBlock:v21];
  [(CRBoxLayer *)self addAnimation:v6 forKey:@"key"];
  long long v12 = [(CRBoxLayer *)self reticleLayer];
  [v12 addAnimation:v6 forKey:@"key"];

  long long v13 = [(CRBoxLayer *)self codeLayer];
  [v13 addAnimation:v6 forKey:@"key"];

  id v14 = v8;
  -[CRBoxLayer setShadowColor:](self, "setShadowColor:", [v14 CGColor]);
  id v15 = v14;
  uint64_t v16 = [v15 CGColor];
  double v17 = [(CRBoxLayer *)self reticleLayer];
  [v17 setShadowColor:v16];

  id v18 = v15;
  uint64_t v19 = [v18 CGColor];

  uint64_t v20 = [(CRBoxLayer *)self codeLayer];
  [v20 setShadowColor:v19];

  [MEMORY[0x263F158F8] commit];
}

uint64_t __32__CRBoxLayer_animatePulseColor___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = [*(id *)(a1 + 32) completionBlocks];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    BOOL v6 = MEMORY[0x263EF83A0];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __32__CRBoxLayer_animatePulseColor___block_invoke_2;
        v10[3] = &unk_26429EA08;
        uint64_t v12 = v8;
        id v11 = *(id *)(a1 + 40);
        dispatch_async(v6, v10);

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 32) setCompletionBlocks:0];
}

uint64_t __32__CRBoxLayer_animatePulseColor___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)addCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRBoxLayer *)self animationKeys];

  if (v5)
  {
    BOOL v6 = [(CRBoxLayer *)self completionBlocks];

    if (!v6)
    {
      uint64_t v7 = [MEMORY[0x263EFF980] array];
      [(CRBoxLayer *)self setCompletionBlocks:v7];
    }
    uint64_t v8 = [(CRBoxLayer *)self completionBlocks];
    uint64_t v9 = (void *)MEMORY[0x21D44B9F0](v4);
    [v8 addObject:v9];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__CRBoxLayer_addCompletionBlock___block_invoke;
    block[3] = &unk_26429EA58;
    id v11 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __33__CRBoxLayer_addCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)frameRatio
{
  return self->_frameRatio;
}

- (CAShapeLayer)reticleLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setReticleLayer:(id)a3
{
}

- (CATextLayer)codeLayer
{
  return (CATextLayer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCodeLayer:(id)a3
{
}

- (NSMutableArray)completionBlocks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCompletionBlocks:(id)a3
{
}

- (double)demoSpeed
{
  return self->_demoSpeed;
}

- (void)setDemoSpeed:(double)a3
{
  self->_demoSpeed = a3;
}

- (BOOL)customInit
{
  return self->_customInit;
}

- (void)setCustomInit:(BOOL)a3
{
  self->_customInit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_codeLayer, 0);
  objc_storeStrong((id *)&self->_reticleLayer, 0);
}

@end