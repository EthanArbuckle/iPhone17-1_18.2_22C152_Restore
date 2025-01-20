@interface CLBIO_DeltaPosition
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (CLBIO_DeltaPosition)initWithCoder:(id)a3;
- (CLBIO_DeltaPosition)initWithX:(double)a3 Y:(double)a4 Z:(double)a5;
- (double)X;
- (double)Y;
- (double)Z;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLBIO_DeltaPosition

- (CLBIO_DeltaPosition)initWithX:(double)a3 Y:(double)a4 Z:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CLBIO_DeltaPosition;
  result = [(CLBIO_DeltaPosition *)&v9 init];
  if (result)
  {
    result->_X = a3;
    result->_Y = a4;
    result->_Z = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    double X = self->_X;
    [a3 X];
    if (X == v7 && (double Y = self->_Y, [a3 Y], Y == v9))
    {
      double Z = self->_Z;
      [a3 Z];
      LOBYTE(v5) = Z == v11;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)isValid
{
  BOOL result = 0;
  if (fabs(self->_X) != INFINITY)
  {
    double v4 = fabs(self->_Y);
    return v4 > INFINITY || v4 < INFINITY;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  [(CLBIO_DeltaPosition *)self X];
  [(CLBIO_DeltaPosition *)self Y];
  [(CLBIO_DeltaPosition *)self Z];

  return (id)MEMORY[0x1F4181798](v4, sel_initWithX_Y_Z_);
}

- (void)encodeWithCoder:(id)a3
{
  [(CLBIO_DeltaPosition *)self X];
  objc_msgSend(a3, "encodeDouble:forKey:", @"deltaPositionX");
  [(CLBIO_DeltaPosition *)self Y];
  objc_msgSend(a3, "encodeDouble:forKey:", @"deltaPositionY");
  [(CLBIO_DeltaPosition *)self Z];

  objc_msgSend(a3, "encodeDouble:forKey:", @"deltaPositionZ");
}

- (CLBIO_DeltaPosition)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLBIO_DeltaPosition;
  uint64_t v4 = [(CLBIO_DeltaPosition *)&v9 init];
  if (v4)
  {
    [a3 decodeDoubleForKey:@"deltaPositionX"];
    v4->_double X = v5;
    [a3 decodeDoubleForKey:@"deltaPositionY"];
    v4->_double Y = v6;
    [a3 decodeDoubleForKey:@"deltaPositionZ"];
    v4->_double Z = v7;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)X
{
  return self->_X;
}

- (double)Y
{
  return self->_Y;
}

- (double)Z
{
  return self->_Z;
}

@end