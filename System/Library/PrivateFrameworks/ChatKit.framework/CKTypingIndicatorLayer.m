@interface CKTypingIndicatorLayer
+ (CGPoint)largeBubbleGrowOffset;
+ (CGPoint)mediumBubbleGrowOffset;
+ (CGPoint)smallBubbleGrowOffset;
+ (CGPoint)thinkingDotsOffset;
+ (CGRect)iconImageFrame;
+ (CGRect)largeBubbleFrame;
+ (CGRect)mediumBubbleFrame;
+ (CGRect)smallBubbleFrame;
+ (CGSize)defaultSize;
+ (double)iconImageTrailingSpace;
+ (double)thinkingDotDiameter;
+ (double)thinkingDotSpace;
- (BOOL)hasDarkBackground;
- (BOOL)isHighlighted;
- (CALayer)bubbleContainer;
- (CALayer)iconImageLayer;
- (CALayer)largeBubble;
- (CALayer)mediumBubble;
- (CALayer)smallBubble;
- (CALayer)thinkingDot;
- (CALayer)thinkingDotContainer;
- (CAReplicatorLayer)thinkingDots;
- (CKTypingIndicatorLayer)init;
- (UIColor)bubbleColor;
- (UIColor)customBubbleColor;
- (UIColor)defaultBubbleColor;
- (UIColor)defaultThinkingDotColor;
- (UIColor)thinkingDotColor;
- (UITraitCollection)traitCollection;
- (double)bubbleOpacity;
- (double)convertedCurrentMediaTime;
- (double)defaultBubbleOpacity;
- (double)defaultThinkingDotOpacity;
- (double)thinkingDotOpacity;
- (id)_largeBubbleGrowAnimationsWithSpeed:(double)a3 offset:(CGPoint)a4;
- (id)_largeBubblePulseAnimationWithSpeed:(double)a3 delay:(double)a4;
- (id)_mediumBubbleGrowAnimationsWithSpeed:(double)a3 offset:(CGPoint)a4;
- (id)_mediumBubblePulseAnimationWithSpeed:(double)a3 delay:(double)a4;
- (id)_smallBubbleGrowAnimationsWithSpeed:(double)a3 offset:(CGPoint)a4;
- (id)_smallBubblePulseAnimationWithSpeed:(double)a3 delay:(double)a4;
- (id)iconImage;
- (id)initHighlighted:(BOOL)a3;
- (id)resolvedColor:(id)a3 forTraitCollection:(id)a4;
- (void)_buildIconImage;
- (void)_buildThinkingDots;
- (void)_setup;
- (void)_updateBubbleColors;
- (void)_updateBubbleOpacity;
- (void)_updateForImage;
- (void)setBubbleColor:(id)a3;
- (void)setBubbleContainer:(id)a3;
- (void)setBubbleOpacity:(double)a3;
- (void)setCustomBubbleColor:(id)a3;
- (void)setHasDarkBackground:(BOOL)a3;
- (void)setIconImage:(id)a3;
- (void)setIconImageLayer:(id)a3;
- (void)setLargeBubble:(id)a3;
- (void)setMediumBubble:(id)a3;
- (void)setSmallBubble:(id)a3;
- (void)setThinkingDot:(id)a3;
- (void)setThinkingDotColor:(id)a3;
- (void)setThinkingDotContainer:(id)a3;
- (void)setThinkingDotOpacity:(double)a3;
- (void)setThinkingDots:(id)a3;
- (void)setTraitCollection:(id)a3;
- (void)startGrowAnimation;
- (void)startGrowAnimationWithCompletionBlock:(id)a3;
- (void)startPulseAnimation;
- (void)startShrinkAnimationWithCompletionBlock:(id)a3;
- (void)stopAnimation;
- (void)stopPulseAnimation;
@end

@implementation CKTypingIndicatorLayer

- (CKTypingIndicatorLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKTypingIndicatorLayer;
  v2 = [(CKTypingIndicatorLayer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CKTypingIndicatorLayer *)v2 _setup];
  }
  return v3;
}

- (id)initHighlighted:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKTypingIndicatorLayer;
  v4 = [(CKTypingIndicatorLayer *)&v7 init];
  objc_super v5 = v4;
  if (v4)
  {
    v4->_highlighted = a3;
    [(CKTypingIndicatorLayer *)v4 _setup];
  }
  return v5;
}

- (double)convertedCurrentMediaTime
{
  double v3 = CACurrentMediaTime();

  [(CKTypingIndicatorLayer *)self convertTime:0 fromLayer:v3];
  return result;
}

- (void)setBubbleColor:(id)a3
{
  objc_super v5 = (UIColor *)a3;
  if (self->_bubbleColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_bubbleColor, a3);
    [(CKTypingIndicatorLayer *)self _updateBubbleColors];
    objc_super v5 = v6;
  }
}

- (void)setBubbleOpacity:(double)a3
{
  if (self->_bubbleOpacity != a3)
  {
    self->_bubbleOpacity = a3;
    [(CKTypingIndicatorLayer *)self _updateBubbleOpacity];
  }
}

- (id)resolvedColor:(id)a3 forTraitCollection:(id)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4)
  {
    id v7 = [v5 resolvedColorWithTraitCollection:a4];
  }
  else
  {
    id v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (void)setTraitCollection:(id)a3
{
  id v5 = (UITraitCollection *)a3;
  p_traitCollection = &self->_traitCollection;
  if (self->_traitCollection != v5)
  {
    v15 = v5;
    objc_storeStrong((id *)&self->_traitCollection, a3);
    id v7 = [(CKTypingIndicatorLayer *)self defaultThinkingDotColor];
    v8 = [(CKTypingIndicatorLayer *)self resolvedColor:v7 forTraitCollection:*p_traitCollection];
    thinkingDotColor = self->_thinkingDotColor;
    self->_thinkingDotColor = v8;

    v10 = [(CKTypingIndicatorLayer *)self defaultBubbleColor];
    v11 = [(CKTypingIndicatorLayer *)self resolvedColor:v10 forTraitCollection:*p_traitCollection];
    bubbleColor = self->_bubbleColor;
    self->_bubbleColor = v11;

    [(CKTypingIndicatorLayer *)self _updateBubbleColors];
    thinkingDot = self->_thinkingDot;
    id v14 = [(CKTypingIndicatorLayer *)self thinkingDotColor];
    -[CALayer setBackgroundColor:](thinkingDot, "setBackgroundColor:", [v14 CGColor]);

    id v5 = v15;
  }
}

- (void)setIconImage:(id)a3
{
  id v5 = a3;
  id iconImage = self->_iconImage;
  if (iconImage != v5)
  {
    id v8 = v5;
    char v7 = [iconImage isEqual:v5];
    id v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong(&self->_iconImage, a3);
      [(CKTypingIndicatorLayer *)self _updateForImage];
      id v5 = v8;
    }
  }
}

