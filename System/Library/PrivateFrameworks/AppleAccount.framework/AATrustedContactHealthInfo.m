@interface AATrustedContactHealthInfo
+ (BOOL)supportsSecureCoding;
- (AATrustedContactHealthInfo)initWithCoder:(id)a3;
- (AATrustedContactHealthInfo)initWithID:(id)a3 lastValidCheckTimeStamp:(id)a4;
- (NSDate)lastValidCheckTimestamp;
- (NSUUID)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AATrustedContactHealthInfo

- (AATrustedContactHealthInfo)initWithID:(id)a3 lastValidCheckTimeStamp:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AATrustedContactHealthInfo;
  v9 = [(AATrustedContactHealthInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_lastValidCheckTimestamp, a4);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"_identifier"];
  [v5 encodeObject:self->_lastValidCheckTimestamp forKey:@"_lastValidCheckTimestamp"];
}

- (AATrustedContactHealthInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AATrustedContactHealthInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lastValidCheckTimestamp"];
    lastValidCheckTimestamp = v5->_lastValidCheckTimestamp;
    v5->_lastValidCheckTimestamp = (NSDate *)v8;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSUUID *)self->_identifier copy];
  uint64_t v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSDate *)self->_lastValidCheckTimestamp copy];
  uint64_t v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p> Trusted Contact Health Info : Identifier: %@ \nLast Check Timestamp: %@", objc_opt_class(), self, self->_identifier, self->_lastValidCheckTimestamp];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)lastValidCheckTimestamp
{
  return self->_lastValidCheckTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastValidCheckTimestamp, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end