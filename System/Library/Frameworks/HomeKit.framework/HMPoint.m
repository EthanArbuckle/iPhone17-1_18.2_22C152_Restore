@interface HMPoint
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGPoint)point;
- (HMPoint)initWithCoder:(id)a3;
- (HMPoint)initWithPoint:(CGPoint)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMPoint

- (CGPoint)point
{
  objc_copyStruct(v4, &self->_point, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (HMPoint)initWithCoder:(id)a3
{
  [a3 decodePointForKey:@"HMC.p.ck.point"];

  return -[HMPoint initWithPoint:](self, "initWithPoint:");
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(HMPoint *)self point];
  objc_msgSend(v4, "encodePoint:forKey:", @"HMC.p.ck.point");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMPoint *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      [(HMPoint *)self point];
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      [(HMPoint *)v6 point];
      v16.x = v11;
      v16.y = v12;
      v15.x = v8;
      v15.y = v10;
      BOOL v13 = NSEqualPoints(v15, v16);
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  return v13;
}

- (unint64_t)hash
{
  double v2 = [(HMPoint *)self description];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(HMPoint *)self point];
  v5 = NSStringFromPoint(v9);
  v6 = [v3 stringWithFormat:@"<%@ %@>", v4, v5];

  return v6;
}

- (HMPoint)initWithPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)HMPoint;
  CGPoint result = [(HMPoint *)&v6 init];
  if (result)
  {
    result->_point.CGFloat x = x;
    result->_point.CGFloat y = y;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end