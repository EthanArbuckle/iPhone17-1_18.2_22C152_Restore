@interface CKQuestionAcknowledgmentGlyphView
- (CGPoint)glyphOffset;
- (CKAcknowledgmentGlyphImageView)dot;
- (CKAcknowledgmentGlyphImageView)glyph;
- (CKQuestionAcknowledgmentGlyphView)initWithFrame:(CGRect)a3 color:(char)a4;
- (double)animationDuration;
- (int64_t)acknowledgmentType;
- (void)animateWithBeginTime:(double)a3 completionDelay:(double)a4 completion:(id)a5;
- (void)layoutSubviews;
- (void)setDot:(id)a3;
- (void)setGlyph:(id)a3;
- (void)setGlyphColor:(id)a3;
@end

@implementation CKQuestionAcknowledgmentGlyphView

- (CKQuestionAcknowledgmentGlyphView)initWithFrame:(CGRect)a3 color:(char)a4
{
  int v4 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CKQuestionAcknowledgmentGlyphView;
  v5 = -[CKQuestionAcknowledgmentGlyphView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    [(CKQuestionAcknowledgmentGlyphView *)v5 setBackgroundColor:0];
    v7 = +[CKUIBehavior sharedBehaviors];
    v8 = v7;
    if (v4 == -1)
    {
      v9 = [v7 grayQuestionMarkGlyphAckImage];

      v10 = +[CKUIBehavior sharedBehaviors];
      [v10 grayQuestionMarkDotAckImage];
    }
    else
    {
      v9 = [v7 whiteQuestionMarkGlyphAckImage];

      v10 = +[CKUIBehavior sharedBehaviors];
      [v10 whiteQuestionMarkDotAckImage];
    v11 = };

    v12 = [[CKAcknowledgmentGlyphImageView alloc] initWithImage:v9];
    [(CKQuestionAcknowledgmentGlyphView *)v6 addSubview:v12];
    [(CKQuestionAcknowledgmentGlyphView *)v6 setGlyph:v12];
    v13 = [[CKAcknowledgmentGlyphImageView alloc] initWithImage:v11];
    [(CKQuestionAcknowledgmentGlyphView *)v6 addSubview:v13];
    [(CKQuestionAcknowledgmentGlyphView *)v6 setDot:v13];
    [(CKQuestionAcknowledgmentGlyphView *)v6 setClipsToBounds:1];
  }
  return v6;
}

- (void)layoutSubviews
{
  *(void *)&recta.origin.y = self;
  *(void *)&recta.size.width = CKQuestionAcknowledgmentGlyphView;
  [(CGFloat *)(objc_super *)&recta.origin.y layoutSubviews];
  [(CKQuestionAcknowledgmentGlyphView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKQuestionAcknowledgmentGlyphView *)self glyph];
  [v11 sizeToFit];

  v12 = [(CKQuestionAcknowledgmentGlyphView *)self dot];
  [v12 sizeToFit];

  CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  recta.origin.x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  v14 = [(CKQuestionAcknowledgmentGlyphView *)self glyph];
  [v14 bounds];
  double Width = CGRectGetWidth(v38);
  v16 = [(CKQuestionAcknowledgmentGlyphView *)self glyph];
  [v16 bounds];
  double Height = CGRectGetHeight(v39);
  v18 = [(CKQuestionAcknowledgmentGlyphView *)self dot];
  [v18 bounds];
  CGFloat v19 = Height + CGRectGetHeight(v40);

  v41.origin.x = v4;
  v41.origin.y = v6;
  v41.size.width = v8;
  v41.size.height = v10;
  double v20 = CGRectGetHeight(v41);
  v42.origin.x = recta.origin.x;
  v42.origin.y = v13;
  v42.size.width = Width;
  v42.size.height = v19;
  double v21 = v20 / CGRectGetHeight(v42);
  CGFloat v22 = v4 + floor((v8 - Width * v21) * 0.5);
  CGFloat v23 = v6 + floor((v10 - v19 * v21) * 0.5);
  v24 = [(CKQuestionAcknowledgmentGlyphView *)self glyph];
  [v24 bounds];
  CGFloat v26 = v21 * v25;
  CGFloat v28 = v21 * v27;

  v43.origin.x = v22;
  v43.origin.y = v23;
  v43.size.width = v26;
  v43.size.height = v28;
  double MaxY = CGRectGetMaxY(v43);
  v30 = [(CKQuestionAcknowledgmentGlyphView *)self dot];
  [v30 bounds];
  double v32 = v21 * v31;
  double v34 = v21 * v33;

  v35 = [(CKQuestionAcknowledgmentGlyphView *)self glyph];
  objc_msgSend(v35, "setFrame:", v22, v23, v26, v28);

  v36 = [(CKQuestionAcknowledgmentGlyphView *)self dot];
  objc_msgSend(v36, "setFrame:", v22, MaxY, v32, v34);
}

