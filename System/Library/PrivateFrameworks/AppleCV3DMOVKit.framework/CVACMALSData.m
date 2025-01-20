@interface CVACMALSData
+ (BOOL)supportsSecureCoding;
+ (id)classes;
- (CVACLMotionTypeDoubleVector3)colorComponents;
- (CVACLMotionTypeVector4)rawChannels;
- (CVACMALSData)init;
- (CVACMALSData)initWithCoder:(id)a3;
- (NSArray)vendorAZOffsets;
- (NSArray)vendorRawChannels;
- (NSNumber)gain;
- (NSNumber)integrationTime;
- (double)timestamp;
- (float)vendorCCT;
- (float)vendorLux;
- (float)vendorTemperature;
- (id)debugDescription;
- (id)dictionary;
- (unint64_t)frameId;
- (unint64_t)syncTimestamp;
- (unsigned)luxValue;
- (unsigned)vendorIntegrationTime;
- (unsigned)vendorNumChannels;
- (unsigned)vendorOrientation;
- (unsigned)vendorReportInterval;
- (unsigned)vendorStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setColorComponents:(id)a3;
- (void)setFrameId:(unint64_t)a3;
- (void)setGain:(id)a3;
- (void)setIntegrationTime:(id)a3;
- (void)setLuxValue:(unsigned int)a3;
- (void)setRawChannels:(id)a3;
- (void)setSyncTimestamp:(unint64_t)a3;
- (void)setTimestamp:(double)a3;
- (void)setVendorAZOffsets:(id)a3;
- (void)setVendorCCT:(float)a3;
- (void)setVendorIntegrationTime:(unsigned int)a3;
- (void)setVendorLux:(float)a3;
- (void)setVendorNumChannels:(unsigned int)a3;
- (void)setVendorOrientation:(unsigned __int8)a3;
- (void)setVendorRawChannels:(id)a3;
- (void)setVendorReportInterval:(unsigned int)a3;
- (void)setVendorStatus:(unsigned int)a3;
- (void)setVendorTemperature:(float)a3;
@end

@implementation CVACMALSData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_267C58BD8 == -1)
  {
    v2 = (void *)qword_267C58BD0;
  }
  else
  {
    dispatch_once(&qword_267C58BD8, &unk_26CB5E398);
    v2 = (void *)qword_267C58BD0;
  }
  return v2;
}

