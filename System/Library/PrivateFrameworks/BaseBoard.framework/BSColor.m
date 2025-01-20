@interface BSColor
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)blackColor;
+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToColor:(id)a3;
- (BSColor)initWithBSXPCCoder:(id)a3;
- (BSColor)initWithCoder:(id)a3;
- (BSColor)initWithXPCDictionary:(id)a3;
- (CGColor)CGColor;
- (NSString)description;
- (double)alpha;
- (double)blue;
- (double)green;
- (double)red;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BSColor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BSColor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BSColor;
  v5 = [(BSColor *)&v11 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"r"];
    v5->_red = v6;
    [v4 decodeDoubleForKey:@"g"];
    v5->_green = v7;
    [v4 decodeDoubleForKey:@"b"];
    v5->_blue = v8;
    [v4 decodeDoubleForKey:@"a"];
    v5->_alpha = v9;
  }

  return v5;
}

+ (id)blackColor
{
  return (id)[a1 colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
}

+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  v10 = objc_alloc_init(BSColor);
  v10->_red = a3;
  v10->_green = a4;
  v10->_blue = a5;
  v10->_alpha = a6;
  return v10;
}

- (void)dealloc
{
  CGColorRelease(self->_colorRef);
  v3.receiver = self;
  v3.super_class = (Class)BSColor;
  [(BSColor *)&v3 dealloc];
}

- (CGColor)CGColor
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_colorRef)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    id v4 = DeviceRGB;
    if (DeviceRGB)
    {
      long long v5 = *(_OWORD *)&v2->_blue;
      v7[0] = *(_OWORD *)&v2->_red;
      v7[1] = v5;
      v2->_colorRef = CGColorCreate(DeviceRGB, (const CGFloat *)v7);
      CGColorSpaceRelease(v4);
    }
  }
  objc_sync_exit(v2);

  return v2->_colorRef;
}

- (BOOL)isEqualToColor:(id)a3
{
  id v4 = a3;
  long long v5 = +[BSEqualsBuilder builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  double red = self->_red;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __26__BSColor_isEqualToColor___block_invoke;
  v28[3] = &unk_1E5445E50;
  id v7 = v4;
  id v29 = v7;
  id v8 = (id)[v5 appendCGFloat:v28 counterpart:red];
  double green = self->_green;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __26__BSColor_isEqualToColor___block_invoke_2;
  v26[3] = &unk_1E5445E50;
  id v10 = v7;
  id v27 = v10;
  id v11 = (id)[v5 appendCGFloat:v26 counterpart:green];
  double blue = self->_blue;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __26__BSColor_isEqualToColor___block_invoke_3;
  v24[3] = &unk_1E5445E50;
  id v13 = v10;
  id v25 = v13;
  id v14 = (id)[v5 appendCGFloat:v24 counterpart:blue];
  double alpha = self->_alpha;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __26__BSColor_isEqualToColor___block_invoke_4;
  v22 = &unk_1E5445E50;
  id v16 = v13;
  id v23 = v16;
  id v17 = (id)[v5 appendCGFloat:&v19 counterpart:alpha];
  LOBYTE(v13) = objc_msgSend(v5, "isEqual", v19, v20, v21, v22);

  return (char)v13;
}

uint64_t __26__BSColor_isEqualToColor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) red];
}

uint64_t __26__BSColor_isEqualToColor___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) green];
}

uint64_t __26__BSColor_isEqualToColor___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) blue];
}

uint64_t __26__BSColor_isEqualToColor___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) alpha];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeDouble:@"r" forKey:self->_red];
  [v4 encodeDouble:@"g" forKey:self->_green];
  [v4 encodeDouble:@"b" forKey:self->_blue];
  [v4 encodeDouble:@"a" forKey:self->_alpha];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (BSColor)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BSColor;
  long long v5 = [(BSColor *)&v11 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"r"];
    v5->_double red = v6;
    [v4 decodeDoubleForKey:@"g"];
    v5->_double green = v7;
    [v4 decodeDoubleForKey:@"b"];
    v5->_double blue = v8;
    [v4 decodeDoubleForKey:@"a"];
    v5->_double alpha = v9;
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeDouble:@"r" forKey:self->_red];
  [v4 encodeDouble:@"g" forKey:self->_green];
  [v4 encodeDouble:@"b" forKey:self->_blue];
  [v4 encodeDouble:@"a" forKey:self->_alpha];
}

- (BSColor)initWithXPCDictionary:(id)a3
{
  id v4 = +[BSXPCCoder coderWithMessage:a3];
  long long v5 = [(BSColor *)self initWithBSXPCCoder:v4];

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = +[BSXPCCoder coderWithMessage:a3];
  -[BSColor encodeWithBSXPCCoder:](self, "encodeWithBSXPCCoder:");
}

- (NSString)description
{
  objc_super v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = (id)[v3 appendFloat:@"r" withName:2 decimalPrecision:self->_red];
  id v5 = (id)[v3 appendFloat:@"g" withName:2 decimalPrecision:self->_green];
  id v6 = (id)[v3 appendFloat:@"b" withName:2 decimalPrecision:self->_blue];
  id v7 = (id)[v3 appendFloat:@"a" withName:2 decimalPrecision:self->_alpha];
  double v8 = [v3 build];

  return (NSString *)v8;
}

- (unint64_t)hash
{
  objc_super v3 = +[BSHashBuilder builder];
  id v4 = [v3 appendCGFloat:self->_red];
  id v5 = [v4 appendCGFloat:self->_green];
  id v6 = [v5 appendCGFloat:self->_blue];
  id v7 = [v6 appendCGFloat:self->_alpha];
  unint64_t v8 = [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(BSColor *)self isEqualToColor:v4];

  return v5;
}

- (double)red
{
  return self->_red;
}

- (double)green
{
  return self->_green;
}

- (double)blue
{
  return self->_blue;
}

- (double)alpha
{
  return self->_alpha;
}

@end