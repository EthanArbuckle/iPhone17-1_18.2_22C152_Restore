@interface CRSUIClusterThemeColor
+ (BOOL)supportsBSXPCSecureCoding;
- (CRSUIClusterThemeColor)initWithBSXPCCoder:(id)a3;
- (CRSUIClusterThemeColor)initWithColor:(id)a3;
- (UIColor)color;
- (id)_initWithLightModeColor:(id)a3 darkModeColor:(id)a4;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation CRSUIClusterThemeColor

- (CRSUIClusterThemeColor)initWithColor:(id)a3
{
  return (CRSUIClusterThemeColor *)[(CRSUIClusterThemeColor *)self _initWithLightModeColor:a3 darkModeColor:0];
}

- (id)_initWithLightModeColor:(id)a3 darkModeColor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRSUIClusterThemeColor;
  v9 = [(CRSUIClusterThemeColor *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lightModeColor, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (UIColor)color
{
  darkModeColor = self->_darkModeColor;
  v4 = self->_lightModeColor;
  if (darkModeColor)
  {
    v5 = self->_darkModeColor;
    v6 = (void *)MEMORY[0x263F1C550];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __31__CRSUIClusterThemeColor_color__block_invoke;
    v10[3] = &unk_264307BA8;
    v11 = v5;
    objc_super v12 = v4;
    id v7 = v4;
    id v8 = v5;
    v4 = [v6 colorWithDynamicProvider:v10];
  }
  return v4;
}

id __31__CRSUIClusterThemeColor_color__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 userInterfaceStyle];
  uint64_t v4 = 40;
  if (v3 == 2) {
    uint64_t v4 = 32;
  }
  v5 = *(void **)(a1 + v4);
  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  lightModeColor = self->_lightModeColor;
  id v5 = a3;
  [v5 encodeObject:lightModeColor forKey:@"lightModeColor"];
  [v5 encodeObject:self->_darkModeColor forKey:@"darkModeColor"];
}

- (CRSUIClusterThemeColor)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lightModeColor"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"darkModeColor"];

  if (v5)
  {
    self = [(CRSUIClusterThemeColor *)self initWithLightModeColor:v5 darkModeColor:v6];
    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkModeColor, 0);
  objc_storeStrong((id *)&self->_lightModeColor, 0);
}

@end