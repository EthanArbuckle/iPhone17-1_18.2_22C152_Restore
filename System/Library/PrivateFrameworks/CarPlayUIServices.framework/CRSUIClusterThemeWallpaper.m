@interface CRSUIClusterThemeWallpaper
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isDefault;
- (CRAssetWallpaperData)data;
- (CRSUIClusterThemeCAPackageWallpaper)package;
- (CRSUIClusterThemeImageWallpaper)image;
- (CRSUIClusterThemeWallpaper)initWithBSXPCCoder:(id)a3;
- (CRSUIClusterThemeWallpaper)initWithIdentifier:(id)a3 displayName:(id)a4 color:(id)a5 associatedPaletteID:(id)a6 isDefault:(BOOL)a7 cacheID:(id)a8 data:(id)a9 traits:(id)a10;
- (CRSUIClusterThemeWallpaper)initWithIdentifier:(id)a3 displayName:(id)a4 image:(id)a5 associatedPaletteID:(id)a6 isDefault:(BOOL)a7 cacheID:(id)a8 data:(id)a9 traits:(id)a10;
- (CRSUIClusterThemeWallpaper)initWithIdentifier:(id)a3 displayName:(id)a4 image:(id)a5 package:(id)a6 color:(id)a7 associatedPaletteID:(id)a8 isDefault:(BOOL)a9 cacheID:(id)a10 data:(id)a11 traits:(id)a12;
- (CRSUIClusterThemeWallpaper)initWithIdentifier:(id)a3 displayName:(id)a4 package:(id)a5 associatedPaletteID:(id)a6 isDefault:(BOOL)a7 cacheID:(id)a8 data:(id)a9 traits:(id)a10;
- (CRSUIWallpaperTraits)traits;
- (NSString)associatedPaletteID;
- (NSString)cacheID;
- (NSString)displayName;
- (NSString)identifier;
- (UIColor)color;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation CRSUIClusterThemeWallpaper

- (CRSUIClusterThemeWallpaper)initWithIdentifier:(id)a3 displayName:(id)a4 image:(id)a5 associatedPaletteID:(id)a6 isDefault:(BOOL)a7 cacheID:(id)a8 data:(id)a9 traits:(id)a10
{
  LOBYTE(v11) = a7;
  return [(CRSUIClusterThemeWallpaper *)self initWithIdentifier:a3 displayName:a4 image:a5 package:0 color:0 associatedPaletteID:a6 isDefault:v11 cacheID:a8 data:a9 traits:a10];
}

- (CRSUIClusterThemeWallpaper)initWithIdentifier:(id)a3 displayName:(id)a4 package:(id)a5 associatedPaletteID:(id)a6 isDefault:(BOOL)a7 cacheID:(id)a8 data:(id)a9 traits:(id)a10
{
  LOBYTE(v11) = a7;
  return [(CRSUIClusterThemeWallpaper *)self initWithIdentifier:a3 displayName:a4 image:0 package:a5 color:0 associatedPaletteID:a6 isDefault:v11 cacheID:a8 data:a9 traits:a10];
}

- (CRSUIClusterThemeWallpaper)initWithIdentifier:(id)a3 displayName:(id)a4 color:(id)a5 associatedPaletteID:(id)a6 isDefault:(BOOL)a7 cacheID:(id)a8 data:(id)a9 traits:(id)a10
{
  LOBYTE(v11) = a7;
  return [(CRSUIClusterThemeWallpaper *)self initWithIdentifier:a3 displayName:a4 image:0 package:0 color:a5 associatedPaletteID:a6 isDefault:v11 cacheID:a8 data:a9 traits:a10];
}

