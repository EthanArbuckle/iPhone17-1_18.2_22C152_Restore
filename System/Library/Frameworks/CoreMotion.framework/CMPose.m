@interface CMPose
+ (BOOL)supportsSecureCoding;
- ($1AB5FA073B851C12C2339EC22442E995)translation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPose:(id)a3;
- (CMAttitude)attitude;
- (CMPose)initWithCoder:(id)a3;
- (CMPose)initWithPose:(id *)a3 timestamp:(double)a4;
- (double)consumedAuxTimestamp;
- (double)machAbsTimestamp;
- (double)receivedAuxTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMPose

- (CMPose)initWithPose:(id *)a3 timestamp:(double)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CMPose;
  v5 = [(CMLogItem *)&v12 initWithTimestamp:a4];
  if (v5)
  {
    v6 = [CMPoseInternal alloc];
    long long v7 = *(_OWORD *)&a3->var1.var2;
    v11[2] = *(_OWORD *)&a3->var1.var0;
    v11[3] = v7;
    v11[4] = *(_OWORD *)&a3->var3;
    long long v8 = *(_OWORD *)&a3->var0.var2;
    v11[0] = *(_OWORD *)&a3->var0.var0;
    v11[1] = v8;
    v5->_internal = (id)objc_msgSend_initWithPose_(v6, v9, (uint64_t)v11);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMPose)initWithCoder:(id)a3
{
  v39.receiver = self;
  v39.super_class = (Class)CMPose;
  v5 = -[CMLogItem initWithCoder:](&v39, sel_initWithCoder_);
  if (v5)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, @"kCMPoseCodingKeyQuaternionW");
    uint64_t v37 = v6;
    objc_msgSend_decodeDoubleForKey_(a3, v7, @"kCMPoseCodingKeyQuaternionX");
    uint64_t v36 = v8;
    objc_msgSend_decodeDoubleForKey_(a3, v9, @"kCMPoseCodingKeyQuaternionY");
    uint64_t v11 = v10;
    objc_msgSend_decodeDoubleForKey_(a3, v12, @"kCMPoseCodingKeyQuaternionZ");
    uint64_t v14 = v13;
    objc_msgSend_decodeDoubleForKey_(a3, v15, @"kCMPoseCodingKeyTranslationX");
    uint64_t v17 = v16;
    objc_msgSend_decodeDoubleForKey_(a3, v18, @"kCMPoseCodingKeyTranslationY");
    uint64_t v20 = v19;
    objc_msgSend_decodeDoubleForKey_(a3, v21, @"kCMPoseCodingKeyTranslationZ");
    uint64_t v23 = v22;
    objc_msgSend_decodeDoubleForKey_(a3, v24, @"kCMPoseCodingKeyConsumedAuxTimestamp");
    uint64_t v26 = v25;
    objc_msgSend_decodeDoubleForKey_(a3, v27, @"kCMPoseCodingKeyReceivedAuxTimestamp");
    uint64_t v29 = v28;
    objc_msgSend_decodeDoubleForKey_(a3, v30, @"kCMPoseCodingKeyMachAbsTimestamp");
    uint64_t v32 = v31;
    v33 = [CMPoseInternal alloc];
    v38[0] = v37;
    v38[1] = v36;
    v38[2] = v11;
    v38[3] = v14;
    v38[4] = v17;
    v38[5] = v20;
    v38[6] = v23;
    v38[7] = v26;
    v38[8] = v29;
    v38[9] = v32;
    v5->_internal = (id)objc_msgSend_initWithPose_(v33, v34, (uint64_t)v38);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)CMPose;
  -[CMLogItem encodeWithCoder:](&v24, sel_encodeWithCoder_);
  internal = (void **)self->_internal;
  objc_msgSend_quaternion(internal[1], v6, v7);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  objc_msgSend_encodeDouble_forKey_(a3, v14, @"kCMPoseCodingKeyQuaternionX");
  objc_msgSend_encodeDouble_forKey_(a3, v15, @"kCMPoseCodingKeyQuaternionY", v9);
  objc_msgSend_encodeDouble_forKey_(a3, v16, @"kCMPoseCodingKeyQuaternionZ", v11);
  objc_msgSend_encodeDouble_forKey_(a3, v17, @"kCMPoseCodingKeyQuaternionW", v13);
  objc_msgSend_encodeDouble_forKey_(a3, v18, @"kCMPoseCodingKeyTranslationX", *((double *)internal + 2));
  objc_msgSend_encodeDouble_forKey_(a3, v19, @"kCMPoseCodingKeyTranslationY", *((double *)internal + 3));
  objc_msgSend_encodeDouble_forKey_(a3, v20, @"kCMPoseCodingKeyTranslationZ", *((double *)internal + 4));
  objc_msgSend_encodeDouble_forKey_(a3, v21, @"kCMPoseCodingKeyConsumedAuxTimestamp", *((double *)internal + 5));
  objc_msgSend_encodeDouble_forKey_(a3, v22, @"kCMPoseCodingKeyReceivedAuxTimestamp", *((double *)internal + 6));
  objc_msgSend_encodeDouble_forKey_(a3, v23, @"kCMPoseCodingKeyMachAbsTimestamp", *((double *)internal + 7));
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMPose;
  [(CMLogItem *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CMPose;
  uint64_t v6 = -[CMLogItem copyWithZone:](&v8, sel_copyWithZone_);
  if (v6) {
    v6[2] = objc_msgSend_copyWithZone_(self->_internal, v5, (uint64_t)a3);
  }
  return v6;
}

- (BOOL)isEqualToPose:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_msgSend_timestamp(self, a2, (uint64_t)a3);
  double v6 = v5;
  objc_msgSend_timestamp(a3, v7, v8);
  if (v6 != v10) {
    return 0;
  }
  id internal = self->_internal;
  uint64_t v12 = *((void *)a3 + 2);

  return objc_msgSend_isEqual_(internal, v9, v12);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return MEMORY[0x1F4181798](self, sel_isEqualToPose_, a3);
}

