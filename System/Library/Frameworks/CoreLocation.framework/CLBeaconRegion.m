@interface CLBeaconRegion
+ (BOOL)supportsSecureCoding;
+ (id)any;
- (BOOL)isEqual:(id)a3;
- (BOOL)notifyEntryStateOnDisplay;
- (CLBeaconIdentityConstraint)beaconIdentityConstraint;
- (CLBeaconRegion)init;
- (CLBeaconRegion)initWithBeaconIdentityConstraint:(CLBeaconIdentityConstraint *)beaconIdentityConstraint identifier:(NSString *)identifier;
- (CLBeaconRegion)initWithCoder:(id)a3;
- (CLBeaconRegion)initWithIdentifier:(id)a3;
- (CLBeaconRegion)initWithUUID:(NSUUID *)uuid identifier:(NSString *)identifier;
- (CLBeaconRegion)initWithUUID:(NSUUID *)uuid major:(CLBeaconMajorValue)major identifier:(NSString *)identifier;
- (CLBeaconRegion)initWithUUID:(NSUUID *)uuid major:(CLBeaconMajorValue)major minor:(CLBeaconMinorValue)minor identifier:(NSString *)identifier;
- (CLBeaconRegion)initWithUUID:(id)a3 major:(unsigned __int16)a4 minor:(unsigned __int16)a5 identifier:(id)a6 notifyEntryStateOnDisplay:(BOOL)a7;
- (NSMutableDictionary)peripheralDataWithMeasuredPower:(NSNumber *)measuredPower;
- (NSNumber)major;
- (NSNumber)minor;
- (NSUUID)UUID;
- (char)_measuredPowerForDevice;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)definitionMask;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setGutsWithProximityUUID:(id)a3 major:(id)a4 minor:(id)a5 notifyOnDisplay:(BOOL)a6;
- (void)setNotifyEntryStateOnDisplay:(BOOL)notifyEntryStateOnDisplay;
@end

@implementation CLBeaconRegion

+ (id)any
{
  if (qword_1E92A04B0 != -1) {
    dispatch_once(&qword_1E92A04B0, &unk_1EE005BC0);
  }
  return (id)qword_1E92A04A8;
}

- (void)setGutsWithProximityUUID:(id)a3 major:(id)a4 minor:(id)a5 notifyOnDisplay:(BOOL)a6
{
  int v10 = a3 != 0;
  if (a4) {
    v10 |= 2u;
  }
  if (a5) {
    v10 |= 4u;
  }
  self->_definitionMask = v10;
  self->_UUID = (NSUUID *)[a3 copy];
  self->_major = (NSNumber *)[a4 copy];
  self->_minor = (NSNumber *)[a5 copy];
  self->_notifyEntryStateOnDisplay = a6;
}

- (CLBeaconRegion)init
{
  v2 = self;
  if (![(CLBeaconRegion *)self UUID])
  {

    return 0;
  }
  return v2;
}

- (CLBeaconRegion)initWithIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLBeaconRegion;
  v3 = [(CLRegion *)&v6 initWithIdentifier:a3 andRegionType:0];
  v4 = v3;
  if (v3) {
    [(CLBeaconRegion *)v3 setGutsWithProximityUUID:0 major:0 minor:0 notifyOnDisplay:0];
  }
  return v4;
}

