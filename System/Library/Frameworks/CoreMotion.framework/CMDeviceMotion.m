@interface CMDeviceMotion
+ (BOOL)supportsSecureCoding;
- (BOOL)doingBiasEstimation;
- (BOOL)doingYawCorrection;
- (BOOL)fusedWithVision;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInitialized;
- (BOOL)usingVisionCorrections;
- (CMAcceleration)gravity;
- (CMAcceleration)userAcceleration;
- (CMAttitude)attitude;
- (CMCalibratedMagneticField)magneticField;
- (CMDeviceMotion)initWithCoder:(id)a3;
- (CMDeviceMotion)initWithDeviceMotion:(id *)a3 internal:(id)a4 timestamp:(double)a5;
- (CMDeviceMotionSensorLocation)sensorLocation;
- (CMRotationRate)rotationRate;
- (double)heading;
- (double)headingAccuracy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)magneticFieldCalibrationLevel;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMDeviceMotion

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMDeviceMotion;
  [(CMLogItem *)&v3 dealloc];
}

- (CMDeviceMotion)initWithDeviceMotion:(id *)a3 internal:(id)a4 timestamp:(double)a5
{
  v15.receiver = self;
  v15.super_class = (Class)CMDeviceMotion;
  v7 = [(CMLogItem *)&v15 initWithTimestamp:a5];
  if (v7)
  {
    v8 = [CMDeviceMotionInternal alloc];
    long long v9 = *(_OWORD *)&a3->var2.var1;
    v13[2] = *(_OWORD *)&a3->var1.var0;
    v13[3] = v9;
    v13[4] = *(_OWORD *)&a3->var3.var2;
    uint64_t v14 = *(void *)&a3->var9;
    long long v10 = *(_OWORD *)&a3->var0.var2;
    v13[0] = *(_OWORD *)&a3->var0.var0;
    v13[1] = v10;
    v7->_internal = (id)objc_msgSend_initWithDeviceMotion_internal_(v8, v11, (uint64_t)v13, COERCE_DOUBLE(__PAIR64__(DWORD1(v13[0]), a4.var0)));
  }
  return v7;
}

