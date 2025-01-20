@interface FASharedServicesSpecifierCell
+ (int64_t)cellStyle;
- (id)blankIcon;
- (id)getLazyIcon;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation FASharedServicesSpecifierCell

+ (int64_t)cellStyle
{
  return 3;
}

- (id)blankIcon
{
  if (blankIcon_onceToken != -1) {
    dispatch_once(&blankIcon_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)blankIcon__blankIcon;
  return v2;
}

void __42__FASharedServicesSpecifierCell_blankIcon__block_invoke()
{
  v3.width = 40.0;
  v3.height = 40.0;
  UIGraphicsBeginImageContextWithOptions(v3, 0, 0.0);
  uint64_t v0 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v1 = (void *)blankIcon__blankIcon;
  blankIcon__blankIcon = v0;
}

- (id)getLazyIcon
{
  v9.receiver = self;
  v9.super_class = (Class)FASharedServicesSpecifierCell;
  v2 = [(PSTableCell *)&v9 getLazyIcon];
  CGSize v3 = [_FASharedServiceImage alloc];
  id v4 = v2;
  uint64_t v5 = [v4 CGImage];
  [v4 scale];
  v7 = -[_FASharedServiceImage initWithCGImage:scale:orientation:](v3, "initWithCGImage:scale:orientation:", v5, [v4 imageOrientation], v6);

  return v7;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FASharedServicesSpecifierCell;
  id v4 = a3;
  [(PSTableCell *)&v8 refreshCellContentsWithSpecifier:v4];
  uint64_t v5 = [(FASharedServicesSpecifierCell *)self imageView];
  [v5 setContentMode:1];

  double v6 = [(FASharedServicesSpecifierCell *)self detailTextLabel];
  v7 = [v4 propertyForKey:*MEMORY[0x263F602C8]];

  [v6 setText:v7];
  [(FASharedServicesSpecifierCell *)self setNeedsLayout];
}

- (void).cxx_destruct
{
}

@end