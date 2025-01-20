@interface WCSessionUserInfoTransfer
+ (BOOL)supportsSecureCoding;
- (BOOL)isCurrentComplicationInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTransferring;
- (BOOL)updateUserInfo:(id)a3 error:(id *)a4;
- (BOOL)updateUserInfoData:(id)a3 error:(id *)a4;
- (BOOL)verifyUserInfo;
- (NSData)userInfoData;
- (NSDate)creationDate;
- (NSDictionary)userInfo;
- (NSError)transferError;
- (NSString)complicationTransferIdentifier;
- (NSString)transferIdentifier;
- (WCSessionUserInfoTransfer)init;
- (WCSessionUserInfoTransfer)initWithCoder:(id)a3;
- (WCSessionUserInfoTransfer)initWithComplicationTransferIdentifier:(id)a3;
- (WCSessionUserInfoTransfer)initWithProtoBufFileURL:(id)a3;
- (WCSessionUserInfoTransfer)initWithTranferIdentifier:(id)a3 complicationTransferIdentifier:(id)a4 currentComplication:(BOOL)a5;
- (WCUserInfo)userInfoStorage;
- (id)description;
- (id)protobufData;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)cancel;
- (void)encodeWithCoder:(id)a3;
- (void)setComplicationTransferIdentifier:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setCurrentComplicationInfo:(BOOL)a3;
- (void)setTransferError:(id)a3;
- (void)setTransferIdentifier:(id)a3;
- (void)setTransferring:(BOOL)a3;
- (void)setUserInfoStorage:(id)a3;
@end

@implementation WCSessionUserInfoTransfer

- (WCSessionUserInfoTransfer)initWithComplicationTransferIdentifier:(id)a3
{
  id v4 = a3;
  v5 = WCTransferIdentifierFromComplicationIdentifier(v4);
  v6 = [(WCSessionUserInfoTransfer *)self initWithTranferIdentifier:v5 complicationTransferIdentifier:v4 currentComplication:1];

  return v6;
}

- (WCSessionUserInfoTransfer)initWithTranferIdentifier:(id)a3 complicationTransferIdentifier:(id)a4 currentComplication:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WCSessionUserInfoTransfer;
  v11 = [(WCSessionUserInfoTransfer *)&v19 init];
  v12 = v11;
  if (v11)
  {
    transferError = v11->_transferError;
    v11->_transferError = 0;

    v12->_transferring = 1;
    uint64_t v14 = objc_opt_new();
    creationDate = v12->_creationDate;
    v12->_creationDate = (NSDate *)v14;

    objc_storeStrong((id *)&v12->_transferIdentifier, a3);
    v12->_currentComplicationInfo = a5;
    objc_storeStrong((id *)&v12->_complicationTransferIdentifier, a4);
    v16 = objc_alloc_init(WCUserInfo);
    userInfoStorage = v12->_userInfoStorage;
    v12->_userInfoStorage = v16;
  }
  return v12;
}

- (WCSessionUserInfoTransfer)initWithProtoBufFileURL:(id)a3
{
  if (a3)
  {
    id v11 = 0;
    id v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:a3 options:0 error:&v11];
    id v5 = v11;
    if (v4)
    {
      v6 = [[WCDProtoUserInfoTransfer alloc] initWithData:v4];
      p_super = &v6->super.super;
      if (v6
        && [(WCDProtoUserInfoTransfer *)v6 hasTransferIdentifier]
        && [p_super hasClientData])
      {
        v8 = [p_super transferIdentifier];
        self = [(WCSessionUserInfoTransfer *)self initWithTranferIdentifier:v8 complicationTransferIdentifier:0 currentComplication:0];

        id v9 = [p_super clientData];
        [(WCSessionUserInfoTransfer *)self updateUserInfoData:v9 error:0];
      }
    }
    else
    {
      p_super = wc_log();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        -[WCSessionUserInfoTransfer initWithProtoBufFileURL:]((uint64_t)v5, p_super);
      }
    }
  }
  return self;
}

- (WCSessionUserInfoTransfer)init
{
  v3 = objc_opt_new();
  id v4 = [v3 UUIDString];
  id v5 = [(WCSessionUserInfoTransfer *)self initWithTranferIdentifier:v4 complicationTransferIdentifier:0 currentComplication:0];

  return v5;
}

- (NSDictionary)userInfo
{
  v2 = [(WCSessionUserInfoTransfer *)self userInfoStorage];
  v3 = [v2 userInfo];

  return (NSDictionary *)v3;
}

- (NSData)userInfoData
{
  v2 = [(WCSessionUserInfoTransfer *)self userInfoStorage];
  v3 = [v2 userInfoData];

  return (NSData *)v3;
}

- (BOOL)updateUserInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(WCSessionUserInfoTransfer *)self userInfoStorage];
  LOBYTE(a4) = [v7 updateUserInfo:v6 error:a4];

  return (char)a4;
}

