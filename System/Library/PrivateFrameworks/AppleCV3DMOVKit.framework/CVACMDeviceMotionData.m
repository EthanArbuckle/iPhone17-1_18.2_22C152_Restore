@interface CVACMDeviceMotionData
+ (BOOL)supportsSecureCoding;
+ (id)classes;
- (CVACMDeviceMotionData)init;
- (CVACMDeviceMotionData)initWithCMDeviceMotion:(id)a3;
- (CVACMDeviceMotionData)initWithCoder:(id)a3;
- (CVACMDeviceMotionData)initWithDictionary:(id)a3;
- (CVACMDeviceMotionData)initWithFastPathData:(id)a3;
- (CVACMMotionTypeDeviceMotionData)deviceMotion;
- (double)timestamp;
- (id)debugDescription;
- (id)dictionary;
- (unint64_t)syncTimestamp;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceMotion:(id)a3;
- (void)setSyncTimestamp:(unint64_t)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation CVACMDeviceMotionData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_267C58C08 == -1)
  {
    v2 = (void *)qword_267C58C00;
  }
  else
  {
    dispatch_once(&qword_267C58C08, &unk_26CB5E3F8);
    v2 = (void *)qword_267C58C00;
  }
  return v2;
}

- (CVACMDeviceMotionData)init
{
  v6.receiver = self;
  v6.super_class = (Class)CVACMDeviceMotionData;
  v2 = [(CVACMDeviceMotionData *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    deviceMotion = v2->_deviceMotion;
    v2->_deviceMotion = (CVACMMotionTypeDeviceMotionData *)v3;
  }
  return v2;
}

- (CVACMDeviceMotionData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(CVACMDeviceMotionData *)self init];
  if (v5)
  {
    objc_super v6 = [v4 objectForKeyedSubscript:@"qx"];
    [v6 doubleValue];
    double v8 = v7;
    v9 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion quaternion];
    [v9 setX:v8];

    v10 = [v4 objectForKeyedSubscript:@"qy"];
    [v10 doubleValue];
    double v12 = v11;
    v13 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion quaternion];
    [v13 setY:v12];

    v14 = [v4 objectForKeyedSubscript:@"qz"];
    [v14 doubleValue];
    double v16 = v15;
    v17 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion quaternion];
    [v17 setZ:v16];

    v18 = [v4 objectForKeyedSubscript:@"qw"];
    [v18 doubleValue];
    double v20 = v19;
    v21 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion quaternion];
    [v21 setW:v20];

    v22 = [v4 objectForKeyedSubscript:@"ax"];
    [v22 floatValue];
    LODWORD(v20) = v23;
    v24 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion userAcceleration];
    LODWORD(v25) = LODWORD(v20);
    [v24 setX:v25];

    v26 = [v4 objectForKeyedSubscript:@"ay"];
    [v26 floatValue];
    LODWORD(v20) = v27;
    v28 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion userAcceleration];
    LODWORD(v29) = LODWORD(v20);
    [v28 setY:v29];

    v30 = [v4 objectForKeyedSubscript:@"az"];
    [v30 floatValue];
    LODWORD(v20) = v31;
    v32 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion userAcceleration];
    LODWORD(v33) = LODWORD(v20);
    [v32 setZ:v33];

    v34 = [v4 objectForKeyedSubscript:@"gx"];
    [v34 floatValue];
    LODWORD(v20) = v35;
    v36 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion gravity];
    LODWORD(v37) = LODWORD(v20);
    [v36 setX:v37];

    v38 = [v4 objectForKeyedSubscript:@"gy"];
    [v38 floatValue];
    LODWORD(v20) = v39;
    v40 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion gravity];
    LODWORD(v41) = LODWORD(v20);
    [v40 setY:v41];

    v42 = [v4 objectForKeyedSubscript:@"gz"];
    [v42 floatValue];
    LODWORD(v20) = v43;
    v44 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion gravity];
    LODWORD(v45) = LODWORD(v20);
    [v44 setZ:v45];

    v46 = [v4 objectForKeyedSubscript:@"rx"];
    [v46 floatValue];
    LODWORD(v20) = v47;
    v48 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion rotationRate];
    LODWORD(v49) = LODWORD(v20);
    [v48 setX:v49];

    v50 = [v4 objectForKeyedSubscript:@"ry"];
    [v50 floatValue];
    LODWORD(v20) = v51;
    v52 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion rotationRate];
    LODWORD(v53) = LODWORD(v20);
    [v52 setY:v53];

    v54 = [v4 objectForKeyedSubscript:@"rz"];
    [v54 floatValue];
    LODWORD(v20) = v55;
    v56 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion rotationRate];
    LODWORD(v57) = LODWORD(v20);
    [v56 setZ:v57];

    v58 = [v4 objectForKeyedSubscript:@"mx"];
    [v58 floatValue];
    LODWORD(v20) = v59;
    v60 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion magneticField];
    LODWORD(v61) = LODWORD(v20);
    [v60 setX:v61];

    v62 = [v4 objectForKeyedSubscript:@"my"];
    [v62 floatValue];
    LODWORD(v20) = v63;
    v64 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion magneticField];
    LODWORD(v65) = LODWORD(v20);
    [v64 setY:v65];

    v66 = [v4 objectForKeyedSubscript:@"mz"];
    [v66 floatValue];
    LODWORD(v20) = v67;
    v68 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion magneticField];
    LODWORD(v69) = LODWORD(v20);
    [v68 setZ:v69];

    v70 = [v4 objectForKeyedSubscript:@"mc"];
    -[CVACMMotionTypeDeviceMotionData setMagneticFieldCalibrationLevel:](v5->_deviceMotion, "setMagneticFieldCalibrationLevel:", [v70 intValue]);

    v71 = [v4 objectForKeyedSubscript:@"yc"];
    -[CVACMMotionTypeDeviceMotionData setDoingYawCorrection:](v5->_deviceMotion, "setDoingYawCorrection:", [v71 BOOLValue]);

    v72 = [v4 objectForKeyedSubscript:@"be"];
    -[CVACMMotionTypeDeviceMotionData setDoingBiasEstimation:](v5->_deviceMotion, "setDoingBiasEstimation:", [v72 BOOLValue]);

    v73 = [v4 objectForKeyedSubscript:@"fv"];
    -[CVACMMotionTypeDeviceMotionData setFusedWithVision:](v5->_deviceMotion, "setFusedWithVision:", [v73 BOOLValue]);

    v74 = [v4 objectForKeyedSubscript:@"t"];
    [v74 doubleValue];
    v5->_timestamp = v75;

    v76 = [v4 objectForKeyedSubscript:@"st"];
    v5->_syncTimestamp = [v76 longLongValue];
  }
  return v5;
}