- (void)_setup
{
  id v53 = [(CKTypingIndicatorLayer *)self defaultThinkingDotColor];
  double v3 = [(CKTypingIndicatorLayer *)self resolvedColor:v53 forTraitCollection:self->_traitCollection];
  thinkingDotColor = self->_thinkingDotColor;
  self->_thinkingDotColor = v3;

  id v5 = [(CKTypingIndicatorLayer *)self defaultBubbleColor];
  v6 = [(CKTypingIndicatorLayer *)self resolvedColor:v5 forTraitCollection:self->_traitCollection];
  bubbleColor = self->_bubbleColor;
  self->_bubbleColor = v6;

  [(CKTypingIndicatorLayer *)self defaultThinkingDotOpacity];
  self->_thinkingDotOpacity = v8;
  [(CKTypingIndicatorLayer *)self defaultBubbleOpacity];
  self->_bubbleOpacity = v9;
  [(CKTypingIndicatorLayer *)self frame];
  double v11 = v10;
  double v13 = v12;
  [(id)objc_opt_class() defaultSize];
  -[CKTypingIndicatorLayer setFrame:](self, "setFrame:", v11, v13, v14, v15);
  v16 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
  bubbleContainer = self->_bubbleContainer;
  self->_bubbleContainer = v16;

  v18 = self->_bubbleContainer;
  [(CKTypingIndicatorLayer *)self bounds];
  -[CALayer setFrame:](v18, "setFrame:");
  [(CALayer *)self->_bubbleContainer setAllowsGroupOpacity:1];
  [(CKTypingIndicatorLayer *)self addSublayer:self->_bubbleContainer];
  v19 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
  smallBubble = self->_smallBubble;
  self->_smallBubble = v19;

  [(id)objc_opt_class() smallBubbleFrame];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  [(CALayer *)self->_smallBubble setCornerRadius:v25 * 0.5];
  -[CALayer setAnchorPoint:](self->_smallBubble, "setAnchorPoint:", 0.318, 0.318);
  -[CALayer setPosition:](self->_smallBubble, "setPosition:", v22, v24);
  -[CALayer setBounds:](self->_smallBubble, "setBounds:", 0.0, 0.0, v26, v28);
  [(CALayer *)self->_bubbleContainer addSublayer:self->_smallBubble];
  v29 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
  mediumBubble = self->_mediumBubble;
  self->_mediumBubble = v29;

  [(id)objc_opt_class() mediumBubbleFrame];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  [(CALayer *)self->_mediumBubble setCornerRadius:v37 * 0.5];
  -[CALayer setAnchorPoint:](self->_mediumBubble, "setAnchorPoint:", 0.326, 0.37);
  -[CALayer setPosition:](self->_mediumBubble, "setPosition:", v32, v34);
  -[CALayer setBounds:](self->_mediumBubble, "setBounds:", 0.0, 0.0, v36, v38);
  [(CALayer *)self->_bubbleContainer addSublayer:self->_mediumBubble];
  v39 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
  largeBubble = self->_largeBubble;
  self->_largeBubble = v39;

  [(id)objc_opt_class() largeBubbleFrame];
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  [(CALayer *)self->_largeBubble setCornerRadius:v47 * 0.5];
  -[CALayer setAnchorPoint:](self->_largeBubble, "setAnchorPoint:", 0.185, 0.28);
  -[CALayer setPosition:](self->_largeBubble, "setPosition:", v42, v44);
  -[CALayer setBounds:](self->_largeBubble, "setBounds:", 0.0, 0.0, v46, v48);
  [(CALayer *)self->_bubbleContainer addSublayer:self->_largeBubble];
  v49 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
  thinkingDotContainer = self->_thinkingDotContainer;
  self->_thinkingDotContainer = v49;

  v51 = self->_thinkingDotContainer;
  v52 = [(CKTypingIndicatorLayer *)self largeBubble];
  [v52 anchorPoint];
  -[CALayer setAnchorPoint:](v51, "setAnchorPoint:");

  -[CALayer setPosition:](self->_thinkingDotContainer, "setPosition:", v42, v44);
  -[CALayer setBounds:](self->_thinkingDotContainer, "setBounds:", 0.0, 0.0, v46, v48);
  [(CKTypingIndicatorLayer *)self addSublayer:self->_thinkingDotContainer];
  [(CKTypingIndicatorLayer *)self _updateBubbleColors];
  [(CKTypingIndicatorLayer *)self _updateBubbleOpacity];
  [(CKTypingIndicatorLayer *)self _updateForImage];
}

- (void)_updateForImage
{
  id v14 = [(CKTypingIndicatorLayer *)self largeBubble];
  [v14 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(id)objc_opt_class() largeBubbleFrame];
  double v10 = v9;
  if (self->_iconImage)
  {
    [(id)objc_opt_class() iconImageFrame];
    double MaxX = CGRectGetMaxX(v16);
  }
  else
  {
    double MaxX = 0.0;
  }
  double v12 = v10 + MaxX;
  double v13 = [(CKTypingIndicatorLayer *)self largeBubble];
  objc_msgSend(v13, "setFrame:", v4, v6, v12, v8);

  [(CKTypingIndicatorLayer *)self _buildIconImage];
  [(CKTypingIndicatorLayer *)self _buildThinkingDots];
}

