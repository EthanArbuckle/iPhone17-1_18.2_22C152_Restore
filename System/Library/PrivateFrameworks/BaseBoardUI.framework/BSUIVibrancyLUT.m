@interface BSUIVibrancyLUT
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)canReuseInterpolatedLUTWithBlend:(double)a3 toIdentifier:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldUseInterpolatedLUTForBlend:(double)a3 toIdentifier:(id)a4;
- (BSUIVibrancyLUT)initWithBSXPCCoder:(id)a3;
- (BSUIVibrancyLUT)initWithCoder:(id)a3;
- (BSUIVibrancyLUT)initWithIdentifier:(id)a3 bundleURL:(id)a4;
- (BSUIVibrancyLUT)initWithIdentifier:(id)a3 bundleURL:(id)a4 blend:(double)a5 toIdentifier:(id)a6;
- (CAFilter)resolvedLUTFilter;
- (NSString)groupName;
- (NSString)lutIdentifier;
- (NSString)toIdentifier;
- (NSURL)bundleURL;
- (UIImage)interpolatedLutImage;
- (double)blend;
- (id)copyWithBlend:(double)a3 toIdentifier:(id)a4;
- (id)copyWithLuminanceReduced:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)interpolatedImageWithFirstImage:(id)a3 secondImage:(id)a4 blend:(double)a5;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setInterpolatedLutImage:(id)a3;
- (void)setToIdentifier:(id)a3;
@end

@implementation BSUIVibrancyLUT

- (BSUIVibrancyLUT)initWithIdentifier:(id)a3 bundleURL:(id)a4
{
  return [(BSUIVibrancyLUT *)self initWithIdentifier:a3 bundleURL:a4 blend:0 toIdentifier:0.0];
}

- (BSUIVibrancyLUT)initWithIdentifier:(id)a3 bundleURL:(id)a4 blend:(double)a5 toIdentifier:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BSUIVibrancyLUT;
  v12 = [(BSUIVibrancyLUT *)&v19 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    lutIdentifier = v12->_lutIdentifier;
    v12->_lutIdentifier = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    bundleURL = v12->_bundleURL;
    v12->_bundleURL = (NSURL *)v15;

    BSIntervalClip();
    v12->_blend = v17;
    objc_storeStrong((id *)&v12->_toIdentifier, a6);
  }

  return v12;
}

- (BOOL)shouldUseInterpolatedLUTForBlend:(double)a3 toIdentifier:(id)a4
{
  if (BSFloatIsZero()) {
    return 0;
  }
  int v6 = BSFloatIsOne() ^ 1;
  if (a4) {
    return v6;
  }
  else {
    return 0;
  }
}

