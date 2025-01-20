@interface CLBackgroundInertialOdometrySample
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLBIO_DeltaPosition)deltaPosition_m;
- (CLBIO_DeltaVelocity)deltaVelocity_mps;
- (CLBIO_Quaternion)quaternion;
- (CLBackgroundInertialOdometrySample)initWithCoder:(id)a3;
- (CLBackgroundInertialOdometrySample)initWithTimestamp:(id)a3 machContinuousTimestamp:(double)a4 sampleInterval:(double)a5 deltaPosition:(id)a6 deltaVelocity:(id)a7 quaternion:(id)a8;
- (CLBackgroundInertialOdometrySample)initWithTimestamp:(id)a3 machContinuousTimestamp:(double)a4 sampleInterval:(double)a5 deltaPosition:(id)a6 deltaVelocity:(id)a7 quaternion:(id)a8 referenceFrameContinuity:(unint64_t)a9 referenceFrame:(unint64_t)a10 staticFlag:(unint64_t)a11;
- (NSDate)cfAbsTimestamp;
- (double)machContinuousTimestamp_s;
- (double)sampleInterval_s;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)referenceFrameContinuity;
- (unint64_t)sessionReferenceFrame;
- (unint64_t)staticFlag;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLBackgroundInertialOdometrySample

- (CLBackgroundInertialOdometrySample)initWithTimestamp:(id)a3 machContinuousTimestamp:(double)a4 sampleInterval:(double)a5 deltaPosition:(id)a6 deltaVelocity:(id)a7 quaternion:(id)a8 referenceFrameContinuity:(unint64_t)a9 referenceFrame:(unint64_t)a10 staticFlag:(unint64_t)a11
{
  v21.receiver = self;
  v21.super_class = (Class)CLBackgroundInertialOdometrySample;
  v19 = [(CLBackgroundInertialOdometrySample *)&v21 init];
  if (v19)
  {
    v19->_cfAbsTimestamp = (NSDate *)a3;
    v19->_machContinuousTimestamp_s = a4;
    v19->_sampleInterval_s = a5;
    v19->_deltaPosition_m = (CLBIO_DeltaPosition *)a6;
    v19->_deltaVelocity_mps = (CLBIO_DeltaVelocity *)a7;
    v19->_quaternion = (CLBIO_Quaternion *)a8;
    v19->_referenceFrameContinuity = a9;
    v19->_sessionReferenceFrame = a10;
    v19->_staticFlag = a11;
  }
  return v19;
}

