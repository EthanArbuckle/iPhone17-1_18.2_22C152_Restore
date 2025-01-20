@interface CKEnglishHaAcknowledgmentGlyphView
- (CGPoint)glyphOffset;
- (CKAcknowledgmentGlyphImageView)a1;
- (CKAcknowledgmentGlyphImageView)a2;
- (CKAcknowledgmentGlyphImageView)h1;
- (CKAcknowledgmentGlyphImageView)h2;
- (CKEnglishHaAcknowledgmentGlyphView)initWithFrame:(CGRect)a3 color:(char)a4;
- (double)animationDuration;
- (int64_t)acknowledgmentType;
- (void)animateWithBeginTime:(double)a3 completionDelay:(double)a4 completion:(id)a5;
- (void)layoutSubviews;
- (void)setA1:(id)a3;
- (void)setA2:(id)a3;
- (void)setGlyphColor:(id)a3;
- (void)setH1:(id)a3;
- (void)setH2:(id)a3;
@end

@implementation CKEnglishHaAcknowledgmentGlyphView

- (CKEnglishHaAcknowledgmentGlyphView)initWithFrame:(CGRect)a3 color:(char)a4
{
  int v4 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CKEnglishHaAcknowledgmentGlyphView;
  v5 = -[CKEnglishHaAcknowledgmentGlyphView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    [(CKEnglishHaAcknowledgmentGlyphView *)v5 setBackgroundColor:0];
    v7 = +[CKUIBehavior sharedBehaviors];
    v8 = v7;
    if (v4 == -1)
    {
      v9 = [v7 grayH1AckImage];

      v15 = +[CKUIBehavior sharedBehaviors];
      v11 = [v15 grayA1AckImage];

      v16 = +[CKUIBehavior sharedBehaviors];
      v13 = [v16 grayH2AckImage];

      v14 = +[CKUIBehavior sharedBehaviors];
      [v14 grayA2AckImage];
    }
    else
    {
      v9 = [v7 whiteH1AckImage];

      v10 = +[CKUIBehavior sharedBehaviors];
      v11 = [v10 whiteA1AckImage];

      v12 = +[CKUIBehavior sharedBehaviors];
      v13 = [v12 whiteH2AckImage];

      v14 = +[CKUIBehavior sharedBehaviors];
      [v14 whiteA2AckImage];
    v17 = };

    v18 = [[CKAcknowledgmentGlyphImageView alloc] initWithImage:v9];
    [(CKEnglishHaAcknowledgmentGlyphView *)v6 addSubview:v18];
    [(CKEnglishHaAcknowledgmentGlyphView *)v6 setH1:v18];
    v19 = [[CKAcknowledgmentGlyphImageView alloc] initWithImage:v11];
    [(CKEnglishHaAcknowledgmentGlyphView *)v6 addSubview:v19];
    [(CKEnglishHaAcknowledgmentGlyphView *)v6 setA1:v19];
    v20 = [[CKAcknowledgmentGlyphImageView alloc] initWithImage:v13];
    [(CKEnglishHaAcknowledgmentGlyphView *)v6 addSubview:v20];
    [(CKEnglishHaAcknowledgmentGlyphView *)v6 setH2:v20];
    v21 = [[CKAcknowledgmentGlyphImageView alloc] initWithImage:v17];
    [(CKEnglishHaAcknowledgmentGlyphView *)v6 addSubview:v21];
    [(CKEnglishHaAcknowledgmentGlyphView *)v6 setA2:v21];
    v22 = [(CKAcknowledgmentGlyphImageView *)v18 layer];
    objc_msgSend(v22, "setAnchorPoint:", 0.35, 0.55);

    v23 = [(CKAcknowledgmentGlyphImageView *)v19 layer];
    objc_msgSend(v23, "setAnchorPoint:", 0.65, 0.55);

    v24 = [(CKAcknowledgmentGlyphImageView *)v20 layer];
    objc_msgSend(v24, "setAnchorPoint:", 0.35, 0.575);

    v25 = [(CKAcknowledgmentGlyphImageView *)v21 layer];
    objc_msgSend(v25, "setAnchorPoint:", 0.65, 0.575);

    [(CKEnglishHaAcknowledgmentGlyphView *)v6 setClipsToBounds:1];
  }
  return v6;
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)CKEnglishHaAcknowledgmentGlyphView;
  [(CKEnglishHaAcknowledgmentGlyphView *)&v36 layoutSubviews];
  [(CKEnglishHaAcknowledgmentGlyphView *)self bounds];
  double v4 = v3;
  CGFloat v6 = v5;
  double v35 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKEnglishHaAcknowledgmentGlyphView *)self h1];
  [v11 sizeToFit];

  v12 = [(CKEnglishHaAcknowledgmentGlyphView *)self a1];
  [v12 sizeToFit];

  v13 = [(CKEnglishHaAcknowledgmentGlyphView *)self h2];
  [v13 sizeToFit];

  v14 = [(CKEnglishHaAcknowledgmentGlyphView *)self a2];
  [v14 sizeToFit];

  CGFloat v16 = *MEMORY[0x1E4F1DB28];
  CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  v17 = [(CKEnglishHaAcknowledgmentGlyphView *)self h1];
  [v17 bounds];
  double v19 = v18;
  double v21 = v20;

  v37.origin.x = v4;
  v37.origin.y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  double Height = CGRectGetHeight(v37);
  v38.origin.x = v16;
  v38.origin.y = v15;
  v38.size.width = v19;
  v38.size.height = v21;
  double v23 = Height / CGRectGetHeight(v38);
  double v24 = v4 + floor((v8 - v19 * v23) * 0.5);
  double v25 = v35 + floor((v10 - v21 * v23) * 0.5);
  v26 = [(CKEnglishHaAcknowledgmentGlyphView *)self h1];
  [v26 bounds];
  double v28 = v23 * v27;
  double v30 = v23 * v29;

  v31 = [(CKEnglishHaAcknowledgmentGlyphView *)self h1];
  objc_msgSend(v31, "setFrame:", v24, v25, v28, v30);

  v32 = [(CKEnglishHaAcknowledgmentGlyphView *)self a1];
  objc_msgSend(v32, "setFrame:", v24, v25, v28, v30);

  v33 = [(CKEnglishHaAcknowledgmentGlyphView *)self h2];
  objc_msgSend(v33, "setFrame:", v24, v25, v28, v30);

  v34 = [(CKEnglishHaAcknowledgmentGlyphView *)self a2];
  objc_msgSend(v34, "setFrame:", v24, v25, v28, v30);
}

