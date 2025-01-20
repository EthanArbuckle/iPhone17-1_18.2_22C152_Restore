@interface BCSCircularEffectView
- (BCSCircularEffectView)initWithFrame:(CGRect)a3;
- (void)_buildRings;
- (void)animateCenterGlyphAndRings;
- (void)animateRingsRotationWithCompletion:(id)a3;
- (void)animationDidStart:(id)a3;
- (void)prepareCenterGlyphWithImage:(id)a3;
- (void)revealCenterGlyphAndRings;
@end

@implementation BCSCircularEffectView

- (BCSCircularEffectView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BCSCircularEffectView;
  v3 = -[BCSCircularEffectView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(BCSCircularEffectView *)v3 _buildRings];
    v5 = v4;
  }

  return v4;
}

- (void)_buildRings
{
  v50 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [MEMORY[0x263EFF980] array];
  circles = self->_circles;
  self->_circles = v3;

  [(BCSCircularEffectView *)self bounds];
  double v5 = CGRectGetWidth(v58) / 200.0;
  v6 = [MEMORY[0x263F82B60] mainScreen];
  [v6 scale];
  double v8 = v7;

  double v9 = 0.0;
  uint64_t v10 = 5;
  long long v48 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  long long v49 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  long long v46 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  long long v47 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  long long v44 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  long long v45 = *MEMORY[0x263F15740];
  long long v42 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  long long v43 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  long long v40 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v41 = *MEMORY[0x263F000D0];
  long long v39 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  uint64_t v11 = *MEMORY[0x263F15B90];
  do
  {
    v12 = [MEMORY[0x263F157E8] layer];
    [(BCSCircularEffectView *)self bounds];
    objc_msgSend(v12, "setBounds:");
    [(BCSCircularEffectView *)self bounds];
    double MidX = CGRectGetMidX(v59);
    [(BCSCircularEffectView *)self bounds];
    objc_msgSend(v12, "setPosition:", MidX, CGRectGetMidY(v60));
    v14 = [(BCSCircularEffectView *)self layer];
    [v14 addSublayer:v12];

    v15 = [MEMORY[0x263F157E8] layer];
    [(NSMutableArray *)self->_circles addObject:v15];
    v16 = objc_msgSend(NSString, "stringWithFormat:", @"Ring-%1lu", v10);
    id v17 = [MEMORY[0x263F827E8] imageNamed:v16 inBundle:v50];
    v18 = (CGImage *)[v17 CGImage];

    double v19 = (double)CGImageGetWidth(v18) / v8;
    [v15 setContents:v18];
    [v15 setContentsScale:v8];
    objc_msgSend(v15, "setBounds:", 0.0, 0.0, v19, v19);
    *(_OWORD *)&v56.m31 = v49;
    *(_OWORD *)&v56.m33 = v48;
    *(_OWORD *)&v56.m41 = v47;
    *(_OWORD *)&v56.m43 = v46;
    *(_OWORD *)&v56.m11 = v45;
    *(_OWORD *)&v56.m13 = v44;
    *(_OWORD *)&v56.m21 = v43;
    *(_OWORD *)&v56.m23 = v42;
    CATransform3DScale(&v57, &v56, 0.35, 0.35, 1.0);
    CATransform3D v55 = v57;
    [v15 setTransform:&v55];
    [(BCSCircularEffectView *)self bounds];
    double v20 = CGRectGetMidX(v61);
    [(BCSCircularEffectView *)self bounds];
    objc_msgSend(v15, "setPosition:", v20, CGRectGetMidY(v62));
    [v12 addSublayer:v15];
    *(_OWORD *)&v56.m11 = v41;
    *(_OWORD *)&v56.m13 = v40;
    *(_OWORD *)&v56.m21 = v39;
    CGAffineTransformScale(&v54, (CGAffineTransform *)&v56, v5, v5);
    CGAffineTransform v53 = v54;
    [v12 setAffineTransform:&v53];
    v21 = [MEMORY[0x263F157E8] layer];
    v22 = v21;
    if (v10 == 5) {
      double v23 = v19 * 0.85;
    }
    else {
      double v23 = v9;
    }
    objc_msgSend(v21, "setBounds:", 0.0, 0.0, v23, v23);
    [(BCSCircularEffectView *)self bounds];
    double v24 = CGRectGetMidX(v63);
    [(BCSCircularEffectView *)self bounds];
    objc_msgSend(v22, "setPosition:", v24, CGRectGetMidY(v64));
    id v25 = [MEMORY[0x263F825C8] whiteColor];
    objc_msgSend(v22, "setBackgroundColor:", objc_msgSend(v25, "CGColor"));

    v65.origin.x = 0.0;
    v65.origin.y = 0.0;
    v65.size.width = v23;
    v65.size.height = v23;
    [v22 setCornerRadius:CGRectGetWidth(v65) * 0.5];
    v26 = [MEMORY[0x263F157C8] filterWithType:v11];
    [v22 setCompositingFilter:v26];

    [v12 addSublayer:v22];
    double v9 = v19;
    --v10;
  }
  while (v10);
  v27 = [MEMORY[0x263F157E8] layer];
  centerRing = self->_centerRing;
  self->_centerRing = v27;

  id v29 = [MEMORY[0x263F827E8] imageNamed:@"Center-Glyph" inBundle:v50];
  v30 = (CGImage *)[v29 CGImage];

  double v31 = v5 * (double)CGImageGetWidth(v30) / v8;
  -[CALayer setBounds:](self->_centerRing, "setBounds:", 0.0, 0.0, v31, v31);
  [(CALayer *)self->_centerRing setCornerRadius:v31 * 0.5];
  [(BCSCircularEffectView *)self bounds];
  double v32 = CGRectGetMidX(v66);
  [(BCSCircularEffectView *)self bounds];
  -[CALayer setPosition:](self->_centerRing, "setPosition:", v32, CGRectGetMidY(v67));
  id v33 = [MEMORY[0x263F825C8] whiteColor];
  -[CALayer setBackgroundColor:](self->_centerRing, "setBackgroundColor:", [v33 CGColor]);

  v34 = [(BCSCircularEffectView *)self layer];
  [v34 addSublayer:self->_centerRing];

  v35 = [MEMORY[0x263F157E8] layer];
  [(CALayer *)v35 setContents:v30];
  [(CALayer *)v35 setContentsScale:v8];
  -[CALayer setBounds:](v35, "setBounds:", 0.0, 0.0, v31, v31);
  -[CALayer setPosition:](v35, "setPosition:", v31 * 0.5, v31 * 0.5);
  [(CALayer *)self->_centerRing addSublayer:v35];
  glyphLayer = self->_glyphLayer;
  self->_glyphLayer = v35;
  v37 = v35;

  CGAffineTransformMakeScale(&v52, 0.0, 0.0);
  v38 = self->_centerRing;
  CGAffineTransform v51 = v52;
  [(CALayer *)v38 setAffineTransform:&v51];
}

