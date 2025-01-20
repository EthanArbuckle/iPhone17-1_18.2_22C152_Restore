@interface CLBIO_DeltaVelocity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLBIO_DeltaVelocity)initWithCoder:(id)a3;
- (CLBIO_DeltaVelocity)initWithX:(double)a3 Y:(double)a4 Z:(double)a5;
- (double)X;
- (double)Y;
- (double)Z;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLBIO_DeltaVelocity

- (CLBIO_DeltaVelocity)initWithX:(double)a3 Y:(double)a4 Z:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CLBIO_DeltaVelocity;
  result = [(CLBIO_DeltaVelocity *)&v9 init];
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  [(CLBIO_DeltaVelocity *)self X];
  [(CLBIO_DeltaVelocity *)self Y];
  [(CLBIO_DeltaVelocity *)self Z];

  return (id)MEMORY[0x1F4181798](v4, sel_initWithX_Y_Z_);
}

- (void)encodeWithCoder:(id)a3
{
  [(CLBIO_DeltaVelocity *)self X];
  objc_msgSend(a3, "encodeDouble:forKey:", @"deltaVelocityX");
  [(CLBIO_DeltaVelocity *)self Y];
  objc_msgSend(a3, "encodeDouble:forKey:", @"deltaVelocityY");
  [(CLBIO_DeltaVelocity *)self Z];

  objc_msgSend(a3, "encodeDouble:forKey:", @"deltaVelocityZ");
}

- (CLBIO_DeltaVelocity)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLBIO_DeltaVelocity;
  uint64_t v4 = [(CLBIO_DeltaVelocity *)&v9 init];
  if (v4)
  {
    [a3 decodeDoubleForKey:@"deltaVelocityX"];
    v4->_double X = v5;
    [a3 decodeDoubleForKey:@"deltaVelocityY"];
    v4->_double Y = v6;
    [a3 decodeDoubleForKey:@"deltaVelocityZ"];
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