- (CVACMDeviceMotionData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CVACMDeviceMotionData *)self init];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x21D490BF0]();
    [v4 decodeDoubleForKey:@"qx"];
    double v8 = v7;
    v9 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion quaternion];
    [v9 setX:v8];

    [v4 decodeDoubleForKey:@"qy"];
    double v11 = v10;
    double v12 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion quaternion];
    [v12 setY:v11];

    [v4 decodeDoubleForKey:@"qz"];
    double v14 = v13;
    double v15 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion quaternion];
    [v15 setZ:v14];

    [v4 decodeDoubleForKey:@"qw"];
    double v17 = v16;
    v18 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion quaternion];
    [v18 setW:v17];

    [v4 decodeFloatForKey:@"ax"];
    LODWORD(v17) = v19;
    double v20 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion userAcceleration];
    LODWORD(v21) = LODWORD(v17);
    [v20 setX:v21];

    [v4 decodeFloatForKey:@"ay"];
    LODWORD(v17) = v22;
    int v23 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion userAcceleration];
    LODWORD(v24) = LODWORD(v17);
    [v23 setY:v24];

    [v4 decodeFloatForKey:@"az"];
    LODWORD(v17) = v25;
    v26 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion userAcceleration];
    LODWORD(v27) = LODWORD(v17);
    [v26 setZ:v27];

    [v4 decodeFloatForKey:@"gx"];
    LODWORD(v17) = v28;
    double v29 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion gravity];
    LODWORD(v30) = LODWORD(v17);
    [v29 setX:v30];

    [v4 decodeFloatForKey:@"gy"];
    LODWORD(v17) = v31;
    v32 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion gravity];
    LODWORD(v33) = LODWORD(v17);
    [v32 setY:v33];

    [v4 decodeFloatForKey:@"gz"];
    LODWORD(v17) = v34;
    int v35 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion gravity];
    LODWORD(v36) = LODWORD(v17);
    [v35 setZ:v36];

    [v4 decodeFloatForKey:@"rx"];
    LODWORD(v17) = v37;
    v38 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion rotationRate];
    LODWORD(v39) = LODWORD(v17);
    [v38 setX:v39];

    [v4 decodeFloatForKey:@"ry"];
    LODWORD(v17) = v40;
    double v41 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion rotationRate];
    LODWORD(v42) = LODWORD(v17);
    [v41 setY:v42];

    [v4 decodeFloatForKey:@"rz"];
    LODWORD(v17) = v43;
    v44 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion rotationRate];
    LODWORD(v45) = LODWORD(v17);
    [v44 setZ:v45];

    [v4 decodeFloatForKey:@"mx"];
    LODWORD(v17) = v46;
    int v47 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion magneticField];
    LODWORD(v48) = LODWORD(v17);
    [v47 setX:v48];

    [v4 decodeFloatForKey:@"my"];
    LODWORD(v17) = v49;
    v50 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion magneticField];
    LODWORD(v51) = LODWORD(v17);
    [v50 setY:v51];

    [v4 decodeFloatForKey:@"mz"];
    LODWORD(v17) = v52;
    double v53 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion magneticField];
    LODWORD(v54) = LODWORD(v17);
    [v53 setZ:v54];

    -[CVACMMotionTypeDeviceMotionData setMagneticFieldCalibrationLevel:](v5->_deviceMotion, "setMagneticFieldCalibrationLevel:", [v4 decodeIntForKey:@"mc"]);
    -[CVACMMotionTypeDeviceMotionData setDoingYawCorrection:](v5->_deviceMotion, "setDoingYawCorrection:", [v4 decodeBoolForKey:@"yc"]);
    -[CVACMMotionTypeDeviceMotionData setDoingBiasEstimation:](v5->_deviceMotion, "setDoingBiasEstimation:", [v4 decodeBoolForKey:@"be"]);
    -[CVACMMotionTypeDeviceMotionData setFusedWithVision:](v5->_deviceMotion, "setFusedWithVision:", [v4 decodeBoolForKey:@"fv"]);
    [v4 decodeDoubleForKey:@"t"];
    v5->_timestamp = v55;
    v5->_syncTimestamp = [v4 decodeInt64ForKey:@"st"];
  }

  return v5;
}