- (void)setGlyphColor:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CKQuestionAcknowledgmentGlyphView;
  id v4 = a3;
  [(CKAcknowledgmentGlyphView *)&v15 setGlyphColor:v4];
  double v5 = +[CKUIBehavior sharedBehaviors];
  double v6 = [v5 theme];
  int v7 = [v6 ckAcknowledgementColorTypeForColor:v4];

  double v8 = +[CKUIBehavior sharedBehaviors];
  double v9 = v8;
  if (v7 == -1)
  {
    double v10 = [v8 grayQuestionMarkGlyphAckImage];

    v11 = +[CKUIBehavior sharedBehaviors];
    [v11 grayQuestionMarkDotAckImage];
  }
  else
  {
    double v10 = [v8 whiteQuestionMarkGlyphAckImage];

    v11 = +[CKUIBehavior sharedBehaviors];
    [v11 whiteQuestionMarkDotAckImage];
  v12 = };

  CGFloat v13 = [(CKQuestionAcknowledgmentGlyphView *)self glyph];
  [v13 setImage:v10];

  v14 = [(CKQuestionAcknowledgmentGlyphView *)self dot];
  [v14 setImage:v12];
}

- (int64_t)acknowledgmentType
{
  return 2005;
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
  [(CKQuestionAcknowledgmentGlyphView *)self animationDuration];
  objc_msgSend(v9, "setAnimationDuration:");
  if (v8)
  {
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__CKQuestionAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke;
    block[3] = &unk_1E5620F48;
    id v24 = v8;
    dispatch_after(v10, MEMORY[0x1E4F14428], block);
  }
  v11 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
  [v11 setFromValue:&unk_1EDF16E20];
  [v11 setMass:2.0];
  [v11 setStiffness:250.0];
  [v11 setDamping:22.0];
  [v11 setBeginTime:a3];
  uint64_t v12 = *MEMORY[0x1E4F39FA0];
  [v11 setFillMode:*MEMORY[0x1E4F39FA0]];
  CGFloat v13 = [(CKQuestionAcknowledgmentGlyphView *)self glyph];
  v14 = [v13 layer];
  [v14 addAnimation:v11 forKey:@"transform.scale.xy"];

  objc_super v15 = [(CKQuestionAcknowledgmentGlyphView *)self dot];
  v16 = [v15 layer];
  [v16 addAnimation:v11 forKey:@"transform.scale.xy"];

  v17 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position.y"];
  [v17 setFromValue:&unk_1EDF16E38];
  [v17 setMass:1.0];
  [v17 setStiffness:250.0];
  [v17 setDamping:20.0];
  [v17 setBeginTime:a3];
  [v17 setFillMode:v12];
  v18 = [(CKQuestionAcknowledgmentGlyphView *)self glyph];
  CGFloat v19 = [v18 layer];
  [v19 addAnimation:v17 forKey:@"position.y"];

  double v20 = (void *)[v17 copy];
  [v20 setBeginTime:a3 + 0.05];
  double v21 = [(CKQuestionAcknowledgmentGlyphView *)self dot];
  CGFloat v22 = [v21 layer];
  [v22 addAnimation:v20 forKey:@"position.y"];

  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __85__CKQuestionAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)animationDuration
{
  return 1.05;
}

- (CKAcknowledgmentGlyphImageView)glyph
{
  return self->_glyph;
}

- (void)setGlyph:(id)a3
{
}

- (CKAcknowledgmentGlyphImageView)dot
{
  return self->_dot;
}

- (void)setDot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dot, 0);

  objc_storeStrong((id *)&self->_glyph, 0);
}

@end