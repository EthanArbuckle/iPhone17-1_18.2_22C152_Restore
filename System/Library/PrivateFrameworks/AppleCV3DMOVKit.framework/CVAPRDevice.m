@interface CVAPRDevice
+ (BOOL)supportsSecureCoding;
+ (id)classes;
- (CVAPRAngleMeasurement)azimuth;
- (CVAPRAngleMeasurement)elevation;
- (CVAPRDevice)init;
- (CVAPRDevice)initWithCoder:(id)a3;
- (CVAPRRangeMeasurement)range;
- (NSNumber)sessionID;
- (NSUUID)UUID;
- (double)mach_continuous_time;
- (double)measurementTimestamp;
- (double)timestamp;
- (double)utc_time;
- (int64_t)measurementNumber;
- (int64_t)referenceFrame;
- (void)addTimes;
- (void)encodeWithCoder:(id)a3;
- (void)setAzimuth:(id)a3;
- (void)setElevation:(id)a3;
- (void)setMach_continuous_time:(double)a3;
- (void)setMeasurementNumber:(int64_t)a3;
- (void)setMeasurementTimestamp:(double)a3;
- (void)setRange:(id)a3;
- (void)setReferenceFrame:(int64_t)a3;
- (void)setSessionID:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setUUID:(id)a3;
- (void)setUtc_time:(double)a3;
@end

@implementation CVAPRDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_267C58C48 == -1)
  {
    v2 = (void *)qword_267C58C40;
  }
  else
  {
    dispatch_once(&qword_267C58C48, &unk_26CB5E498);
    v2 = (void *)qword_267C58C40;
  }
  return v2;
}

- (void)addTimes
{
  mach_get_times();
  if (dword_267C58C54)
  {
    double v3 = *(double *)&qword_267C58C58;
  }
  else
  {
    mach_timebase_info((mach_timebase_info_t)&dword_267C58C50);
    LODWORD(v4) = dword_267C58C50;
    LODWORD(v5) = dword_267C58C54;
    double v3 = (double)v4 / (double)v5 / 1000000000.0;
    qword_267C58C58 = *(void *)&v3;
  }
  self->_mach_continuous_time = v3 * (double)0;
  self->_utc_time = (double)0 / 1000000000.0 + (double)0;
  self->_timestamp = CACurrentMediaTime();
}

