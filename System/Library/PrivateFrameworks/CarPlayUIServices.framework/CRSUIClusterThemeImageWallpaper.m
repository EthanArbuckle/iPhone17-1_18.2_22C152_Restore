@interface CRSUIClusterThemeImageWallpaper
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)supportsDynamicAppearance;
- (CRSUIClusterThemeImageWallpaper)initWithAsset:(id)a3;
- (CRSUIClusterThemeImageWallpaper)initWithBSXPCCoder:(id)a3;
- (CRSUIClusterThemeImageWallpaper)initWithLightModeAsset:(id)a3 darkModeAsset:(id)a4;
- (CRSUIClusterThemeImageWallpaper)initWithLightModeAsset:(id)a3 darkModeAsset:(id)a4 supportsDynamicAppearance:(BOOL)a5;
- (id)assetForInterfaceStyle:(int64_t)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation CRSUIClusterThemeImageWallpaper

- (CRSUIClusterThemeImageWallpaper)initWithAsset:(id)a3
{
  return [(CRSUIClusterThemeImageWallpaper *)self initWithLightModeAsset:a3 darkModeAsset:0 supportsDynamicAppearance:0];
}

- (CRSUIClusterThemeImageWallpaper)initWithLightModeAsset:(id)a3 darkModeAsset:(id)a4
{
  return [(CRSUIClusterThemeImageWallpaper *)self initWithLightModeAsset:a3 darkModeAsset:a4 supportsDynamicAppearance:1];
}

- (CRSUIClusterThemeImageWallpaper)initWithLightModeAsset:(id)a3 darkModeAsset:(id)a4 supportsDynamicAppearance:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRSUIClusterThemeImageWallpaper;
  v11 = [(CRSUIClusterThemeImageWallpaper *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_lightModeAsset, a3);
    objc_storeStrong((id *)&v12->_darkModeAsset, a4);
    v12->_supportsDynamicAppearance = a5;
  }

  return v12;
}

- (id)assetForInterfaceStyle:(int64_t)a3
{
  if (a3 == 2 && [(CRSUIClusterThemeImageWallpaper *)self supportsDynamicAppearance]) {
    uint64_t v4 = 16;
  }
  else {
    uint64_t v4 = 8;
  }
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  lightModeAsset = self->_lightModeAsset;
  id v5 = a3;
  [v5 encodeObject:lightModeAsset forKey:@"lightModeAsset"];
  [v5 encodeObject:self->_darkModeAsset forKey:@"darkModeAsset"];
  objc_msgSend(v5, "encodeBool:forKey:", -[CRSUIClusterThemeImageWallpaper supportsDynamicAppearance](self, "supportsDynamicAppearance"), @"supportsDynamicAppearance");
}

- (CRSUIClusterThemeImageWallpaper)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lightModeAsset"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"darkModeAsset"];
  uint64_t v7 = [v4 decodeBoolForKey:@"supportsDynamicAppearance"];

  if (v5)
  {
    self = [(CRSUIClusterThemeImageWallpaper *)self initWithLightModeAsset:v5 darkModeAsset:v6 supportsDynamicAppearance:v7];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)supportsDynamicAppearance
{
  return self->_supportsDynamicAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkModeAsset, 0);
  objc_storeStrong((id *)&self->_lightModeAsset, 0);
}

@end