@interface CKExclamationAcknowledgmentGlyphView
- (CGPoint)glyphOffset;
- (CKAcknowledgmentGlyphImageView)leftExclamationGlyph;
- (CKAcknowledgmentGlyphImageView)rightExclamationGlyph;
- (CKExclamationAcknowledgmentGlyphView)initWithFrame:(CGRect)a3 color:(char)a4;
- (double)animationDuration;
- (int64_t)acknowledgmentType;
- (void)animateWithBeginTime:(double)a3 completionDelay:(double)a4 completion:(id)a5;
- (void)layoutSubviews;
- (void)setGlyphColor:(id)a3;
- (void)setLeftExclamationGlyph:(id)a3;
- (void)setRightExclamationGlyph:(id)a3;
@end

@implementation CKExclamationAcknowledgmentGlyphView

- (CKExclamationAcknowledgmentGlyphView)initWithFrame:(CGRect)a3 color:(char)a4
{
  int v4 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKExclamationAcknowledgmentGlyphView;
  v5 = -[CKExclamationAcknowledgmentGlyphView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    [(CKExclamationAcknowledgmentGlyphView *)v5 setBackgroundColor:0];
    v7 = +[CKUIBehavior sharedBehaviors];
    v8 = v7;
    if (v4 == -1)
    {
      v9 = [v7 grayExclamationLeftAckImage];

      v10 = +[CKUIBehavior sharedBehaviors];
      [v10 grayExclamationRightAckImage];
    }
    else
    {
      v9 = [v7 whiteExclamationLeftAckImage];

      v10 = +[CKUIBehavior sharedBehaviors];
      [v10 whiteExclamationRightAckImage];
    v11 = };

    v12 = [[CKAcknowledgmentGlyphImageView alloc] initWithImage:v9];
    v13 = [[CKAcknowledgmentGlyphImageView alloc] initWithImage:v11];
    [(CKExclamationAcknowledgmentGlyphView *)v6 addSubview:v12];
    [(CKExclamationAcknowledgmentGlyphView *)v6 setLeftExclamationGlyph:v12];
    [(CKExclamationAcknowledgmentGlyphView *)v6 addSubview:v13];
    [(CKExclamationAcknowledgmentGlyphView *)v6 setRightExclamationGlyph:v13];
    v14 = [(CKAcknowledgmentGlyphImageView *)v12 layer];
    objc_msgSend(v14, "setAnchorPoint:", 1.0, 0.5);

    v15 = [(CKAcknowledgmentGlyphImageView *)v13 layer];
    objc_msgSend(v15, "setAnchorPoint:", 0.0, 0.5);

    [(CKExclamationAcknowledgmentGlyphView *)v6 setClipsToBounds:1];
  }
  return v6;
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)CKExclamationAcknowledgmentGlyphView;
  [(CKExclamationAcknowledgmentGlyphView *)&v34 layoutSubviews];
  [(CKExclamationAcknowledgmentGlyphView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKExclamationAcknowledgmentGlyphView *)self leftExclamationGlyph];
  [v11 sizeToFit];

  v12 = [(CKExclamationAcknowledgmentGlyphView *)self rightExclamationGlyph];
  [v12 sizeToFit];

  v13 = [(CKExclamationAcknowledgmentGlyphView *)self leftExclamationGlyph];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;

  v35.origin.x = v4;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  CGFloat v18 = CGRectGetHeight(v35) / v17;
  CGFloat v19 = v15 * v18;
  CGFloat v20 = v17 * v18;
  v21 = [(CKExclamationAcknowledgmentGlyphView *)self rightExclamationGlyph];
  [v21 bounds];
  double v23 = v22;
  double v25 = v24;

  v36.origin.x = v4;
  v36.origin.y = v6;
  v36.size.width = v8;
  v36.size.height = v10;
  CGFloat v26 = CGRectGetHeight(v36) / v25;
  double rect_16 = v25 * v26;
  double rect_24 = v23 * v26;
  CGFloat v27 = v6 + floor((v10 - v20) * 0.5);
  v37.origin.x = v4;
  v37.origin.y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  double MidX = CGRectGetMidX(v37);
  v38.origin.x = v4;
  v38.origin.y = v6;
  v38.size.width = v8;
  v38.size.height = v10;
  CGRectGetMidY(v38);
  v39.origin.x = v4 + floor((v8 - v19) * 0.5);
  v39.origin.y = v27;
  v39.size.width = v19;
  v39.size.height = v20;
  double v29 = MidX - CGRectGetWidth(v39);
  v30 = [(CKExclamationAcknowledgmentGlyphView *)self leftExclamationGlyph];
  objc_msgSend(v30, "setFrame:", v29, v27, v19, v20);

  v31 = [(CKExclamationAcknowledgmentGlyphView *)self rightExclamationGlyph];
  objc_msgSend(v31, "setFrame:", MidX, v6 + floor((v10 - rect_16) * 0.5), rect_24, rect_16);
}