- (CLBackgroundInertialOdometrySample)initWithTimestamp:(id)a3 machContinuousTimestamp:(double)a4 sampleInterval:(double)a5 deltaPosition:(id)a6 deltaVelocity:(id)a7 quaternion:(id)a8
{
  return [(CLBackgroundInertialOdometrySample *)self initWithTimestamp:a3 machContinuousTimestamp:a6 sampleInterval:a7 deltaPosition:a8 deltaVelocity:0 quaternion:1 referenceFrameContinuity:a4 referenceFrame:a5 staticFlag:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(CLBackgroundInertialOdometrySample *)self cfAbsTimestamp];
  [(CLBackgroundInertialOdometrySample *)self machContinuousTimestamp_s];
  double v7 = v6;
  [(CLBackgroundInertialOdometrySample *)self sampleInterval_s];
  return (id)objc_msgSend(v4, "initWithTimestamp:machContinuousTimestamp:sampleInterval:deltaPosition:deltaVelocity:quaternion:referenceFrameContinuity:referenceFrame:staticFlag:", v5, -[CLBackgroundInertialOdometrySample deltaPosition_m](self, "deltaPosition_m"), -[CLBackgroundInertialOdometrySample deltaVelocity_mps](self, "deltaVelocity_mps"), -[CLBackgroundInertialOdometrySample quaternion](self, "quaternion"), -[CLBackgroundInertialOdometrySample referenceFrameContinuity](self, "referenceFrameContinuity"), -[CLBackgroundInertialOdometrySample sessionReferenceFrame](self, "sessionReferenceFrame"), v7, v8, -[CLBackgroundInertialOdometrySample staticFlag](self, "staticFlag"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLBackgroundInertialOdometrySample;
  [(CLBackgroundInertialOdometrySample *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(NSDate *)[(CLBackgroundInertialOdometrySample *)self cfAbsTimestamp] timeIntervalSinceReferenceDate];
  uint64_t v31 = v6;
  [(CLBackgroundInertialOdometrySample *)self machContinuousTimestamp_s];
  uint64_t v30 = v7;
  [(CLBackgroundInertialOdometrySample *)self sampleInterval_s];
  uint64_t v29 = v8;
  [(CLBIO_DeltaPosition *)[(CLBackgroundInertialOdometrySample *)self deltaPosition_m] X];
  uint64_t v28 = v9;
  [(CLBIO_DeltaPosition *)[(CLBackgroundInertialOdometrySample *)self deltaPosition_m] Y];
  uint64_t v27 = v10;
  [(CLBIO_DeltaPosition *)[(CLBackgroundInertialOdometrySample *)self deltaPosition_m] Z];
  uint64_t v12 = v11;
  [(CLBIO_DeltaVelocity *)[(CLBackgroundInertialOdometrySample *)self deltaVelocity_mps] X];
  uint64_t v14 = v13;
  [(CLBIO_DeltaVelocity *)[(CLBackgroundInertialOdometrySample *)self deltaVelocity_mps] Y];
  uint64_t v16 = v15;
  [(CLBIO_DeltaVelocity *)[(CLBackgroundInertialOdometrySample *)self deltaVelocity_mps] Z];
  uint64_t v18 = v17;
  [(CLBIO_Quaternion *)[(CLBackgroundInertialOdometrySample *)self quaternion] X];
  uint64_t v20 = v19;
  [(CLBIO_Quaternion *)[(CLBackgroundInertialOdometrySample *)self quaternion] Y];
  uint64_t v22 = v21;
  [(CLBIO_Quaternion *)[(CLBackgroundInertialOdometrySample *)self quaternion] Z];
  uint64_t v24 = v23;
  [(CLBIO_Quaternion *)[(CLBackgroundInertialOdometrySample *)self quaternion] W];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"%@,cfAbsTimestamp, %.3f, machContinuousTimestamp_s, %.3f, sampleInterval_s, %.3f, deltaPosition_m.X, %.3f, deltaPosition_m.Y, %.3f, deltaPosition_m.Z, %.3f, deltaVelocity_mps.X, %.3f, deltaVelocity_mps.Y, %.3f, deltaVelocity_mps.Z, %.3f, quaternion.X, %.3f, quaternion.Y, %.3f, quaternion.Z, %.3f, quaternion.W, %.3f, referenceFrameContinuity, %zu, sessionReferenceFrame, %zu, staticFlag, %zu", v5, v31, v30, v29, v28, v27, v12, v14, v16, v18, v20, v22, v24, v25, -[CLBackgroundInertialOdometrySample referenceFrameContinuity](self, "referenceFrameContinuity"), -[CLBackgroundInertialOdometrySample sessionReferenceFrame](self, "sessionReferenceFrame"),
               [(CLBackgroundInertialOdometrySample *)self staticFlag]);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[CLBackgroundInertialOdometrySample cfAbsTimestamp](self, "cfAbsTimestamp"), @"timestamp");
  [(CLBackgroundInertialOdometrySample *)self machContinuousTimestamp_s];
  objc_msgSend(a3, "encodeDouble:forKey:", @"machContinuousTimestamp");
  [(CLBackgroundInertialOdometrySample *)self sampleInterval_s];
  objc_msgSend(a3, "encodeDouble:forKey:", @"sampleInterval");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLBackgroundInertialOdometrySample deltaPosition_m](self, "deltaPosition_m"), @"deltaPosition");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLBackgroundInertialOdometrySample deltaVelocity_mps](self, "deltaVelocity_mps"), @"deltaVelocity");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLBackgroundInertialOdometrySample quaternion](self, "quaternion"), @"quaternion");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLBackgroundInertialOdometrySample referenceFrameContinuity](self, "referenceFrameContinuity") != 0, @"referenceFrameContinuity");
  objc_msgSend(a3, "encodeInteger:forKey:", -[CLBackgroundInertialOdometrySample sessionReferenceFrame](self, "sessionReferenceFrame"), @"referenceFrame");
  unint64_t v5 = [(CLBackgroundInertialOdometrySample *)self staticFlag];

  [a3 encodeInteger:v5 forKey:@"staticFlag"];
}

