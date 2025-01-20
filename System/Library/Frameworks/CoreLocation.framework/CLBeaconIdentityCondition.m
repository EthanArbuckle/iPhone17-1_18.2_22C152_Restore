@interface CLBeaconIdentityCondition
+ (BOOL)supportsSecureCoding;
+ (id)any;
- (BOOL)isEqual:(id)a3;
- (CLBeaconIdentityCondition)init;
- (CLBeaconIdentityCondition)initWithCoder:(id)a3;
- (CLBeaconIdentityCondition)initWithUUID:(NSUUID *)uuid;
- (CLBeaconIdentityCondition)initWithUUID:(NSUUID *)uuid major:(CLBeaconMajorValue)major;
- (CLBeaconIdentityCondition)initWithUUID:(NSUUID *)uuid major:(CLBeaconMajorValue)major minor:(CLBeaconMinorValue)minor;
- (NSNumber)major;
- (NSNumber)minor;
- (NSUUID)UUID;
- (id)_initWithUUID:(id)a3 major:(id)a4 minor:(id)a5;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation CLBeaconIdentityCondition

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLBeaconIdentityCondition;
  [(CLCondition *)&v3 dealloc];
}

- (CLBeaconIdentityCondition)init
{
  return 0;
}

- (CLBeaconIdentityCondition)initWithUUID:(NSUUID *)uuid
{
  if (!uuid) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLBeaconIdentityCondition.mm", 31, @"The UUID parameter is required");
  }

  return (CLBeaconIdentityCondition *)[(CLBeaconIdentityCondition *)self _initWithUUID:uuid major:0 minor:0];
}

- (CLBeaconIdentityCondition)initWithUUID:(NSUUID *)uuid major:(CLBeaconMajorValue)major
{
  uint64_t v4 = major;
  if (!uuid) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLBeaconIdentityCondition.mm", 37, @"The UUID parameter is required");
  }
  uint64_t v7 = [NSNumber numberWithUnsignedShort:v4];

  return (CLBeaconIdentityCondition *)[(CLBeaconIdentityCondition *)self _initWithUUID:uuid major:v7 minor:0];
}

- (CLBeaconIdentityCondition)initWithUUID:(NSUUID *)uuid major:(CLBeaconMajorValue)major minor:(CLBeaconMinorValue)minor
{
  uint64_t v5 = minor;
  uint64_t v6 = major;
  if (!uuid) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLBeaconIdentityCondition.mm", 43, @"The UUID parameter is required");
  }
  uint64_t v9 = [NSNumber numberWithUnsignedShort:v6];
  uint64_t v10 = [NSNumber numberWithUnsignedShort:v5];

  return (CLBeaconIdentityCondition *)[(CLBeaconIdentityCondition *)self _initWithUUID:uuid major:v9 minor:v10];
}

- (id)_initWithUUID:(id)a3 major:(id)a4 minor:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CLBeaconIdentityCondition;
  v8 = [(CLCondition *)&v10 initCondition];
  if (v8)
  {
    v8[9] = a3;
    v8[10] = a4;
    v8[11] = a5;
  }
  return v8;
}

+ (id)any
{
  id v2 = [[CLBeaconIdentityCondition alloc] _initWithUUID:0 major:0 minor:0];

  return v2;
}

- (CLBeaconIdentityCondition)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLBeaconIdentityCondition.mm", 76, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLBeaconIdentityConstraintUUID"];
  uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLBeaconIdentityConstraintMajor"];
  uint64_t v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLBeaconIdentityConstraintMinor"];

  return (CLBeaconIdentityCondition *)[(CLBeaconIdentityCondition *)self _initWithUUID:v6 major:v7 minor:v8];
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLBeaconIdentityCondition.mm", 87, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  [a3 encodeObject:self->_UUID forKey:@"kCLBeaconIdentityConstraintUUID"];
  [a3 encodeObject:self->_major forKey:@"kCLBeaconIdentityConstraintMajor"];
  minor = self->_minor;

  [a3 encodeObject:minor forKey:@"kCLBeaconIdentityConstraintMinor"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"CLBeaconIdentityCondition (uuid:%@, major:%@, minor:%@)", -[CLBeaconIdentityCondition UUID](self, "UUID"), -[CLBeaconIdentityCondition major](self, "major"), -[CLBeaconIdentityCondition minor](self, "minor")];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (-[CLBeaconIdentityCondition UUID](self, "UUID") || [a3 UUID]) {
      int v5 = -[NSUUID isEqual:](-[CLBeaconIdentityCondition UUID](self, "UUID"), "isEqual:", [a3 UUID]);
    }
    else {
      int v5 = 1;
    }
    if (-[CLBeaconIdentityCondition major](self, "major") || [a3 major]) {
      char v6 = -[NSNumber isEqual:](-[CLBeaconIdentityCondition major](self, "major"), "isEqual:", [a3 major]);
    }
    else {
      char v6 = 1;
    }
    if (-[CLBeaconIdentityCondition minor](self, "minor") || [a3 minor])
    {
      char v7 = -[NSNumber isEqual:](-[CLBeaconIdentityCondition minor](self, "minor"), "isEqual:", [a3 minor]);
      if (v5) {
        return v6 & v7;
      }
    }
    else
    {
      char v7 = 1;
      if (v5) {
        return v6 & v7;
      }
    }
  }
  return 0;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)[(CLBeaconIdentityCondition *)self UUID] hash];
  uint64_t v4 = [(NSNumber *)[(CLBeaconIdentityCondition *)self major] hash] ^ v3;
  return v4 ^ [(NSNumber *)[(CLBeaconIdentityCondition *)self minor] hash];
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSNumber)major
{
  return self->_major;
}

- (NSNumber)minor
{
  return self->_minor;
}

@end