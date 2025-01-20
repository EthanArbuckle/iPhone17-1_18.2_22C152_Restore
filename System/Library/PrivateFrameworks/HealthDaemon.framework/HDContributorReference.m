@interface HDContributorReference
+ (BOOL)supportsSecureCoding;
+ (id)contributorReferenceForNoContributor;
+ (id)contributorReferenceForOtherUserWithUUID:(id)a3;
+ (id)contributorReferenceForPersistentID:(id)a3;
+ (id)contributorReferenceForPrimaryUser;
- (BOOL)isEqual:(id)a3;
- (HDContributorReference)initWithCoder:(id)a3;
- (NSNumber)persistentID;
- (NSUUID)UUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)contributorType;
- (unint64_t)hash;
- (void)_initWithContributorType:(void *)a3 persistentID:(void *)a4 uuid:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDContributorReference

- (void)_initWithContributorType:(void *)a3 persistentID:(void *)a4 uuid:
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (a1)
  {
    if (v7 && v8)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:sel__initWithContributorType_persistentID_uuid_, a1, @"HDContributorReference.m", 25, @"Invalid parameter not satisfying: %@", @"persistentID == nil || uuid == nil" object file lineNumber description];
    }
    v17.receiver = a1;
    v17.super_class = (Class)HDContributorReference;
    v10 = objc_msgSendSuper2(&v17, sel_init);
    a1 = v10;
    if (v10)
    {
      v10[1] = a2;
      uint64_t v11 = [v7 copy];
      v12 = (void *)a1[2];
      a1[2] = v11;

      uint64_t v13 = [v9 copy];
      v14 = (void *)a1[3];
      a1[3] = v13;
    }
  }

  return a1;
}

+ (id)contributorReferenceForPersistentID:(id)a3
{
  id v3 = a3;
  v4 = -[HDContributorReference _initWithContributorType:persistentID:uuid:]([HDContributorReference alloc], 1, v3, 0);

  return v4;
}

+ (id)contributorReferenceForNoContributor
{
  v2 = -[HDContributorReference _initWithContributorType:persistentID:uuid:]([HDContributorReference alloc], 2, 0, 0);

  return v2;
}

+ (id)contributorReferenceForPrimaryUser
{
  v2 = -[HDContributorReference _initWithContributorType:persistentID:uuid:]([HDContributorReference alloc], 3, 0, 0);

  return v2;
}

+ (id)contributorReferenceForOtherUserWithUUID:(id)a3
{
  id v3 = a3;
  v4 = -[HDContributorReference _initWithContributorType:persistentID:uuid:]([HDContributorReference alloc], 4, 0, v3);

  return v4;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = self->_contributorType - 2;
  if (v5 > 2) {
    v6 = @"Unknown";
  }
  else {
    v6 = off_1E6302DE0[v5];
  }
  return (id)[v3 stringWithFormat:@"<%@:%p %@, %@, %@>", v4, self, v6, self->_persistentID, self->_UUID];
}

- (unint64_t)hash
{
  int64_t v3 = self->_contributorType ^ [(NSNumber *)self->_persistentID hash];
  return v3 ^ [(NSUUID *)self->_UUID hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  if (self->_contributorType != v4[1]) {
    goto LABEL_9;
  }
  persistentID = self->_persistentID;
  v6 = (NSNumber *)v4[2];
  if (persistentID != v6 && (!v6 || !-[NSNumber isEqual:](persistentID, "isEqual:"))) {
    goto LABEL_9;
  }
  UUID = self->_UUID;
  id v8 = (NSUUID *)v4[3];
  if (UUID == v8)
  {
    char v9 = 1;
    goto LABEL_10;
  }
  if (v8) {
    char v9 = -[NSUUID isEqual:](UUID, "isEqual:");
  }
  else {
LABEL_9:
  }
    char v9 = 0;
LABEL_10:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDContributorReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDContributorReference;
  unint64_t v5 = [(HDContributorReference *)&v11 init];
  if (v5)
  {
    v5->_contributorType = (int)[v4 decodeIntForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"persistentID"];
    persistentID = v5->_persistentID;
    v5->_persistentID = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t contributorType = self->_contributorType;
  id v5 = a3;
  [v5 encodeInteger:contributorType forKey:@"type"];
  [v5 encodeObject:self->_persistentID forKey:@"persistentID"];
  [v5 encodeObject:self->_UUID forKey:@"uuid"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[HDContributorReference allocWithZone:a3];
  int64_t contributorType = self->_contributorType;
  persistentID = self->_persistentID;
  UUID = self->_UUID;

  return -[HDContributorReference _initWithContributorType:persistentID:uuid:](v4, contributorType, persistentID, UUID);
}

- (int64_t)contributorType
{
  return self->_contributorType;
}

- (NSNumber)persistentID
{
  return self->_persistentID;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_storeStrong((id *)&self->_persistentID, 0);
}

@end