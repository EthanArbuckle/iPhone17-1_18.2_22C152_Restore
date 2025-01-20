@interface CKInvisibleInkTextEffectView
- (BOOL)blendingEnabled;
- (CAEmitterLayer)dustDrawEmitterLayer;
- (CAEmitterLayer)textDrawEmitterLayer;
- (CALayer)dustEmitterContainerLayer;
- (CKInvisibleInkTextEffectView)initWithFrame:(CGRect)a3;
- (CKTextBalloonView)balloonView;
- (NSArray)dustEmitterLayers;
- (UIColor)currentDustColor;
- (UITextView)textView;
- (id)_newEmitterForCharacterRects:(id)a3 lineBounds:(CGRect)a4;
- (id)createDrawEmitter;
- (id)makeDustEmitter;
- (void)_configureInvisibleInkEmitterUsingTextKit1;
- (void)_configureInvisibleInkEmitterUsingTextKit2;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)attachToBalloonView:(id)a3;
- (void)cullSubviewsWithVisibleBounds:(CGRect)a3;
- (void)detachFromBalloonView;
- (void)didMoveToWindow;
- (void)endDrawEmitterEffects;
- (void)endDustEmitterLayerFingerEffects:(id)a3;
- (void)endTouches;
- (void)layoutSubviews;
- (void)moveEmittersForTouchesBegan:(id)a3;
- (void)moveEmittersForTouchesMoved:(id)a3;
- (void)moveEmittersWithTouches:(id)a3;
- (void)reset;
- (void)setBalloonView:(id)a3;
- (void)setBlendingEnabled:(BOOL)a3;
- (void)setDustDrawEmitterLayer:(id)a3;
- (void)setDustEmitterContainerLayer:(id)a3;
- (void)setDustEmitterLayers:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setTextDrawEmitterLayer:(id)a3;
- (void)setTextView:(id)a3;
- (void)updateDustCellColor;
@end

@implementation CKInvisibleInkTextEffectView

- (CKInvisibleInkTextEffectView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CKInvisibleInkTextEffectView;
  v3 = -[CKInvisibleInkEffectView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    [(CKInvisibleInkTextEffectView *)v3 setDustEmitterContainerLayer:v4];

    v5 = [(CKInvisibleInkTextEffectView *)v3 dustEmitterContainerLayer];
    [v5 setMasksToBounds:1];

    v6 = [(CKInvisibleInkTextEffectView *)v3 createDrawEmitter];
    [(CKInvisibleInkTextEffectView *)v3 setTextDrawEmitterLayer:v6];

    v7 = [(CKInvisibleInkTextEffectView *)v3 createDrawEmitter];
    [(CKInvisibleInkTextEffectView *)v3 setDustDrawEmitterLayer:v7];

    v8 = [(CKInvisibleInkTextEffectView *)v3 layer];
    v9 = [(CKInvisibleInkTextEffectView *)v3 dustEmitterContainerLayer];
    [v8 addSublayer:v9];

    v10 = [(CKInvisibleInkTextEffectView *)v3 dustEmitterContainerLayer];
    v11 = [(CKInvisibleInkTextEffectView *)v3 dustDrawEmitterLayer];
    [v10 addSublayer:v11];
  }
  return v3;
}

- (UIColor)currentDustColor
{
  v3 = +[CKUIBehavior sharedBehaviors];
  v4 = [v3 theme];
  v5 = [(CKInvisibleInkTextEffectView *)self balloonView];
  v6 = objc_msgSend(v4, "balloonTextColorForColorType:", objc_msgSend(v5, "color"));
  v7 = [v6 colorWithAlphaComponent:0.0];

  return (UIColor *)v7;
}

- (id)createDrawEmitter
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F39BA8] emitterCell];
  id v3 = [MEMORY[0x1E4F42A80] ckImageNamed:@"blurSmall"];
  objc_msgSend(v2, "setContents:", objc_msgSend(v3, "CGImage"));

  LODWORD(v4) = 1114636288;
  [v2 setBirthRate:v4];
  [v2 setDuration:INFINITY];
  LODWORD(v5) = 4.0;
  [v2 setLifetime:v5];
  LODWORD(v6) = 1.0;
  [v2 setLifetimeRange:v6];
  [v2 setParticleType:*MEMORY[0x1E4F39F40]];
  [v2 setOrientationLongitude:3.14159265];
  [v2 setOrientationLatitude:0.0];
  [v2 setEmissionRange:0.0];
  [v2 setScale:1.0];
  [v2 setVelocityRange:20.0];
  v7 = [MEMORY[0x1E4F39BA0] behaviorWithType:*MEMORY[0x1E4F39F18]];
  id v8 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:1.0];
  v18[0] = [v8 CGColor];
  id v9 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.0];
  v18[1] = [v9 CGColor];
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  [v7 setValue:v10 forKey:@"colors"];

  [v7 setValue:&unk_1EDF15098 forKey:@"locations"];
  v11 = [MEMORY[0x1E4F39BA0] behaviorWithType:*MEMORY[0x1E4F39F28]];
  [v11 setName:@"scaleBehavior"];
  [v11 setValue:@"scale" forKey:@"keyPath"];
  [v11 setValue:&unk_1EDF150B0 forKey:@"values"];
  [v11 setValue:&unk_1EDF150C8 forKey:@"locations"];
  v12 = [MEMORY[0x1E4F39BB0] layer];
  [v12 setLifetime:0.0];
  [v12 setMasksToBounds:1];
  [v12 setEmitterMode:*MEMORY[0x1E4F39F70]];
  v17 = v2;
  objc_super v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  [v12 setEmitterCells:v13];

  v16[0] = v7;
  v16[1] = v11;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  [v12 setEmitterBehaviors:v14];

  [v12 setRenderMode:@"cheapAdditive"];
  [(id)objc_opt_class() updateInterval];
  objc_msgSend(v12, "setUpdateInterval:");
  [v12 setRasterizationScale:0.25];

  return v12;
}

