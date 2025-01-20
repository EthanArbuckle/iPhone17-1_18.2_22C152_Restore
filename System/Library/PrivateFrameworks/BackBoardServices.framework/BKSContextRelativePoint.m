@interface BKSContextRelativePoint
+ (BOOL)supportsBSXPCSecureCoding;
- (BKSContextRelativePoint)initWithBSXPCCoder:(id)a3;
- (BKSContextRelativePoint)initWithPoint:(CGPoint)a3 contextID:(unsigned int)a4;
- (BOOL)isEqual:(id)a3;
- (CGPoint)point;
- (unint64_t)hash;
- (unsigned)contextID;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation BKSContextRelativePoint

- (unsigned)contextID
{
  return self->_contextID;
}

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BKSContextRelativePoint)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeCGPointForKey:@"point"];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 decodeInt64ForKey:@"contextID"];

  return -[BKSContextRelativePoint initWithPoint:contextID:](self, "initWithPoint:contextID:", v9, v6, v8);
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  double x = self->_point.x;
  double y = self->_point.y;
  id v6 = a3;
  objc_msgSend(v6, "encodeCGPoint:forKey:", @"point", x, y);
  [v6 encodeInt64:self->_contextID forKey:@"contextID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKSContextRelativePoint *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (unsigned int v5 = [(BKSContextRelativePoint *)self contextID],
          v5 == [(BKSContextRelativePoint *)v4 contextID]))
    {
      [(BKSContextRelativePoint *)self point];
      [(BKSContextRelativePoint *)v4 point];
      char v6 = BSPointEqualToPoint();
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)self->_point.x ^ self->_contextID ^ (unint64_t)self->_point.y;
}

- (BKSContextRelativePoint)initWithPoint:(CGPoint)a3 contextID:(unsigned int)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)BKSContextRelativePoint;
  CGPoint result = [(BKSContextRelativePoint *)&v8 init];
  if (result)
  {
    result->_point.CGFloat x = x;
    result->_point.CGFloat y = y;
    result->_contextID = a4;
  }
  return result;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

@end