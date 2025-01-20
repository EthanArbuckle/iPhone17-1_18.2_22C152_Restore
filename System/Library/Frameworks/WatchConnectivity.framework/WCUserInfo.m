@interface WCUserInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)updateUserInfo:(id)a3 error:(id *)a4;
- (BOOL)updateUserInfoData:(id)a3 error:(id *)a4;
- (BOOL)verifyUserInfo;
- (NSData)userInfoData;
- (NSDictionary)clientUserInfo;
- (NSDictionary)userInfo;
- (WCUserInfo)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setClientUserInfo:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setUserInfoData:(id)a3;
- (void)userInfo;
@end

@implementation WCUserInfo

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WCUserInfo *)self userInfo];
  v7 = [(WCUserInfo *)self userInfoData];
  v8 = [(WCUserInfo *)self clientUserInfo];
  v9 = [v3 stringWithFormat:@"<%@: %p, userInfo: %@, userInfoData: %@, client user info: %@>", v5, self, v6, v7, v8];

  return v9;
}

- (NSDictionary)userInfo
{
  v3 = self->_userInfo;
  if (!self->_userInfo)
  {
    v4 = [(WCUserInfo *)self userInfoData];

    if (v4)
    {
      v5 = [(WCUserInfo *)self userInfoData];
      id v12 = 0;
      WCDeserializePayloadData(v5, &v12);
      v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      id v7 = v12;

      if (v6)
      {
        v8 = (NSDictionary *)[(NSDictionary *)v6 copy];
        p_super = &self->_userInfo->super;
        self->_userInfo = v8;
      }
      else
      {
        p_super = wc_log();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          [(WCUserInfo *)(uint64_t)v7 userInfo];
        }
      }
    }
    else
    {
      v6 = v3;
    }
    if (self->_userInfo
      || ([(WCUserInfo *)self clientUserInfo],
          v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          !v10))
    {
      v3 = v6;
    }
    else
    {
      v3 = [(WCUserInfo *)self clientUserInfo];
    }
  }

  return v3;
}

- (BOOL)updateUserInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(WCUserInfo *)self setClientUserInfo:v6];
  id v7 = WCSerializePayloadDictionary(v6, a4);

  if (!v7)
  {
    if (a4)
    {
      v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = 7010;
LABEL_8:
      [v9 wcErrorWithCode:v10];
      BOOL v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    BOOL v8 = 0;
    goto LABEL_10;
  }
  if (!WCIsDataAcceptableSizeForType(2, v7))
  {
    if (a4)
    {
      v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = 7009;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  [(WCUserInfo *)self setUserInfoData:v7];
  objc_storeStrong((id *)&self->_userInfo, self->_clientUserInfo);
  [(WCUserInfo *)self setClientUserInfo:0];
  BOOL v8 = 1;
LABEL_10:

  return v8;
}

- (BOOL)updateUserInfoData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(WCUserInfo *)self userInfoData];

  if (!v7)
  {
    [(WCUserInfo *)self setUserInfoData:v6];
    BOOL v8 = 0;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  BOOL v8 = [MEMORY[0x263F087E8] wcInternalErrorWithCode:7501];
  if (a4) {
LABEL_3:
  }
    *a4 = v8;
LABEL_4:

  return v7 == 0;
}

- (BOOL)verifyUserInfo
{
  v3 = [(WCUserInfo *)self userInfoData];

  if (!v3) {
    return 0;
  }
  v4 = [(WCUserInfo *)self userInfoData];
  id v11 = 0;
  v5 = WCDeserializePayloadData(v4, &v11);
  id v6 = v11;

  BOOL v7 = v5 != 0;
  if (v5)
  {
    BOOL v8 = (NSDictionary *)[v5 copy];
    userInfo = self->_userInfo;
    self->_userInfo = v8;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (WCUserInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WCUserInfo;
  v5 = [(WCUserInfo *)&v10 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userInfoData"];
    uint64_t v7 = [v6 copy];
    userInfoData = v5->_userInfoData;
    v5->_userInfoData = (NSData *)v7;
  }
  return v5;
}

- (NSData)userInfoData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUserInfoData:(id)a3
{
}

- (void)setUserInfo:(id)a3
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
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_userInfoData, 0);
}

- (void)userInfo
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = NSPrintF();
  *(_DWORD *)buf = 136446466;
  v5 = "-[WCUserInfo userInfo]";
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_222A02000, a2, OS_LOG_TYPE_ERROR, "%{public}s could not deserialize user info data %{public}@", buf, 0x16u);
}

@end