@interface BiometricKitAccessoryGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccessoryGroup:(id)a3;
- (BiometricKitAccessoryGroup)initWithCoder:(id)a3;
- (NSString)name;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)type;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)setUuid:(id)a3;
@end

@implementation BiometricKitAccessoryGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BiometricKitAccessoryGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BiometricKitAccessoryGroup;
  v5 = [(BiometricKitAccessoryGroup *)&v15 init];
  if (v5)
  {
    uint64_t v14 = 0;
    id v6 = v4;
    uint64_t v7 = [v6 decodeBytesForKey:@"BKAccessoryGroupUUID" returnedLength:&v14];
    if (v14 == 16)
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v7];
      uuid = v5->_uuid;
      v5->_uuid = (NSUUID *)v8;
    }
    v5->_type = [v6 decodeInt32ForKey:@"BKAccessoryGroupType"];
    v10 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"BKAccessoryGroupName"];
    uint64_t v11 = [v10 copy];
    name = v5->_name;
    v5->_name = (NSString *)v11;
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
  [v5 encodeInt32:self->_type forKey:@"BKAccessoryGroupType"];
  [v5 encodeBytes:v6 length:16 forKey:@"BKAccessoryGroupUUID"];
  [v5 encodeObject:self->_name forKey:@"BKAccessoryGroupName"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(BiometricKitAccessoryGroup);
  id v5 = [(BiometricKitAccessoryGroup *)self uuid];
  id v6 = (void *)[v5 copy];
  [(BiometricKitAccessoryGroup *)v4 setUuid:v6];

  [(BiometricKitAccessoryGroup *)v4 setType:[(BiometricKitAccessoryGroup *)self type]];
  uint64_t v7 = [(BiometricKitAccessoryGroup *)self name];
  [(BiometricKitAccessoryGroup *)v4 setName:v7];

  return v4;
}

- (BOOL)isEqualToAccessoryGroup:(id)a3
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
  id v4 = (BiometricKitAccessoryGroup *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(BiometricKitAccessoryGroup *)self isEqualToAccessoryGroup:v4];
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
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p:(type:%u, uuid:%@)>", v5, self, type, v7];

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end