@interface CRSUIClusterThemeCAPackageWallpaper
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)supportsDynamicAppearance;
- (CRSUIClusterThemeCAPackageAsset)asset;
- (CRSUIClusterThemeCAPackageWallpaper)initWithAsset:(id)a3 type:(id)a4 lightModeState:(id)a5 darkModeState:(id)a6;
- (CRSUIClusterThemeCAPackageWallpaper)initWithAsset:(id)a3 type:(id)a4 lightModeState:(id)a5 darkModeState:(id)a6 supportsDynamicAppearance:(BOOL)a7;
- (CRSUIClusterThemeCAPackageWallpaper)initWithAsset:(id)a3 type:(id)a4 state:(id)a5;
- (CRSUIClusterThemeCAPackageWallpaper)initWithBSXPCCoder:(id)a3;
- (NSString)type;
- (id)stateForInterfaceStyle:(int64_t)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation CRSUIClusterThemeCAPackageWallpaper

- (CRSUIClusterThemeCAPackageWallpaper)initWithAsset:(id)a3 type:(id)a4 state:(id)a5
{
  return [(CRSUIClusterThemeCAPackageWallpaper *)self initWithAsset:a3 type:a4 lightModeState:a5 darkModeState:0 supportsDynamicAppearance:0];
}

- (CRSUIClusterThemeCAPackageWallpaper)initWithAsset:(id)a3 type:(id)a4 lightModeState:(id)a5 darkModeState:(id)a6
{
  return [(CRSUIClusterThemeCAPackageWallpaper *)self initWithAsset:a3 type:a4 lightModeState:a5 darkModeState:a6 supportsDynamicAppearance:1];
}

- (CRSUIClusterThemeCAPackageWallpaper)initWithAsset:(id)a3 type:(id)a4 lightModeState:(id)a5 darkModeState:(id)a6 supportsDynamicAppearance:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CRSUIClusterThemeCAPackageWallpaper;
  v17 = [(CRSUIClusterThemeCAPackageWallpaper *)&v26 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_asset, a3);
    uint64_t v19 = [v14 copy];
    type = v18->_type;
    v18->_type = (NSString *)v19;

    uint64_t v21 = [v15 copy];
    lightModeState = v18->_lightModeState;
    v18->_lightModeState = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    darkModeState = v18->_darkModeState;
    v18->_darkModeState = (NSString *)v23;

    v18->_supportsDynamicAppearance = a7;
  }

  return v18;
}

- (id)stateForInterfaceStyle:(int64_t)a3
{
  if (a3 == 2 && [(CRSUIClusterThemeCAPackageWallpaper *)self supportsDynamicAppearance]) {
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
  id v6 = a3;
  uint64_t v4 = [(CRSUIClusterThemeCAPackageWallpaper *)self asset];
  [v6 encodeObject:v4 forKey:@"asset"];

  v5 = [(CRSUIClusterThemeCAPackageWallpaper *)self type];
  [v6 encodeObject:v5 forKey:@"type"];

  [v6 encodeObject:self->_lightModeState forKey:@"lightModeState"];
  [v6 encodeObject:self->_darkModeState forKey:@"darkModeState"];
  objc_msgSend(v6, "encodeBool:forKey:", -[CRSUIClusterThemeCAPackageWallpaper supportsDynamicAppearance](self, "supportsDynamicAppearance"), @"supportsDynamicAppearance");
}

- (CRSUIClusterThemeCAPackageWallpaper)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"asset"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lightModeState"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"darkModeState"];
  uint64_t v9 = [v4 decodeBoolForKey:@"supportsDynamicAppearance"];

  v10 = 0;
  if (v5 && v6)
  {
    self = [(CRSUIClusterThemeCAPackageWallpaper *)self initWithAsset:v5 type:v6 lightModeState:v7 darkModeState:v8 supportsDynamicAppearance:v9];
    v10 = self;
  }

  return v10;
}

- (CRSUIClusterThemeCAPackageAsset)asset
{
  return self->_asset;
}

- (BOOL)supportsDynamicAppearance
{
  return self->_supportsDynamicAppearance;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_darkModeState, 0);
  objc_storeStrong((id *)&self->_lightModeState, 0);
}

@end