- (BOOL)updateUserInfoData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(WCSessionUserInfoTransfer *)self userInfoStorage];
  LOBYTE(a4) = [v7 updateUserInfoData:v6 error:a4];

  return (char)a4;
}

- (BOOL)verifyUserInfo
{
  v2 = [(WCSessionUserInfoTransfer *)self userInfoStorage];
  char v3 = [v2 verifyUserInfo];

  return v3;
}

- (void)cancel
{
  id v3 = +[WCSession defaultSession];
  [v3 cancelUserInfo:self];
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = [(WCSessionUserInfoTransfer *)self creationDate];
  id v6 = [v4 creationDate];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  if ([(WCSessionUserInfoTransfer *)self isCurrentComplicationInfo]) {
    id v6 = "YES";
  }
  else {
    id v6 = "NO";
  }
  if ([(WCSessionUserInfoTransfer *)self isTransferring]) {
    int64_t v7 = "YES";
  }
  else {
    int64_t v7 = "NO";
  }
  v8 = [(WCSessionUserInfoTransfer *)self userInfoData];
  if (v8) {
    id v9 = "YES";
  }
  else {
    id v9 = "NO";
  }
  id v10 = [v3 stringWithFormat:@"<%@: %p, current complication info: %s, transferring: %s, hasUserInfo: %s>", v5, self, v6, v7, v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WCSessionUserInfoTransfer *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(WCSessionUserInfoTransfer *)self transferIdentifier];
      int64_t v7 = [(WCSessionUserInfoTransfer *)v5 transferIdentifier];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(WCSessionUserInfoTransfer *)self transferIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL currentComplicationInfo = self->_currentComplicationInfo;
  id v5 = a3;
  [v5 encodeBool:currentComplicationInfo forKey:@"currentComplicationInfo"];
  [v5 encodeBool:self->_transferring forKey:@"transferring"];
  [v5 encodeObject:self->_transferIdentifier forKey:@"transferIdentifier"];
  [v5 encodeObject:self->_userInfoStorage forKey:@"userInfoStorage"];
  [v5 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v5 encodeObject:self->_complicationTransferIdentifier forKey:@"complicationTransferIdentifier"];
}

- (WCSessionUserInfoTransfer)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WCSessionUserInfoTransfer;
  id v5 = [(WCSessionUserInfoTransfer *)&v17 init];
  if (v5)
  {
    v5->_BOOL currentComplicationInfo = [v4 decodeBoolForKey:@"currentComplicationInfo"];
    v5->_transferring = [v4 decodeBoolForKey:@"transferring"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferIdentifier"];
    uint64_t v7 = [v6 copy];
    transferIdentifier = v5->_transferIdentifier;
    v5->_transferIdentifier = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userInfoStorage"];
    userInfoStorage = v5->_userInfoStorage;
    v5->_userInfoStorage = (WCUserInfo *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v11;

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"complicationTransferIdentifier"];
    uint64_t v14 = [v13 copy];
    complicationTransferIdentifier = v5->_complicationTransferIdentifier;
    v5->_complicationTransferIdentifier = (NSString *)v14;
  }
  return v5;
}

- (id)protobufData
{
  unint64_t v3 = objc_opt_new();
  [v3 setVersion:1];
  id v4 = [(WCSessionUserInfoTransfer *)self userInfoData];
  [v3 setClientData:v4];

  id v5 = [(WCSessionUserInfoTransfer *)self transferIdentifier];
  [v3 setTransferIdentifier:v5];

  id v6 = [v3 data];

  return v6;
}

- (BOOL)isCurrentComplicationInfo
{
  return self->_currentComplicationInfo;
}

- (void)setCurrentComplicationInfo:(BOOL)a3
{
  self->_BOOL currentComplicationInfo = a3;
}

- (BOOL)isTransferring
{
  return self->_transferring;
}

- (void)setTransferring:(BOOL)a3
{
  self->_transferring = a3;
}

- (WCUserInfo)userInfoStorage
{
  return self->_userInfoStorage;
}

- (void)setUserInfoStorage:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSError)transferError
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTransferError:(id)a3
{
}

- (NSString)transferIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTransferIdentifier:(id)a3
{
}

- (NSString)complicationTransferIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setComplicationTransferIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationTransferIdentifier, 0);
  objc_storeStrong((id *)&self->_transferIdentifier, 0);
  objc_storeStrong((id *)&self->_transferError, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);

  objc_storeStrong((id *)&self->_userInfoStorage, 0);
}

- (void)initWithProtoBufFileURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  unint64_t v3 = NSPrintF();
  *(_DWORD *)buf = 136446466;
  id v5 = "-[WCSessionUserInfoTransfer initWithProtoBufFileURL:]";
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_222A02000, a2, OS_LOG_TYPE_ERROR, "%{public}s %{public}@", buf, 0x16u);
}

@end