- (void)setGlyphColor:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CKExclamationAcknowledgmentGlyphView;
  id v4 = a3;
  [(CKAcknowledgmentGlyphView *)&v15 setGlyphColor:v4];
  double v5 = +[CKUIBehavior sharedBehaviors];
  double v6 = [v5 theme];
  int v7 = [v6 ckAcknowledgementColorTypeForColor:v4];

  double v8 = +[CKUIBehavior sharedBehaviors];
  double v9 = v8;
  if (v7 == -1)
  {
    double v10 = [v8 grayExclamationLeftAckImage];

    v11 = +[CKUIBehavior sharedBehaviors];
    [v11 grayExclamationRightAckImage];
  }
  else
  {
    double v10 = [v8 whiteExclamationLeftAckImage];

    v11 = +[CKUIBehavior sharedBehaviors];
    [v11 whiteExclamationRightAckImage];
  v12 = };

  v13 = [(CKExclamationAcknowledgmentGlyphView *)self leftExclamationGlyph];
  [v13 setImage:v10];

  double v14 = [(CKExclamationAcknowledgmentGlyphView *)self rightExclamationGlyph];
  [v14 setImage:v12];
}

- (int64_t)acknowledgmentType
{
  return 2004;
}

- (CGPoint)glyphOffset
{
  if (CKPixelWidth_once_18 != -1) {
    dispatch_once(&CKPixelWidth_once_18, &__block_literal_global_204_1);
  }
  double v2 = -*(double *)&CKPixelWidth_sPixel_18;
  double v3 = -*(double *)&CKPixelWidth_sPixel_18;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)animateWithBeginTime:(double)a3 completionDelay:(double)a4 completion:(id)a5
{
  id v8 = a5;
  [MEMORY[0x1E4F39CF8] begin];
  double v9 = (void *)MEMORY[0x1E4F39CF8];
  [(CKExclamationAcknowledgmentGlyphView *)self animationDuration];
  objc_msgSend(v9, "setAnimationDuration:");
  if (v8)
  {
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__CKExclamationAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke;
    block[3] = &unk_1E5620F48;
    id v32 = v8;
    dispatch_after(v10, MEMORY[0x1E4F14428], block);
  }
  v11 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position.y"];
  v12 = NSNumber;
  [(CKExclamationAcknowledgmentGlyphView *)self bounds];
  CGFloat v13 = CGRectGetMaxY(v33) * 1.2;
  *(float *)&CGFloat v13 = v13;
  double v14 = [v12 numberWithFloat:v13];
  [v11 setFromValue:v14];

  [v11 setMass:1.0];
  [v11 setStiffness:350.0];
  [v11 setDamping:20.0];
  LODWORD(v15) = 1.0;
  [v11 setSpeed:v15];
  uint64_t v16 = *MEMORY[0x1E4F39FA0];
  [v11 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v11 setBeginTime:a3];
  double v17 = [(CKExclamationAcknowledgmentGlyphView *)self leftExclamationGlyph];
  CGFloat v18 = [v17 layer];
  [v18 addAnimation:v11 forKey:@"position.y"];

  CGFloat v19 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
  LODWORD(v20) = 0.5;
  v21 = [NSNumber numberWithFloat:v20];
  [v19 setFromValue:v21];

  [v19 setMass:1.0];
  [v19 setStiffness:450.0];
  [v19 setDamping:15.0];
  LODWORD(v22) = 1.0;
  [v19 setSpeed:v22];
  [v19 setDuration:1.0];
  [v19 setBeginTime:a3 + 0.150000006];
  [v19 setFillMode:v16];
  double v23 = [(CKExclamationAcknowledgmentGlyphView *)self leftExclamationGlyph];
  double v24 = [v23 layer];
  [v24 addAnimation:v19 forKey:@"transform.scale.xy"];

  double v25 = (void *)[v11 copy];
  [v25 setBeginTime:a3 + 0.100000001];
  CGFloat v26 = [(CKExclamationAcknowledgmentGlyphView *)self rightExclamationGlyph];
  CGFloat v27 = [v26 layer];
  [v27 addAnimation:v25 forKey:@"position.y"];

  v28 = (void *)[v19 copy];
  double v29 = [(CKExclamationAcknowledgmentGlyphView *)self rightExclamationGlyph];
  v30 = [v29 layer];
  [v30 addAnimation:v28 forKey:@"transform.scale.xy"];

  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __88__CKExclamationAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)animationDuration
{
  return 1.15;
}

- (CKAcknowledgmentGlyphImageView)leftExclamationGlyph
{
  return self->_leftExclamationGlyph;
}

- (void)setLeftExclamationGlyph:(id)a3
{
}

- (CKAcknowledgmentGlyphImageView)rightExclamationGlyph
{
  return self->_rightExclamationGlyph;
}

- (void)setRightExclamationGlyph:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightExclamationGlyph, 0);

  objc_storeStrong((id *)&self->_leftExclamationGlyph, 0);
}

@end