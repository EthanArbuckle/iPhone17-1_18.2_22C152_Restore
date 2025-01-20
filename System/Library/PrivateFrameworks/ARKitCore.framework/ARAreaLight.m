@interface ARAreaLight
+ (BOOL)supportsSecureCoding;
- (ARAreaLight)initWithCoder:(id)a3;
- (ARAreaLight)initWithDirection:(ARAreaLight *)self angularSize:(SEL)a2 color:(float)a3;
- (__n128)color;
- (__n128)direction;
- (float)angularSize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ARAreaLight

- (ARAreaLight)initWithDirection:(ARAreaLight *)self angularSize:(SEL)a2 color:(float)a3
{
  long long v7 = *(_OWORD *)&a3;
  long long v8 = v4;
  float v5 = v3;
  v9.receiver = self;
  v9.super_class = (Class)ARAreaLight;
  result = [(ARAreaLight *)&v9 init];
  if (result)
  {
    result->_angularSize = v5;
    *(_OWORD *)&result->_direction[4] = v7;
    *(_OWORD *)&result->_color[4] = v8;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARAreaLight)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "ar_decodeVector3ForKey:", @"direction");
  double v12 = v5;
  [v4 decodeFloatForKey:@"angularSize"];
  int v7 = v6;
  objc_msgSend(v4, "ar_decodeVector3ForKey:", @"color");
  double v11 = v8;

  LODWORD(v9) = v7;
  return [(ARAreaLight *)self initWithDirection:v12 angularSize:v9 color:v11];
}

- (void)encodeWithCoder:(id)a3
{
  long long v5 = *(_OWORD *)&self->_direction[4];
  id v6 = a3;
  objc_msgSend(v6, "ar_encodeVector3:forKey:", @"direction", *(double *)&v5);
  *(float *)&double v4 = self->_angularSize;
  [v6 encodeFloat:@"angularSize" forKey:v4];
  objc_msgSend(v6, "ar_encodeVector3:forKey:", @"color", *(double *)&self->_color[4]);
}

- (__n128)direction
{
  return a1[1];
}

- (float)angularSize
{
  return self->_angularSize;
}

- (__n128)color
{
  return a1[2];
}

@end