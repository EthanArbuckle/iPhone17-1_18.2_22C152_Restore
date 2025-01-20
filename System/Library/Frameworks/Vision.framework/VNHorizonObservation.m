@interface VNHorizonObservation
+ (BOOL)supportsSecureCoding;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)transform;
- (CGAffineTransform)transformForImageWidth:(SEL)a3 height:(size_t)width;
- (CGFloat)angle;
- (VNHorizonObservation)initWithCoder:(id)a3;
- (double)angleInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAngle:(double)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation VNHorizonObservation

- (void)setAngle:(double)a3
{
  self->_angle = a3;
}

- (CGFloat)angle
{
  return self->_angle;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.tx = v3;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[2].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].tx;
  return self;
}

- (CGAffineTransform)transformForImageWidth:(SEL)a3 height:(size_t)width
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  double v7 = (double)width;
  *(_OWORD *)&retstr->a = 0u;
  double v8 = (double)height;
  CGAffineTransformMakeTranslation(retstr, (double)width * 0.5, (double)height * 0.5);
  long long v9 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v16.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v16.c = v9;
  *(_OWORD *)&v16.tx = *(_OWORD *)&retstr->tx;
  [(VNHorizonObservation *)self angle];
  CGAffineTransformRotate(&v17, &v16, v10);
  long long v11 = *(_OWORD *)&v17.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v17.a;
  *(_OWORD *)&retstr->c = v11;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v17.tx;
  long long v12 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v15.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v15.c = v12;
  *(_OWORD *)&v15.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformTranslate(&v17, &v15, v7 * -0.5, v8 * -0.5);
  long long v14 = *(_OWORD *)&v17.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v17.a;
  *(_OWORD *)&retstr->c = v14;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v17.tx;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  long long v4 = (VNHorizonObservation *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VNHorizonObservation;
    if ([(VNObservation *)&v13 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      [(VNHorizonObservation *)self transform];
      if (v5) {
        [(VNHorizonObservation *)v5 transform];
      }
      else {
        memset(&v11, 0, sizeof(v11));
      }
      if (CGAffineTransformEqualToTransform(&t1, &v11))
      {
        [(VNHorizonObservation *)self angle];
        double v8 = v7;
        [(VNHorizonObservation *)v5 angle];
        BOOL v6 = v8 == v9;
      }
      else
      {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)VNHorizonObservation;
  id v3 = [(VNObservation *)&v9 hash];
  [(VNHorizonObservation *)self transform];
  uint64_t v4 = VNHashCGAffineTransform((uint64_t)&v8) ^ __ROR8__(v3, 51);
  [(VNHorizonObservation *)self angle];
  double v6 = v5;
  if (v5 == 0.0) {
    double v6 = 0.0;
  }
  return *(void *)&v6 ^ __ROR8__(v4, 51);
}

- (id)vn_cloneObject
{
  v8.receiver = self;
  v8.super_class = (Class)VNHorizonObservation;
  id v3 = [(VNObservation *)&v8 vn_cloneObject];
  uint64_t v4 = v3;
  if (v3)
  {
    long long v5 = *(_OWORD *)&self->_transform.c;
    v7[0] = *(_OWORD *)&self->_transform.a;
    v7[1] = v5;
    v7[2] = *(_OWORD *)&self->_transform.tx;
    [v3 setTransform:v7];
    [v4 setAngle:self->_angle];
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VNHorizonObservation;
  [(VNObservation *)&v7 encodeWithCoder:v4];
  [v4 encodeDouble:@"angle" forKey:self->_angle];
  long long v5 = *(_OWORD *)&self->_transform.c;
  v6[0] = *(_OWORD *)&self->_transform.a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&self->_transform.tx;
  objc_msgSend(v4, "vn_encodeCGAffineTransform:forKey:", v6, @"transform");
}

- (VNHorizonObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VNHorizonObservation;
  long long v5 = [(VNObservation *)&v12 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"angle"];
    v5->_angle = v6;
    if (v4)
    {
      objc_msgSend(v4, "vn_decodeCGAffineTransformForKey:", @"transform");
    }
    else
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long v9 = 0u;
    }
    *(_OWORD *)&v5->_transform.a = v9;
    *(_OWORD *)&v5->_transform.c = v10;
    *(_OWORD *)&v5->_transform.tx = v11;
    objc_super v7 = v5;
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNDetectHorizonRequest";
}

- (double)angleInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4
{
  [(VNHorizonObservation *)self angle];
  double v6 = -result;
  if (((1 << a4) & 0xB4) == 0) {
    double v6 = result;
  }
  if (a4 <= 7) {
    return v6;
  }
  return result;
}

@end