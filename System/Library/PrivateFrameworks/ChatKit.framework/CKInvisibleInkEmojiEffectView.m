@interface CKInvisibleInkEmojiEffectView
- (BOOL)blendingEnabled;
- (CAEmitterLayer)drawEmitterLayer;
- (CAEmitterLayer)dustEmitterLayer;
- (CALayer)blurredEmojiLayer;
- (CALayer)dustContainerLayer;
- (CALayer)emojiContainerLayer;
- (CALayer)emojiLayer;
- (CALayer)maskLayer;
- (CKInvisibleInkEmojiEffectView)initWithFrame:(CGRect)a3;
- (UITextView)textView;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)attachToBalloonView:(id)a3;
- (void)createDrawEmitter;
- (void)createDustEmitter;
- (void)detachFromBalloonView;
- (void)disableBlending;
- (void)displayLayer:(id)a3;
- (void)enableBlending;
- (void)endDrawEmitterEffects;
- (void)endDustEmitterLayerFingerEffects;
- (void)endTouches;
- (void)layoutSubviews;
- (void)moveEmittersForTouchesBegan:(id)a3;
- (void)moveEmittersForTouchesMoved:(id)a3;
- (void)moveEmittersWithTouches:(id)a3;
- (void)reset;
- (void)setBlendingEnabled:(BOOL)a3;
- (void)setBlurredEmojiLayer:(id)a3;
- (void)setDrawEmitterLayer:(id)a3;
- (void)setDustContainerLayer:(id)a3;
- (void)setDustEmitterLayer:(id)a3;
- (void)setEmojiContainerLayer:(id)a3;
- (void)setEmojiLayer:(id)a3;
- (void)setMaskLayer:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setTextView:(id)a3;
@end

@implementation CKInvisibleInkEmojiEffectView

