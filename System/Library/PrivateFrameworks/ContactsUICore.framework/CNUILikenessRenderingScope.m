@interface CNUILikenessRenderingScope
+ (CNUILikenessRenderingScope)renderingScopeWithPointSize:(CGSize)a3 scale:(double)a4 rightToLeft:(BOOL)a5 style:(unint64_t)a6 color:(id)a7;
+ (CNUILikenessRenderingScope)renderingScopeWithPointSize:(CGSize)a3 scale:(double)a4 strokeWidth:(double)a5 strokeColor:(CGColor *)a6 rightToLeft:(BOOL)a7 style:(unint64_t)a8 backgroundStyle:(unint64_t)a9 color:(id)a10 maskedAvatarIndices:(id)a11;
+ (CNUILikenessRenderingScope)renderingScopeWithPointSize:(CGSize)a3 scale:(double)a4 strokeWidth:(double)a5 strokeColor:(CGColor *)a6 rightToLeft:(BOOL)a7 style:(unint64_t)a8 color:(id)a9;
- (BOOL)excludePointSizeInEqualityCheck;
- (BOOL)isEqual:(id)a3;
- (BOOL)rightToLeft;
- (CGColor)strokeColor;
- (CGSize)pointSize;
- (CNUILikenessRenderingScope)initWithPointSize:(CGSize)a3 scale:(double)a4 strokeWidth:(double)a5 strokeColor:(CGColor *)a6 rightToLeft:(BOOL)a7 style:(unint64_t)a8 backgroundStyle:(unint64_t)a9 color:(id)a10 maskedAvatarIndices:(id)a11;
- (NSIndexSet)maskedAvatarIndices;
- (PRMonogramColor)color;
- (double)scale;
- (double)strokeWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)backgroundStyle;
- (unint64_t)hash;
- (unint64_t)style;
- (void)dealloc;
- (void)setExcludePointSizeInEqualityCheck:(BOOL)a3;
- (void)setStrokeColor:(CGColor *)a3;
@end

@implementation CNUILikenessRenderingScope

- (BOOL)rightToLeft
{
  return self->_rightToLeft;
}

- (NSIndexSet)maskedAvatarIndices
{
  return self->_maskedAvatarIndices;
}

- (double)scale
{
  return self->_scale;
}

- (unint64_t)style
{
  return self->_style;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CNUILikenessRenderingScope alloc];
  [(CNUILikenessRenderingScope *)self pointSize];
  double v6 = v5;
  double v8 = v7;
  [(CNUILikenessRenderingScope *)self scale];
  double v10 = v9;
  [(CNUILikenessRenderingScope *)self strokeWidth];
  double v12 = v11;
  v13 = [(CNUILikenessRenderingScope *)self strokeColor];
  BOOL v14 = [(CNUILikenessRenderingScope *)self rightToLeft];
  unint64_t v15 = [(CNUILikenessRenderingScope *)self style];
  unint64_t v16 = [(CNUILikenessRenderingScope *)self backgroundStyle];
  v17 = [(CNUILikenessRenderingScope *)self color];
  v18 = [(CNUILikenessRenderingScope *)self maskedAvatarIndices];
  v19 = -[CNUILikenessRenderingScope initWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:](v4, "initWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:", v13, v14, v15, v16, v17, v18, v6, v8, v10, v12);

  [(CNUILikenessRenderingScope *)v19 setExcludePointSizeInEqualityCheck:[(CNUILikenessRenderingScope *)self excludePointSizeInEqualityCheck]];
  return v19;
}