- (CLBackgroundInertialOdometrySample)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLBackgroundInertialOdometrySample;
  v4 = [(CLBackgroundInertialOdometrySample *)&v8 init];
  if (v4)
  {
    v4->_cfAbsTimestamp = (NSDate *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    [a3 decodeDoubleForKey:@"machContinuousTimestamp"];
    v4->_machContinuousTimestamp_s = v5;
    [a3 decodeDoubleForKey:@"sampleInterval"];
    v4->_sampleInterval_s = v6;
    v4->_deltaPosition_m = (CLBIO_DeltaPosition *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"deltaPosition"];
    v4->_deltaVelocity_mps = (CLBIO_DeltaVelocity *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"deltaVelocity"];
    v4->_quaternion = (CLBIO_Quaternion *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"quaternion"];
    v4->_referenceFrameContinuity = [a3 decodeBoolForKey:@"referenceFrameContinuity"];
    v4->_sessionReferenceFrame = [a3 decodeIntegerForKey:@"referenceFrame"];
    v4->_staticFlag = [a3 decodeIntegerForKey:@"staticFlag"];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  int v25 = [a3 isMemberOfClass:objc_opt_class()];
  int v24 = -[NSDate isEqual:](-[CLBackgroundInertialOdometrySample cfAbsTimestamp](self, "cfAbsTimestamp"), "isEqual:", [a3 cfAbsTimestamp]);
  [(CLBackgroundInertialOdometrySample *)self machContinuousTimestamp_s];
  double v6 = v5;
  objc_msgSend(a3, "machContinuousTimestamp_s");
  double v8 = v7;
  [(CLBackgroundInertialOdometrySample *)self sampleInterval_s];
  double v10 = v9;
  objc_msgSend(a3, "sampleInterval_s");
  double v12 = v11;
  if ([(CLBackgroundInertialOdometrySample *)self deltaPosition_m]
    || objc_msgSend(a3, "deltaPosition_m"))
  {
    char v23 = !-[CLBIO_DeltaPosition isEqual:](-[CLBackgroundInertialOdometrySample deltaPosition_m](self, "deltaPosition_m"), "isEqual:", objc_msgSend(a3, "deltaPosition_m"));
  }
  else
  {
    char v23 = 0;
  }
  if ([(CLBackgroundInertialOdometrySample *)self deltaVelocity_mps]
    || objc_msgSend(a3, "deltaVelocity_mps"))
  {
    int v13 = !-[CLBIO_DeltaVelocity isEqual:](-[CLBackgroundInertialOdometrySample deltaVelocity_mps](self, "deltaVelocity_mps"), "isEqual:", objc_msgSend(a3, "deltaVelocity_mps"));
  }
  else
  {
    LOBYTE(v13) = 0;
  }
  if (-[CLBackgroundInertialOdometrySample quaternion](self, "quaternion") || [a3 quaternion]) {
    char v14 = !-[CLBIO_Quaternion isEqual:](-[CLBackgroundInertialOdometrySample quaternion](self, "quaternion"), "isEqual:", [a3 quaternion]);
  }
  else {
    char v14 = 0;
  }
  unint64_t v15 = [(CLBackgroundInertialOdometrySample *)self referenceFrameContinuity];
  uint64_t v16 = [a3 referenceFrameContinuity];
  unint64_t v17 = [(CLBackgroundInertialOdometrySample *)self sessionReferenceFrame];
  uint64_t v18 = [a3 sessionReferenceFrame];
  unint64_t v19 = [(CLBackgroundInertialOdometrySample *)self staticFlag];
  uint64_t v20 = [a3 staticFlag];
  BOOL result = 0;
  if (!((v6 != v8 || (v25 & v24 & 1) == 0) | (v10 != v12) | v23 & 1 | v13 & 1) && (v14 & 1) == 0 && v15 == v16) {
    return v17 == v18 && v19 == v20;
  }
  return result;
}

- (NSDate)cfAbsTimestamp
{
  return self->_cfAbsTimestamp;
}

- (double)machContinuousTimestamp_s
{
  return self->_machContinuousTimestamp_s;
}

- (double)sampleInterval_s
{
  return self->_sampleInterval_s;
}

- (CLBIO_DeltaPosition)deltaPosition_m
{
  return self->_deltaPosition_m;
}

- (CLBIO_DeltaVelocity)deltaVelocity_mps
{
  return self->_deltaVelocity_mps;
}

- (CLBIO_Quaternion)quaternion
{
  return self->_quaternion;
}

- (unint64_t)referenceFrameContinuity
{
  return self->_referenceFrameContinuity;
}

- (unint64_t)sessionReferenceFrame
{
  return self->_sessionReferenceFrame;
}

- (unint64_t)staticFlag
{
  return self->_staticFlag;
}

@end