- (CKInvisibleInkEmojiEffectView)initWithFrame:(CGRect)a3
{
  v44[1] = *MEMORY[0x1E4F143B8];
  v43.receiver = self;
  v43.super_class = (Class)CKInvisibleInkEmojiEffectView;
  v3 = -[CKInvisibleInkEffectView initWithFrame:](&v43, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CKInvisibleInkEmojiEffectView *)v3 createDrawEmitter];
    v5 = [MEMORY[0x1E4F39BE8] layer];
    [(CKInvisibleInkEmojiEffectView *)v4 setEmojiContainerLayer:v5];

    v6 = [(CKInvisibleInkEmojiEffectView *)v4 emojiContainerLayer];
    [v6 setMasksToBounds:1];

    v7 = [(CKInvisibleInkEmojiEffectView *)v4 emojiContainerLayer];
    [v7 setHidden:1];

    v8 = [MEMORY[0x1E4F39BE8] layer];
    [(CKInvisibleInkEmojiEffectView *)v4 setEmojiLayer:v8];

    v9 = [(CKInvisibleInkEmojiEffectView *)v4 emojiContainerLayer];
    v10 = [(CKInvisibleInkEmojiEffectView *)v4 emojiLayer];
    [v9 addSublayer:v10];

    v11 = [(CKInvisibleInkEmojiEffectView *)v4 emojiContainerLayer];
    v12 = [(CKInvisibleInkEmojiEffectView *)v4 drawEmitterLayer];
    [v11 addSublayer:v12];

    v13 = [(CKInvisibleInkEmojiEffectView *)v4 layer];
    v14 = [(CKInvisibleInkEmojiEffectView *)v4 emojiContainerLayer];
    [v13 addSublayer:v14];

    [(CKInvisibleInkEmojiEffectView *)v4 createDustEmitter];
    v15 = [MEMORY[0x1E4F39BE8] layer];
    [(CKInvisibleInkEmojiEffectView *)v4 setDustContainerLayer:v15];

    v16 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v16 setValue:&unk_1EDF15EC0 forKey:@"inputRadius"];
    [v16 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputNormalizeEdges"];
    v17 = [MEMORY[0x1E4F39BE8] layer];
    [(CKInvisibleInkEmojiEffectView *)v4 setBlurredEmojiLayer:v17];

    v18 = [(CKInvisibleInkEmojiEffectView *)v4 blurredEmojiLayer];
    [v18 setShouldRasterize:1];

    v19 = [(CKInvisibleInkEmojiEffectView *)v4 blurredEmojiLayer];
    [v19 setRasterizationScale:0.5];

    v44[0] = v16;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
    v21 = [(CKInvisibleInkEmojiEffectView *)v4 blurredEmojiLayer];
    [v21 setFilters:v20];

    v22 = [(CKInvisibleInkEmojiEffectView *)v4 blurredEmojiLayer];
    [v22 setMasksToBounds:1];

    uint64_t v23 = *MEMORY[0x1E4F3A308];
    v24 = [(CKInvisibleInkEmojiEffectView *)v4 blurredEmojiLayer];
    [v24 setCompositingFilter:v23];

    v25 = [MEMORY[0x1E4F39BE8] layer];
    [(CKInvisibleInkEmojiEffectView *)v4 setMaskLayer:v25];

    v26 = [(CKInvisibleInkEmojiEffectView *)v4 maskLayer];
    [v26 setShouldRasterize:1];

    v27 = [MEMORY[0x1E4F42D90] mainScreen];
    [v27 scale];
    double v29 = v28;
    v30 = [(CKInvisibleInkEmojiEffectView *)v4 maskLayer];
    [v30 setRasterizationScale:v29];

    uint64_t v31 = *MEMORY[0x1E4F3A090];
    v32 = [(CKInvisibleInkEmojiEffectView *)v4 maskLayer];
    [v32 setCompositingFilter:v31];

    v33 = [(CKInvisibleInkEmojiEffectView *)v4 maskLayer];
    [v33 setMasksToBounds:1];

    v34 = [(CKInvisibleInkEmojiEffectView *)v4 dustEmitterLayer];
    v35 = [(CKInvisibleInkEmojiEffectView *)v4 blurredEmojiLayer];
    [v34 addSublayer:v35];

    v36 = [(CKInvisibleInkEmojiEffectView *)v4 dustContainerLayer];
    v37 = [(CKInvisibleInkEmojiEffectView *)v4 dustEmitterLayer];
    [v36 addSublayer:v37];

    v38 = [(CKInvisibleInkEmojiEffectView *)v4 dustContainerLayer];
    v39 = [(CKInvisibleInkEmojiEffectView *)v4 maskLayer];
    [v38 addSublayer:v39];

    v40 = [(CKInvisibleInkEmojiEffectView *)v4 layer];
    v41 = [(CKInvisibleInkEmojiEffectView *)v4 dustContainerLayer];
    [v40 addSublayer:v41];
  }
  return v4;
}

- (void)createDustEmitter
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v3 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
  [v3 setMasksToBounds:1];

  v4 = [MEMORY[0x1E4F39BA8] emitterCell];
  id v5 = [MEMORY[0x1E4F42A80] ckImageNamed:@"speckle"];
  objc_msgSend(v4, "setContents:", objc_msgSend(v5, "CGImage"));

  [v4 setContentsScale:1.79999995];
  [v4 setEmissionRange:6.28318531];
  LODWORD(v6) = 1008981770;
  [v4 setMassRange:v6];
  LODWORD(v7) = 8.0;
  [v4 setLifetime:v7];
  [v4 setScale:0.5];
  [v4 setVelocityRange:20.0];
  [v4 setName:@"dustCell"];
  v8 = [MEMORY[0x1E4F428B8] whiteColor];
  id v9 = [v8 colorWithAlphaComponent:0.0];
  objc_msgSend(v4, "setColor:", objc_msgSend(v9, "CGColor"));

  LODWORD(v10) = 1.0;
  [v4 setAlphaRange:v10];
  [v4 setParticleType:*MEMORY[0x1E4F39F40]];
  v11 = [MEMORY[0x1E4F1CA48] array];
  v12 = [MEMORY[0x1E4F39BA0] behaviorWithType:*MEMORY[0x1E4F39F28]];
  [v12 setName:@"alphaBehavior"];
  [v12 setValue:@"color.alpha" forKey:@"keyPath"];
  [v12 setValue:&unk_1EDF15038 forKey:@"values"];
  [v12 setValue:MEMORY[0x1E4F1CC38] forKey:@"additive"];
  [v11 addObject:v12];
  v13 = [MEMORY[0x1E4F39BA0] behaviorWithType:*MEMORY[0x1E4F39F10]];
  [v13 setValue:&unk_1EDF16F28 forKey:@"orientationLongitude"];
  [v13 setValue:&unk_1EDF16F38 forKey:@"orientationLatitude"];
  [v13 setName:@"fingerAttractor"];
  [v11 addObject:v13];
  v14 = [MEMORY[0x1E4F39BB0] layer];
  [(CKInvisibleInkEmojiEffectView *)self setDustEmitterLayer:v14];

  v15 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
  [v15 setMasksToBounds:1];

  v24[0] = v4;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v17 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
  [v17 setEmitterCells:v16];

  v18 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
  [v18 setEmitterBehaviors:v11];

  uint64_t v19 = *MEMORY[0x1E4F39F78];
  v20 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
  [v20 setEmitterShape:v19];

  [(id)objc_opt_class() updateInterval];
  double v22 = v21;
  uint64_t v23 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
  [v23 setUpdateInterval:v22];

  [(CKInvisibleInkEmojiEffectView *)self endDustEmitterLayerFingerEffects];
}

