@interface CMDeviceMotionLite
+ (BOOL)supportsSecureCoding;
- ($1AB5FA073B851C12C2339EC22442E995)gravity;
- ($1AB5FA073B851C12C2339EC22442E995)rawAcceleration;
- ($1AB5FA073B851C12C2339EC22442E995)rawMagneticField;
- ($1AB5FA073B851C12C2339EC22442E995)rawRotationRate;
- ($1AB5FA073B851C12C2339EC22442E995)rotationRate;
- ($1AB5FA073B851C12C2339EC22442E995)userAcceleration;
- (BOOL)isUsingCompass;
- (CMAttitude)attitude;
- (CMDeviceMotionLite)initWithCoder:(id)a3;
- (CMDeviceMotionLite)initWithDeviceMotionLite:(id *)a3 andDeviceID:(id)a4;
- (NSString)physicalDeviceUniqueID;
- (float)compassTemperature;
- (float)gyroTemperature;
- (float)tilt;
- (float)tip;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)machTimestamp;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMDeviceMotionLite

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMDeviceMotionLite)initWithDeviceMotionLite:(id *)a3 andDeviceID:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)CMDeviceMotionLite;
  v6 = [(CMDeviceMotionLite *)&v20 init];
  if (v6)
  {
    v7 = [CMAttitude alloc];
    *((void *)v6 + 3) = objc_msgSend_initWithQuaternion_(v7, v8, v9, a3->var0.var0, a3->var0.var1, a3->var0.var2, a3->var0.var3);
    *((double *)v6 + 6) = sub_1902DAF50(&a3->var0.var0);
    *((double *)v6 + 7) = v10;
    *((double *)v6 + 8) = v11;
    float32x2_t v12 = *(float32x2_t *)&a3->var1.var2;
    *(float64x2_t *)(v6 + 72) = vcvtq_f64_f32(*(float32x2_t *)&a3->var1.var0);
    *(float64x2_t *)(v6 + 88) = vcvtq_f64_f32(v12);
    float32x2_t v13 = *(float32x2_t *)&a3->var3.var0;
    *(float64x2_t *)(v6 + 104) = vcvtq_f64_f32(*(float32x2_t *)&a3->var2.var1);
    *(float64x2_t *)(v6 + 120) = vcvtq_f64_f32(v13);
    float32x2_t v14 = *(float32x2_t *)&a3->var4.var1;
    *(float64x2_t *)(v6 + 136) = vcvtq_f64_f32(*(float32x2_t *)&a3->var3.var2);
    *(float64x2_t *)(v6 + 152) = vcvtq_f64_f32(v14);
    *((void *)v6 + 5) = a3->var5;
    v6[8] = a3->var6;
    *((void *)v6 + 4) = objc_msgSend_copy(a4, v15, v16);
    *((_DWORD *)v6 + 3) = LODWORD(a3->var7);
    *((_DWORD *)v6 + 4) = LODWORD(a3->var8);
    double var2 = a3->var9.var2;
    *(float64x2_t *)(v6 + 168) = vcvtq_f64_f32(*(float32x2_t *)&a3->var9.var0);
    *((double *)v6 + 23) = var2;
  }
  if (qword_1EB3BF758 != -1) {
    dispatch_once(&qword_1EB3BF758, &unk_1EDFD2A20);
  }
  if (byte_1EB3BF750) {
    BOOL v18 = byte_1EB3BF751 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18)
  {
    mach_absolute_time();
    kdebug_trace();
  }
  return (CMDeviceMotionLite *)v6;
}

