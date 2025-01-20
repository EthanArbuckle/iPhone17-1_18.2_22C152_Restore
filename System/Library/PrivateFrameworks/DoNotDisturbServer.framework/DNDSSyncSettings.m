@interface DNDSSyncSettings
- (BOOL)isCloudSyncEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPairSyncEnabled;
- (DNDSSyncSettings)initWithPairSyncEnabled:(BOOL)a3 cloudSyncEnabled:(BOOL)a4;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation DNDSSyncSettings

- (DNDSSyncSettings)initWithPairSyncEnabled:(BOOL)a3 cloudSyncEnabled:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)DNDSSyncSettings;
  result = [(DNDSSyncSettings *)&v7 init];
  if (result)
  {
    result->_pairSyncEnabled = a3;
    result->_cloudSyncEnabled = a4;
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v3 = [(DNDSSyncSettings *)self isPairSyncEnabled];
  BOOL v4 = [(DNDSSyncSettings *)self isCloudSyncEnabled];
  uint64_t v5 = 2;
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (DNDSSyncSettings *)a3;
  if (self == v4)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL v6 = [(DNDSSyncSettings *)self isPairSyncEnabled];
      if (v6 == [(DNDSSyncSettings *)v5 isPairSyncEnabled])
      {
        BOOL v8 = [(DNDSSyncSettings *)self isCloudSyncEnabled];
        BOOL v7 = v8 ^ [(DNDSSyncSettings *)v5 isCloudSyncEnabled] ^ 1;
      }
      else
      {
        LOBYTE(v7) = 0;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if ([(DNDSSyncSettings *)self isPairSyncEnabled]) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  if ([(DNDSSyncSettings *)self isCloudSyncEnabled]) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; pairSyncEnabled: %@; cloudSyncEnabled: %@>",
               v4,
               self,
               v5,
               v6);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableSyncSettings alloc];
  BOOL v5 = [(DNDSSyncSettings *)self isPairSyncEnabled];
  BOOL v6 = [(DNDSSyncSettings *)self isCloudSyncEnabled];
  return [(DNDSSyncSettings *)v4 initWithPairSyncEnabled:v5 cloudSyncEnabled:v6];
}

- (BOOL)isPairSyncEnabled
{
  return self->_pairSyncEnabled;
}

- (BOOL)isCloudSyncEnabled
{
  return self->_cloudSyncEnabled;
}

@end