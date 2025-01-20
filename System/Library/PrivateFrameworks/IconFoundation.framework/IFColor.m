@interface IFColor
+ (BOOL)supportsSecureCoding;
+ (CGColorSpace)deviceGreyColorSpace;
+ (CGColorSpace)deviceRGBColorSpace;
+ (id)black;
+ (id)borderColorForAppearance:(int64_t)a3;
+ (id)white;
- (BOOL)isEqual:(id)a3;
- (CGColor)cgColor;
- (CIColor)ciColor;
- (IFColor)initWithCGColor:(CGColor *)a3;
- (IFColor)initWithCIColor:(id)a3;
- (IFColor)initWithCoder:(id)a3;
- (IFColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (IFColor)initWithSystemColor:(int64_t)a3;
- (IFColor)initWithSystemColor:(int64_t)a3 appearance:(int64_t)a4 contrast:(int64_t)a5 vibrancy:(int64_t)a6;
- (IFColor)initWithWhite:(double)a3 alpha:(double)a4;
- (NSUUID)digest;
- (id)_initWithColorStr:(id)a3 appearance:(int64_t)a4 contrast:(int64_t)a5 vibrancy:(int64_t)a6;
- (id)blendColorWithFraction:(double)a3 ofColor:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IFColor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)black
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __16__IFColor_black__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (black_onceToken != -1) {
    dispatch_once(&black_onceToken, block);
  }
  v2 = (void *)black_color;

  return v2;
}

uint64_t __16__IFColor_black__block_invoke(uint64_t a1)
{
  black_color = [objc_alloc(*(Class *)(a1 + 32)) initWithWhite:0.0 alpha:1.0];

  return MEMORY[0x1F41817F8]();
}

+ (id)white
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __16__IFColor_white__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (white_onceToken != -1) {
    dispatch_once(&white_onceToken, block);
  }
  v2 = (void *)white_color;

  return v2;
}

uint64_t __16__IFColor_white__block_invoke(uint64_t a1)
{
  white_color = [objc_alloc(*(Class *)(a1 + 32)) initWithWhite:1.0 alpha:1.0];

  return MEMORY[0x1F41817F8]();
}

+ (CGColorSpace)deviceRGBColorSpace
{
  if (deviceRGBColorSpace_onceToken != -1) {
    dispatch_once(&deviceRGBColorSpace_onceToken, &__block_literal_global_0);
  }
  return (CGColorSpace *)deviceRGBColorSpace_defaultColorSpace;
}

CGColorSpaceRef __30__IFColor_deviceRGBColorSpace__block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceRGB();
  deviceRGBColorSpace_defaultColorSpace = (uint64_t)result;
  return result;
}

+ (CGColorSpace)deviceGreyColorSpace
{
  if (deviceGreyColorSpace_onceToken != -1) {
    dispatch_once(&deviceGreyColorSpace_onceToken, &__block_literal_global_2);
  }
  return (CGColorSpace *)deviceGreyColorSpace_defaultColorSpace;
}

CGColorSpaceRef __31__IFColor_deviceGreyColorSpace__block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceGray();
  deviceGreyColorSpace_defaultColorSpace = (uint64_t)result;
  return result;
}

- (IFColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E008]), "initWithRed:green:blue:alpha:colorSpace:", +[IFColor deviceRGBColorSpace](IFColor, "deviceRGBColorSpace"), a3, a4, a5, a6);
  v8 = [(IFColor *)self initWithCIColor:v7];

  return v8;
}

- (IFColor)initWithWhite:(double)a3 alpha:(double)a4
{
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E008]), "initWithRed:green:blue:alpha:colorSpace:", +[IFColor deviceRGBColorSpace](IFColor, "deviceRGBColorSpace"), a3, a3, a3, a4);
  v6 = [(IFColor *)self initWithCIColor:v5];

  return v6;
}

- (IFColor)initWithCGColor:(CGColor *)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1E008]) initWithCGColor:a3];
  v5 = [(IFColor *)self initWithCIColor:v4];

  return v5;
}

- (IFColor)initWithCIColor:(id)a3
{
  id v5 = a3;
  v6 = [(IFColor *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ciColor, a3);
    v8 = (void *)MEMORY[0x1E4F29128];
    v9 = [v5 stringRepresentation];
    uint64_t v10 = objc_msgSend(v8, "_IF_UUIDWithString:", v9);
    digest = v7->_digest;
    v7->_digest = (NSUUID *)v10;
  }
  return v7;
}

- (IFColor)initWithSystemColor:(int64_t)a3
{
  return [(IFColor *)self initWithSystemColor:a3 appearance:0 contrast:0 vibrancy:0];
}

- (IFColor)initWithSystemColor:(int64_t)a3 appearance:(int64_t)a4 contrast:(int64_t)a5 vibrancy:(int64_t)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 11:
      double v13 = 1.0;
      goto LABEL_10;
    case 12:
      double v13 = 0.0;
LABEL_10:
      v11 = [(IFColor *)self initWithWhite:v13 alpha:1.0];
      break;
    default:
      id v14 = 0;
      v7 = objc_msgSend(MEMORY[0x1E4F5E050], "colorWithName:designSystem:palette:colorScheme:contrast:styling:displayGamut:error:", 0, &v14);
      id v8 = v14;
      if (!v7)
      {
        v9 = IFDefaultLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v10 = [v8 localizedDescription];
          *(_DWORD *)buf = 138412290;
          v16 = v10;
        }
      }
      v11 = -[IFColor initWithCGColor:](self, "initWithCGColor:", [v7 cgColor]);

      break;
  }

  return v11;
}

