@interface HKInteractiveChartAnnotationViewKeyValueLabel
- (CGSize)_compressedKeySize;
- (CGSize)_horizontalIntrinsicContentSize;
- (CGSize)_verticalInstrinsicContentSize;
- (CGSize)intrinsicContentSize;
- (HKInteractiveChartAnnotationViewKeyValueLabel)initWithFrame:(CGRect)a3;
- (HKSelectedRangeLabel)keyLabel;
- (HKSelectedRangeLabel)valueLabel;
- (UIImageView)forwardChevronView;
- (UITapGestureRecognizer)tapOutRecognizer;
- (id)tapOutBlock;
- (int64_t)orientation;
- (void)_installForwardChevronView;
- (void)_layoutSubviewsHorizontally;
- (void)_layoutSubviewsVertically;
- (void)_removeForwardChevronView;
- (void)handleTapOutGesture:(id)a3;
- (void)layoutSubviews;
- (void)setForwardChevronView:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setTapOutBlock:(id)a3;
- (void)setTapOutRecognizer:(id)a3;
@end

@implementation HKInteractiveChartAnnotationViewKeyValueLabel

- (HKInteractiveChartAnnotationViewKeyValueLabel)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)HKInteractiveChartAnnotationViewKeyValueLabel;
  v3 = -[HKInteractiveChartAnnotationViewKeyValueLabel initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_orientation = 1;
    uint64_t v5 = objc_opt_new();
    keyLabel = v4->_keyLabel;
    v4->_keyLabel = (HKSelectedRangeLabel *)v5;

    v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartLollipopKeyFont");
    [(HKSelectedRangeLabel *)v4->_keyLabel setFont:v7];

    v8 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopLabelColor");
    v9 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)v4 keyLabel];
    [v9 setTextColor:v8];

    v10 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)v4 keyLabel];
    [v10 setAdjustsFontSizeToFitWidth:1];

    v11 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)v4 keyLabel];
    [v11 setMinimumScaleFactor:0.1];

    v12 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)v4 keyLabel];
    [v12 setLineBreakMode:4];

    v13 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)v4 keyLabel];
    [(HKInteractiveChartAnnotationViewKeyValueLabel *)v4 addSubview:v13];

    uint64_t v14 = objc_opt_new();
    valueLabel = v4->_valueLabel;
    v4->_valueLabel = (HKSelectedRangeLabel *)v14;

    v16 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueValueFont");
    [(HKSelectedRangeLabel *)v4->_valueLabel setFont:v16];

    v17 = [MEMORY[0x1E4FB1618] labelColor];
    v18 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)v4 valueLabel];
    [v18 setTextColor:v17];

    v19 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)v4 valueLabel];
    [v19 setAdjustsFontSizeToFitWidth:1];

    v20 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)v4 valueLabel];
    [v20 setMinimumScaleFactor:0.1];

    v21 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)v4 valueLabel];
    [v21 setLineBreakMode:4];

    v22 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)v4 valueLabel];
    [(HKInteractiveChartAnnotationViewKeyValueLabel *)v4 addSubview:v22];

    [(HKInteractiveChartAnnotationViewKeyValueLabel *)v4 setForwardChevronView:0];
    [(HKInteractiveChartAnnotationViewKeyValueLabel *)v4 setTapOutRecognizer:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  if ([(HKInteractiveChartAnnotationViewKeyValueLabel *)self orientation] == 1)
  {
    [(HKInteractiveChartAnnotationViewKeyValueLabel *)self _layoutSubviewsVertically];
  }
  else
  {
    [(HKInteractiveChartAnnotationViewKeyValueLabel *)self _layoutSubviewsHorizontally];
  }
}

- (void)setTapOutBlock:(id)a3
{
  uint64_t v5 = _Block_copy(a3);
  id tapOutBlock = self->_tapOutBlock;
  self->_id tapOutBlock = v5;

  if (a3)
  {
    [(HKInteractiveChartAnnotationViewKeyValueLabel *)self _installForwardChevronView];
  }
  else
  {
    [(HKInteractiveChartAnnotationViewKeyValueLabel *)self _removeForwardChevronView];
  }
}