- (id)makeDustEmitter
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F39BA8] emitterCell];
  id v4 = [MEMORY[0x1E4F42A80] ckImageNamed:@"textSpeckle"];
  objc_msgSend(v3, "setContents:", objc_msgSend(v4, "CGImage"));

  LODWORD(v5) = 1150681088;
  [v3 setBirthRate:v5];
  [v3 setContentsScale:1.79999995];
  [v3 setEmissionRange:6.28318531];
  LODWORD(v6) = 3.0;
  [v3 setMass:v6];
  LODWORD(v7) = 2.0;
  [v3 setMassRange:v7];
  LODWORD(v8) = 1.0;
  [v3 setLifetime:v8];
  [v3 setScale:0.5];
  [v3 setVelocityRange:20.0];
  [v3 setName:@"dustCell"];
  [v3 setParticleType:*MEMORY[0x1E4F39F40]];
  id v9 = [MEMORY[0x1E4F428B8] whiteColor];
  double v10 = 0.0;
  id v11 = [v9 colorWithAlphaComponent:0.0];
  objc_msgSend(v3, "setColor:", objc_msgSend(v11, "CGColor"));

  LODWORD(v12) = 1.0;
  [v3 setAlphaRange:v12];
  objc_super v13 = [MEMORY[0x1E4F1CA48] array];
  v14 = [MEMORY[0x1E4F39BA0] behaviorWithType:*MEMORY[0x1E4F39F20]];
  [v14 setName:@"fingerAttractor"];
  [v13 addObject:v14];
  v15 = [MEMORY[0x1E4F39BA0] behaviorWithType:*MEMORY[0x1E4F39F28]];
  [v15 setName:@"alphaBehavior"];
  [v15 setValue:@"color.alpha" forKey:@"keyPath"];
  [v15 setValue:&unk_1EDF150E0 forKey:@"values"];
  [v15 setValue:MEMORY[0x1E4F1CC38] forKey:@"additive"];
  [v13 addObject:v15];
  v16 = [MEMORY[0x1E4F39BB0] layer];
  v20[0] = v3;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v16 setEmitterCells:v17];

  [v16 setEmitterShape:*MEMORY[0x1E4F39F80]];
  [v16 setEmitterBehaviors:v13];
  if (![(CKInvisibleInkTextEffectView *)self blendingEnabled])
  {
    [(id)objc_opt_class() updateInterval];
    double v10 = v18;
  }
  [v16 setUpdateInterval:v10];
  [v16 setSeed:arc4random()];
  [(CKInvisibleInkTextEffectView *)self endDustEmitterLayerFingerEffects:v16];

  return v16;
}

- (void)layoutSubviews
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v51.receiver = self;
  v51.super_class = (Class)CKInvisibleInkTextEffectView;
  [(CKInvisibleInkEffectView *)&v51 layoutSubviews];
  id v3 = [(CKInvisibleInkTextEffectView *)self window];

  if (v3)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v4 = [(CKInvisibleInkTextEffectView *)self dustEmitterLayers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v48 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v47 + 1) + 8 * i) removeFromSuperlayer];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v6);
    }

    [(CKInvisibleInkTextEffectView *)self bounds];
    double v10 = v9;
    [(CKInvisibleInkTextEffectView *)self bounds];
    double v12 = v11;
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    objc_super v13 = [(CKInvisibleInkTextEffectView *)self dustEmitterContainerLayer];
    objc_msgSend(v13, "setFrame:", 0.0, 0.0, v10, v12);

    v14 = [(CKInvisibleInkTextEffectView *)self layer];
    v54.origin.double x = 0.0;
    v54.origin.double y = 0.0;
    v54.size.double width = v10;
    v54.size.double height = v12;
    CGRect v55 = CGRectInset(v54, -4.0, -4.0);
    double x = v55.origin.x;
    double y = v55.origin.y;
    double width = v55.size.width;
    double height = v55.size.height;
    v19 = [(CKInvisibleInkTextEffectView *)self textView];
    v20 = [v19 layer];
    objc_msgSend(v14, "convertRect:toLayer:", v20, x, y, width, height);
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    v29 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
    objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

    v30 = [(CKInvisibleInkTextEffectView *)self layer];
    v56.origin.double x = 0.0;
    v56.origin.double y = 0.0;
    v56.size.double width = v10;
    v56.size.double height = v12;
    CGRect v57 = CGRectInset(v56, -4.0, -4.0);
    double v31 = v57.origin.x;
    double v32 = v57.origin.y;
    double v33 = v57.size.width;
    double v34 = v57.size.height;
    v35 = [(CKInvisibleInkTextEffectView *)self textView];
    v36 = [v35 layer];
    objc_msgSend(v30, "convertRect:fromLayer:", v36, v31, v32, v33, v34);
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    v45 = [(CKInvisibleInkTextEffectView *)self dustDrawEmitterLayer];
    objc_msgSend(v45, "setFrame:", v38, v40, v42, v44);

    v46 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    LODWORD(v35) = [v46 isTextKit2Enabled];

    if (v35) {
      [(CKInvisibleInkTextEffectView *)self _configureInvisibleInkEmitterUsingTextKit2];
    }
    else {
      [(CKInvisibleInkTextEffectView *)self _configureInvisibleInkEmitterUsingTextKit1];
    }
    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (id)_newEmitterForCharacterRects:(id)a3 lineBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if ([v9 count])
  {
    double v10 = [(CKInvisibleInkTextEffectView *)self textView];
    [v10 textContainerInset];
    double v12 = x + v11;

    objc_super v13 = [(CKInvisibleInkTextEffectView *)self textView];
    [v13 textContainerInset];
    double v15 = y + v14;

    v16 = [(CKInvisibleInkTextEffectView *)self textView];
    v17 = [v16 layer];
    double v18 = [(CKInvisibleInkTextEffectView *)self dustEmitterContainerLayer];
    objc_msgSend(v17, "convertPoint:toLayer:", v18, v12, v15);
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    double v23 = [(CKInvisibleInkTextEffectView *)self makeDustEmitter];
    objc_msgSend(v23, "setEmitterPosition:", 21.5, 23.0);
    objc_msgSend(v23, "setEmitterSize:", 1.0, 1.0);
    v52.origin.double x = v20;
    v52.origin.double y = v22;
    v52.size.CGFloat width = width;
    v52.size.CGFloat height = height;
    CGRect v53 = CGRectInset(v52, -22.0, -22.0);
    objc_msgSend(v23, "setFrame:", v53.origin.x, v53.origin.y, v53.size.width, v53.size.height);
    [v23 setMasksToBounds:1];
    double v24 = [MEMORY[0x1E4F1CA48] array];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v25 = v9;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      id v44 = v9;
      uint64_t v28 = *(void *)v47;
      double v29 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v47 != v28) {
            objc_enumerationMutation(v25);
          }
          [*(id *)(*((void *)&v46 + 1) + 8 * i) CGRectValue];
          v54.origin.double x = v31 + -3.0;
          v54.origin.double y = 0.0;
          CGRect v55 = CGRectInset(v54, 2.0, 5.0);
          CGFloat v32 = v55.origin.x;
          CGFloat v33 = v55.origin.y;
          CGFloat v34 = v55.size.width;
          CGFloat v35 = v55.size.height;
          CGRect v45 = v55;
          v36 = [MEMORY[0x1E4F29238] valueWithBytes:&v45 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
          [v24 addObject:v36];

          v56.origin.double x = v32;
          v56.origin.double y = v33;
          v56.size.CGFloat width = v34;
          v56.size.CGFloat height = v35;
          double v37 = CGRectGetWidth(v56);
          v57.origin.double x = v32;
          v57.origin.double y = v33;
          v57.size.CGFloat width = v34;
          v57.size.CGFloat height = v35;
          double v29 = v29 + v37 * CGRectGetHeight(v57);
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v27);
      double v38 = v29 * 0.8;
      id v9 = v44;
    }
    else
    {
      double v38 = 0.0;
    }

    double v39 = (void *)[v24 copy];
    [v23 setEmitterRects:v39];

    *(float *)&double v40 = (float)([(CKInvisibleInkEffectView *)self isSuspended] ^ 1);
    [v23 setBirthRate:v40];
    double v41 = [NSNumber numberWithDouble:v38];
    [v23 setValue:v41 forKeyPath:@"emitterCells.dustCell.birthRate"];

    id v42 = [(CKInvisibleInkTextEffectView *)self currentDustColor];
    objc_msgSend(v23, "setValue:forKeyPath:", objc_msgSend(v42, "CGColor"), @"emitterCells.dustCell.color");
  }
  else
  {
    double v23 = 0;
  }

  return v23;
}

