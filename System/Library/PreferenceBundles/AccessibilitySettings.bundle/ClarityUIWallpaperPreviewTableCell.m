@interface ClarityUIWallpaperPreviewTableCell
+ (id)previewSpecifier;
- (ClarityUIWallpaperPreviewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)wallpaperImage;
- (void)updateInformation;
@end

@implementation ClarityUIWallpaperPreviewTableCell

+ (id)previewSpecifier
{
  v2 = +[PSSpecifier preferenceSpecifierNamed:0 target:a1 set:0 get:0 detail:a1 cell:-1 edit:0];
  uint64_t v5 = PSCellClassKey;
  uint64_t v6 = objc_opt_class();
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  [v2 setProperties:v3];

  return v2;
}

- (id)wallpaperImage
{
  id v3 = objc_alloc((Class)UIImage);
  v4 = [(ClarityUIWallpaperPreviewTableCell *)self specifier];
  uint64_t v5 = [v4 propertyForKey:@"wallpaperData"];
  id v6 = [v3 initWithData:v5];

  return v6;
}

- (ClarityUIWallpaperPreviewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v23.receiver = self;
  v23.super_class = (Class)ClarityUIWallpaperPreviewTableCell;
  v9 = [(ClarityUIWallpaperPreviewTableCell *)&v23 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier], v8);
    v11 = [(ClarityUIWallpaperPreviewTableCell *)v10 wallpaperImage];
    id v12 = [objc_alloc((Class)UIImageView) initWithImage:v11];
    [v12 setContentMode:2];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [v12 layer];
    [v13 setCornerRadius:20.0];

    [v12 setClipsToBounds:1];
    v14 = [[ClarityLockScreenPreviewView alloc] initWithImage:v11];
    [(ClarityLockScreenPreviewView *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [(ClarityUIWallpaperPreviewTableCell *)v10 contentView];
    [v15 addSubview:v14];

    v16 = objc_opt_new();
    v17 = _NSDictionaryOfVariableBindings(@"previewView", v14, 0);
    v18 = +[NSLayoutConstraint constraintsWithVisualFormat:@"|[previewView]|" options:0 metrics:0 views:v17];
    [v16 addObjectsFromArray:v18];

    v19 = _NSDictionaryOfVariableBindings(@"previewView", v14, 0);
    v20 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-10-[previewView]-10-|", 0, 0, v19);
    [v16 addObjectsFromArray:v20];

    +[NSLayoutConstraint activateConstraints:v16];
    v21 = v10;
  }
  return v10;
}

- (void)updateInformation
{
  id v4 = [(ClarityUIWallpaperPreviewTableCell *)self wallpaperImage];
  id v3 = [(ClarityUIWallpaperPreviewTableCell *)self imageView];
  [v3 setImage:v4];
}

@end