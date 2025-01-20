@interface CIColor
+ (BOOL)supportsSecureCoding;
+ (CIColor)blackColor;
+ (CIColor)blueColor;
+ (CIColor)clearColor;
+ (CIColor)colorWithCGColor:(CGColorRef)c;
+ (CIColor)colorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b;
+ (CIColor)colorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a;
+ (CIColor)colorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a colorSpace:(CGColorSpaceRef)colorSpace;
+ (CIColor)colorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b colorSpace:(CGColorSpaceRef)colorSpace;
+ (CIColor)colorWithString:(NSString *)representation;
+ (CIColor)cyanColor;
+ (CIColor)grayColor;
+ (CIColor)greenColor;
+ (CIColor)magentaColor;
+ (CIColor)redColor;
+ (CIColor)whiteColor;
+ (CIColor)yellowColor;
- (BOOL)isEqual:(id)a3;
- (CGColor)cgColor;
- (CGColor)rgbColor;
- (CGColorSpaceRef)colorSpace;
- (CGFloat)alpha;
- (CGFloat)blue;
- (CGFloat)green;
- (CGFloat)red;
- (CIColor)init;
- (CIColor)initWithCGColor:(CGColorRef)c;
- (CIColor)initWithCoder:(id)a3;
- (CIColor)initWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b;
- (CIColor)initWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a;
- (CIColor)initWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a colorSpace:(CGColorSpaceRef)colorSpace;
- (CIColor)initWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b colorSpace:(CGColorSpaceRef)colorSpace;
- (CIColor)initWithString:(id)a3;
- (NSString)stringRepresentation;
- (const)components;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugQuickLookObject;
- (id)description;
- (size_t)numberOfComponents;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CIColor

- (CGColor)cgColor
{
  return (CGColor *)self->_priv;
}

+ (CIColor)colorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b colorSpace:(CGColorSpaceRef)colorSpace
{
  return (CIColor *)[a1 colorWithRed:colorSpace green:r blue:g alpha:b colorSpace:1.0];
}

+ (CIColor)colorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a colorSpace:(CGColorSpaceRef)colorSpace
{
  v7 = (void *)[objc_alloc((Class)a1) initWithRed:colorSpace green:r blue:g alpha:b colorSpace:a];

  return (CIColor *)v7;
}

+ (CIColor)colorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a
{
  v6 = (void *)[objc_alloc((Class)a1) initWithRed:r green:g blue:b alpha:a];

  return (CIColor *)v6;
}

- (CIColor)initWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a colorSpace:(CGColorSpaceRef)colorSpace
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  if (CGColorSpaceGetModel(colorSpace) == kCGColorSpaceModelRGB)
  {
    components[0] = r;
    components[1] = g;
    components[2] = b;
    components[3] = a;
    v13 = CGColorCreate(colorSpace, components);
    v14 = [(CIColor *)self initWithCGColor:v13];
    CGColorRelease(v13);
  }
  else
  {
    v15 = ci_logger_api();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CIColor initWithRed:green:blue:alpha:colorSpace:](v15);
    }

    return 0;
  }
  return v14;
}

- (CIColor)initWithCGColor:(CGColorRef)c
{
  v3 = self;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!c)
  {
    *(_OWORD *)components = 0u;
    long long v11 = 0u;
    if (GetDefaultColorSpace(void)::onceToken != -1) {
      dispatch_once(&GetDefaultColorSpace(void)::onceToken, &__block_literal_global_5);
    }
    CGColorRef v7 = CGColorCreate((CGColorSpaceRef)GetDefaultColorSpace(void)::cs, components);
    goto LABEL_9;
  }
  v9.receiver = self;
  v9.super_class = (Class)CIColor;
  v5 = [(CIColor *)&v9 init];
  v3 = v5;
  if (v5)
  {
    priv = (CGColor *)v5->_priv;
    if (priv) {
      CGColorRelease(priv);
    }
    CGColorRef v7 = CGColorRetain(c);
LABEL_9:
    v3->_priv = v7;
  }
  return v3;
}

- (CIColor)initWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a
{
  if (GetDefaultColorSpace(void)::onceToken != -1) {
    dispatch_once(&GetDefaultColorSpace(void)::onceToken, &__block_literal_global_5);
  }
  uint64_t v11 = GetDefaultColorSpace(void)::cs;

  return [(CIColor *)self initWithRed:v11 green:r blue:g alpha:b colorSpace:a];
}

+ (CIColor)colorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b
{
  return (CIColor *)[a1 colorWithRed:r green:g blue:b alpha:1.0];
}

