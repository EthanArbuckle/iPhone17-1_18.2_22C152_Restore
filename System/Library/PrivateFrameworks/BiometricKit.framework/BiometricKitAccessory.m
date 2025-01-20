@interface BiometricKitAccessory
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccessory:(id)a3;
- (BiometricKitAccessory)initWithCoder:(id)a3;
- (BiometricKitAccessoryGroup)group;
- (NSString)name;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)flags;
- (unsigned)type;
- (void)encodeWithCoder:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setGroup:(id)a3;
- (void)setName:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)setUuid:(id)a3;
@end

@implementation BiometricKitAccessory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BiometricKitAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BiometricKitAccessory;
  v5 = [(BiometricKitAccessory *)&v17 init];
  if (v5)
  {
    uint64_t v16 = 0;
    id v6 = v4;
    uint64_t v7 = [v6 decodeBytesForKey:@"BKAccessoryUUID" returnedLength:&v16];
    if (v16 == 16)
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v7];
      uuid = v5->_uuid;
      v5->_uuid = (NSUUID *)v8;
    }
    v5->_type = [v6 decodeInt32ForKey:@"BKAccessoryType"];
    v10 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"BKAccessoryName"];
    uint64_t v11 = [v10 copy];
    name = v5->_name;
    v5->_name = (NSString *)v11;

    uint64_t v13 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"BKAccessoryGroup"];
    group = v5->_group;
    v5->_group = (BiometricKitAccessoryGroup *)v13;

    v5->_flags = [v6 decodeInt32ForKey:@"BKAccessoryFlags"];
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
  [v5 encodeInt32:self->_type forKey:@"BKAccessoryType"];
  [v5 encodeBytes:v6 length:16 forKey:@"BKAccessoryUUID"];
  [v5 encodeObject:self->_name forKey:@"BKAccessoryName"];
  [v5 encodeObject:self->_group forKey:@"BKAccessoryGroup"];
  [v5 encodeInt32:self->_flags forKey:@"BKAccessoryFlags"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(BiometricKitAccessory);
  id v5 = [(BiometricKitAccessory *)self uuid];
  id v6 = (void *)[v5 copy];
  [(BiometricKitAccessory *)v4 setUuid:v6];

  [(BiometricKitAccessory *)v4 setType:[(BiometricKitAccessory *)self type]];
  uint64_t v7 = [(BiometricKitAccessory *)self name];
  [(BiometricKitAccessory *)v4 setName:v7];

  uint64_t v8 = [(BiometricKitAccessory *)self group];
  v9 = (void *)[v8 copy];
  [(BiometricKitAccessory *)v4 setGroup:v9];

  [(BiometricKitAccessory *)v4 setFlags:[(BiometricKitAccessory *)self flags]];
  return v4;
}

- (BOOL)isEqualToAccessory:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && self->_type == *((_DWORD *)v4 + 2)) {
    char v6 = [(NSUUID *)self->_uuid isEqual:*((void *)v4 + 2)];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BiometricKitAccessory *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(BiometricKitAccessory *)self isEqualToAccessory:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_type;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  uint64_t type = self->_type;
  uint64_t v7 = getUUIDString(self->_uuid);
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p:(type:%u, uuid:%@, flags:0x%x, group:%@)>", v5, self, type, v7, self->_flags, self->_group];

  return v8;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_uint64_t type = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BiometricKitAccessoryGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end