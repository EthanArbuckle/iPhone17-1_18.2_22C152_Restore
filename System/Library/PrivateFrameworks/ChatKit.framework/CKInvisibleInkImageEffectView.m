@interface CKInvisibleInkImageEffectView
- (CAEmitterLayer)drawEmitterLayer;
- (CAEmitterLayer)dustEmitterLayer;
- (CALayer)blurredImageContainerLayer;
- (CALayer)blurredImageLayer;
- (CALayer)drawEmitterContainerLayer;
- (CALayer)dustEmitterContainerLayer;
- (CKInvisibleInkImageEffectView)initWithFrame:(CGRect)a3;
- (void)addDustRandomEmitterAnimationsWithSize:(CGSize)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)disableBlending;
- (void)enableBlending;
- (void)endDrawEmitterEffects;
- (void)endDustEmitterFingerEffects;
- (void)endEmittersForTouchesCancelled:(id)a3;
- (void)endEmittersForTouchesEnded:(id)a3;
- (void)layoutSubviews;
- (void)moveEmittersForTouchesBegan:(id)a3;
- (void)moveEmittersForTouchesMoved:(id)a3;
- (void)moveEmittersWithTouches:(id)a3;
- (void)reset;
- (void)setBlurredImageContainerLayer:(id)a3;
- (void)setBlurredImageLayer:(id)a3;
- (void)setDrawEmitterContainerLayer:(id)a3;
- (void)setDrawEmitterLayer:(id)a3;
- (void)setDustEmitterContainerLayer:(id)a3;
- (void)setDustEmitterLayer:(id)a3;
- (void)setImage:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setRandomAttractorsEnabled:(BOOL)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setupDrawEmitter;
- (void)setupDustEmitter;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation CKInvisibleInkImageEffectView

- (CKInvisibleInkImageEffectView)initWithFrame:(CGRect)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)CKInvisibleInkImageEffectView;
  v3 = -[CKInvisibleInkEffectView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F39BE8] layer];
    [(CKInvisibleInkImageEffectView *)v3 setBlurredImageContainerLayer:v4];

    v5 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v5 setValue:&unk_1EDF16CB8 forKey:@"inputRadius"];
    [v5 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputNormalizeEdges"];
    v6 = [MEMORY[0x1E4F39BE8] layer];
    [(CKInvisibleInkImageEffectView *)v3 setBlurredImageLayer:v6];

    uint64_t v7 = *MEMORY[0x1E4F3A3E0];
    v8 = [(CKInvisibleInkImageEffectView *)v3 blurredImageLayer];
    [v8 setContentsGravity:v7];

    v9 = [(CKInvisibleInkImageEffectView *)v3 blurredImageLayer];
    [v9 setShouldRasterize:1];

    v10 = [(CKInvisibleInkImageEffectView *)v3 blurredImageLayer];
    [v10 setRasterizationScale:0.5];

    v28[0] = v5;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    v12 = [(CKInvisibleInkImageEffectView *)v3 blurredImageLayer];
    [v12 setFilters:v11];

    v13 = [(CKInvisibleInkImageEffectView *)v3 blurredImageLayer];
    [v13 setMasksToBounds:1];

    [(CKInvisibleInkImageEffectView *)v3 setupDrawEmitter];
    [(CKInvisibleInkImageEffectView *)v3 setupDustEmitter];
    v14 = [(CKInvisibleInkImageEffectView *)v3 layer];
    v15 = [(CKInvisibleInkImageEffectView *)v3 blurredImageContainerLayer];
    [v14 addSublayer:v15];

    v16 = [(CKInvisibleInkImageEffectView *)v3 blurredImageContainerLayer];
    v17 = [(CKInvisibleInkImageEffectView *)v3 blurredImageLayer];
    [v16 addSublayer:v17];

    v18 = [(CKInvisibleInkImageEffectView *)v3 blurredImageContainerLayer];
    v19 = [(CKInvisibleInkImageEffectView *)v3 drawEmitterContainerLayer];
    [v18 addSublayer:v19];

    v20 = [(CKInvisibleInkImageEffectView *)v3 drawEmitterContainerLayer];
    v21 = [(CKInvisibleInkImageEffectView *)v3 drawEmitterLayer];
    [v20 addSublayer:v21];

    v22 = [(CKInvisibleInkImageEffectView *)v3 layer];
    v23 = [(CKInvisibleInkImageEffectView *)v3 dustEmitterContainerLayer];
    [v22 addSublayer:v23];

    v24 = [(CKInvisibleInkImageEffectView *)v3 dustEmitterContainerLayer];
    v25 = [(CKInvisibleInkImageEffectView *)v3 dustEmitterLayer];
    [v24 addSublayer:v25];
  }
  return v3;
}

