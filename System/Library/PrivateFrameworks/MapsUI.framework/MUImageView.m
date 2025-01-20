@interface MUImageView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (MUImageView)initWithFrame:(CGRect)a3;
- (UIImage)fallbackImage;
- (UIImage)image;
- (UIImageView)contentImageView;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)layoutSubviews;
- (void)setFallbackImage:(id)a3;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 animated:(BOOL)a4;
@end

@implementation MUImageView

- (MUImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUImageView;
  v3 = -[MUImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MUImageView *)v3 _setupSubviews];
  }
  return v4;
}

- (void)_setupSubviews
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  fallbackImageView = self->_fallbackImageView;
  self->_fallbackImageView = v8;

  v10 = [MEMORY[0x1E4FB1618] colorWithRed:0.78039217 green:0.78039217 blue:0.800000012 alpha:1.0];
  [(UIImageView *)self->_fallbackImageView setTintColor:v10];

  [(UIImageView *)self->_fallbackImageView setContentMode:1];
  -[UIImageView setFrame:](self->_fallbackImageView, "setFrame:", 0.0, 0.0, 50.0, 50.0);
  [(MUImageView *)self addSubview:self->_fallbackImageView];
  v11 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v4, v5, v6, v7);
  contentImageView = self->_contentImageView;
  self->_contentImageView = v11;

  [(UIImageView *)self->_contentImageView setAccessibilityIgnoresInvertColors:1];
  [(UIImageView *)self->_contentImageView setClipsToBounds:1];
  [(UIImageView *)self->_contentImageView setContentMode:2];
  v13 = self->_contentImageView;
  [(MUImageView *)self addSubview:v13];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MUImageView;
  [(MUImageView *)&v4 layoutSubviews];
  [(MUImageView *)self bounds];
  -[UIImageView setFrame:](self->_contentImageView, "setFrame:");
  [(MUImageView *)self bounds];
  double MidX = CGRectGetMidX(v5);
  [(MUImageView *)self bounds];
  -[UIImageView setCenter:](self->_fallbackImageView, "setCenter:", MidX, CGRectGetMidY(v6));
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(MUImageView *)self image];

  if (v7 != v6)
  {
    if (a4)
    {
      objc_initWeak(&location, self);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __33__MUImageView_setImage_animated___block_invoke;
      v10[3] = &unk_1E574F110;
      objc_copyWeak(&v12, &location);
      id v11 = v6;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __33__MUImageView_setImage_animated___block_invoke_2;
      v8[3] = &unk_1E574F3A8;
      objc_copyWeak(&v9, &location);
      [(UIView *)self _mapsui_performImageLoadingTransitionWithAnimations:v10 completion:v8];
      objc_destroyWeak(&v9);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    else
    {
      [(UIImageView *)self->_contentImageView setImage:v6];
      [(MUImageView *)self _updateAppearance];
    }
  }
}

void __33__MUImageView_setImage_animated___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[52] setImage:*(void *)(a1 + 32)];
    WeakRetained = v3;
  }
}

void __33__MUImageView_setImage_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateAppearance];
    id WeakRetained = v2;
  }
}

- (void)_updateAppearance
{
  id v3 = [(MUImageView *)self image];

  if (v3
    || ([(MUImageView *)self fallbackImage],
        objc_super v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    BOOL v5 = v3 == 0;
    BOOL v6 = v3 == 0;
    uint64_t v7 = !v5;
    [(UIImageView *)self->_fallbackImageView setHidden:v7];
    contentImageView = self->_contentImageView;
    [(UIImageView *)contentImageView setHidden:v6];
  }
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return [(UIImageView *)self->_contentImageView image];
}

- (void)setFallbackImage:(id)a3
{
  [(UIImageView *)self->_fallbackImageView setImage:a3];
  [(MUImageView *)self _updateAppearance];
}

- (UIImage)fallbackImage
{
  return [(UIImageView *)self->_fallbackImageView image];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIImageView sizeThatFits:](self->_contentImageView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(UIImageView *)self->_contentImageView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  -[UIImageView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_contentImageView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height);
  result.height = v6;
  result.width = v5;
  return result;
}

- (UIImageView)contentImageView
{
  return self->_contentImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentImageView, 0);
  objc_storeStrong((id *)&self->_fallbackImageView, 0);
}

@end