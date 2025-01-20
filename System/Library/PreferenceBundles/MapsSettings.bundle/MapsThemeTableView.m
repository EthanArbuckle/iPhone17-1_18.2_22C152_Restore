@interface MapsThemeTableView
- (id)separatorColorProvider;
- (void)_updateSeparatorColor;
- (void)didMoveToWindow;
- (void)setCellSeparatorColorProvider:(id)a3;
- (void)setSeparatorColorProvider:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTheme;
@end

@implementation MapsThemeTableView

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsThemeTableView;
  [(MapsThemeTableView *)&v9 traitCollectionDidChange:v5];
  if (v5
    && (id v6 = [v5 userInterfaceStyle],
        [(MapsThemeTableView *)self traitCollection],
        v3 = objc_claimAutoreleasedReturnValue(),
        v6 == [v3 userInterfaceStyle]))
  {
  }
  else
  {
    v7 = [(MapsThemeTableView *)self traitCollection];
    id v8 = [v7 userInterfaceStyle];

    if (v5) {
    if (v8)
    }
      [(MapsThemeTableView *)self updateTheme];
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)MapsThemeTableView;
  [(MapsThemeTableView *)&v4 didMoveToWindow];
  v3 = [(MapsThemeTableView *)self window];

  if (v3) {
    [(MapsThemeTableView *)self updateTheme];
  }
}

- (void)updateTheme
{
}

- (void)setCellSeparatorColorProvider:(id)a3
{
  if (self->_separatorColorProvider != a3)
  {
    id v4 = objc_retainBlock(a3);
    id separatorColorProvider = self->_separatorColorProvider;
    self->_id separatorColorProvider = v4;

    [(MapsThemeTableView *)self _updateSeparatorColor];
  }
}

- (void)_updateSeparatorColor
{
  v3 = [(MapsThemeTableView *)self separatorColorProvider];

  if (v3)
  {
    id v6 = [(MapsThemeTableView *)self separatorColorProvider];
    id v4 = +[MapsTheme sharedTheme];
    id v5 = v6[2](v6, v4);
    [(MapsThemeTableView *)self setSeparatorColor:v5];
  }
}

- (id)separatorColorProvider
{
  return self->_separatorColorProvider;
}

- (void)setSeparatorColorProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end