- (void)_configureInvisibleInkEmitterUsingTextKit2
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Configuring invisble ink emitter using TK2.", buf, 2u);
    }
  }
  id v3 = [(CKInvisibleInkTextEffectView *)self textView];
  id v4 = [v3 textLayoutManager];

  uint64_t v5 = [v4 documentRange];
  [v4 ensureLayoutForRange:v5];

  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [v4 documentRange];
  double v8 = [v7 location];
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __74__CKInvisibleInkTextEffectView__configureInvisibleInkEmitterUsingTextKit2__block_invoke;
  v70[3] = &unk_1E5620F98;
  id v71 = v4;
  id v9 = v6;
  id v72 = v9;
  id v51 = v71;
  [v71 enumerateSubstringsFromLocation:v8 options:2 usingBlock:v70];

  double v10 = [MEMORY[0x1E4F1CA48] array];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v67;
    unint64_t v14 = -1;
    double v15 = -1.0;
    do
    {
      uint64_t v16 = 0;
      double v17 = v15;
      do
      {
        if (*(void *)v67 != v13) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v66 + 1) + 8 * v16) CGRectValue];
        uint64_t v19 = v18;
        double v15 = v20;
        uint64_t v22 = v21;
        uint64_t v24 = v23;
        v14 += !CKFloatApproximatelyEqualToFloatWithTolerance(v20, v17, 0.00000999999975);
        if ([v10 count] <= v14)
        {
          id v25 = [MEMORY[0x1E4F1CA48] array];
          [v10 addObject:v25];
        }
        else
        {
          id v25 = [v10 objectAtIndexedSubscript:v14];
        }
        v65[0] = v19;
        *(double *)&v65[1] = v15;
        v65[2] = v22;
        v65[3] = v24;
        uint64_t v26 = [MEMORY[0x1E4F29238] valueWithBytes:v65 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
        [v25 addObject:v26];

        ++v16;
        double v17 = v15;
      }
      while (v12 != v16);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v12);
  }

  uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v28 = v10;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v61 objects:v75 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v62;
    CGFloat v55 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v56 = *MEMORY[0x1E4F1DB28];
    CGFloat v53 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    CGFloat v54 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v62 != v30) {
          objc_enumerationMutation(v28);
        }
        CGFloat v32 = *(void **)(*((void *)&v61 + 1) + 8 * v31);
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v33 = v32;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v57 objects:v74 count:16];
        double y = v55;
        double x = v56;
        double height = v53;
        double width = v54;
        if (v34)
        {
          uint64_t v39 = *(void *)v58;
          double y = v55;
          double x = v56;
          double height = v53;
          double width = v54;
          do
          {
            uint64_t v40 = 0;
            do
            {
              if (*(void *)v58 != v39) {
                objc_enumerationMutation(v33);
              }
              [*(id *)(*((void *)&v57 + 1) + 8 * v40) CGRectValue];
              CGFloat v42 = v41;
              CGFloat v44 = v43;
              CGFloat v46 = v45;
              CGFloat v48 = v47;
              v78.origin.double x = x;
              v78.origin.double y = y;
              v78.size.double width = width;
              v78.size.double height = height;
              v81.origin.double y = v55;
              v81.origin.double x = v56;
              v81.size.double height = v53;
              v81.size.double width = v54;
              if (CGRectEqualToRect(v78, v81))
              {
                double x = v42;
                double y = v44;
                double width = v46;
                double height = v48;
              }
              else
              {
                v79.origin.double x = x;
                v79.origin.double y = y;
                v79.size.double width = width;
                v79.size.double height = height;
                v82.origin.double x = v42;
                v82.origin.double y = v44;
                v82.size.double width = v46;
                v82.size.double height = v48;
                CGRect v80 = CGRectUnion(v79, v82);
                double x = v80.origin.x;
                double y = v80.origin.y;
                double width = v80.size.width;
                double height = v80.size.height;
              }
              ++v40;
            }
            while (v34 != v40);
            uint64_t v34 = [v33 countByEnumeratingWithState:&v57 objects:v74 count:16];
          }
          while (v34);
        }

        id v49 = -[CKInvisibleInkTextEffectView _newEmitterForCharacterRects:lineBounds:](self, "_newEmitterForCharacterRects:lineBounds:", v33, x, y, width, height);
        if (v49)
        {
          [v27 addObject:v49];
          long long v50 = [(CKInvisibleInkTextEffectView *)self dustEmitterContainerLayer];
          [v50 insertSublayer:v49 atIndex:0];
        }
        ++v31;
      }
      while (v31 != v29);
      uint64_t v29 = [v28 countByEnumeratingWithState:&v61 objects:v75 count:16];
    }
    while (v29);
  }

  [(CKInvisibleInkTextEffectView *)self setDustEmitterLayers:v27];
}

