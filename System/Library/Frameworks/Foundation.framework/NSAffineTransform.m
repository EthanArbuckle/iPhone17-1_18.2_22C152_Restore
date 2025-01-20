@interface NSAffineTransform
+ (BOOL)supportsSecureCoding;
+ (NSAffineTransform)transform;
+ (NSAffineTransform)transformWithFlipUsingHeight:(double)a3;
+ (NSAffineTransform)transformWithRotationInDegrees:(double)a3;
+ (NSAffineTransform)transformWithRotationInRadians:(double)a3;
+ (NSAffineTransform)transformWithScale:(double)a3;
+ (NSAffineTransform)transformWithTransformStruct:(id *)a3;
+ (NSAffineTransform)transformWithXScale:(double)a3 yScale:(double)a4;
+ (NSAffineTransform)transformWithXTranslation:(double)a3 yTranslation:(double)a4;
- (BOOL)isEqual:(id)a3;
- (NSAffineTransform)init;
- (NSAffineTransform)initWithCoder:(id)a3;
- (NSAffineTransform)initWithTransform:(NSAffineTransform *)transform;
- (NSAffineTransformStruct)transformStruct;
- (NSPoint)transformPoint:(NSPoint)aPoint;
- (NSSize)transformSize:(NSSize)aSize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)hash;
- (void)appendTransform:(NSAffineTransform *)transform;
- (void)encodeWithCoder:(id)a3;
- (void)invert;
- (void)prependTransform:(NSAffineTransform *)transform;
- (void)rotateByDegrees:(CGFloat)angle;
- (void)rotateByRadians:(CGFloat)angle;
- (void)scaleBy:(CGFloat)scale;
- (void)scaleXBy:(CGFloat)scaleX yBy:(CGFloat)scaleY;
- (void)setTransformStruct:(NSAffineTransformStruct *)transformStruct;
- (void)translateXBy:(CGFloat)deltaX yBy:(CGFloat)deltaY;
@end

@implementation NSAffineTransform

+ (NSAffineTransform)transform
{
  id v2 = objc_alloc_init((Class)a1);

  return (NSAffineTransform *)v2;
}

- (NSAffineTransform)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSAffineTransform;
  result = [(NSAffineTransform *)&v3 init];
  *(_OWORD *)&result->_transformStruct.m11 = NSAffineTransformStructIdentity;
  *(_OWORD *)&result->_transformStruct.m21 = unk_18222DFE0;
  *(_OWORD *)&result->_transformStruct.tX = xmmword_18222DFF0;
  return result;
}

- (NSAffineTransform)initWithTransform:(NSAffineTransform *)transform
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(NSAffineTransform *)self init];
  if (transform) {
    [(NSAffineTransform *)transform transformStruct];
  }
  else {
    memset(v6, 0, sizeof(v6));
  }
  [(NSAffineTransform *)v4 setTransformStruct:v6];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v4 initWithTransform:self];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (objc_opt_isKindOfClass())
  {
    if (a3) {
      [a3 transformStruct];
    }
    if (self->_transformStruct.m11 == 0.0
      && self->_transformStruct.m12 == 0.0
      && self->_transformStruct.m21 == 0.0
      && self->_transformStruct.m22 == 0.0
      && self->_transformStruct.tX == 0.0)
    {
      return self->_transformStruct.tY == 0.0;
    }
  }
  return 0;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_transformStruct.m11
                          + self->_transformStruct.m12
                          + self->_transformStruct.m21
                          + self->_transformStruct.m22
                          + self->_transformStruct.tX
                          + self->_transformStruct.tY);
}

- (void)translateXBy:(CGFloat)deltaX yBy:(CGFloat)deltaY
{
  *(float64x2_t *)&self->_transformStruct.tX = vaddq_f64(*(float64x2_t *)&self->_transformStruct.tX, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->_transformStruct.m21, deltaY), *(float64x2_t *)&self->_transformStruct.m11, deltaX));
}

