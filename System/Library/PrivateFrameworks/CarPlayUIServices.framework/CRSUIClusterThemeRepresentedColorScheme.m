@interface CRSUIClusterThemeRepresentedColorScheme
+ (BOOL)supportsBSXPCSecureCoding;
- (CRSUIClusterThemeLinearGradient)linearGradient;
- (CRSUIClusterThemeRepresentedColorScheme)initWithBSXPCCoder:(id)a3;
- (CRSUIClusterThemeRepresentedColorScheme)initWithColor:(id)a3;
- (CRSUIClusterThemeRepresentedColorScheme)initWithColorScheme:(unint64_t)a3 color:(id)a4 linearGradient:(id)a5;
- (CRSUIClusterThemeRepresentedColorScheme)initWithLinearGradient:(id)a3;
- (UIColor)color;
- (id)initAsMulticolor;
- (unint64_t)colorScheme;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation CRSUIClusterThemeRepresentedColorScheme

- (CRSUIClusterThemeRepresentedColorScheme)initWithColor:(id)a3
{
  return [(CRSUIClusterThemeRepresentedColorScheme *)self initWithColorScheme:1 color:a3 linearGradient:0];
}

- (CRSUIClusterThemeRepresentedColorScheme)initWithLinearGradient:(id)a3
{
  return [(CRSUIClusterThemeRepresentedColorScheme *)self initWithColorScheme:2 color:0 linearGradient:a3];
}

- (id)initAsMulticolor
{
  return [(CRSUIClusterThemeRepresentedColorScheme *)self initWithColorScheme:3 color:0 linearGradient:0];
}

- (CRSUIClusterThemeRepresentedColorScheme)initWithColorScheme:(unint64_t)a3 color:(id)a4 linearGradient:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CRSUIClusterThemeRepresentedColorScheme;
  v11 = [(CRSUIClusterThemeRepresentedColorScheme *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_colorScheme = a3;
    objc_storeStrong((id *)&v11->_themeColor, a4);
    objc_storeStrong((id *)&v12->_linearGradient, a5);
  }

  return v12;
}

- (UIColor)color
{
  return [(CRSUIClusterThemeColor *)self->_themeColor color];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (CRSUIClusterThemeRepresentedColorScheme)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeUInt64ForKey:@"colorScheme"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linearGradient"];

  if ((unint64_t)(v5 - 4) >= 0xFFFFFFFFFFFFFFFDLL && (v5 != 1 || v6) && (v5 != 2 || v7))
  {
    self = [(CRSUIClusterThemeRepresentedColorScheme *)self initWithColorScheme:v5 color:v6 linearGradient:v7];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  unint64_t colorScheme = self->_colorScheme;
  id v5 = a3;
  [v5 encodeUInt64:colorScheme forKey:@"colorScheme"];
  [v5 encodeObject:self->_themeColor forKey:@"color"];
  [v5 encodeObject:self->_linearGradient forKey:@"linearGradient"];
}

- (unint64_t)colorScheme
{
  return self->_colorScheme;
}

- (CRSUIClusterThemeLinearGradient)linearGradient
{
  return self->_linearGradient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linearGradient, 0);
  objc_storeStrong((id *)&self->_themeColor, 0);
}

@end