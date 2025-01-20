@interface DAAccountChangeInfo
+ (BOOL)supportsSecureCoding;
+ (id)_stringForChangeType:(unint64_t)a3;
- (DAAccountChangeInfo)initWithChangeType:(unint64_t)a3 accountIdentifier:(id)a4 accountTypeIdentifier:(id)a5 oldAccountProperties:(id)a6 username:(id)a7 password:(id)a8 oldUsername:(id)a9 oldPassword:(id)a10 modifiedDataClasses:(id)a11 clientName:(id)a12;
- (DAAccountChangeInfo)initWithCoder:(id)a3;
- (NSDictionary)oldAccountProperties;
- (NSSet)modifiedDataClasses;
- (NSString)accountIdentifier;
- (NSString)accountTypeIdentifier;
- (NSString)clientName;
- (NSString)oldPassword;
- (NSString)oldUsername;
- (NSString)password;
- (NSString)username;
- (id)description;
- (id)redactedDescription;
- (unint64_t)changeType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DAAccountChangeInfo

- (DAAccountChangeInfo)initWithChangeType:(unint64_t)a3 accountIdentifier:(id)a4 accountTypeIdentifier:(id)a5 oldAccountProperties:(id)a6 username:(id)a7 password:(id)a8 oldUsername:(id)a9 oldPassword:(id)a10 modifiedDataClasses:(id)a11 clientName:(id)a12
{
  id v47 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  v48.receiver = self;
  v48.super_class = (Class)DAAccountChangeInfo;
  v26 = [(DAAccountChangeInfo *)&v48 init];
  v27 = v26;
  if (v26)
  {
    v26->_changeType = a3;
    uint64_t v28 = [v47 copy];
    accountIdentifier = v27->_accountIdentifier;
    v27->_accountIdentifier = (NSString *)v28;

    uint64_t v30 = [v18 copy];
    accountTypeIdentifier = v27->_accountTypeIdentifier;
    v27->_accountTypeIdentifier = (NSString *)v30;

    uint64_t v32 = [v19 copy];
    oldAccountProperties = v27->_oldAccountProperties;
    v27->_oldAccountProperties = (NSDictionary *)v32;

    uint64_t v34 = [v20 copy];
    username = v27->_username;
    v27->_username = (NSString *)v34;

    uint64_t v36 = [v21 copy];
    password = v27->_password;
    v27->_password = (NSString *)v36;

    uint64_t v38 = [v22 copy];
    oldUsername = v27->_oldUsername;
    v27->_oldUsername = (NSString *)v38;

    uint64_t v40 = [v23 copy];
    oldPassword = v27->_oldPassword;
    v27->_oldPassword = (NSString *)v40;

    uint64_t v42 = [v24 copy];
    modifiedDataClasses = v27->_modifiedDataClasses;
    v27->_modifiedDataClasses = (NSSet *)v42;

    uint64_t v44 = [v25 copy];
    clientName = v27->_clientName;
    v27->_clientName = (NSString *)v44;
  }
  return v27;
}

- (DAAccountChangeInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeIntForKey:@"ChangeType"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AccountIdentifier"];
  if (!v6)
  {
    v7 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA3E8000, v7, OS_LOG_TYPE_ERROR, "Missing account identifier when attempting to decode DAAccountChangeInfo", buf, 2u);
    }
    goto LABEL_11;
  }
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AccountTypeIdentifier"];
  if (!v7)
  {
    v17 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v23 = 0;
      _os_log_impl(&dword_1BA3E8000, v17, OS_LOG_TYPE_ERROR, "Missing account type identifier when attempting to decode DAAccountChangeInfo", v23, 2u);
    }

LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  uint64_t v22 = v5;
  if (initWithCoder__onceToken != -1) {
    dispatch_once(&initWithCoder__onceToken, &__block_literal_global_3);
  }
  id v20 = [v4 decodeObjectOfClasses:initWithCoder__oldAccountPropertiesWhitelist forKey:@"OldAccountProperties"];
  id v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Username"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Password"];
  id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OldUsername"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OldPassword"];
  v10 = [v4 decodeObjectOfClasses:initWithCoder__modifiedDataClassesWhitelist forKey:@"ModifiedDataClasses"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ClientName"];
  v12 = v6;
  v13 = v6;
  v14 = (void *)v8;
  v15 = [(DAAccountChangeInfo *)self initWithChangeType:v22 accountIdentifier:v12 accountTypeIdentifier:v7 oldAccountProperties:v20 username:v21 password:v8 oldUsername:v19 oldPassword:v9 modifiedDataClasses:v10 clientName:v11];

  v6 = v13;
  self = v15;

  v16 = v15;
LABEL_12:

  return v16;
}

void __37__DAAccountChangeInfo_initWithCoder___block_invoke()
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v9[2] = objc_opt_class();
  v9[3] = objc_opt_class();
  v9[4] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)initWithCoder__oldAccountPropertiesWhitelist;
  initWithCoder__oldAccountPropertiesWhitelist = v2;

  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  uint64_t v6 = objc_msgSend(v4, "setWithArray:", v5, v8[0]);
  v7 = (void *)initWithCoder__modifiedDataClassesWhitelist;
  initWithCoder__modifiedDataClassesWhitelist = v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  objc_msgSend(v20, "encodeInt:forKey:", -[DAAccountChangeInfo changeType](self, "changeType"), @"ChangeType");
  id v4 = [(DAAccountChangeInfo *)self accountIdentifier];
  [v20 encodeObject:v4 forKey:@"AccountIdentifier"];

  int v5 = [(DAAccountChangeInfo *)self accountTypeIdentifier];
  [v20 encodeObject:v5 forKey:@"AccountTypeIdentifier"];

  uint64_t v6 = [(DAAccountChangeInfo *)self oldAccountProperties];

  if (v6)
  {
    v7 = [(DAAccountChangeInfo *)self oldAccountProperties];
    [v20 encodeObject:v7 forKey:@"OldAccountProperties"];
  }
  uint64_t v8 = [(DAAccountChangeInfo *)self username];

  if (v8)
  {
    v9 = [(DAAccountChangeInfo *)self username];
    [v20 encodeObject:v9 forKey:@"Username"];
  }
  v10 = [(DAAccountChangeInfo *)self password];

  if (v10)
  {
    v11 = [(DAAccountChangeInfo *)self password];
    [v20 encodeObject:v11 forKey:@"Password"];
  }
  v12 = [(DAAccountChangeInfo *)self oldUsername];

  if (v12)
  {
    v13 = [(DAAccountChangeInfo *)self oldUsername];
    [v20 encodeObject:v13 forKey:@"OldUsername"];
  }
  v14 = [(DAAccountChangeInfo *)self oldPassword];

  if (v14)
  {
    v15 = [(DAAccountChangeInfo *)self oldPassword];
    [v20 encodeObject:v15 forKey:@"OldPassword"];
  }
  v16 = [(DAAccountChangeInfo *)self modifiedDataClasses];

  if (v16)
  {
    v17 = [(DAAccountChangeInfo *)self modifiedDataClasses];
    [v20 encodeObject:v17 forKey:@"ModifiedDataClasses"];
  }
  id v18 = [(DAAccountChangeInfo *)self clientName];

  if (v18)
  {
    id v19 = [(DAAccountChangeInfo *)self clientName];
    [v20 encodeObject:v19 forKey:@"ClientName"];
  }
}

