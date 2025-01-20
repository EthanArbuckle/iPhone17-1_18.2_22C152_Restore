@interface CVACMMotionTypeDeviceMotionData
- (BOOL)doingBiasEstimation;
- (BOOL)doingYawCorrection;
- (BOOL)fusedWithVision;
- (CVACLMotionTypeDoubleVector4)quaternion;
- (CVACLMotionTypeVector3)gravity;
- (CVACLMotionTypeVector3)magneticField;
- (CVACLMotionTypeVector3)rotationRate;
- (CVACLMotionTypeVector3)userAcceleration;
- (CVACMMotionTypeDeviceMotionData)init;
- (CVACMMotionTypeDeviceMotionData)initWithFastPathData:(id)a3;
- (id)debugDescription;
- (id)dictionary;
- (int)magneticFieldCalibrationLevel;
- (void)setDoingBiasEstimation:(BOOL)a3;
- (void)setDoingYawCorrection:(BOOL)a3;
- (void)setFusedWithVision:(BOOL)a3;
- (void)setGravity:(id)a3;
- (void)setMagneticField:(id)a3;
- (void)setMagneticFieldCalibrationLevel:(int)a3;
- (void)setQuaternion:(id)a3;
- (void)setRotationRate:(id)a3;
- (void)setUserAcceleration:(id)a3;
@end

@implementation CVACMMotionTypeDeviceMotionData

- (CVACMMotionTypeDeviceMotionData)init
{
  v14.receiver = self;
  v14.super_class = (Class)CVACMMotionTypeDeviceMotionData;
  v2 = [(CVACMMotionTypeDeviceMotionData *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    quaternion = v2->_quaternion;
    v2->_quaternion = (CVACLMotionTypeDoubleVector4 *)v3;

    uint64_t v5 = objc_opt_new();
    userAcceleration = v2->_userAcceleration;
    v2->_userAcceleration = (CVACLMotionTypeVector3 *)v5;

    uint64_t v7 = objc_opt_new();
    gravity = v2->_gravity;
    v2->_gravity = (CVACLMotionTypeVector3 *)v7;

    uint64_t v9 = objc_opt_new();
    rotationRate = v2->_rotationRate;
    v2->_rotationRate = (CVACLMotionTypeVector3 *)v9;

    uint64_t v11 = objc_opt_new();
    magneticField = v2->_magneticField;
    v2->_magneticField = (CVACLMotionTypeVector3 *)v11;
  }
  return v2;
}

- (CVACMMotionTypeDeviceMotionData)initWithFastPathData:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CVACMMotionTypeDeviceMotionData;
  uint64_t v5 = [(CVACMMotionTypeDeviceMotionData *)&v21 init];
  if (v5)
  {
    v6 = (_WORD *)[v4 bytes];
    if (*v6 != 3)
    {
      v19 = 0;
      goto LABEL_6;
    }
    uint64_t v7 = v6;
    v8 = -[CVACLMotionTypeDoubleVector4 initWithFastPathXYZWDataV3:]([CVACLMotionTypeDoubleVector4 alloc], "initWithFastPathXYZWDataV3:", *((double *)v7 + 15), *((double *)v7 + 16), *((double *)v7 + 17), *((double *)v7 + 18));
    quaternion = v5->_quaternion;
    v5->_quaternion = v8;

    v10 = -[CVACLMotionTypeVector3 initWithFastPathXYZDataV3:]([CVACLMotionTypeVector3 alloc], "initWithFastPathXYZDataV3:", *((double *)v7 + 25), *((double *)v7 + 26), *((double *)v7 + 27));
    userAcceleration = v5->_userAcceleration;
    v5->_userAcceleration = v10;

    v12 = -[CVACLMotionTypeVector3 initWithFastPathXYZDataV3:]([CVACLMotionTypeVector3 alloc], "initWithFastPathXYZDataV3:", *((double *)v7 + 22), *((double *)v7 + 23), *((double *)v7 + 24));
    gravity = v5->_gravity;
    v5->_gravity = v12;

    objc_super v14 = -[CVACLMotionTypeVector3 initWithFastPathXYZDataV3:]([CVACLMotionTypeVector3 alloc], "initWithFastPathXYZDataV3:", *((double *)v7 + 19), *((double *)v7 + 20), *((double *)v7 + 21));
    rotationRate = v5->_rotationRate;
    v5->_rotationRate = v14;

    v16 = -[CVACLMotionTypeVector3 initWithFastPathXYZDataV3:]([CVACLMotionTypeVector3 alloc], "initWithFastPathXYZDataV3:", *((double *)v7 + 28), *((double *)v7 + 29), *((double *)v7 + 30));
    magneticField = v5->_magneticField;
    v5->_magneticField = v16;

    v5->_magneticFieldCalibrationLevel = *((_DWORD *)v7 + 69);
    char v18 = *((unsigned char *)v7 + 272);
    v5->_doingYawCorrection = (v18 & 2) != 0;
    v5->_doingBiasEstimation = (v18 & 4) != 0;
    v5->_fusedWithVision = (v18 & 8) != 0;
  }
  v19 = v5;
LABEL_6:

  return v19;
}

