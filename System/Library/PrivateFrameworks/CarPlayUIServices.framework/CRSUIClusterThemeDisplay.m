@interface CRSUIClusterThemeDisplay
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)requiresDarkAppearance;
- (CGSize)size;
- (CRSUIClusterThemeDisplay)initWithBSXPCCoder:(id)a3;
- (CRSUIClusterThemeDisplay)initWithIdentifier:(id)a3 displayType:(unint64_t)a4 size:(CGSize)a5 requiresDarkAppearance:(BOOL)a6 layouts:(id)a7;
- (NSArray)layouts;
- (NSString)identifier;
- (unint64_t)displayType;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation CRSUIClusterThemeDisplay

- (CRSUIClusterThemeDisplay)initWithIdentifier:(id)a3 displayType:(unint64_t)a4 size:(CGSize)a5 requiresDarkAppearance:(BOOL)a6 layouts:(id)a7
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v14 = a3;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)CRSUIClusterThemeDisplay;
  v16 = [(CRSUIClusterThemeDisplay *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    v17->_displayType = a4;
    v17->_size.CGFloat width = width;
    v17->_size.CGFloat height = height;
    v17->_requiresDarkAppearance = a6;
    objc_storeStrong((id *)&v17->_layouts, a7);
  }

  return v17;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CRSUIClusterThemeDisplay *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  objc_msgSend(v4, "encodeUInt64:forKey:", -[CRSUIClusterThemeDisplay displayType](self, "displayType"), @"displayType");
  [(CRSUIClusterThemeDisplay *)self size];
  objc_msgSend(v4, "encodeCGSize:forKey:", @"size");
  objc_msgSend(v4, "encodeBool:forKey:", -[CRSUIClusterThemeDisplay requiresDarkAppearance](self, "requiresDarkAppearance"), @"requiresDarkAppearance");
  id v6 = [(CRSUIClusterThemeDisplay *)self layouts];
  [v4 encodeCollection:v6 forKey:@"layouts"];
}

- (CRSUIClusterThemeDisplay)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v6 = [v4 decodeUInt64ForKey:@"displayType"];
  [v4 decodeCGSizeForKey:@"size"];
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [v4 decodeBoolForKey:@"requiresDarkAppearance"];
  uint64_t v12 = objc_opt_class();
  v13 = [v4 decodeCollectionOfClass:v12 containingClass:objc_opt_class() forKey:@"layouts"];

  if (v5) {
    BOOL v14 = v6 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14 || v13 == 0)
  {
    v16 = 0;
  }
  else
  {
    self = -[CRSUIClusterThemeDisplay initWithIdentifier:displayType:size:requiresDarkAppearance:layouts:](self, "initWithIdentifier:displayType:size:requiresDarkAppearance:layouts:", v5, v6, v11, v13, v8, v10);
    v16 = self;
  }

  return v16;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)requiresDarkAppearance
{
  return self->_requiresDarkAppearance;
}

- (NSArray)layouts
{
  return self->_layouts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end