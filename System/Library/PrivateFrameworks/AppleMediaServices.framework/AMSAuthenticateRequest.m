@interface AMSAuthenticateRequest
+ (BOOL)supportsSecureCoding;
- (ACAccount)account;
- (AMSAuthenticateOptions)options;
- (AMSAuthenticateRequest)initWithAccount:(id)a3 options:(id)a4;
- (AMSAuthenticateRequest)initWithCoder:(id)a3;
- (AMSAuthenticateRequest)initWithDSID:(id)a3 altDSID:(id)a4 username:(id)a5 options:(id)a6;
- (BOOL)isServerRequested;
- (NSDictionary)userInfo;
- (NSString)logKey;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAccount:(id)a3;
- (void)setIsServerRequested:(BOOL)a3;
- (void)setLogKey:(id)a3;
- (void)setOptions:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation AMSAuthenticateRequest

- (AMSAuthenticateRequest)initWithAccount:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSAuthenticateRequest;
  v9 = [(AMSAuthenticateRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

- (AMSAuthenticateRequest)initWithDSID:(id)a3 altDSID:(id)a4 username:(id)a5 options:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  v15 = objc_msgSend(v14, "ams_iTunesAccountWithAltDSID:DSID:username:", v11, v10, v12);

  if (!v15)
  {
    v16 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    v17 = objc_msgSend(v16, "_ams_accountTypeWithAccountTypeIdentifier:error:", *MEMORY[0x1E4F17890], 0);

    v15 = (void *)[objc_alloc(MEMORY[0x1E4F179B0]) initWithAccountType:v17];
    [v15 setUsername:v12];
    objc_msgSend(v15, "ams_setDSID:", v10);
    objc_msgSend(v15, "ams_setAltDSID:", v11);
  }
  v18 = [(AMSAuthenticateRequest *)self initWithAccount:v15 options:v13];

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  v4 = [(AMSAuthenticateRequest *)self account];

  if (v4)
  {
    v5 = [(AMSAuthenticateRequest *)self account];
    [v13 encodeObject:v5 forKey:@"kCodingKeyAccount"];
  }
  if ([(AMSAuthenticateRequest *)self isServerRequested]) {
    objc_msgSend(v13, "encodeBool:forKey:", -[AMSAuthenticateRequest isServerRequested](self, "isServerRequested"), @"kCodingKeyIsServerRequested");
  }
  v6 = [(AMSAuthenticateRequest *)self logKey];

  if (v6)
  {
    id v7 = [(AMSAuthenticateRequest *)self logKey];
    [v13 encodeObject:v7 forKey:@"kCodingKeyLogKey"];
  }
  id v8 = [(AMSAuthenticateRequest *)self options];

  if (v8)
  {
    v9 = [(AMSAuthenticateRequest *)self options];
    [v13 encodeObject:v9 forKey:@"kCodingKeyOptions"];
  }
  id v10 = [(AMSAuthenticateRequest *)self userInfo];

  id v11 = v13;
  if (v10)
  {
    id v12 = [(AMSAuthenticateRequest *)self userInfo];
    [v13 encodeObject:v12 forKey:@"kCodingKeyUserInfo"];

    id v11 = v13;
  }
}

- (AMSAuthenticateRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AMSAuthenticateRequest;
  v5 = [(AMSAuthenticateRequest *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyAccount"];
    account = v5->_account;
    v5->_account = (ACAccount *)v6;

    v5->_isServerRequested = [v4 decodeBoolForKey:@"kCodingKeyIsServerRequested"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyLogKey"];
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyOptions"];
    options = v5->_options;
    v5->_options = (AMSAuthenticateOptions *)v10;

    id v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_PLISTClasses");
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"kCodingKeyUserInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v13;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(AMSAuthenticateRequest *)self account];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, @"account");

  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSAuthenticateRequest isServerRequested](self, "isServerRequested"));
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v5, @"server requested");

  uint64_t v6 = [(AMSAuthenticateRequest *)self logKey];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v6, @"logKey");

  id v7 = [(AMSAuthenticateRequest *)self options];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v7, @"options");

  uint64_t v8 = [(AMSAuthenticateRequest *)self userInfo];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v8, @"userInfo");

  v9 = [self ams_generateDescriptionWithSubObjects:v3];

  return v9;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (BOOL)isServerRequested
{
  return self->_isServerRequested;
}

- (void)setIsServerRequested:(BOOL)a3
{
  self->_isServerRequested = a3;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (AMSAuthenticateOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
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
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end