- (void)_buildIconImage
{
  double v3 = [(CKTypingIndicatorLayer *)self iconImageLayer];
  if (self->_iconImage)
  {
    if (v3)
    {
      id v18 = v3;
      objc_msgSend(v3, "setContents:");
    }
    else
    {
      id v18 = [MEMORY[0x1E4F39BE8] layer];
      [(id)objc_opt_class() iconImageFrame];
      double v5 = v4;
      objc_msgSend(v18, "setFrame:");
      id iconImage = self->_iconImage;
      double v7 = [MEMORY[0x1E4F42D90] mainScreen];
      [v7 scale];
      double v9 = v8;

      if (v9 == 1.0)
      {
        uint64_t v10 = 73;
      }
      else
      {
        double v11 = [MEMORY[0x1E4F42D90] mainScreen];
        [v11 scale];
        double v13 = v12;

        if (v13 == 2.0) {
          uint64_t v10 = 74;
        }
        else {
          uint64_t v10 = 75;
        }
      }
      id v14 = (uint64_t (*)(id, uint64_t, void))MEMORY[0x192FBA870]("LICreateIconForImage", @"MobileIcons");
      uint64_t v15 = v14(iconImage, v10, 0);
      if (v15)
      {
        CGRect v16 = (const void *)v15;
        [v18 setContents:v15];
        CFAutorelease(v16);
      }
      else
      {
        [v18 setMasksToBounds:1];
        [v18 setCornerCurve:*MEMORY[0x1E4F39EA8]];
        [v18 setCornerRadius:v5 * 0.5];
        [v18 setContents:self->_iconImage];
      }
      [(CKTypingIndicatorLayer *)self setIconImageLayer:v18];
      v17 = [(CKTypingIndicatorLayer *)self largeBubble];
      [v17 addSublayer:v18];
    }
  }
  else
  {
    id v18 = v3;
    [v3 removeFromSuperlayer];
    [(CKTypingIndicatorLayer *)self setIconImageLayer:0];
  }
}

- (void)_buildThinkingDots
{
  v33[2] = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.0];
  [(CALayer *)self->_thinkingDot removeAllAnimations];
  [(CAReplicatorLayer *)self->_thinkingDots removeFromSuperlayer];
  [(CALayer *)self->_thinkingDot removeFromSuperlayer];
  thinkingDot = self->_thinkingDot;
  self->_thinkingDot = 0;

  thinkingDots = self->_thinkingDots;
  self->_thinkingDots = 0;

  double v5 = [MEMORY[0x1E4F39BE8] layer];
  double v6 = self->_thinkingDot;
  self->_thinkingDot = v5;

  [(id)objc_opt_class() thinkingDotDiameter];
  double v8 = v7;
  -[CALayer setFrame:](self->_thinkingDot, "setFrame:", 0.0, 0.0, v8, v8);
  [(CALayer *)self->_thinkingDot setCornerRadius:v8 * 0.5];
  double v9 = self->_thinkingDot;
  id v10 = [(CKTypingIndicatorLayer *)self thinkingDotColor];
  -[CALayer setBackgroundColor:](v9, "setBackgroundColor:", [v10 CGColor]);

  double v11 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  v33[0] = &unk_1EDF170A8;
  double v12 = NSNumber;
  [(CKTypingIndicatorLayer *)self thinkingDotOpacity];
  double v13 = objc_msgSend(v12, "numberWithDouble:");
  v33[1] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  [v11 setValues:v14];

  [v11 setKeyTimes:&unk_1EDF15260];
  [v11 setCalculationMode:*MEMORY[0x1E4F39D80]];
  [v11 setDuration:0.5];
  LODWORD(v15) = 1061271823;
  LODWORD(v16) = 1014679044;
  LODWORD(v17) = 1058306785;
  LODWORD(v18) = 1.0;
  v19 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v15 :v16 :v17 :v18];
  [v11 setTimingFunction:v19];

  LODWORD(v20) = 2139095040;
  [v11 setRepeatCount:v20];
  [v11 setAutoreverses:1];
  [v11 setFillMode:*MEMORY[0x1E4F39FA0]];
  [(CALayer *)self->_thinkingDot addAnimation:v11 forKey:@"Opacity"];
  double v21 = [MEMORY[0x1E4F39C68] layer];
  double v22 = self->_thinkingDots;
  self->_thinkingDots = v21;

  [(id)objc_opt_class() thinkingDotsOffset];
  double v24 = v23;
  double v26 = v25;
  double v27 = [(CKTypingIndicatorLayer *)self iconImage];
  if (v27)
  {
    [(id)objc_opt_class() iconImageFrame];
    double MaxX = CGRectGetMaxX(v34);
    [(id)objc_opt_class() iconImageTrailingSpace];
    double v24 = MaxX + v29;
  }

  -[CAReplicatorLayer setFrame:](self->_thinkingDots, "setFrame:", v24, v26, 0.0, 0.0);
  [(CAReplicatorLayer *)self->_thinkingDots setInstanceCount:3];
  v30 = self->_thinkingDots;
  [(id)objc_opt_class() thinkingDotSpace];
  CATransform3DMakeTranslation(&v32, v31, 0.0, 0.0);
  [(CAReplicatorLayer *)v30 setInstanceTransform:&v32];
  [(CAReplicatorLayer *)self->_thinkingDots setInstanceDelay:0.25];
  [(CAReplicatorLayer *)self->_thinkingDots addSublayer:self->_thinkingDot];
  [(CALayer *)self->_thinkingDotContainer addSublayer:self->_thinkingDots];
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)_updateBubbleColors
{
  id v3 = [(CKTypingIndicatorLayer *)self bubbleColor];
  uint64_t v4 = [v3 CGColor];

  double v5 = [(CKTypingIndicatorLayer *)self largeBubble];
  [v5 setBackgroundColor:v4];

  double v6 = [(CKTypingIndicatorLayer *)self mediumBubble];
  [v6 setBackgroundColor:v4];

  id v7 = [(CKTypingIndicatorLayer *)self smallBubble];
  [v7 setBackgroundColor:v4];
}

- (void)_updateBubbleOpacity
{
  id v3 = [(CKTypingIndicatorLayer *)self largeBubble];
  LODWORD(v4) = 1.0;
  [v3 setOpacity:v4];

  double v5 = [(CKTypingIndicatorLayer *)self mediumBubble];
  LODWORD(v6) = 1.0;
  [v5 setOpacity:v6];

  id v7 = [(CKTypingIndicatorLayer *)self smallBubble];
  LODWORD(v8) = 1.0;
  [v7 setOpacity:v8];

  bubbleContainer = self->_bubbleContainer;
  [(CKTypingIndicatorLayer *)self bubbleOpacity];
  *(float *)&double v10 = v10;

  [(CALayer *)bubbleContainer setOpacity:v10];
}