- (BOOL)canReuseInterpolatedLUTWithBlend:(double)a3 toIdentifier:(id)a4
{
  id v5 = a4;
  [(BSUIVibrancyLUT *)self blend];
  if (BSFloatEqualToFloat())
  {
    int v6 = [(BSUIVibrancyLUT *)self toIdentifier];
    if ([v6 isEqualToString:v5])
    {
      v7 = [(BSUIVibrancyLUT *)self interpolatedLutImage];
      BOOL v8 = v7 != 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (CAFilter)resolvedLUTFilter
{
  [(BSUIVibrancyLUT *)self blend];
  double v4 = v3;
  id v5 = [(BSUIVibrancyLUT *)self toIdentifier];
  BOOL v6 = [(BSUIVibrancyLUT *)self shouldUseInterpolatedLUTForBlend:v5 toIdentifier:v4];

  if (v6)
  {
    uint64_t v7 = [(BSUIVibrancyLUT *)self lutIdentifier];
    BOOL v8 = [(BSUIVibrancyLUT *)self toIdentifier];
    [(BSUIVibrancyLUT *)self blend];
    -[BSUIVibrancyLUT interpolatedImageWithFirstImage:secondImage:blend:](self, "interpolatedImageWithFirstImage:secondImage:blend:", v7, v8);
    v10 = id v9 = (void *)v7;
  }
  else
  {
    [(BSUIVibrancyLUT *)self blend];
    if (BSFloatIsOne()
      && ([(BSUIVibrancyLUT *)self toIdentifier],
          id v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v11))
    {
      v12 = (void *)MEMORY[0x1E4F42A80];
      uint64_t v13 = [(BSUIVibrancyLUT *)self toIdentifier];
      v14 = (void *)MEMORY[0x1E4F28B50];
      BOOL v8 = [(BSUIVibrancyLUT *)self bundleURL];
      uint64_t v15 = [v14 bundleWithURL:v8];
      uint64_t v16 = [v12 imageNamed:v13 inBundle:v15];
    }
    else
    {
      double v17 = (void *)MEMORY[0x1E4F42A80];
      uint64_t v13 = [(BSUIVibrancyLUT *)self lutIdentifier];
      v18 = (void *)MEMORY[0x1E4F28B50];
      BOOL v8 = [(BSUIVibrancyLUT *)self bundleURL];
      uint64_t v15 = [v18 bundleWithURL:v8];
      uint64_t v16 = [v17 imageNamed:v13 inBundle:v15];
    }
    objc_super v19 = (void *)v16;

    id v9 = (void *)v13;
    id v10 = v19;
  }

  if (v10)
  {
    v20 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A278]];
    [(BSUIVibrancyLUT *)self blend];
    int IsOne = BSFloatIsOne();
    if (IsOne
      && ([(BSUIVibrancyLUT *)self toIdentifier],
          (v22 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v23 = [(BSUIVibrancyLUT *)self toIdentifier];
      int v24 = 0;
      int v25 = 1;
    }
    else
    {
      v23 = [(BSUIVibrancyLUT *)self lutIdentifier];
      v22 = 0;
      int v25 = 0;
      int v24 = 1;
    }
    [v20 setName:v23];
    if (v24)
    {

      if (!v25) {
        goto LABEL_15;
      }
    }
    else if (!v25)
    {
LABEL_15:
      if (!IsOne)
      {
LABEL_17:
        uint64_t v26 = [v10 CGImage];
        [v20 setValue:v26 forKey:*MEMORY[0x1E4F3A160]];
        goto LABEL_22;
      }
LABEL_16:

      goto LABEL_17;
    }

    if (!IsOne) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  v20 = 0;
LABEL_22:

  return (CAFilter *)v20;
}

- (id)interpolatedImageWithFirstImage:(id)a3 secondImage:(id)a4 blend:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(BSUIVibrancyLUT *)self canReuseInterpolatedLUTWithBlend:v9 toIdentifier:a5])
  {
    id v10 = [(BSUIVibrancyLUT *)self interpolatedLutImage];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F42A80];
    v12 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v13 = [(BSUIVibrancyLUT *)self bundleURL];
    v14 = [v12 bundleWithURL:v13];
    uint64_t v15 = [v11 imageNamed:v8 inBundle:v14];

    uint64_t v16 = (void *)MEMORY[0x1E4F42A80];
    double v17 = (void *)MEMORY[0x1E4F28B50];
    v18 = [(BSUIVibrancyLUT *)self bundleURL];
    objc_super v19 = [v17 bundleWithURL:v18];
    v20 = [v16 imageNamed:v9 inBundle:v19];

    id v10 = 0;
    if (v15 && v20)
    {
      [v15 size];
      double v22 = v21;
      [v15 size];
      double v24 = v23;
      [v15 size];
      UIGraphicsBeginImageContext(v31);
      int v25 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
      *(float *)&double v26 = a5;
      [v25 _solveForInput:v26];
      float v28 = v27;
      objc_msgSend(v15, "drawInRect:blendMode:alpha:", 0, 0.0, 0.0, v22, v24, 1.0);
      objc_msgSend(v20, "drawInRect:blendMode:alpha:", 0, 0.0, 0.0, v22, v24, v28);
      id v10 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      [(BSUIVibrancyLUT *)self setInterpolatedLutImage:v10];
    }
  }

  return v10;
}