- (CVACMALSData)init
{
  v8.receiver = self;
  v8.super_class = (Class)CVACMALSData;
  v2 = [(CVACMALSData *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    rawChannels = v2->_rawChannels;
    v2->_rawChannels = (CVACLMotionTypeVector4 *)v3;

    uint64_t v5 = objc_opt_new();
    colorComponents = v2->_colorComponents;
    v2->_colorComponents = (CVACLMotionTypeDoubleVector3 *)v5;
  }
  return v2;
}

- (CVACMALSData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CVACMALSData *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x21D490BF0]();
    v5->_luxValue = [v4 decodeIntForKey:@"lux"];
    [v4 decodeFloatForKey:@"rc0"];
    -[CVACLMotionTypeVector4 setX:](v5->_rawChannels, "setX:");
    [v4 decodeFloatForKey:@"rc1"];
    -[CVACLMotionTypeVector4 setY:](v5->_rawChannels, "setY:");
    [v4 decodeFloatForKey:@"rc2"];
    -[CVACLMotionTypeVector4 setZ:](v5->_rawChannels, "setZ:");
    [v4 decodeFloatForKey:@"rc3"];
    -[CVACLMotionTypeVector4 setW:](v5->_rawChannels, "setW:");
    [v4 decodeDoubleForKey:@"cx"];
    -[CVACLMotionTypeDoubleVector3 setX:](v5->_colorComponents, "setX:");
    [v4 decodeDoubleForKey:@"cy"];
    -[CVACLMotionTypeDoubleVector3 setY:](v5->_colorComponents, "setY:");
    [v4 decodeDoubleForKey:@"cz"];
    -[CVACLMotionTypeDoubleVector3 setZ:](v5->_colorComponents, "setZ:");
    [v4 decodeDoubleForKey:@"t"];
    v5->_timestamp = v7;
    v5->_syncTimestamp = [v4 decodeInt64ForKey:@"st"];
    v5->_frameId = [v4 decodeInt64ForKey:@"fi"];
    uint64_t v8 = [v4 decodeObjectForKey:@"g"];
    gain = v5->_gain;
    v5->_gain = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"e"];
    integrationTime = v5->_integrationTime;
    v5->_integrationTime = (NSNumber *)v10;

    v5->_vendorNumChannels = [v4 decodeIntForKey:@"vnc"];
    uint64_t v12 = [v4 decodeObjectForKey:@"vch"];
    vendorRawChannels = v5->_vendorRawChannels;
    v5->_vendorRawChannels = (NSArray *)v12;

    v5->_vendorStatus = [v4 decodeIntForKey:@"vstat"];
    v5->_vendorOrientation = [v4 decodeIntForKey:@"vori"];
    v5->_vendorIntegrationTime = [v4 decodeIntForKey:@"vintt"];
    v5->_vendorReportInterval = [v4 decodeIntForKey:@"vrepi"];
    [v4 decodeFloatForKey:@"vlux"];
    v5->_vendorLux = v14;
    [v4 decodeFloatForKey:@"vtemp"];
    v5->_vendorTemperature = v15;
    [v4 decodeFloatForKey:@"vcct"];
    v5->_vendorCCT = v16;
    uint64_t v17 = [v4 decodeObjectForKey:@"vazo"];
    vendorAZOffsets = v5->_vendorAZOffsets;
    v5->_vendorAZOffsets = (NSArray *)v17;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = (void *)MEMORY[0x21D490BF0]();
  [v8 encodeInt:self->_luxValue forKey:@"lux"];
  [(CVACLMotionTypeVector4 *)self->_rawChannels x];
  objc_msgSend(v8, "encodeFloat:forKey:", @"rc0");
  [(CVACLMotionTypeVector4 *)self->_rawChannels y];
  objc_msgSend(v8, "encodeFloat:forKey:", @"rc1");
  [(CVACLMotionTypeVector4 *)self->_rawChannels z];
  objc_msgSend(v8, "encodeFloat:forKey:", @"rc2");
  [(CVACLMotionTypeVector4 *)self->_rawChannels w];
  objc_msgSend(v8, "encodeFloat:forKey:", @"rc3");
  [(CVACLMotionTypeDoubleVector3 *)self->_colorComponents x];
  objc_msgSend(v8, "encodeDouble:forKey:", @"cx");
  [(CVACLMotionTypeDoubleVector3 *)self->_colorComponents y];
  objc_msgSend(v8, "encodeDouble:forKey:", @"cy");
  [(CVACLMotionTypeDoubleVector3 *)self->_colorComponents z];
  objc_msgSend(v8, "encodeDouble:forKey:", @"cz");
  [v8 encodeDouble:@"t" forKey:self->_timestamp];
  [v8 encodeInt64:self->_syncTimestamp forKey:@"st"];
  [v8 encodeInt64:self->_frameId forKey:@"fi"];
  [v8 encodeObject:self->_gain forKey:@"g"];
  [v8 encodeObject:self->_integrationTime forKey:@"e"];
  [v8 encodeInt:self->_vendorNumChannels forKey:@"vnc"];
  [v8 encodeObject:self->_vendorRawChannels forKey:@"vch"];
  [v8 encodeInt:self->_vendorStatus forKey:@"vstat"];
  [v8 encodeInt:self->_vendorOrientation forKey:@"vori"];
  [v8 encodeInt:self->_vendorIntegrationTime forKey:@"vintt"];
  [v8 encodeInt:self->_vendorReportInterval forKey:@"vrepi"];
  *(float *)&double v5 = self->_vendorLux;
  [v8 encodeFloat:@"vlux" forKey:v5];
  *(float *)&double v6 = self->_vendorTemperature;
  [v8 encodeFloat:@"vtemp" forKey:v6];
  *(float *)&double v7 = self->_vendorCCT;
  [v8 encodeFloat:@"vcct" forKey:v7];
  [v8 encodeObject:self->_vendorAZOffsets forKey:@"vazo"];
}