- (CMDeviceMotionLite)initWithCoder:(id)a3
{
  if (objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3))
  {
    char v97 = 0;
    __int16 v96 = 0;
    int v105 = 0;
    char v106 = 0;
    objc_msgSend_decodeDoubleForKey_(a3, v5, @"kCMDeviceMotionLiteCodingKeyQuaternionW");
    uint64_t v80 = v6;
    objc_msgSend_decodeDoubleForKey_(a3, v7, @"kCMDeviceMotionLiteCodingKeyQuaternionX");
    uint64_t v79 = v8;
    objc_msgSend_decodeDoubleForKey_(a3, v9, @"kCMDeviceMotionLiteCodingKeyQuaternionY");
    uint64_t v78 = v10;
    objc_msgSend_decodeDoubleForKey_(a3, v11, @"kCMDeviceMotionLiteCodingKeyQuaternionZ");
    uint64_t v77 = v12;
    objc_msgSend_decodeFloatForKey_(a3, v13, @"kCMDeviceMotionLiteCodingKeyUserAccelerationX");
    int v76 = v14;
    objc_msgSend_decodeFloatForKey_(a3, v15, @"kCMDeviceMotionLiteCodingKeyUserAccelerationY");
    int v75 = v16;
    objc_msgSend_decodeFloatForKey_(a3, v17, @"kCMDeviceMotionLiteCodingKeyUserAccelerationZ");
    int v74 = v18;
    objc_msgSend_decodeFloatForKey_(a3, v19, @"kCMDeviceMotionLiteCodingKeyRotationRateX");
    int v73 = v20;
    objc_msgSend_decodeFloatForKey_(a3, v21, @"kCMDeviceMotionLiteCodingKeyRotationRateY");
    int v72 = v22;
    objc_msgSend_decodeFloatForKey_(a3, v23, @"kCMDeviceMotionLiteCodingKeyRotationRateZ");
    int v71 = v24;
    objc_msgSend_decodeFloatForKey_(a3, v25, @"kCMDeviceMotionLiteCodingKeyRawAccelerationX");
    int v70 = v26;
    objc_msgSend_decodeFloatForKey_(a3, v27, @"kCMDeviceMotionLiteCodingKeyRawAccelerationY");
    int v69 = v28;
    objc_msgSend_decodeFloatForKey_(a3, v29, @"kCMDeviceMotionLiteCodingKeyRawAccelerationZ");
    int v68 = v30;
    objc_msgSend_decodeFloatForKey_(a3, v31, @"kCMDeviceMotionLiteCodingKeyRawRotationRateX");
    int v33 = v32;
    objc_msgSend_decodeFloatForKey_(a3, v34, @"kCMDeviceMotionLiteCodingKeyRawRotationRateY");
    int v36 = v35;
    objc_msgSend_decodeFloatForKey_(a3, v37, @"kCMDeviceMotionLiteCodingKeyRawRotationRateZ");
    int v39 = v38;
    uint64_t v40 = objc_opt_class();
    v42 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v41, v40, @"kCMDeviceMotionLiteCodingKeyMachTimestamp");
    uint64_t v45 = objc_msgSend_unsignedLongLongValue(v42, v43, v44);
    char v47 = objc_msgSend_decodeBoolForKey_(a3, v46, @"kCMDeviceMotionLiteCodingKeyUsingCompass");
    objc_msgSend_decodeFloatForKey_(a3, v48, @"kCMDeviceMotionLiteCodingKeyGyroTemperature");
    int v50 = v49;
    objc_msgSend_decodeFloatForKey_(a3, v51, @"kCMDeviceMotionLiteCodingKeyCompassTemperature");
    int v53 = v52;
    objc_msgSend_decodeFloatForKey_(a3, v54, @"kCMDeviceMotionLiteCodingKeyRawMagneticFieldX");
    int v56 = v55;
    objc_msgSend_decodeFloatForKey_(a3, v57, @"kCMDeviceMotionLiteCodingKeyRawMagneticFieldY");
    int v59 = v58;
    objc_msgSend_decodeFloatForKey_(a3, v60, @"kCMDeviceMotionLiteCodingKeyRawMagneticFieldZ");
    int v62 = v61;
    uint64_t v63 = objc_opt_class();
    uint64_t v65 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v64, v63, @"kCMDeviceMotionLiteCodingKeyPhysicalDeviceUniqueID");
    v81[0] = v80;
    v81[1] = v79;
    v81[2] = v78;
    v81[3] = v77;
    int v82 = v76;
    int v83 = v75;
    int v84 = v74;
    int v85 = v73;
    int v86 = v72;
    int v87 = v71;
    int v88 = v70;
    int v89 = v69;
    int v90 = v68;
    int v91 = v33;
    int v92 = v36;
    int v93 = v39;
    uint64_t v94 = v45;
    char v95 = v47;
    int v98 = v50;
    int v99 = v53;
    int v100 = v56;
    int v101 = v59;
    int v102 = v62;
    char v104 = 0;
    __int16 v103 = 0;
    return (CMDeviceMotionLite *)objc_msgSend_initWithDeviceMotionLite_andDeviceID_(self, v66, (uint64_t)v81, v65);
  }
  else
  {

    return 0;
  }
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3) & 1) == 0)
  {
    v60 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v60, v61, (uint64_t)a2, self, @"CMDeviceMotionLite.mm", 162, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  objc_msgSend_quaternion(self->_attitude, v6, v7);
  objc_msgSend_encodeDouble_forKey_(a3, v8, @"kCMDeviceMotionLiteCodingKeyQuaternionX");
  objc_msgSend_quaternion(self->_attitude, v9, v10);
  objc_msgSend_encodeDouble_forKey_(a3, v11, @"kCMDeviceMotionLiteCodingKeyQuaternionY", v12);
  objc_msgSend_quaternion(self->_attitude, v13, v14);
  objc_msgSend_encodeDouble_forKey_(a3, v15, @"kCMDeviceMotionLiteCodingKeyQuaternionZ", v16);
  objc_msgSend_quaternion(self->_attitude, v17, v18);
  objc_msgSend_encodeDouble_forKey_(a3, v19, @"kCMDeviceMotionLiteCodingKeyQuaternionW", v20);
  double x = self->_userAcceleration.x;
  *(float *)&double x = x;
  objc_msgSend_encodeFloat_forKey_(a3, v22, @"kCMDeviceMotionLiteCodingKeyUserAccelerationX", x);
  double y = self->_userAcceleration.y;
  *(float *)&double y = y;
  objc_msgSend_encodeFloat_forKey_(a3, v24, @"kCMDeviceMotionLiteCodingKeyUserAccelerationY", y);
  double z = self->_userAcceleration.z;
  *(float *)&double z = z;
  objc_msgSend_encodeFloat_forKey_(a3, v26, @"kCMDeviceMotionLiteCodingKeyUserAccelerationZ", z);
  double v27 = self->_rotationRate.x;
  *(float *)&double v27 = v27;
  objc_msgSend_encodeFloat_forKey_(a3, v28, @"kCMDeviceMotionLiteCodingKeyRotationRateX", v27);
  double v29 = self->_rotationRate.y;
  *(float *)&double v29 = v29;
  objc_msgSend_encodeFloat_forKey_(a3, v30, @"kCMDeviceMotionLiteCodingKeyRotationRateY", v29);
  double v31 = self->_rotationRate.z;
  *(float *)&double v31 = v31;
  objc_msgSend_encodeFloat_forKey_(a3, v32, @"kCMDeviceMotionLiteCodingKeyRotationRateZ", v31);
  double v33 = self->_rawAcceleration.x;
  *(float *)&double v33 = v33;
  objc_msgSend_encodeFloat_forKey_(a3, v34, @"kCMDeviceMotionLiteCodingKeyRawAccelerationX", v33);
  double v35 = self->_rawAcceleration.y;
  *(float *)&double v35 = v35;
  objc_msgSend_encodeFloat_forKey_(a3, v36, @"kCMDeviceMotionLiteCodingKeyRawAccelerationY", v35);
  double v37 = self->_rawAcceleration.z;
  *(float *)&double v37 = v37;
  objc_msgSend_encodeFloat_forKey_(a3, v38, @"kCMDeviceMotionLiteCodingKeyRawAccelerationZ", v37);
  double v39 = self->_rawRotationRate.x;
  *(float *)&double v39 = v39;
  objc_msgSend_encodeFloat_forKey_(a3, v40, @"kCMDeviceMotionLiteCodingKeyRawRotationRateX", v39);
  double v41 = self->_rawRotationRate.y;
  *(float *)&double v41 = v41;
  objc_msgSend_encodeFloat_forKey_(a3, v42, @"kCMDeviceMotionLiteCodingKeyRawRotationRateY", v41);
  double v43 = self->_rawRotationRate.z;
  *(float *)&double v43 = v43;
  objc_msgSend_encodeFloat_forKey_(a3, v44, @"kCMDeviceMotionLiteCodingKeyRawRotationRateZ", v43);
  uint64_t v46 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v45, self->_machTimestamp);
  objc_msgSend_encodeObject_forKey_(a3, v47, v46, @"kCMDeviceMotionLiteCodingKeyMachTimestamp");
  objc_msgSend_encodeBool_forKey_(a3, v48, self->_usingCompass, @"kCMDeviceMotionLiteCodingKeyUsingCompass");
  objc_msgSend_encodeObject_forKey_(a3, v49, (uint64_t)self->_physicalDeviceUniqueID, @"kCMDeviceMotionLiteCodingKeyPhysicalDeviceUniqueID");
  *(float *)&double v50 = self->_gyroTemperature;
  objc_msgSend_encodeFloat_forKey_(a3, v51, @"kCMDeviceMotionLiteCodingKeyGyroTemperature", v50);
  *(float *)&double v52 = self->_compassTemperature;
  objc_msgSend_encodeFloat_forKey_(a3, v53, @"kCMDeviceMotionLiteCodingKeyCompassTemperature", v52);
  double v54 = self->_rawMagneticField.x;
  *(float *)&double v54 = v54;
  objc_msgSend_encodeFloat_forKey_(a3, v55, @"kCMDeviceMotionLiteCodingKeyRawMagneticFieldX", v54);
  double v56 = self->_rawMagneticField.y;
  *(float *)&double v56 = v56;
  objc_msgSend_encodeFloat_forKey_(a3, v57, @"kCMDeviceMotionLiteCodingKeyRawMagneticFieldY", v56);
  double v59 = self->_rawMagneticField.z;
  *(float *)&double v59 = v59;

  objc_msgSend_encodeFloat_forKey_(a3, v58, @"kCMDeviceMotionLiteCodingKeyRawMagneticFieldZ", v59);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMDeviceMotionLite;
  [(CMDeviceMotionLite *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v11 = objc_msgSend_init(v7, v8, v9);
  if (v11)
  {
    *(void *)(v11 + 24) = objc_msgSend_copyWithZone_(self->_attitude, v10, (uint64_t)a3);
    double z = self->_gravity.z;
    *(_OWORD *)(v11 + 48) = *(_OWORD *)&self->_gravity.x;
    *(double *)(v11 + 64) = z;
    long long v13 = *(_OWORD *)&self->_userAcceleration.x;
    *(double *)(v11 + 88) = self->_userAcceleration.z;
    *(_OWORD *)(v11 + 72) = v13;
    long long v14 = *(_OWORD *)&self->_rotationRate.x;
    *(double *)(v11 + 112) = self->_rotationRate.z;
    *(_OWORD *)(v11 + 96) = v14;
    long long v15 = *(_OWORD *)&self->_rawAcceleration.x;
    *(double *)(v11 + 136) = self->_rawAcceleration.z;
    *(_OWORD *)(v11 + 120) = v15;
    long long v16 = *(_OWORD *)&self->_rawRotationRate.x;
    *(double *)(v11 + 160) = self->_rawRotationRate.z;
    *(_OWORD *)(v11 + 144) = v16;
    *(void *)(v11 + 40) = self->_machTimestamp;
    *(unsigned char *)(v11 + 8) = self->_usingCompass;
    *(void *)(v11 + 32) = objc_msgSend_copyWithZone_(self->_physicalDeviceUniqueID, v17, (uint64_t)a3);
    *(float *)(v11 + 12) = self->_gyroTemperature;
    *(float *)(v11 + 16) = self->_compassTemperature;
    long long v18 = *(_OWORD *)&self->_rawMagneticField.x;
    *(double *)(v11 + 184) = self->_rawMagneticField.z;
    *(_OWORD *)(v11 + 168) = v18;
  }
  return (id)v11;
}

- (id)description
{
  BOOL usingCompass = self->_usingCompass;
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  double x = self->_gravity.x;
  double y = self->_gravity.y;
  double z = self->_gravity.z;
  double v10 = self->_userAcceleration.x;
  double v11 = self->_userAcceleration.y;
  double v12 = self->_userAcceleration.z;
  objc_msgSend_tip(self, v13, v14);
  double v16 = v15;
  objc_msgSend_tilt(self, v17, v18);
  double v22 = v21;
  if (usingCompass)
  {
    objc_msgSend_quaternion(self->_attitude, v19, v20);
    double v48 = x;
    uint64_t v46 = v23;
    objc_msgSend_quaternion(self->_attitude, v24, v25);
    double v47 = y;
    uint64_t v27 = v26;
    objc_msgSend_quaternion(self->_attitude, v28, v29);
    double v45 = z;
    uint64_t v31 = v30;
    objc_msgSend_quaternion(self->_attitude, v32, v33);
    double v44 = v10;
    uint64_t v35 = v34;
    long long v43 = *(_OWORD *)&self->_rotationRate.x;
    double v36 = v11;
    double v37 = self->_rotationRate.z;
    double v38 = sub_1902D8D34(self->_machTimestamp);
    return (id)objc_msgSend_stringWithFormat_(v4, v39, @"%@,Gravity,%f,%f,%f,UserAcceleration,%f,%f,%f,Tip,%f,Tilt,%f,Attitude,%f,%f,%f,%f,RotationRate,%f,%f,%f,MachTimestamp,%f,UsingCompass,%d,PhysicalDeviceUniqueID,%@", v6, *(void *)&v48, *(void *)&v47, *(void *)&v45, *(void *)&v44, *(void *)&v36, *(void *)&v12, *(void *)&v16, *(void *)&v22, v46, v27, v31, v35, v43, *(void *)&v37, *(void *)&v38,
                 self->_usingCompass,
                 self->_physicalDeviceUniqueID);
  }
  else
  {
    double v41 = sub_1902D8D34(self->_machTimestamp);
    return (id)objc_msgSend_stringWithFormat_(v4, v42, @"%@,Gravity,%f,%f,%f,UserAcceleration,%f,%f,%f,Tip,%f,Tilt,%f,MachTimestamp,%f,UsingCompass,%d,PhysicalDeviceUniqueID,%@", v6, *(void *)&x, *(void *)&y, *(void *)&z, *(void *)&v10, *(void *)&v11, *(void *)&v12, *(void *)&v16, *(void *)&v22, *(void *)&v41, self->_usingCompass, self->_physicalDeviceUniqueID);
  }
}

- (id)debugDescription
{
  objc_super v3 = NSString;
  if (self->_usingCompass)
  {
    double compassTemperature = self->_compassTemperature;
    long long v45 = *(_OWORD *)&self->_rawMagneticField.x;
    double z = self->_rawMagneticField.z;
    double v6 = sub_1902D8D34(self->_machTimestamp);
    return (id)objc_msgSend_stringWithFormat_(v3, v7, @"Magnesium,%f,%f,%f,%f,MachTimestamp,%f,PhysicalDeviceUniqueID,%@", *(void *)&compassTemperature, v45, *(void *)&z, *(void *)&v6, self->_physicalDeviceUniqueID);
  }
  else
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    double v10 = NSStringFromClass(v9);
    long long v13 = objc_msgSend_attitude(self, v11, v12);
    objc_msgSend_quaternion(v13, v14, v15);
    uint64_t v17 = v16;
    uint64_t v20 = objc_msgSend_attitude(self, v18, v19);
    objc_msgSend_quaternion(v20, v21, v22);
    uint64_t v24 = v23;
    uint64_t v27 = objc_msgSend_attitude(self, v25, v26);
    objc_msgSend_quaternion(v27, v28, v29);
    uint64_t v31 = v30;
    uint64_t v34 = objc_msgSend_attitude(self, v32, v33);
    objc_msgSend_quaternion(v34, v35, v36);
    uint64_t v38 = v37;
    long long v44 = *(_OWORD *)&self->_rotationRate.z;
    long long v46 = *(_OWORD *)&self->_rotationRate.x;
    long long v43 = *(_OWORD *)&self->_rawAcceleration.y;
    long long v42 = *(_OWORD *)&self->_rawRotationRate.x;
    double v39 = self->_rawRotationRate.z;
    double v40 = sub_1902D8D34(self->_machTimestamp);
    return (id)objc_msgSend_stringWithFormat_(v3, v41, @"%@,Quaternion,%f,%f,%f,%f,RotationRate,%f,%f,%f, RawAcceleration,%f,%f,%f,RawRotationRate,%f,%f,%f,MachTimestamp,%f,UsingCompass,%d PhysicalDeviceUniqueID,%@", v10, v17, v24, v31, v38, v46, v44, v43, v42, *(void *)&v39, *(void *)&v40, self->_usingCompass, self->_physicalDeviceUniqueID);
  }
}

