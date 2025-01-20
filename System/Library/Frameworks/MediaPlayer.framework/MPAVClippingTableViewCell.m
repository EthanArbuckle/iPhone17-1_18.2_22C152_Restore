@interface MPAVClippingTableViewCell
- (BOOL)shouldHideSectionBottomSeparator;
- (MPAVClippingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIEdgeInsets)clippingInsets;
- (UIView)bottomSeparatorView;
- (UIView)clippingContentView;
- (UIView)clippingMaskView;
- (UIView)topSeparatorView;
- (void)_setShouldHaveFullLengthBottomSeparator:(BOOL)a3;
- (void)_setShouldHaveFullLengthTopSeparator:(BOOL)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessoryView:(id)a3;
- (void)setClippingContentView:(id)a3;
- (void)setClippingInsets:(UIEdgeInsets)a3;
- (void)setClippingMaskView:(id)a3;
- (void)setShouldHideSectionBottomSeparator:(BOOL)a3;
@end

@implementation MPAVClippingTableViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clippingMaskView, 0);
  objc_storeStrong((id *)&self->_clippingContentView, 0);
  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);

  objc_storeStrong((id *)&self->_topSeparatorView, 0);
}

- (UIEdgeInsets)clippingInsets
{
  double top = self->_clippingInsets.top;
  double left = self->_clippingInsets.left;
  double bottom = self->_clippingInsets.bottom;
  double right = self->_clippingInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setClippingMaskView:(id)a3
{
}

- (UIView)clippingMaskView
{
  return self->_clippingMaskView;
}

- (void)setClippingContentView:(id)a3
{
}

- (UIView)clippingContentView
{
  return self->_clippingContentView;
}

- (void)setShouldHideSectionBottomSeparator:(BOOL)a3
{
  self->_shouldHideSectionBottomSeparator = a3;
}

- (BOOL)shouldHideSectionBottomSeparator
{
  return self->_shouldHideSectionBottomSeparator;
}

- (UIView)bottomSeparatorView
{
  return self->_bottomSeparatorView;
}

- (UIView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (void)_setShouldHaveFullLengthBottomSeparator:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MPAVClippingTableViewCell;
  -[MPAVClippingTableViewCell _setShouldHaveFullLengthBottomSeparator:](&v6, sel__setShouldHaveFullLengthBottomSeparator_);
  BOOL v5 = v3 && self->_shouldHideSectionBottomSeparator;
  [(UIView *)self->_bottomSeparatorView setHidden:v5];
}

- (void)_setShouldHaveFullLengthTopSeparator:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MPAVClippingTableViewCell;
  -[MPAVClippingTableViewCell _setShouldHaveFullLengthTopSeparator:](&v5, sel__setShouldHaveFullLengthTopSeparator_);
  [(UIView *)self->_topSeparatorView setHidden:!v3];
}

- (void)layoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)MPAVClippingTableViewCell;
  [(MPAVClippingTableViewCell *)&v37 layoutSubviews];
  [(MPAVClippingTableViewCell *)self bounds];
  double top = self->_clippingInsets.top;
  double left = self->_clippingInsets.left;
  double v6 = v5 + left;
  double v8 = v7 + top;
  double v10 = v9 - (left + self->_clippingInsets.right);
  double v12 = v11 - (top + self->_clippingInsets.bottom);
  -[UIView setFrame:](self->_clippingContentView, "setFrame:", v5 + left, v7 + top, v10, v12);
  v13 = [(MPAVClippingTableViewCell *)self _defaultAccessoryView];
  v14 = [v13 maskView];
  clippingMaskView = self->_clippingMaskView;

  if (v14 != clippingMaskView) {
    [v13 setMaskView:self->_clippingMaskView];
  }
  objc_msgSend(v13, "convertRect:fromView:", self, v6, v8, v10, v12);
  -[UIView setFrame:](self->_clippingMaskView, "setFrame:");
  v16 = [(MPAVClippingTableViewCell *)self contentView];
  [v16 frame];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  CGFloat v23 = -self->_clippingInsets.top;
  v24 = [(MPAVClippingTableViewCell *)self contentView];
  objc_msgSend(v24, "setFrame:", v18, v23, v20, v22);

  [(MPAVClippingTableViewCell *)self _separatorFrame];
  double v26 = v25;
  CGFloat v28 = v27;
  double v30 = v29;
  double v32 = v31;
  [(MPAVClippingTableViewCell *)self bounds];
  double Width = CGRectGetWidth(v38);
  v39.origin.x = v26;
  v39.origin.y = v28;
  v39.size.width = v30;
  v39.size.height = v32;
  -[UIView setFrame:](self->_topSeparatorView, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v39));
  v34 = [(MPAVClippingTableViewCell *)self contentView];
  [v34 bounds];
  double MaxY = CGRectGetMaxY(v40);
  v41.origin.x = v26;
  v41.origin.y = v28;
  v41.size.width = v30;
  v41.size.height = v32;
  double v36 = MaxY - CGRectGetHeight(v41);

  -[UIView setFrame:](self->_bottomSeparatorView, "setFrame:", v26, v36, v30, v32);
}