void __74__CKInvisibleInkTextEffectView__configureInvisibleInkEmitterUsingTextKit2__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__CKInvisibleInkTextEffectView__configureInvisibleInkEmitterUsingTextKit2__block_invoke_2;
  v5[3] = &unk_1E5620F70;
  id v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v4 enumerateTextSegmentsInRange:a3 type:0 options:0 usingBlock:v5];
}

uint64_t __74__CKInvisibleInkTextEffectView__configureInvisibleInkEmitterUsingTextKit2__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v5 = *(void **)(a1 + 32);
  *(double *)double v8 = a2;
  *(double *)&v8[1] = a3;
  *(double *)&v8[2] = a4;
  *(double *)&v8[3] = a5;
  id v6 = [MEMORY[0x1E4F29238] valueWithBytes:v8 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [v5 addObject:v6];

  return 1;
}

- (void)_configureInvisibleInkEmitterUsingTextKit1
{
  CFLocaleRef v3 = CFLocaleCopyCurrent();
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v5 = [(CKInvisibleInkTextEffectView *)self textView];
  id v6 = [v5 text];
  uint64_t v7 = [(CKInvisibleInkTextEffectView *)self textView];
  double v8 = [v7 text];
  v45.length = [v8 length];
  v45.location = 0;
  CFLocaleRef cf = v3;
  id v9 = CFStringTokenizerCreate(v4, v6, v45, 4uLL, v3);

  double v10 = [MEMORY[0x1E4F1CA48] array];
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__2;
  v43[4] = __Block_byref_object_dispose__2;
  id v44 = 0;
  id v44 = [MEMORY[0x1E4F1CA48] array];
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x4010000000;
  v39[3] = "";
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v40 = *MEMORY[0x1E4F1DB28];
  long long v41 = v11;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3010000000;
  v37[3] = "";
  int64x2_t v38 = vdupq_n_s64(0xFFF0000000000000);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__CKInvisibleInkTextEffectView__configureInvisibleInkEmitterUsingTextKit1__block_invoke;
  aBlock[3] = &unk_1E5620FC0;
  id v33 = v43;
  uint64_t v34 = v37;
  aBlock[4] = self;
  CGFloat v35 = v39;
  v36 = v42;
  id v24 = v10;
  id v32 = v24;
  uint64_t v12 = (void (**)(void))_Block_copy(aBlock);
  while (CFStringTokenizerAdvanceToNextToken(v9))
  {
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v9);
    unint64_t v14 = [(CKInvisibleInkTextEffectView *)self textView];
    double v15 = [v14 layoutManager];
    uint64_t v16 = objc_msgSend(v15, "glyphRangeForCharacterRange:actualCharacterRange:", CurrentTokenRange.location, CurrentTokenRange.length, 0);
    uint64_t v18 = v17;

    uint64_t v19 = [(CKInvisibleInkTextEffectView *)self textView];
    double v20 = [v19 layoutManager];
    uint64_t v21 = [(CKInvisibleInkTextEffectView *)self textView];
    uint64_t v22 = [v21 textContainer];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __74__CKInvisibleInkTextEffectView__configureInvisibleInkEmitterUsingTextKit1__block_invoke_2;
    v25[3] = &unk_1E5620FE8;
    uint64_t v27 = v37;
    uint64_t v26 = v12;
    id v28 = v43;
    uint64_t v29 = v42;
    uint64_t v30 = v39;
    objc_msgSend(v20, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v16, v18, 0x7FFFFFFFFFFFFFFFLL, 0, v22, v25);
  }
  CFRelease(v9);
  CFRelease(cf);
  v12[2](v12);
  [(CKInvisibleInkTextEffectView *)self setDustEmitterLayers:v24];

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v43, 8);
}