- (void)rotateByDegrees:(CGFloat)angle
{
  double m11 = self->_transformStruct.m11;
  double m12 = self->_transformStruct.m12;
  double m21 = self->_transformStruct.m21;
  double m22 = self->_transformStruct.m22;
  double tX = self->_transformStruct.tX;
  double tY = self->_transformStruct.tY;
  __double2 v10 = __sincos_stret(angle * 3.14159265 / 180.0);
  self->_transformStruct.double m11 = v10.__sinval * m21 + v10.__cosval * m11;
  self->_transformStruct.double m12 = v10.__sinval * m22 + v10.__cosval * m12;
  self->_transformStruct.double m21 = v10.__cosval * m21 - v10.__sinval * m11;
  self->_transformStruct.double m22 = v10.__cosval * m22 - v10.__sinval * m12;
  self->_transformStruct.double tX = m21 * 0.0 + m11 * 0.0 + tX;
  self->_transformStruct.double tY = m22 * 0.0 + m12 * 0.0 + tY;
}

- (void)rotateByRadians:(CGFloat)angle
{
  double m11 = self->_transformStruct.m11;
  double m12 = self->_transformStruct.m12;
  double m21 = self->_transformStruct.m21;
  double m22 = self->_transformStruct.m22;
  double tX = self->_transformStruct.tX;
  double tY = self->_transformStruct.tY;
  __double2 v10 = __sincos_stret(angle);
  self->_transformStruct.double m11 = v10.__sinval * m21 + v10.__cosval * m11;
  self->_transformStruct.double m12 = v10.__sinval * m22 + v10.__cosval * m12;
  self->_transformStruct.double m21 = v10.__cosval * m21 - v10.__sinval * m11;
  self->_transformStruct.double m22 = v10.__cosval * m22 - v10.__sinval * m12;
  self->_transformStruct.double tX = m21 * 0.0 + m11 * 0.0 + tX;
  self->_transformStruct.double tY = m22 * 0.0 + m12 * 0.0 + tY;
}

- (void)scaleBy:(CGFloat)scale
{
  *(float64x2_t *)&self->_transformStruct.double m11 = vmulq_n_f64(*(float64x2_t *)&self->_transformStruct.m11, scale);
  *(float64x2_t *)&self->_transformStruct.double m21 = vmulq_n_f64(*(float64x2_t *)&self->_transformStruct.m21, scale);
}

- (void)scaleXBy:(CGFloat)scaleX yBy:(CGFloat)scaleY
{
  *(float64x2_t *)&self->_transformStruct.double m11 = vmulq_n_f64(*(float64x2_t *)&self->_transformStruct.m11, scaleX);
  *(float64x2_t *)&self->_transformStruct.double m21 = vmulq_n_f64(*(float64x2_t *)&self->_transformStruct.m21, scaleY);
}

- (void)invert
{
  v9[6] = *(double *)MEMORY[0x1E4F143B8];
  double m11 = self->_transformStruct.m11;
  double m12 = self->_transformStruct.m12;
  double m21 = self->_transformStruct.m21;
  double m22 = self->_transformStruct.m22;
  double v6 = m11 * m22 - m12 * m21;
  if (fabs(v6) <= 2.22044605e-16) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"NSAffineTransform: Transform has no inverse" userInfo:0]);
  }
  double tX = self->_transformStruct.tX;
  double tY = self->_transformStruct.tY;
  v9[0] = m22 / v6;
  v9[1] = -m12 / v6;
  v9[2] = -m21 / v6;
  v9[3] = m11 / v6;
  v9[4] = (m21 * tY - m22 * tX) / v6;
  v9[5] = (m12 * tX - m11 * tY) / v6;
  [(NSAffineTransform *)self setTransformStruct:v9];
}

- (void)appendTransform:(NSAffineTransform *)transform
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (transform)
  {
    [(NSAffineTransform *)transform transformStruct];
    double v5 = v16;
    double v4 = v17;
    double v7 = v18;
    double v6 = v19;
    double v9 = v20;
    double v8 = v21;
  }
  else
  {
    double v8 = 0.0;
    double v9 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
    double v4 = 0.0;
    double v5 = 0.0;
  }
  double m11 = self->_transformStruct.m11;
  double m12 = self->_transformStruct.m12;
  double m21 = self->_transformStruct.m21;
  double m22 = self->_transformStruct.m22;
  double tX = self->_transformStruct.tX;
  double tY = self->_transformStruct.tY;
  double v16 = v7 * m12 + m11 * v5;
  double v17 = v6 * m12 + m11 * v4;
  double v18 = v7 * m22 + m21 * v5;
  double v19 = v6 * m22 + m21 * v4;
  double v20 = v9 + v7 * tY + tX * v5;
  double v21 = v8 + v6 * tY + tX * v4;
  [(NSAffineTransform *)self setTransformStruct:&v16];
}

