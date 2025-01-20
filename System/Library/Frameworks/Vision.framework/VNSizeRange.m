@interface VNSizeRange
+ (BOOL)supportsSecureCoding;
- (BOOL)isAllowedDimension:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (VNSizeRange)initWithCoder:(id)a3;
- (VNSizeRange)initWithMinimumDimension:(unint64_t)a3 maximumDimension:(unint64_t)a4 idealDimension:(unint64_t)a5;
- (unint64_t)hash;
- (unint64_t)idealDimension;
- (unint64_t)maximumDimension;
- (unint64_t)minimumDimension;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNSizeRange

- (unint64_t)idealDimension
{
  return self->_idealDimension;
}

- (unint64_t)maximumDimension
{
  return self->_maximumDimension;
}

- (unint64_t)minimumDimension
{
  return self->_minimumDimension;
}

- (VNSizeRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[VNSizeRange initWithMinimumDimension:maximumDimension:idealDimension:](self, "initWithMinimumDimension:maximumDimension:idealDimension:", [v4 decodeIntegerForKey:@"minDimension"], objc_msgSend(v4, "decodeIntegerForKey:", @"maxDimension"), objc_msgSend(v4, "decodeIntegerForKey:", @"idealDimension"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_minimumDimension forKey:@"minDimension"];
  [v4 encodeInteger:self->_maximumDimension forKey:@"maxDimension"];
  [v4 encodeInteger:self->_idealDimension forKey:@"idealDimension"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNSizeRange *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(VNSizeRange *)self minimumDimension];
      if (v6 == [(VNSizeRange *)v5 minimumDimension]
        && (unint64_t v7 = [(VNSizeRange *)self maximumDimension],
            v7 == [(VNSizeRange *)v5 maximumDimension]))
      {
        unint64_t v8 = [(VNSizeRange *)self idealDimension];
        BOOL v9 = v8 == [(VNSizeRange *)v5 idealDimension];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return [(VNSizeRange *)self idealDimension] ^ __ROR8__([(VNSizeRange *)self maximumDimension] ^ __ROR8__([(VNSizeRange *)self minimumDimension], 51), 51);
}

- (BOOL)isAllowedDimension:(unint64_t)a3
{
  return [(VNSizeRange *)self minimumDimension] <= a3
      && [(VNSizeRange *)self maximumDimension] >= a3;
}

- (VNSizeRange)initWithMinimumDimension:(unint64_t)a3 maximumDimension:(unint64_t)a4 idealDimension:(unint64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)VNSizeRange;
  unint64_t v8 = [(VNSizeRange *)&v12 init];
  BOOL v9 = v8;
  if (v8)
  {
    v8->_minimumDimension = a3;
    v8->_maximumDimension = a4;
    v8->_idealDimension = a5;
    v10 = v8;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end