- (void)dealloc
{
  CGColorRelease((CGColorRef)self->_priv);
  CGColorRelease((CGColorRef)self->_pad[0]);
  v3.receiver = self;
  v3.super_class = (Class)CIColor;
  [(CIColor *)&v3 dealloc];
}

- (CGFloat)blue
{
  v2 = [(CIColor *)self rgbColor];
  if (v2) {
    return CGColorGetComponents(v2)[2];
  }
  else {
    return 0.0;
  }
}

- (CGFloat)green
{
  v2 = [(CIColor *)self rgbColor];
  if (v2) {
    return CGColorGetComponents(v2)[1];
  }
  else {
    return 0.0;
  }
}

- (CGFloat)red
{
  v2 = [(CIColor *)self rgbColor];
  if (v2) {
    return *CGColorGetComponents(v2);
  }
  else {
    return 0.0;
  }
}

- (CGColor)rgbColor
{
  objc_super v3 = [(CIColor *)self cgColor];
  ColorSpace = CGColorGetColorSpace(v3);
  if (CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelRGB) {
    return v3;
  }
  result = (CGColor *)self->_pad[0];
  if (!result)
  {
    {
      if (GetDefaultColorSpace(void)::onceToken != -1) {
        dispatch_once(&GetDefaultColorSpace(void)::onceToken, &__block_literal_global_5);
      }
      GetTransformToDefault(void)::transform = MEMORY[0x199700F90](GetDefaultColorSpace(void)::cs, 0);
    }
    result = (CGColor *)CGColorTransformConvertColor();
    self->_pad[0] = result;
  }
  return result;
}

- (CGFloat)alpha
{
  return CGColorGetAlpha((CGColorRef)self->_priv);
}

+ (CIColor)colorWithCGColor:(CGColorRef)c
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithCGColor:c];

  return (CIColor *)v3;
}

+ (CIColor)colorWithString:(NSString *)representation
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithString:representation];

  return (CIColor *)v3;
}

- (CIColor)init
{
  return [(CIColor *)self initWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
}

- (CIColor)initWithString:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = (char *)[a3 UTF8String];
  if (v4)
  {
    v5 = v4;
    v10 = 0;
    int v6 = *v4;
    if (v6 == 91 || v6 == 40) {
      v5 = v4 + 1;
    }
    uint64_t v7 = 0;
    while (1)
    {
      *((double *)&v11 + v7) = strtod(v5, &v10);
      if (v10 == v5) {
        break;
      }
      ++v7;
      v5 = v10;
      if (v7 == 4) {
        return -[CIColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v11, v12);
      }
    }
    switch((int)v7)
    {
      case 0:
        long long v11 = 0uLL;
        *(void *)&long long v12 = 0;
        goto LABEL_15;
      case 1:
        *((void *)&v11 + 1) = v11;
        *(void *)&long long v12 = v11;
        goto LABEL_15;
      case 2:
        long long v9 = v11;
        *((void *)&v11 + 1) = v11;
        long long v12 = v9;
        return -[CIColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v11, v12);
      case 3:
LABEL_15:
        *((void *)&v12 + 1) = 0x3FF0000000000000;
        break;
      default:
        return -[CIColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v11, v12);
    }
    return -[CIColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v11, v12);
  }
  else
  {
    return [(CIColor *)self initWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  }
}

- (CIColor)initWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b
{
  return [(CIColor *)self initWithRed:r green:g blue:b alpha:1.0];
}

- (CIColor)initWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b colorSpace:(CGColorSpaceRef)colorSpace
{
  return [(CIColor *)self initWithRed:colorSpace green:r blue:g alpha:b colorSpace:1.0];
}

- (size_t)numberOfComponents
{
  return CGColorGetNumberOfComponents((CGColorRef)self->_priv);
}

- (const)components
{
  return CGColorGetComponents((CGColorRef)self->_priv);
}

- (NSString)stringRepresentation
{
  objc_super v3 = NSString;
  [(CIColor *)self red];
  uint64_t v5 = v4;
  [(CIColor *)self green];
  uint64_t v7 = v6;
  [(CIColor *)self blue];
  uint64_t v9 = v8;
  [(CIColor *)self alpha];
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"%g %g %g %g", v5, v7, v9, v10);
}

- (CGColorSpaceRef)colorSpace
{
  return CGColorGetColorSpace((CGColorRef)self->_priv);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(CIColor *)self cgColor];
  uint64_t v6 = (CGColor *)[a3 cgColor];

  return CGColorEqualToColor(v5, v6);
}

