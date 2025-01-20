@interface MRUActivityNowPlayingHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUActivityNowPlayingHeaderView)init;
- (MRUNowPlayingLabelView)labelView;
- (MRUVisualStylingProvider)stylingProvider;
- (double)labelInset;
- (void)layoutSubviews;
- (void)setStylingProvider:(id)a3;
- (void)updateVisibilty;
@end

@implementation MRUActivityNowPlayingHeaderView

- (MRUActivityNowPlayingHeaderView)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRUActivityNowPlayingHeaderView;
  v2 = -[MRUActivityNowPlayingHeaderView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    v3 = objc_alloc_init(MRUNowPlayingLabelView);
    labelView = v2->_labelView;
    v2->_labelView = v3;

    [(MRUNowPlayingLabelView *)v2->_labelView setLayout:2];
    [(MRUNowPlayingLabelView *)v2->_labelView setShowRoute:1];
    [(MRUNowPlayingLabelView *)v2->_labelView setShowSubtitle:1];
    [(MRUActivityNowPlayingHeaderView *)v2 addSubview:v2->_labelView];
  }
  return v2;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)MRUActivityNowPlayingHeaderView;
  [(MRUActivityNowPlayingHeaderView *)&v17 layoutSubviews];
  [(MRUActivityNowPlayingHeaderView *)self updateVisibilty];
  [(MRUActivityNowPlayingHeaderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(MRUActivityNowPlayingHeaderView *)self SBUISA_layoutMode];
  labelView = self->_labelView;
  if (v11 == 4)
  {
    -[MRUNowPlayingLabelView sizeThatFits:](labelView, "sizeThatFits:", v8, v10);
    v18.origin.x = v4;
    v18.origin.y = v6;
    v18.size.width = v8;
    v18.size.height = v10;
    CGRectGetMinX(v18);
    v19.origin.x = v4;
    v19.origin.y = v6;
    v19.size.width = v8;
    v19.size.height = v10;
    CGRectGetWidth(v19);
    UIRectCenteredYInRect();
    double v4 = v13;
    double v6 = v14;
    double v8 = v15;
    double v10 = v16;
    labelView = self->_labelView;
  }
  -[MRUNowPlayingLabelView setFrame:](labelView, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[MRUNowPlayingLabelView sizeThatFits:](self->_labelView, "sizeThatFits:", a3.width, a3.height);
  if (v4 < 66.0) {
    double v4 = 66.0;
  }
  double v5 = width;
  result.height = v4;
  result.CGFloat width = v5;
  return result;
}

- (void)setStylingProvider:(id)a3
{
  double v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUNowPlayingLabelView *)self->_labelView setStylingProvider:v5];
  }
}

- (double)labelInset
{
  double v3 = [(MRUNowPlayingLabelView *)self->_labelView viewForFirstBaselineLayout];
  -[MRUNowPlayingLabelView sizeThatFits:](self->_labelView, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v5 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v3, "mr_tightBoundingRectOfFirstLine");
    double v5 = v5 - CGRectGetMinY(v7);
  }

  return (66.0 - v5) * 0.5;
}

- (void)updateVisibilty
{
  if ([(MRUActivityNowPlayingHeaderView *)self SBUISA_layoutMode] == 4)
  {
    p_labelView = (id *)&self->_labelView;
    id v4 = *p_labelView;
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v10[0] = *MEMORY[0x1E4F1DAB8];
    v10[1] = v5;
    v10[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v4 setTransform:v10];
    double v6 = 1.0;
  }
  else
  {
    CGAffineTransformMakeScale(&v9, 0.5, 0.5);
    p_labelView = (id *)&self->_labelView;
    id v7 = *p_labelView;
    CGAffineTransform v8 = v9;
    [v7 setTransform:&v8];
    double v6 = 0.0;
  }
  [*p_labelView setAlpha:v6];
}

- (MRUNowPlayingLabelView)labelView
{
  return self->_labelView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylingProvider, 0);

  objc_storeStrong((id *)&self->_labelView, 0);
}

@end