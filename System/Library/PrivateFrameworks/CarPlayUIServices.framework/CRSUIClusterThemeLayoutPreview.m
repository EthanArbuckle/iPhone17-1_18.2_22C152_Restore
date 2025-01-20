@interface CRSUIClusterThemeLayoutPreview
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)supportsDynamicAppearance;
- (CRSUIClusterThemeCAPackageAsset)asset;
- (CRSUIClusterThemeLayoutPreview)initWithAsset:(id)a3 lightModeStateForPaletteID:(id)a4 darkModeStateForPaletteID:(id)a5;
- (CRSUIClusterThemeLayoutPreview)initWithAsset:(id)a3 lightModeStateForPaletteID:(id)a4 darkModeStateForPaletteID:(id)a5 supportsDynamicAppearance:(BOOL)a6;
- (CRSUIClusterThemeLayoutPreview)initWithAsset:(id)a3 stateForPaletteID:(id)a4;
- (CRSUIClusterThemeLayoutPreview)initWithBSXPCCoder:(id)a3;
- (id)stateForPaletteIDWithInterfaceStyle:(int64_t)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation CRSUIClusterThemeLayoutPreview

- (CRSUIClusterThemeLayoutPreview)initWithAsset:(id)a3 stateForPaletteID:(id)a4
{
  return [(CRSUIClusterThemeLayoutPreview *)self initWithAsset:a3 lightModeStateForPaletteID:a4 darkModeStateForPaletteID:0 supportsDynamicAppearance:0];
}

- (CRSUIClusterThemeLayoutPreview)initWithAsset:(id)a3 lightModeStateForPaletteID:(id)a4 darkModeStateForPaletteID:(id)a5
{
  return [(CRSUIClusterThemeLayoutPreview *)self initWithAsset:a3 lightModeStateForPaletteID:a4 darkModeStateForPaletteID:a5 supportsDynamicAppearance:1];
}

- (CRSUIClusterThemeLayoutPreview)initWithAsset:(id)a3 lightModeStateForPaletteID:(id)a4 darkModeStateForPaletteID:(id)a5 supportsDynamicAppearance:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRSUIClusterThemeLayoutPreview;
  v14 = [(CRSUIClusterThemeLayoutPreview *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_asset, a3);
    objc_storeStrong((id *)&v15->_lightModeStateForPaletteID, a4);
    objc_storeStrong((id *)&v15->_darkModeStateForPaletteID, a5);
    v15->_supportsDynamicAppearance = a6;
  }

  return v15;
}

- (id)stateForPaletteIDWithInterfaceStyle:(int64_t)a3
{
  if (a3 == 2 && [(CRSUIClusterThemeLayoutPreview *)self supportsDynamicAppearance]) {
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

- (CRSUIClusterThemeLayoutPreview)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"asset"];
  uint64_t v6 = [v4 decodeBoolForKey:@"supportsDynamicAppearance"];
  if ([v4 containsValueForKey:@"lightModeStateForPaletteID"])
  {
    id v7 = [v4 decodeDictionaryOfClass:objc_opt_class() forKey:@"lightModeStateForPaletteID"];
  }
  else
  {
    id v7 = objc_alloc_init(NSDictionary);
  }
  v8 = v7;
  if ([v4 containsValueForKey:@"darkModeStateForPaletteID"])
  {
    id v9 = [v4 decodeDictionaryOfClass:objc_opt_class() forKey:@"darkModeStateForPaletteID"];
LABEL_8:
    v10 = v9;
    goto LABEL_10;
  }
  if (v6)
  {
    id v9 = objc_alloc_init(NSDictionary);
    goto LABEL_8;
  }
  v10 = 0;
LABEL_10:
  id v11 = 0;
  if (v10) {
    char v12 = 0;
  }
  else {
    char v12 = v6;
  }
  if (v5 && v8 && (v12 & 1) == 0)
  {
    self = [(CRSUIClusterThemeLayoutPreview *)self initWithAsset:v5 lightModeStateForPaletteID:v8 darkModeStateForPaletteID:v10 supportsDynamicAppearance:v6];
    id v11 = self;
  }

  return v11;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(CRSUIClusterThemeLayoutPreview *)self asset];
  [v5 encodeObject:v4 forKey:@"asset"];

  [v5 encodeDictionary:self->_lightModeStateForPaletteID forKey:@"lightModeStateForPaletteID"];
  [v5 encodeDictionary:self->_darkModeStateForPaletteID forKey:@"darkModeStateForPaletteID"];
  objc_msgSend(v5, "encodeBool:forKey:", -[CRSUIClusterThemeLayoutPreview supportsDynamicAppearance](self, "supportsDynamicAppearance"), @"supportsDynamicAppearance");
}

- (CRSUIClusterThemeCAPackageAsset)asset
{
  return self->_asset;
}

- (BOOL)supportsDynamicAppearance
{
  return self->_supportsDynamicAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_darkModeStateForPaletteID, 0);
  objc_storeStrong((id *)&self->_lightModeStateForPaletteID, 0);
}

@end