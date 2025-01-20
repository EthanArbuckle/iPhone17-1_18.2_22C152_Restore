@interface CRXFLiteRXValues
+ (BOOL)supportsSecureCoding;
- (CRXFLiteRXValues)initWithCoder:(id)a3;
- (CRXFLiteRXValues)initWithSphere:(float)a3 cylinder:(float)a4 axis:(unint64_t)a5;
- (float)cylinder;
- (float)sphere;
- (id)description;
- (unint64_t)axis;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRXFLiteRXValues

- (CRXFLiteRXValues)initWithSphere:(float)a3 cylinder:(float)a4 axis:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CRXFLiteRXValues;
  result = [(CRXFLiteRXValues *)&v9 init];
  if (result)
  {
    result->_sphere = a3;
    result->_cylinder = a4;
    result->_axis = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRXFLiteRXValues)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeFloatForKey:@"sph"];
  int v6 = v5;
  [v4 decodeFloatForKey:@"cyl"];
  int v8 = v7;
  uint64_t v9 = [v4 decodeIntegerForKey:@"axis"];

  LODWORD(v10) = v6;
  LODWORD(v11) = v8;
  return [(CRXFLiteRXValues *)self initWithSphere:v9 cylinder:v10 axis:v11];
}

- (void)encodeWithCoder:(id)a3
{
  float sphere = self->_sphere;
  id v7 = a3;
  *(float *)&double v5 = sphere;
  [v7 encodeFloat:@"sph" forKey:v5];
  *(float *)&double v6 = self->_cylinder;
  [v7 encodeFloat:@"cyl" forKey:v6];
  [v7 encodeInteger:self->_axis forKey:@"axis"];
}

- (id)description
{
  v3 = NSString;
  [(CRXFLiteRXValues *)self sphere];
  double v5 = v4;
  [(CRXFLiteRXValues *)self cylinder];
  double v7 = v6;
  int v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRXFLiteRXValues axis](self, "axis"));
  uint64_t v9 = [v3 stringWithFormat:@"sphere:%.02f, cylinder:%.02f, axis:%@", *(void *)&v5, *(void *)&v7, v8];

  return v9;
}

- (float)sphere
{
  return self->_sphere;
}

- (float)cylinder
{
  return self->_cylinder;
}

- (unint64_t)axis
{
  return self->_axis;
}

@end