- (id)description
{
  id internal = (void **)self->_internal;
  double v5 = NSString;
  objc_msgSend_quaternion(internal[1], a2, v2);
  uint64_t v7 = v6;
  objc_msgSend_quaternion(internal[1], v8, v9);
  uint64_t v11 = v10;
  objc_msgSend_quaternion(internal[1], v12, v13);
  uint64_t v15 = v14;
  objc_msgSend_quaternion(internal[1], v16, v17);
  uint64_t v19 = v18;
  long long v25 = *((_OWORD *)internal + 2);
  long long v26 = *((_OWORD *)internal + 1);
  uint64_t v20 = internal[6];
  v21 = internal[7];
  v27.receiver = self;
  v27.super_class = (Class)CMPose;
  [(CMLogItem *)&v27 timestamp];
  return (id)objc_msgSend_stringWithFormat_(v5, v22, @"CMPose,q.x,%f,q.y,%f,q.z,%f,q.w,%f,translation.x,%f,translation.y,%f,translation.z,%f,consumedAuxTimestamp,%f,receivedAuxTimestamp,%f,machAbsTimestamp,%f,timestamp,%f", v7, v11, v15, v19, v26, v25, v20, v21, v23);
}

- (CMAttitude)attitude
{
  return (CMAttitude *)*((void *)self->_internal + 1);
}

- ($1AB5FA073B851C12C2339EC22442E995)translation
{
  id internal = (double *)self->_internal;
  double v3 = internal[2];
  double v4 = internal[3];
  double v5 = internal[4];
  result.var2 = v5;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (double)consumedAuxTimestamp
{
  return *((double *)self->_internal + 5);
}

- (double)receivedAuxTimestamp
{
  return *((double *)self->_internal + 6);
}

- (double)machAbsTimestamp
{
  return *((double *)self->_internal + 7);
}

@end