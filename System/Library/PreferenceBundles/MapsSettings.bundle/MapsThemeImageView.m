@interface MapsThemeImageView
- (id)imageProvider;
- (void)_updateImage;
- (void)didMoveToWindow;
- (void)setImageProvider:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MapsThemeImageView

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsThemeImageView;
  [(MapsThemeImageView *)&v9 traitCollectionDidChange:v5];
  if (v5
    && (id v6 = [v5 userInterfaceStyle],
        [(MapsThemeImageView *)self traitCollection],
        v3 = objc_claimAutoreleasedReturnValue(),
        v6 == [v3 userInterfaceStyle]))
  {
  }
  else
  {
    v7 = [(MapsThemeImageView *)self traitCollection];
    id v8 = [v7 userInterfaceStyle];

    if (v5) {
    if (v8)
    }
      [(MapsThemeImageView *)self updateTheme];
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)MapsThemeImageView;
  [(MapsThemeImageView *)&v4 didMoveToWindow];
  v3 = [(MapsThemeImageView *)self window];

  if (v3) {
    [(MapsThemeImageView *)self updateTheme];
  }
}

- (void)setImageProvider:(id)a3
{
  if (self->_imageProvider != a3)
  {
    id v4 = objc_retainBlock(a3);
    id imageProvider = self->_imageProvider;
    self->_id imageProvider = v4;

    [(MapsThemeImageView *)self _updateImage];
  }
}

- (void)_updateImage
{
  v3 = [(MapsThemeImageView *)self imageProvider];

  if (v3)
  {
    id v6 = [(MapsThemeImageView *)self imageProvider];
    id v4 = +[MapsTheme sharedTheme];
    id v5 = v6[2](v6, v4);
    [(MapsThemeImageView *)self setImage:v5];
  }
}

- (id)imageProvider
{
  return self->_imageProvider;
}

- (void).cxx_destruct
{
}

@end