- (void)setGlyphColor:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)CKEnglishHaAcknowledgmentGlyphView;
  id v4 = a3;
  [(CKAcknowledgmentGlyphView *)&v23 setGlyphColor:v4];
  double v5 = +[CKUIBehavior sharedBehaviors];
  CGFloat v6 = [v5 theme];
  int v7 = [v6 ckAcknowledgementColorTypeForColor:v4];

  double v8 = +[CKUIBehavior sharedBehaviors];
  double v9 = v8;
  if (v7 == -1)
  {
    double v10 = [v8 grayH1AckImage];

    CGFloat v16 = +[CKUIBehavior sharedBehaviors];
    v12 = [v16 grayA1AckImage];

    v17 = +[CKUIBehavior sharedBehaviors];
    v14 = [v17 grayH2AckImage];

    CGFloat v15 = +[CKUIBehavior sharedBehaviors];
    [v15 grayA2AckImage];
  }
  else
  {
    double v10 = [v8 whiteH1AckImage];

    v11 = +[CKUIBehavior sharedBehaviors];
    v12 = [v11 whiteA1AckImage];

    v13 = +[CKUIBehavior sharedBehaviors];
    v14 = [v13 whiteH2AckImage];

    CGFloat v15 = +[CKUIBehavior sharedBehaviors];
    [v15 whiteA2AckImage];
  double v18 = };

  double v19 = [(CKEnglishHaAcknowledgmentGlyphView *)self h1];
  [v19 setImage:v10];

  double v20 = [(CKEnglishHaAcknowledgmentGlyphView *)self a1];
  [v20 setImage:v12];

  double v21 = [(CKEnglishHaAcknowledgmentGlyphView *)self h2];
  [v21 setImage:v14];

  v22 = [(CKEnglishHaAcknowledgmentGlyphView *)self a2];
  [v22 setImage:v18];
}

- (int64_t)acknowledgmentType
{
  return 2003;
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
  [(CKEnglishHaAcknowledgmentGlyphView *)self animationDuration];
  objc_msgSend(v9, "setAnimationDuration:");
  if (v8)
  {
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__CKEnglishHaAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke;
    block[3] = &unk_1E5620F48;
    id v27 = v8;
    dispatch_after(v10, MEMORY[0x1E4F14428], block);
  }
  v11 = [(CKEnglishHaAcknowledgmentGlyphView *)self h1];
  v12 = [v11 layer];

  v13 = [(CKEnglishHaAcknowledgmentGlyphView *)self a1];
  v14 = [v13 layer];

  CGFloat v15 = [(CKEnglishHaAcknowledgmentGlyphView *)self h2];
  CGFloat v16 = [v15 layer];

  v17 = [(CKEnglishHaAcknowledgmentGlyphView *)self a2];
  double v18 = [v17 layer];

  double v19 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
  [v19 setFromValue:&unk_1EDF16E20];
  [v19 setMass:1.0];
  [v19 setStiffness:250.0];
  [v19 setDamping:15.0];
  [v19 setBeginTime:a3];
  [v19 setFillMode:*MEMORY[0x1E4F39FA0]];
  double v20 = (void *)[v19 copy];
  [v19 beginTime];
  [v20 setBeginTime:v21 + 0.05];
  v22 = (void *)[v19 copy];
  [v19 beginTime];
  [v22 setBeginTime:v23 + 0.1];
  double v24 = (void *)[v19 copy];
  [v19 beginTime];
  [v24 setBeginTime:v25 + 0.15];
  [v12 addAnimation:v19 forKey:@"transform.scale.xy"];
  [v14 addAnimation:v20 forKey:@"transform.scale.xy"];
  [v16 addAnimation:v22 forKey:@"transform.scale.xy"];
  [v18 addAnimation:v24 forKey:@"transform.scale.xy"];
  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __86__CKEnglishHaAcknowledgmentGlyphView_animateWithBeginTime_completionDelay_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)animationDuration
{
  return 1.05;
}

- (CKAcknowledgmentGlyphImageView)h1
{
  return self->_h1;
}

- (void)setH1:(id)a3
{
}

- (CKAcknowledgmentGlyphImageView)a1
{
  return self->_a1;
}

- (void)setA1:(id)a3
{
}

- (CKAcknowledgmentGlyphImageView)h2
{
  return self->_h2;
}

- (void)setH2:(id)a3
{
}

- (CKAcknowledgmentGlyphImageView)a2
{
  return self->_a2;
}

- (void)setA2:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_a2, 0);
  objc_storeStrong((id *)&self->_h2, 0);
  objc_storeStrong((id *)&self->_a1, 0);

  objc_storeStrong((id *)&self->_h1, 0);
}

@end