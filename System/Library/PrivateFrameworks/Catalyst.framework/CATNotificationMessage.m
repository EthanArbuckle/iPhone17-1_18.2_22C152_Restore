@interface CATNotificationMessage
+ (BOOL)supportsSecureCoding;
- (CATNotificationMessage)initWithCoder:(id)a3;
- (CATNotificationMessage)initWithName:(id)a3 userInfo:(id)a4;
- (CATNotificationMessage)initWithTaskUUID:(id)a3 name:(id)a4 userInfo:(id)a5;
- (NSDictionary)userInfo;
- (NSString)name;
- (NSUUID)taskUUID;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setTaskUUID:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation CATNotificationMessage

- (CATNotificationMessage)initWithName:(id)a3 userInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"CATNotificationMessage.m", 19, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)CATNotificationMessage;
  v9 = [(CATMessage *)&v16 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    name = v9->_name;
    v9->_name = (NSString *)v10;

    uint64_t v12 = [v8 copy];
    userInfo = v9->_userInfo;
    v9->_userInfo = (NSDictionary *)v12;
  }
  return v9;
}

- (CATNotificationMessage)initWithTaskUUID:(id)a3 name:(id)a4 userInfo:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    objc_super v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"CATNotificationMessage.m", 31, @"Invalid parameter not satisfying: %@", @"taskUUID" object file lineNumber description];
  }
  v13 = [(CATNotificationMessage *)self initWithName:v11 userInfo:v12];
  v14 = v13;
  if (v13) {
    objc_storeStrong((id *)&v13->_taskUUID, a3);
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATNotificationMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CATNotificationMessage;
  v5 = [(CATMessage *)&v27 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v7;

    v26 = (void *)MEMORY[0x263EFFA08];
    uint64_t v25 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v26, "setWithObjects:", v25, v24, v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v18;

    v20 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"taskUUID"];
    taskUUID = v5->_taskUUID;
    v5->_taskUUID = (NSUUID *)v21;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CATNotificationMessage;
  id v4 = a3;
  [(CATMessage *)&v8 encodeWithCoder:v4];
  v5 = [(CATNotificationMessage *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  v6 = [(CATNotificationMessage *)self userInfo];
  [v4 encodeObject:v6 forKey:@"userInfo"];

  uint64_t v7 = [(CATNotificationMessage *)self taskUUID];
  [v4 encodeObject:v7 forKey:@"taskUUID"];
}

- (NSUUID)taskUUID
{
  return self->_taskUUID;
}

- (void)setTaskUUID:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_taskUUID, 0);
}

@end