- (void)_installForwardChevronView
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopLabelColor");
  v4 = (void *)MEMORY[0x1E4FB1830];
  v18[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v6 = [v4 configurationWithPaletteColors:v5];

  v7 = (void *)MEMORY[0x1E4FB1830];
  v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartLollipopKeyFont");
  v9 = [v7 configurationWithFont:v8];

  v10 = [v6 configurationByApplyingConfiguration:v9];
  v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward" withConfiguration:v10];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v11];
  [(HKInteractiveChartAnnotationViewKeyValueLabel *)self setForwardChevronView:v12];

  v13 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self forwardChevronView];
  [v13 setContentMode:1];

  uint64_t v14 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self forwardChevronView];
  [(HKInteractiveChartAnnotationViewKeyValueLabel *)self addSubview:v14];

  [(HKInteractiveChartAnnotationViewKeyValueLabel *)self setNeedsLayout];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_handleTapOutGesture_];
  [(HKInteractiveChartAnnotationViewKeyValueLabel *)self setTapOutRecognizer:v15];

  [(HKInteractiveChartAnnotationViewKeyValueLabel *)self setUserInteractionEnabled:1];
  v16 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self tapOutRecognizer];
  [(HKInteractiveChartAnnotationViewKeyValueLabel *)self addGestureRecognizer:v16];

  v17 = objc_msgSend(NSString, "hk_chartAccessibilityIdentifier:", @"LollipopTapOut");
  [(HKInteractiveChartAnnotationViewKeyValueLabel *)self setAccessibilityIdentifier:v17];
}

- (void)_removeForwardChevronView
{
  v3 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self forwardChevronView];

  if (v3)
  {
    v4 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self forwardChevronView];
    [v4 removeFromSuperview];

    [(HKInteractiveChartAnnotationViewKeyValueLabel *)self setNeedsLayout];
    uint64_t v5 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self tapOutRecognizer];
    [(HKInteractiveChartAnnotationViewKeyValueLabel *)self removeGestureRecognizer:v5];

    [(HKInteractiveChartAnnotationViewKeyValueLabel *)self setUserInteractionEnabled:0];
    [(HKInteractiveChartAnnotationViewKeyValueLabel *)self setTapOutRecognizer:0];
    [(HKInteractiveChartAnnotationViewKeyValueLabel *)self setForwardChevronView:0];
  }
}

- (void)handleTapOutGesture:(id)a3
{
  v4 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self tapOutBlock];

  if (v4)
  {
    uint64_t v5 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self tapOutBlock];
    v5[2]();
  }
}

- (void)_layoutSubviewsVertically
{
  [(HKInteractiveChartAnnotationViewKeyValueLabel *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(HKInteractiveChartAnnotationViewKeyValueLabel *)self _compressedKeySize];
  double v8 = v7;
  v9 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self valueLabel];
  [v9 intrinsicContentSize];
  double v11 = v10;

  double v12 = v8 + v11 - v6;
  BOOL v13 = v12 <= 0.00000001;
  double v14 = 0.0;
  if (v12 <= 0.00000001) {
    double v15 = 0.0;
  }
  else {
    double v15 = v11 * 0.15;
  }
  double v16 = v6 + v15;
  if (v13) {
    double v17 = 0.0;
  }
  else {
    double v17 = v8 * 0.15;
  }
  if (v16 - v11 >= 0.0) {
    double v18 = v16 - v11;
  }
  else {
    double v18 = 0.0;
  }
  double v19 = v16 - v18;
  v20 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self valueLabel];
  objc_msgSend(v20, "setFrame:", 0.0, v18, v4, v19);

  double v21 = v4 - v8;
  v22 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self forwardChevronView];
  if (v22) {
    double v23 = v4 - v8;
  }
  else {
    double v23 = v4;
  }
  double v24 = v18 - v8;

  if (v18 - v8 < 0.0)
  {
    double v24 = -v17;
    double v18 = v8 - v17;
  }
  if ([(HKInteractiveChartAnnotationViewKeyValueLabel *)self effectiveUserInterfaceLayoutDirection] == 1)
  {
    v25 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self forwardChevronView];

    if (v25) {
      double v14 = v8;
    }
    else {
      double v14 = 0.0;
    }
  }
  v26 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self keyLabel];
  objc_msgSend(v26, "setFrame:", v14, v24, v23, v18 - v24);

  v27 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self forwardChevronView];

  if (v27)
  {
    double v28 = v8 + -4.0;
    double v29 = v21 + 4.0;
    if ([(HKInteractiveChartAnnotationViewKeyValueLabel *)self effectiveUserInterfaceLayoutDirection] == 1)double v29 = 0.0; {
    id v30 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self forwardChevronView];
    }
    objc_msgSend(v30, "setFrame:", v29, v24 + 2.0, v28, v28);
  }
}

