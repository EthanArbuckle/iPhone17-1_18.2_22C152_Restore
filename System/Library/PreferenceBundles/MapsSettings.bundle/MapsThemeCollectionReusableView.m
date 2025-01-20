@interface MapsThemeCollectionReusableView
- (MapsThemeCollectionReusableView)initWithFrame:(CGRect)a3;
- (UIView)contentView;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)didMoveToWindow;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MapsThemeCollectionReusableView

- (MapsThemeCollectionReusableView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MapsThemeCollectionReusableView;
  v3 = -[MapsThemeCollectionReusableView initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(MapsThemeCollectionReusableView *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc((Class)UIView);
    [(MapsThemeCollectionReusableView *)v3 bounds];
    v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
    contentView = v3->_contentView;
    v3->_contentView = v6;

    [(UIView *)v3->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_contentView setPreservesSuperviewLayoutMargins:1];
    [(MapsThemeCollectionReusableView *)v3 addSubview:v3->_contentView];
    v8 = v3->_contentView;
    v9 = [(MapsThemeCollectionReusableView *)v3 layoutMarginsGuide];
    LODWORD(v10) = 1148846080;
    v11 = [(UIView *)v8 _maps_constraintsEqualToEdgesOfLayoutGuide:v9 priority:v10];
    v12 = [v11 allConstraints];
    +[NSLayoutConstraint activateConstraints:v12];
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsThemeCollectionReusableView;
  [(MapsThemeCollectionReusableView *)&v9 traitCollectionDidChange:v5];
  if (v5
    && (id v6 = [v5 userInterfaceStyle],
        [(MapsThemeCollectionReusableView *)self traitCollection],
        v3 = objc_claimAutoreleasedReturnValue(),
        v6 == [v3 userInterfaceStyle]))
  {
  }
  else
  {
    v7 = [(MapsThemeCollectionReusableView *)self traitCollection];
    id v8 = [v7 userInterfaceStyle];

    if (v5) {
    if (v8)
    }
      [(MapsThemeCollectionReusableView *)self updateTheme];
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)MapsThemeCollectionReusableView;
  [(MapsThemeCollectionReusableView *)&v4 didMoveToWindow];
  v3 = [(MapsThemeCollectionReusableView *)self window];

  if (v3) {
    [(MapsThemeCollectionReusableView *)self updateTheme];
  }
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = [a3 copy];
  id v5 = [(MapsThemeCollectionReusableView *)self contentView];
  objc_msgSend(v5, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);

  [v4 frame];
  objc_msgSend(v4, "setFrame:");

  return v4;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
}

@end