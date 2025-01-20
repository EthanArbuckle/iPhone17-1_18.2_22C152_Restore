@interface CEKExpandingTickMarksView
- (BOOL)expanded;
- (CEKExpandingTickMarksView)initWithFrame:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (NSMutableArray)_tickViews;
- (_NSRange)_selectedRange;
- (unint64_t)_collapsedTickIndexForIndex:(unint64_t)a3;
- (unint64_t)_middleTickIndex;
- (void)layoutSubviews;
- (void)setExpanded:(BOOL)a3;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelectedValue:(double)a3;
- (void)setSelectedValue:(double)a3 animated:(BOOL)a4;
- (void)set_selectedRange:(_NSRange)a3;
- (void)tintColorDidChange;
@end

@implementation CEKExpandingTickMarksView

- (CEKExpandingTickMarksView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CEKExpandingTickMarksView;
  v3 = -[CEKExpandingTickMarksView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    tickViews = v3->__tickViews;
    v3->__tickViews = v4;

    uint64_t v6 = 41;
    do
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      [(NSMutableArray *)v3->__tickViews addObject:v7];
      [(CEKExpandingTickMarksView *)v3 addSubview:v7];

      --v6;
    }
    while (v6);
  }
  return v3;
}

- (void)setSelectedValue:(double)a3
{
}

- (void)setSelectedValue:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger v7 = [(CEKExpandingTickMarksView *)self _middleTickIndex];
  double v8 = (a3 + 1.0) * 0.5;
  if (v8 <= 0.5)
  {
    if (v8 >= 0.5)
    {
      NSUInteger v11 = 0;
      p_selectedRange = &self->__selectedRange;
      self->__selectedRange.location = v7;
      goto LABEL_7;
    }
    unint64_t v10 = vcvtpd_s64_f64(v8 * (double)40);
    p_selectedRange = &self->__selectedRange;
    NSUInteger v11 = v7 - v10;
  }
  else
  {
    p_selectedRange = &self->__selectedRange;
    unint64_t v10 = v7 + 1;
    NSUInteger v11 = vcvtmd_s64_f64(v8 * (double)40) - v7;
  }
  p_selectedRange->location = v10;
LABEL_7:
  p_selectedRange->length = v11;
  [(CEKExpandingTickMarksView *)self setNeedsLayout];
  if (v4)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__CEKExpandingTickMarksView_setSelectedValue_animated___block_invoke;
    v12[3] = &unk_1E63CD380;
    v12[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v12 usingSpringWithDamping:0 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:1.0];
  }
}

uint64_t __55__CEKExpandingTickMarksView_setSelectedValue_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setExpanded:(BOOL)a3
{
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_expanded != a3)
  {
    BOOL v4 = a4;
    self->_expanded = a3;
    [(CEKExpandingTickMarksView *)self setNeedsLayout];
    if (v4)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __50__CEKExpandingTickMarksView_setExpanded_animated___block_invoke;
      v6[3] = &unk_1E63CD380;
      v6[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v6 options:0 animations:0.35 completion:0.0];
    }
  }
}

uint64_t __50__CEKExpandingTickMarksView_setExpanded_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (CGSize)intrinsicContentSize
{
  double v2 = (double)(uint64_t)(vcvtpd_s64_f64((double)41 / (double)5) - 1) * 7.0 + 1.0;
  double v3 = fmax(10.0, 5.0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)_middleTickIndex
{
  return vcvtmd_u64_f64((double)41 * 0.5);
}

- (unint64_t)_collapsedTickIndexForIndex:(unint64_t)a3
{
  unint64_t v4 = [(CEKExpandingTickMarksView *)self _middleTickIndex];
  double v5 = (double)a3 / (double)5;
  double v6 = floor(v5);
  double v7 = ceil(v5);
  if (v4 <= a3) {
    return (uint64_t)v6;
  }
  return (uint64_t)v7;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CEKExpandingTickMarksView;
  [(CEKExpandingTickMarksView *)&v13 layoutSubviews];
  [(CEKExpandingTickMarksView *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  NSUInteger v11 = [(CEKExpandingTickMarksView *)self _tickViews];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__CEKExpandingTickMarksView_layoutSubviews__block_invoke;
  v12[3] = &unk_1E63CD3C8;
  v12[4] = self;
  void v12[5] = v4;
  v12[6] = v6;
  v12[7] = v8;
  v12[8] = v10;
  [v11 enumerateObjectsUsingBlock:v12];
}

void __43__CEKExpandingTickMarksView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v20 = a2;
  unint64_t v5 = a3 % 5;
  if (a3 % 5)
  {
    BOOL v6 = 0;
  }
  else
  {
    unint64_t v7 = [*(id *)(a1 + 32) _selectedRange];
    BOOL v6 = a3 >= v7 && a3 - v7 < v8;
  }
  int v10 = [*(id *)(a1 + 32) expanded];
  unint64_t v11 = a3;
  if (([*(id *)(a1 + 32) expanded] & 1) == 0) {
    unint64_t v11 = [*(id *)(a1 + 32) _collapsedTickIndexForIndex:a3];
  }
  double v12 = *(double *)(a1 + 64);
  if (v6 && ![*(id *)(a1 + 32) expanded])
  {
    objc_super v13 = [*(id *)(a1 + 32) tintColor];
  }
  else
  {
    objc_super v13 = [MEMORY[0x1E4FB1618] labelColor];
  }
  v14 = v13;
  double v15 = 10.0;
  double v16 = 0.3;
  double v17 = 1.0;
  if (!v5) {
    double v16 = 1.0;
  }
  v18 = [v13 colorWithAlphaComponent:v16];
  [v20 setBackgroundColor:v18];

  if (v5)
  {
    if ([*(id *)(a1 + 32) expanded]) {
      double v17 = 1.0;
    }
    else {
      double v17 = 0.0;
    }
  }
  if (a3) {
    int v19 = v10;
  }
  else {
    int v19 = 1;
  }
  if (a3 == 40) {
    int v19 = 1;
  }
  if (!(v19 | v6)) {
    double v15 = 5.0;
  }
  [v20 setAlpha:v17];
  objc_msgSend(v20, "setFrame:", 7.0 * (double)v11, v12 - v15, 1.0, v15);
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CEKExpandingTickMarksView;
  [(CEKExpandingTickMarksView *)&v3 tintColorDidChange];
  [(CEKExpandingTickMarksView *)self setNeedsLayout];
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (_NSRange)_selectedRange
{
  p_selectedRange = &self->__selectedRange;
  NSUInteger location = self->__selectedRange.location;
  NSUInteger length = p_selectedRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)set_selectedRange:(_NSRange)a3
{
  self->__selectedRange = a3;
}

- (NSMutableArray)_tickViews
{
  return self->__tickViews;
}

- (void).cxx_destruct
{
}

@end