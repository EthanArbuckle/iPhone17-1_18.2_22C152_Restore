@interface CMAttitude
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CMAttitude)initWithCoder:(id)a3;
- (CMAttitude)initWithQuaternion:(id)a3;
- (CMQuaternion)quaternion;
- (CMRotationMatrix)rotationMatrix;
- (double)pitch;
- (double)roll;
- (double)yaw;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)multiplyByInverseOfAttitude:(CMAttitude *)attitude;
- (void)setQuaternion:(id)a3;
@end

@implementation CMAttitude

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMAttitude;
  [(CMAttitude *)&v3 dealloc];
}

- (CMAttitude)initWithQuaternion:(id)a3
{
  double var3 = a3.var3;
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  v12.receiver = self;
  v12.super_class = (Class)CMAttitude;
  v7 = [(CMAttitude *)&v12 init];
  if (v7)
  {
    v8 = [CMAttitudeInternal alloc];
    v7->_internal = (id)objc_msgSend_initWithQuaternion_(v8, v9, v10, var0, var1, var2, var3);
  }
  return v7;
}

- (void)setQuaternion:(id)a3
{
  objc_msgSend_setQuaternion_(self->_internal, a2, v3, a3.var0, a3.var1, a3.var2, a3.var3);
}

- (CMQuaternion)quaternion
{
  internal = (double *)self->_internal;
  double v3 = internal[3];
  double v4 = internal[4];
  double v6 = internal[1];
  double v5 = internal[2];
  result.w = v6;
  result.z = v4;
  result.y = v3;
  result.x = v5;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMAttitude)initWithCoder:(id)a3
{
  objc_msgSend_decodeDoubleForKey_(a3, a2, @"kCMAttitudeCodingKeyQX");
  objc_msgSend_decodeDoubleForKey_(a3, v5, @"kCMAttitudeCodingKeyQY");
  objc_msgSend_decodeDoubleForKey_(a3, v6, @"kCMAttitudeCodingKeyQZ");
  objc_msgSend_decodeDoubleForKey_(a3, v7, @"kCMAttitudeCodingKeyQW");

  return (CMAttitude *)objc_msgSend_initWithQuaternion_(self, v8, v9);
}

- (void)encodeWithCoder:(id)a3
{
  internal = (double *)self->_internal;
  double v5 = internal[3];
  double v6 = internal[4];
  double v7 = internal[1];
  objc_msgSend_encodeDouble_forKey_(a3, a2, @"kCMAttitudeCodingKeyQX", internal[2]);
  objc_msgSend_encodeDouble_forKey_(a3, v8, @"kCMAttitudeCodingKeyQY", v5);
  objc_msgSend_encodeDouble_forKey_(a3, v9, @"kCMAttitudeCodingKeyQZ", v6);

  objc_msgSend_encodeDouble_forKey_(a3, v10, @"kCMAttitudeCodingKeyQW", v7);
}

- (id)copyWithZone:(_NSZone *)a3
{
  internal = (double *)self->_internal;
  double v5 = objc_opt_class();
  double v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  double v10 = internal[1];
  double v11 = internal[2];
  double v12 = internal[3];
  double v13 = internal[4];

  return (id)objc_msgSend_initWithQuaternion_(v7, v8, v9, v10, v11, v12, v13);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id internal = self->_internal;
  uint64_t v7 = *((void *)a3 + 1);

  return objc_msgSend_isEqual_(internal, v5, v7);
}

- (id)description
{
  double v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  objc_msgSend_pitch(self, v6, v7);
  double v9 = v8 * 57.2957795;
  objc_msgSend_roll(self, v10, v11);
  double v13 = v12 * 57.2957795;
  objc_msgSend_yaw(self, v14, v15);
  return (id)objc_msgSend_stringWithFormat_(v3, v17, @"%@ Pitch: %f, Roll: %f, Yaw: %f\n", v5, *(void *)&v9, *(void *)&v13, v16 * 57.2957795);
}

- (double)roll
{
  return sub_1904F11E0((double *)self->_internal + 1);
}

- (double)pitch
{
  id internal = (double *)self->_internal;
  return asin(internal[1] * (internal[2] + internal[2]) + internal[3] * (internal[4] + internal[4]));
}

- (double)yaw
{
  return sub_1904F1224((double *)self->_internal + 1);
}

- (CMRotationMatrix)rotationMatrix
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  sub_1904F110C((uint64_t)v7, (double *)self->_internal + 1);
  float64x2_t v5 = vcvtq_f64_f32(v7[1]);
  *(float64x2_t *)&retstr->m11 = vcvtq_f64_f32(v7[0]);
  *(float64x2_t *)&retstr->m13 = v5;
  float64x2_t v6 = vcvtq_f64_f32(v7[3]);
  *(float64x2_t *)&retstr->m22 = vcvtq_f64_f32(v7[2]);
  *(float64x2_t *)&retstr->m31 = v6;
  retstr->m33 = v8;
  return result;
}

- (void)multiplyByInverseOfAttitude:(CMAttitude *)attitude
{
  id internal = (double *)self->_internal;
  double v4 = (float64x2_t *)attitude->_internal;
  double v5 = v4[2].f64[0];
  float64x2_t v6 = v4[1];
  float64_t v10 = v4->f64[1];
  float64x2_t v11 = vnegq_f64(v6);
  double v12 = -v5;
  internal[1] = sub_1904F1268(&v10, internal + 1);
  *((void *)internal + 2) = v7;
  *((void *)internal + 3) = v8;
  *((void *)internal + 4) = v9;
}

@end