- (id)description
{
  id v19 = NSString;
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "_stringForChangeType:", -[DAAccountChangeInfo changeType](self, "changeType"));
  uint64_t v22 = [(DAAccountChangeInfo *)self accountIdentifier];
  id v21 = [(DAAccountChangeInfo *)self accountTypeIdentifier];
  id v4 = [(DAAccountChangeInfo *)self oldAccountProperties];
  id v20 = (void *)v3;
  if (v4)
  {
    int v5 = NSString;
    id v18 = [(DAAccountChangeInfo *)self oldAccountProperties];
    v17 = [v18 allKeys];
    [v5 stringWithFormat:@"<keys = %@>", v17];
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = @"nil";
  }
  v7 = [(DAAccountChangeInfo *)self username];
  uint64_t v8 = [(DAAccountChangeInfo *)self password];
  v9 = @"<redacted>";
  if (v8) {
    v10 = @"<redacted>";
  }
  else {
    v10 = @"nil";
  }
  v11 = [(DAAccountChangeInfo *)self oldUsername];
  v12 = [(DAAccountChangeInfo *)self oldPassword];
  if (!v12) {
    v9 = @"nil";
  }
  v13 = [(DAAccountChangeInfo *)self modifiedDataClasses];
  v14 = [(DAAccountChangeInfo *)self clientName];
  v15 = [v19 stringWithFormat:@"<DAAccountChangeInfo: changeType = %@, accountIdentifier = %@, accountTypeIdentifier = %@, oldAccountProperties = %@, username = %@, password = %@, oldUsername = %@, oldPassword = %@, modifiedDataClasses = %@, clientName = %@>", v20, v22, v21, v6, v7, v10, v11, v9, v13, v14];

  if (v4)
  {
  }
  return v15;
}

- (id)redactedDescription
{
  id v20 = NSString;
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "_stringForChangeType:", -[DAAccountChangeInfo changeType](self, "changeType"));
  uint64_t v4 = [(DAAccountChangeInfo *)self accountIdentifier];
  uint64_t v5 = [(DAAccountChangeInfo *)self accountTypeIdentifier];
  id v21 = [(DAAccountChangeInfo *)self oldAccountProperties];
  id v23 = (void *)v4;
  id v24 = (void *)v3;
  uint64_t v22 = (void *)v5;
  if (v21)
  {
    uint64_t v6 = NSString;
    id v19 = [(DAAccountChangeInfo *)self oldAccountProperties];
    objc_msgSend(v6, "stringWithFormat:", @"<%d values>", objc_msgSend(v19, "count"));
    id v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v25 = @"nil";
  }
  v7 = [(DAAccountChangeInfo *)self username];
  uint64_t v8 = @"<redacted>";
  if (v7) {
    v9 = @"<redacted>";
  }
  else {
    v9 = @"nil";
  }
  v10 = [(DAAccountChangeInfo *)self password];
  if (v10) {
    v11 = @"<redacted>";
  }
  else {
    v11 = @"nil";
  }
  v12 = [(DAAccountChangeInfo *)self oldUsername];
  if (v12) {
    v13 = @"<redacted>";
  }
  else {
    v13 = @"nil";
  }
  v14 = [(DAAccountChangeInfo *)self oldPassword];
  if (!v14) {
    uint64_t v8 = @"nil";
  }
  v15 = [(DAAccountChangeInfo *)self modifiedDataClasses];
  v16 = [(DAAccountChangeInfo *)self clientName];
  v17 = [v20 stringWithFormat:@"<DAAccountChangeInfo: changeType = %@, accountIdentifier = %@, accountTypeIdentifier = %@, oldAccountProperties = %@, username = %@, password = %@, oldUsername = %@, oldPassword = %@, modifiedDataClasses = %@, clientName = %@>", v24, v23, v22, v25, v9, v11, v13, v8, v15, v16];

  if (v21)
  {
  }
  return v17;
}

+ (id)_stringForChangeType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"Add";
  }
  else {
    return (id)*((void *)&off_1E6216170 + a3 - 1);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)accountTypeIdentifier
{
  return self->_accountTypeIdentifier;
}

- (NSDictionary)oldAccountProperties
{
  return self->_oldAccountProperties;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)password
{
  return self->_password;
}

- (NSString)oldUsername
{
  return self->_oldUsername;
}

- (NSString)oldPassword
{
  return self->_oldPassword;
}

- (NSSet)modifiedDataClasses
{
  return self->_modifiedDataClasses;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_modifiedDataClasses, 0);
  objc_storeStrong((id *)&self->_oldPassword, 0);
  objc_storeStrong((id *)&self->_oldUsername, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_oldAccountProperties, 0);
  objc_storeStrong((id *)&self->_accountTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end