@interface CVACMMotionData
+ (BOOL)supportsSecureCoding;
+ (id)classes;
- (CVACLMotionTypeDoubleVector4)quaternion;
- (CVACLMotionTypeVector3)acceleration;
- (CVACLMotionTypeVector3)rotationRate;
- (CVACMMotionData)init;
- (CVACMMotionData)initWithCoder:(id)a3;
- (double)timestamp;
- (id)debugDescription;
- (id)dictionary;
- (unint64_t)frameId;
- (unint64_t)sequenceNumber;
- (unint64_t)syncTimestamp;
- (void)encodeWithCoder:(id)a3;
- (void)setAcceleration:(id)a3;
- (void)setFrameId:(unint64_t)a3;
- (void)setQuaternion:(id)a3;
- (void)setRotationRate:(id)a3;
- (void)setSequenceNumber:(unint64_t)a3;
- (void)setSyncTimestamp:(unint64_t)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation CVACMMotionData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_267C58BF8 == -1)
  {
    v2 = (void *)qword_267C58BF0;
  }
  else
  {
    dispatch_once(&qword_267C58BF8, &unk_26CB5E3D8);
    v2 = (void *)qword_267C58BF0;
  }
  return v2;
}

- (CVACMMotionData)init
{
  v10.receiver = self;
  v10.super_class = (Class)CVACMMotionData;
  v2 = [(CVACMMotionData *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    quaternion = v2->_quaternion;
    v2->_quaternion = (CVACLMotionTypeDoubleVector4 *)v3;

    uint64_t v5 = objc_opt_new();
    acceleration = v2->_acceleration;
    v2->_acceleration = (CVACLMotionTypeVector3 *)v5;

    uint64_t v7 = objc_opt_new();
    rotationRate = v2->_rotationRate;
    v2->_rotationRate = (CVACLMotionTypeVector3 *)v7;
  }
  return v2;
}

- (CVACMMotionData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CVACMMotionData *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x21D490BF0]();
    [v4 decodeDoubleForKey:@"qx"];
    -[CVACLMotionTypeDoubleVector4 setX:](v5->_quaternion, "setX:");
    [v4 decodeDoubleForKey:@"qy"];
    -[CVACLMotionTypeDoubleVector4 setY:](v5->_quaternion, "setY:");
    [v4 decodeDoubleForKey:@"qz"];
    -[CVACLMotionTypeDoubleVector4 setZ:](v5->_quaternion, "setZ:");
    [v4 decodeDoubleForKey:@"qw"];
    -[CVACLMotionTypeDoubleVector4 setW:](v5->_quaternion, "setW:");
    [v4 decodeFloatForKey:@"ax"];
    -[CVACLMotionTypeVector3 setX:](v5->_acceleration, "setX:");
    [v4 decodeFloatForKey:@"ay"];
    -[CVACLMotionTypeVector3 setY:](v5->_acceleration, "setY:");
    [v4 decodeFloatForKey:@"az"];
    -[CVACLMotionTypeVector3 setZ:](v5->_acceleration, "setZ:");
    [v4 decodeFloatForKey:@"rx"];
    -[CVACLMotionTypeVector3 setX:](v5->_rotationRate, "setX:");
    [v4 decodeFloatForKey:@"ry"];
    -[CVACLMotionTypeVector3 setY:](v5->_rotationRate, "setY:");
    [v4 decodeFloatForKey:@"rz"];
    -[CVACLMotionTypeVector3 setZ:](v5->_rotationRate, "setZ:");
    [v4 decodeDoubleForKey:@"t"];
    v5->_timestamp = v7;
    v5->_syncTimestamp = [v4 decodeInt64ForKey:@"st"];
    v5->_sequenceNumber = [v4 decodeInt64ForKey:@"sn"];
    v5->_frameId = [v4 decodeInt64ForKey:@"fi"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x21D490BF0]();
  [(CVACLMotionTypeDoubleVector4 *)self->_quaternion x];
  objc_msgSend(v5, "encodeDouble:forKey:", @"qx");
  [(CVACLMotionTypeDoubleVector4 *)self->_quaternion y];
  objc_msgSend(v5, "encodeDouble:forKey:", @"qy");
  [(CVACLMotionTypeDoubleVector4 *)self->_quaternion z];
  objc_msgSend(v5, "encodeDouble:forKey:", @"qz");
  [(CVACLMotionTypeDoubleVector4 *)self->_quaternion w];
  objc_msgSend(v5, "encodeDouble:forKey:", @"qw");
  [(CVACLMotionTypeVector3 *)self->_acceleration x];
  objc_msgSend(v5, "encodeFloat:forKey:", @"ax");
  [(CVACLMotionTypeVector3 *)self->_acceleration y];
  objc_msgSend(v5, "encodeFloat:forKey:", @"ay");
  [(CVACLMotionTypeVector3 *)self->_acceleration z];
  objc_msgSend(v5, "encodeFloat:forKey:", @"az");
  [(CVACLMotionTypeVector3 *)self->_rotationRate x];
  objc_msgSend(v5, "encodeFloat:forKey:", @"rx");
  [(CVACLMotionTypeVector3 *)self->_rotationRate y];
  objc_msgSend(v5, "encodeFloat:forKey:", @"ry");
  [(CVACLMotionTypeVector3 *)self->_rotationRate z];
  objc_msgSend(v5, "encodeFloat:forKey:", @"rz");
  [v5 encodeDouble:@"t" forKey:self->_timestamp];
  [v5 encodeInt64:self->_syncTimestamp forKey:@"st"];
  [v5 encodeInt64:self->_sequenceNumber forKey:@"sn"];
  [v5 encodeInt64:self->_frameId forKey:@"fi"];
}

