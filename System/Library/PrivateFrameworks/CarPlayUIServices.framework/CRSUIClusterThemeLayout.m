@interface CRSUIClusterThemeLayout
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isCustomizable;
- (CRSUIClusterThemeLayout)initWithBSXPCCoder:(id)a3;
- (CRSUIClusterThemeLayout)initWithIdentifier:(id)a3 displayName:(id)a4 palettes:(id)a5 wallpapers:(id)a6 preview:(id)a7;
- (CRSUIClusterThemeLayoutPreview)preview;
- (CRSUIClusterThemePalette)defaultPalette;
- (CRSUIClusterThemeWallpaper)defaultWallpaper;
- (NSArray)palettes;
- (NSArray)wallpapers;
- (NSString)displayName;
- (NSString)identifier;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation CRSUIClusterThemeLayout

- (CRSUIClusterThemeLayout)initWithIdentifier:(id)a3 displayName:(id)a4 palettes:(id)a5 wallpapers:(id)a6 preview:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CRSUIClusterThemeLayout;
  v17 = [(CRSUIClusterThemeLayout *)&v23 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    displayName = v17->_displayName;
    v17->_displayName = (NSString *)v20;

    objc_storeStrong((id *)&v17->_palettes, a5);
    objc_storeStrong((id *)&v17->_wallpapers, a6);
    objc_storeStrong((id *)&v17->_preview, a7);
  }

  return v17;
}

- (BOOL)isCustomizable
{
  v3 = [(CRSUIClusterThemeLayout *)self palettes];
  if ((unint64_t)[v3 count] > 1)
  {
    BOOL v5 = 1;
  }
  else
  {
    v4 = [(CRSUIClusterThemeLayout *)self wallpapers];
    BOOL v5 = (unint64_t)[v4 count] > 1;
  }
  return v5;
}

- (CRSUIClusterThemePalette)defaultPalette
{
  return (CRSUIClusterThemePalette *)[(NSArray *)self->_palettes bs_firstObjectPassingTest:&__block_literal_global_11];
}

uint64_t __41__CRSUIClusterThemeLayout_defaultPalette__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isDefault];
}

- (CRSUIClusterThemeWallpaper)defaultWallpaper
{
  return (CRSUIClusterThemeWallpaper *)[(NSArray *)self->_wallpapers bs_firstObjectPassingTest:&__block_literal_global_28];
}

uint64_t __43__CRSUIClusterThemeLayout_defaultWallpaper__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isDefault];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (CRSUIClusterThemeLayout)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeStringForKey:@"identifier"];
  v6 = [v4 decodeStringForKey:@"displayName"];
  uint64_t v7 = objc_opt_class();
  v8 = [v4 decodeCollectionOfClass:v7 containingClass:objc_opt_class() forKey:@"palettes"];
  uint64_t v9 = objc_opt_class();
  v10 = [v4 decodeCollectionOfClass:v9 containingClass:objc_opt_class() forKey:@"wallpapers"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preview"];

  id v12 = [(CRSUIClusterThemeLayout *)self initWithIdentifier:v5 displayName:v6 palettes:v8 wallpapers:v10 preview:v11];
  return v12;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v10 = a3;
  id v4 = [(CRSUIClusterThemeLayout *)self identifier];
  [v10 encodeObject:v4 forKey:@"identifier"];

  BOOL v5 = [(CRSUIClusterThemeLayout *)self displayName];
  [v10 encodeObject:v5 forKey:@"displayName"];

  v6 = [(CRSUIClusterThemeLayout *)self palettes];
  [v10 encodeCollection:v6 forKey:@"palettes"];

  uint64_t v7 = [(CRSUIClusterThemeLayout *)self wallpapers];
  [v10 encodeCollection:v7 forKey:@"wallpapers"];

  v8 = [(CRSUIClusterThemeLayout *)self preview];

  if (v8)
  {
    uint64_t v9 = [(CRSUIClusterThemeLayout *)self preview];
    [v10 encodeObject:v9 forKey:@"preview"];
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)palettes
{
  return self->_palettes;
}

- (NSArray)wallpapers
{
  return self->_wallpapers;
}

- (CRSUIClusterThemeLayoutPreview)preview
{
  return self->_preview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_wallpapers, 0);
  objc_storeStrong((id *)&self->_palettes, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end