- (void)prependTransform:(NSAffineTransform *)transform
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (transform)
  {
    [(NSAffineTransform *)transform transformStruct];
    double v4 = v20;
    double v5 = v21;
    double v6 = v22;
    double v7 = v23;
    double v9 = v24;
    double v8 = v25;
  }
  else
  {
    double v8 = 0.0;
    double v9 = 0.0;
    double v7 = 0.0;
    double v6 = 0.0;
    double v5 = 0.0;
    double v4 = 0.0;
  }
  double m11 = self->_transformStruct.m11;
  double m12 = self->_transformStruct.m12;
  double m21 = self->_transformStruct.m21;
  double m22 = self->_transformStruct.m22;
  double tY = self->_transformStruct.tY;
  double v15 = v5 * m21 + v4 * m11;
  double v16 = v5 * m22 + v4 * m12;
  double v17 = v7 * m21 + v6 * m11;
  double v18 = v7 * m22 + v6 * m12;
  double v19 = v8 * m21 + v9 * m11 + self->_transformStruct.tX;
  double v20 = v15;
  double v21 = v16;
  double v22 = v17;
  double v23 = v18;
  double v24 = v19;
  double v25 = v8 * m22 + v9 * m12 + tY;
  [(NSAffineTransform *)self setTransformStruct:&v20];
}

- (NSPoint)transformPoint:(NSPoint)aPoint
{
  float64x2_t v3 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->_transformStruct.m21, aPoint.y), *(float64x2_t *)&self->_transformStruct.m11, aPoint.x), *(float64x2_t *)&self->_transformStruct.tX);
  double v4 = v3.f64[1];
  result.x = v3.f64[0];
  result.y = v4;
  return result;
}

- (NSSize)transformSize:(NSSize)aSize
{
  CGFloat v3 = aSize.height * self->_transformStruct.m21 + self->_transformStruct.m11 * aSize.width;
  double v4 = aSize.height * self->_transformStruct.m22 + self->_transformStruct.m12 * aSize.width;
  double v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (NSAffineTransformStruct)transformStruct
{
  long long v3 = *(_OWORD *)&self->m22;
  *(_OWORD *)&retstr->double m11 = *(_OWORD *)&self->m12;
  *(_OWORD *)&retstr->double m21 = v3;
  *(_OWORD *)&retstr->double tX = *(_OWORD *)&self->tY;
  return self;
}

- (void)setTransformStruct:(NSAffineTransformStruct *)transformStruct
{
  long long v3 = *(_OWORD *)&transformStruct->m11;
  long long v4 = *(_OWORD *)&transformStruct->m21;
  *(_OWORD *)&self->_transformStruct.double tX = *(_OWORD *)&transformStruct->tX;
  *(_OWORD *)&self->_transformStruct.double m21 = v4;
  *(_OWORD *)&self->_transformStruct.double m11 = v3;
}

- (void)encodeWithCoder:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (![a3 allowsKeyedCoding])
  {
    float32x4_t v19 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_transformStruct.m11), *(float64x2_t *)&self->_transformStruct.m21);
    v20[0] = vcvt_f32_f64(*(float64x2_t *)&self->_transformStruct.tX);
    [a3 encodeArrayOfObjCType:"f" count:6 at:&v19];
    return;
  }
  float64x2_t v5 = *(float64x2_t *)&self->_transformStruct.m11;
  v6.f64[0] = self->_transformStruct.m21;
  if (self->_transformStruct.m12 != 0.0 || v6.f64[0] != 0.0)
  {
    v6.f64[1] = self->_transformStruct.m22;
    float32x4_t v19 = (float32x4_t)vrev32q_s8((int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v5), v6));
    double tY = self->_transformStruct.tY;
    *(float *)&unsigned int v15 = self->_transformStruct.tX;
    LODWORD(v20[0]) = bswap32(v15);
    v13 = (char *)v20 + 4;
    uint64_t v14 = 24;