void __74__CKInvisibleInkTextEffectView__configureInvisibleInkEmitterUsingTextKit1__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
    double v3 = *(double *)(v2 + 32);
    double v4 = *(double *)(v2 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) textView];
    [v5 textContainerInset];
    double v7 = v3 + v6;

    double v8 = [*(id *)(a1 + 32) textView];
    [v8 textContainerInset];
    double v10 = v4 + v9;

    long long v11 = [*(id *)(a1 + 32) textView];
    uint64_t v12 = [v11 layer];
    uint64_t v13 = [*(id *)(a1 + 32) dustEmitterContainerLayer];
    objc_msgSend(v12, "convertPoint:toLayer:", v13, v7, v10);
    CGFloat v15 = v14;
    CGFloat v17 = v16;

    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    CGFloat v19 = *(double *)(v18 + 48);
    CGFloat v20 = *(double *)(v18 + 56);
    id v25 = [*(id *)(a1 + 32) makeDustEmitter];
    objc_msgSend(v25, "setEmitterPosition:", 21.5, 23.0);
    objc_msgSend(v25, "setEmitterSize:", 1.0, 1.0);
    v27.origin.double x = v15;
    v27.origin.double y = v17;
    v27.size.double width = v19;
    v27.size.double height = v20;
    CGRect v28 = CGRectInset(v27, -22.0, -22.0);
    objc_msgSend(v25, "setFrame:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
    [v25 setMasksToBounds:1];
    [v25 setEmitterRects:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    *(float *)&double v21 = (float)([*(id *)(a1 + 32) isSuspended] ^ 1);
    [v25 setBirthRate:v21];
    uint64_t v22 = [NSNumber numberWithDouble:*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) * 0.8];
    [v25 setValue:v22 forKeyPath:@"emitterCells.dustCell.birthRate"];

    id v23 = [*(id *)(a1 + 32) currentDustColor];
    objc_msgSend(v25, "setValue:forKeyPath:", objc_msgSend(v23, "CGColor"), @"emitterCells.dustCell.color");

    [*(id *)(a1 + 40) addObject:v25];
    id v24 = [*(id *)(a1 + 32) dustEmitterContainerLayer];
    [v24 insertSublayer:v25 atIndex:0];
  }
}

void __74__CKInvisibleInkTextEffectView__configureInvisibleInkEmitterUsingTextKit1__block_invoke_2(void *a1, double a2, double a3, CGFloat a4, CGFloat a5)
{
  uint64_t v10 = *(void *)(a1[5] + 8);
  double v11 = *(double *)(v10 + 40);
  if (a3 > v11)
  {
    (*(void (**)(void))(a1[4] + 16))();
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v13 = *(void *)(a1[6] + 8);
    double v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *(void *)(*(void *)(a1[7] + 8) + 24) = 0;
    uint64_t v15 = *(void *)(a1[8] + 8);
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    *(_OWORD *)(v15 + 32) = *MEMORY[0x1E4F1DB28];
    *(_OWORD *)(v15 + 48) = v16;
    *(double *)(*(void *)(a1[5] + 8) + 32) = a2;
    *(double *)(*(void *)(a1[5] + 8) + 40) = a3;
    uint64_t v10 = *(void *)(a1[5] + 8);
    double v11 = *(double *)(v10 + 40);
  }
  v23.origin.CGFloat x = a2 - *(double *)(v10 + 32);
  v23.origin.CGFloat y = a3 - v11;
  double height = 2.0;
  v23.size.double width = a4;
  v23.size.double height = a5;
  CGRect v24 = CGRectInset(v23, 2.0, 5.0);
  CGFloat x = v24.origin.x;
  CGFloat y = v24.origin.y;
  if (v24.size.width >= 2.0) {
    double width = v24.size.width;
  }
  else {
    double width = 2.0;
  }
  if (v24.size.height >= 2.0) {
    double height = v24.size.height;
  }
  double v21 = *(void **)(*(void *)(a1[6] + 8) + 40);
  uint64_t v22 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
  [v21 addObject:v22];

  *(double *)(*(void *)(a1[7] + 8) + 24) = *(double *)(*(void *)(a1[7] + 8) + 24) + height * width;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  *(CGRect *)(*(void *)(a1[8] + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(a1[8] + 8) + 32), v25);
}

- (void)didMoveToWindow
{
  double v3 = [(CKInvisibleInkTextEffectView *)self window];

  if (v3)
  {
    [(CKInvisibleInkTextEffectView *)self setNeedsLayout];
  }
}

- (void)setBlendingEnabled:(BOOL)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (self->_blendingEnabled != a3)
  {
    BOOL v3 = a3;
    self->_blendingEnabled = a3;
    uint64_t v5 = [(CKInvisibleInkTextEffectView *)self textView];
    double v6 = [v5 layer];
    double v7 = v6;
    if (v3)
    {
      [v6 setHidden:0];

      uint64_t v8 = *MEMORY[0x1E4F3A298];
      double v9 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
      [v9 setCompositingFilter:v8];

      uint64_t v10 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
      [v10 setShouldRasterize:1];

      uint64_t v11 = *MEMORY[0x1E4F3A098];
      uint64_t v12 = [(CKInvisibleInkTextEffectView *)self dustDrawEmitterLayer];
      [v12 setCompositingFilter:v11];

      uint64_t v13 = [(CKInvisibleInkTextEffectView *)self dustDrawEmitterLayer];
      [v13 setShouldRasterize:1];

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      double v14 = [(CKInvisibleInkTextEffectView *)self dustEmitterLayers];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v40 != v17) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&v39 + 1) + 8 * i) setUpdateInterval:0.0];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v16);
      }

      CGFloat v19 = [(CKInvisibleInkTextEffectView *)self dustDrawEmitterLayer];
      [v19 setUpdateInterval:0.0];

      CGFloat v20 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
      double v21 = v20;
      double v22 = 0.0;
    }
    else
    {
      [v6 setHidden:1];

      CGRect v23 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
      [v23 setCompositingFilter:0];

      CGRect v24 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
      [v24 setShouldRasterize:0];

      CGRect v25 = [(CKInvisibleInkTextEffectView *)self dustDrawEmitterLayer];
      [v25 setCompositingFilter:0];

      uint64_t v26 = [(CKInvisibleInkTextEffectView *)self dustDrawEmitterLayer];
      [v26 setShouldRasterize:0];

      [(id)objc_opt_class() updateInterval];
      double v28 = v27;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v29 = [(CKInvisibleInkTextEffectView *)self dustEmitterLayers];
      uint64_t v30 = [v29 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v36 != v32) {
              objc_enumerationMutation(v29);
            }
            [*(id *)(*((void *)&v35 + 1) + 8 * j) setUpdateInterval:v28];
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v35 objects:v43 count:16];
        }
        while (v31);
      }

      uint64_t v34 = [(CKInvisibleInkTextEffectView *)self dustDrawEmitterLayer];
      [v34 setUpdateInterval:v28];

      CGFloat v20 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
      double v21 = v20;
      double v22 = v28;
    }
    [v20 setUpdateInterval:v22];
  }
}