- (CVAPRDevice)init
{
  v10.receiver = self;
  v10.super_class = (Class)CVAPRDevice;
  v2 = [(CVAPRDevice *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    range = v2->_range;
    v2->_range = (CVAPRRangeMeasurement *)v3;

    uint64_t v5 = objc_opt_new();
    azimuth = v2->_azimuth;
    v2->_azimuth = (CVAPRAngleMeasurement *)v5;

    uint64_t v7 = objc_opt_new();
    elevation = v2->_elevation;
    v2->_elevation = (CVAPRAngleMeasurement *)v7;

    [(CVAPRDevice *)v2 addTimes];
  }
  return v2;
}

- (CVAPRDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CVAPRDevice *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x21D490BF0]();
    v5->_referenceFrame = [v4 decodeIntegerForKey:@"reff"];
    [v4 decodeDoubleForKey:@"rngm"];
    -[CVAPRRangeMeasurement setMeasurement:](v5->_range, "setMeasurement:");
    [v4 decodeDoubleForKey:@"rngu"];
    -[CVAPRRangeMeasurement setUncertainty:](v5->_range, "setUncertainty:");
    [v4 decodeDoubleForKey:@"azmm"];
    -[CVAPRAngleMeasurement setMeasurement:](v5->_azimuth, "setMeasurement:");
    [v4 decodeDoubleForKey:@"azmu"];
    -[CVAPRAngleMeasurement setUncertainty:](v5->_azimuth, "setUncertainty:");
    [v4 decodeDoubleForKey:@"elvm"];
    -[CVAPRAngleMeasurement setMeasurement:](v5->_elevation, "setMeasurement:");
    [v4 decodeDoubleForKey:@"elvu"];
    -[CVAPRAngleMeasurement setUncertainty:](v5->_elevation, "setUncertainty:");
    uint64_t v7 = [v4 decodeObjectForKey:@"uuid"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v7;

    uint64_t v9 = [v4 decodeObjectForKey:@"sid"];
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSNumber *)v9;

    v5->_measurementNumber = [v4 decodeIntegerForKey:@"mesn"];
    [v4 decodeDoubleForKey:@"mest"];
    v5->_measurementTimestamp = v11;
    [v4 decodeDoubleForKey:@"t"];
    v5->_timestamp = v12;
    [v4 decodeDoubleForKey:@"mct"];
    v5->_mach_continuous_time = v13;
    [v4 decodeDoubleForKey:@"ut"];
    v5->_utc_time = v14;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x21D490BF0]();
  [v5 encodeInteger:self->_referenceFrame forKey:@"reff"];
  [(CVAPRRangeMeasurement *)self->_range measurement];
  objc_msgSend(v5, "encodeDouble:forKey:", @"rngm");
  [(CVAPRRangeMeasurement *)self->_range uncertainty];
  objc_msgSend(v5, "encodeDouble:forKey:", @"rngu");
  [(CVAPRAngleMeasurement *)self->_azimuth measurement];
  objc_msgSend(v5, "encodeDouble:forKey:", @"azmm");
  [(CVAPRAngleMeasurement *)self->_azimuth uncertainty];
  objc_msgSend(v5, "encodeDouble:forKey:", @"azmu");
  [(CVAPRAngleMeasurement *)self->_elevation measurement];
  objc_msgSend(v5, "encodeDouble:forKey:", @"elvm");
  [(CVAPRAngleMeasurement *)self->_elevation uncertainty];
  objc_msgSend(v5, "encodeDouble:forKey:", @"elvu");
  [v5 encodeObject:self->_UUID forKey:@"uuid"];
  [v5 encodeObject:self->_sessionID forKey:@"sid"];
  [v5 encodeInteger:self->_measurementNumber forKey:@"mesn"];
  [v5 encodeDouble:@"mest" forKey:self->_measurementTimestamp];
  [v5 encodeDouble:@"t" forKey:self->_timestamp];
  [v5 encodeDouble:@"mct" forKey:self->_mach_continuous_time];
  [v5 encodeDouble:@"ut" forKey:self->_utc_time];
}

- (int64_t)referenceFrame
{
  return self->_referenceFrame;
}

- (void)setReferenceFrame:(int64_t)a3
{
  self->_referenceFrame = a3;
}

- (CVAPRRangeMeasurement)range
{
  return self->_range;
}

- (void)setRange:(id)a3
{
}

- (CVAPRAngleMeasurement)azimuth
{
  return self->_azimuth;
}

- (void)setAzimuth:(id)a3
{
}

- (CVAPRAngleMeasurement)elevation
{
  return self->_elevation;
}

- (void)setElevation:(id)a3
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (int64_t)measurementNumber
{
  return self->_measurementNumber;
}

- (void)setMeasurementNumber:(int64_t)a3
{
  self->_measurementNumber = a3;
}

- (double)measurementTimestamp
{
  return self->_measurementTimestamp;
}

- (void)setMeasurementTimestamp:(double)a3
{
  self->_measurementTimestamp = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)mach_continuous_time
{
  return self->_mach_continuous_time;
}

- (void)setMach_continuous_time:(double)a3
{
  self->_mach_continuous_time = a3;
}

- (double)utc_time
{
  return self->_utc_time;
}

- (void)setUtc_time:(double)a3
{
  self->_utc_time = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_elevation, 0);
  objc_storeStrong((id *)&self->_azimuth, 0);
  objc_storeStrong((id *)&self->_range, 0);
}

@end