- (id)_smallBubbleGrowAnimationsWithSpeed:(double)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v60[3] = *MEMORY[0x1E4F143B8];
  id v7 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"hidden"];
  double v8 = [NSNumber numberWithBool:1];
  [v7 setFromValue:v8];

  double v9 = [NSNumber numberWithBool:0];
  [v7 setToValue:v9];

  [v7 setDuration:0.0];
  uint64_t v10 = *MEMORY[0x1E4F39FA8];
  [v7 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v7 setRemovedOnCompletion:1];
  [(id)objc_opt_class() smallBubbleGrowOffset];
  double v12 = v11;
  double v14 = v13;
  double v15 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position.x"];
  float v16 = x;
  *(float *)&double v17 = v16;
  double v18 = [NSNumber numberWithFloat:v17];
  v60[0] = v18;
  double v19 = x + v12;
  *(float *)&double v19 = x + v12;
  double v20 = [NSNumber numberWithFloat:v19];
  v60[1] = v20;
  *(float *)&double v21 = x;
  double v22 = [NSNumber numberWithFloat:v21];
  v60[2] = v22;
  double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:3];
  [v15 setValues:v23];

  uint64_t v24 = *MEMORY[0x1E4F39D70];
  [v15 setCalculationMode:*MEMORY[0x1E4F39D70]];
  [v15 setDuration:0.4];
  LODWORD(v25) = 0.25;
  LODWORD(v26) = 0.25;
  LODWORD(v27) = 1.0;
  LODWORD(v28) = 1036831949;
  double v29 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v25 :v28 :v26 :v27];
  [v15 setTimingFunction:v29];

  *(float *)&a3 = a3;
  LODWORD(v30) = LODWORD(a3);
  [v15 setSpeed:v30];
  [v15 setFillMode:v10];
  [v15 setRemovedOnCompletion:1];
  CGFloat v31 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position.y"];
  float v32 = y;
  *(float *)&double v33 = v32;
  CGRect v34 = [NSNumber numberWithFloat:v33];
  v59[0] = v34;
  double v35 = y + v14;
  *(float *)&double v35 = y + v14;
  double v36 = [NSNumber numberWithFloat:v35];
  v59[1] = v36;
  *(float *)&double v37 = y;
  double v38 = [NSNumber numberWithFloat:v37];
  v59[2] = v38;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:3];
  [v31 setValues:v39];

  [v31 setCalculationMode:v24];
  [v31 setDuration:0.4];
  LODWORD(v40) = 1051315048;
  LODWORD(v41) = 1057991709;
  LODWORD(v42) = 1064582806;
  LODWORD(v43) = 1036831949;
  double v44 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v40 :v43 :v41 :v42];
  [v31 setTimingFunction:v44];

  LODWORD(v45) = LODWORD(a3);
  [v31 setSpeed:v45];
  [v31 setFillMode:v10];
  [v31 setRemovedOnCompletion:1];
  double v46 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.scale.xy"];
  double v47 = [NSNumber numberWithFloat:0.0];
  [v46 setFromValue:v47];

  LODWORD(v48) = 1.0;
  v49 = [NSNumber numberWithFloat:v48];
  [v46 setToValue:v49];

  [v46 setDuration:0.25];
  LODWORD(v50) = LODWORD(a3);
  [v46 setSpeed:v50];
  LODWORD(v51) = 0.25;
  LODWORD(v52) = 0.25;
  LODWORD(v53) = 1.0;
  LODWORD(v54) = 1036831949;
  v55 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v51 :v54 :v52 :v53];
  [v46 setTimingFunction:v55];

  [v46 setFillMode:v10];
  [v46 setRemovedOnCompletion:1];
  v58[0] = v7;
  v58[1] = v15;
  v58[2] = v31;
  v58[3] = v46;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:4];

  return v56;
}

- (id)_smallBubblePulseAnimationWithSpeed:(double)a3 delay:(double)a4
{
  id v7 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.scale.xy"];
  [v7 setValues:&unk_1EDF15278];
  [v7 setCalculationMode:*MEMORY[0x1E4F39D70]];
  [v7 setTensionValues:&unk_1EDF15290];
  [v7 setDuration:0.7];
  [(CKTypingIndicatorLayer *)self convertedCurrentMediaTime];
  [v7 setBeginTime:v8 + a4];
  *(float *)&double v9 = a3;
  [v7 setSpeed:v9];
  uint64_t v10 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v7 setTimingFunction:v10];

  LODWORD(v11) = 2139095040;
  [v7 setRepeatCount:v11];
  [v7 setAutoreverses:1];
  [v7 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v7 setRemovedOnCompletion:0];

  return v7;
}

- (id)_mediumBubbleGrowAnimationsWithSpeed:(double)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v66[3] = *MEMORY[0x1E4F143B8];
  double v8 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"hidden"];
  double v9 = [NSNumber numberWithBool:1];
  [v8 setFromValue:v9];

  uint64_t v10 = [NSNumber numberWithBool:0];
  [v8 setToValue:v10];

  [v8 setDuration:0.25];
  uint64_t v11 = *MEMORY[0x1E4F39FA8];
  [v8 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v8 setRemovedOnCompletion:1];
  v63 = self;
  [(id)objc_opt_class() mediumBubbleGrowOffset];
  double v13 = v12;
  double v15 = v14;
  float v16 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position.x"];
  float v17 = x;
  *(float *)&double v18 = v17;
  double v19 = [NSNumber numberWithFloat:v18];
  v66[0] = v19;
  double v20 = x + v13;
  *(float *)&double v20 = x + v13;
  double v21 = [NSNumber numberWithFloat:v20];
  v66[1] = v21;
  *(float *)&double v22 = x;
  double v23 = [NSNumber numberWithFloat:v22];
  v66[2] = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:3];
  [v16 setValues:v24];

  uint64_t v25 = *MEMORY[0x1E4F39D70];
  [v16 setCalculationMode:*MEMORY[0x1E4F39D70]];
  [(CKTypingIndicatorLayer *)self convertedCurrentMediaTime];
  [v16 setBeginTime:v26 + 0.065];
  [v16 setDuration:0.4];
  LODWORD(v27) = 0.25;
  LODWORD(v28) = 0.25;
  LODWORD(v29) = 1.0;
  LODWORD(v30) = 1036831949;
  CGFloat v31 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v27 :v30 :v28 :v29];
  [v16 setTimingFunction:v31];

  *(float *)&a3 = a3;
  LODWORD(v32) = LODWORD(a3);
  [v16 setSpeed:v32];
  uint64_t v33 = v11;
  [v16 setFillMode:v11];
  [v16 setRemovedOnCompletion:1];
  CGRect v34 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position.y"];
  float v35 = y;
  *(float *)&double v36 = v35;
  double v37 = [NSNumber numberWithFloat:v36];
  v65[0] = v37;
  double v38 = y + v15;
  *(float *)&double v38 = y + v15;
  v39 = [NSNumber numberWithFloat:v38];
  v65[1] = v39;
  *(float *)&double v40 = y;
  double v41 = [NSNumber numberWithFloat:v40];
  v65[2] = v41;
  double v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:3];
  [v34 setValues:v42];

  [v34 setCalculationMode:v25];
  [(CKTypingIndicatorLayer *)v63 convertedCurrentMediaTime];
  [v34 setBeginTime:v43 + 0.065];
  [v34 setDuration:0.4];
  LODWORD(v44) = 1051315048;
  LODWORD(v45) = 1057991709;
  LODWORD(v46) = 1064582806;
  LODWORD(v47) = 1036831949;
  double v48 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v44 :v47 :v45 :v46];
  [v34 setTimingFunction:v48];

  LODWORD(v49) = LODWORD(a3);
  [v34 setSpeed:v49];
  [v34 setFillMode:v33];
  [v34 setRemovedOnCompletion:1];
  double v50 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.scale.xy"];
  double v51 = [NSNumber numberWithFloat:0.0];
  [v50 setFromValue:v51];

  LODWORD(v52) = 1.0;
  double v53 = [NSNumber numberWithFloat:v52];
  [v50 setToValue:v53];

  [(CKTypingIndicatorLayer *)v63 convertedCurrentMediaTime];
  [v50 setBeginTime:v54 + 0.065];
  [v50 setDuration:0.25];
  LODWORD(v55) = LODWORD(a3);
  [v50 setSpeed:v55];
  LODWORD(v56) = 0.25;
  LODWORD(v57) = 0.25;
  LODWORD(v58) = 1.0;
  LODWORD(v59) = 1036831949;
  v60 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v56 :v59 :v57 :v58];
  [v50 setTimingFunction:v60];

  [v50 setFillMode:v33];
  [v50 setRemovedOnCompletion:1];
  v64[0] = v8;
  v64[1] = v16;
  v64[2] = v34;
  v64[3] = v50;
  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:4];

  return v61;
}