- (void)endDrawEmitterEffects
{
  BOOL v3 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
  [v3 setLifetime:0.0];

  double v4 = [(CKInvisibleInkTextEffectView *)self dustDrawEmitterLayer];
  [v4 setLifetime:0.0];

  if (![(CKInvisibleInkEffectView *)self isSuspended])
  {
    id v6 = [MEMORY[0x1E4F39B30] animation];
    [v6 setDuration:5.0];
    [v6 setDelegate:self];
    uint64_t v5 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
    [v5 addAnimation:v6 forKey:@"disableBlending"];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4) {
    [(CKInvisibleInkTextEffectView *)self setBlendingEnabled:0];
  }
}

- (void)endDustEmitterLayerFingerEffects:(id)a3
{
  id v3 = a3;
  [v3 setValue:&unk_1EDF15F38 forKeyPath:@"emitterBehaviors.fingerAttractor.stiffness"];
  [v3 setValue:MEMORY[0x1E4F1CC28] forKeyPath:@"emitterBehaviors.fingerAttractor.enabled"];
}

- (void)endTouches
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(CKInvisibleInkTextEffectView *)self endDrawEmitterEffects];
  id v3 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
  [v3 removeAnimationForKey:@"scale"];

  double v4 = [(CKInvisibleInkTextEffectView *)self dustDrawEmitterLayer];
  [v4 removeAnimationForKey:@"scale"];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(CKInvisibleInkTextEffectView *)self dustEmitterLayers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(CKInvisibleInkTextEffectView *)self endDustEmitterLayerFingerEffects:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [MEMORY[0x1E4F39CF8] commit];
}

- (void)moveEmittersWithTouches:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  double v4 = [a3 anyObject];
  [v4 locationInView:self];
  double v6 = v5;
  double v8 = v7;
  uint64_t v29 = v4;
  [v4 force];
  double v10 = fmin(fmax(v9 / 3.8, 0.0), 1.0);
  long long v11 = [(CKInvisibleInkTextEffectView *)self traitCollection];
  uint64_t v12 = [v11 forceTouchCapability];

  if (v12 == 2) {
    double v13 = v10;
  }
  else {
    double v13 = 0.5;
  }
  double v14 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
  objc_msgSend(v14, "setEmitterPosition:", v6, v8);

  uint64_t v15 = [(CKInvisibleInkTextEffectView *)self dustDrawEmitterLayer];
  objc_msgSend(v15, "setEmitterPosition:", v6, v8);

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = [(CKInvisibleInkTextEffectView *)self dustEmitterLayers];
  uint64_t v16 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    double v18 = v13 * 130.0 + 190.0;
    double v19 = v13 * -65.0 + -95.0;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(obj);
        }
        double v22 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        CGRect v23 = [NSNumber numberWithDouble:v18];
        [v22 setValue:v23 forKeyPath:@"emitterBehaviors.fingerAttractor.radius"];

        CGRect v24 = [NSNumber numberWithDouble:v19];
        [v22 setValue:v24 forKeyPath:@"emitterBehaviors.fingerAttractor.falloff"];

        CGRect v25 = (void *)MEMORY[0x1E4F29238];
        uint64_t v26 = [(CKInvisibleInkTextEffectView *)self layer];
        objc_msgSend(v26, "convertPoint:toLayer:", v22, v6, v8);
        double v27 = objc_msgSend(v25, "valueWithCGPoint:");
        [v22 setValue:v27 forKeyPath:@"emitterBehaviors.fingerAttractor.position"];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v17);
  }

  double v28 = [(CKInvisibleInkEffectView *)self coverageTracker];
  objc_msgSend(v28, "recordTouchAtPoint:", v6, v8);
}

- (void)moveEmittersForTouchesBegan:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  double v4 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
  LODWORD(v5) = 1.0;
  [v4 setLifetime:v5];

  double v6 = [(CKInvisibleInkTextEffectView *)self dustDrawEmitterLayer];
  LODWORD(v7) = 1.0;
  [v6 setLifetime:v7];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v8 = [(CKInvisibleInkTextEffectView *)self dustEmitterLayers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    uint64_t v12 = MEMORY[0x1E4F1CC38];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        double v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        [v14 setValue:&unk_1EDF15F80 forKeyPath:@"emitterBehaviors.fingerAttractor.stiffness"];
        [v14 setValue:v12 forKeyPath:@"emitterBehaviors.fingerAttractor.enabled"];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  uint64_t v15 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
  [v15 removeAnimationForKey:@"disableBlending"];

  [(CKInvisibleInkTextEffectView *)self setBlendingEnabled:1];
  uint64_t v16 = [MEMORY[0x1E4F39B48] animation];
  [v16 setFromValue:&unk_1EDF15F50];
  [v16 setToValue:&unk_1EDF15F98];
  [v16 setDuration:4.0];
  [v16 setRemovedOnCompletion:0];
  [v16 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v16 setKeyPath:@"scale"];
  uint64_t v17 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
  double v18 = [v16 keyPath];
  [v17 addAnimation:v16 forKey:v18];

  double v19 = [(CKInvisibleInkTextEffectView *)self dustDrawEmitterLayer];
  uint64_t v20 = [v16 keyPath];
  [v19 addAnimation:v16 forKey:v20];

  [(CKInvisibleInkTextEffectView *)self moveEmittersWithTouches:v21];
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)moveEmittersForTouchesMoved:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F39CF8];
  id v5 = a3;
  [v4 begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(CKInvisibleInkTextEffectView *)self moveEmittersWithTouches:v5];

  double v6 = (void *)MEMORY[0x1E4F39CF8];

  [v6 commit];
}