LABEL_14:
    *(float *)&unsigned int v16 = tY;
    *(_DWORD *)v13 = bswap32(v16);
    [a3 encodeBytes:&v19 length:v14 forKey:@"NSTransformStruct"];
    return;
  }
  double tX = self->_transformStruct.tX;
  double tY = self->_transformStruct.tY;
  double m22 = self->_transformStruct.m22;
  BOOL v10 = tX != 0.0;
  if (tY != 0.0) {
    BOOL v10 = 1;
  }
  if (v5.f64[0] != 1.0 || m22 != 1.0)
  {
    if (v10)
    {
      v5.f64[1] = self->_transformStruct.m22;
      *(int8x8_t *)v19.f32 = vrev32_s8((int8x8_t)vcvt_f32_f64(v5));
      *(float *)&unsigned int v12 = tX;
      v19.i32[2] = bswap32(v12);
      v13 = (__int8 *)((unint64_t)&v19 | 0xC);
      uint64_t v14 = 16;
    }
    else
    {
      v19.i8[0] = 2;
      *(float *)&unsigned int v18 = v5.f64[0];
      *(__int32 *)((char *)v19.i32 + 1) = bswap32(v18);
      v13 = &v19.i8[5];
      uint64_t v14 = 9;
      double tY = m22;
    }
    goto LABEL_14;
  }
  if (v10)
  {
    v19.i8[0] = 1;
    *(float *)&unsigned int v17 = tX;
    *(__int32 *)((char *)v19.i32 + 1) = bswap32(v17);
    v13 = &v19.i8[5];
    uint64_t v14 = 9;
    goto LABEL_14;
  }
}

- (NSAffineTransform)initWithCoder:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  long long v4 = [(NSAffineTransform *)self init];
  if ([a3 allowsKeyedCoding])
  {
    v15[0] = 0;
    float64x2_t v5 = (unsigned int *)[a3 decodeBytesForKey:@"NSTransformStruct" returnedLength:v15];
    if (v5 && *(void *)v15)
    {
      switch((unint64_t)v15[0])
      {
        case 9uLL:
          int v8 = *(unsigned __int8 *)v5;
          if (v8 == 2)
          {
            v4->_transformStruct.double m11 = COERCE_FLOAT(bswap32(*(unsigned int *)((char *)v5 + 1)));
            v4->_transformStruct.double m12 = 0.0;
            v4->_transformStruct.double m21 = 0.0;
            v4->_transformStruct.double m22 = COERCE_FLOAT(bswap32(*(unsigned int *)((char *)v5 + 5)));
            v4->_transformStruct.double tX = 0.0;
            v4->_transformStruct.double tY = 0.0;
            return v4;
          }
          if (v8 == 1)
          {
            v4->_transformStruct.double m11 = 1.0;
            v4->_transformStruct.double m12 = 0.0;
            v4->_transformStruct.double m21 = 0.0;
            v4->_transformStruct.double m22 = 1.0;
            v4->_transformStruct.double tX = COERCE_FLOAT(bswap32(*(unsigned int *)((char *)v5 + 1)));
            unsigned int v6 = *(unsigned int *)((char *)v5 + 5);
            goto LABEL_13;
          }

          v13 = +[NSString stringWithFormat:@"Unexpected encode state: %lu", *(void *)v15];
          unsigned int v18 = @"NSLocalizedDescription";
          v19[0] = v13;
          BOOL v10 = (void *)MEMORY[0x1E4F1C9E8];
          v11 = (NSString **)v19;
          unsigned int v12 = &v18;
          break;
        case 0x10uLL:
          v4->_transformStruct.double m11 = COERCE_FLOAT(bswap32(*v5));
          v4->_transformStruct.double m12 = 0.0;
          v4->_transformStruct.double m21 = 0.0;
          v4->_transformStruct.double m22 = COERCE_FLOAT(bswap32(v5[1]));
          v4->_transformStruct.double tX = COERCE_FLOAT(bswap32(v5[2]));
          unsigned int v6 = v5[3];
          goto LABEL_13;
        case 0x18uLL:
          v4->_transformStruct.double m11 = COERCE_FLOAT(bswap32(*v5));
          v4->_transformStruct.double m12 = COERCE_FLOAT(bswap32(v5[1]));
          v4->_transformStruct.double m21 = COERCE_FLOAT(bswap32(v5[2]));
          v4->_transformStruct.double m22 = COERCE_FLOAT(bswap32(v5[3]));
          v4->_transformStruct.double tX = COERCE_FLOAT(bswap32(v5[4]));
          unsigned int v6 = v5[5];
LABEL_13:
          v4->_transformStruct.double tY = COERCE_FLOAT(bswap32(v6));
          return v4;
        default:

          double v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Unexpected byte length: %@", +[NSNumber numberWithUnsignedInteger:*(void *)v15]);
          unsigned int v16 = @"NSLocalizedDescription";
          unsigned int v17 = v9;
          BOOL v10 = (void *)MEMORY[0x1E4F1C9E8];
          v11 = &v17;
          unsigned int v12 = &v16;
          break;
      }
      objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1)));
      return 0;
    }
  }
  else
  {
    [a3 decodeArrayOfObjCType:"f" count:6 at:v15];
    *(float64x2_t *)&v4->_transformStruct.double m11 = vcvtq_f64_f32(v15[0]);
    float32x2_t v7 = v15[2];
    *(float64x2_t *)&v4->_transformStruct.double m21 = vcvtq_f64_f32(v15[1]);
    *(float64x2_t *)&v4->_transformStruct.double tX = vcvtq_f64_f32(v7);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugDescription
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSAffineTransform;
  return +[NSString stringWithFormat:@"%@ {m11:%g m12:%g m21:%g m22:%g tX:%g tY:%g\n"], [(NSAffineTransform *)&v3 debugDescription], *(void *)&self->_transformStruct.m11, *(void *)&self->_transformStruct.m12, *(void *)&self->_transformStruct.m21, *(void *)&self->_transformStruct.m22, *(void *)&self->_transformStruct.tX, *(void *)&self->_transformStruct.tY);
}