- (void)createDrawEmitter
{
  v29[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F39BA8] emitterCell];
  id v4 = [MEMORY[0x1E4F42A80] ckImageNamed:@"blurLarge"];
  objc_msgSend(v3, "setContents:", objc_msgSend(v4, "CGImage"));

  LODWORD(v5) = 1114636288;
  [v3 setBirthRate:v5];
  [v3 setDuration:INFINITY];
  LODWORD(v6) = 6.0;
  [v3 setLifetime:v6];
  LODWORD(v7) = 1.0;
  [v3 setLifetimeRange:v7];
  [v3 setParticleType:*MEMORY[0x1E4F39F40]];
  [v3 setOrientationLongitude:3.14159265];
  [v3 setOrientationLatitude:0.0];
  [v3 setEmissionRange:0.0];
  [v3 setScale:1.0];
  [v3 setVelocityRange:10.0];
  v8 = [MEMORY[0x1E4F39BA0] behaviorWithType:*MEMORY[0x1E4F39F18]];
  id v9 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:1.0];
  v29[0] = [v9 CGColor];
  id v10 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.0];
  v29[1] = [v10 CGColor];
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  [v8 setValue:v11 forKey:@"colors"];

  [v8 setValue:&unk_1EDF15050 forKey:@"locations"];
  v12 = [MEMORY[0x1E4F39BA0] behaviorWithType:*MEMORY[0x1E4F39F28]];
  [v12 setName:@"scaleBehavior"];
  [v12 setValue:@"scale" forKey:@"keyPath"];
  [v12 setValue:&unk_1EDF15068 forKey:@"values"];
  [v12 setValue:&unk_1EDF15080 forKey:@"locations"];
  v13 = [MEMORY[0x1E4F39BB0] layer];
  [(CKInvisibleInkEmojiEffectView *)self setDrawEmitterLayer:v13];

  v14 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
  [v14 setLifetime:0.0];

  v15 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
  [v15 setMasksToBounds:1];

  uint64_t v16 = *MEMORY[0x1E4F39F70];
  v17 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
  [v17 setEmitterMode:v16];

  double v28 = v3;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  uint64_t v19 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
  [v19 setEmitterCells:v18];

  v27[0] = v8;
  v27[1] = v12;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  double v21 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
  [v21 setEmitterBehaviors:v20];

  [(id)objc_opt_class() updateInterval];
  double v23 = v22;
  v24 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
  [v24 setUpdateInterval:v23];

  v25 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
  [v25 setShouldRasterize:1];

  v26 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
  [v26 setRasterizationScale:0.25];
}