- (NSString)groupName
{
  double v3 = NSString;
  double v4 = [(BSUIVibrancyLUT *)self lutIdentifier];
  id v5 = [(BSUIVibrancyLUT *)self bundleURL];
  BOOL v6 = [v3 stringWithFormat:@"%@%@", v4, v5];

  return (NSString *)v6;
}

- (id)copyWithLuminanceReduced:(BOOL)a3
{
  int v3 = a3;
  id v5 = self->_lutIdentifier;
  lutIdentifier = self->_lutIdentifier;
  if (lutIdentifier)
  {
    int v7 = [(NSString *)lutIdentifier hasPrefix:@"luminance_reduced_"];
    if (v7 != v3)
    {
      id v8 = self->_lutIdentifier;
      if (v7)
      {
        -[NSString substringFromIndex:](v8, "substringFromIndex:", [@"luminance_reduced_" length]);
        id v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v9 = v8;
      }
      id v10 = v9;
      uint64_t v11 = BSLutIdentifierForName(v9, v3);

      id v5 = (NSString *)v11;
    }
  }
  v12 = self->_toIdentifier;
  toIdentifier = self->_toIdentifier;
  if (toIdentifier)
  {
    int v14 = [(NSString *)toIdentifier hasPrefix:@"luminance_reduced_"];
    if (v14 != v3)
    {
      uint64_t v15 = self->_toIdentifier;
      if (v14)
      {
        -[NSString substringFromIndex:](v15, "substringFromIndex:", [@"luminance_reduced_" length]);
        uint64_t v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v16 = v15;
      }
      double v17 = v16;
      uint64_t v18 = BSLutIdentifierForName(v16, v3);

      v12 = (NSString *)v18;
    }
  }
  objc_super v19 = [BSUIVibrancyLUT alloc];
  v20 = [(BSUIVibrancyLUT *)self bundleURL];
  [(BSUIVibrancyLUT *)self blend];
  double v21 = -[BSUIVibrancyLUT initWithIdentifier:bundleURL:blend:toIdentifier:](v19, "initWithIdentifier:bundleURL:blend:toIdentifier:", v5, v20, v12);

  return v21;
}

- (id)copyWithBlend:(double)a3 toIdentifier:(id)a4
{
  id v6 = a4;
  int v7 = [BSUIVibrancyLUT alloc];
  id v8 = [(BSUIVibrancyLUT *)self lutIdentifier];
  id v9 = [(BSUIVibrancyLUT *)self bundleURL];
  id v10 = [(BSUIVibrancyLUT *)v7 initWithIdentifier:v8 bundleURL:v9 blend:v6 toIdentifier:a3];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (BSUIVibrancyLUT *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v20 = 1;
  }
  else
  {
    id v6 = v4;
    int v7 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_8;
    }
    id v9 = [(BSUIVibrancyLUT *)self lutIdentifier];
    id v10 = [(BSUIVibrancyLUT *)v6 lutIdentifier];
    int v11 = BSEqualObjects();

    if (!v11) {
      goto LABEL_8;
    }
    v12 = [(BSUIVibrancyLUT *)self bundleURL];
    uint64_t v13 = [(BSUIVibrancyLUT *)v6 bundleURL];
    int v14 = BSEqualObjects();

    if (!v14) {
      goto LABEL_8;
    }
    [(BSUIVibrancyLUT *)self blend];
    [(BSUIVibrancyLUT *)v6 blend];
    if (!BSFloatEqualToFloat()) {
      goto LABEL_8;
    }
    uint64_t v15 = [(BSUIVibrancyLUT *)self toIdentifier];
    uint64_t v16 = [(BSUIVibrancyLUT *)v6 toIdentifier];
    int v17 = BSEqualObjects();

    if (v17)
    {
      uint64_t v18 = [(BSUIVibrancyLUT *)self interpolatedLutImage];
      objc_super v19 = [(BSUIVibrancyLUT *)v6 interpolatedLutImage];
      char v20 = BSEqualObjects();
    }
    else
    {
LABEL_8:
      char v20 = 0;
    }
  }
  return v20;
}