- (unint64_t)hash
{
  CGColorSpaceRef ColorSpace = CGColorGetColorSpace((CGColorRef)self->_priv);
  int NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)self->_priv);
  Components = CGColorGetComponents((CGColorRef)self->_priv);
  unint64_t v6 = 33 * (void)ColorSpace + NumberOfComponents;
  if (NumberOfComponents >= 1)
  {
    uint64_t v7 = NumberOfComponents;
    do
    {
      double v8 = *Components++;
      unint64_t v6 = 33 * v6 + (int)vcvtd_n_s64_f64(v8, 0xAuLL);
      --v7;
    }
    while (v7);
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[CIColor allocWithZone:a3];
  priv = self->_priv;

  return [(CIColor *)v4 initWithCGColor:priv];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = [(CIColor *)self rgbColor];
  if (v4)
  {
    Components = CGColorGetComponents(v4);
    double v6 = *Components;
    *(float *)&double v6 = *Components;
    [a3 encodeFloat:@"red" forKey:v6];
    double v7 = Components[1];
    *(float *)&double v7 = v7;
    [a3 encodeFloat:@"green" forKey:v7];
    double v8 = Components[2];
    *(float *)&double v8 = v8;
    [a3 encodeFloat:@"blue" forKey:v8];
    double v9 = Components[3];
    *(float *)&double v9 = v9;
    [a3 encodeFloat:@"alpha" forKey:v9];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CIColor)initWithCoder:(id)a3
{
  [a3 decodeFloatForKey:@"red"];
  double v6 = v5;
  [a3 decodeFloatForKey:@"green"];
  double v8 = v7;
  [a3 decodeFloatForKey:@"blue"];
  double v10 = v9;
  [a3 decodeFloatForKey:@"alpha"];

  return [(CIColor *)self initWithRed:v6 green:v8 blue:v10 alpha:v11];
}

- (id)description
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __22__CIColor_description__block_invoke;
  v3[3] = &unk_1E5771158;
  v3[4] = self;
  return (id)(id)stream_to_string((uint64_t)v3);
}

uint64_t __22__CIColor_description__block_invoke(uint64_t a1, FILE *a2)
{
  fprintf(a2, "<CIColor %p ", *(const void **)(a1 + 32));
  int v4 = [*(id *)(a1 + 32) numberOfComponents];
  uint64_t v5 = [*(id *)(a1 + 32) components];
  if (v4 >= 1)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    do
    {
      if (v7) {
        double v8 = " ";
      }
      else {
        double v8 = "(";
      }
      fprintf(a2, "%s%g", v8, *(double *)(v6 + v7));
      v7 += 8;
    }
    while (8 * v4 != v7);
  }
  fwrite(") ", 2uLL, 1uLL, a2);
  CI::fprintf_cs(a2, (__sFILE *)[*(id *)(a1 + 32) colorSpace], (CGColorSpace *)1);

  return fputc(62, a2);
}

+ (CIColor)blackColor
{
  return (CIColor *)&+[CIColor blackColor]::c;
}

+ (CIColor)whiteColor
{
  return (CIColor *)&+[CIColor whiteColor]::c;
}

+ (CIColor)grayColor
{
  return (CIColor *)&+[CIColor grayColor]::c;
}

+ (CIColor)redColor
{
  return (CIColor *)&+[CIColor redColor]::c;
}

+ (CIColor)greenColor
{
  return (CIColor *)&+[CIColor greenColor]::c;
}

+ (CIColor)blueColor
{
  return (CIColor *)&+[CIColor blueColor]::c;
}

+ (CIColor)cyanColor
{
  return (CIColor *)&+[CIColor cyanColor]::c;
}

+ (CIColor)magentaColor
{
  return (CIColor *)&+[CIColor magentaColor]::c;
}

+ (CIColor)yellowColor
{
  return (CIColor *)&+[CIColor yellowColor]::c;
}

+ (CIColor)clearColor
{
  return (CIColor *)&+[CIColor clearColor]::c;
}

- (id)debugQuickLookObject
{
  Class v3 = NSClassFromString(&cfstr_Uicolor.isa);
  if (!v3) {
    return 0;
  }
  Class v4 = v3;
  SEL Uid = sel_getUid("colorWithCIColor:");
  if (!Uid) {
    return 0;
  }

  return (id)[(objc_class *)v4 performSelector:Uid withObject:self];
}

- (void)initWithRed:(os_log_t)log green:blue:alpha:colorSpace:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136446210;
  v2 = "-[CIColor initWithRed:green:blue:alpha:colorSpace:]";
  _os_log_error_impl(&dword_193671000, log, OS_LOG_TYPE_ERROR, "%{public}s colorSpace must be kCGColorSpaceModelRGB.", (uint8_t *)&v1, 0xCu);
}

@end