- (CLBeaconRegion)initWithUUID:(NSUUID *)uuid identifier:(NSString *)identifier
{
  if (uuid)
  {
    v8.receiver = self;
    v8.super_class = (Class)CLBeaconRegion;
    v5 = [(CLRegion *)&v8 initWithIdentifier:identifier andRegionType:0];
    objc_super v6 = v5;
    if (v5) {
      [(CLBeaconRegion *)v5 setGutsWithProximityUUID:uuid major:0 minor:0 notifyOnDisplay:0];
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

- (CLBeaconRegion)initWithUUID:(NSUUID *)uuid major:(CLBeaconMajorValue)major identifier:(NSString *)identifier
{
  if (uuid)
  {
    uint64_t v5 = major;
    v9.receiver = self;
    v9.super_class = (Class)CLBeaconRegion;
    v7 = [(CLRegion *)&v9 initWithIdentifier:identifier andRegionType:0];
    if (v7) {
      -[CLBeaconRegion setGutsWithProximityUUID:major:minor:notifyOnDisplay:](v7, "setGutsWithProximityUUID:major:minor:notifyOnDisplay:", uuid, [NSNumber numberWithUnsignedShort:v5], 0, 0);
    }
  }
  else
  {

    return 0;
  }
  return v7;
}

- (CLBeaconRegion)initWithUUID:(NSUUID *)uuid major:(CLBeaconMajorValue)major minor:(CLBeaconMinorValue)minor identifier:(NSString *)identifier
{
  if (uuid)
  {
    return (CLBeaconRegion *)MEMORY[0x1F4181798](self, sel_initWithUUID_major_minor_identifier_notifyEntryStateOnDisplay_);
  }
  else
  {

    return 0;
  }
}

- (CLBeaconRegion)initWithUUID:(id)a3 major:(unsigned __int16)a4 minor:(unsigned __int16)a5 identifier:(id)a6 notifyEntryStateOnDisplay:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = a5;
  uint64_t v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLBeaconRegion;
  v11 = [(CLRegion *)&v14 initWithIdentifier:a6 andRegionType:0];
  if (v11)
  {
    uint64_t v12 = [NSNumber numberWithUnsignedShort:v9];
    -[CLBeaconRegion setGutsWithProximityUUID:major:minor:notifyOnDisplay:](v11, "setGutsWithProximityUUID:major:minor:notifyOnDisplay:", a3, v12, [NSNumber numberWithUnsignedShort:v8], v7);
  }
  return v11;
}

- (CLBeaconRegion)initWithBeaconIdentityConstraint:(CLBeaconIdentityConstraint *)beaconIdentityConstraint identifier:(NSString *)identifier
{
  if (!beaconIdentityConstraint) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLBeaconRegion.m", 182, @"Invalid parameter not satisfying: %@", @"beaconIdentityConstraint");
  }
  v9.receiver = self;
  v9.super_class = (Class)CLBeaconRegion;
  BOOL v7 = [(CLRegion *)&v9 initWithIdentifier:identifier andRegionType:0];
  if (v7) {
    [(CLBeaconRegion *)v7 setGutsWithProximityUUID:[(CLBeaconIdentityCondition *)beaconIdentityConstraint UUID] major:[(CLBeaconIdentityCondition *)beaconIdentityConstraint major] minor:[(CLBeaconIdentityCondition *)beaconIdentityConstraint minor] notifyOnDisplay:0];
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLBeaconRegion)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLBeaconRegion;
  v4 = -[CLRegion initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    unsigned __int8 v9 = 0;
    if ([a3 allowsKeyedCoding])
    {
      id v5 = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLBeaconRegionCodingKeyProximityUUID"];
      uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLBeaconRegionCodingKeyMajor"];
      uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLBeaconRegionCodingKeyMinor"];
      unsigned __int8 v9 = [a3 decodeBoolForKey:@"kCLBeaconRegionNotifyEntryStateOnDisplay"];
    }
    else
    {
      id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDString:", objc_msgSend(a3, "decodeObject"));
      uint64_t v6 = [a3 decodeObject];
      uint64_t v7 = [a3 decodeObject];
      [a3 decodeValueOfObjCType:"B" at:&v9];
    }
    [(CLRegion *)v4 setType:0];
    [(CLBeaconRegion *)v4 setGutsWithProximityUUID:v5 major:v6 minor:v7 notifyOnDisplay:v9];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLBeaconRegion;
  -[CLRegion encodeWithCoder:](&v9, sel_encodeWithCoder_);
  BOOL v5 = [(CLBeaconRegion *)self notifyEntryStateOnDisplay];
  BOOL v8 = v5;
  char v6 = [a3 allowsKeyedCoding];
  uint64_t v7 = [(CLBeaconRegion *)self UUID];
  if (v6)
  {
    [a3 encodeObject:v7 forKey:@"kCLBeaconRegionCodingKeyProximityUUID"];
    objc_msgSend(a3, "encodeObject:forKey:", -[CLBeaconRegion major](self, "major"), @"kCLBeaconRegionCodingKeyMajor");
    objc_msgSend(a3, "encodeObject:forKey:", -[CLBeaconRegion minor](self, "minor"), @"kCLBeaconRegionCodingKeyMinor");
    [a3 encodeBool:v5 forKey:@"kCLBeaconRegionNotifyEntryStateOnDisplay"];
  }
  else
  {
    objc_msgSend(a3, "encodeObject:", -[NSUUID UUIDString](v7, "UUIDString"));
    objc_msgSend(a3, "encodeObject:", -[CLBeaconRegion major](self, "major"));
    objc_msgSend(a3, "encodeObject:", -[CLBeaconRegion minor](self, "minor"));
    [a3 encodeValueOfObjCType:"B" at:&v8];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLBeaconRegion;
  id v4 = [(CLRegion *)&v6 copyWithZone:a3];
  if (v4) {
    objc_msgSend(v4, "setGutsWithProximityUUID:major:minor:notifyOnDisplay:", -[CLBeaconRegion UUID](self, "UUID"), -[CLBeaconRegion major](self, "major"), -[CLBeaconRegion minor](self, "minor"), -[CLBeaconRegion notifyEntryStateOnDisplay](self, "notifyEntryStateOnDisplay"));
  }
  return v4;
}

- (void)dealloc
{
  self->_UUID = 0;
  self->_major = 0;
  self->_minor = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLBeaconRegion;
  [(CLRegion *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"CLBeaconRegion (identifier:'%@', uuid:%@, major:%@, minor:%@)", -[CLRegion identifier](self, "identifier"), -[CLBeaconRegion UUID](self, "UUID"), -[CLBeaconRegion major](self, "major"), -[CLBeaconRegion minor](self, "minor")];
}

- (unint64_t)hash
{
  if ([(NSString *)[(CLRegion *)self identifier] isEqualToString:&stru_1EE006720])
  {
    objc_super v3 = [(CLBeaconRegion *)self beaconIdentityConstraint];
    return [(CLBeaconIdentityCondition *)v3 hash];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CLBeaconRegion;
    return [(CLRegion *)&v5 hash];
  }
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = [a3 isMemberOfClass:objc_opt_class()];
    if (v5)
    {
      if ([(NSString *)[(CLRegion *)self identifier] isEqualToString:&stru_1EE006720]
        && -[NSString isEqualToString:](-[CLRegion identifier](self, "identifier"), "isEqualToString:", [a3 identifier]))
      {
        objc_super v6 = [(CLBeaconRegion *)self beaconIdentityConstraint];
        uint64_t v7 = [a3 beaconIdentityConstraint];
        LOBYTE(v5) = [(CLBeaconIdentityCondition *)v6 isEqual:v7];
      }
      else
      {
        BOOL v8 = [(CLRegion *)self identifier];
        uint64_t v9 = [a3 identifier];
        LOBYTE(v5) = [(NSString *)v8 isEqualToString:v9];
      }
    }
  }
  return v5;
}

- (char)_measuredPowerForDevice
{
  sub_1906D54D4();

  return sub_190795E74();
}

- (NSMutableDictionary)peripheralDataWithMeasuredPower:(NSNumber *)measuredPower
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memset(uu, 0, sizeof(uu));
  uuid_clear(uu);
  if ([(CLBeaconRegion *)self UUID]) {
    [(NSUUID *)[(CLBeaconRegion *)self UUID] getUUIDBytes:uu];
  }
  __int16 v10 = 0;
  if ([(CLBeaconRegion *)self major]) {
    __int16 v10 = bswap32([(NSNumber *)[(CLBeaconRegion *)self major] shortValue]) >> 16;
  }
  __int16 v9 = 0;
  if ([(CLBeaconRegion *)self minor]) {
    __int16 v9 = bswap32([(NSNumber *)[(CLBeaconRegion *)self minor] shortValue]) >> 16;
  }
  if (measuredPower) {
    char v5 = [(NSNumber *)measuredPower charValue];
  }
  else {
    char v5 = [(CLBeaconRegion *)self _measuredPowerForDevice];
  }
  char v8 = v5;
  objc_super v6 = (void *)[MEMORY[0x1E4F1CA58] dataWithCapacity:21];
  [v6 appendBytes:uu length:16];
  [v6 appendBytes:&v10 length:2];
  [v6 appendBytes:&v9 length:2];
  [v6 appendBytes:&v8 length:1];
  return (NSMutableDictionary *)[MEMORY[0x1E4F1CA60] dictionaryWithObject:v6 forKey:*MEMORY[0x1E4F1BC20]];
}

- (CLBeaconIdentityConstraint)beaconIdentityConstraint
{
  id v2 = [(CLBeaconIdentityCondition *)[CLBeaconIdentityConstraint alloc] _initWithUUID:[(CLBeaconRegion *)self UUID] major:[(CLBeaconRegion *)self major] minor:[(CLBeaconRegion *)self minor]];

  return (CLBeaconIdentityConstraint *)v2;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSNumber)major
{
  return self->_major;
}

- (NSNumber)minor
{
  return self->_minor;
}

- (BOOL)notifyEntryStateOnDisplay
{
  return self->_notifyEntryStateOnDisplay;
}

- (void)setNotifyEntryStateOnDisplay:(BOOL)notifyEntryStateOnDisplay
{
  self->_notifyEntryStateOnDisplay = notifyEntryStateOnDisplay;
}

- (int)definitionMask
{
  return self->_definitionMask;
}

@end