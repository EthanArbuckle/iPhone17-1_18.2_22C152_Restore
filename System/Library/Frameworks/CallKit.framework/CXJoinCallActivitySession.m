@interface CXJoinCallActivitySession
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToJoinCallActivitySession:(id)a3;
- (CXJoinCallActivity)activity;
- (CXJoinCallActivitySession)initWithActivity:(id)a3;
- (CXJoinCallActivitySession)initWithCoder:(id)a3;
- (NSDate)timestamp;
- (NSUUID)UUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setActivity:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTimestamp:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation CXJoinCallActivitySession

- (CXJoinCallActivitySession)initWithActivity:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CXJoinCallActivitySession;
  v6 = [(CXJoinCallActivitySession *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
    timestamp = v6->_timestamp;
    v6->_timestamp = (NSDate *)v7;

    v9 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    UUID = v6->_UUID;
    v6->_UUID = v9;

    objc_storeStrong((id *)&v6->_activity, a3);
    v6->_state = 0;
  }

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CXJoinCallActivitySession *)self UUID];
  [v3 appendFormat:@" identifierUUIDString=%@", v4];

  id v5 = [(CXJoinCallActivitySession *)self activity];
  [v3 appendFormat:@" activity=%@", v5];

  v6 = [(CXJoinCallActivitySession *)self timestamp];
  [v3 appendFormat:@" timestamp=%@", v6];

  objc_msgSend(v3, "appendFormat:", @" state=%lu", -[CXJoinCallActivitySession state](self, "state"));
  [v3 appendString:@">"];
  uint64_t v7 = (void *)[v3 copy];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(CXJoinCallActivitySession *)self isEqualToJoinCallActivitySession:v4];

  return v5;
}

- (BOOL)isEqualToJoinCallActivitySession:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CXJoinCallActivitySession *)self UUID];
  v6 = [v4 UUID];
  if ([v5 isEqual:v6])
  {
    uint64_t v7 = [(CXJoinCallActivitySession *)self activity];
    v8 = [v4 activity];
    if ([v7 isEqualToJoinCallActivity:v8])
    {
      v9 = [(CXJoinCallActivitySession *)self timestamp];
      v10 = [v4 timestamp];
      if (v9 == v10)
      {
        unint64_t v12 = [(CXJoinCallActivitySession *)self state];
        BOOL v11 = v12 == [v4 state];
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(CXJoinCallActivitySession *)self UUID];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(CXJoinCallActivitySession *)self activity];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(CXJoinCallActivitySession *)self timestamp];
  uint64_t v8 = [v7 hash];
  unint64_t v9 = v6 ^ v8 ^ [(CXJoinCallActivitySession *)self state];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v5 = [(CXJoinCallActivitySession *)self activity];
  uint64_t v6 = (void *)[v4 initWithActivity:v5];

  uint64_t v7 = [(CXJoinCallActivitySession *)self UUID];
  [v6 setUUID:v7];

  uint64_t v8 = [(CXJoinCallActivitySession *)self timestamp];
  [v6 setTimestamp:v8];

  objc_msgSend(v6, "setState:", -[CXJoinCallActivitySession state](self, "state"));
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXJoinCallActivitySession)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CXJoinCallActivitySession *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = NSStringFromSelector(sel_UUID);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v8;

    uint64_t v10 = objc_opt_class();
    BOOL v11 = NSStringFromSelector(sel_activity);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    activity = v5->_activity;
    v5->_activity = (CXJoinCallActivity *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_timestamp);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v16;

    v18 = NSStringFromSelector(sel_state);
    v5->_state = [v4 decodeIntegerForKey:v18];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CXJoinCallActivitySession *)self UUID];
  uint64_t v6 = NSStringFromSelector(sel_UUID);
  [v4 encodeObject:v5 forKey:v6];

  uint64_t v7 = [(CXJoinCallActivitySession *)self activity];
  uint64_t v8 = NSStringFromSelector(sel_activity);
  [v4 encodeObject:v7 forKey:v8];

  unint64_t v9 = [(CXJoinCallActivitySession *)self timestamp];
  uint64_t v10 = NSStringFromSelector(sel_timestamp);
  [v4 encodeObject:v9 forKey:v10];

  unint64_t v11 = [(CXJoinCallActivitySession *)self state];
  NSStringFromSelector(sel_state);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInteger:v11 forKey:v12];
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

- (CXJoinCallActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end