@interface BBThumbnailSizeConstraints
+ (BOOL)supportsSecureCoding;
- (BBThumbnailSizeConstraints)initWithCoder:(id)a3;
- (BOOL)areReasonable;
- (CGSize)sizeFromAspectRatio:(double)a3;
- (float)fixedDimension;
- (float)fixedHeight;
- (float)fixedWidth;
- (float)maxAspectRatio;
- (float)minAspectRatio;
- (float)thumbnailScale;
- (id)description;
- (int64_t)constraintType;
- (void)encodeWithCoder:(id)a3;
- (void)setConstraintType:(int64_t)a3;
- (void)setFixedDimension:(float)a3;
- (void)setFixedHeight:(float)a3;
- (void)setFixedWidth:(float)a3;
- (void)setMaxAspectRatio:(float)a3;
- (void)setMinAspectRatio:(float)a3;
- (void)setThumbnailScale:(float)a3;
@end

@implementation BBThumbnailSizeConstraints

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p type=", v5, self];

  v7 = @"BBConstraintFixedLargeDimension";
  uint64_t v8 = 12;
  v9 = @"; fixedHeight=%g";
  v10 = @"BBConstraintFixedHeight";
  switch(self->_constraintType)
  {
    case 0:
      v9 = @"; fixedWidth=%g";
      uint64_t v8 = 8;
      v10 = @"BBConstraintFixedWidth";
      goto LABEL_6;
    case 1:
      goto LABEL_6;
    case 2:
      [v6 appendString:@"BBConstraintFixedSized"];
      uint64_t v11 = 12;
      uint64_t v12 = 8;
      v13 = @"; fixedWidth=%g";
      goto LABEL_7;
    case 3:
      goto LABEL_5;
    case 4:
      v7 = @"BBConstraintFixedSmallDimension";
LABEL_5:
      v9 = @"; fixedDimension=%g";
      uint64_t v8 = 16;
      v10 = v7;
LABEL_6:
      [v6 appendString:v10];
      objc_msgSend(v6, "appendFormat:", v9, *(float *)((char *)&self->super.isa + v8));
      v9 = @"; maxAspectRatio=%g";
      uint64_t v11 = 24;
      uint64_t v12 = 20;
      v13 = @"; minAspectRatio=%g";
LABEL_7:
      objc_msgSend(v6, "appendFormat:", v13, *(float *)((char *)&self->super.isa + v12));
      objc_msgSend(v6, "appendFormat:", v9, *(float *)((char *)&self->super.isa + v11));
      break;
    default:
      break;
  }
  BOOL v14 = [(BBThumbnailSizeConstraints *)self areReasonable];
  v15 = @"NO";
  if (v14) {
    v15 = @"YES";
  }
  [v6 appendFormat:@"; thumbnailScale=%g; reasonable? %@>", self->_thumbnailScale, v15];
  return v6;
}

- (BBThumbnailSizeConstraints)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BBThumbnailSizeConstraints;
  v5 = [(BBThumbnailSizeConstraints *)&v7 init];
  if (v5)
  {
    -[BBThumbnailSizeConstraints setConstraintType:](v5, "setConstraintType:", [v4 decodeIntegerForKey:@"constraintType"]);
    [v4 decodeFloatForKey:@"fixedWidth"];
    -[BBThumbnailSizeConstraints setFixedWidth:](v5, "setFixedWidth:");
    [v4 decodeFloatForKey:@"fixedHeight"];
    -[BBThumbnailSizeConstraints setFixedHeight:](v5, "setFixedHeight:");
    [v4 decodeFloatForKey:@"fixedDimension"];
    -[BBThumbnailSizeConstraints setFixedDimension:](v5, "setFixedDimension:");
    [v4 decodeFloatForKey:@"minAspectRatio"];
    -[BBThumbnailSizeConstraints setMinAspectRatio:](v5, "setMinAspectRatio:");
    [v4 decodeFloatForKey:@"maxAspectRatio"];
    -[BBThumbnailSizeConstraints setMaxAspectRatio:](v5, "setMaxAspectRatio:");
    [v4 decodeFloatForKey:@"thumbnailScale"];
    -[BBThumbnailSizeConstraints setThumbnailScale:](v5, "setThumbnailScale:");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBThumbnailSizeConstraints constraintType](self, "constraintType"), @"constraintType");
  [(BBThumbnailSizeConstraints *)self fixedWidth];
  objc_msgSend(v4, "encodeFloat:forKey:", @"fixedWidth");
  [(BBThumbnailSizeConstraints *)self fixedHeight];
  objc_msgSend(v4, "encodeFloat:forKey:", @"fixedHeight");
  [(BBThumbnailSizeConstraints *)self fixedDimension];
  objc_msgSend(v4, "encodeFloat:forKey:", @"fixedDimension");
  [(BBThumbnailSizeConstraints *)self minAspectRatio];
  objc_msgSend(v4, "encodeFloat:forKey:", @"minAspectRatio");
  [(BBThumbnailSizeConstraints *)self maxAspectRatio];
  objc_msgSend(v4, "encodeFloat:forKey:", @"maxAspectRatio");
  [(BBThumbnailSizeConstraints *)self thumbnailScale];
  objc_msgSend(v4, "encodeFloat:forKey:", @"thumbnailScale");
}