- (void)setupDrawEmitter
{
  v33[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F39BE8] layer];
  [(CKInvisibleInkImageEffectView *)self setDrawEmitterContainerLayer:v3];

  v4 = [(CKInvisibleInkImageEffectView *)self drawEmitterContainerLayer];
  [v4 setMasksToBounds:1];

  v5 = [(CKInvisibleInkImageEffectView *)self drawEmitterContainerLayer];
  [v5 setRasterizationScale:0.25];

  v6 = [MEMORY[0x1E4F39BA8] emitterCell];
  id v7 = [MEMORY[0x1E4F42A80] ckImageNamed:@"blurLarge"];
  objc_msgSend(v6, "setContents:", objc_msgSend(v7, "CGImage"));

  LODWORD(v8) = 1114636288;
  [v6 setBirthRate:v8];
  [v6 setDuration:INFINITY];
  [v6 setEmissionRange:0.785398163];
  LODWORD(v9) = 2.0;
  [v6 setLifetime:v9];
  LODWORD(v10) = 2.0;
  [v6 setLifetimeRange:v10];
  [v6 setScale:4.4];
  [v6 setVelocityRange:45.0];
  [v6 setEmissionRange:0.785398163];
  [v6 setParticleType:*MEMORY[0x1E4F39F40]];
  [v6 setName:@"drawCell"];
  v11 = [MEMORY[0x1E4F39BA0] behaviorWithType:*MEMORY[0x1E4F39F18]];
  id v12 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:1.0];
  v33[0] = [v12 CGColor];
  id v13 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.0];
  v33[1] = [v13 CGColor];
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  [v11 setValue:v14 forKey:@"colors"];

  [v11 setValue:&unk_1EDF15CF8 forKey:@"locations"];
  v15 = [MEMORY[0x1E4F39BA0] behaviorWithType:*MEMORY[0x1E4F39F28]];
  [v15 setName:@"scaleBehavior"];
  [v15 setValue:@"scale" forKey:@"keyPath"];
  [v15 setValue:&unk_1EDF15D10 forKey:@"values"];
  [v15 setValue:&unk_1EDF15D28 forKey:@"locations"];
  v16 = [MEMORY[0x1E4F39BB0] layer];
  [(CKInvisibleInkImageEffectView *)self setDrawEmitterLayer:v16];

  v17 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
  [v17 setInheritsTiming:0];

  double v18 = CACurrentMediaTime();
  v19 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
  [v19 setBeginTime:v18];

  v20 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
  [v20 setLifetime:0.0];

  uint64_t v21 = *MEMORY[0x1E4F39F70];
  v22 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
  [v22 setEmitterMode:v21];

  v23 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
  [v23 setRenderMode:@"cheapAdditive"];

  v32 = v6;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v25 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
  [v25 setEmitterCells:v24];

  v31[0] = v11;
  v31[1] = v15;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  objc_super v27 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
  [v27 setEmitterBehaviors:v26];

  [(id)objc_opt_class() updateInterval];
  double v29 = v28;
  v30 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
  [v30 setUpdateInterval:v29];
}