- (id)_initWithColorStr:(id)a3 appearance:(int64_t)a4 contrast:(int64_t)a5 vibrancy:(int64_t)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (![v10 compare:@"systemBlackColor"])
  {
    double v13 = self;
    uint64_t v14 = 12;
LABEL_34:
    self = [(IFColor *)v13 initWithSystemColor:v14 appearance:a4 contrast:a5 vibrancy:a6];
    v12 = self;
    goto LABEL_35;
  }
  if (![v10 compare:@"systemWhiteColor"])
  {
    double v13 = self;
    uint64_t v14 = 11;
    goto LABEL_34;
  }
  if (![v10 compare:@"systemRedColor"])
  {
    double v13 = self;
    uint64_t v14 = 0;
    goto LABEL_34;
  }
  if (![v10 compare:@"systemOrangeColor"])
  {
    double v13 = self;
    uint64_t v14 = 1;
    goto LABEL_34;
  }
  if (![v10 compare:@"systemYellowColor"])
  {
    double v13 = self;
    uint64_t v14 = 2;
    goto LABEL_34;
  }
  if (![v10 compare:@"systemGreenColor"])
  {
    double v13 = self;
    uint64_t v14 = 3;
    goto LABEL_34;
  }
  if (![v10 compare:@"systemMintColor"])
  {
    double v13 = self;
    uint64_t v14 = 5;
    goto LABEL_34;
  }
  if (![v10 compare:@"systemTealColor"])
  {
    double v13 = self;
    uint64_t v14 = 4;
    goto LABEL_34;
  }
  if (![v10 compare:@"systemCyanColor"])
  {
    double v13 = self;
    uint64_t v14 = 6;
    goto LABEL_34;
  }
  if (![v10 compare:@"systemBlueColor"])
  {
    double v13 = self;
    uint64_t v14 = 7;
    goto LABEL_34;
  }
  if (![v10 compare:@"systemIndigoColor"])
  {
    double v13 = self;
    uint64_t v14 = 8;
    goto LABEL_34;
  }
  if (![v10 compare:@"systemPurpleColor"])
  {
    double v13 = self;
    uint64_t v14 = 9;
    goto LABEL_34;
  }
  if (![v10 compare:@"systemPinkColor"])
  {
    double v13 = self;
    uint64_t v14 = 10;
    goto LABEL_34;
  }
  if (![v10 compare:@"systemBrownColor"])
  {
    double v13 = self;
    uint64_t v14 = 14;
    goto LABEL_34;
  }
  if (![v10 compare:@"systemGrayColor"])
  {
    double v13 = self;
    uint64_t v14 = 13;
    goto LABEL_34;
  }
  v11 = IFDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v10;
    _os_log_impl(&dword_1DC6CA000, v11, OS_LOG_TYPE_DEFAULT, "Unknown color: %@", (uint8_t *)&v16, 0xCu);
  }

  v12 = 0;
LABEL_35:

  return v12;
}

- (IFColor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IFColor;
  id v5 = [(IFColor *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"digest"];
    digest = v5->_digest;
    v5->_digest = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ciColor"];
    ciColor = v5->_ciColor;
    v5->_ciColor = (CIColor *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  digest = self->_digest;
  id v5 = a3;
  [v5 encodeObject:digest forKey:@"digest"];
  [v5 encodeObject:self->_ciColor forKey:@"ciColor"];
}

- (CGColor)cgColor
{
  CGColorRef v2 = CGColorCreate([(CIColor *)self->_ciColor colorSpace], [(CIColor *)self->_ciColor components]);

  return (CGColor *)CFAutorelease(v2);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IFColor *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(IFColor *)self digest];
      uint64_t v6 = [(IFColor *)v4 digest];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)blendColorWithFraction:(double)a3 ofColor:(id)a4
{
  id v6 = a4;
  char v7 = self;
  uint64_t v8 = v7;
  if (a3 >= 1.0)
  {
    v33 = (IFColor *)v6;
  }
  else if (a3 <= 0.0)
  {
    v33 = v7;
  }
  else
  {
    v9 = [v6 ciColor];
    [v9 red];
    double v11 = v10;
    v12 = [(IFColor *)v8 ciColor];
    [v12 red];
    double v14 = (1.0 - a3) * v13 + v11 * a3;

    v15 = [v6 ciColor];
    [v15 green];
    double v17 = v16;
    uint64_t v18 = [(IFColor *)v8 ciColor];
    [v18 green];
    double v20 = (1.0 - a3) * v19 + v17 * a3;

    v21 = [v6 ciColor];
    [v21 blue];
    double v23 = v22;
    v24 = [(IFColor *)v8 ciColor];
    [v24 blue];
    double v26 = (1.0 - a3) * v25 + v23 * a3;

    v27 = [v6 ciColor];
    [v27 alpha];
    double v29 = v28;
    v30 = [(IFColor *)v8 ciColor];
    [v30 alpha];
    double v32 = (1.0 - a3) * v31 + v29 * a3;

    v33 = [[IFColor alloc] initWithRed:v14 green:v20 blue:v26 alpha:v32];
  }
  v34 = v33;

  return v34;
}

- (CIColor)ciColor
{
  return (CIColor *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)digest
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digest, 0);

  objc_storeStrong((id *)&self->_ciColor, 0);
}

+ (id)borderColorForAppearance:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 1)
  {
    id v4 = [[IFColor alloc] initWithWhite:0.0 alpha:0.13];
  }
  else
  {
    v3 = [MEMORY[0x1E4F5E050] colorWithName:20 designSystem:0 palette:0 colorScheme:1 contrast:0 styling:0 displayGamut:0 error:0];
    id v4 = -[IFColor initWithCGColor:]([IFColor alloc], "initWithCGColor:", [v3 cgColor]);
  }

  return v4;
}

@end