@interface CATSessionMessageResume
+ (BOOL)supportsSecureCoding;
- (CATSessionMessageResume)initWithCoder:(id)a3;
- (CATSessionMessageResume)initWithSessionUUID:(id)a3;
- (NSDictionary)clientUserInfo;
- (NSUUID)sessionUUID;
- (void)encodeWithCoder:(id)a3;
- (void)setClientUserInfo:(id)a3;
- (void)setSessionUUID:(id)a3;
@end

@implementation CATSessionMessageResume

- (CATSessionMessageResume)initWithSessionUUID:(id)a3
{
  id v5 = a3;
  v6 = [(CATMessage *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sessionUUID, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATSessionMessageResume)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CATSessionMessageResume;
  id v5 = [(CATMessage *)&v24 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"sessionUUID"];
    sessionUUID = v5->_sessionUUID;
    v5->_sessionUUID = (NSUUID *)v7;

    v23 = (void *)MEMORY[0x263EFFA08];
    uint64_t v22 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v23, "setWithObjects:", v22, v21, v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"clientUserInfo"];
    clientUserInfo = v5->_clientUserInfo;
    v5->_clientUserInfo = (NSDictionary *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CATSessionMessageResume;
  id v4 = a3;
  [(CATMessage *)&v7 encodeWithCoder:v4];
  id v5 = [(CATSessionMessageResume *)self sessionUUID];
  [v4 encodeObject:v5 forKey:@"sessionUUID"];

  v6 = [(CATSessionMessageResume *)self clientUserInfo];
  [v4 encodeObject:v6 forKey:@"clientUserInfo"];
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (NSDictionary)clientUserInfo
{
  return self->_clientUserInfo;
}

- (void)setClientUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientUserInfo, 0);

  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end