- (BOOL)areReasonable
{
  float fixedWidth = self->_fixedWidth;
  float fixedHeight = self->_fixedHeight;
  BOOL v4 = fixedWidth >= 10.0;
  if (fixedWidth > 1000.0) {
    BOOL v4 = 0;
  }
  BOOL v5 = fixedHeight >= 10.0;
  if (fixedHeight > 1000.0) {
    BOOL v5 = 0;
  }
  float fixedDimension = self->_fixedDimension;
  float minAspectRatio = self->_minAspectRatio;
  BOOL v8 = fixedDimension >= 10.0;
  if (fixedDimension > 1000.0) {
    BOOL v8 = 0;
  }
  if (minAspectRatio >= 0.1)
  {
    float maxAspectRatio = self->_maxAspectRatio;
    BOOL v9 = maxAspectRatio <= 10.0;
    if (minAspectRatio > maxAspectRatio) {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  switch(self->_constraintType)
  {
    case 0:
      BOOL result = v4 && v9;
      break;
    case 1:
      BOOL result = v5 && v9;
      break;
    case 2:
      BOOL result = v4 && v5;
      break;
    case 3:
    case 4:
      BOOL result = v8 && v9;
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (CGSize)sizeFromAspectRatio:(double)a3
{
  double v3 = 0.0;
  if (a3 <= 0.0)
  {
    double v10 = 0.0;
  }
  else
  {
    [(BBThumbnailSizeConstraints *)self minAspectRatio];
    float v7 = v6;
    [(BBThumbnailSizeConstraints *)self maxAspectRatio];
    double v9 = v8;
    if (v9 >= a3) {
      double v9 = a3;
    }
    if (v9 > v7) {
      float v7 = v9;
    }
    double v10 = 0.0;
    switch([(BBThumbnailSizeConstraints *)self constraintType])
    {
      case 0:
        [(BBThumbnailSizeConstraints *)self fixedWidth];
        double v10 = v11;
        double v3 = v11 / v7;
        break;
      case 1:
        [(BBThumbnailSizeConstraints *)self fixedHeight];
        double v3 = v14;
        double v10 = v7 * v14;
        break;
      case 2:
        [(BBThumbnailSizeConstraints *)self fixedWidth];
        double v10 = v15;
        [(BBThumbnailSizeConstraints *)self fixedHeight];
        double v3 = v16;
        break;
      case 3:
        double v17 = v7;
        [(BBThumbnailSizeConstraints *)self fixedDimension];
        double v10 = v18;
        if (v7 <= 1.0) {
          goto LABEL_15;
        }
        goto LABEL_13;
      case 4:
        double v17 = v7;
        [(BBThumbnailSizeConstraints *)self fixedDimension];
        double v10 = v19;
        if (v7 < 1.0)
        {
LABEL_13:
          double v3 = v10 / v17;
        }
        else
        {
LABEL_15:
          double v3 = v10;
          double v10 = v17 * v10;
        }
        break;
      default:
        break;
    }
  }
  double v12 = v10;
  double v13 = v3;
  result.height = v13;
  result.width = v12;
  return result;
}

- (int64_t)constraintType
{
  return self->_constraintType;
}

- (void)setConstraintType:(int64_t)a3
{
  self->_constraintType = a3;
}

- (float)fixedWidth
{
  return self->_fixedWidth;
}

- (void)setFixedWidth:(float)a3
{
  self->_float fixedWidth = a3;
}

- (float)fixedHeight
{
  return self->_fixedHeight;
}

- (void)setFixedHeight:(float)a3
{
  self->_float fixedHeight = a3;
}

- (float)fixedDimension
{
  return self->_fixedDimension;
}

- (void)setFixedDimension:(float)a3
{
  self->_float fixedDimension = a3;
}

- (float)minAspectRatio
{
  return self->_minAspectRatio;
}

- (void)setMinAspectRatio:(float)a3
{
  self->_float minAspectRatio = a3;
}

- (float)maxAspectRatio
{
  return self->_maxAspectRatio;
}

- (void)setMaxAspectRatio:(float)a3
{
  self->_float maxAspectRatio = a3;
}

- (float)thumbnailScale
{
  return self->_thumbnailScale;
}

- (void)setThumbnailScale:(float)a3
{
  self->_thumbnailScale = a3;
}

@end