- (id)dictionary
{
  v39[23] = *MEMORY[0x263EF8340];
  v38[0] = @"lux";
  v37 = [NSNumber numberWithUnsignedInt:self->_luxValue];
  v39[0] = v37;
  v38[1] = @"rc0";
  uint64_t v3 = NSNumber;
  [(CVACLMotionTypeVector4 *)self->_rawChannels x];
  v36 = objc_msgSend(v3, "numberWithFloat:");
  v39[1] = v36;
  v38[2] = @"rc1";
  id v4 = NSNumber;
  [(CVACLMotionTypeVector4 *)self->_rawChannels y];
  v35 = objc_msgSend(v4, "numberWithFloat:");
  v39[2] = v35;
  v38[3] = @"rc2";
  double v5 = NSNumber;
  [(CVACLMotionTypeVector4 *)self->_rawChannels z];
  v34 = objc_msgSend(v5, "numberWithFloat:");
  v39[3] = v34;
  v38[4] = @"rc3";
  double v6 = NSNumber;
  [(CVACLMotionTypeVector4 *)self->_rawChannels w];
  v33 = objc_msgSend(v6, "numberWithFloat:");
  v39[4] = v33;
  v38[5] = @"cx";
  double v7 = NSNumber;
  [(CVACLMotionTypeDoubleVector3 *)self->_colorComponents x];
  v32 = objc_msgSend(v7, "numberWithDouble:");
  v39[5] = v32;
  v38[6] = @"cy";
  id v8 = NSNumber;
  [(CVACLMotionTypeDoubleVector3 *)self->_colorComponents y];
  v31 = objc_msgSend(v8, "numberWithDouble:");
  v39[6] = v31;
  v38[7] = @"cz";
  v9 = NSNumber;
  [(CVACLMotionTypeDoubleVector3 *)self->_colorComponents z];
  v30 = objc_msgSend(v9, "numberWithDouble:");
  v39[7] = v30;
  v38[8] = @"t";
  v29 = [NSNumber numberWithDouble:self->_timestamp];
  v39[8] = v29;
  v38[9] = @"st";
  v28 = [NSNumber numberWithUnsignedLongLong:self->_syncTimestamp];
  v39[9] = v28;
  v38[10] = @"fi";
  v27 = [NSNumber numberWithUnsignedLongLong:self->_frameId];
  gain = self->_gain;
  integrationTime = self->_integrationTime;
  v39[10] = v27;
  v39[11] = gain;
  v38[11] = @"g";
  v38[12] = @"e";
  v39[12] = integrationTime;
  v38[13] = @"vnc";
  uint64_t v12 = [NSNumber numberWithUnsignedInt:self->_vendorNumChannels];
  vendorRawChannels = self->_vendorRawChannels;
  v39[13] = v12;
  v39[14] = vendorRawChannels;
  v38[14] = @"vch";
  v38[15] = @"vstat";
  float v14 = [NSNumber numberWithUnsignedInt:self->_vendorStatus];
  v39[15] = v14;
  v38[16] = @"vori";
  float v15 = [NSNumber numberWithUnsignedChar:self->_vendorOrientation];
  v39[16] = v15;
  v38[17] = @"vintt";
  float v16 = [NSNumber numberWithUnsignedInt:self->_vendorIntegrationTime];
  v39[17] = v16;
  v38[18] = @"vrepi";
  uint64_t v17 = [NSNumber numberWithUnsignedInt:self->_vendorReportInterval];
  v39[18] = v17;
  v38[19] = @"vlux";
  *(float *)&double v18 = self->_vendorLux;
  v19 = [NSNumber numberWithFloat:v18];
  v39[19] = v19;
  v38[20] = @"vtemp";
  *(float *)&double v20 = self->_vendorTemperature;
  v21 = [NSNumber numberWithFloat:v20];
  v39[20] = v21;
  v38[21] = @"vcct";
  *(float *)&double v22 = self->_vendorCCT;
  v23 = [NSNumber numberWithFloat:v22];
  v38[22] = @"vazo";
  vendorAZOffsets = self->_vendorAZOffsets;
  v39[21] = v23;
  v39[22] = vendorAZOffsets;
  v25 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:23];

  return v25;
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(CVACMALSData *)self dictionary];
  double v6 = [v3 stringWithFormat:@"<%@: %@>", v4, v5];

  return v6;
}