- (void)prepareCenterGlyphWithImage:(id)a3
{
  id v5 = a3;
  if (!self->_centerRingScaleAnimationStarted)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_centerGlyphImage, a3);
    id v5 = v6;
  }
}

- (void)animateCenterGlyphAndRings
{
  uint64_t v3 = [(NSMutableArray *)self->_circles count];
  uint64_t v4 = *MEMORY[0x263F15AB0];
  if (v3)
  {
    unint64_t v5 = 0;
    uint64_t v6 = *MEMORY[0x263F15EC0];
    do
    {
      double v7 = [MEMORY[0x263F15890] animationWithKeyPath:@"transform.scale"];
      [v7 setMass:1.0];
      [v7 setDamping:39.0];
      [v7 setStiffness:700.0];
      [v7 setFromValue:&unk_26FCC65C8];
      [v7 setToValue:&unk_26FCC6528];
      [v7 setDuration:0.39];
      [v7 setFillMode:v4];
      [v7 setRemovedOnCompletion:0];
      [v7 setBeginTime:CACurrentMediaTime() + 0.3675 + (double)v5 * 0.133];
      double v8 = [MEMORY[0x263F15808] functionWithName:v6];
      [v7 setTimingFunction:v8];

      double v9 = [(NSMutableArray *)self->_circles objectAtIndexedSubscript:v5];
      [v9 addAnimation:v7 forKey:@"tranform.scale"];

      ++v5;
    }
    while (v5 < [(NSMutableArray *)self->_circles count]);
  }
  id v11 = [MEMORY[0x263F15890] animationWithKeyPath:@"transform.scale"];
  [v11 setMass:1.0];
  [v11 setDamping:39.0];
  [v11 setStiffness:700.0];
  [v11 setFromValue:&unk_26FCC6540];
  [v11 setToValue:&unk_26FCC6528];
  [v11 setDuration:0.39];
  [v11 setBeginTime:CACurrentMediaTime() + 0.235];
  [v11 setFillMode:v4];
  [v11 setRemovedOnCompletion:0];
  uint64_t v10 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v11 setTimingFunction:v10];

  [v11 setDelegate:self];
  [(CALayer *)self->_centerRing addAnimation:v11 forKey:@"tranform.scale"];
}

