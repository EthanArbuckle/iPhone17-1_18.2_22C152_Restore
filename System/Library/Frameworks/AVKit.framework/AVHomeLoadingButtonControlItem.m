@interface AVHomeLoadingButtonControlItem
- (AVHomeLoadingButtonControlItem)initWithTitle:(id)a3 type:(int64_t)a4;
- (AVLoadingButtonView)loadingButtonView;
- (BOOL)showsLoadingIndicator;
- (id)titleFont;
- (void)_buttonTouchUpInside:(id)a3;
- (void)_updateTintColor;
- (void)setLoadingButtonView:(id)a3;
- (void)setShowsLoadingIndicator:(BOOL)a3;
- (void)setTitleFont:(id)a3;
@end

@implementation AVHomeLoadingButtonControlItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingButtonView, 0);

  objc_storeStrong((id *)&self->_titleFont, 0);
}

- (void)setLoadingButtonView:(id)a3
{
}

- (AVLoadingButtonView)loadingButtonView
{
  return self->_loadingButtonView;
}

- (void)_updateTintColor
{
  id v5 = [(AVControlItem *)self tintColor];
  v3 = [(AVHomeLoadingButtonControlItem *)self loadingButtonView];
  v4 = [v3 button];
  +[AVBackdropView applyGlyphTintColor:v5 toView:v4];
}

- (void)setTitleFont:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  }
  id obj = v4;
  if (([(UIFont *)self->_titleFont isEqual:v4] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleFont, obj);
    id v5 = [(AVHomeLoadingButtonControlItem *)self loadingButtonView];
    v6 = [v5 button];
    v7 = [v6 titleLabel];
    [v7 setFont:obj];
  }
}

- (id)titleFont
{
  return self->_titleFont;
}

- (BOOL)showsLoadingIndicator
{
  v2 = [(AVHomeLoadingButtonControlItem *)self loadingButtonView];
  char v3 = [v2 showsLoadingIndicator];

  return v3;
}

- (void)setShowsLoadingIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AVHomeLoadingButtonControlItem *)self loadingButtonView];
  [v4 setShowsLoadingIndicator:v3];
}

- (void)_buttonTouchUpInside:(id)a3
{
  id v4 = [(AVControlItem *)self action];

  if (v4)
  {
    id v5 = [(AVControlItem *)self action];
    v5[2]();
  }
}

- (AVHomeLoadingButtonControlItem)initWithTitle:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AVHomeLoadingButtonControlItem;
  v7 = [(AVControlItem *)&v12 initWithTitle:v6 type:a4];
  if (v7)
  {
    v8 = [[AVLoadingButtonView alloc] initWithTitle:v6];
    loadingButtonView = v7->_loadingButtonView;
    v7->_loadingButtonView = v8;

    v10 = [(AVLoadingButtonView *)v7->_loadingButtonView button];
    [v10 addTarget:v7 action:sel__buttonTouchUpInside_ forControlEvents:64];
  }
  return v7;
}

@end