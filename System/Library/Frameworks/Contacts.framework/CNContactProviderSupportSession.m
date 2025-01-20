@interface CNContactProviderSupportSession
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNContactProviderSupportSession)init;
- (CNContactProviderSupportSession)initWithCoder:(id)a3;
- (NSDictionary)userInfo;
- (NSProgress)progress;
- (NSString)displayName;
- (NSString)synchronizationReason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setProgress:(id)a3;
- (void)setSynchronizationReason:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation CNContactProviderSupportSession

- (CNContactProviderSupportSession)init
{
  v10.receiver = self;
  v10.super_class = (Class)CNContactProviderSupportSession;
  v2 = [(CNContactProviderSupportSession *)&v10 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_synchronizationReason, @"App Requested");
    v4 = (NSProgress *)objc_alloc_init(MEMORY[0x1E4F28F90]);
    progress = v3->_progress;
    v3->_progress = v4;

    displayName = v3->_displayName;
    v3->_displayName = (NSString *)&stru_1EE052B80;

    userInfo = v3->_userInfo;
    v3->_userInfo = (NSDictionary *)MEMORY[0x1E4F1CC08];

    v8 = v3;
  }

  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"reason" object:self->_synchronizationReason];
  id v5 = (id)[v3 appendName:@"displayName" object:self->_displayName];
  id v6 = (id)[v3 appendName:@"userInfo" object:self->_userInfo];
  id v7 = (id)[v3 appendName:@"progress" object:self->_progress];
  v8 = [v3 build];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactProviderSupportSession)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_synchronizationReason"];
  id v6 = (NSString *)[v5 copy];
  synchronizationReason = self->_synchronizationReason;
  self->_synchronizationReason = v6;

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_displayName"];
  v9 = (NSString *)[v8 copy];
  displayName = self->_displayName;
  self->_displayName = v9;

  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v16 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
  v17 = [v4 decodeObjectOfClasses:v16 forKey:@"_userInfo"];

  v18 = (NSDictionary *)[v17 copy];
  userInfo = self->_userInfo;
  self->_userInfo = v18;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  synchronizationReason = self->_synchronizationReason;
  id v5 = a3;
  [v5 encodeObject:synchronizationReason forKey:@"_synchronizationReason"];
  [v5 encodeObject:self->_displayName forKey:@"_displayName"];
  [v5 encodeObject:self->_userInfo forKey:@"_userInfo"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CNContactProviderSupportSession);
  id v5 = [(CNContactProviderSupportSession *)self synchronizationReason];
  [(CNContactProviderSupportSession *)v4 setSynchronizationReason:v5];

  id v6 = [(CNContactProviderSupportSession *)self displayName];
  [(CNContactProviderSupportSession *)v4 setDisplayName:v6];

  id v7 = [(CNContactProviderSupportSession *)self userInfo];
  [(CNContactProviderSupportSession *)v4 setUserInfo:v7];

  v8 = [(CNContactProviderSupportSession *)self progress];
  [(CNContactProviderSupportSession *)v4 setProgress:v8];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNContactProviderSupportSession *)a3;
  if (self == v4) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  unint64_t v5 = (unint64_t)[(CNContactProviderSupportSession *)self synchronizationReason];
  unint64_t v6 = (unint64_t)[(CNContactProviderSupportSession *)v4 synchronizationReason];
  if (v5 | v6)
  {
    if (![(id)v5 isEqual:v6]) {
      goto LABEL_12;
    }
  }
  if (((unint64_t v7 = (unint64_t)[(CNContactProviderSupportSession *)self progress],
         unint64_t v8 = (unint64_t)[(CNContactProviderSupportSession *)v4 progress],
         !(v7 | v8))
     || [(id)v7 isEqual:v8])
    && ((unint64_t v9 = (unint64_t)[(CNContactProviderSupportSession *)self displayName],
         unint64_t v10 = (unint64_t)[(CNContactProviderSupportSession *)v4 displayName],
         !(v9 | v10))
     || [(id)v9 isEqual:v10])
    && ((unint64_t v11 = (unint64_t)[(CNContactProviderSupportSession *)self userInfo],
         unint64_t v12 = (unint64_t)[(CNContactProviderSupportSession *)v4 userInfo],
         !(v11 | v12))
     || [(id)v11 isEqual:v12]))
  {
LABEL_11:
    BOOL v13 = 1;
  }
  else
  {
LABEL_12:
    BOOL v13 = 0;
  }

  return v13;
}

- (NSString)synchronizationReason
{
  return self->_synchronizationReason;
}

- (void)setSynchronizationReason:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
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
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_progress, 0);

  objc_storeStrong((id *)&self->_synchronizationReason, 0);
}

@end