- (void)setupDustEmitter
{
  v48[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F39BE8] layer];
  [(CKInvisibleInkImageEffectView *)self setDustEmitterContainerLayer:v3];

  v4 = [(CKInvisibleInkImageEffectView *)self dustEmitterContainerLayer];
  char v5 = 1;
  [v4 setMasksToBounds:1];

  v47 = self;
  v6 = [(CKInvisibleInkImageEffectView *)self dustEmitterContainerLayer];
  [v6 setAllowsGroupBlending:0];

  id v7 = [MEMORY[0x1E4F39BA8] emitterCell];
  id v8 = [MEMORY[0x1E4F42A80] ckImageNamed:@"speckle"];
  objc_msgSend(v7, "setContents:", objc_msgSend(v8, "CGImage"));

  LODWORD(v9) = 1150681088;
  [v7 setBirthRate:v9];
  [v7 setContentsScale:1.79999995];
  [v7 setEmissionRange:6.28318531];
  LODWORD(v10) = 1008981770;
  [v7 setMassRange:v10];
  LODWORD(v11) = 8.0;
  [v7 setLifetime:v11];
  [v7 setScale:0.5];
  [v7 setVelocityRange:0.0];
  [v7 setName:@"dustCell"];
  id v12 = [MEMORY[0x1E4F428B8] whiteColor];
  id v13 = [v12 colorWithAlphaComponent:0.0];
  objc_msgSend(v7, "setColor:", objc_msgSend(v13, "CGColor"));

  LODWORD(v14) = 1.0;
  [v7 setAlphaRange:v14];
  v46 = v7;
  [v7 setParticleType:*MEMORY[0x1E4F39F40]];
  v15 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v16 = *MEMORY[0x1E4F39F20];
  v17 = [MEMORY[0x1E4F39BA0] behaviorWithType:*MEMORY[0x1E4F39F20]];
  [v17 setName:@"fingerAttractor"];
  v45 = v17;
  [v15 addObject:v17];
  uint64_t v18 = *MEMORY[0x1E4F39F28];
  v19 = [MEMORY[0x1E4F39BA0] behaviorWithType:*MEMORY[0x1E4F39F28]];
  [v19 setName:@"alphaBehavior"];
  [v19 setValue:@"color.alpha" forKey:@"keyPath"];
  [v19 setValue:&unk_1EDF15D40 forKey:@"values"];
  [v19 setValue:MEMORY[0x1E4F1CC38] forKey:@"additive"];
  v44 = v19;
  [v15 addObject:v19];
  v20 = [MEMORY[0x1E4F39BA0] behaviorWithType:v18];
  [v20 setName:@"scaleBehavior"];
  [v20 setValue:@"scale" forKey:@"keyPath"];
  [v20 setValue:&unk_1EDF15D58 forKey:@"values"];
  [v20 setValue:&unk_1EDF15D70 forKey:@"locations"];
  v43 = v20;
  [v15 addObject:v20];
  uint64_t v21 = 0;
  double v22 = *MEMORY[0x1E4F1DAD8];
  double v23 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  do
  {
    char v24 = v5;
    v25 = objc_msgSend(NSString, "stringWithFormat:", @"randomAttractor%d", v21);
    v26 = [MEMORY[0x1E4F39BA0] behaviorWithType:v16];
    [v26 setName:v25];
    [v26 setValue:&unk_1EDF16D18 forKey:@"radius"];
    [v26 setValue:&unk_1EDF16D30 forKey:@"stiffness"];
    [v26 setValue:&unk_1EDF16D48 forKey:@"falloff"];
    objc_super v27 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v22, v23);
    [v26 setValue:v27 forKey:@"position"];

    [v15 addObject:v26];
    char v5 = 0;
    uint64_t v21 = 1;
  }
  while ((v24 & 1) != 0);
  double v28 = [MEMORY[0x1E4F39BB0] layer];
  [(CKInvisibleInkImageEffectView *)v47 setDustEmitterLayer:v28];

  double v29 = [(CKInvisibleInkImageEffectView *)v47 dustEmitterLayer];
  [v29 setInheritsTiming:0];

  double v30 = CACurrentMediaTime();
  v31 = [(CKInvisibleInkImageEffectView *)v47 dustEmitterLayer];
  [v31 setBeginTime:v30];

  v32 = [(CKInvisibleInkImageEffectView *)v47 dustEmitterLayer];
  [v32 setMasksToBounds:1];

  v48[0] = v46;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
  v34 = [(CKInvisibleInkImageEffectView *)v47 dustEmitterLayer];
  [v34 setEmitterCells:v33];

  v35 = [(CKInvisibleInkImageEffectView *)v47 dustEmitterLayer];
  [v35 setEmitterBehaviors:v15];

  uint64_t v36 = *MEMORY[0x1E4F39F78];
  v37 = [(CKInvisibleInkImageEffectView *)v47 dustEmitterLayer];
  [v37 setEmitterShape:v36];

  uint64_t v38 = *MEMORY[0x1E4F39F58];
  v39 = [(CKInvisibleInkImageEffectView *)v47 dustEmitterLayer];
  [v39 setRenderMode:v38];

  [(id)objc_opt_class() updateInterval];
  double v41 = v40;
  v42 = [(CKInvisibleInkImageEffectView *)v47 dustEmitterLayer];
  [v42 setUpdateInterval:v41];

  [(CKInvisibleInkImageEffectView *)v47 endDustEmitterFingerEffects];
}

- (void)addDustRandomEmitterAnimationsWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v33 = [MEMORY[0x1E4F39B48] animation];
  char v5 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v33 setTimingFunction:v5];

  [v33 setFromValue:&unk_1EDF16D60];
  [v33 setToValue:&unk_1EDF16D78];
  [v33 setDuration:2.0];
  LODWORD(v6) = 2139095040;
  [v33 setRepeatCount:v6];
  char v7 = 1;
  [v33 setAutoreverses:1];
  [v33 setRemovedOnCompletion:0];
  uint64_t v8 = *MEMORY[0x1E4F39FA0];
  [v33 setFillMode:*MEMORY[0x1E4F39FA0]];
  double v9 = [MEMORY[0x1E4F39BD8] animation];
  [v9 setCalculationMode:*MEMORY[0x1E4F39D78]];
  [v9 setDuration:3.0];
  LODWORD(v10) = 2139095040;
  [v9 setRepeatCount:v10];
  [v9 setAutoreverses:1];
  [v9 setRemovedOnCompletion:0];
  [v9 setFillMode:v8];
  uint64_t v11 = 0;
  double v12 = 0.5;
  uint64_t v31 = 0x400921FB54442D18;
  do
  {
    char v13 = v7;
    double v14 = objc_msgSend(NSString, "stringWithFormat:", @"emitterBehaviors.randomAttractor%d.falloff", v11, v31);
    [v33 setKeyPath:v14];

    v15 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
    uint64_t v16 = [v33 keyPath];
    [v15 addAnimation:v33 forKey:v16];

    double v34 = dbl_18F81DBE0[v11];
    double v35 = dbl_18F81DBC0[v11];
    int v17 = 36;
    uint64_t v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:36];
    double v19 = (double)(int)v11;
    double v20 = (double)(int)v11 * 0.1 + 0.3;
    double v21 = 0.0;
    do
    {
      double v22 = v21 * v12;
      double v23 = height;
      double v24 = v22 + v19;
      long double v25 = width * (v20 * cos(v35 * (v22 + v19) * 3.14159265) + 0.5);
      double v26 = v34 * v24;
      double height = v23;
      double v12 = 0.5;
      objc_super v27 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", (double)v25, (double)(height * (v20 * sin(v26 * 3.14159265) + 0.5)));
      [v18 addObject:v27];

      double v21 = v21 + 1.0;
      --v17;
    }
    while (v17);
    [v9 setValues:v18];
    double v28 = objc_msgSend(NSString, "stringWithFormat:", @"emitterBehaviors.randomAttractor%d.position", v11);
    [v9 setKeyPath:v28];

    double v29 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
    double v30 = [v9 keyPath];
    [v29 addAnimation:v9 forKey:v30];

    char v7 = 0;
    uint64_t v11 = 1;
  }
  while ((v13 & 1) != 0);
}

