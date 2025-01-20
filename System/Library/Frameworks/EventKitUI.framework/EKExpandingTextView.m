@interface EKExpandingTextView
- (BOOL)_shouldScrollEnclosingScrollView;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (EKExpandingTextView)initWithFrame:(CGRect)a3;
- (NSString)placeholder;
- (void)_updatePlaceholder;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAttributedText:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setFont:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
@end

@implementation EKExpandingTextView

- (EKExpandingTextView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)EKExpandingTextView;
  v3 = -[EKExpandingTextView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(EKExpandingTextView *)v3 textLayoutManager];
    [v5 setLimitsLayoutForSuspiciousContents:1];

    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    placeholderLabel = v4->_placeholderLabel;
    v4->_placeholderLabel = (UILabel *)v7;

    v9 = [MEMORY[0x1E4FB1618] lightGrayColor];
    [(UILabel *)v4->_placeholderLabel setTextColor:v9];

    [(EKExpandingTextView *)v4 addSubview:v4->_placeholderLabel];
    [(EKExpandingTextView *)v4 setScrollEnabled:0];
    [(EKExpandingTextView *)v4 setShowsVerticalScrollIndicator:0];
    v4->_allowEnclosingViewScroll = 1;
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v4 selector:sel__updatePlaceholder name:*MEMORY[0x1E4FB30A0] object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB30A0] object:0];

  v4.receiver = self;
  v4.super_class = (Class)EKExpandingTextView;
  [(EKExpandingTextView *)&v4 dealloc];
}

- (void)setPlaceholder:(id)a3
{
}

- (NSString)placeholder
{
  return [(UILabel *)self->_placeholderLabel text];
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)EKExpandingTextView;
  [(EKExpandingTextView *)&v14 layoutSubviews];
  [(EKExpandingTextView *)self visibleTextRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (![(EKExpandingTextView *)self textAlignment]) {
    double v4 = v4 + 10.0;
  }
  v11 = [(EKExpandingTextView *)self font];
  [v11 pointSize];
  *(float *)&double v12 = v12 * 0.5;
  double v13 = roundf(*(float *)&v12);

  -[UILabel setFrame:](self->_placeholderLabel, "setFrame:", v4, v6 + v13, v8 + -10.0, v10 - v13);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (-[EKExpandingTextView isFirstResponder](self, "isFirstResponder") && ![v7 type])
  {
    [(EKExpandingTextView *)self bounds];
    CGRect v14 = CGRectInset(v13, 0.0, -20.0);
    v12.double x = x;
    v12.double y = y;
    BOOL v8 = CGRectContainsPoint(v14, v12);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)EKExpandingTextView;
    BOOL v8 = -[EKExpandingTextView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y);
  }
  BOOL v9 = v8;

  return v9;
}

- (void)_updatePlaceholder
{
  uint64_t v3 = [(EKExpandingTextView *)self hasText];
  placeholderLabel = self->_placeholderLabel;

  [(UILabel *)placeholderLabel setHidden:v3];
}

- (void)setAttributedText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKExpandingTextView;
  [(EKExpandingTextView *)&v4 setAttributedText:a3];
  [(EKExpandingTextView *)self _updatePlaceholder];
}

- (void)setFont:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKExpandingTextView;
  id v4 = a3;
  [(EKExpandingTextView *)&v5 setFont:v4];
  -[UILabel setFont:](self->_placeholderLabel, "setFont:", v4, v5.receiver, v5.super_class);
}

- (void)setTextAlignment:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKExpandingTextView;
  -[EKExpandingTextView setTextAlignment:](&v5, sel_setTextAlignment_);
  [(UILabel *)self->_placeholderLabel setTextAlignment:a3];
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKExpandingTextView;
  id v4 = a3;
  [(EKExpandingTextView *)&v5 setBackgroundColor:v4];
  -[UILabel setBackgroundColor:](self->_placeholderLabel, "setBackgroundColor:", v4, v5.receiver, v5.super_class);
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(EKExpandingTextView *)self contentSize];
  double v7 = v6;
  v17.receiver = self;
  v17.super_class = (Class)EKExpandingTextView;
  -[EKExpandingTextView setContentSize:](&v17, sel_setContentSize_, width, height);
  BOOL v8 = [(EKExpandingTextView *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    double v10 = [(EKExpandingTextView *)self delegate];
    int v11 = [v10 textViewShouldSignalContentSizeChange:self];

    if (v11)
    {
      double v12 = vabdd_f64(v7, height);
      CGRect v13 = [(EKExpandingTextView *)self font];
      [v13 lineHeight];
      double v15 = v14;

      if (v12 > v15)
      {
        v16 = [(EKExpandingTextView *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [v16 textViewDidChangeContentHeight:self];
        }
      }
    }
  }
}

- (CGSize)intrinsicContentSize
{
  v14.receiver = self;
  v14.super_class = (Class)EKExpandingTextView;
  [(EKExpandingTextView *)&v14 intrinsicContentSize];
  double v5 = v4;
  CGFloat v6 = v3;
  double height = self->_previousIntrinsicContentSize.height;
  if (v5 != self->_previousIntrinsicContentSize.width || v3 != height)
  {
    float v9 = height;
    float v10 = v3;
    if (vabds_f32(v9, v10) >= 0.00000011921)
    {
      int v11 = [(EKExpandingTextView *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v11 textViewDidChangeContentHeight:self];
      }
    }
    self->_previousIntrinsicContentSize.double width = v5;
    self->_previousIntrinsicContentSize.double height = v6;
  }
  double v12 = v5;
  double v13 = v6;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v18.receiver = self;
  v18.super_class = (Class)EKExpandingTextView;
  -[EKExpandingTextView sizeThatFits:](&v18, sel_sizeThatFits_);
  if (v6 > width)
  {
    v17.receiver = self;
    v17.super_class = (Class)EKExpandingTextView;
    -[EKExpandingTextView sizeThatFits:](&v17, sel_sizeThatFits_, width + -5.0, height);
  }
  double v8 = v6;
  CGFloat v9 = v7;
  double v10 = self->_previousSizeThatFits.height;
  if (v8 != self->_previousSizeThatFits.width || v7 != v10)
  {
    float v12 = v10;
    float v13 = v7;
    if (vabds_f32(v12, v13) >= 0.00000011921)
    {
      objc_super v14 = [(EKExpandingTextView *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v14 textViewDidChangeContentHeight:self];
      }
    }
    self->_previousSizeThatFits.double width = v8;
    self->_previousSizeThatFits.double height = v9;
  }
  double v15 = v8;
  double v16 = v9;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (BOOL)_shouldScrollEnclosingScrollView
{
  return 0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel_toggleItalics_ == a3) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)EKExpandingTextView;
  return -[EKExpandingTextView canPerformAction:withSender:](&v5, sel_canPerformAction_withSender_);
}

- (void).cxx_destruct
{
}

@end