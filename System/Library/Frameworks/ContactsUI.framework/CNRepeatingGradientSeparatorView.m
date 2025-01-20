@interface CNRepeatingGradientSeparatorView
- (CGSize)intrinsicContentSize;
- (CNRepeatingGradientSeparatorView)initWithFrame:(CGRect)a3;
- (NSArray)gradientColors;
- (UIColor)endColor;
- (UIColor)startColor;
- (int64_t)lineCount;
- (void)_updateGradients;
- (void)layoutSubviews;
- (void)setEndColor:(id)a3;
- (void)setLineCount:(int64_t)a3;
- (void)setStartColor:(id)a3;
@end

@implementation CNRepeatingGradientSeparatorView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endColor, 0);

  objc_storeStrong((id *)&self->_startColor, 0);
}

- (int64_t)lineCount
{
  return self->_lineCount;
}

- (UIColor)endColor
{
  return self->_endColor;
}

- (UIColor)startColor
{
  return self->_startColor;
}

- (void)setEndColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_endColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_endColor, a3);
    v5 = v6;
  }
}

- (void)setStartColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_startColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_startColor, a3);
    v5 = v6;
  }
}

- (NSArray)gradientColors
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNRepeatingGradientSeparatorView *)self startColor];
  v7[0] = [v3 CGColor];
  id v4 = [(CNRepeatingGradientSeparatorView *)self endColor];
  v7[1] = [v4 CGColor];
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return (NSArray *)v5;
}

- (void)layoutSubviews
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)CNRepeatingGradientSeparatorView;
  [(CNRepeatingGradientSeparatorView *)&v15 layoutSubviews];
  [(CNRepeatingGradientSeparatorView *)self bounds];
  CGRectGetHeight(v18);
  [(CNRepeatingGradientSeparatorView *)self lineCount];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(CNRepeatingGradientSeparatorView *)self layer];
  id v4 = [v3 sublayers];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        [(CNRepeatingGradientSeparatorView *)self bounds];
        objc_msgSend(v10, "setFrame:");
        ++v9;
      }
      while (v6 != v9);
      v7 += v9;
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_updateGradients
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  id v3 = [(CNRepeatingGradientSeparatorView *)self layer];
  id v4 = [v3 sublayers];
  [v4 makeObjectsPerformSelector:sel_removeFromSuperlayer];

  if ([(CNRepeatingGradientSeparatorView *)self lineCount] >= 1)
  {
    int64_t v5 = 0;
    do
    {
      uint64_t v6 = [MEMORY[0x1E4F39BD0] layer];
      uint64_t v7 = [(CNRepeatingGradientSeparatorView *)self gradientColors];
      [v6 setColors:v7];

      uint64_t v8 = [(CNRepeatingGradientSeparatorView *)self layer];
      [v8 addSublayer:v6];

      ++v5;
    }
    while (v5 < [(CNRepeatingGradientSeparatorView *)self lineCount]);
  }
  [(CNRepeatingGradientSeparatorView *)self setNeedsLayout];
  [(CNRepeatingGradientSeparatorView *)self layoutIfNeeded];
  uint64_t v9 = (void *)MEMORY[0x1E4F39CF8];

  [v9 commit];
}

- (void)setLineCount:(int64_t)a3
{
  if (self->_lineCount != a3)
  {
    self->_lineCount = a3;
    [(CNRepeatingGradientSeparatorView *)self _updateGradients];
  }
}

- (CGSize)intrinsicContentSize
{
  v2 = [(CNRepeatingGradientSeparatorView *)self _screen];
  [v2 scale];
  if (v3 == 0.0)
  {
    if (RoundToScale_onceToken != -1) {
      dispatch_once(&RoundToScale_onceToken, &__block_literal_global_33);
    }
    double v3 = *(double *)&RoundToScale___s;
  }
  double v4 = 1.0;
  if (v3 != 1.0) {
    double v4 = round(v3 * 0.5) / v3;
  }

  double v5 = *MEMORY[0x1E4FB30D8];
  double v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CNRepeatingGradientSeparatorView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CNRepeatingGradientSeparatorView;
  double v3 = -[CNRepeatingGradientSeparatorView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] clearColor];
    startColor = v3->_startColor;
    v3->_startColor = (UIColor *)v4;

    uint64_t v6 = +[CNUIColorRepository contactStyleDefaultSeparatorColor];
    endColor = v3->_endColor;
    v3->_endColor = (UIColor *)v6;

    LODWORD(v8) = 1148846080;
    [(CNRepeatingGradientSeparatorView *)v3 setContentCompressionResistancePriority:0 forAxis:v8];
    LODWORD(v9) = 1148846080;
    [(CNRepeatingGradientSeparatorView *)v3 setContentHuggingPriority:0 forAxis:v9];
    [(CNRepeatingGradientSeparatorView *)v3 setLineCount:1];
  }
  return v3;
}

@end