- (void)setImage:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKInvisibleInkImageEffectView;
  id v4 = a3;
  [(CKInvisibleInkEffectView *)&v8 setImage:v4];
  id v5 = v4;
  double v6 = objc_msgSend(v5, "CGImage", v8.receiver, v8.super_class);

  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  char v7 = [(CKInvisibleInkImageEffectView *)self blurredImageLayer];
  [v7 setContents:v6];

  [MEMORY[0x1E4F39CF8] commit];
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)CKInvisibleInkImageEffectView;
  [(CKInvisibleInkEffectView *)&v30 layoutSubviews];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(CKInvisibleInkImageEffectView *)self bounds];
  double v4 = v3;
  [(CKInvisibleInkImageEffectView *)self bounds];
  double v6 = v5;
  char v7 = [(CKInvisibleInkImageEffectView *)self blurredImageLayer];
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);

  objc_super v8 = [(CKInvisibleInkImageEffectView *)self blurredImageContainerLayer];
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v4, v6);

  v31.origin.double x = 0.0;
  v31.origin.double y = 0.0;
  v31.size.double width = v4;
  v31.size.double height = v6;
  CGRect v32 = CGRectInset(v31, -4.0, -4.0);
  double x = v32.origin.x;
  double y = v32.origin.y;
  double width = v32.size.width;
  double height = v32.size.height;
  char v13 = [(CKInvisibleInkImageEffectView *)self drawEmitterContainerLayer];
  objc_msgSend(v13, "setFrame:", x, y, width, height);

  v33.origin.double x = 0.0;
  v33.origin.double y = 0.0;
  v33.size.double width = v4;
  v33.size.double height = v6;
  CGRect v34 = CGRectOffset(v33, 4.0, 4.0);
  double v14 = v34.origin.x;
  double v15 = v34.origin.y;
  double v16 = v34.size.width;
  double v17 = v34.size.height;
  uint64_t v18 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
  objc_msgSend(v18, "setFrame:", v14, v15, v16, v17);

  double v19 = [(CKInvisibleInkImageEffectView *)self dustEmitterContainerLayer];
  objc_msgSend(v19, "setFrame:", 0.0, 0.0, v4, v6);

  double v20 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
  objc_msgSend(v20, "setFrame:", 0.0, 0.0, v4, v6);

  double v21 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
  objc_msgSend(v21, "setEmitterPosition:", v4 * 0.5, v6 * 0.5);

  double v22 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
  objc_msgSend(v22, "setEmitterSize:", v4, v6);

  v35.origin.double x = 0.0;
  v35.origin.double y = 0.0;
  v35.size.double width = v4;
  v35.size.double height = v6;
  CGRect v36 = CGRectInset(v35, -5.0, -5.0);
  double v23 = v36.origin.x;
  double v24 = v36.origin.y;
  double v25 = v36.size.width;
  double v26 = v36.size.height;
  objc_super v27 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
  objc_msgSend(v27, "setCullRect:", v23, v24, v25, v26);

  double v28 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
  double v29 = [NSNumber numberWithDouble:v4 * 1200.0 * v6 / 50000.0];
  [v28 setValue:v29 forKeyPath:@"emitterCells.dustCell.birthRate"];

  -[CKInvisibleInkImageEffectView addDustRandomEmitterAnimationsWithSize:](self, "addDustRandomEmitterAnimationsWithSize:", v4, v6);
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)enableBlending
{
  double v3 = [(CKInvisibleInkImageEffectView *)self drawEmitterContainerLayer];
  [v3 removeAnimationForKey:@"disableBlending"];

  uint64_t v4 = *MEMORY[0x1E4F3A098];
  double v5 = [(CKInvisibleInkImageEffectView *)self drawEmitterContainerLayer];
  [v5 setCompositingFilter:v4];

  double v6 = [(CKInvisibleInkImageEffectView *)self drawEmitterContainerLayer];
  [v6 setShouldRasterize:1];

  char v7 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
  [v7 setUpdateInterval:0.0];

  id v8 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
  [v8 setUpdateInterval:0.0];
}

- (void)disableBlending
{
  double v3 = [(CKInvisibleInkImageEffectView *)self drawEmitterContainerLayer];
  [v3 setCompositingFilter:0];

  uint64_t v4 = [(CKInvisibleInkImageEffectView *)self drawEmitterContainerLayer];
  [v4 setShouldRasterize:0];

  double v5 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
  [v5 setCompositingFilter:0];

  [(id)objc_opt_class() updateInterval];
  double v7 = v6;
  id v8 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
  [v8 setUpdateInterval:v7];

  id v9 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
  [v9 setUpdateInterval:v7];
}

- (void)endDrawEmitterEffects
{
  if (![(CKInvisibleInkEffectView *)self isSuspended])
  {
    double v3 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
    [v3 setLifetime:0.0];

    id v5 = [MEMORY[0x1E4F39B30] animation];
    [v5 setDuration:4.0];
    [v5 setDelegate:self];
    uint64_t v4 = [(CKInvisibleInkImageEffectView *)self drawEmitterContainerLayer];
    [v4 addAnimation:v5 forKey:@"disableBlending"];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4) {
    [(CKInvisibleInkImageEffectView *)self disableBlending];
  }
}