- (void)layoutSubviews
{
  v42.receiver = self;
  v42.super_class = (Class)CKInvisibleInkEmojiEffectView;
  [(CKInvisibleInkEffectView *)&v42 layoutSubviews];
  v3 = [(CKInvisibleInkEmojiEffectView *)self textView];
  id v4 = [v3 layer];
  double v5 = [(CKInvisibleInkEmojiEffectView *)self textView];
  double v6 = [v5 layer];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(CKInvisibleInkEmojiEffectView *)self layer];
  objc_msgSend(v4, "convertRect:toLayer:", v15, v8, v10, v12, v14);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  v24 = [(CKInvisibleInkEmojiEffectView *)self emojiContainerLayer];
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

  v25 = [(CKInvisibleInkEmojiEffectView *)self dustContainerLayer];
  objc_msgSend(v25, "setFrame:", v17, v19, v21, v23);

  double v26 = *MEMORY[0x1E4F1DAD8];
  double v27 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v28 = [(CKInvisibleInkEmojiEffectView *)self emojiLayer];
  objc_msgSend(v28, "setFrame:", v26, v27, v21, v23);

  v43.origin.double x = v26;
  v43.origin.double y = v27;
  v43.size.double width = v21;
  v43.size.double height = v23;
  CGRect v44 = CGRectInset(v43, -4.0, -4.0);
  double x = v44.origin.x;
  double y = v44.origin.y;
  double width = v44.size.width;
  double height = v44.size.height;
  v33 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
  objc_msgSend(v33, "setFrame:", x, y, width, height);

  v34 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
  objc_msgSend(v34, "setFrame:", v26, v27, v21, v23);

  v35 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
  objc_msgSend(v35, "setEmitterPosition:", v21 * 0.5, v23 * 0.5);

  v36 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
  objc_msgSend(v36, "setEmitterSize:", v21, v23);

  v37 = [(CKInvisibleInkEmojiEffectView *)self blurredEmojiLayer];
  objc_msgSend(v37, "setFrame:", v26, v27, v21, v23);

  v38 = [(CKInvisibleInkEmojiEffectView *)self maskLayer];
  objc_msgSend(v38, "setFrame:", v26, v27, v21, v23);

  v39 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
  v40 = [NSNumber numberWithDouble:v23 * (v21 * 0.09)];
  [v39 setValue:v40 forKeyPath:@"emitterCells.dustCell.birthRate"];

  v41 = [(CKInvisibleInkEmojiEffectView *)self layer];
  [v41 setNeedsDisplay];
}

- (void)displayLayer:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = [(CKInvisibleInkEmojiEffectView *)self textView];
  [v4 setNeedsDisplay];

  double v5 = [(CKInvisibleInkEmojiEffectView *)self textView];
  [v5 forceDisplayIfNeeded];

  double v6 = [(CKInvisibleInkEmojiEffectView *)self textView];
  double v7 = [v6 attributedText];

  double v8 = +[CKUIBehavior sharedBehaviors];
  v32 = v8;
  v33 = v7;
  switch(objc_msgSend(v7, "__ck_bigEmojiStyle"))
  {
    case 0:
      uint64_t v9 = [v8 balloonTextFont];
      goto LABEL_7;
    case 1:
      uint64_t v9 = [v8 singleBigEmojiFont];
      goto LABEL_7;
    case 2:
      uint64_t v9 = [v8 multipleBigEmojiFont];
      goto LABEL_7;
    case 3:
      uint64_t v9 = [v8 singleBigAssetFont];
LABEL_7:
      double v10 = (void *)v9;
      break;
    default:
      double v10 = 0;
      break;
  }
  double v11 = [(CKInvisibleInkEmojiEffectView *)self textView];
  uint64_t v31 = v10;
  [v11 setFont:v10];

  double v12 = [MEMORY[0x1E4F42A60] preferredFormat];
  [v12 setScale:0.0];
  [v12 setPreferredRange:0];
  [v12 setOpaque:0];
  id v13 = objc_alloc(MEMORY[0x1E4F42A58]);
  double v14 = [(CKInvisibleInkEmojiEffectView *)self textView];
  [v14 bounds];
  double v17 = objc_msgSend(v13, "initWithSize:format:", v12, v15, v16);

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __46__CKInvisibleInkEmojiEffectView_displayLayer___block_invoke;
  v38[3] = &unk_1E5620DE8;
  v38[4] = self;
  v30 = v17;
  double v18 = [v17 imageWithActions:v38];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  double v19 = [(CKInvisibleInkEmojiEffectView *)self emojiLayer];
  v39[0] = v19;
  double v20 = [(CKInvisibleInkEmojiEffectView *)self blurredEmojiLayer];
  v39[1] = v20;
  double v21 = [(CKInvisibleInkEmojiEffectView *)self maskLayer];
  v39[2] = v21;
  double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v35;
    uint64_t v26 = *MEMORY[0x1E4F3A3F8];
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(v22);
        }
        double v28 = *(void **)(*((void *)&v34 + 1) + 8 * v27);
        objc_msgSend(v28, "setContents:", objc_msgSend(v18, "CGImage"));
        [v28 setContentsGravity:v26];
        double v29 = [MEMORY[0x1E4F42D90] mainScreen];
        [v29 scale];
        objc_msgSend(v28, "setContentsScale:");

        ++v27;
      }
      while (v24 != v27);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v24);
  }
}