- (unsigned)luxValue
{
  return self->_luxValue;
}

- (void)setLuxValue:(unsigned int)a3
{
  self->_luxValue = a3;
}

- (CVACLMotionTypeVector4)rawChannels
{
  return self->_rawChannels;
}

- (void)setRawChannels:(id)a3
{
}

- (CVACLMotionTypeDoubleVector3)colorComponents
{
  return self->_colorComponents;
}

- (void)setColorComponents:(id)a3
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

- (NSNumber)gain
{
  return self->_gain;
}

- (void)setGain:(id)a3
{
}

- (NSNumber)integrationTime
{
  return self->_integrationTime;
}

- (void)setIntegrationTime:(id)a3
{
}

- (unint64_t)frameId
{
  return self->_frameId;
}

- (void)setFrameId:(unint64_t)a3
{
  self->_frameId = a3;
}

- (unsigned)vendorNumChannels
{
  return self->_vendorNumChannels;
}

- (void)setVendorNumChannels:(unsigned int)a3
{
  self->_vendorNumChannels = a3;
}

- (NSArray)vendorRawChannels
{
  return self->_vendorRawChannels;
}

- (void)setVendorRawChannels:(id)a3
{
}

- (unsigned)vendorStatus
{
  return self->_vendorStatus;
}

- (void)setVendorStatus:(unsigned int)a3
{
  self->_vendorStatus = a3;
}

- (unsigned)vendorOrientation
{
  return self->_vendorOrientation;
}

- (void)setVendorOrientation:(unsigned __int8)a3
{
  self->_vendorOrientation = a3;
}

- (unsigned)vendorIntegrationTime
{
  return self->_vendorIntegrationTime;
}

- (void)setVendorIntegrationTime:(unsigned int)a3
{
  self->_vendorIntegrationTime = a3;
}

- (unsigned)vendorReportInterval
{
  return self->_vendorReportInterval;
}

- (void)setVendorReportInterval:(unsigned int)a3
{
  self->_vendorReportInterval = a3;
}

- (float)vendorLux
{
  return self->_vendorLux;
}

- (void)setVendorLux:(float)a3
{
  self->_vendorLux = a3;
}

- (float)vendorTemperature
{
  return self->_vendorTemperature;
}

- (void)setVendorTemperature:(float)a3
{
  self->_vendorTemperature = a3;
}

- (float)vendorCCT
{
  return self->_vendorCCT;
}

- (void)setVendorCCT:(float)a3
{
  self->_vendorCCT = a3;
}

- (NSArray)vendorAZOffsets
{
  return self->_vendorAZOffsets;
}

- (void)setVendorAZOffsets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorAZOffsets, 0);
  objc_storeStrong((id *)&self->_vendorRawChannels, 0);
  objc_storeStrong((id *)&self->_integrationTime, 0);
  objc_storeStrong((id *)&self->_gain, 0);
  objc_storeStrong((id *)&self->_colorComponents, 0);
  objc_storeStrong((id *)&self->_rawChannels, 0);
}

@end