- (void)setRandomAttractorsEnabled:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 5;
  }
  else {
    uint64_t v4 = 0;
  }
  id v9 = [NSNumber numberWithInt:v4];
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"emitterBehaviors.randomAttractor%d.stiffness", 0);
  double v6 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
  [v6 setValue:v9 forKeyPath:v5];

  double v7 = objc_msgSend(NSString, "stringWithFormat:", @"emitterBehaviors.randomAttractor%d.stiffness", 1);
  id v8 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
  [v8 setValue:v9 forKeyPath:v7];
}

- (void)endDustEmitterFingerEffects
{
  double v3 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
  [v3 setValue:&unk_1EDF16CD0 forKeyPath:@"emitterBehaviors.fingerAttractor.stiffness"];

  uint64_t v4 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
  [v4 setValue:MEMORY[0x1E4F1CC28] forKeyPath:@"emitterBehaviors.fingerAttractor.enabled"];

  [(CKInvisibleInkImageEffectView *)self setRandomAttractorsEnabled:1];
}

- (void)moveEmittersWithTouches:(id)a3
{
  id v22 = a3;
  if (![(CKInvisibleInkEffectView *)self isSuspended])
  {
    uint64_t v4 = [v22 anyObject];
    [v4 locationInView:self];
    double v6 = v5;
    double v8 = v7;
    [v4 force];
    double v10 = fmin(fmax(v9 / 3.8, 0.0), 1.0);
    uint64_t v11 = [(CKInvisibleInkImageEffectView *)self traitCollection];
    uint64_t v12 = [v11 forceTouchCapability];

    if (v12 == 2) {
      double v13 = v10;
    }
    else {
      double v13 = 0.5;
    }
    double v14 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
    objc_msgSend(v14, "setEmitterPosition:", v6, v8);

    double v15 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
    double v16 = [NSNumber numberWithDouble:v13 * 130.0 + 190.0];
    [v15 setValue:v16 forKeyPath:@"emitterBehaviors.fingerAttractor.radius"];

    double v17 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
    uint64_t v18 = [NSNumber numberWithDouble:v13 * -65.0 + -95.0];
    [v17 setValue:v18 forKeyPath:@"emitterBehaviors.fingerAttractor.falloff"];

    double v19 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
    double v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v6, v8);
    [v19 setValue:v20 forKeyPath:@"emitterBehaviors.fingerAttractor.position"];

    double v21 = [(CKInvisibleInkEffectView *)self coverageTracker];
    objc_msgSend(v21, "recordTouchAtPoint:", v6, v8);
  }
}

- (void)moveEmittersForTouchesBegan:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F39CF8];
  id v5 = a3;
  [v4 begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  LODWORD(v4) = CKIsRunningInMacCatalyst();
  double v6 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
  double v7 = v6;
  LODWORD(v8) = 3.0;
  if (!v4) {
    *(float *)&double v8 = 1.0;
  }
  [v6 setLifetime:v8];

  double v9 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
  [v9 setValue:&unk_1EDF16D90 forKeyPath:@"emitterBehaviors.fingerAttractor.stiffness"];

  double v10 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
  [v10 setValue:MEMORY[0x1E4F1CC38] forKeyPath:@"emitterBehaviors.fingerAttractor.enabled"];

  [(CKInvisibleInkImageEffectView *)self setRandomAttractorsEnabled:0];
  [(CKInvisibleInkImageEffectView *)self enableBlending];
  [(CKInvisibleInkImageEffectView *)self moveEmittersWithTouches:v5];

  uint64_t v11 = (void *)MEMORY[0x1E4F39CF8];

  [v11 commit];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CKInvisibleInkImageEffectView;
  id v6 = a3;
  [(CKInvisibleInkImageEffectView *)&v7 touchesMoved:v6 withEvent:a4];
  -[CKInvisibleInkImageEffectView moveEmittersForTouchesMoved:](self, "moveEmittersForTouchesMoved:", v6, v7.receiver, v7.super_class);
}

- (void)moveEmittersForTouchesMoved:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F39CF8];
  id v5 = a3;
  [v4 begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(CKInvisibleInkImageEffectView *)self moveEmittersWithTouches:v5];

  id v6 = (void *)MEMORY[0x1E4F39CF8];

  [v6 commit];
}

- (void)endEmittersForTouchesEnded:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F39CF8], "begin", a3);
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(CKInvisibleInkImageEffectView *)self endDrawEmitterEffects];
  [(CKInvisibleInkImageEffectView *)self endDustEmitterFingerEffects];
  uint64_t v4 = (void *)MEMORY[0x1E4F39CF8];

  [v4 commit];
}