- (void)animateRingsRotationWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16[0] = xmmword_248AEDC40;
  v16[1] = xmmword_248AEDC40;
  unint64_t v17 = 0xC03E000000000000;
  [MEMORY[0x263F158F8] begin];
  unint64_t v5 = (void *)MEMORY[0x263F158F8];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__BCSCircularEffectView_animateRingsRotationWithCompletion___block_invoke;
  v14[3] = &unk_26524C6B0;
  id v13 = v4;
  id v15 = v13;
  [v5 setCompletionBlock:v14];
  if ([(NSMutableArray *)self->_circles count])
  {
    unint64_t v6 = 0;
    uint64_t v7 = *MEMORY[0x263F15AA8];
    uint64_t v8 = *MEMORY[0x263F15EB8];
    do
    {
      double v9 = [MEMORY[0x263F15890] animationWithKeyPath:@"transform.rotation.z"];
      [v9 setMass:2.0];
      [v9 setDamping:50.0];
      [v9 setStiffness:300.0];
      [v9 setFromValue:&unk_26FCC6540];
      uint64_t v10 = [NSNumber numberWithDouble:*((double *)v16 + v6) / 180.0 * 3.14159265];
      [v9 setToValue:v10];

      [v9 setDuration:0.6];
      [v9 setFillMode:v7];
      [v9 setRemovedOnCompletion:0];
      id v11 = [MEMORY[0x263F15808] functionWithName:v8];
      [v9 setTimingFunction:v11];

      v12 = [(NSMutableArray *)self->_circles objectAtIndexedSubscript:v6];
      [v12 addAnimation:v9 forKey:@"transform.rotation.z"];

      ++v6;
    }
    while (v6 < [(NSMutableArray *)self->_circles count]);
  }
  [MEMORY[0x263F158F8] commit];
}

uint64_t __60__BCSCircularEffectView_animateRingsRotationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)revealCenterGlyphAndRings
{
  if ([(NSMutableArray *)self->_circles count])
  {
    unint64_t v3 = 0;
    long long v12 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    long long v13 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    long long v10 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    long long v11 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    long long v8 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    long long v9 = *MEMORY[0x263F15740];
    long long v6 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    long long v7 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    do
    {
      *(_OWORD *)&v17.m31 = v13;
      *(_OWORD *)&v17.m33 = v12;
      *(_OWORD *)&v17.m41 = v11;
      *(_OWORD *)&v17.m43 = v10;
      *(_OWORD *)&v17.m11 = v9;
      *(_OWORD *)&v17.m13 = v8;
      *(_OWORD *)&v17.m21 = v7;
      *(_OWORD *)&v17.m23 = v6;
      CATransform3DScale(&v18, &v17, 1.0, 1.0, 1.0);
      id v4 = [(NSMutableArray *)self->_circles objectAtIndexedSubscript:v3];
      CATransform3D v16 = v18;
      [v4 setTransform:&v16];

      ++v3;
    }
    while (v3 < [(NSMutableArray *)self->_circles count]);
  }
  CGAffineTransformMakeScale(&v15, 1.0, 1.0);
  centerRing = self->_centerRing;
  CGAffineTransform v14 = v15;
  [(CALayer *)centerRing setAffineTransform:&v14];
}

- (void)animationDidStart:(id)a3
{
  centerRing = self->_centerRing;
  id v5 = a3;
  id v6 = [(CALayer *)centerRing animationForKey:@"tranform.scale"];

  if (v6 == v5)
  {
    self->_centerRingScaleAnimationStarted = 1;
    if (self->_centerGlyphImage)
    {
      [MEMORY[0x263F158F8] begin];
      [MEMORY[0x263F158F8] setDisableActions:1];
      [(CALayer *)self->_glyphLayer setContents:[(UIImage *)self->_centerGlyphImage CGImage]];
      long long v7 = (void *)MEMORY[0x263F158F8];
      [v7 commit];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerGlyphImage, 0);
  objc_storeStrong((id *)&self->_glyphLayer, 0);
  objc_storeStrong((id *)&self->_centerRing, 0);

  objc_storeStrong((id *)&self->_circles, 0);
}

@end