- (CVACMDeviceMotionData)initWithFastPathData:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CVACMDeviceMotionData;
  v5 = [(CVACMDeviceMotionData *)&v11 init];
  if (v5)
  {
    objc_super v6 = [[CVACMMotionTypeDeviceMotionData alloc] initWithFastPathData:v4];
    deviceMotion = v5->_deviceMotion;
    v5->_deviceMotion = v6;

    uint64_t v8 = [v4 bytes];
    if (*(_WORD *)v8 != 3)
    {
      v9 = 0;
      goto LABEL_6;
    }
    v5->_timestamp = *(double *)(v8 + 16);
    v5->_syncTimestamp = *(void *)(v8 + 8);
  }
  v9 = v5;
LABEL_6:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v21 = a3;
  id v4 = (void *)MEMORY[0x21D490BF0]();
  v5 = [(CVACMMotionTypeDeviceMotionData *)self->_deviceMotion quaternion];
  [v5 x];
  objc_msgSend(v21, "encodeDouble:forKey:", @"qx");

  objc_super v6 = [(CVACMMotionTypeDeviceMotionData *)self->_deviceMotion quaternion];
  [v6 y];
  objc_msgSend(v21, "encodeDouble:forKey:", @"qy");

  double v7 = [(CVACMMotionTypeDeviceMotionData *)self->_deviceMotion quaternion];
  [v7 z];
  objc_msgSend(v21, "encodeDouble:forKey:", @"qz");

  uint64_t v8 = [(CVACMMotionTypeDeviceMotionData *)self->_deviceMotion quaternion];
  [v8 w];
  objc_msgSend(v21, "encodeDouble:forKey:", @"qw");

  v9 = [(CVACMMotionTypeDeviceMotionData *)self->_deviceMotion userAcceleration];
  [v9 x];
  objc_msgSend(v21, "encodeFloat:forKey:", @"ax");

  double v10 = [(CVACMMotionTypeDeviceMotionData *)self->_deviceMotion userAcceleration];
  [v10 y];
  objc_msgSend(v21, "encodeFloat:forKey:", @"ay");

  objc_super v11 = [(CVACMMotionTypeDeviceMotionData *)self->_deviceMotion userAcceleration];
  [v11 z];
  objc_msgSend(v21, "encodeFloat:forKey:", @"az");

  double v12 = [(CVACMMotionTypeDeviceMotionData *)self->_deviceMotion gravity];
  [v12 x];
  objc_msgSend(v21, "encodeFloat:forKey:", @"gx");

  double v13 = [(CVACMMotionTypeDeviceMotionData *)self->_deviceMotion gravity];
  [v13 y];
  objc_msgSend(v21, "encodeFloat:forKey:", @"gy");

  double v14 = [(CVACMMotionTypeDeviceMotionData *)self->_deviceMotion gravity];
  [v14 z];
  objc_msgSend(v21, "encodeFloat:forKey:", @"gz");

  double v15 = [(CVACMMotionTypeDeviceMotionData *)self->_deviceMotion rotationRate];
  [v15 x];
  objc_msgSend(v21, "encodeFloat:forKey:", @"rx");

  double v16 = [(CVACMMotionTypeDeviceMotionData *)self->_deviceMotion rotationRate];
  [v16 y];
  objc_msgSend(v21, "encodeFloat:forKey:", @"ry");

  double v17 = [(CVACMMotionTypeDeviceMotionData *)self->_deviceMotion rotationRate];
  [v17 z];
  objc_msgSend(v21, "encodeFloat:forKey:", @"rz");

  v18 = [(CVACMMotionTypeDeviceMotionData *)self->_deviceMotion magneticField];
  [v18 x];
  objc_msgSend(v21, "encodeFloat:forKey:", @"mx");

  int v19 = [(CVACMMotionTypeDeviceMotionData *)self->_deviceMotion magneticField];
  [v19 y];
  objc_msgSend(v21, "encodeFloat:forKey:", @"my");

  double v20 = [(CVACMMotionTypeDeviceMotionData *)self->_deviceMotion magneticField];
  [v20 z];
  objc_msgSend(v21, "encodeFloat:forKey:", @"mz");

  objc_msgSend(v21, "encodeInteger:forKey:", -[CVACMMotionTypeDeviceMotionData magneticFieldCalibrationLevel](self->_deviceMotion, "magneticFieldCalibrationLevel"), @"mc");
  objc_msgSend(v21, "encodeBool:forKey:", -[CVACMMotionTypeDeviceMotionData doingYawCorrection](self->_deviceMotion, "doingYawCorrection"), @"yc");
  objc_msgSend(v21, "encodeBool:forKey:", -[CVACMMotionTypeDeviceMotionData doingBiasEstimation](self->_deviceMotion, "doingBiasEstimation"), @"be");
  objc_msgSend(v21, "encodeBool:forKey:", -[CVACMMotionTypeDeviceMotionData fusedWithVision](self->_deviceMotion, "fusedWithVision"), @"fv");
  [v21 encodeDouble:@"t" forKey:self->_timestamp];
  [v21 encodeInt64:self->_syncTimestamp forKey:@"st"];
}

