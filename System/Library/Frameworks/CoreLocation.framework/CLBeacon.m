@interface CLBeacon
+ (BOOL)supportsSecureCoding;
- (CLBeacon)initWithCoder:(id)a3;
- (CLBeacon)initWithProximityUUID:(id)a3 major:(id)a4 minor:(id)a5 proximity:(int64_t)a6 accuracy:(double)a7 rssi:(int64_t)a8;
- (CLBeacon)initWithUUID:(id)a3 major:(id)a4 minor:(id)a5 proximity:(int64_t)a6 accuracy:(double)a7 rssi:(int64_t)a8 timestamp:(double)a9;
- (CLLocationAccuracy)accuracy;
- (CLProximity)proximity;
- (NSDate)timestamp;
- (NSInteger)rssi;
- (NSNumber)major;
- (NSNumber)minor;
- (NSUUID)UUID;
- (NSUUID)proximityUUID;
- (id)description;
- (int)referenceFrame;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLBeacon

- (NSUUID)UUID
{
  return self->_internal->proximityUUID;
}

- (NSUUID)proximityUUID
{
  return self->_internal->proximityUUID;
}

- (NSNumber)major
{
  return self->_internal->major;
}

- (NSNumber)minor
{
  return self->_internal->minor;
}

- (CLProximity)proximity
{
  return self->_internal->proximity;
}

- (CLLocationAccuracy)accuracy
{
  return self->_internal->accuracy;
}

- (NSInteger)rssi
{
  return self->_internal->rssi;
}

- (NSDate)timestamp
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_internal->timestamp];
}

- (CLBeacon)initWithProximityUUID:(id)a3 major:(id)a4 minor:(id)a5 proximity:(int64_t)a6 accuracy:(double)a7 rssi:(int64_t)a8
{
  v16.receiver = self;
  v16.super_class = (Class)CLBeacon;
  v14 = [(CLBeacon *)&v16 init];
  if (v14)
  {
    v14->_internal = objc_alloc_init(CLBeaconInternal);
    v14->_internal->proximityUUID = (NSUUID *)[a3 copy];
    v14->_internal->major = (NSNumber *)[a4 copy];
    v14->_internal->minor = (NSNumber *)[a5 copy];
    v14->_internal->proximity = a6;
    v14->_internal->accuracy = a7;
    v14->_internal->rssi = a8;
  }
  return v14;
}

- (CLBeacon)initWithUUID:(id)a3 major:(id)a4 minor:(id)a5 proximity:(int64_t)a6 accuracy:(double)a7 rssi:(int64_t)a8 timestamp:(double)a9
{
  result = [(CLBeacon *)self initWithProximityUUID:a3 major:a4 minor:a5 proximity:a6 accuracy:a8 rssi:a7];
  result->_internal->timestamp = a9;
  return result;
}

- (void)dealloc
{
  self->_internal->proximityUUID = 0;
  self->_internal->major = 0;

  self->_internal->minor = 0;
  self->_internal = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLBeacon;
  [(CLBeacon *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLBeacon)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLBeacon;
  v4 = [(CLBeacon *)&v8 init];
  if (v4)
  {
    v4->_internal = objc_alloc_init(CLBeaconInternal);
    if ([a3 allowsKeyedCoding])
    {
      v4->_internal->proximityUUID = (NSUUID *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLBeaconCodingKeyProximityUUID"];
      v4->_internal->major = (NSNumber *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLBeaconCodingKeyMajor"];
      v4->_internal->minor = (NSNumber *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLBeaconCodingKeyMinor"];
      v4->_internal->proximity = (int)[a3 decodeIntForKey:@"kCLBeaconCodingKeyProximity"];
      [a3 decodeDoubleForKey:@"kCLBeaconCodingKeyAccuracy"];
      v4->_internal->accuracy = v5;
      v4->_internal->rssi = [a3 decodeIntegerForKey:@"kCLBeaconCodingKeyRSSI"];
    }
    else
    {
      v4->_internal->proximityUUID = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDString:", objc_msgSend(a3, "decodeObject"));
      v4->_internal->major = (NSNumber *)(id)[a3 decodeObject];
      v4->_internal->minor = (NSNumber *)(id)[a3 decodeObject];
      [a3 decodeValueOfObjCType:"q" at:&v4->_internal->proximity];
      [a3 decodeValueOfObjCType:"d" at:&v4->_internal->accuracy];
      [a3 decodeValueOfObjCType:"q" at:&v4->_internal->rssi];
    }
    [a3 decodeDoubleForKey:@"kCLBeaconCodingKeyTimestamp"];
    v4->_internal->timestamp = v6;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  char v5 = [a3 allowsKeyedCoding];
  internal = self->_internal;
  if (v5)
  {
    [a3 encodeObject:internal->proximityUUID forKey:@"kCLBeaconCodingKeyProximityUUID"];
    [a3 encodeObject:self->_internal->major forKey:@"kCLBeaconCodingKeyMajor"];
    [a3 encodeObject:self->_internal->minor forKey:@"kCLBeaconCodingKeyMinor"];
    [a3 encodeInt:LODWORD(self->_internal->proximity) forKey:@"kCLBeaconCodingKeyProximity"];
    [a3 encodeDouble:@"kCLBeaconCodingKeyAccuracy" forKey:self->_internal->accuracy];
    [a3 encodeInteger:self->_internal->rssi forKey:@"kCLBeaconCodingKeyRSSI"];
  }
  else
  {
    objc_msgSend(a3, "encodeObject:", -[NSUUID UUIDString](internal->proximityUUID, "UUIDString"));
    [a3 encodeObject:self->_internal->major];
    [a3 encodeObject:self->_internal->minor];
    [a3 encodeValueOfObjCType:"q" at:&self->_internal->proximity];
    [a3 encodeValueOfObjCType:"d" at:&self->_internal->accuracy];
    [a3 encodeValueOfObjCType:"q" at:&self->_internal->rssi];
  }
  double timestamp = self->_internal->timestamp;

  [a3 encodeDouble:@"kCLBeaconCodingKeyTimestamp" forKey:timestamp];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = [(CLBeacon *)self UUID];
  char v5 = [(CLBeacon *)self major];
  double v6 = [(CLBeacon *)self minor];
  CLProximity v7 = [(CLBeacon *)self proximity];
  [(CLBeacon *)self accuracy];
  return (id)[v3 stringWithFormat:@"CLBeacon (uuid:%@, major:%@, minor:%@, proximity:%d +/- %.2fm, rssi:%ld, timestamp:%@)", v4, v5, v6, v7, v8, -[CLBeacon rssi](self, "rssi"), -[CLBeacon timestamp](self, "timestamp")];
}

- (int)referenceFrame
{
  return 0;
}

@end