- (id)dictionary
{
  v30[14] = *MEMORY[0x263EF8340];
  v29[0] = @"qx";
  uint64_t v3 = NSNumber;
  [(CVACLMotionTypeDoubleVector4 *)self->_quaternion x];
  v28 = objc_msgSend(v3, "numberWithDouble:");
  v30[0] = v28;
  v29[1] = @"qy";
  id v4 = NSNumber;
  [(CVACLMotionTypeDoubleVector4 *)self->_quaternion y];
  v27 = objc_msgSend(v4, "numberWithDouble:");
  v30[1] = v27;
  v29[2] = @"qz";
  id v5 = NSNumber;
  [(CVACLMotionTypeDoubleVector4 *)self->_quaternion z];
  v26 = objc_msgSend(v5, "numberWithDouble:");
  v30[2] = v26;
  v29[3] = @"qw";
  v6 = NSNumber;
  [(CVACLMotionTypeDoubleVector4 *)self->_quaternion w];
  v25 = objc_msgSend(v6, "numberWithDouble:");
  v30[3] = v25;
  v29[4] = @"ax";
  double v7 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_acceleration x];
  v24 = objc_msgSend(v7, "numberWithFloat:");
  v30[4] = v24;
  v29[5] = @"ay";
  v8 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_acceleration y];
  v9 = objc_msgSend(v8, "numberWithFloat:");
  v30[5] = v9;
  v29[6] = @"az";
  objc_super v10 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_acceleration z];
  v11 = objc_msgSend(v10, "numberWithFloat:");
  v30[6] = v11;
  v29[7] = @"rx";
  v12 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_rotationRate x];
  v13 = objc_msgSend(v12, "numberWithFloat:");
  v30[7] = v13;
  v29[8] = @"ry";
  v14 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_rotationRate y];
  v15 = objc_msgSend(v14, "numberWithFloat:");
  v30[8] = v15;
  v29[9] = @"rz";
  v16 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_rotationRate z];
  v17 = objc_msgSend(v16, "numberWithFloat:");
  v30[9] = v17;
  v29[10] = @"t";
  v18 = [NSNumber numberWithDouble:self->_timestamp];
  v30[10] = v18;
  v29[11] = @"st";
  v19 = [NSNumber numberWithUnsignedLongLong:self->_syncTimestamp];
  v30[11] = v19;
  v29[12] = @"sn";
  v20 = [NSNumber numberWithUnsignedLongLong:self->_sequenceNumber];
  v30[12] = v20;
  v29[13] = @"fi";
  v21 = [NSNumber numberWithUnsignedLongLong:self->_frameId];
  v30[13] = v21;
  v22 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:14];

  return v22;
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CVACMMotionData *)self dictionary];
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

- (CVACLMotionTypeVector3)acceleration
{
  return self->_acceleration;
}

- (void)setAcceleration:(id)a3
{
}

- (CVACLMotionTypeVector3)rotationRate
{
  return self->_rotationRate;
}

- (void)setRotationRate:(id)a3
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

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (unint64_t)frameId
{
  return self->_frameId;
}

- (void)setFrameId:(unint64_t)a3
{
  self->_frameId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationRate, 0);
  objc_storeStrong((id *)&self->_acceleration, 0);
  objc_storeStrong((id *)&self->_quaternion, 0);
}

@end