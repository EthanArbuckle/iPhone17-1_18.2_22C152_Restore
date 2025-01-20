@interface DSSGuestUser
+ (BOOL)supportsSecureCoding;
+ (id)newGuestUser;
- (BOOL)hasSeenGuestSafetyNotice;
- (BOOL)isTemporaryUser;
- (DSSGuestUser)init;
- (DSSGuestUser)initWithCoder:(id)a3;
- (NSDate)lastSwitchTime;
- (NSUUID)managedAssetsProfileUUID;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DSSGuestUser

+ (id)newGuestUser
{
  v2 = objc_opt_new();
  v3 = [MEMORY[0x263F08C38] UUID];
  [v2 setUuid:v3];
  [v2 setManagedAssetsProfileUUID:v3];
  v4 = (void *)[v2 copy];

  return v4;
}

- (DSSGuestUser)init
{
  v3.receiver = self;
  v3.super_class = (Class)DSSGuestUser;
  return [(DSSGuestUser *)&v3 init];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%s %p %@>", object_getClassName(self), self, self->_uuid];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DSSGuestUser)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DSSGuestUser;
  v5 = [(DSSGuestUser *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    if (!v5->_uuid)
    {
      v8 = objc_msgSend(MEMORY[0x263F087E8], "dss_errorWithCode:", 10);
      [v4 failWithError:v8];
    }
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"managedAssetsProfileUUID"];
    managedAssetsProfileUUID = v5->_managedAssetsProfileUUID;
    v5->_managedAssetsProfileUUID = (NSUUID *)v9;

    if (!v5->_managedAssetsProfileUUID)
    {
      v11 = objc_msgSend(MEMORY[0x263F087E8], "dss_errorWithCode:", 10);
      [v4 failWithError:v11];
    }
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastSwitchTime"];
    lastSwitchTime = v5->_lastSwitchTime;
    v5->_lastSwitchTime = (NSDate *)v12;

    v5->_hasSeenGuestSafetyNotice = [v4 decodeBoolForKey:@"hasSeenGuestSafetyNotice"];
    v5->_temporaryUser = [v4 decodeBoolForKey:@"temporaryUser"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  [v5 encodeObject:uuid forKey:@"uuid"];
  [v5 encodeObject:self->_managedAssetsProfileUUID forKey:@"managedAssetsProfileUUID"];
  [v5 encodeBool:self->_hasSeenGuestSafetyNotice forKey:@"hasSeenGuestSafetyNotice"];
  [v5 encodeBool:self->_temporaryUser forKey:@"temporaryUser"];
  [v5 encodeObject:self->_lastSwitchTime forKey:@"lastSwitchTime"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  _DSSGuestUserCreateCopy(self, v5, (uint64_t)a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  _DSSGuestUserCreateCopy(self, v5, (uint64_t)a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSUUID)managedAssetsProfileUUID
{
  return self->_managedAssetsProfileUUID;
}

- (NSDate)lastSwitchTime
{
  return self->_lastSwitchTime;
}

- (BOOL)hasSeenGuestSafetyNotice
{
  return self->_hasSeenGuestSafetyNotice;
}

- (BOOL)isTemporaryUser
{
  return self->_temporaryUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSwitchTime, 0);
  objc_storeStrong((id *)&self->_managedAssetsProfileUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end