void __46__CKInvisibleInkEmojiEffectView_displayLayer___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "textView", 0);
  v2 = [v1 subviews];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    CGFloat v6 = *MEMORY[0x1E4F1DB28];
    CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        double v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v11 frame];
        v20.origin.double x = v6;
        v20.origin.double y = v7;
        v20.size.double width = v8;
        v20.size.double height = v9;
        if (!CGRectEqualToRect(v19, v20))
        {
          double v12 = [v11 layer];
          [v12 renderInContext:UIGraphicsGetCurrentContext()];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

- (void)attachToBalloonView:(id)a3
{
  uint64_t v4 = [a3 textView];
  [(CKInvisibleInkEmojiEffectView *)self setTextView:v4];

  id v6 = [(CKInvisibleInkEmojiEffectView *)self textView];
  uint64_t v5 = [v6 layer];
  [v5 setOpacity:0.0];
}

- (void)detachFromBalloonView
{
  uint64_t v3 = [(CKInvisibleInkEmojiEffectView *)self textView];
  uint64_t v4 = [v3 layer];
  LODWORD(v5) = 1.0;
  [v4 setOpacity:v5];

  [(CKInvisibleInkEmojiEffectView *)self setTextView:0];
}

- (void)enableBlending
{
  uint64_t v3 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
  [v3 removeAnimationForKey:@"disableBlending"];

  uint64_t v4 = *MEMORY[0x1E4F3A298];
  double v5 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
  [v5 setCompositingFilter:v4];

  id v6 = [(CKInvisibleInkEmojiEffectView *)self emojiContainerLayer];
  [v6 setHidden:0];

  CGFloat v7 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
  [v7 setUpdateInterval:0.0];

  id v8 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
  [v8 setUpdateInterval:0.0];
}

- (void)disableBlending
{
  uint64_t v3 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
  [v3 setCompositingFilter:0];

  uint64_t v4 = [(CKInvisibleInkEmojiEffectView *)self emojiContainerLayer];
  [v4 setHidden:1];

  [(id)objc_opt_class() updateInterval];
  double v6 = v5;
  CGFloat v7 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
  [v7 setUpdateInterval:v6];

  id v8 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
  [v8 setUpdateInterval:v6];
}

- (void)endDrawEmitterEffects
{
  if (![(CKInvisibleInkEffectView *)self isSuspended])
  {
    uint64_t v3 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
    [v3 setLifetime:0.0];

    if (![(CKInvisibleInkEffectView *)self isSuspended])
    {
      id v5 = [MEMORY[0x1E4F39B30] animation];
      [v5 setDuration:7.0];
      [v5 setDelegate:self];
      uint64_t v4 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
      [v4 addAnimation:v5 forKey:@"disableBlending"];
    }
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4) {
    [(CKInvisibleInkEmojiEffectView *)self disableBlending];
  }
}

- (void)reset
{
  v4.receiver = self;
  v4.super_class = (Class)CKInvisibleInkEmojiEffectView;
  [(CKInvisibleInkEffectView *)&v4 reset];
  uint64_t v3 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
  [v3 removeAnimationForKey:@"disableBlending"];

  [(CKInvisibleInkEmojiEffectView *)self disableBlending];
  [(CKInvisibleInkEmojiEffectView *)self setNeedsLayout];
}

- (void)moveEmittersWithTouches:(id)a3
{
  id v25 = [a3 anyObject];
  [v25 locationInView:self];
  double v5 = v4;
  double v7 = v6;
  id v8 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
  objc_msgSend(v8, "setEmitterPosition:", v5, v7);

  [v25 force];
  double v10 = fmin(fmax(v9 / 3.8, 0.0), 1.0);
  double v11 = [(CKInvisibleInkEmojiEffectView *)self traitCollection];
  uint64_t v12 = [v11 forceTouchCapability];

  double v13 = 0.5;
  if (v12 == 2) {
    double v13 = v10;
  }
  double v14 = v13 * 130.0 + 190.0;
  double v15 = v13 * -65.0 + -95.0;
  long long v16 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
  double v17 = [NSNumber numberWithDouble:v14];
  [v16 setValue:v17 forKeyPath:@"emitterBehaviors.fingerAttractor.radius"];

  uint64_t v18 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
  CGRect v19 = [NSNumber numberWithDouble:v15];
  [v18 setValue:v19 forKeyPath:@"emitterBehaviors.fingerAttractor.falloff"];

  CGRect v20 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
  double v21 = (void *)MEMORY[0x1E4F29238];
  double v22 = [(CKInvisibleInkEmojiEffectView *)self layer];
  uint64_t v23 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
  objc_msgSend(v22, "convertPoint:toLayer:", v23, v5, v7);
  uint64_t v24 = objc_msgSend(v21, "valueWithCGPoint:");
  [v20 setValue:v24 forKeyPath:@"emitterBehaviors.fingerAttractor.position"];
}

- (void)endDustEmitterLayerFingerEffects
{
  uint64_t v3 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
  [v3 setValue:&unk_1EDF15ED8 forKeyPath:@"emitterBehaviors.fingerAttractor.stiffness"];

  id v4 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
  [v4 setValue:MEMORY[0x1E4F1CC28] forKeyPath:@"emitterBehaviors.fingerAttractor.enabled"];
}

- (void)endTouches
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(CKInvisibleInkEmojiEffectView *)self endDrawEmitterEffects];
  [(CKInvisibleInkEmojiEffectView *)self endDustEmitterLayerFingerEffects];
  uint64_t v3 = (void *)MEMORY[0x1E4F39CF8];

  [v3 commit];
}

