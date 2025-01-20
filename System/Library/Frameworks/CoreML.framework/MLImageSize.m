@interface MLImageSize
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToImageSize:(id)a3;
- (MLImageSize)initWithCoder:(id)a3;
- (MLImageSize)initWithPixelsWide:(int64_t)a3 pixelsHigh:(int64_t)a4;
- (NSInteger)pixelsHigh;
- (NSInteger)pixelsWide;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLImageSize

- (NSInteger)pixelsHigh
{
  return self->_pixelsHigh;
}

- (NSInteger)pixelsWide
{
  return self->_pixelsWide;
}

- (MLImageSize)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"pixelsWide"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"pixelsHigh"];

  return [(MLImageSize *)self initWithPixelsWide:v5 pixelsHigh:v6];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLImageSize pixelsWide](self, "pixelsWide"), @"pixelsWide");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLImageSize pixelsHigh](self, "pixelsHigh"), @"pixelsHigh");
}

- (id)description
{
  v3 = NSString;
  id v4 = [NSNumber numberWithInteger:self->_pixelsWide];
  uint64_t v5 = [NSNumber numberWithInteger:self->_pixelsHigh];
  uint64_t v6 = [v3 stringWithFormat:@"%@ x %@", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MLImageSize *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(MLImageSize *)self isEqualToImageSize:v4];
  }

  return v5;
}

- (BOOL)isEqualToImageSize:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 pixelsWide] == self->_pixelsWide && objc_msgSend(v4, "pixelsHigh") == self->_pixelsHigh;

  return v5;
}

- (unint64_t)hash
{
  return self->_pixelsHigh
       + (self->_pixelsWide
        + self->_pixelsHigh
        + (self->_pixelsWide + self->_pixelsHigh) * (self->_pixelsWide + self->_pixelsHigh))
       / 2;
}

- (MLImageSize)initWithPixelsWide:(int64_t)a3 pixelsHigh:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MLImageSize;
  result = [(MLImageSize *)&v7 init];
  if (result)
  {
    result->_pixelsWide = a3;
    result->_pixelsHigh = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end