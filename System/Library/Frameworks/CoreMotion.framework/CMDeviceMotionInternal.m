@interface CMDeviceMotionInternal
- (BOOL)isEqual:(id)a3;
- (CMDeviceMotionInternal)initWithDeviceMotion:(id *)a3 internal:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setDeviceMotion:(id *)a3 internal:(id)a4;
@end

@implementation CMDeviceMotionInternal

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMDeviceMotionInternal;
  [(CMDeviceMotionInternal *)&v3 dealloc];
}

- (CMDeviceMotionInternal)initWithDeviceMotion:(id *)a3 internal:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)CMDeviceMotionInternal;
  v6 = [(CMDeviceMotionInternal *)&v16 init];
  if (v6)
  {
    v7 = [CMAttitude alloc];
    v6->fAttitude = (CMAttitude *)objc_msgSend_initWithQuaternion_(v7, v8, v9, a3->var0.var0, a3->var0.var1, a3->var0.var2, a3->var0.var3);
    uint64_t v15 = *(void *)&a3->var9;
    long long v10 = *(_OWORD *)&a3->var2.var1;
    v14[2] = *(_OWORD *)&a3->var1.var0;
    v14[3] = v10;
    v14[4] = *(_OWORD *)&a3->var3.var2;
    long long v11 = *(_OWORD *)&a3->var0.var2;
    v14[0] = *(_OWORD *)&a3->var0.var0;
    v14[1] = v11;
    objc_msgSend_setDeviceMotion_internal_(v6, v12, (uint64_t)v14, COERCE_DOUBLE(__PAIR64__(DWORD1(v14[0]), a4.var0)));
  }
  return v6;
}

- (void)setDeviceMotion:(id *)a3 internal:(id)a4
{
  objc_msgSend_setQuaternion_(self->fAttitude, a2, (uint64_t)a3, a3->var0.var0, a3->var0.var1, a3->var0.var2, a3->var0.var3);
  self->fGravity.x = sub_1902DAF50(&a3->var0.var0);
  self->fGravity.y = v7;
  self->fGravity.z = v8;
  *(float64x2_t *)&self->fRotationRate.y = vcvtq_f64_f32(*(float32x2_t *)&a3->var2.var1);
  float64x2_t v9 = vcvtq_f64_f32(*(float32x2_t *)&a3->var1.var2);
  *(float64x2_t *)&self->fUserAcceleration.x = vcvtq_f64_f32(*(float32x2_t *)&a3->var1.var0);
  *(float64x2_t *)&self->fUserAcceleration.z = v9;
  int var4 = a3->var4;
  self->fMagneticFieldCalibrationLevel = var4;
  if (var4)
  {
    *(float64x2_t *)&self->fMagneticField.x = vcvtq_f64_f32(*(float32x2_t *)&a3->var3.var0);
    self->fMagneticField.z = a3->var3.var2;
  }
  else
  {
    bzero(&self->fMagneticField, 0x18uLL);
  }
  self->fDoingYawCorrection = a3->var5;
  self->fDoingBiasEstimation = a3->var6;
  self->fIsInitialized = a3->var7;
  float var8 = a3->var8;
  self->fFusedWithVision = a3->var9;
  self->fUsingVisionCorrections = a3->var10;
  self->fHeading = var8;
  self->fHeadingAccuracy = a4.var0;
  self->fSensorLocation = a3->var11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  float v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = v10;
  if (v10)
  {
    long long v13 = *(_OWORD *)&self->fGravity.x;
    *(double *)(v10 + 24) = self->fGravity.z;
    *(_OWORD *)(v10 + 8) = v13;
    long long v14 = *(_OWORD *)&self->fUserAcceleration.x;
    *(double *)(v10 + 48) = self->fUserAcceleration.z;
    *(_OWORD *)(v10 + 32) = v14;
    long long v15 = *(_OWORD *)&self->fRotationRate.x;
    *(double *)(v10 + 72) = self->fRotationRate.z;
    *(_OWORD *)(v10 + 56) = v15;
    *(void *)(v10 + 80) = objc_msgSend_copyWithZone_(self->fAttitude, v11, (uint64_t)a3);
    long long v16 = *(_OWORD *)&self->fMagneticField.x;
    *(double *)(v12 + 104) = self->fMagneticField.z;
    *(_OWORD *)(v12 + 88) = v16;
    *(_DWORD *)(v12 + 112) = self->fMagneticFieldCalibrationLevel;
    *(unsigned char *)(v12 + 116) = self->fDoingYawCorrection;
    *(unsigned char *)(v12 + 117) = self->fDoingBiasEstimation;
    *(float *)(v12 + 120) = self->fHeading;
    *(float *)(v12 + 124) = self->fHeadingAccuracy;
    *(unsigned char *)(v12 + 128) = self->fFusedWithVision;
    *(unsigned char *)(v12 + 129) = self->fUsingVisionCorrections;
    *(void *)(v12 + 136) = self->fSensorLocation;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(isEqual) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_17;
    }
    int isEqual = objc_msgSend_isEqual_(self->fAttitude, v5, *((void *)a3 + 10));
    if (!isEqual) {
      return isEqual;
    }
    if (self->fUserAcceleration.x != *((double *)a3 + 4)
      || self->fUserAcceleration.y != *((double *)a3 + 5)
      || self->fUserAcceleration.z != *((double *)a3 + 6)
      || self->fRotationRate.x != *((double *)a3 + 7)
      || self->fRotationRate.y != *((double *)a3 + 8)
      || self->fRotationRate.z != *((double *)a3 + 9)
      || self->fMagneticField.x != *((double *)a3 + 11)
      || self->fMagneticField.y != *((double *)a3 + 12)
      || self->fMagneticField.z != *((double *)a3 + 13)
      || self->fMagneticFieldCalibrationLevel != *((_DWORD *)a3 + 28)
      || self->fHeading != *((float *)a3 + 30)
      || self->fHeadingAccuracy != *((float *)a3 + 31))
    {
LABEL_17:
      LOBYTE(isEqual) = 0;
      return isEqual;
    }
    LOBYTE(isEqual) = self->fSensorLocation == *((void *)a3 + 17);
  }
  return isEqual;
}

@end