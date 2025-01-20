@interface HDSyncIdentity
+ (BOOL)supportsSecureCoding;
+ (HDSyncIdentity)syncIdentityWithCodable:(id)a3 error:(id *)a4;
+ (id)legacySyncIdentity;
- (BOOL)isEqual:(id)a3;
- (HDSyncIdentity)init;
- (HDSyncIdentity)initWithCoder:(id)a3;
- (HDSyncIdentity)initWithHardwareIdentifier:(id)a3 databaseIdentifier:(id)a4 instanceDiscriminator:(id)a5;
- (NSString)instanceDiscriminator;
- (NSUUID)databaseIdentifier;
- (NSUUID)hardwareIdentifier;
- (id)codableSyncIdentity;
- (id)description;
- (id)identityString;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDSyncIdentity

+ (id)legacySyncIdentity
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  v3 = [[HDSyncIdentity alloc] initWithHardwareIdentifier:v2 databaseIdentifier:v2 instanceDiscriminator:&stru_1F1728D60];

  return v3;
}

- (HDSyncIdentity)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDSyncIdentity)initWithHardwareIdentifier:(id)a3 databaseIdentifier:(id)a4 instanceDiscriminator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDSyncIdentity;
  v11 = [(HDSyncIdentity *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    hardwareIdentifier = v11->_hardwareIdentifier;
    v11->_hardwareIdentifier = (NSUUID *)v12;

    uint64_t v14 = [v9 copy];
    databaseIdentifier = v11->_databaseIdentifier;
    v11->_databaseIdentifier = (NSUUID *)v14;

    uint64_t v16 = [v10 copy];
    instanceDiscriminator = v11->_instanceDiscriminator;
    v11->_instanceDiscriminator = (NSString *)v16;
  }
  return v11;
}

+ (HDSyncIdentity)syncIdentityWithCodable:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F29128];
  v7 = [v5 hardwareIdentifier];
  id v8 = objc_msgSend(v6, "hk_UUIDWithData:", v7);

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F29128];
    id v10 = [v5 databaseIdentifier];
    v11 = objc_msgSend(v9, "hk_UUIDWithData:", v10);

    if (v11)
    {
      uint64_t v12 = [v5 instanceDiscriminator];
      v13 = (void *)v12;
      uint64_t v14 = &stru_1F1728D60;
      if (v12) {
        uint64_t v14 = (__CFString *)v12;
      }
      v15 = v14;

      uint64_t v16 = [[HDSyncIdentity alloc] initWithHardwareIdentifier:v8 databaseIdentifier:v11 instanceDiscriminator:v15];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Missing database identifier.");
      uint64_t v16 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Missing hardware identifier.");
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)codableSyncIdentity
{
  v3 = objc_alloc_init(HDCodableSyncIdentity);
  uint64_t v4 = [(NSUUID *)self->_hardwareIdentifier hk_dataForUUIDBytes];
  [(HDCodableSyncIdentity *)v3 setHardwareIdentifier:v4];

  id v5 = [(NSUUID *)self->_databaseIdentifier hk_dataForUUIDBytes];
  [(HDCodableSyncIdentity *)v3 setDatabaseIdentifier:v5];

  [(HDCodableSyncIdentity *)v3 setInstanceDiscriminator:self->_instanceDiscriminator];

  return v3;
}

- (id)identityString
{
  v3 = NSString;
  uint64_t v4 = [(NSUUID *)self->_hardwareIdentifier UUIDString];
  id v5 = [(NSUUID *)self->_databaseIdentifier UUIDString];
  v6 = [v3 stringWithFormat:@"%@:%@:%@", v4, v5, self->_instanceDiscriminator];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HDSyncIdentity *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [(NSUUID *)self->_hardwareIdentifier isEqual:v4->_hardwareIdentifier]
      && [(NSUUID *)self->_databaseIdentifier isEqual:v4->_databaseIdentifier])
    {
      char v5 = [(NSString *)self->_instanceDiscriminator isEqual:v4->_instanceDiscriminator];
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_hardwareIdentifier hash];
  uint64_t v4 = [(NSUUID *)self->_databaseIdentifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_instanceDiscriminator hash];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  v6 = [(NSUUID *)self->_hardwareIdentifier UUIDString];
  v7 = [(NSUUID *)self->_databaseIdentifier UUIDString];
  id v8 = [v3 stringWithFormat:@"<%@ %@:%@:%@>", v5, v6, v7, self->_instanceDiscriminator];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  hardwareIdentifier = self->_hardwareIdentifier;
  id v5 = a3;
  [v5 encodeObject:hardwareIdentifier forKey:@"hwID"];
  [v5 encodeObject:self->_databaseIdentifier forKey:@"dbID"];
  [v5 encodeObject:self->_instanceDiscriminator forKey:@"instanceDisc"];
}

- (HDSyncIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hwID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dbID"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"instanceDisc"];

  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || v7 == 0)
  {
    id v10 = 0;
  }
  else
  {
    self = [(HDSyncIdentity *)self initWithHardwareIdentifier:v5 databaseIdentifier:v6 instanceDiscriminator:v7];
    id v10 = self;
  }

  return v10;
}

- (NSUUID)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

- (NSUUID)databaseIdentifier
{
  return self->_databaseIdentifier;
}

- (NSString)instanceDiscriminator
{
  return self->_instanceDiscriminator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceDiscriminator, 0);
  objc_storeStrong((id *)&self->_databaseIdentifier, 0);

  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
}

@end