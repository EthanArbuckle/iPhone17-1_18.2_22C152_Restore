@interface ASUserNotificationResponse
+ (BOOL)supportsSecureCoding;
- (ASUserNotificationResponse)initWithActionIdentifier:(id)a3 userInfo:(id)a4;
- (ASUserNotificationResponse)initWithCoder:(id)a3;
- (NSDictionary)userInfo;
- (NSString)actionIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASUserNotificationResponse

- (ASUserNotificationResponse)initWithActionIdentifier:(id)a3 userInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASUserNotificationResponse;
  v9 = [(ASUserNotificationResponse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionIdentifier, a3);
    objc_storeStrong((id *)&v10->_userInfo, a4);
  }

  return v10;
}

- (ASUserNotificationResponse)initWithCoder:(id)a3
{
  v15[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASUserNotificationResponse;
  v5 = [(ASUserNotificationResponse *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionIdentifier"];
    actionIdentifier = v5->_actionIdentifier;
    v5->_actionIdentifier = (NSString *)v6;

    id v8 = (void *)MEMORY[0x263EFFA08];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:4];
    v10 = [v8 setWithArray:v9];

    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  actionIdentifier = self->_actionIdentifier;
  id v5 = a3;
  [v5 encodeObject:actionIdentifier forKey:@"actionIdentifier"];
  [v5 encodeObject:self->_userInfo forKey:@"userInfo"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"ASUserNotificationResponse actionIdentifier=%@ userInfo=%@", self->_actionIdentifier, self->_userInfo];
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

@end