- (id)_mediumBubblePulseAnimationWithSpeed:(double)a3 delay:(double)a4
{
  id v7 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.scale.xy"];
  [v7 setValues:&unk_1EDF152A8];
  [v7 setCalculationMode:*MEMORY[0x1E4F39D70]];
  [v7 setTensionValues:&unk_1EDF152C0];
  [(CKTypingIndicatorLayer *)self convertedCurrentMediaTime];
  [v7 setBeginTime:v8 + a4];
  [v7 setDuration:0.9];
  *(float *)&double v9 = a3;
  [v7 setSpeed:v9];
  uint64_t v10 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v7 setTimingFunction:v10];

  LODWORD(v11) = 2139095040;
  [v7 setRepeatCount:v11];
  [v7 setAutoreverses:1];
  [v7 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v7 setRemovedOnCompletion:0];

  return v7;
}

- (id)_largeBubbleGrowAnimationsWithSpeed:(double)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v68[3] = *MEMORY[0x1E4F143B8];
  double v8 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"hidden"];
  double v9 = [NSNumber numberWithBool:1];
  [v8 setFromValue:v9];

  uint64_t v10 = [NSNumber numberWithBool:0];
  [v8 setToValue:v10];

  [v8 setDuration:0.25];
  uint64_t v11 = *MEMORY[0x1E4F39FA8];
  [v8 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v8 setRemovedOnCompletion:1];
  v65 = self;
  [(id)objc_opt_class() largeBubbleGrowOffset];
  double v13 = v12;
  double v15 = v14;
  float v16 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position.x"];
  float v17 = x;
  *(float *)&double v18 = v17;
  double v19 = [NSNumber numberWithFloat:v18];
  v68[0] = v19;
  double v20 = x + v13;
  *(float *)&double v20 = x + v13;
  double v21 = [NSNumber numberWithFloat:v20];
  v68[1] = v21;
  *(float *)&double v22 = x;
  double v23 = [NSNumber numberWithFloat:v22];
  v68[2] = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:3];
  [v16 setValues:v24];

  uint64_t v25 = *MEMORY[0x1E4F39D70];
  [v16 setCalculationMode:*MEMORY[0x1E4F39D70]];
  [(CKTypingIndicatorLayer *)self convertedCurrentMediaTime];
  double v27 = v26;
  double v28 = +[CKUIBehavior sharedBehaviors];
  [v28 transcriptTypingIndicatorLargeBubbleGrowBeginTime];
  [v16 setBeginTime:v27 + v29];

  [v16 setDuration:0.4];
  LODWORD(v30) = 0.25;
  LODWORD(v31) = 0.25;
  LODWORD(v32) = 1.0;
  LODWORD(v33) = 1036831949;
  CGRect v34 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v30 :v33 :v31 :v32];
  [v16 setTimingFunction:v34];

  *(float *)&a3 = a3;
  LODWORD(v35) = LODWORD(a3);
  [v16 setSpeed:v35];
  [v16 setFillMode:v11];
  [v16 setRemovedOnCompletion:1];
  double v36 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position.y"];
  float v37 = y;
  *(float *)&double v38 = v37;
  v39 = [NSNumber numberWithFloat:v38];
  v67[0] = v39;
  double v40 = y + v15;
  *(float *)&double v40 = y + v15;
  double v41 = [NSNumber numberWithFloat:v40];
  v67[1] = v41;
  *(float *)&double v42 = y;
  double v43 = [NSNumber numberWithFloat:v42];
  v67[2] = v43;
  double v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:3];
  [v36 setValues:v44];

  [v36 setCalculationMode:v25];
  [(CKTypingIndicatorLayer *)v65 convertedCurrentMediaTime];
  [v36 setBeginTime:v45 + 0.12];
  [v36 setDuration:0.4];
  LODWORD(v46) = 1045836616;
  LODWORD(v47) = 1048849804;
  LODWORD(v48) = 1057991709;
  LODWORD(v49) = 1064582806;
  double v50 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v46 :v47 :v48 :v49];
  [v36 setTimingFunction:v50];

  LODWORD(v51) = LODWORD(a3);
  [v36 setSpeed:v51];
  [v36 setFillMode:v11];
  [v36 setRemovedOnCompletion:1];
  double v52 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.scale.xy"];
  double v53 = [NSNumber numberWithFloat:0.0];
  [v52 setFromValue:v53];

  LODWORD(v54) = 1.0;
  double v55 = [NSNumber numberWithFloat:v54];
  [v52 setToValue:v55];

  [(CKTypingIndicatorLayer *)v65 convertedCurrentMediaTime];
  [v52 setBeginTime:v56 + 0.12];
  [v52 setDuration:0.25];
  LODWORD(v57) = LODWORD(a3);
  [v52 setSpeed:v57];
  LODWORD(v58) = 0.25;
  LODWORD(v59) = 0.25;
  LODWORD(v60) = 1.0;
  LODWORD(v61) = 1036831949;
  v62 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v58 :v61 :v59 :v60];
  [v52 setTimingFunction:v62];

  [v52 setFillMode:v11];
  [v52 setRemovedOnCompletion:1];
  v66[0] = v8;
  v66[1] = v16;
  v66[2] = v36;
  v66[3] = v52;
  v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:4];

  return v63;
}

