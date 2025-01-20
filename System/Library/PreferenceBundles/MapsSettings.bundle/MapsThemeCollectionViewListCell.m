@interface MapsThemeCollectionViewListCell
+ (BOOL)_maps_overridePreferredLayoutAttributesWithCompressedSize;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)didMoveToWindow;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MapsThemeCollectionViewListCell

+ (BOOL)_maps_overridePreferredLayoutAttributesWithCompressedSize
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsThemeCollectionViewListCell;
  [(MapsThemeCollectionViewListCell *)&v9 traitCollectionDidChange:v5];
  if (v5
    && (id v6 = [v5 userInterfaceStyle],
        [(MapsThemeCollectionViewListCell *)self traitCollection],
        v3 = objc_claimAutoreleasedReturnValue(),
        v6 == [v3 userInterfaceStyle]))
  {
  }
  else
  {
    v7 = [(MapsThemeCollectionViewListCell *)self traitCollection];
    id v8 = [v7 userInterfaceStyle];

    if (v5) {
    if (v8)
    }
      [(MapsThemeCollectionViewListCell *)self updateTheme];
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)MapsThemeCollectionViewListCell;
  [(MapsThemeCollectionViewListCell *)&v4 didMoveToWindow];
  v3 = [(MapsThemeCollectionViewListCell *)self window];

  if (v3) {
    [(MapsThemeCollectionViewListCell *)self updateTheme];
  }
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_maps_overridePreferredLayoutAttributesWithCompressedSize"))
  {
    id v5 = [v4 copy];
    [v5 frame];
    double x = v12.origin.x;
    double y = v12.origin.y;
    double width = v12.size.width;
    [(MapsThemeCollectionViewListCell *)self _maps_compressedSizeForWidth:0 withBlock:CGRectGetWidth(v12)];
    objc_msgSend(v5, "setFrame:", x, y, width, v9);
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

@end