- (CMAttitude)attitude
{
  return (CMAttitude *)*((void *)self->_internal + 10);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMDeviceMotion)initWithCoder:(id)a3
{
  v89.receiver = self;
  v89.super_class = (Class)CMDeviceMotion;
  v4 = -[CMLogItem initWithCoder:](&v89, sel_initWithCoder_);
  if (v4)
  {
    v5 = objc_alloc_init(CMDeviceMotionInternal);
    v4->_internal = v5;
    objc_msgSend_decodeDoubleForKey_(a3, v6, @"kCMDeviceMotionCodingKeyQuaternionX");
    double v8 = v7;
    objc_msgSend_decodeDoubleForKey_(a3, v9, @"kCMDeviceMotionCodingKeyQuaternionY");
    double v11 = v10;
    objc_msgSend_decodeDoubleForKey_(a3, v12, @"kCMDeviceMotionCodingKeyQuaternionZ");
    double v14 = v13;
    objc_msgSend_decodeDoubleForKey_(a3, v15, @"kCMDeviceMotionCodingKeyQuaternionW");
    double v17 = v16;
    objc_msgSend_decodeDoubleForKey_(a3, v18, @"kCMDeviceMotionCodingKeyUserAccelerationX");
    *(float *)&double v19 = v19;
    int v70 = LODWORD(v19);
    objc_msgSend_decodeDoubleForKey_(a3, v20, @"kCMDeviceMotionCodingKeyUserAccelerationY");
    *(float *)&double v21 = v21;
    int v69 = LODWORD(v21);
    objc_msgSend_decodeDoubleForKey_(a3, v22, @"kCMDeviceMotionCodingKeyUserAccelerationZ");
    *(float *)&double v23 = v23;
    int v68 = LODWORD(v23);
    objc_msgSend_decodeDoubleForKey_(a3, v24, @"kCMDeviceMotionCodingKeyRotationRateX");
    *(float *)&double v25 = v25;
    int v67 = LODWORD(v25);
    objc_msgSend_decodeDoubleForKey_(a3, v26, @"kCMDeviceMotionCodingKeyRotationRateY");
    *(float *)&double v27 = v27;
    int v66 = LODWORD(v27);
    objc_msgSend_decodeDoubleForKey_(a3, v28, @"kCMDeviceMotionCodingKeyRotationRateZ");
    *(float *)&double v29 = v29;
    int v65 = LODWORD(v29);
    objc_msgSend_decodeDoubleForKey_(a3, v30, @"kCMDeviceMotionCodingKeyMagneticFieldX");
    *(float *)&double v31 = v31;
    int v64 = LODWORD(v31);
    objc_msgSend_decodeDoubleForKey_(a3, v32, @"kCMDeviceMotionCodingKeyMagneticFieldY");
    float v34 = v33;
    objc_msgSend_decodeDoubleForKey_(a3, v35, @"kCMDeviceMotionCodingKeyMagneticFieldZ");
    float v37 = v36;
    int v39 = objc_msgSend_decodeIntegerForKey_(a3, v38, @"kCMDeviceMotionCodingKeyMagneticFieldCalibrationLevel");
    char v41 = objc_msgSend_decodeBoolForKey_(a3, v40, @"kCMDeviceMotionCodingKeyDoingYawCorrection");
    char v43 = objc_msgSend_decodeBoolForKey_(a3, v42, @"kCMDeviceMotionCodingKeyDoingBiasEstimation");
    char v45 = objc_msgSend_decodeBoolForKey_(a3, v44, @"kCMDeviceMotionCodingKeyIsInitialized");
    objc_msgSend_decodeDoubleForKey_(a3, v46, @"kCMDeviceMotionCodingKeyHeading");
    float v48 = v47;
    char v50 = objc_msgSend_decodeBoolForKey_(a3, v49, @"kCMDeviceMotionCodingKeyFusedWithVision");
    char v52 = objc_msgSend_decodeBoolForKey_(a3, v51, @"kCMDeviceMotionCodingKeyUsingVisionCorrections");
    int v54 = objc_msgSend_decodeIntegerForKey_(a3, v53, @"kCMDeviceMotionCodingKeySensorLocation");
    objc_msgSend_decodeDoubleForKey_(a3, v55, @"kCMDeviceMotionCodingKeyHeadingAccuracy");
    float v57 = v56;
    v58 = [CMAttitude alloc];
    v5->fAttitude = (CMAttitude *)objc_msgSend_initWithQuaternion_(v58, v59, v60, v17, v8, v11, v14);
    *(double *)v71 = v17;
    *(double *)&v71[1] = v8;
    *(double *)&v71[2] = v11;
    *(double *)&v71[3] = v14;
    int v72 = v70;
    int v73 = v69;
    int v74 = v68;
    int v75 = v67;
    int v76 = v66;
    int v77 = v65;
    int v78 = v64;
    float v79 = v34;
    float v80 = v37;
    int v81 = v39;
    char v82 = v41;
    char v83 = v43;
    char v84 = v45;
    float v85 = v48;
    char v86 = v50;
    char v87 = v52;
    int v88 = v54;
    *(float *)&double v61 = v57;
    objc_msgSend_setDeviceMotion_internal_(v5, v62, (uint64_t)v71, v61);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v36.receiver = self;
  v36.super_class = (Class)CMDeviceMotion;
  -[CMLogItem encodeWithCoder:](&v36, sel_encodeWithCoder_);
  internal = (int *)self->_internal;
  objc_msgSend_quaternion(*((void **)internal + 10), v6, v7);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  objc_msgSend_encodeDouble_forKey_(a3, v14, @"kCMDeviceMotionCodingKeyQuaternionX");
  objc_msgSend_encodeDouble_forKey_(a3, v15, @"kCMDeviceMotionCodingKeyQuaternionY", v9);
  objc_msgSend_encodeDouble_forKey_(a3, v16, @"kCMDeviceMotionCodingKeyQuaternionZ", v11);
  objc_msgSend_encodeDouble_forKey_(a3, v17, @"kCMDeviceMotionCodingKeyQuaternionW", v13);
  objc_msgSend_encodeDouble_forKey_(a3, v18, @"kCMDeviceMotionCodingKeyUserAccelerationX", *((double *)internal + 4));
  objc_msgSend_encodeDouble_forKey_(a3, v19, @"kCMDeviceMotionCodingKeyUserAccelerationY", *((double *)internal + 5));
  objc_msgSend_encodeDouble_forKey_(a3, v20, @"kCMDeviceMotionCodingKeyUserAccelerationZ", *((double *)internal + 6));
  objc_msgSend_encodeDouble_forKey_(a3, v21, @"kCMDeviceMotionCodingKeyRotationRateX", *((double *)internal + 7));
  objc_msgSend_encodeDouble_forKey_(a3, v22, @"kCMDeviceMotionCodingKeyRotationRateY", *((double *)internal + 8));
  objc_msgSend_encodeDouble_forKey_(a3, v23, @"kCMDeviceMotionCodingKeyRotationRateZ", *((double *)internal + 9));
  objc_msgSend_encodeDouble_forKey_(a3, v24, @"kCMDeviceMotionCodingKeyMagneticFieldX", *((double *)internal + 11));
  objc_msgSend_encodeDouble_forKey_(a3, v25, @"kCMDeviceMotionCodingKeyMagneticFieldY", *((double *)internal + 12));
  objc_msgSend_encodeDouble_forKey_(a3, v26, @"kCMDeviceMotionCodingKeyMagneticFieldZ", *((double *)internal + 13));
  objc_msgSend_encodeInteger_forKey_(a3, v27, internal[28], @"kCMDeviceMotionCodingKeyMagneticFieldCalibrationLevel");
  objc_msgSend_encodeBool_forKey_(a3, v28, *((unsigned __int8 *)internal + 116), @"kCMDeviceMotionCodingKeyDoingYawCorrection");
  objc_msgSend_encodeBool_forKey_(a3, v29, *((unsigned __int8 *)internal + 117), @"kCMDeviceMotionCodingKeyDoingBiasEstimation");
  objc_msgSend_encodeBool_forKey_(a3, v30, *((unsigned __int8 *)internal + 118), @"kCMDeviceMotionCodingKeyIsInitialized");
  objc_msgSend_encodeDouble_forKey_(a3, v31, @"kCMDeviceMotionCodingKeyHeading", *((float *)internal + 30));
  objc_msgSend_encodeBool_forKey_(a3, v32, *((unsigned __int8 *)internal + 128), @"kCMDeviceMotionCodingKeyFusedWithVision");
  objc_msgSend_encodeBool_forKey_(a3, v33, *((unsigned __int8 *)internal + 129), @"kCMDeviceMotionCodingKeyUsingVisionCorrections");
  objc_msgSend_encodeDouble_forKey_(a3, v34, @"kCMDeviceMotionCodingKeyHeadingAccuracy", *((float *)internal + 31));
  objc_msgSend_encodeInteger_forKey_(a3, v35, *((void *)internal + 17), @"kCMDeviceMotionCodingKeySensorLocation");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CMDeviceMotion;
  v6 = -[CMLogItem copyWithZone:](&v8, sel_copyWithZone_);
  if (v6) {
    v6[2] = objc_msgSend_copyWithZone_(self->_internal, v5, (uint64_t)a3);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_msgSend_timestamp(self, v5, v6);
  double v8 = v7;
  objc_msgSend_timestamp(a3, v9, v10);
  if (v8 != v12) {
    return 0;
  }
  id internal = self->_internal;
  uint64_t v14 = *((void *)a3 + 2);

  return objc_msgSend_isEqual_(internal, v11, v14);
}

- (id)description
{
  id internal = (void **)self->_internal;
  v5 = NSString;
  objc_msgSend_quaternion(internal[10], a2, v2);
  uint64_t v40 = v6;
  objc_msgSend_quaternion(internal[10], v7, v8);
  uint64_t v39 = v9;
  objc_msgSend_quaternion(internal[10], v10, v11);
  uint64_t v13 = v12;
  objc_msgSend_quaternion(internal[10], v14, v15);
  uint64_t v17 = v16;
  long long v37 = *((_OWORD *)internal + 3);
  long long v38 = *((_OWORD *)internal + 2);
  v18 = internal[8];
  double v19 = internal[9];
  objc_msgSend_magneticField(self, v20, v21);
  uint64_t v22 = v45;
  objc_msgSend_magneticField(self, v23, v24);
  uint64_t v25 = v44;
  objc_msgSend_magneticField(self, v26, v27);
  uint64_t v28 = v43;
  objc_msgSend_magneticField(self, v29, v30);
  double v31 = *((float *)internal + 30);
  v32 = internal[17];
  v41.receiver = self;
  v41.super_class = (Class)CMDeviceMotion;
  uint64_t v33 = v42;
  [(CMLogItem *)&v41 timestamp];
  return (id)objc_msgSend_stringWithFormat_(v5, v34, @"QuaternionX %f QuaternionY %f QuaternionZ %f QuaternionW %f UserAccelX %f UserAccelY %f UserAccelZ %f RotationRateX %f RotationRateY %f RotationRateZ %f MagneticFieldX %f MagneticFieldY %f MagneticFieldZ %f MagneticFieldAccuracy %d Heading %f SensorLocation %d @ %f", v40, v39, v13, v17, v38, v37, v18, v19, v22, v25, v28, v33, *(void *)&v31, v32, v35);
}

- (CMRotationRate)rotationRate
{
  id internal = (double *)self->_internal;
  double v3 = internal[7];
  double v4 = internal[8];
  double v5 = internal[9];
  result.z = v5;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CMAcceleration)gravity
{
  id internal = (double *)self->_internal;
  double v3 = internal[1];
  double v4 = internal[2];
  double v5 = internal[3];
  result.z = v5;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CMAcceleration)userAcceleration
{
  id internal = (double *)self->_internal;
  double v3 = internal[4];
  double v4 = internal[5];
  double v5 = internal[6];
  result.z = v5;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CMCalibratedMagneticField)magneticField
{
  double z = self->field.z;
  *(_OWORD *)&retstr->field.x = *(_OWORD *)(*(void *)&z + 88);
  retstr->field.double z = *(double *)(*(void *)&z + 104);
  int v4 = *(_DWORD *)(*(void *)&z + 112) - 1;
  if (v4 > 5) {
    CMMagneticFieldCalibrationAccuracy v5 = CMMagneticFieldCalibrationAccuracyUncalibrated;
  }
  else {
    CMMagneticFieldCalibrationAccuracy v5 = dword_190608DD8[v4];
  }
  retstr->accuracy = v5;
  return self;
}

- (int)magneticFieldCalibrationLevel
{
  return *((_DWORD *)self->_internal + 28);
}

- (BOOL)doingYawCorrection
{
  return *((unsigned char *)self->_internal + 116);
}

- (BOOL)doingBiasEstimation
{
  return *((unsigned char *)self->_internal + 117);
}

- (BOOL)isInitialized
{
  return *((unsigned char *)self->_internal + 118);
}

- (double)heading
{
  return *((float *)self->_internal + 30);
}

- (double)headingAccuracy
{
  return *((float *)self->_internal + 31);
}

- (BOOL)fusedWithVision
{
  return *((unsigned char *)self->_internal + 128);
}

- (BOOL)usingVisionCorrections
{
  return *((unsigned char *)self->_internal + 129);
}

- (CMDeviceMotionSensorLocation)sensorLocation
{
  return *((void *)self->_internal + 17);
}

@end