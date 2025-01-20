@interface MRURoutingSeparatorHeaderView
- (MRURoutingSeparatorHeaderView)initWithReuseIdentifier:(id)a3;
- (MRUVisualStylingProvider)stylingProvider;
- (UIView)separatorView;
- (void)layoutSubviews;
- (void)setSeparatorView:(id)a3;
- (void)setStylingProvider:(id)a3;
- (void)updateVisualStyling;
@end

@implementation MRURoutingSeparatorHeaderView

- (MRURoutingSeparatorHeaderView)initWithReuseIdentifier:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MRURoutingSeparatorHeaderView;
  v3 = [(MRURoutingSeparatorHeaderView *)&v10 initWithReuseIdentifier:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(MRURoutingSeparatorHeaderView *)v3 setTintColor:v4];

    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separatorView = v3->_separatorView;
    v3->_separatorView = v5;

    v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)v3->_separatorView setBackgroundColor:v7];

    v8 = [(MRURoutingSeparatorHeaderView *)v3 contentView];
    [v8 addSubview:v3->_separatorView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MRURoutingSeparatorHeaderView;
  [(MRURoutingSeparatorHeaderView *)&v3 layoutSubviews];
  [(MRURoutingSeparatorHeaderView *)self bounds];
  -[UIView setFrame:](self->_separatorView, "setFrame:");
}

- (void)setStylingProvider:(id)a3
{
  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    v7 = v5;
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRURoutingSeparatorHeaderView *)self updateVisualStyling];
    v5 = v7;
  }
}

- (void)updateVisualStyling
{
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);

  objc_storeStrong((id *)&self->_stylingProvider, 0);
}

@end