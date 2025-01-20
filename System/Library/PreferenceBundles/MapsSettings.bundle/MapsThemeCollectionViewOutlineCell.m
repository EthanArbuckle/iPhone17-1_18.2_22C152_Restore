@interface MapsThemeCollectionViewOutlineCell
- (void)didMoveToWindow;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MapsThemeCollectionViewOutlineCell

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsThemeCollectionViewOutlineCell;
  [(MapsThemeCollectionViewOutlineCell *)&v9 traitCollectionDidChange:v5];
  if (v5
    && (id v6 = [v5 userInterfaceStyle],
        [(MapsThemeCollectionViewOutlineCell *)self traitCollection],
        v3 = objc_claimAutoreleasedReturnValue(),
        v6 == [v3 userInterfaceStyle]))
  {
  }
  else
  {
    v7 = [(MapsThemeCollectionViewOutlineCell *)self traitCollection];
    id v8 = [v7 userInterfaceStyle];

    if (v5) {
    if (v8)
    }
      [(MapsThemeCollectionViewOutlineCell *)self updateTheme];
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)MapsThemeCollectionViewOutlineCell;
  [(MapsThemeCollectionViewOutlineCell *)&v4 didMoveToWindow];
  v3 = [(MapsThemeCollectionViewOutlineCell *)self window];

  if (v3) {
    [(MapsThemeCollectionViewOutlineCell *)self updateTheme];
  }
}

@end