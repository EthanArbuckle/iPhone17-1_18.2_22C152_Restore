@interface CXJoinCallActivity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToJoinCallActivity:(id)a3;
- (BOOL)startWhenStaged;
- (CXJoinCallActivity)initWithBundleIdentifier:(id)a3 metadata:(id)a4 applicationContext:(id)a5 activityIdentifier:(id)a6;
- (CXJoinCallActivity)initWithCoder:(id)a3;
- (NSData)applicationContext;
- (NSData)metadata;
- (NSDate)timestamp;
- (NSString)activityIdentifier;
- (NSString)bundleIdentifier;
- (NSUUID)UUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityIdentifier:(id)a3;
- (void)setApplicationContext:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setStartWhenStaged:(BOOL)a3;
- (void)setTimestamp:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation CXJoinCallActivity

- (CXJoinCallActivity)initWithBundleIdentifier:(id)a3 metadata:(id)a4 applicationContext:(id)a5 activityIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CXJoinCallActivity;
  v15 = [(CXJoinCallActivity *)&v21 init];
  if (v15)
  {
    v16 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    UUID = v15->_UUID;
    v15->_UUID = v16;

    uint64_t v18 = [MEMORY[0x1E4F1C9C8] now];
    timestamp = v15->_timestamp;
    v15->_timestamp = (NSDate *)v18;

    objc_storeStrong((id *)&v15->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v15->_applicationContext, a5);
    objc_storeStrong((id *)&v15->_metadata, a4);
    objc_storeStrong((id *)&v15->_activityIdentifier, a6);
    v15->_startWhenStaged = 0;
  }

  return v15;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CXJoinCallActivity *)self UUID];
  [v3 appendFormat:@" identifierUUIDString=%@", v4];

  v5 = [(CXJoinCallActivity *)self bundleIdentifier];
  [v3 appendFormat:@" bundleIdentifier=%@", v5];

  v6 = [(CXJoinCallActivity *)self timestamp];
  [v3 appendFormat:@" timestamp=%@", v6];

  BOOL v7 = [(CXJoinCallActivity *)self startWhenStaged];
  v8 = @"NO";
  if (v7) {
    v8 = @"YES";
  }
  [v3 appendFormat:@" startWhenStaged=%@", v8];
  [v3 appendString:@">"];
  v9 = (void *)[v3 copy];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(CXJoinCallActivity *)self isEqualToJoinCallActivity:v4];

  return v5;
}