- (id)_largeBubblePulseAnimationWithSpeed:(double)a3 delay:(double)a4
{
  id v7 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.scale.xy"];
  [v7 setValues:&unk_1EDF152D8];
  [v7 setCalculationMode:*MEMORY[0x1E4F39D70]];
  [v7 setTensionValues:&unk_1EDF152F0];
  [(CKTypingIndicatorLayer *)self convertedCurrentMediaTime];
  [v7 setBeginTime:v8 + a4];
  [v7 setDuration:1.9];
  *(float *)&double v9 = a3;
  [v7 setSpeed:v9];
  uint64_t v10 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v7 setTimingFunction:v10];

  LODWORD(v11) = 2139095040;
  [v7 setRepeatCount:v11];
  [v7 setAutoreverses:1];
  [v7 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v7 setRemovedOnCompletion:0];

  return v7;
}

- (void)startGrowAnimationWithCompletionBlock:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F39CF8] begin];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  [(id)objc_opt_class() smallBubbleFrame];
  id v7 = -[CKTypingIndicatorLayer _smallBubbleGrowAnimationsWithSpeed:offset:](self, "_smallBubbleGrowAnimationsWithSpeed:offset:", 1.0, v5, v6);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v54;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v54 != v10) {
          objc_enumerationMutation(v7);
        }
        [(CALayer *)self->_smallBubble addAnimation:*(void *)(*((void *)&v53 + 1) + 8 * v11++) forKey:0];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v9);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  [(id)objc_opt_class() mediumBubbleFrame];
  double v14 = -[CKTypingIndicatorLayer _mediumBubbleGrowAnimationsWithSpeed:offset:](self, "_mediumBubbleGrowAnimationsWithSpeed:offset:", 1.0, v12, v13);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v50;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v50 != v17) {
          objc_enumerationMutation(v14);
        }
        [(CALayer *)self->_mediumBubble addAnimation:*(void *)(*((void *)&v49 + 1) + 8 * v18++) forKey:0];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v16);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  [(CALayer *)self->_largeBubble position];
  double v21 = -[CKTypingIndicatorLayer _largeBubbleGrowAnimationsWithSpeed:offset:](self, "_largeBubbleGrowAnimationsWithSpeed:offset:", 1.0, v19, v20);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v58 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v46;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v46 != v24) {
          objc_enumerationMutation(v21);
        }
        [(CALayer *)self->_largeBubble addAnimation:*(void *)(*((void *)&v45 + 1) + 8 * v25++) forKey:0];
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v45 objects:v58 count:16];
    }
    while (v23);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  [(CALayer *)self->_largeBubble position];
  double v28 = -[CKTypingIndicatorLayer _largeBubbleGrowAnimationsWithSpeed:offset:](self, "_largeBubbleGrowAnimationsWithSpeed:offset:", 1.0, v26, v27);
  uint64_t v29 = [v28 countByEnumeratingWithState:&v41 objects:v57 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v42;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v42 != v31) {
          objc_enumerationMutation(v28);
        }
        [(CALayer *)self->_thinkingDotContainer addAnimation:*(void *)(*((void *)&v41 + 1) + 8 * v32++) forKey:0];
      }
      while (v30 != v32);
      uint64_t v30 = [v28 countByEnumeratingWithState:&v41 objects:v57 count:16];
    }
    while (v30);
  }

  double v33 = (void *)MEMORY[0x1E4F39CF8];
  uint64_t v35 = MEMORY[0x1E4F143A8];
  uint64_t v36 = 3221225472;
  float v37 = __64__CKTypingIndicatorLayer_startGrowAnimationWithCompletionBlock___block_invoke;
  double v38 = &unk_1E5622330;
  v39 = self;
  id v40 = v4;
  id v34 = v4;
  [v33 setCompletionBlock:&v35];
  objc_msgSend(MEMORY[0x1E4F39CF8], "commit", v35, v36, v37, v38, v39);
}

uint64_t __64__CKTypingIndicatorLayer_startGrowAnimationWithCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateBubbleOpacity];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)startGrowAnimation
{
}

- (void)startPulseAnimation
{
  [(CKTypingIndicatorLayer *)self stopPulseAnimation];
  [MEMORY[0x1E4F39CF8] begin];
  smallBubble = self->_smallBubble;
  id v4 = [(CKTypingIndicatorLayer *)self _smallBubblePulseAnimationWithSpeed:1.0 delay:0.25];
  [(CALayer *)smallBubble addAnimation:v4 forKey:@"kCKAnimationKeyPulse"];

  mediumBubble = self->_mediumBubble;
  double v6 = [(CKTypingIndicatorLayer *)self _mediumBubblePulseAnimationWithSpeed:1.0 delay:0.314999998];
  [(CALayer *)mediumBubble addAnimation:v6 forKey:@"kCKAnimationKeyPulse"];

  largeBubble = self->_largeBubble;
  uint64_t v8 = [(CKTypingIndicatorLayer *)self _largeBubblePulseAnimationWithSpeed:1.0 delay:0.370000005];
  [(CALayer *)largeBubble addAnimation:v8 forKey:@"kCKAnimationKeyPulse"];

  thinkingDotContainer = self->_thinkingDotContainer;
  uint64_t v10 = [(CKTypingIndicatorLayer *)self _largeBubblePulseAnimationWithSpeed:1.0 delay:0.370000005];
  [(CALayer *)thinkingDotContainer addAnimation:v10 forKey:@"kCKAnimationKeyPulse"];

  [(CKTypingIndicatorLayer *)self _buildThinkingDots];
  uint64_t v11 = (void *)MEMORY[0x1E4F39CF8];

  [v11 commit];
}

- (void)stopPulseAnimation
{
  [(CKTypingIndicatorLayer *)self thinkingDotOpacity];
  *(float *)&double v3 = v3;
  [(CALayer *)self->_thinkingDot setOpacity:v3];
  [(CALayer *)self->_thinkingDot removeAllAnimations];
  [(CALayer *)self->_smallBubble removeAnimationForKey:@"kCKAnimationKeyPulse"];
  [(CALayer *)self->_mediumBubble removeAnimationForKey:@"kCKAnimationKeyPulse"];
  [(CALayer *)self->_largeBubble removeAnimationForKey:@"kCKAnimationKeyPulse"];
  thinkingDotContainer = self->_thinkingDotContainer;

  [(CALayer *)thinkingDotContainer removeAnimationForKey:@"kCKAnimationKeyPulse"];
}

