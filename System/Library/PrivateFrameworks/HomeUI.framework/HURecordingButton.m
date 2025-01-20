@interface HURecordingButton
- (CAShapeLayer)stopButtonStrokeLayer;
- (HURecordingButton)initWithSize:(CGSize)a3 state:(unint64_t)a4 image:(id)a5;
- (HURecordingButton)initWithSize:(CGSize)a3 state:(unint64_t)a4 title:(id)a5;
- (UIImage)currentButtonImage;
- (UIImage)nextButtonImage;
- (UIImageView)currentButtonImageView;
- (UIImageView)nextButtonImageView;
- (UILabel)currentButtonLabel;
- (unint64_t)currentRecordingState;
- (void)_updateHighlight;
- (void)layoutSubviews;
- (void)setCurrentButtonImage:(id)a3;
- (void)setCurrentButtonImageView:(id)a3;
- (void)setCurrentButtonLabel:(id)a3;
- (void)setCurrentRecordingState:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3 forState:(unint64_t)a4 animated:(BOOL)a5;
- (void)setNextButtonImage:(id)a3;
- (void)setNextButtonImageView:(id)a3;
- (void)setStopButtonStrokeLayer:(id)a3;
- (void)setText:(id)a3 forState:(unint64_t)a4 animated:(BOOL)a5;
@end

@implementation HURecordingButton

- (HURecordingButton)initWithSize:(CGSize)a3 state:(unint64_t)a4 image:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HURecordingButton;
  v11 = -[HURecordingButton initWithFrame:](&v25, sel_initWithFrame_, 0.0, 0.0, width, height);
  v12 = v11;
  if (v11)
  {
    v11->_currentRecordingState = a4;
    objc_storeStrong((id *)&v11->_currentButtonImage, a5);
    v13 = [MEMORY[0x1E4F428B8] systemOrangeColor];
    [(HURecordingButton *)v12 setBackgroundColor:v13];

    id v14 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v15 = [(HURecordingButton *)v12 currentButtonImage];
    uint64_t v16 = [v14 initWithImage:v15];
    currentButtonImageView = v12->_currentButtonImageView;
    v12->_currentButtonImageView = (UIImageView *)v16;

    [(HURecordingButton *)v12 bounds];
    double v19 = v18 * 0.5;
    [(HURecordingButton *)v12 bounds];
    -[UIImageView setFrame:](v12->_currentButtonImageView, "setFrame:", 0.0, 0.0, v19, v20 * 0.5);
    [(HURecordingButton *)v12 bounds];
    double v22 = v21 * 0.5;
    [(HURecordingButton *)v12 bounds];
    -[UIImageView setCenter:](v12->_currentButtonImageView, "setCenter:", v22, v23 * 0.5);
    [(HURecordingButton *)v12 addSubview:v12->_currentButtonImageView];
  }

  return v12;
}

- (HURecordingButton)initWithSize:(CGSize)a3 state:(unint64_t)a4 title:(id)a5
{
  v21.receiver = self;
  v21.super_class = (Class)HURecordingButton;
  v6 = -[HURecordingButton initWithFrame:](&v21, sel_initWithFrame_, a4, a5, 0.0, 0.0, a3.width, a3.height);
  v7 = v6;
  if (v6)
  {
    v6->_currentRecordingState = a4;
    if (a4 == 4) {
      [MEMORY[0x1E4F428B8] systemGreenColor];
    }
    else {
    v8 = [MEMORY[0x1E4F428B8] systemOrangeColor];
    }
    [(HURecordingButton *)v7 setBackgroundColor:v8];

    id v9 = objc_alloc(MEMORY[0x1E4F42B38]);
    uint64_t v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    currentButtonLabel = v7->_currentButtonLabel;
    v7->_currentButtonLabel = (UILabel *)v10;

    [(HURecordingButton *)v7 bounds];
    double v13 = v12 * 0.5;
    [(HURecordingButton *)v7 bounds];
    -[UILabel setFrame:](v7->_currentButtonLabel, "setFrame:", 0.0, 0.0, v13, v14 * 0.5);
    [(HURecordingButton *)v7 bounds];
    double v16 = v15 * 0.5;
    [(HURecordingButton *)v7 bounds];
    -[UILabel setCenter:](v7->_currentButtonLabel, "setCenter:", v16, v17 * 0.5);
    [(HURecordingButton *)v7 addSubview:v7->_currentButtonLabel];
    double v18 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [(UILabel *)v7->_currentButtonLabel setFont:v18];

    double v19 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(UILabel *)v7->_currentButtonLabel setTextColor:v19];
  }
  return v7;
}

- (void)setHighlighted:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HURecordingButton;
  [(HURecordingButton *)&v5 setHighlighted:a3];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__HURecordingButton_setHighlighted___block_invoke;
  v4[3] = &unk_1E6386018;
  v4[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v4 animations:0.0];
}

uint64_t __36__HURecordingButton_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateHighlight];
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HURecordingButton;
  [(HURecordingButton *)&v4 setEnabled:a3];
  [(HURecordingButton *)self _updateHighlight];
}

