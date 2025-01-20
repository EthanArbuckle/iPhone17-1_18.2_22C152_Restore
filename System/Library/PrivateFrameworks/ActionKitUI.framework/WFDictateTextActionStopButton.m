@interface WFDictateTextActionStopButton
- (BOOL)recording;
- (CGSize)intrinsicContentSize;
- (NSLayoutConstraint)redSquareWidthConstraint;
- (UIView)redSquare;
- (WFDictateTextActionStopButton)init;
- (double)currentInnerCircleRadius;
- (double)currentLineWidth;
- (double)currentStopButtonSize;
- (id)accessibilityLabel;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setRecording:(BOOL)a3;
- (void)setRecording:(BOOL)a3 animated:(BOOL)a4;
- (void)setRedSquare:(id)a3;
- (void)setRedSquareWidthConstraint:(id)a3;
@end

@implementation WFDictateTextActionStopButton

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_redSquareWidthConstraint);
  objc_destroyWeak((id *)&self->_redSquare);
}

- (void)setRedSquareWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)redSquareWidthConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_redSquareWidthConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setRedSquare:(id)a3
{
}

- (UIView)redSquare
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_redSquare);
  return (UIView *)WeakRetained;
}

- (BOOL)recording
{
  return self->_recording;
}

- (id)accessibilityLabel
{
  if ([(WFDictateTextActionStopButton *)self recording]) {
    v2 = @"Stop dictation";
  }
  else {
    v2 = @"Start dictation";
  }
  v3 = WFLocalizedString(v2);
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2 = 73.0;
  double v3 = 73.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setRecording:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_recording != a3)
  {
    self->_recording = a3;
    double v4 = 0.3;
    if (!a4) {
      double v4 = 0.0;
    }
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __55__WFDictateTextActionStopButton_setRecording_animated___block_invoke;
    v5[3] = &unk_264900E20;
    v5[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:v5 animations:v4];
  }
}

uint64_t __55__WFDictateTextActionStopButton_setRecording_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  double v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (void)setRecording:(BOOL)a3
{
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)WFDictateTextActionStopButton;
  [(WFDictateTextActionStopButton *)&v13 layoutSubviews];
  [(WFDictateTextActionStopButton *)self currentInnerCircleRadius];
  double v4 = v3;
  if ([(WFDictateTextActionStopButton *)self recording])
  {
    [(WFDictateTextActionStopButton *)self currentStopButtonSize];
    double v6 = v5;
  }
  else
  {
    double v6 = v4 + v4;
  }
  v7 = [(WFDictateTextActionStopButton *)self redSquareWidthConstraint];
  [v7 setConstant:v6];

  if ([(WFDictateTextActionStopButton *)self recording]) {
    double v4 = 5.0;
  }
  v8 = [(WFDictateTextActionStopButton *)self redSquare];
  v9 = [v8 layer];
  [v9 setCornerRadius:v4];

  uint64_t v10 = *MEMORY[0x263F15A20];
  v11 = [(WFDictateTextActionStopButton *)self redSquare];
  v12 = [v11 layer];
  [v12 setCornerCurve:v10];
}

- (void)setHighlighted:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFDictateTextActionStopButton;
  -[WFDictateTextActionStopButton setHighlighted:](&v7, sel_setHighlighted_);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__WFDictateTextActionStopButton_setHighlighted___block_invoke;
  v5[3] = &unk_264900CC8;
  v5[4] = self;
  BOOL v6 = a3;
  [MEMORY[0x263F82E00] animateWithDuration:v5 animations:0.2];
}

void __48__WFDictateTextActionStopButton_setHighlighted___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    CGAffineTransformMakeScale(&v5, 0.9, 0.9);
  }
  else
  {
    long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v5.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v5.c = v2;
    *(_OWORD *)&v5.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  }
  double v3 = [*(id *)(a1 + 32) redSquare];
  CGAffineTransform v4 = v5;
  [v3 setTransform:&v4];
}

- (void)drawRect:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)WFDictateTextActionStopButton;
  -[WFDictateTextActionStopButton drawRect:](&v16, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGAffineTransform v4 = [(WFDictateTextActionStopButton *)self redSquare];
  [v4 center];
  double v6 = v5;
  double v8 = v7;

  [(WFDictateTextActionStopButton *)self frame];
  double v10 = v9;
  [(WFDictateTextActionStopButton *)self currentLineWidth];
  double v12 = v11;
  objc_super v13 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v6, v8, (v10 - v11) * 0.5, 0.0, 6.28318531);
  [v13 setLineWidth:v12];
  v14 = [MEMORY[0x263F825C8] labelColor];
  v15 = [v14 colorWithAlphaComponent:0.25];
  [v15 setStroke];

  [v13 stroke];
}

- (double)currentStopButtonSize
{
  [(WFDictateTextActionStopButton *)self frame];
  return v2 / 73.0 * 30.0;
}

- (double)currentInnerCircleRadius
{
  [(WFDictateTextActionStopButton *)self frame];
  return v2 / 73.0 * 28.0;
}

- (double)currentLineWidth
{
  [(WFDictateTextActionStopButton *)self frame];
  return floor(v2 / 73.0 * 6.0);
}

- (WFDictateTextActionStopButton)init
{
  v22[4] = *MEMORY[0x263EF8340];
  double v3 = +[WFDictateTextActionStopButton buttonWithType:0];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F82E00]);
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v5 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.231372549 blue:0.188235294 alpha:1.0];
    [v4 setBackgroundColor:v5];

    double v6 = [v4 layer];
    [v6 setMasksToBounds:1];

    [v4 setUserInteractionEnabled:0];
    [(WFDictateTextActionStopButton *)v3 addSubview:v4];
    [(WFDictateTextActionStopButton *)v3 setRedSquare:v4];
    double v7 = [v4 widthAnchor];
    v19 = [v7 constraintEqualToConstant:0.0];

    v18 = (void *)MEMORY[0x263F08938];
    v21 = [v4 centerXAnchor];
    v20 = [(WFDictateTextActionStopButton *)v3 centerXAnchor];
    double v8 = [v21 constraintEqualToAnchor:v20];
    v22[0] = v8;
    double v9 = [v4 centerYAnchor];
    double v10 = [(WFDictateTextActionStopButton *)v3 centerYAnchor];
    double v11 = [v9 constraintEqualToAnchor:v10];
    v22[1] = v11;
    v22[2] = v19;
    double v12 = [v4 heightAnchor];
    objc_super v13 = [v4 widthAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v22[3] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
    [v18 activateConstraints:v15];

    [(WFDictateTextActionStopButton *)v3 setRedSquareWidthConstraint:v19];
    objc_super v16 = v3;
  }
  return v3;
}

@end