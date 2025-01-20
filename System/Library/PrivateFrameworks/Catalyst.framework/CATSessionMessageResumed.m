@interface CATSessionMessageResumed
+ (BOOL)supportsSecureCoding;
- (CATSessionMessageResumed)initWithCoder:(id)a3;
- (CATSessionMessageResumed)initWithSessionUUID:(id)a3;
- (NSArray)pendingRemoteTaskUUIDs;
- (NSDictionary)serverUserInfo;
- (NSUUID)sessionUUID;
- (void)encodeWithCoder:(id)a3;
- (void)setPendingRemoteTaskUUIDs:(id)a3;
- (void)setServerUserInfo:(id)a3;
- (void)setSessionUUID:(id)a3;
@end

@implementation CATSessionMessageResumed

- (CATSessionMessageResumed)initWithSessionUUID:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CATSessionMessageResumed;
  v6 = [(CATMessage *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sessionUUID, a3);
    pendingRemoteTaskUUIDs = v7->_pendingRemoteTaskUUIDs;
    v7->_pendingRemoteTaskUUIDs = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATSessionMessageResumed)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CATSessionMessageResumed;
  id v5 = [(CATMessage *)&v29 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"sessionUUID"];
    sessionUUID = v5->_sessionUUID;
    v5->_sessionUUID = (NSUUID *)v7;

    v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"pendingRemoteTaskUUIDs"];
    pendingRemoteTaskUUIDs = v5->_pendingRemoteTaskUUIDs;
    v5->_pendingRemoteTaskUUIDs = (NSArray *)v12;

    v28 = (void *)MEMORY[0x263EFFA08];
    uint64_t v27 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v28, "setWithObjects:", v27, v26, v14, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"serverUserInfo"];
    serverUserInfo = v5->_serverUserInfo;
    v5->_serverUserInfo = (NSDictionary *)v23;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CATSessionMessageResumed;
  id v4 = a3;
  [(CATMessage *)&v8 encodeWithCoder:v4];
  id v5 = [(CATSessionMessageResumed *)self sessionUUID];
  [v4 encodeObject:v5 forKey:@"sessionUUID"];

  v6 = [(CATSessionMessageResumed *)self pendingRemoteTaskUUIDs];
  [v4 encodeObject:v6 forKey:@"pendingRemoteTaskUUIDs"];

  uint64_t v7 = [(CATSessionMessageResumed *)self serverUserInfo];
  [v4 encodeObject:v7 forKey:@"serverUserInfo"];
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (NSDictionary)serverUserInfo
{
  return self->_serverUserInfo;
}

- (void)setServerUserInfo:(id)a3
{
}

- (NSArray)pendingRemoteTaskUUIDs
{
  return self->_pendingRemoteTaskUUIDs;
}

- (void)setPendingRemoteTaskUUIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRemoteTaskUUIDs, 0);
  objc_storeStrong((id *)&self->_serverUserInfo, 0);

  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end