- (void)endEmittersForTouchesCancelled:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F39CF8], "begin", a3);
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(CKInvisibleInkImageEffectView *)self endDrawEmitterEffects];
  [(CKInvisibleInkImageEffectView *)self endDustEmitterFingerEffects];
  uint64_t v4 = (void *)MEMORY[0x1E4F39CF8];

  [v4 commit];
}

- (void)reset
{
  v13.receiver = self;
  v13.super_class = (Class)CKInvisibleInkImageEffectView;
  [(CKInvisibleInkEffectView *)&v13 reset];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  double v3 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
  [v3 setLifetime:0.0];

  uint64_t v4 = [(CKInvisibleInkImageEffectView *)self drawEmitterContainerLayer];
  [v4 removeAnimationForKey:@"disableBlending"];

  [(CKInvisibleInkImageEffectView *)self disableBlending];
  [(CKInvisibleInkImageEffectView *)self endDustEmitterFingerEffects];
  id v5 = [(CKInvisibleInkImageEffectView *)self layer];
  [v5 convertTime:0 fromLayer:CACurrentMediaTime()];
  double v7 = v6;
  double v8 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
  [v8 setBeginTime:v7];

  double v9 = [(CKInvisibleInkImageEffectView *)self layer];
  [v9 convertTime:0 fromLayer:CACurrentMediaTime()];
  double v11 = v10;
  uint64_t v12 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
  [v12 setBeginTime:v11];

  [MEMORY[0x1E4F39CF8] commit];
  [(CKInvisibleInkImageEffectView *)self setNeedsLayout];
}

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CKInvisibleInkEffectView *)self isSuspended];
  v37.receiver = self;
  v37.super_class = (Class)CKInvisibleInkImageEffectView;
  [(CKInvisibleInkEffectView *)&v37 setSuspended:v3];
  if (v5 != v3)
  {
    BOOL v6 = !v3;
    [(CKInvisibleInkImageEffectView *)self setUserInteractionEnabled:v3 ^ 1];
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    double v7 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
    double v8 = v7;
    if (v6)
    {
      [v7 setValue:MEMORY[0x1E4F1CC28] forKeyPath:@"emitterBehaviors.fingerAttractor.enabled"];

      objc_super v27 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
      LODWORD(v28) = 1.0;
      [v27 setBirthRate:v28];

      double v23 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"birthRate"];
      [v23 setDuration:1.0];
      uint64_t v29 = *MEMORY[0x1E4F3A490];
      objc_super v30 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
      [v23 setTimingFunction:v30];

      [v23 setFromValue:&unk_1EDF16CD0];
      [v23 setToValue:&unk_1EDF16CE8];
      CGRect v31 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
      CGRect v32 = [v23 keyPath];
      [v31 addAnimation:v23 forKey:v32];

      [(CKInvisibleInkImageEffectView *)self setRandomAttractorsEnabled:1];
      CGRect v33 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
      [v33 setValue:&unk_1EDF15DA0 forKeyPath:@"emitterBehaviors.scaleBehavior.values"];

      double v25 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"emitterBehaviors.scaleBehavior.values.@index(1)"];
      [v25 setDuration:2.0];
      CGRect v34 = [MEMORY[0x1E4F39C10] functionWithName:v29];
      [v25 setTimingFunction:v34];

      [v25 setFromValue:&unk_1EDF177A8];
      [v25 setToValue:&unk_1EDF17798];
      CGRect v35 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
      CGRect v36 = [v25 keyPath];
      [v35 addAnimation:v25 forKey:v36];

      [(CKInvisibleInkImageEffectView *)self endDrawEmitterEffects];
    }
    else
    {
      [v7 setValue:MEMORY[0x1E4F1CC38] forKeyPath:@"emitterBehaviors.fingerAttractor.enabled"];

      double v9 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
      [v9 setValue:&unk_1EDF16D30 forKeyPath:@"emitterBehaviors.fingerAttractor.stiffness"];

      double v10 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
      [v10 setValue:&unk_1EDF16DA8 forKeyPath:@"emitterBehaviors.fingerAttractor.radius"];

      double v11 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
      [v11 setValue:&unk_1EDF16DC0 forKeyPath:@"emitterBehaviors.fingerAttractor.falloff"];

      [(CKInvisibleInkImageEffectView *)self bounds];
      double v13 = v12 * 0.5;
      [(CKInvisibleInkImageEffectView *)self bounds];
      double v15 = v14 * 0.5;
      double v16 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
      double v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v13, v15);
      [v16 setValue:v17 forKeyPath:@"emitterBehaviors.fingerAttractor.position"];

      uint64_t v18 = [(CKInvisibleInkImageEffectView *)self dustEmitterLayer];
      [v18 setBirthRate:0.0];

      [(CKInvisibleInkImageEffectView *)self setRandomAttractorsEnabled:0];
      double v19 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
      objc_msgSend(v19, "setEmitterPosition:", v13, v15);

      double v20 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
      LODWORD(v21) = 1.0;
      [v20 setLifetime:v21];

      id v22 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
      [v22 setValue:&unk_1EDF15D88 forKeyPath:@"emitterBehaviors.scaleBehavior.values"];

      double v23 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"emitterBehaviors.scaleBehavior.values.@index(1)"];
      [v23 setDuration:1.0];
      double v24 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
      [v23 setTimingFunction:v24];

      [v23 setFromValue:&unk_1EDF17798];
      [v23 setToValue:&unk_1EDF177A8];
      double v25 = [(CKInvisibleInkImageEffectView *)self drawEmitterLayer];
      double v26 = [v23 keyPath];
      [v25 addAnimation:v23 forKey:v26];
    }
    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CKInvisibleInkEffectView *)self isPaused];
  v19.receiver = self;
  v19.super_class = (Class)CKInvisibleInkImageEffectView;
  [(CKInvisibleInkEffectView *)&v19 setPaused:v3];
  if (v5 != v3)
  {
    [MEMORY[0x1E4F39CF8] begin];
    BOOL v6 = [(CKInvisibleInkImageEffectView *)self layer];
    double v8 = v6;
    if (v3)
    {
      [v6 setSpeed:0.0];

      double v9 = [(CKInvisibleInkImageEffectView *)self layer];
      double v10 = [(CKInvisibleInkImageEffectView *)self layer];
      double v11 = [v10 superlayer];
      [v11 convertTime:0 fromLayer:CACurrentMediaTime()];
      double v13 = v12;
      [v9 timeOffset];
      double v15 = v13 + v14;
    }
    else
    {
      LODWORD(v7) = 1.0;
      [v6 setSpeed:v7];

      double v9 = [(CKInvisibleInkImageEffectView *)self layer];
      double v10 = [(CKInvisibleInkImageEffectView *)self layer];
      double v11 = [v10 superlayer];
      [v11 convertTime:0 fromLayer:CACurrentMediaTime()];
      double v17 = v16;
      [v9 timeOffset];
      double v15 = v18 - v17;
    }
    [v9 setTimeOffset:v15];

    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (CALayer)blurredImageLayer
{
  return self->_blurredImageLayer;
}

- (void)setBlurredImageLayer:(id)a3
{
}

- (CALayer)blurredImageContainerLayer
{
  return self->_blurredImageContainerLayer;
}

- (void)setBlurredImageContainerLayer:(id)a3
{
}

- (CALayer)drawEmitterContainerLayer
{
  return self->_drawEmitterContainerLayer;
}

- (void)setDrawEmitterContainerLayer:(id)a3
{
}

- (CAEmitterLayer)drawEmitterLayer
{
  return self->_drawEmitterLayer;
}

- (void)setDrawEmitterLayer:(id)a3
{
}

- (CALayer)dustEmitterContainerLayer
{
  return self->_dustEmitterContainerLayer;
}

- (void)setDustEmitterContainerLayer:(id)a3
{
}

- (CAEmitterLayer)dustEmitterLayer
{
  return self->_dustEmitterLayer;
}

- (void)setDustEmitterLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dustEmitterLayer, 0);
  objc_storeStrong((id *)&self->_dustEmitterContainerLayer, 0);
  objc_storeStrong((id *)&self->_drawEmitterLayer, 0);
  objc_storeStrong((id *)&self->_drawEmitterContainerLayer, 0);
  objc_storeStrong((id *)&self->_blurredImageContainerLayer, 0);

  objc_storeStrong((id *)&self->_blurredImageLayer, 0);
}

@end