@interface BiometricKitIdentity
+ (BOOL)supportsSecureCoding;
+ (id)biometricKitIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIdentity:(id)a3;
- (BiometricKitAccessory)accessory;
- (BiometricKitIdentity)init;
- (BiometricKitIdentity)initWithCoder:(id)a3;
- (NSDate)creationTime;
- (NSString)name;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)attribute;
- (int)entity;
- (int)type;
- (int64_t)matchCount;
- (int64_t)matchCountContinuous;
- (int64_t)updateCount;
- (unint64_t)hash;
- (unsigned)flags;
- (unsigned)userID;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setAttribute:(int)a3;
- (void)setCreationTime:(id)a3;
- (void)setEntity:(int)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setMatchCount:(int64_t)a3;
- (void)setMatchCountContinuous:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setType:(int)a3;
- (void)setUpdateCount:(int64_t)a3;
- (void)setUserID:(unsigned int)a3;
- (void)setUuid:(id)a3;
@end

@implementation BiometricKitIdentity

+ (id)biometricKitIdentity
{
  v2 = objc_alloc_init(BiometricKitIdentity);
  return v2;
}

- (BiometricKitIdentity)init
{
  v3.receiver = self;
  v3.super_class = (Class)BiometricKitIdentity;
  result = [(BiometricKitIdentity *)&v3 init];
  if (result) {
    result->_userID = -1;
  }
  return result;
}

