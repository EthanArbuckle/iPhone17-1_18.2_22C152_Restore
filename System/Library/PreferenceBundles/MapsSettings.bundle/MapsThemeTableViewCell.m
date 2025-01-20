@interface MapsThemeTableViewCell
- (MapsThemeTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)selectedBackgroundColorProvider;
- (void)_updateSelectedBackgroundColor;
- (void)didMoveToWindow;
- (void)setSelectedBackgroundColorProvider:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTheme;
@end

@implementation MapsThemeTableViewCell

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsThemeTableViewCell;
  [(MapsThemeTableViewCell *)&v9 traitCollectionDidChange:v5];
  if (v5
    && (id v6 = [v5 userInterfaceStyle],
        [(MapsThemeTableViewCell *)self traitCollection],
        v3 = objc_claimAutoreleasedReturnValue(),
        v6 == [v3 userInterfaceStyle]))
  {
  }
  else
  {
    v7 = [(MapsThemeTableViewCell *)self traitCollection];
    id v8 = [v7 userInterfaceStyle];

    if (v5) {
    if (v8)
    }
      [(MapsThemeTableViewCell *)self updateTheme];
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)MapsThemeTableViewCell;
  [(MapsThemeTableViewCell *)&v4 didMoveToWindow];
  v3 = [(MapsThemeTableViewCell *)self window];

  if (v3) {
    [(MapsThemeTableViewCell *)self updateTheme];
  }
}

- (MapsThemeTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MapsThemeTableViewCell;
  objc_super v4 = [(MapsThemeTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc((Class)UIView);
    [(MapsThemeTableViewCell *)v4 bounds];
    id v6 = objc_msgSend(v5, "initWithFrame:");
    [(MapsThemeTableViewCell *)v4 setSelectedBackgroundView:v6];

    v7 = v4;
  }

  return v4;
}

- (void)updateTheme
{
  v3 = [(MapsThemeTableViewCell *)self theme];
  objc_super v4 = [v3 tableViewCellHighlightedOverlayColor];
  id v5 = [(MapsThemeTableViewCell *)self selectedBackgroundView];
  [v5 setBackgroundColor:v4];

  [(MapsThemeTableViewCell *)self _updateSelectedBackgroundColor];
}

- (void)setSelectedBackgroundColorProvider:(id)a3
{
  if (self->_selectedBackgroundColorProvider != a3)
  {
    id v4 = objc_retainBlock(a3);
    id selectedBackgroundColorProvider = self->_selectedBackgroundColorProvider;
    self->_id selectedBackgroundColorProvider = v4;

    [(MapsThemeTableViewCell *)self _updateSelectedBackgroundColor];
  }
}

- (void)_updateSelectedBackgroundColor
{
  v3 = [(MapsThemeTableViewCell *)self selectedBackgroundColorProvider];

  if (v3)
  {
    v7 = [(MapsThemeTableViewCell *)self selectedBackgroundColorProvider];
    id v4 = [(MapsThemeTableViewCell *)self theme];
    id v5 = v7[2](v7, v4);
    id v6 = [(MapsThemeTableViewCell *)self selectedBackgroundView];
    [v6 setBackgroundColor:v5];
  }
}

- (id)selectedBackgroundColorProvider
{
  return self->_selectedBackgroundColorProvider;
}

- (void).cxx_destruct
{
}

@end