- (void)startShrinkAnimationWithCompletionBlock:(id)a3
{
  v54[3] = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  [(CKTypingIndicatorLayer *)self stopPulseAnimation];
  [MEMORY[0x1E4F39CF8] begin];
  id v4 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.scale.xy"];
  LODWORD(v5) = 1.0;
  double v6 = [NSNumber numberWithFloat:v5];
  [v4 setFromValue:v6];

  id v7 = [NSNumber numberWithFloat:0.0];
  [v4 setToValue:v7];

  [(CKTypingIndicatorLayer *)self convertedCurrentMediaTime];
  objc_msgSend(v4, "setBeginTime:");
  [v4 setDuration:0.25];
  LODWORD(v8) = 1.0;
  [v4 setSpeed:v8];
  LODWORD(v9) = 0.25;
  LODWORD(v10) = 0.25;
  LODWORD(v11) = 1.0;
  LODWORD(v12) = 1036831949;
  double v13 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v9 :v12 :v10 :v11];
  [v4 setTimingFunction:v13];

  uint64_t v50 = *MEMORY[0x1E4F39FA8];
  objc_msgSend(v4, "setFillMode:");
  [v4 setRemovedOnCompletion:1];
  [(CALayer *)self->_smallBubble addAnimation:v4 forKey:0];
  [(CALayer *)self->_mediumBubble addAnimation:v4 forKey:0];
  [(CALayer *)self->_largeBubble addAnimation:v4 forKey:0];
  [(CALayer *)self->_thinkingDotContainer addAnimation:v4 forKey:0];
  double v14 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position.x"];
  [(id)objc_opt_class() largeBubbleFrame];
  double v16 = v15;
  double v18 = v17;
  float v19 = v15;
  *(float *)&double v15 = v19;
  double v20 = [NSNumber numberWithFloat:v15];
  v54[0] = v20;
  double v21 = v16 + 5.0;
  *(float *)&double v21 = v16 + 5.0;
  uint64_t v22 = [NSNumber numberWithFloat:v21];
  v54[1] = v22;
  *(float *)&double v23 = v19;
  uint64_t v24 = [NSNumber numberWithFloat:v23];
  v54[2] = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:3];
  [v14 setValues:v25];

  uint64_t v26 = *MEMORY[0x1E4F39D70];
  [v14 setCalculationMode:*MEMORY[0x1E4F39D70]];
  [(CKTypingIndicatorLayer *)self convertedCurrentMediaTime];
  objc_msgSend(v14, "setBeginTime:");
  [v14 setDuration:0.25];
  LODWORD(v27) = 0.25;
  LODWORD(v28) = 0.25;
  LODWORD(v29) = 1.0;
  LODWORD(v30) = 1036831949;
  uint64_t v31 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v27 :v30 :v28 :v29];
  [v14 setTimingFunction:v31];

  LODWORD(v32) = 1.0;
  [v14 setSpeed:v32];
  [v14 setFillMode:v50];
  [v14 setRemovedOnCompletion:1];
  [(CALayer *)self->_smallBubble addAnimation:v14 forKey:0];
  [(CALayer *)self->_mediumBubble addAnimation:v14 forKey:0];
  [(CALayer *)self->_largeBubble addAnimation:v14 forKey:0];
  [(CALayer *)self->_thinkingDotContainer addAnimation:v14 forKey:0];
  double v33 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position.y"];
  float v34 = v18;
  *(float *)&double v35 = v34;
  uint64_t v36 = [NSNumber numberWithFloat:v35];
  v53[0] = v36;
  double v37 = v18 + -6.0;
  *(float *)&double v37 = v18 + -6.0;
  double v38 = [NSNumber numberWithFloat:v37];
  v53[1] = v38;
  *(float *)&double v39 = v18;
  id v40 = [NSNumber numberWithFloat:v39];
  v53[2] = v40;
  long long v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:3];
  [v33 setValues:v41];

  [v33 setCalculationMode:v26];
  [(CKTypingIndicatorLayer *)self convertedCurrentMediaTime];
  objc_msgSend(v33, "setBeginTime:");
  [v33 setDuration:0.25];
  LODWORD(v42) = 1045836616;
  LODWORD(v43) = 1048849804;
  LODWORD(v44) = 1057991709;
  LODWORD(v45) = 1064582806;
  long long v46 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v42 :v43 :v44 :v45];
  [v33 setTimingFunction:v46];

  LODWORD(v47) = 1.0;
  [v33 setSpeed:v47];
  [v33 setFillMode:v50];
  [v33 setRemovedOnCompletion:1];
  [(CALayer *)self->_smallBubble addAnimation:v33 forKey:0];
  [(CALayer *)self->_mediumBubble addAnimation:v33 forKey:0];
  [(CALayer *)self->_largeBubble addAnimation:v33 forKey:0];
  [(CALayer *)self->_thinkingDotContainer addAnimation:v33 forKey:0];
  if (v49)
  {
    long long v48 = (void *)MEMORY[0x1E4F39CF8];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __66__CKTypingIndicatorLayer_startShrinkAnimationWithCompletionBlock___block_invoke;
    v51[3] = &unk_1E5620F48;
    id v52 = v49;
    [v48 setCompletionBlock:v51];
  }
  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __66__CKTypingIndicatorLayer_startShrinkAnimationWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopAnimation
{
  [(CKTypingIndicatorLayer *)self stopPulseAnimation];
  [(CALayer *)self->_smallBubble removeAllAnimations];
  [(CALayer *)self->_mediumBubble removeAllAnimations];
  [(CALayer *)self->_largeBubble removeAllAnimations];
  thinkingDotContainer = self->_thinkingDotContainer;

  [(CALayer *)thinkingDotContainer removeAllAnimations];
}

- (BOOL)hasDarkBackground
{
  return self->_hasDarkBackground;
}