- (CRSUIClusterThemeWallpaper)initWithIdentifier:(id)a3 displayName:(id)a4 image:(id)a5 package:(id)a6 color:(id)a7 associatedPaletteID:(id)a8 isDefault:(BOOL)a9 cacheID:(id)a10 data:(id)a11 traits:(id)a12
{
  id v36 = a3;
  id v35 = a4;
  id v34 = a5;
  id v33 = a6;
  id v32 = a7;
  id v18 = a8;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  v37.receiver = self;
  v37.super_class = (Class)CRSUIClusterThemeWallpaper;
  v22 = [(CRSUIClusterThemeWallpaper *)&v37 init];
  if (v22)
  {
    uint64_t v23 = [v36 copy];
    identifier = v22->_identifier;
    v22->_identifier = (NSString *)v23;

    uint64_t v25 = [v35 copy];
    displayName = v22->_displayName;
    v22->_displayName = (NSString *)v25;

    objc_storeStrong((id *)&v22->_image, a5);
    objc_storeStrong((id *)&v22->_package, a6);
    objc_storeStrong((id *)&v22->_color, a7);
    uint64_t v27 = [v18 copy];
    associatedPaletteID = v22->_associatedPaletteID;
    v22->_associatedPaletteID = (NSString *)v27;

    v22->_isDefault = a9;
    uint64_t v29 = [v19 copy];
    cacheID = v22->_cacheID;
    v22->_cacheID = (NSString *)v29;

    objc_storeStrong((id *)&v22->_data, a11);
    objc_storeStrong((id *)&v22->_traits, a12);
  }

  return v22;
}

- (UIColor)color
{
  return [(CRSUIClusterThemeColor *)self->_color color];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CRSUIClusterThemeWallpaper *)self identifier];
  [v4 encodeObject:v5 forKey:@"wallpapers"];

  v6 = [(CRSUIClusterThemeWallpaper *)self displayName];
  [v4 encodeObject:v6 forKey:@"displayName"];

  v7 = [(CRSUIClusterThemeWallpaper *)self image];
  [v4 encodeObject:v7 forKey:@"image"];

  v8 = [(CRSUIClusterThemeWallpaper *)self package];
  [v4 encodeObject:v8 forKey:@"package"];

  [v4 encodeObject:self->_color forKey:@"color"];
  v9 = [(CRSUIClusterThemeWallpaper *)self associatedPaletteID];
  [v4 encodeObject:v9 forKey:@"associatedPaletteID"];

  objc_msgSend(v4, "encodeBool:forKey:", -[CRSUIClusterThemeWallpaper isDefault](self, "isDefault"), @"default");
  v10 = [(CRSUIClusterThemeWallpaper *)self cacheID];
  [v4 encodeObject:v10 forKey:@"cacheID"];

  uint64_t v11 = [(CRSUIClusterThemeWallpaper *)self data];
  [v4 encodeObject:v11 forKey:@"data"];

  id v12 = [(CRSUIClusterThemeWallpaper *)self traits];
  [v4 encodeObject:v12 forKey:@"traits"];
}

- (CRSUIClusterThemeWallpaper)initWithBSXPCCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"wallpapers"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  uint64_t v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
  uint64_t v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"package"];
  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"associatedPaletteID"];
  char v9 = [v3 decodeBoolForKey:@"default"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"cacheID"];
  id v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"traits"];

  v13 = 0;
  if (v4 && v5 && (v13 = 0, v18 | v6 | v7) && v10 && v12)
  {
    LOBYTE(v16) = v9;
    v14 = [(CRSUIClusterThemeWallpaper *)self initWithIdentifier:v4 displayName:v5 image:v18 package:v6 color:v7 associatedPaletteID:v8 isDefault:v16 cacheID:v11 data:v10 traits:v12];
    v13 = v14;
  }
  else
  {
    v14 = self;
  }

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (CRSUIClusterThemeImageWallpaper)image
{
  return self->_image;
}

- (CRSUIClusterThemeCAPackageWallpaper)package
{
  return self->_package;
}

- (NSString)associatedPaletteID
{
  return self->_associatedPaletteID;
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (NSString)cacheID
{
  return self->_cacheID;
}

- (CRAssetWallpaperData)data
{
  return self->_data;
}

- (CRSUIWallpaperTraits)traits
{
  return self->_traits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_cacheID, 0);
  objc_storeStrong((id *)&self->_associatedPaletteID, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end