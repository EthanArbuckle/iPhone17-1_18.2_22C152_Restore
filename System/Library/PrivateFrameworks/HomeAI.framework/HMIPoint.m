@interface HMIPoint
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGPoint)point;
- (HMIPoint)initWithCoder:(id)a3;
- (HMIPoint)initWithPoint:(CGPoint)a3;
- (double)x;
- (double)y;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMIPoint

- (double)x
{
  return self->_point.x;
}

- (double)y
{
  return self->_point.y;
}

- (HMIPoint)initWithPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)HMIPoint;
  result = [(HMIPoint *)&v6 init];
  if (result)
  {
    result->_point.CGFloat x = x;
    result->_point.CGFloat y = y;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  [(HMIPoint *)self point];
  uint64_t v5 = v4;
  [(HMIPoint *)self point];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%0.3f %0.3f>", v5, v6);
}

- (CGPoint)point
{
  objc_copyStruct(v4, &self->_point, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIPoint)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"HMIP.x"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"HMIP.y"];
  double v8 = v7;

  return -[HMIPoint initWithPoint:](self, "initWithPoint:", v6, v8);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(HMIPoint *)self x];
  objc_msgSend(v4, "encodeDouble:forKey:", @"HMIP.x");
  [(HMIPoint *)self y];
  objc_msgSend(v4, "encodeDouble:forKey:", @"HMIP.y");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMIPoint *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(HMIPoint *)v4 point];
      double v6 = v5;
      double v8 = v7;
      [(HMIPoint *)self point];
      BOOL v11 = v8 == v10 && v6 == v9;
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  [(HMIPoint *)self x];
  double v4 = -v3;
  if (v3 >= 0.0) {
    double v4 = v3;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  [(HMIPoint *)self y];
  double v13 = -v12;
  if (v12 >= 0.0) {
    double v13 = v12;
  }
  long double v14 = floor(v13 + 0.5);
  double v15 = (v13 - v14) * 1.84467441e19;
  unint64_t v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  unint64_t v17 = v16 + (unint64_t)v15;
  double v18 = fabs(v15);
  if (v15 <= 0.0) {
    unint64_t v17 = v16;
  }
  unint64_t v19 = v16 - (unint64_t)v18;
  if (v15 >= 0.0) {
    unint64_t v19 = v17;
  }
  return v19 ^ v11;
}

@end