- (CVACMDeviceMotionData)initWithCMDeviceMotion:(id)a3
{
  id v4 = a3;
  v5 = [(CVACMDeviceMotionData *)self init];
  if (v5)
  {
    [v4 timestamp];
    v5->_timestamp = v6;
    double v7 = [v4 attitude];
    [v7 quaternion];
    double v9 = v8;
    double v10 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion quaternion];
    [v10 setX:v9];

    objc_super v11 = [v4 attitude];
    [v11 quaternion];
    double v13 = v12;
    double v14 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion quaternion];
    [v14 setY:v13];

    double v15 = [v4 attitude];
    [v15 quaternion];
    double v17 = v16;
    v18 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion quaternion];
    [v18 setZ:v17];

    int v19 = [v4 attitude];
    [v19 quaternion];
    double v21 = v20;
    int v22 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion quaternion];
    [v22 setW:v21];

    [v4 userAcceleration];
    *(float *)&double v21 = v23;
    double v24 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion userAcceleration];
    LODWORD(v25) = LODWORD(v21);
    [v24 setX:v25];

    [v4 userAcceleration];
    *(float *)&double v21 = v26;
    double v27 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion userAcceleration];
    LODWORD(v28) = LODWORD(v21);
    [v27 setY:v28];

    [v4 userAcceleration];
    *(float *)&double v21 = v29;
    double v30 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion userAcceleration];
    LODWORD(v31) = LODWORD(v21);
    [v30 setZ:v31];

    [v4 gravity];
    *(float *)&double v21 = v32;
    double v33 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion gravity];
    LODWORD(v34) = LODWORD(v21);
    [v33 setX:v34];

    [v4 gravity];
    *(float *)&double v21 = v35;
    double v36 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion gravity];
    LODWORD(v37) = LODWORD(v21);
    [v36 setY:v37];

    [v4 gravity];
    *(float *)&double v21 = v38;
    double v39 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion gravity];
    LODWORD(v40) = LODWORD(v21);
    [v39 setZ:v40];

    [v4 rotationRate];
    *(float *)&double v21 = v41;
    double v42 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion rotationRate];
    LODWORD(v43) = LODWORD(v21);
    [v42 setX:v43];

    [v4 rotationRate];
    *(float *)&double v21 = v44;
    double v45 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion rotationRate];
    LODWORD(v46) = LODWORD(v21);
    [v45 setY:v46];

    [v4 rotationRate];
    *(float *)&double v21 = v47;
    double v48 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion rotationRate];
    LODWORD(v49) = LODWORD(v21);
    [v48 setZ:v49];

    if (v4)
    {
      [v4 magneticField];
      float v50 = *(double *)&v64;
    }
    else
    {
      long long v64 = 0u;
      long long v65 = 0u;
      float v50 = 0.0;
    }
    double v51 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion magneticField];
    *(float *)&double v52 = v50;
    [v51 setX:v52];

    if (v4)
    {
      [v4 magneticField];
      float v53 = *((double *)&v62 + 1);
    }
    else
    {
      long long v62 = 0u;
      long long v63 = 0u;
      float v53 = 0.0;
    }
    double v54 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion magneticField];
    *(float *)&double v55 = v53;
    [v54 setY:v55];

    if (v4)
    {
      [v4 magneticField];
      float v56 = *(double *)&v61;
    }
    else
    {
      long long v60 = 0u;
      long long v61 = 0u;
      float v56 = 0.0;
    }
    double v57 = [(CVACMMotionTypeDeviceMotionData *)v5->_deviceMotion magneticField];
    *(float *)&double v58 = v56;
    [v57 setZ:v58];

    -[CVACMMotionTypeDeviceMotionData setMagneticFieldCalibrationLevel:](v5->_deviceMotion, "setMagneticFieldCalibrationLevel:", [v4 magneticFieldCalibrationLevel]);
    -[CVACMMotionTypeDeviceMotionData setDoingYawCorrection:](v5->_deviceMotion, "setDoingYawCorrection:", [v4 doingYawCorrection]);
    -[CVACMMotionTypeDeviceMotionData setDoingBiasEstimation:](v5->_deviceMotion, "setDoingBiasEstimation:", [v4 doingBiasEstimation]);
    -[CVACMMotionTypeDeviceMotionData setFusedWithVision:](v5->_deviceMotion, "setFusedWithVision:", [v4 fusedWithVision]);
  }

  return v5;
}

- (id)dictionary
{
  uint64_t v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = [(CVACMMotionTypeDeviceMotionData *)self->_deviceMotion dictionary];
  v5 = [v3 dictionaryWithDictionary:v4];

  double v6 = [NSNumber numberWithDouble:self->_timestamp];
  [v5 setObject:v6 forKeyedSubscript:@"t"];

  double v7 = [NSNumber numberWithUnsignedLongLong:self->_syncTimestamp];
  [v5 setObject:v7 forKeyedSubscript:@"st"];

  double v8 = [NSDictionary dictionaryWithDictionary:v5];

  return v8;
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CVACMDeviceMotionData *)self dictionary];
  double v6 = [v3 stringWithFormat:@"<%@: %@>", v4, v5];

  return v6;
}

- (CVACMMotionTypeDeviceMotionData)deviceMotion
{
  return self->_deviceMotion;
}

- (void)setDeviceMotion:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unint64_t)syncTimestamp
{
  return self->_syncTimestamp;
}

- (void)setSyncTimestamp:(unint64_t)a3
{
  self->_syncTimestamp = a3;
}

- (void).cxx_destruct
{
}

@end