- (void)_layoutSubviewsHorizontally
{
  [(HKInteractiveChartAnnotationViewKeyValueLabel *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(HKInteractiveChartAnnotationViewKeyValueLabel *)self _compressedKeySize];
  double v8 = v7;
  v9 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self valueLabel];
  [v9 intrinsicContentSize];
  double v11 = v10;

  if (v8 + v11 <= v4) {
    double v12 = 0.0;
  }
  else {
    double v12 = (v8 + v11 - v4) * 0.5;
  }
  BOOL v13 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self forwardChevronView];
  if (v13) {
    double v14 = v6;
  }
  else {
    double v14 = 0.0;
  }

  double v15 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self forwardChevronView];

  if (v15) {
    double v16 = v14;
  }
  else {
    double v16 = 0.0;
  }
  double v17 = v8 - v12 - v16;
  double v18 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self keyLabel];
  objc_msgSend(v18, "setFrame:", 0.0, 0.0, v17, v6);

  double v19 = v17 + 0.0;
  v20 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self forwardChevronView];

  if (v20)
  {
    double v21 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self forwardChevronView];
    objc_msgSend(v21, "setFrame:", v19 + 4.0, 2.0, v14 + -4.0, v14 + -4.0);

    double v19 = v14 + v19;
  }
  id v22 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self valueLabel];
  objc_msgSend(v22, "setFrame:", v19, 0.0, v11 - v12, v6);
}

- (CGSize)intrinsicContentSize
{
  int64_t v3 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self orientation];
  if (v3 == 1)
  {
    [(HKInteractiveChartAnnotationViewKeyValueLabel *)self _verticalInstrinsicContentSize];
  }
  else if (!v3)
  {
    [(HKInteractiveChartAnnotationViewKeyValueLabel *)self _horizontalIntrinsicContentSize];
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_horizontalIntrinsicContentSize
{
  [(HKInteractiveChartAnnotationViewKeyValueLabel *)self _compressedKeySize];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self valueLabel];
  [v7 intrinsicContentSize];
  double v9 = v8;
  double v11 = v10;

  double v12 = v4 + v9;
  if (v6 >= v11) {
    double v13 = v6;
  }
  else {
    double v13 = v11;
  }
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)_verticalInstrinsicContentSize
{
  [(HKInteractiveChartAnnotationViewKeyValueLabel *)self _compressedKeySize];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self valueLabel];
  [v7 intrinsicContentSize];
  double v9 = v8;
  double v11 = v10;

  if (v4 >= v9) {
    double v12 = v4;
  }
  else {
    double v12 = v9;
  }
  double v13 = v6 + v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)_compressedKeySize
{
  double v3 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self keyLabel];
  [v3 intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)self forwardChevronView];

  double v9 = -0.0;
  if (v8) {
    double v9 = v7;
  }
  double v10 = v5 + v9;
  double v11 = v7;
  result.height = v11;
  result.width = v10;
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (HKSelectedRangeLabel)keyLabel
{
  return self->_keyLabel;
}

- (HKSelectedRangeLabel)valueLabel
{
  return self->_valueLabel;
}

- (id)tapOutBlock
{
  return self->_tapOutBlock;
}

- (UIImageView)forwardChevronView
{
  return self->_forwardChevronView;
}

- (void)setForwardChevronView:(id)a3
{
}

- (UITapGestureRecognizer)tapOutRecognizer
{
  return self->_tapOutRecognizer;
}

- (void)setTapOutRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapOutRecognizer, 0);
  objc_storeStrong((id *)&self->_forwardChevronView, 0);
  objc_storeStrong(&self->_tapOutBlock, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_keyLabel, 0);
}

@end