- (BOOL)isEqualToJoinCallActivity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CXJoinCallActivity *)self UUID];
  v6 = [v4 UUID];
  if ([v5 isEqual:v6])
  {
    BOOL v7 = [(CXJoinCallActivity *)self applicationContext];
    v8 = [v4 applicationContext];
    if ([v7 isEqual:v8])
    {
      v9 = [(CXJoinCallActivity *)self metadata];
      v10 = [v4 metadata];
      if ([v9 isEqual:v10])
      {
        id v11 = [(CXJoinCallActivity *)self timestamp];
        id v12 = [v4 timestamp];
        if ([v11 isEqual:v12])
        {
          v22 = v11;
          id v13 = [(CXJoinCallActivity *)self bundleIdentifier];
          [v4 bundleIdentifier];
          objc_super v21 = v23 = v13;
          if (objc_msgSend(v13, "isEqual:"))
          {
            id v14 = [(CXJoinCallActivity *)self activityIdentifier];
            v19 = [v4 metadata];
            v20 = v14;
            int v15 = objc_msgSend(v14, "isEqual:");
            id v11 = v22;
            if (v15)
            {
              BOOL v16 = [(CXJoinCallActivity *)self startWhenStaged];
              int v17 = v16 ^ [v4 startWhenStaged] ^ 1;
            }
            else
            {
              LOBYTE(v17) = 0;
            }
          }
          else
          {
            LOBYTE(v17) = 0;
            id v11 = v22;
          }
        }
        else
        {
          LOBYTE(v17) = 0;
        }
      }
      else
      {
        LOBYTE(v17) = 0;
      }
    }
    else
    {
      LOBYTE(v17) = 0;
    }
  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  v3 = [(CXJoinCallActivity *)self UUID];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(CXJoinCallActivity *)self bundleIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  BOOL v7 = [(CXJoinCallActivity *)self applicationContext];
  uint64_t v8 = [v7 hash];
  v9 = [(CXJoinCallActivity *)self timestamp];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  id v11 = [(CXJoinCallActivity *)self activityIdentifier];
  uint64_t v12 = [v11 hash];
  id v13 = [(CXJoinCallActivity *)self metadata];
  uint64_t v14 = v12 ^ [v13 hash];
  BOOL v15 = [(CXJoinCallActivity *)self startWhenStaged];
  uint64_t v16 = 1237;
  if (v15) {
    uint64_t v16 = 1231;
  }
  unint64_t v17 = v10 ^ v14 ^ v16;

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v5 = [(CXJoinCallActivity *)self bundleIdentifier];
  uint64_t v6 = [(CXJoinCallActivity *)self metadata];
  BOOL v7 = [(CXJoinCallActivity *)self applicationContext];
  uint64_t v8 = [(CXJoinCallActivity *)self activityIdentifier];
  v9 = (void *)[v4 initWithBundleIdentifier:v5 metadata:v6 applicationContext:v7 activityIdentifier:v8];

  uint64_t v10 = [(CXJoinCallActivity *)self UUID];
  [v9 setUUID:v10];

  id v11 = [(CXJoinCallActivity *)self timestamp];
  [v9 setTimestamp:v11];

  objc_msgSend(v9, "setStartWhenStaged:", -[CXJoinCallActivity startWhenStaged](self, "startWhenStaged"));
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXJoinCallActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CXJoinCallActivity *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    BOOL v7 = NSStringFromSelector(sel_UUID);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v8;

    uint64_t v10 = objc_opt_class();
    id v11 = NSStringFromSelector(sel_applicationContext);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    applicationContext = v5->_applicationContext;
    v5->_applicationContext = (NSData *)v12;

    uint64_t v14 = objc_opt_class();
    BOOL v15 = NSStringFromSelector(sel_timestamp);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v16;

    uint64_t v18 = NSStringFromSelector(sel_bundleIdentifier);
    uint64_t v19 = [v4 decodeObjectForKey:v18];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v19;

    objc_super v21 = NSStringFromSelector(sel_activityIdentifier);
    uint64_t v22 = [v4 decodeObjectForKey:v21];
    activityIdentifier = v5->_activityIdentifier;
    v5->_activityIdentifier = (NSString *)v22;

    v24 = NSStringFromSelector(sel_metadata);
    uint64_t v25 = [v4 decodeObjectForKey:v24];
    metadata = v5->_metadata;
    v5->_metadata = (NSData *)v25;

    v27 = NSStringFromSelector(sel_startWhenStaged);
    v5->_startWhenStaged = [v4 decodeBoolForKey:v27];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CXJoinCallActivity *)self UUID];
  uint64_t v6 = NSStringFromSelector(sel_UUID);
  [v4 encodeObject:v5 forKey:v6];

  BOOL v7 = [(CXJoinCallActivity *)self applicationContext];
  uint64_t v8 = NSStringFromSelector(sel_applicationContext);
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(CXJoinCallActivity *)self timestamp];
  uint64_t v10 = NSStringFromSelector(sel_timestamp);
  [v4 encodeObject:v9 forKey:v10];

  id v11 = [(CXJoinCallActivity *)self bundleIdentifier];
  uint64_t v12 = NSStringFromSelector(sel_bundleIdentifier);
  [v4 encodeObject:v11 forKey:v12];

  id v13 = [(CXJoinCallActivity *)self activityIdentifier];
  uint64_t v14 = NSStringFromSelector(sel_activityIdentifier);
  [v4 encodeObject:v13 forKey:v14];

  BOOL v15 = [(CXJoinCallActivity *)self metadata];
  uint64_t v16 = NSStringFromSelector(sel_metadata);
  [v4 encodeObject:v15 forKey:v16];

  BOOL v17 = [(CXJoinCallActivity *)self startWhenStaged];
  NSStringFromSelector(sel_startWhenStaged);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v17 forKey:v18];
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSData)applicationContext
{
  return self->_applicationContext;
}

- (void)setApplicationContext:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)startWhenStaged
{
  return self->_startWhenStaged;
}

- (void)setStartWhenStaged:(BOOL)a3
{
  self->_startWhenStaged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationContext, 0);
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end