- (unint64_t)hash
{
  int v3 = [MEMORY[0x1E4F4F758] builder];
  double v4 = [v3 appendString:self->_lutIdentifier];
  id v5 = [v4 appendObject:self->_bundleURL];
  double blend = self->_blend;
  *(float *)&double blend = blend;
  int v7 = [v5 appendFloat:blend];
  id v8 = [v7 appendString:self->_toIdentifier];
  unint64_t v9 = [v8 hash];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = [BSUIVibrancyLUT alloc];
  lutIdentifier = self->_lutIdentifier;
  bundleURL = self->_bundleURL;
  double blend = self->_blend;
  toIdentifier = self->_toIdentifier;

  return [(BSUIVibrancyLUT *)v4 initWithIdentifier:lutIdentifier bundleURL:bundleURL blend:toIdentifier toIdentifier:blend];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  double v4 = [(BSUIVibrancyLUT *)self lutIdentifier];
  [v7 encodeObject:v4 forKey:@"lutIdentifier"];

  id v5 = [(BSUIVibrancyLUT *)self bundleURL];
  [v7 encodeObject:v5 forKey:@"bundleURL"];

  [(BSUIVibrancyLUT *)self blend];
  objc_msgSend(v7, "encodeDouble:forKey:", @"blend");
  id v6 = [(BSUIVibrancyLUT *)self toIdentifier];
  [v7 encodeObject:v6 forKey:@"toIdentifier"];
}

- (BSUIVibrancyLUT)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lutIdentifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleURL"];
  [v4 decodeDoubleForKey:@"blend"];
  double v8 = v7;
  unint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"toIdentifier"];
  id v10 = [(BSUIVibrancyLUT *)self initWithIdentifier:v5 bundleURL:v6 blend:v9 toIdentifier:v8];

  return v10;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(BSUIVibrancyLUT *)self lutIdentifier];
  [v7 encodeObject:v4 forKey:@"lutIdentifier"];

  id v5 = [(BSUIVibrancyLUT *)self bundleURL];
  [v7 encodeObject:v5 forKey:@"bundleURL"];

  [(BSUIVibrancyLUT *)self blend];
  objc_msgSend(v7, "encodeDouble:forKey:", @"blend");
  id v6 = [(BSUIVibrancyLUT *)self toIdentifier];
  [v7 encodeObject:v6 forKey:@"toIdentifier"];
}

- (BSUIVibrancyLUT)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lutIdentifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleURL"];
  [v4 decodeDoubleForKey:@"blend"];
  double v8 = v7;
  unint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"toIdentifier"];
  id v10 = [(BSUIVibrancyLUT *)self initWithIdentifier:v5 bundleURL:v6 blend:v9 toIdentifier:v8];

  return v10;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v9 = a3;
  id v4 = [(BSUIVibrancyLUT *)self lutIdentifier];
  [v9 appendString:v4 withName:@"lutIdentifier"];

  id v5 = [(BSUIVibrancyLUT *)self bundleURL];
  id v6 = (id)[v9 appendObject:v5 withName:@"bundleURL"];

  [(BSUIVibrancyLUT *)self blend];
  id v7 = (id)objc_msgSend(v9, "appendFloat:withName:", @"blend");
  double v8 = [(BSUIVibrancyLUT *)self toIdentifier];
  [v9 appendString:v8 withName:@"toIdentifier"];
}

- (NSString)lutIdentifier
{
  return self->_lutIdentifier;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (double)blend
{
  return self->_blend;
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
}

- (void)setToIdentifier:(id)a3
{
}

- (UIImage)interpolatedLutImage
{
  return (UIImage *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInterpolatedLutImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpolatedLutImage, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);

  objc_storeStrong((id *)&self->_lutIdentifier, 0);
}

@end