- (id)dictionary
{
  v42[20] = *MEMORY[0x263EF8340];
  v41[0] = @"qx";
  uint64_t v3 = NSNumber;
  [(CVACLMotionTypeDoubleVector4 *)self->_quaternion x];
  v40 = objc_msgSend(v3, "numberWithDouble:");
  v42[0] = v40;
  v41[1] = @"qy";
  id v4 = NSNumber;
  [(CVACLMotionTypeDoubleVector4 *)self->_quaternion y];
  v39 = objc_msgSend(v4, "numberWithDouble:");
  v42[1] = v39;
  v41[2] = @"qz";
  uint64_t v5 = NSNumber;
  [(CVACLMotionTypeDoubleVector4 *)self->_quaternion z];
  v38 = objc_msgSend(v5, "numberWithDouble:");
  v42[2] = v38;
  v41[3] = @"qw";
  v6 = NSNumber;
  [(CVACLMotionTypeDoubleVector4 *)self->_quaternion w];
  v37 = objc_msgSend(v6, "numberWithDouble:");
  v42[3] = v37;
  v41[4] = @"ax";
  uint64_t v7 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_userAcceleration x];
  v36 = objc_msgSend(v7, "numberWithFloat:");
  v42[4] = v36;
  v41[5] = @"ay";
  v8 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_userAcceleration y];
  v35 = objc_msgSend(v8, "numberWithFloat:");
  v42[5] = v35;
  v41[6] = @"az";
  uint64_t v9 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_userAcceleration z];
  v34 = objc_msgSend(v9, "numberWithFloat:");
  v42[6] = v34;
  v41[7] = @"gx";
  v10 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_gravity x];
  v33 = objc_msgSend(v10, "numberWithFloat:");
  v42[7] = v33;
  v41[8] = @"gy";
  uint64_t v11 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_gravity y];
  v32 = objc_msgSend(v11, "numberWithFloat:");
  v42[8] = v32;
  v41[9] = @"gz";
  v12 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_gravity z];
  v31 = objc_msgSend(v12, "numberWithFloat:");
  v42[9] = v31;
  v41[10] = @"rx";
  v13 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_rotationRate x];
  v30 = objc_msgSend(v13, "numberWithFloat:");
  v42[10] = v30;
  v41[11] = @"ry";
  objc_super v14 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_rotationRate y];
  v15 = objc_msgSend(v14, "numberWithFloat:");
  v42[11] = v15;
  v41[12] = @"rz";
  v16 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_rotationRate z];
  v17 = objc_msgSend(v16, "numberWithFloat:");
  v42[12] = v17;
  v41[13] = @"mx";
  char v18 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_magneticField x];
  v19 = objc_msgSend(v18, "numberWithFloat:");
  v42[13] = v19;
  v41[14] = @"my";
  v20 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_magneticField y];
  objc_super v21 = objc_msgSend(v20, "numberWithFloat:");
  v42[14] = v21;
  v41[15] = @"mz";
  v22 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_magneticField z];
  v23 = objc_msgSend(v22, "numberWithFloat:");
  v42[15] = v23;
  v41[16] = @"mc";
  v24 = [NSNumber numberWithInt:self->_magneticFieldCalibrationLevel];
  v42[16] = v24;
  v41[17] = @"yc";
  v25 = [NSNumber numberWithBool:self->_doingYawCorrection];
  v42[17] = v25;
  v41[18] = @"be";
  v26 = [NSNumber numberWithBool:self->_doingBiasEstimation];
  v42[18] = v26;
  v41[19] = @"fv";
  v27 = [NSNumber numberWithBool:self->_fusedWithVision];
  v42[19] = v27;
  v28 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:20];

  return v28;
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CVACMMotionTypeDeviceMotionData *)self dictionary];
  v6 = [v3 stringWithFormat:@"<%@: %@>", v4, v5];

  return v6;
}

- (CVACLMotionTypeDoubleVector4)quaternion
{
  return self->_quaternion;
}

- (void)setQuaternion:(id)a3
{
}

- (CVACLMotionTypeVector3)userAcceleration
{
  return self->_userAcceleration;
}

- (void)setUserAcceleration:(id)a3
{
}

- (CVACLMotionTypeVector3)gravity
{
  return self->_gravity;
}

- (void)setGravity:(id)a3
{
}

- (CVACLMotionTypeVector3)rotationRate
{
  return self->_rotationRate;
}

- (void)setRotationRate:(id)a3
{
}

- (CVACLMotionTypeVector3)magneticField
{
  return self->_magneticField;
}

- (void)setMagneticField:(id)a3
{
}

- (int)magneticFieldCalibrationLevel
{
  return self->_magneticFieldCalibrationLevel;
}

- (void)setMagneticFieldCalibrationLevel:(int)a3
{
  self->_magneticFieldCalibrationLevel = a3;
}

- (BOOL)doingYawCorrection
{
  return self->_doingYawCorrection;
}

- (void)setDoingYawCorrection:(BOOL)a3
{
  self->_doingYawCorrection = a3;
}

- (BOOL)doingBiasEstimation
{
  return self->_doingBiasEstimation;
}

- (void)setDoingBiasEstimation:(BOOL)a3
{
  self->_doingBiasEstimation = a3;
}

- (BOOL)fusedWithVision
{
  return self->_fusedWithVision;
}

- (void)setFusedWithVision:(BOOL)a3
{
  self->_fusedWithVision = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magneticField, 0);
  objc_storeStrong((id *)&self->_rotationRate, 0);
  objc_storeStrong((id *)&self->_gravity, 0);
  objc_storeStrong((id *)&self->_userAcceleration, 0);
  objc_storeStrong((id *)&self->_quaternion, 0);
}

@end