- (void)setClippingInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_clippingInsets.left
    || a3.top != self->_clippingInsets.top
    || a3.right != self->_clippingInsets.right
    || a3.bottom != self->_clippingInsets.bottom)
  {
    self->_clippingInsets = a3;
    BOOL v7 = a3.left != *(double *)(MEMORY[0x1E4FB2848] + 8);
    if (a3.top != *MEMORY[0x1E4FB2848]) {
      BOOL v7 = 1;
    }
    if (a3.right != *(double *)(MEMORY[0x1E4FB2848] + 24)) {
      BOOL v7 = 1;
    }
    uint64_t v8 = a3.bottom != *(double *)(MEMORY[0x1E4FB2848] + 16) || v7;
    [(UIView *)self->_clippingContentView setClipsToBounds:v8];
    [(MPAVClippingTableViewCell *)self setNeedsLayout];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)MPAVClippingTableViewCell;
  [(MPAVClippingTableViewCell *)&v3 prepareForReuse];
  -[MPAVClippingTableViewCell setClippingInsets:](self, "setClippingInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
}

- (void)setAccessoryView:(id)a3
{
  id v4 = a3;
  double v5 = [(MPAVClippingTableViewCell *)self accessoryView];
  [v5 setMaskView:0];

  v8.receiver = self;
  v8.super_class = (Class)MPAVClippingTableViewCell;
  [(MPAVClippingTableViewCell *)&v8 setAccessoryView:v4];

  clippingMaskView = self->_clippingMaskView;
  BOOL v7 = [(MPAVClippingTableViewCell *)self accessoryView];
  [v7 setMaskView:clippingMaskView];
}

- (void)dealloc
{
  objc_super v3 = [(MPAVClippingTableViewCell *)self accessoryView];
  [v3 setMaskView:0];

  v4.receiver = self;
  v4.super_class = (Class)MPAVClippingTableViewCell;
  [(MPAVClippingTableViewCell *)&v4 dealloc];
}

- (MPAVClippingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v28.receiver = self;
  v28.super_class = (Class)MPAVClippingTableViewCell;
  objc_super v4 = [(MPAVClippingTableViewCell *)&v28 initWithStyle:a3 reuseIdentifier:a4];
  double v5 = v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)&v4->_clippingInsets.double top = *MEMORY[0x1E4FB2848];
    *(_OWORD *)&v4->_clippingInsets.double bottom = v6;
    [(MPAVClippingTableViewCell *)v4 setClipsToBounds:1];
    id v7 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v12 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], v9, v10, v11);
    clippingMaskView = v5->_clippingMaskView;
    v5->_clippingMaskView = (UIView *)v12;

    v14 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)v5->_clippingMaskView setBackgroundColor:v14];

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v8, v9, v10, v11);
    clippingContentView = v5->_clippingContentView;
    v5->_clippingContentView = (UIView *)v15;

    double v17 = v5->_clippingContentView;
    double v18 = [(MPAVClippingTableViewCell *)v5 contentView];
    [(UIView *)v17 addSubview:v18];

    [(MPAVClippingTableViewCell *)v5 addSubview:v5->_clippingContentView];
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v8, v9, v10, v11);
    bottomSeparatorView = v5->_bottomSeparatorView;
    v5->_bottomSeparatorView = (UIView *)v19;

    double v21 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)v5->_bottomSeparatorView setBackgroundColor:v21];

    double v22 = [(MPAVClippingTableViewCell *)v5 contentView];
    [v22 addSubview:v5->_bottomSeparatorView];

    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v8, v9, v10, v11);
    topSeparatorView = v5->_topSeparatorView;
    v5->_topSeparatorView = (UIView *)v23;

    double v25 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)v5->_topSeparatorView setBackgroundColor:v25];

    [(UIView *)v5->_topSeparatorView setHidden:1];
    double v26 = [(MPAVClippingTableViewCell *)v5 contentView];
    [v26 addSubview:v5->_topSeparatorView];
  }
  return v5;
}

@end