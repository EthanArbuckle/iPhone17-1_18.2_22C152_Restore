@interface CLBIO_Quaternion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLBIO_Quaternion)initWithCoder:(id)a3;
- (CLBIO_Quaternion)initWithX:(double)a3 Y:(double)a4 Z:(double)a5 W:(double)a6;
- (double)W;
- (double)X;
- (double)Y;
- (double)Z;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLBIO_Quaternion

- (CLBIO_Quaternion)initWithX:(double)a3 Y:(double)a4 Z:(double)a5 W:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)CLBIO_Quaternion;
  result = [(CLBIO_Quaternion *)&v11 init];
  if (result)
  {
    result->_X = a3;
    result->_Y = a4;
    result->_Z = a5;
    result->_W = a6;
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
    if (X == v7 && (double Y = self->_Y, [a3 Y], Y == v9) && (Z = self->_Z, objc_msgSend(a3, "Z"), Z == v11))
    {
      double W = self->_W;
      [a3 W];
      LOBYTE(v5) = W == v13;
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
  [(CLBIO_Quaternion *)self X];
  [(CLBIO_Quaternion *)self Y];
  [(CLBIO_Quaternion *)self Z];
  [(CLBIO_Quaternion *)self W];

  return (id)MEMORY[0x1F4181798](v4, sel_initWithX_Y_Z_W_);
}

- (void)encodeWithCoder:(id)a3
{
  [(CLBIO_Quaternion *)self X];
  objc_msgSend(a3, "encodeDouble:forKey:", @"quaternionX");
  [(CLBIO_Quaternion *)self Y];
  objc_msgSend(a3, "encodeDouble:forKey:", @"quaternionY");
  [(CLBIO_Quaternion *)self Z];
  objc_msgSend(a3, "encodeDouble:forKey:", @"quaternionZ");
  [(CLBIO_Quaternion *)self W];

  objc_msgSend(a3, "encodeDouble:forKey:", @"quaternionW");
}

- (CLBIO_Quaternion)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLBIO_Quaternion;
  uint64_t v4 = [(CLBIO_Quaternion *)&v10 init];
  if (v4)
  {
    [a3 decodeDoubleForKey:@"quaternionX"];
    v4->_double X = v5;
    [a3 decodeDoubleForKey:@"quaternionY"];
    v4->_double Y = v6;
    [a3 decodeDoubleForKey:@"quaternionZ"];
    v4->_double Z = v7;
    [a3 decodeDoubleForKey:@"quaternionW"];
    v4->_double W = v8;
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

- (double)W
{
  return self->_W;
}

@end