@interface FOAuthorizationRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FOAuthorizationRecord)initWithBundleIdentifier:(id)a3 teamIdentifier:(id)a4 recordIdentifier:(id)a5 status:(int64_t)a6 type:(int64_t)a7;
- (FOAuthorizationRecord)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)teamIdentifier;
- (NSUUID)recordIdentifier;
- (int64_t)status;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FOAuthorizationRecord

- (FOAuthorizationRecord)initWithBundleIdentifier:(id)a3 teamIdentifier:(id)a4 recordIdentifier:(id)a5 status:(int64_t)a6 type:(int64_t)a7
{
  v22.receiver = self;
  v22.super_class = (Class)FOAuthorizationRecord;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(FOAuthorizationRecord *)&v22 init];
  uint64_t v15 = objc_msgSend(v13, "copy", v22.receiver, v22.super_class);

  bundleIdentifier = v14->_bundleIdentifier;
  v14->_bundleIdentifier = (NSString *)v15;

  uint64_t v17 = [v12 copy];
  teamIdentifier = v14->_teamIdentifier;
  v14->_teamIdentifier = (NSString *)v17;

  uint64_t v19 = [v11 copy];
  recordIdentifier = v14->_recordIdentifier;
  v14->_recordIdentifier = (NSUUID *)v19;

  v14->_status = a6;
  v14->_type = a7;
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FOAuthorizationRecord *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(FOAuthorizationRecord *)self bundleIdentifier];
      v7 = [(FOAuthorizationRecord *)v5 bundleIdentifier];
      if ([v6 isEqualToString:v7])
      {
        v8 = [(FOAuthorizationRecord *)self teamIdentifier];
        v9 = [(FOAuthorizationRecord *)v5 teamIdentifier];
        if ([v8 isEqualToString:v9])
        {
          v10 = [(FOAuthorizationRecord *)self recordIdentifier];
          id v11 = [(FOAuthorizationRecord *)v5 recordIdentifier];
          if ([v10 isEqual:v11]
            && (int64_t v12 = [(FOAuthorizationRecord *)self status],
                v12 == [(FOAuthorizationRecord *)v5 status]))
          {
            int64_t v13 = [(FOAuthorizationRecord *)self type];
            BOOL v14 = v13 == [(FOAuthorizationRecord *)v5 type];
          }
          else
          {
            BOOL v14 = 0;
          }
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  v3 = [(FOAuthorizationRecord *)self bundleIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(FOAuthorizationRecord *)self teamIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(FOAuthorizationRecord *)self recordIdentifier];
  uint64_t v8 = [v7 hash];
  int64_t v9 = [(FOAuthorizationRecord *)self status];
  unint64_t v10 = v6 ^ (v9 + [(FOAuthorizationRecord *)self type] + v8);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:bundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeObject:self->_teamIdentifier forKey:@"teamIdentifier"];
  [v5 encodeObject:self->_recordIdentifier forKey:@"recordIdentifier"];
  [v5 encodeInteger:self->_status forKey:@"status"];
  [v5 encodeInteger:self->_type forKey:@"type"];
}

- (FOAuthorizationRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FOAuthorizationRecord;
  id v5 = [(FOAuthorizationRecord *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"teamIdentifier"];
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordIdentifier"];
    recordIdentifier = v5->_recordIdentifier;
    v5->_recordIdentifier = (NSUUID *)v10;

    v5->_status = [v4 decodeIntegerForKey:@"status"];
    if ([v4 containsValueForKey:@"type"]) {
      uint64_t v12 = [v4 decodeIntegerForKey:@"type"];
    }
    else {
      uint64_t v12 = 0;
    }
    v5->_type = v12;
  }

  return v5;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)teamIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)recordIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)status
{
  return self->_status;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end