- (void)setImage:(id)a3 forState:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [(HURecordingButton *)self setCurrentRecordingState:a4];
  id v9 = [(HURecordingButton *)self currentButtonImageView];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [(HURecordingButton *)self nextButtonImageView];
  }
  double v12 = v11;

  double v13 = [(HURecordingButton *)self currentButtonImageView];
  if ([v12 isEqual:v13]) {
    [(HURecordingButton *)self nextButtonImageView];
  }
  else {
  double v14 = [(HURecordingButton *)self currentButtonImageView];
  }

  if (!v14)
  {
    double v14 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v8];
    [(HURecordingButton *)self bounds];
    double v16 = v15 * 0.5;
    [(HURecordingButton *)self bounds];
    objc_msgSend(v14, "setFrame:", 0.0, 0.0, v16, v17 * 0.5);
    [(HURecordingButton *)self bounds];
    double v19 = v18 * 0.5;
    [(HURecordingButton *)self bounds];
    objc_msgSend(v14, "setCenter:", v19, v20 * 0.5);
    [v14 setAlpha:0.0];
    [(HURecordingButton *)self addSubview:v14];
    CGAffineTransformMakeScale(&v36, 0.3, 0.3);
    [v14 setTransform:&v36];
    objc_super v21 = [(HURecordingButton *)self currentButtonImageView];
    int v22 = [v12 isEqual:v21];

    if (v22) {
      [(HURecordingButton *)self setNextButtonImageView:v14];
    }
    else {
      [(HURecordingButton *)self setCurrentButtonImageView:v14];
    }
  }
  double v23 = (void *)MEMORY[0x1E4F42FF0];
  if (v5) {
    double v24 = 0.25;
  }
  else {
    double v24 = 0.0;
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __48__HURecordingButton_setImage_forState_animated___block_invoke;
  v31[3] = &unk_1E638A8D8;
  id v32 = v12;
  v33 = self;
  unint64_t v35 = a4;
  id v34 = v14;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __48__HURecordingButton_setImage_forState_animated___block_invoke_2;
  v27[3] = &unk_1E6386368;
  id v28 = v32;
  v29 = self;
  id v30 = v34;
  id v25 = v34;
  id v26 = v32;
  [v23 animateWithDuration:v31 animations:v27 completion:v24];
}

void __48__HURecordingButton_setImage_forState_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.1];
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v18, 0.3, 0.3);
  [v2 setTransform:&v18];
  v3 = [*(id *)(a1 + 40) currentButtonLabel];
  [v3 alpha];
  double v5 = v4;

  if (v5 == 1.0)
  {
    v6 = [*(id *)(a1 + 40) currentButtonLabel];
    [v6 setAlpha:0.1];

    v7 = [*(id *)(a1 + 40) currentButtonLabel];
    CGAffineTransformMakeScale(&v17, 0.3, 0.3);
    [v7 setTransform:&v17];
  }
  id v8 = *(void **)(a1 + 48);
  double v9 = 0.9;
  if (*(void *)(a1 + 56) != 4) {
    double v9 = 1.0;
  }
  double v10 = 0.8;
  if (*(void *)(a1 + 56) != 4) {
    double v10 = 1.0;
  }
  CGAffineTransformMakeScale(&v16, v9, v10);
  [v8 setTransform:&v16];
  [*(id *)(a1 + 48) setAlpha:1.0];
  uint64_t v11 = [*(id *)(a1 + 40) currentRecordingState];
  double v12 = [*(id *)(a1 + 40) stopButtonStrokeLayer];
  double v13 = v12;
  double v14 = 0.0;
  if (v11 == 4) {
    *(float *)&double v14 = 1.0;
  }
  [v12 setOpacity:v14];

  double v15 = [MEMORY[0x1E4F428B8] systemOrangeColor];
  [*(id *)(a1 + 40) setBackgroundColor:v15];
}

uint64_t __48__HURecordingButton_setImage_forState_animated___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) removeFromSuperview];
    v3 = [*(id *)(v2 + 40) currentButtonLabel];
    [v3 removeFromSuperview];

    [*(id *)(v2 + 40) setCurrentButtonLabel:0];
    [*(id *)(v2 + 40) setCurrentButtonImageView:*(void *)(v2 + 48)];
    double v4 = *(void **)(v2 + 40);
    return [v4 setNextButtonImageView:0];
  }
  return result;
}

