@interface ASDTestFlightServiceExtensionPushMessage
+ (BOOL)supportsSecureCoding;
- (ASDTestFlightServiceExtensionPushMessage)initWithCoder:(id)a3;
- (ASDTestFlightServiceExtensionPushMessage)initWithTimestamp:(id)a3 userInfo:(id)a4;
- (NSDate)timestamp;
- (NSDictionary)userInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDTestFlightServiceExtensionPushMessage

- (ASDTestFlightServiceExtensionPushMessage)initWithTimestamp:(id)a3 userInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASDTestFlightServiceExtensionPushMessage;
  v9 = [(ASDTestFlightServiceExtensionPushMessage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timestamp, a3);
    objc_storeStrong((id *)&v10->_userInfo, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ASDTestFlightServiceExtensionPushMessage allocWithZone:](ASDTestFlightServiceExtensionPushMessage, "allocWithZone:") init];
  uint64_t v6 = [(NSDate *)self->_timestamp copyWithZone:a3];
  timestamp = v5->_timestamp;
  v5->_timestamp = (NSDate *)v6;

  uint64_t v8 = [(NSDictionary *)self->_userInfo copyWithZone:a3];
  userInfo = v5->_userInfo;
  v5->_userInfo = (NSDictionary *)v8;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDTestFlightServiceExtensionPushMessage)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ASDTestFlightServiceExtensionPushMessage *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v6;

    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:7];
    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v8, v13, v14, v15, v16, v17, v18);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeObject:timestamp forKey:@"timestamp"];
  [v5 encodeObject:self->_userInfo forKey:@"userInfo"];
}

- (id)description
{
  v3 = (void *)[(NSDictionary *)self->_userInfo mutableCopy];
  if (![MEMORY[0x1E4F28D90] isValidJSONObject:v3]
    || ([MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:0],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0)
    || (id v5 = (void *)v4,
        uint64_t v6 = (void *)[[NSString alloc] initWithData:v4 encoding:4],
        v5,
        !v6))
  {
    uint64_t v6 = [v3 description];
  }
  id v7 = [NSString stringWithFormat:@"%@: %@", self->_timestamp, v6];

  return v7;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end