- (BiometricKitIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BiometricKitIdentity;
  v5 = [(BiometricKitIdentity *)&v21 init];
  if (v5)
  {
    uint64_t v20 = 0;
    id v6 = v4;
    uint64_t v7 = [v6 decodeBytesForKey:@"BKIdentityUUID" returnedLength:&v20];
    if (v20 == 16)
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v7];
      uuid = v5->_uuid;
      v5->_uuid = (NSUUID *)v8;
    }
    if ([v6 containsValueForKey:@"BKIdentityUserID"]) {
      int v10 = [v6 decodeInt32ForKey:@"BKIdentityUserID"];
    }
    else {
      int v10 = 501;
    }
    v5->_userID = v10;
    v5->_type = [v6 decodeIntForKey:@"BKIdentityType"];
    v5->_attribute = [v6 decodeIntForKey:@"BKIdentityAttribute"];
    v5->_entity = [v6 decodeIntForKey:@"BKIdentityEntityNumber"];
    v11 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"BKIdentityName"];
    uint64_t v12 = [v11 copy];
    name = v5->_name;
    v5->_name = (NSString *)v12;

    uint64_t v14 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"BKIdentityCreationTime"];
    creationTime = v5->_creationTime;
    v5->_creationTime = (NSDate *)v14;

    v5->_matchCount = [v6 decodeIntegerForKey:@"BKIdentityMatchCount"];
    v5->_matchCountContinuous = [v6 decodeIntegerForKey:@"BKIdentityMatchCountContinuous"];
    v5->_updateCount = [v6 decodeIntegerForKey:@"BKIdentityUpdateCount"];
    v5->_flags = [v6 decodeInt32ForKey:@"BKIdentityFlags"];
    v16 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"BKIdentityAccessory"];
    uint64_t v17 = [v16 copy];
    accessory = v5->_accessory;
    v5->_accessory = (BiometricKitAccessory *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  v6[1] = 0;
  uuid = self->_uuid;
  id v5 = a3;
  [(NSUUID *)uuid getUUIDBytes:v6];
  [v5 encodeInt32:self->_userID forKey:@"BKIdentityUserID"];
  [v5 encodeBytes:v6 length:16 forKey:@"BKIdentityUUID"];
  [v5 encodeInt:self->_type forKey:@"BKIdentityType"];
  [v5 encodeInt:self->_attribute forKey:@"BKIdentityAttribute"];
  [v5 encodeInt:self->_entity forKey:@"BKIdentityEntityNumber"];
  [v5 encodeObject:self->_name forKey:@"BKIdentityName"];
  [v5 encodeObject:self->_creationTime forKey:@"BKIdentityCreationTime"];
  [v5 encodeInteger:self->_matchCount forKey:@"BKIdentityMatchCount"];
  [v5 encodeInteger:self->_matchCountContinuous forKey:@"BKIdentityMatchCountContinuous"];
  [v5 encodeInteger:self->_updateCount forKey:@"BKIdentityUpdateCount"];
  [v5 encodeInt32:self->_flags forKey:@"BKIdentityFlags"];
  [v5 encodeObject:self->_accessory forKey:@"BKIdentityAccessory"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(BiometricKitIdentity);
  id v5 = [(BiometricKitIdentity *)self uuid];
  id v6 = (void *)[v5 copy];
  [(BiometricKitIdentity *)v4 setUuid:v6];

  [(BiometricKitIdentity *)v4 setUserID:[(BiometricKitIdentity *)self userID]];
  [(BiometricKitIdentity *)v4 setType:[(BiometricKitIdentity *)self type]];
  [(BiometricKitIdentity *)v4 setAttribute:[(BiometricKitIdentity *)self attribute]];
  [(BiometricKitIdentity *)v4 setEntity:[(BiometricKitIdentity *)self entity]];
  uint64_t v7 = [(BiometricKitIdentity *)self name];
  [(BiometricKitIdentity *)v4 setName:v7];

  uint64_t v8 = [(BiometricKitIdentity *)self creationTime];
  v9 = (void *)[v8 copy];
  [(BiometricKitIdentity *)v4 setCreationTime:v9];

  [(BiometricKitIdentity *)v4 setMatchCount:[(BiometricKitIdentity *)self matchCount]];
  [(BiometricKitIdentity *)v4 setMatchCountContinuous:[(BiometricKitIdentity *)self matchCountContinuous]];
  [(BiometricKitIdentity *)v4 setUpdateCount:[(BiometricKitIdentity *)self updateCount]];
  [(BiometricKitIdentity *)v4 setFlags:[(BiometricKitIdentity *)self flags]];
  int v10 = [(BiometricKitIdentity *)self accessory];
  v11 = (void *)[v10 copy];
  [(BiometricKitIdentity *)v4 setAccessory:v11];

  return v4;
}

- (BOOL)isEqualToIdentity:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && self->_type == *((_DWORD *)v4 + 3) && self->_userID == *((_DWORD *)v4 + 2)) {
    char v6 = [(NSUUID *)self->_uuid isEqual:*((void *)v4 + 4)];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BiometricKitIdentity *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(BiometricKitIdentity *)self isEqualToIdentity:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_type;
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  uint64_t userID = self->_userID;
  uint64_t v7 = [(NSUUID *)self->_uuid UUIDString];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p:(userID:%u, uuid:%@, accessory:%@, flags:0x%x)>", v5, self, userID, v7, self->_accessory, self->_flags];

  return v8;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (unsigned)userID
{
  return self->_userID;
}

- (void)setUserID:(unsigned int)a3
{
  self->_uint64_t userID = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)attribute
{
  return self->_attribute;
}

- (void)setAttribute:(int)a3
{
  self->_attribute = a3;
}

- (int)entity
{
  return self->_entity;
}

- (void)setEntity:(int)a3
{
  self->_entity = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDate)creationTime
{
  return self->_creationTime;
}

- (void)setCreationTime:(id)a3
{
}

- (int64_t)matchCount
{
  return self->_matchCount;
}

- (void)setMatchCount:(int64_t)a3
{
  self->_matchCount = a3;
}

- (int64_t)matchCountContinuous
{
  return self->_matchCountContinuous;
}

- (void)setMatchCountContinuous:(int64_t)a3
{
  self->_matchCountContinuous = a3;
}

- (int64_t)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(int64_t)a3
{
  self->_updateCount = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (BiometricKitAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_creationTime, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end