- (BOOL)excludePointSizeInEqualityCheck
{
  return self->_excludePointSizeInEqualityCheck;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setExcludePointSizeInEqualityCheck:(BOOL)a3
{
  self->_excludePointSizeInEqualityCheck = a3;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (CGColor)strokeColor
{
  return self->_strokeColor;
}

- (PRMonogramColor)color
{
  return self->_color;
}

- (CGSize)pointSize
{
  double width = self->_pointSize.width;
  double height = self->_pointSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

+ (CNUILikenessRenderingScope)renderingScopeWithPointSize:(CGSize)a3 scale:(double)a4 strokeWidth:(double)a5 strokeColor:(CGColor *)a6 rightToLeft:(BOOL)a7 style:(unint64_t)a8 backgroundStyle:(unint64_t)a9 color:(id)a10 maskedAvatarIndices:(id)a11
{
  BOOL v14 = a7;
  double height = a3.height;
  double width = a3.width;
  id v21 = a11;
  id v22 = a10;
  v23 = objc_msgSend(objc_alloc((Class)a1), "initWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:", a6, v14, a8, a9, v22, v21, width, height, a4, a5);

  return (CNUILikenessRenderingScope *)v23;
}

- (unint64_t)hash
{
  if ([(CNUILikenessRenderingScope *)self excludePointSizeInEqualityCheck]) {
    uint64_t v3 = 527;
  }
  else {
    uint64_t v3 = 31 * objc_msgSend(MEMORY[0x263F335E8], "cgsizeHash:", self->_pointSize.width, self->_pointSize.height) + 16337;
  }
  uint64_t v4 = [MEMORY[0x263F335E8] cgfloatHash:self->_scale];
  uint64_t v5 = [MEMORY[0x263F335E8] cgfloatHash:self->_strokeWidth];
  strokeColor = self->_strokeColor;
  if (strokeColor) {
    strokeColor = (const void *)CFHash(strokeColor);
  }
  uint64_t v7 = v5 - (v4 + v3) + 32 * (v4 + v3);
  uint64_t v8 = self->_rightToLeft - ((void)strokeColor + 32 * v7 - v7) + 32 * ((void)strokeColor + 32 * v7 - v7);
  unint64_t v9 = self->_style - v8 + 32 * v8;
  unint64_t v10 = self->_backgroundStyle - v9 + 32 * v9;
  uint64_t v11 = [MEMORY[0x263F335E8] objectHash:self->_color] - v10 + 32 * v10;
  return [MEMORY[0x263F335E8] objectHash:self->_maskedAvatarIndices] - v11 + 32 * v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CNUILikenessRenderingScope *)a3;
  BOOL v8 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || ![(CNUILikenessRenderingScope *)self excludePointSizeInEqualityCheck]
      && (self->_pointSize.width == v4->_pointSize.width
        ? (BOOL v5 = self->_pointSize.height == v4->_pointSize.height)
        : (BOOL v5 = 0),
          !v5)
      || vabdd_f64(self->_scale, v4->_scale) >= 0.0001
      || vabdd_f64(self->_strokeWidth, v4->_strokeWidth) >= 0.0001
      || !CGColorEqualToColor(self->_strokeColor, v4->_strokeColor)
      || !self->_rightToLeft == v4->_rightToLeft
      || self->_style != v4->_style
      || self->_backgroundStyle != v4->_backgroundStyle
      || (color = self->_color, (unint64_t)color | (unint64_t)v4->_color)
      && !-[PRMonogramColor isEqual:](color, "isEqual:")
      || (maskedAvatarIndices = self->_maskedAvatarIndices,
          (unint64_t)maskedAvatarIndices | (unint64_t)v4->_maskedAvatarIndices)
      && !-[NSIndexSet isEqual:](maskedAvatarIndices, "isEqual:"))
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskedAvatarIndices, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

+ (CNUILikenessRenderingScope)renderingScopeWithPointSize:(CGSize)a3 scale:(double)a4 strokeWidth:(double)a5 strokeColor:(CGColor *)a6 rightToLeft:(BOOL)a7 style:(unint64_t)a8 color:(id)a9
{
  BOOL v10 = a7;
  double height = a3.height;
  double width = a3.width;
  id v17 = a9;
  id v18 = objc_alloc((Class)a1);
  v19 = [MEMORY[0x263F088D0] indexSet];
  v20 = objc_msgSend(v18, "initWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:", a6, v10, a8, 0, v17, v19, width, height, a4, a5);

  return (CNUILikenessRenderingScope *)v20;
}

- (void)dealloc
{
  strokeColor = self->_strokeColor;
  if (strokeColor) {
    CGColorRelease(strokeColor);
  }
  v4.receiver = self;
  v4.super_class = (Class)CNUILikenessRenderingScope;
  [(CNUILikenessRenderingScope *)&v4 dealloc];
}

- (CNUILikenessRenderingScope)initWithPointSize:(CGSize)a3 scale:(double)a4 strokeWidth:(double)a5 strokeColor:(CGColor *)a6 rightToLeft:(BOOL)a7 style:(unint64_t)a8 backgroundStyle:(unint64_t)a9 color:(id)a10 maskedAvatarIndices:(id)a11
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v21 = a10;
  id v22 = a11;
  v32.receiver = self;
  v32.super_class = (Class)CNUILikenessRenderingScope;
  v23 = [(CNUILikenessRenderingScope *)&v32 init];
  v24 = v23;
  if (v23)
  {
    v23->_pointSize.CGFloat width = width;
    v23->_pointSize.CGFloat height = height;
    v23->_scale = a4;
    v23->_strokeWidth = a5;
    CGColorRef Copy = CGColorCreateCopy(a6);
    v24->_rightToLeft = a7;
    v24->_strokeColor = Copy;
    v24->_style = a8;
    v24->_backgroundStyle = a9;
    uint64_t v26 = [v21 copy];
    color = v24->_color;
    v24->_color = (PRMonogramColor *)v26;

    uint64_t v28 = [v22 copy];
    maskedAvatarIndices = v24->_maskedAvatarIndices;
    v24->_maskedAvatarIndices = (NSIndexSet *)v28;

    v30 = v24;
  }

  return v24;
}

+ (CNUILikenessRenderingScope)renderingScopeWithPointSize:(CGSize)a3 scale:(double)a4 rightToLeft:(BOOL)a5 style:(unint64_t)a6 color:(id)a7
{
  BOOL v8 = a5;
  double height = a3.height;
  double width = a3.width;
  id v13 = a7;
  id v14 = objc_alloc((Class)a1);
  unint64_t v15 = [MEMORY[0x263F088D0] indexSet];
  unint64_t v16 = objc_msgSend(v14, "initWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:", 0, v8, a6, 0, v13, v15, width, height, a4, 0.0);

  return (CNUILikenessRenderingScope *)v16;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  [(CNUILikenessRenderingScope *)self pointSize];
  objc_super v4 = NSStringFromSize(v29);
  id v5 = (id)[v3 appendName:@"pointSize" object:v4];

  double v6 = NSString;
  [(CNUILikenessRenderingScope *)self scale];
  BOOL v8 = objc_msgSend(v6, "stringWithFormat:", @"%.1f", v7);
  id v9 = (id)[v3 appendName:@"scale" object:v8];

  BOOL v10 = NSString;
  [(CNUILikenessRenderingScope *)self strokeWidth];
  double v12 = objc_msgSend(v10, "stringWithFormat:", @"%.1f", v11);
  id v13 = (id)[v3 appendName:@"strokeWidth" object:v12];

  if ([(CNUILikenessRenderingScope *)self rightToLeft]) {
    id v14 = (id)[v3 appendName:@"text-direction" object:@"RTL"];
  }
  unint64_t v15 = [(CNUILikenessRenderingScope *)self color];

  if (v15)
  {
    unint64_t v16 = [(CNUILikenessRenderingScope *)self color];
    id v17 = [v16 colorName];
    id v18 = (id)[v3 appendName:@"color" object:v17];
  }
  id v19 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", @"style", -[CNUILikenessRenderingScope style](self, "style"));
  id v20 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", @"backgroundStyle", -[CNUILikenessRenderingScope backgroundStyle](self, "backgroundStyle"));
  id v21 = [(CNUILikenessRenderingScope *)self maskedAvatarIndices];
  id v22 = v21;
  if (v21)
  {
    v23 = objc_msgSend(v21, "_cn_map:", &__block_literal_global_6);
    v24 = [v23 componentsJoinedByString:@","];
  }
  else
  {
    v24 = &stru_26BFC7668;
  }
  id v25 = (id)[v3 appendName:@"maskedAvatarIndices" object:v24];

  uint64_t v26 = [v3 build];

  return v26;
}

- (void)setStrokeColor:(CGColor *)a3
{
  strokeColor = self->_strokeColor;
  if (strokeColor != a3)
  {
    if (strokeColor) {
      CGColorRelease(strokeColor);
    }
    self->_strokeColor = CGColorRetain(a3);
  }
}

@end