- (void)moveEmittersForTouchesBegan:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F39CF8];
  id v5 = a3;
  [v4 begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  double v6 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
  [v6 removeAnimationForKey:@"disableBlending"];

  double v7 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
  LODWORD(v8) = 1.0;
  [v7 setLifetime:v8];

  double v9 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
  [v9 setValue:&unk_1EDF15F20 forKeyPath:@"emitterBehaviors.fingerAttractor.stiffness"];

  double v10 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
  [v10 setValue:MEMORY[0x1E4F1CC38] forKeyPath:@"emitterBehaviors.fingerAttractor.enabled"];

  [(CKInvisibleInkEmojiEffectView *)self enableBlending];
  [(CKInvisibleInkEmojiEffectView *)self moveEmittersWithTouches:v5];

  double v11 = (void *)MEMORY[0x1E4F39CF8];

  [v11 commit];
}

- (void)moveEmittersForTouchesMoved:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F39CF8];
  id v5 = a3;
  [v4 begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(CKInvisibleInkEmojiEffectView *)self moveEmittersWithTouches:v5];

  double v6 = (void *)MEMORY[0x1E4F39CF8];

  [v6 commit];
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CKInvisibleInkEffectView *)self isPaused];
  v34.receiver = self;
  v34.super_class = (Class)CKInvisibleInkEmojiEffectView;
  [(CKInvisibleInkEffectView *)&v34 setPaused:v3];
  if (v5 != v3)
  {
    [MEMORY[0x1E4F39CF8] begin];
    double v6 = [(CKInvisibleInkEmojiEffectView *)self layer];
    double v8 = v6;
    if (v3)
    {
      [v6 setSpeed:0.0];

      double v9 = [(CKInvisibleInkEmojiEffectView *)self layer];
      double v10 = [(CKInvisibleInkEmojiEffectView *)self layer];
      double v11 = [v10 superlayer];
      [v11 convertTime:0 fromLayer:CACurrentMediaTime()];
      double v13 = v12;
      [v9 timeOffset];
      [v9 setTimeOffset:v13 + v14];

      double v15 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
      [v15 setSpeed:0.0];

      long long v16 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
      double v17 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
      uint64_t v18 = [v17 superlayer];
      [v18 convertTime:0 fromLayer:CACurrentMediaTime()];
      double v20 = v19;
      [v16 timeOffset];
      double v22 = v20 + v21;
    }
    else
    {
      LODWORD(v7) = 1.0;
      [v6 setSpeed:v7];

      uint64_t v23 = [(CKInvisibleInkEmojiEffectView *)self layer];
      uint64_t v24 = [(CKInvisibleInkEmojiEffectView *)self layer];
      id v25 = [v24 superlayer];
      [v25 convertTime:0 fromLayer:CACurrentMediaTime()];
      double v27 = v26;
      [v23 timeOffset];
      [v23 setTimeOffset:v28 - v27];

      double v29 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
      LODWORD(v30) = 1.0;
      [v29 setSpeed:v30];

      long long v16 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
      double v17 = [(CKInvisibleInkEmojiEffectView *)self drawEmitterLayer];
      uint64_t v18 = [v17 superlayer];
      [v18 convertTime:0 fromLayer:CACurrentMediaTime()];
      double v32 = v31;
      [v16 timeOffset];
      double v22 = v33 - v32;
    }
    [v16 setTimeOffset:v22];

    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CKInvisibleInkEffectView *)self isSuspended];
  v9.receiver = self;
  v9.super_class = (Class)CKInvisibleInkEmojiEffectView;
  [(CKInvisibleInkEffectView *)&v9 setSuspended:v3];
  if (v5 != v3)
  {
    uint64_t v6 = v3 ^ 1;
    [(CKInvisibleInkEmojiEffectView *)self setUserInteractionEnabled:v6];
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    double v7 = [(CKInvisibleInkEmojiEffectView *)self dustEmitterLayer];
    *(float *)&double v8 = (float)v6;
    [v7 setBirthRate:v8];

    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (CALayer)emojiContainerLayer
{
  return self->_emojiContainerLayer;
}

- (void)setEmojiContainerLayer:(id)a3
{
}

- (CALayer)emojiLayer
{
  return self->_emojiLayer;
}

- (void)setEmojiLayer:(id)a3
{
}

- (CAEmitterLayer)drawEmitterLayer
{
  return self->_drawEmitterLayer;
}

- (void)setDrawEmitterLayer:(id)a3
{
}

- (CALayer)dustContainerLayer
{
  return self->_dustContainerLayer;
}

- (void)setDustContainerLayer:(id)a3
{
}

- (CAEmitterLayer)dustEmitterLayer
{
  return self->_dustEmitterLayer;
}

- (void)setDustEmitterLayer:(id)a3
{
}

- (CALayer)blurredEmojiLayer
{
  return self->_blurredEmojiLayer;
}

- (void)setBlurredEmojiLayer:(id)a3
{
}

- (CALayer)maskLayer
{
  return self->_maskLayer;
}

- (void)setMaskLayer:(id)a3
{
}

- (BOOL)blendingEnabled
{
  return self->_blendingEnabled;
}

- (void)setBlendingEnabled:(BOOL)a3
{
  self->_blendingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_blurredEmojiLayer, 0);
  objc_storeStrong((id *)&self->_dustEmitterLayer, 0);
  objc_storeStrong((id *)&self->_dustContainerLayer, 0);
  objc_storeStrong((id *)&self->_drawEmitterLayer, 0);
  objc_storeStrong((id *)&self->_emojiLayer, 0);
  objc_storeStrong((id *)&self->_emojiContainerLayer, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end