- (void)setHasDarkBackground:(BOOL)a3
{
  self->_hasDarkBackground = a3;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (id)iconImage
{
  return self->_iconImage;
}

- (UIColor)bubbleColor
{
  return self->_bubbleColor;
}

- (UIColor)thinkingDotColor
{
  return self->_thinkingDotColor;
}

- (void)setThinkingDotColor:(id)a3
{
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (double)bubbleOpacity
{
  return self->_bubbleOpacity;
}

- (double)thinkingDotOpacity
{
  return self->_thinkingDotOpacity;
}

- (void)setThinkingDotOpacity:(double)a3
{
  self->_thinkingDotOpacitdouble y = a3;
}

- (UIColor)customBubbleColor
{
  return self->_customBubbleColor;
}

- (void)setCustomBubbleColor:(id)a3
{
}

- (CALayer)bubbleContainer
{
  return self->_bubbleContainer;
}

- (void)setBubbleContainer:(id)a3
{
}

- (CALayer)smallBubble
{
  return self->_smallBubble;
}

- (void)setSmallBubble:(id)a3
{
}

- (CALayer)mediumBubble
{
  return self->_mediumBubble;
}

- (void)setMediumBubble:(id)a3
{
}

- (CALayer)largeBubble
{
  return self->_largeBubble;
}

- (void)setLargeBubble:(id)a3
{
}

- (CALayer)thinkingDotContainer
{
  return self->_thinkingDotContainer;
}

- (void)setThinkingDotContainer:(id)a3
{
}

- (CALayer)thinkingDot
{
  return self->_thinkingDot;
}

- (void)setThinkingDot:(id)a3
{
}

- (CAReplicatorLayer)thinkingDots
{
  return self->_thinkingDots;
}

- (void)setThinkingDots:(id)a3
{
}

- (CALayer)iconImageLayer
{
  return self->_iconImageLayer;
}

- (void)setIconImageLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageLayer, 0);
  objc_storeStrong((id *)&self->_thinkingDots, 0);
  objc_storeStrong((id *)&self->_thinkingDot, 0);
  objc_storeStrong((id *)&self->_thinkingDotContainer, 0);
  objc_storeStrong((id *)&self->_largeBubble, 0);
  objc_storeStrong((id *)&self->_mediumBubble, 0);
  objc_storeStrong((id *)&self->_smallBubble, 0);
  objc_storeStrong((id *)&self->_bubbleContainer, 0);
  objc_storeStrong((id *)&self->_customBubbleColor, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_thinkingDotColor, 0);
  objc_storeStrong((id *)&self->_bubbleColor, 0);

  objc_storeStrong(&self->_iconImage, 0);
}

+ (CGSize)defaultSize
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 transcriptTypingIndicatorDefaultSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIColor)defaultBubbleColor
{
  v2 = +[CKUIBehavior sharedBehaviors];
  double v3 = [v2 theme];
  double v4 = [v3 transcriptTypingIndicatorBubbleColor];

  return (UIColor *)v4;
}

- (UIColor)defaultThinkingDotColor
{
  v2 = +[CKUIBehavior sharedBehaviors];
  double v3 = [v2 theme];
  double v4 = [v3 transcriptTypingIndicatorDotColor];

  return (UIColor *)v4;
}

- (double)defaultThinkingDotOpacity
{
  return 0.449999988;
}

- (double)defaultBubbleOpacity
{
  v2 = +[CKUIBehavior sharedBehaviors];
  double v3 = [v2 theme];
  [v3 transcriptTypingIndicatorOpacity];
  double v5 = v4;

  return v5;
}

+ (CGRect)smallBubbleFrame
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 transcriptTypingIndicatorSmallBubbleFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

+ (CGPoint)smallBubbleGrowOffset
{
  double v2 = 5.5;
  double v3 = -2.5;
  result.double y = v3;
  result.double x = v2;
  return result;
}

+ (CGRect)mediumBubbleFrame
{
  [a1 smallBubbleFrame];
  double v3 = v2;
  double v5 = v4;
  double v6 = +[CKUIBehavior sharedBehaviors];
  [v6 transcriptTypingIndicatorMediumBubbleSize];
  double v8 = v7;
  double v10 = v9;

  double v11 = +[CKUIBehavior sharedBehaviors];
  [v11 transcriptTypingIndicatorMediumBubbleOffset];
  double v13 = v12;
  double v15 = v14;

  double v16 = v3 + v13;
  double v17 = v5 + v15;
  double v18 = v8;
  double v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

+ (CGPoint)mediumBubbleGrowOffset
{
  double v2 = 5.0;
  double v3 = 3.5;
  result.double y = v3;
  result.double x = v2;
  return result;
}

+ (CGRect)largeBubbleFrame
{
  [a1 smallBubbleFrame];
  double v3 = v2;
  double v5 = v4;
  double v6 = +[CKUIBehavior sharedBehaviors];
  [v6 transcriptTypingIndicatorLargeBubbleSize];
  double v8 = v7;
  double v10 = v9;

  double v11 = +[CKUIBehavior sharedBehaviors];
  [v11 transcriptTypingIndicatorLargeBubbleOffset];
  double v13 = v12;
  double v15 = v14;

  double v16 = v3 + v13;
  double v17 = v5 + v15;
  double v18 = v8;
  double v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

+ (CGPoint)largeBubbleGrowOffset
{
  double v2 = +[CKUIBehavior sharedBehaviors];
  [v2 transcriptTypingIndicatorLargeBubbleGrowOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

+ (CGRect)iconImageFrame
{
  double v2 = 11.0;
  double v3 = 7.5;
  double v4 = 27.0;
  double v5 = 20.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

+ (double)iconImageTrailingSpace
{
  return 8.0;
}

+ (CGPoint)thinkingDotsOffset
{
  [a1 largeBubbleFrame];
  double MaxX = CGRectGetMaxX(v16);
  [a1 thinkingDotDiameter];
  double v5 = v4;
  [a1 thinkingDotSpace];
  double v7 = v6;
  [a1 largeBubbleFrame];
  double v9 = v8;
  [a1 thinkingDotDiameter];
  double v11 = v10;
  if (CKMainScreenScale_once_42 != -1) {
    dispatch_once(&CKMainScreenScale_once_42, &__block_literal_global_107);
  }
  double v12 = *(double *)&CKMainScreenScale_sMainScreenScale_42;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_42 == 0.0) {
    double v12 = 1.0;
  }
  double v13 = round((MaxX - (v7 + v7 + v5 * 3.0)) * 0.5 * v12) / v12;
  double v14 = round((v9 * 0.5 - v11 * 0.5) * v12) / v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

+ (double)thinkingDotDiameter
{
  double v2 = +[CKUIBehavior sharedBehaviors];
  [v2 transcriptTypingIndicatorThinkingDotDiameter];
  double v4 = v3;

  return v4;
}

+ (double)thinkingDotSpace
{
  double v2 = +[CKUIBehavior sharedBehaviors];
  [v2 transcriptTypingIndicatorThinkingDotSpace];
  double v4 = v3;

  return v4;
}

@end