- (void)updateDustCellColor
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  id v3 = +[CKUIBehavior sharedBehaviors];
  double v4 = [v3 theme];
  id v5 = [(CKInvisibleInkTextEffectView *)self balloonView];
  double v6 = objc_msgSend(v4, "balloonTextColorForColorType:", objc_msgSend(v5, "color"));
  double v7 = [v6 colorWithAlphaComponent:0.0];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v8 = [(CKInvisibleInkTextEffectView *)self dustEmitterLayers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "setValue:forKeyPath:", objc_msgSend(v7, "CGColor"), @"emitterCells.dustCell.color");
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  [MEMORY[0x1E4F39CF8] commit];
}

- (void)attachToBalloonView:(id)a3
{
  id v4 = a3;
  [(CKInvisibleInkTextEffectView *)self setBalloonView:v4];
  id v9 = [v4 textView];

  [(CKInvisibleInkTextEffectView *)self setTextView:v9];
  id v5 = [v9 layer];
  double v6 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
  [v5 addSublayer:v6];

  BOOL v7 = !self->_blendingEnabled;
  double v8 = [v9 layer];
  [v8 setHidden:v7];

  [(CKInvisibleInkTextEffectView *)self updateDustCellColor];
}

- (void)detachFromBalloonView
{
  id v3 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
  [v3 removeFromSuperlayer];

  id v4 = [(CKInvisibleInkTextEffectView *)self textView];
  id v5 = [v4 layer];
  [v5 setHidden:0];

  [(CKInvisibleInkTextEffectView *)self setTextView:0];

  [(CKInvisibleInkTextEffectView *)self setBalloonView:0];
}

- (void)reset
{
  v5.receiver = self;
  v5.super_class = (Class)CKInvisibleInkTextEffectView;
  [(CKInvisibleInkEffectView *)&v5 reset];
  id v3 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
  [v3 removeAnimationForKey:@"disableBlending"];

  [(CKInvisibleInkTextEffectView *)self setBlendingEnabled:0];
  id v4 = [(CKInvisibleInkTextEffectView *)self balloonView];

  if (v4) {
    [(CKInvisibleInkTextEffectView *)self updateDustCellColor];
  }
}

- (void)cullSubviewsWithVisibleBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  double v8 = [(CKInvisibleInkTextEffectView *)self dustEmitterLayers];
  uint64_t v9 = [v8 count];

  uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
  uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v12 = [(CKInvisibleInkTextEffectView *)self dustEmitterLayers];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v61;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v61 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v60 + 1) + 8 * v16);
        uint64_t v18 = [(CKInvisibleInkTextEffectView *)self dustEmitterContainerLayer];
        [v17 frame];
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        uint64_t v27 = [(CKInvisibleInkTextEffectView *)self layer];
        objc_msgSend(v18, "convertRect:toLayer:", v27, v20, v22, v24, v26);
        CGFloat v29 = v28;
        CGFloat v31 = v30;
        CGFloat v33 = v32;
        CGFloat v35 = v34;

        v68.origin.CGFloat x = x;
        v68.origin.CGFloat y = y;
        v68.size.CGFloat width = width;
        v68.size.CGFloat height = height;
        v70.origin.CGFloat x = v29;
        v70.origin.CGFloat y = v31;
        v70.size.CGFloat width = v33;
        v70.size.CGFloat height = v35;
        CGRect v69 = CGRectIntersection(v68, v70);
        LOBYTE(v27) = CGRectIsEmpty(v69);
        uint64_t v36 = [v17 superlayer];
        long long v37 = v36;
        if (v27)
        {

          long long v38 = v11;
          if (!v37) {
            goto LABEL_9;
          }
LABEL_8:
          [v38 addObject:v17];
          goto LABEL_9;
        }

        long long v38 = v10;
        if (!v37) {
          goto LABEL_8;
        }