- (float)tip
{
  double z = self->_gravity.z;
  double v3 = -self->_gravity.y;
  if (fabs(z) <= 0.1) {
    return asin(v3);
  }
  else {
    return atan2(v3, -z);
  }
}

- (float)tilt
{
  double z = self->_gravity.z;
  double x = self->_gravity.x;
  if (fabs(z) <= 0.1) {
    return asin(x);
  }
  else {
    return atan2(x, -z);
  }
}

- ($1AB5FA073B851C12C2339EC22442E995)gravity
{
  double x = self->_gravity.x;
  double y = self->_gravity.y;
  double z = self->_gravity.z;
  result.double var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)userAcceleration
{
  double x = self->_userAcceleration.x;
  double y = self->_userAcceleration.y;
  double z = self->_userAcceleration.z;
  result.double var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (CMAttitude)attitude
{
  return self->_attitude;
}

- ($1AB5FA073B851C12C2339EC22442E995)rotationRate
{
  double x = self->_rotationRate.x;
  double y = self->_rotationRate.y;
  double z = self->_rotationRate.z;
  result.double var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (BOOL)isUsingCompass
{
  return self->_usingCompass;
}

- (NSString)physicalDeviceUniqueID
{
  return self->_physicalDeviceUniqueID;
}

- ($1AB5FA073B851C12C2339EC22442E995)rawAcceleration
{
  double x = self->_rawAcceleration.x;
  double y = self->_rawAcceleration.y;
  double z = self->_rawAcceleration.z;
  result.double var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)rawRotationRate
{
  double x = self->_rawRotationRate.x;
  double y = self->_rawRotationRate.y;
  double z = self->_rawRotationRate.z;
  result.double var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (unint64_t)machTimestamp
{
  return self->_machTimestamp;
}

- (float)gyroTemperature
{
  return self->_gyroTemperature;
}

- (float)compassTemperature
{
  return self->_compassTemperature;
}

- ($1AB5FA073B851C12C2339EC22442E995)rawMagneticField
{
  double x = self->_rawMagneticField.x;
  double y = self->_rawMagneticField.y;
  double z = self->_rawMagneticField.z;
  result.double var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

@end