+ (NSAffineTransform)transformWithScale:(double)a3
{
  v6[6] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init((Class)a1);
  *(double *)unsigned int v6 = a3;
  v6[1] = 0;
  v6[2] = 0;
  *(double *)&_OWORD v6[3] = a3;
  v6[4] = 0;
  v6[5] = 0;
  [v4 setTransformStruct:v6];
  return (NSAffineTransform *)v4;
}

+ (NSAffineTransform)transformWithXScale:(double)a3 yScale:(double)a4
{
  v8[6] = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init((Class)a1);
  *(double *)int v8 = a3;
  v8[1] = 0;
  v8[2] = 0;
  *(double *)&v8[3] = a4;
  v8[4] = 0;
  v8[5] = 0;
  [v6 setTransformStruct:v8];
  return (NSAffineTransform *)v6;
}

+ (NSAffineTransform)transformWithXTranslation:(double)a3 yTranslation:(double)a4
{
  v8[6] = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init((Class)a1);
  v8[0] = 0x3FF0000000000000;
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = 0x3FF0000000000000;
  *(double *)&v8[4] = a3;
  *(double *)&v8[5] = a4;
  [v6 setTransformStruct:v8];
  return (NSAffineTransform *)v6;
}

+ (NSAffineTransform)transformWithRotationInDegrees:(double)a3
{
  v7[6] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init((Class)a1);
  __double2 v5 = __sincos_stret(a3 * 3.14159265 / 180.0);
  v7[0] = *(void *)&v5.__cosval;
  v7[1] = *(void *)&v5.__sinval;
  *(double *)&v7[2] = -v5.__sinval;
  v7[3] = *(void *)&v5.__cosval;
  v7[4] = 0;
  v7[5] = 0;
  [v4 setTransformStruct:v7];
  return (NSAffineTransform *)v4;
}

+ (NSAffineTransform)transformWithRotationInRadians:(double)a3
{
  v7[6] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init((Class)a1);
  __double2 v5 = __sincos_stret(a3);
  v7[0] = *(void *)&v5.__cosval;
  v7[1] = *(void *)&v5.__sinval;
  *(double *)&v7[2] = -v5.__sinval;
  v7[3] = *(void *)&v5.__cosval;
  v7[4] = 0;
  v7[5] = 0;
  [v4 setTransformStruct:v7];
  return (NSAffineTransform *)v4;
}

+ (NSAffineTransform)transformWithTransformStruct:(id *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init((Class)a1);
  long long v5 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->var4;
  [v4 setTransformStruct:v7];
  return (NSAffineTransform *)v4;
}

+ (NSAffineTransform)transformWithFlipUsingHeight:(double)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init((Class)a1);
  v6[1] = 0;
  v6[2] = 0;
  v6[0] = 0x3FF0000000000000;
  long long v7 = xmmword_18222DFC0;
  double v8 = a3;
  [v4 setTransformStruct:v6];
  return (NSAffineTransform *)v4;
}

@end