LABEL_9:
        ++v16;
      }
      while (v14 != v16);
      uint64_t v39 = [v12 countByEnumeratingWithState:&v60 objects:v66 count:16];
      uint64_t v14 = v39;
    }
    while (v39);
  }

  if ([v10 count] || objc_msgSend(v11, "count"))
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v40 = v11;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v56 objects:v65 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v57;
      do
      {
        uint64_t v44 = 0;
        do
        {
          if (*(void *)v57 != v43) {
            objc_enumerationMutation(v40);
          }
          [*(id *)(*((void *)&v56 + 1) + 8 * v44++) removeFromSuperlayer];
        }
        while (v42 != v44);
        uint64_t v42 = [v40 countByEnumeratingWithState:&v56 objects:v65 count:16];
      }
      while (v42);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v45 = v10;
    uint64_t v46 = [v45 countByEnumeratingWithState:&v52 objects:v64 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v53;
      do
      {
        uint64_t v49 = 0;
        do
        {
          if (*(void *)v53 != v48) {
            objc_enumerationMutation(v45);
          }
          uint64_t v50 = *(void *)(*((void *)&v52 + 1) + 8 * v49);
          id v51 = [(CKInvisibleInkTextEffectView *)self dustEmitterContainerLayer];
          [v51 insertSublayer:v50 atIndex:0];

          ++v49;
        }
        while (v47 != v49);
        uint64_t v47 = [v45 countByEnumeratingWithState:&v52 objects:v64 count:16];
      }
      while (v47);
    }

    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CKInvisibleInkEffectView *)self isPaused];
  v34.receiver = self;
  v34.super_class = (Class)CKInvisibleInkTextEffectView;
  [(CKInvisibleInkEffectView *)&v34 setPaused:v3];
  if (v5 != v3)
  {
    [MEMORY[0x1E4F39CF8] begin];
    double v6 = [(CKInvisibleInkTextEffectView *)self layer];
    double v8 = v6;
    if (v3)
    {
      [v6 setSpeed:0.0];

      uint64_t v9 = [(CKInvisibleInkTextEffectView *)self layer];
      uint64_t v10 = [(CKInvisibleInkTextEffectView *)self layer];
      uint64_t v11 = [v10 superlayer];
      [v11 convertTime:0 fromLayer:CACurrentMediaTime()];
      double v13 = v12;
      [v9 timeOffset];
      [v9 setTimeOffset:v13 + v14];

      uint64_t v15 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
      [v15 setSpeed:0.0];

      uint64_t v16 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
      uint64_t v17 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
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

      double v23 = [(CKInvisibleInkTextEffectView *)self layer];
      double v24 = [(CKInvisibleInkTextEffectView *)self layer];
      double v25 = [v24 superlayer];
      [v25 convertTime:0 fromLayer:CACurrentMediaTime()];
      double v27 = v26;
      [v23 timeOffset];
      [v23 setTimeOffset:v28 - v27];

      CGFloat v29 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
      LODWORD(v30) = 1.0;
      [v29 setSpeed:v30];

      uint64_t v16 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
      uint64_t v17 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
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
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(CKInvisibleInkEffectView *)self isSuspended];
  v36.receiver = self;
  v36.super_class = (Class)CKInvisibleInkTextEffectView;
  [(CKInvisibleInkEffectView *)&v36 setSuspended:v3];
  if (v5 != v3)
  {
    [(CKInvisibleInkTextEffectView *)self setUserInteractionEnabled:v3 ^ 1];
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    if (!v3)
    {
      double v6 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"birthRate"];
      [v6 setFromValue:&unk_1EDF15F38];
      [v6 setToValue:&unk_1EDF15F50];
      [v6 setDuration:1.0];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      double v7 = [(CKInvisibleInkTextEffectView *)self dustEmitterLayers];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v33 != v10) {
              objc_enumerationMutation(v7);
            }
            [*(id *)(*((void *)&v32 + 1) + 8 * i) addAnimation:v6 forKey:@"birthRate"];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
        }
        while (v9);
      }

      [(CKInvisibleInkTextEffectView *)self endDrawEmitterEffects];
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    double v12 = [(CKInvisibleInkTextEffectView *)self dustEmitterLayers];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v13)
    {
      uint64_t v15 = v13;
      uint64_t v16 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v12);
          }
          *(float *)&double v14 = (float)(v3 ^ 1);
          [*(id *)(*((void *)&v28 + 1) + 8 * j) setBirthRate:v14];
        }
        uint64_t v15 = [v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v15);
    }

    uint64_t v18 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"backgroundColor"];
    if (v3)
    {
      id v19 = [MEMORY[0x1E4F428B8] clearColor];
      objc_msgSend(v18, "setFromValue:", objc_msgSend(v19, "CGColor"));

      double v20 = [MEMORY[0x1E4F428B8] whiteColor];
      double v21 = 0.5;
    }
    else
    {
      id v22 = [MEMORY[0x1E4F428B8] whiteColor];
      objc_msgSend(v18, "setFromValue:", objc_msgSend(v22, "CGColor"));

      double v20 = [MEMORY[0x1E4F428B8] clearColor];
      double v21 = 3.0;
    }
    id v23 = v20;
    objc_msgSend(v18, "setToValue:", objc_msgSend(v23, "CGColor"));

    [v18 setDuration:v21];
    double v24 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
    [v18 setTimingFunction:v24];

    id v25 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
    [v25 addAnimation:v18 forKey:@"backgroundColor"];

    if (v3)
    {
      id v25 = [MEMORY[0x1E4F428B8] whiteColor];
      uint64_t v26 = [v25 CGColor];
    }
    else
    {
      uint64_t v26 = 0;
    }
    double v27 = [(CKInvisibleInkTextEffectView *)self textDrawEmitterLayer];
    [v27 setBackgroundColor:v26];

    if (v3) {
    [MEMORY[0x1E4F39CF8] commit];
    }
  }
}

- (CKTextBalloonView)balloonView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_balloonView);

  return (CKTextBalloonView *)WeakRetained;
}

- (void)setBalloonView:(id)a3
{
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (CAEmitterLayer)textDrawEmitterLayer
{
  return self->_textDrawEmitterLayer;
}

- (void)setTextDrawEmitterLayer:(id)a3
{
}

- (CALayer)dustEmitterContainerLayer
{
  return self->_dustEmitterContainerLayer;
}

- (void)setDustEmitterContainerLayer:(id)a3
{
}

- (NSArray)dustEmitterLayers
{
  return self->_dustEmitterLayers;
}

- (void)setDustEmitterLayers:(id)a3
{
}

- (CAEmitterLayer)dustDrawEmitterLayer
{
  return self->_dustDrawEmitterLayer;
}

- (void)setDustDrawEmitterLayer:(id)a3
{
}

- (BOOL)blendingEnabled
{
  return self->_blendingEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dustDrawEmitterLayer, 0);
  objc_storeStrong((id *)&self->_dustEmitterLayers, 0);
  objc_storeStrong((id *)&self->_dustEmitterContainerLayer, 0);
  objc_storeStrong((id *)&self->_textDrawEmitterLayer, 0);
  objc_storeStrong((id *)&self->_textView, 0);

  objc_destroyWeak((id *)&self->_balloonView);
}

@end