- (void)setText:(id)a3 forState:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  double v9 = [(HURecordingButton *)self currentButtonImageView];
  double v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [(HURecordingButton *)self nextButtonImageView];
  }
  double v12 = v11;

  double v13 = [(HURecordingButton *)self currentButtonLabel];

  if (!v13)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v15 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(HURecordingButton *)self setCurrentButtonLabel:v15];

    [(HURecordingButton *)self bounds];
    double v17 = v16 * 0.5;
    [(HURecordingButton *)self bounds];
    double v19 = v18 * 0.5;
    double v20 = [(HURecordingButton *)self currentButtonLabel];
    objc_msgSend(v20, "setFrame:", 0.0, 0.0, v17, v19);

    [(HURecordingButton *)self bounds];
    double v22 = v21 * 0.5;
    [(HURecordingButton *)self bounds];
    double v24 = v23 * 0.5;
    id v25 = [(HURecordingButton *)self currentButtonLabel];
    objc_msgSend(v25, "setCenter:", v22, v24);

    id v26 = [(HURecordingButton *)self currentButtonLabel];
    [v26 setAlpha:0.0];

    v27 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    id v28 = [(HURecordingButton *)self currentButtonLabel];
    [v28 setFont:v27];

    v29 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    id v30 = [(HURecordingButton *)self currentButtonLabel];
    [v30 setTextColor:v29];

    v31 = [(HURecordingButton *)self currentButtonLabel];
    [(HURecordingButton *)self addSubview:v31];
  }
  id v32 = [(HURecordingButton *)self currentButtonLabel];
  [v32 setText:v8];

  v33 = (void *)MEMORY[0x1E4F42FF0];
  if (v5) {
    double v34 = 0.25;
  }
  else {
    double v34 = 0.0;
  }
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __47__HURecordingButton_setText_forState_animated___block_invoke;
  v39[3] = &unk_1E638A900;
  id v40 = v12;
  v41 = self;
  unint64_t v42 = a4;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __47__HURecordingButton_setText_forState_animated___block_invoke_2;
  v36[3] = &unk_1E63865B8;
  id v37 = v40;
  v38 = self;
  id v35 = v40;
  [v33 animateWithDuration:v39 animations:v36 completion:v34];
}

void __47__HURecordingButton_setText_forState_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.1];
  uint64_t v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v7, 0.3, 0.3);
  [v2 setTransform:&v7];
  v3 = [*(id *)(a1 + 40) currentButtonLabel];
  CGAffineTransformMakeScale(&v6, 1.0, 1.0);
  [v3 setTransform:&v6];

  double v4 = [*(id *)(a1 + 40) currentButtonLabel];
  [v4 setAlpha:1.0];

  if (*(void *)(a1 + 48) == 4)
  {
    BOOL v5 = [MEMORY[0x1E4F428B8] greenColor];
    [*(id *)(a1 + 40) setBackgroundColor:v5];
  }
}

uint64_t __47__HURecordingButton_setText_forState_animated___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) removeFromSuperview];
    [*(id *)(v2 + 40) setCurrentButtonImageView:0];
    v3 = *(void **)(v2 + 40);
    return [v3 setNextButtonImageView:0];
  }
  return result;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)HURecordingButton;
  [(HURecordingButton *)&v7 layoutSubviews];
  [(HURecordingButton *)self bounds];
  double v4 = v3 * 0.5;
  BOOL v5 = [(HURecordingButton *)self layer];
  [v5 setCornerRadius:v4];

  CGAffineTransform v6 = [(HURecordingButton *)self layer];
  [v6 setMasksToBounds:1];
}

- (void)_updateHighlight
{
  if ([(HURecordingButton *)self isEnabled])
  {
    int v3 = [(HURecordingButton *)self isHighlighted];
    double v4 = 1.0;
    if (v3) {
      double v4 = 0.5;
    }
  }
  else
  {
    double v4 = 0.2;
  }

  [(HURecordingButton *)self setAlpha:v4];
}

- (unint64_t)currentRecordingState
{
  return self->_currentRecordingState;
}

- (void)setCurrentRecordingState:(unint64_t)a3
{
  self->_currentRecordingState = a3;
}

- (UIImage)currentButtonImage
{
  return self->_currentButtonImage;
}

- (void)setCurrentButtonImage:(id)a3
{
}

- (UIImage)nextButtonImage
{
  return self->_nextButtonImage;
}

- (void)setNextButtonImage:(id)a3
{
}

- (UIImageView)currentButtonImageView
{
  return self->_currentButtonImageView;
}

- (void)setCurrentButtonImageView:(id)a3
{
}

- (UIImageView)nextButtonImageView
{
  return self->_nextButtonImageView;
}

- (void)setNextButtonImageView:(id)a3
{
}

- (UILabel)currentButtonLabel
{
  return self->_currentButtonLabel;
}

- (void)setCurrentButtonLabel:(id)a3
{
}

- (CAShapeLayer)stopButtonStrokeLayer
{
  return self->_stopButtonStrokeLayer;
}

- (void)setStopButtonStrokeLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopButtonStrokeLayer, 0);
  objc_storeStrong((id *)&self->_currentButtonLabel, 0);
  objc_storeStrong((id *)&self->_nextButtonImageView, 0);
  objc_storeStrong((id *)&self->_currentButtonImageView, 0);
  objc_storeStrong((id *)&self->_nextButtonImage, 0);

  objc_storeStrong((id *)&self->_currentButtonImage, 0);
}

@end