@interface MKArtworkImageView
- (MKArtworkImageSource)imageSource;
- (MKArtworkImageView)initWithFrame:(CGRect)a3;
- (UIColor)primaryTintColor;
- (UIColor)secondaryTintColor;
- (UIImageView)badgeView;
- (void)_updateImageView;
- (void)setImageSource:(id)a3;
- (void)setPrimaryTintColor:(id)a3;
- (void)setSecondaryTintColor:(id)a3;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
@end

@implementation MKArtworkImageView

- (MKArtworkImageView)initWithFrame:(CGRect)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)MKArtworkImageView;
  v3 = -[MKArtworkImageView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F428B8] labelColor];
    [(MKArtworkImageView *)v3 setTintColor:v4];

    v9[0] = objc_opt_class();
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v6 = (id)[(MKArtworkImageView *)v3 registerForTraitChanges:v5 withAction:sel_traitEnvironment_didChangeTraitCollection_];
  }
  return v3;
}

- (void)setImageSource:(id)a3
{
  v5 = (MKArtworkImageSource *)a3;
  if (self->_imageSource != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_imageSource, a3);
    [(MKArtworkImageView *)self _updateImageView];
    v5 = v6;
  }
}

- (void)_updateImageView
{
  v3 = [(MKArtworkImageView *)self window];
  v4 = [v3 screen];
  v5 = v4;
  if (v4)
  {
    [v4 scale];
    double v7 = v6;
  }
  else
  {
    objc_super v8 = [MEMORY[0x1E4F42D90] mainScreen];
    [v8 scale];
    double v7 = v9;
  }
  BOOL v10 = [(UIView *)self _mapkit_isDarkModeEnabled];
  v11 = [(MKArtworkImageSource *)self->_imageSource imageToDisplayWithScreenScale:v10 nightMode:v7];
  v24.receiver = self;
  v24.super_class = (Class)MKArtworkImageView;
  [(MKArtworkImageView *)&v24 setImage:v11];
  v12 = [(MKArtworkImageSource *)self->_imageSource badgeImageToDisplayWithScreenScale:v10 nightMode:v7];
  cachedBadgeView = self->_cachedBadgeView;
  if (v12)
  {
    if (!cachedBadgeView)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F42AA0]);
      v15 = (UIImageView *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v16 = self->_cachedBadgeView;
      self->_cachedBadgeView = v15;

      [(UIImageView *)self->_cachedBadgeView setTranslatesAutoresizingMaskIntoConstraints:0];
      cachedBadgeView = self->_cachedBadgeView;
    }
    [(MKArtworkImageView *)self addSubview:cachedBadgeView];
    [(UIImageView *)self->_cachedBadgeView setImage:v12];
    [(MKArtworkImageView *)self setClipsToBounds:0];
    v17 = [MEMORY[0x1E4F1CA48] array];
    v18 = [(UIImageView *)self->_cachedBadgeView bottomAnchor];
    v19 = [(MKArtworkImageView *)self bottomAnchor];
    v20 = [v18 constraintEqualToAnchor:v19 constant:2.0];
    [v17 addObject:v20];

    v21 = [(UIImageView *)self->_cachedBadgeView trailingAnchor];
    v22 = [(MKArtworkImageView *)self trailingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:6.0];
    [v17 addObject:v23];

    [MEMORY[0x1E4F28DC8] activateConstraints:v17];
  }
  else
  {
    [(UIImageView *)self->_cachedBadgeView setImage:0];
    [(UIImageView *)self->_cachedBadgeView removeFromSuperview];
  }
}

- (UIImageView)badgeView
{
  cachedBadgeView = [(UIImageView *)self->_cachedBadgeView superview];
  v4 = cachedBadgeView;
  if (cachedBadgeView) {
    cachedBadgeView = self->_cachedBadgeView;
  }
  v5 = cachedBadgeView;

  return v5;
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "userInterfaceStyle", a3);
  double v6 = [(MKArtworkImageView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    [(MKArtworkImageView *)self _updateImageView];
  }
}

- (MKArtworkImageSource)imageSource
{
  return self->_imageSource;
}

- (UIColor)primaryTintColor
{
  return self->_primaryTintColor;
}

- (void)setPrimaryTintColor:(id)a3
{
}

- (UIColor)secondaryTintColor
{
  return self->_secondaryTintColor;
}

- (void)setSecondaryTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTintColor, 0);
  objc_storeStrong((id *)&self->_primaryTintColor, 0);
  objc_storeStrong((id *)&self->_imageSource, 0);

  objc_storeStrong((id *)&self->_cachedBadgeView, 0);
}

@end