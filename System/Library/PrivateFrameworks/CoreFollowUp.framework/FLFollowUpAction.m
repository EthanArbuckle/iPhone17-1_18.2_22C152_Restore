@interface FLFollowUpAction
+ (BOOL)supportsSecureCoding;
+ (FLFollowUpAction)actionWithLabel:(id)a3 url:(id)a4;
- (BOOL)_loadActionURL;
- (BOOL)destructive;
- (FLFollowUpAction)initWithCoder:(id)a3;
- (FLFollowUpAction)initWithLabel:(id)a3 url:(id)a4;
- (NSData)_userInfoData;
- (NSData)launchActionArguments;
- (NSDictionary)userInfo;
- (NSString)identifier;
- (NSString)label;
- (NSURL)launchActionURL;
- (NSURL)url;
- (id)description;
- (unint64_t)eventSource;
- (unint64_t)sqlID;
- (void)encodeWithCoder:(id)a3;
- (void)setDestructive:(BOOL)a3;
- (void)setEventSource:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLaunchActionArguments:(id)a3;
- (void)setLaunchActionURL:(id)a3;
- (void)setSqlID:(unint64_t)a3;
- (void)setUrl:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)set_userInfoData:(id)a3;
@end

@implementation FLFollowUpAction

- (void)setUrl:(id)a3
{
}

- (void)setSqlID:(unint64_t)a3
{
  self->_sqlID = a3;
}

- (void)setLaunchActionURL:(id)a3
{
}

- (void)setLabel:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchActionArguments, 0);
  objc_storeStrong((id *)&self->_launchActionURL, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)set_userInfoData:(id)a3
{
  if (a3)
  {
    id v8 = 0;
    v4 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:&v8];
    id v5 = v8;
    [(FLFollowUpAction *)self setUserInfo:v4];

    v6 = [(FLFollowUpAction *)self userInfo];

    if (!v6)
    {
      v7 = _FLLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[FLFollowUpItem set_userInfoData:]();
      }
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (FLFollowUpAction)actionWithLabel:(id)a3 url:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithLabel:v7 url:v6];

  return (FLFollowUpAction *)v8;
}

- (FLFollowUpAction)initWithLabel:(id)a3 url:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(FLFollowUpAction *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_label, a3);
    objc_storeStrong((id *)&v10->_url, a4);
    v11 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v12 = [v11 UUIDString];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v12;
  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  label = self->_label;
  id v5 = a3;
  [v5 encodeObject:label forKey:@"_label"];
  [v5 encodeObject:self->_url forKey:@"_url"];
  [v5 encodeObject:self->_launchActionURL forKey:@"_launchActionURL"];
  [v5 encodeObject:self->_identifier forKey:@"_identifier"];
  [v5 encodeObject:self->_userInfo forKey:@"_userInfo"];
  [v5 encodeInteger:self->_eventSource forKey:@"_eventSource"];
}

- (FLFollowUpAction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FLFollowUpAction *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_label"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_url"];
    url = v5->_url;
    v5->_url = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_launchActionURL"];
    launchActionURL = v5->_launchActionURL;
    v5->_launchActionURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"_userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v20;

    v5->_eventSource = [v4 decodeIntegerForKey:@"_eventSource"];
  }

  return v5;
}

- (void)setDestructive:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FLFollowUpAction *)self userInfo];
  id v9 = (id)[v5 mutableCopy];

  uint64_t v6 = v9;
  if (!v9) {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  }
  if (v3) {
    uint64_t v7 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CC28];
  }
  id v10 = v6;
  [v6 setObject:v7 forKeyedSubscript:@"FLFollowUpActionIsDestructiveKey"];
  uint64_t v8 = (void *)[v10 copy];
  [(FLFollowUpAction *)self setUserInfo:v8];
}

- (BOOL)destructive
{
  v2 = [(FLFollowUpAction *)self userInfo];
  BOOL v3 = [v2 objectForKeyedSubscript:@"FLFollowUpActionIsDestructiveKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (NSData)launchActionArguments
{
  return (NSData *)[(NSDictionary *)self->_userInfo objectForKeyedSubscript:@"FLFollowUpActionLaunchArgumentsKey"];
}

- (NSData)_userInfoData
{
  BOOL v3 = [(FLFollowUpAction *)self userInfo];

  if (v3)
  {
    char v4 = (void *)MEMORY[0x1E4F28F98];
    id v5 = [(FLFollowUpAction *)self userInfo];
    id v9 = 0;
    BOOL v3 = [v4 dataWithPropertyList:v5 format:200 options:0 error:&v9];
    id v6 = v9;

    if (!v3)
    {
      uint64_t v7 = _FLLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[FLFollowUpItem _userInfoData]();
      }
    }
  }

  return (NSData *)v3;
}

- (BOOL)_loadActionURL
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(FLFollowUpAction *)self url];

  if (v3)
  {
    char v4 = _FLLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(FLFollowUpAction *)self url];
      int v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1BE24A000, v4, OS_LOG_TYPE_DEFAULT, "Attempting to handle URL: %@", (uint8_t *)&v10, 0xCu);
    }
    id v6 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    uint64_t v7 = [(FLFollowUpAction *)self url];
    [v6 openSensitiveURL:v7 withOptions:0];
    goto LABEL_5;
  }
  id v9 = [(FLFollowUpAction *)self launchActionURL];

  if (!v9) {
    return 0;
  }
  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(FLFollowUpAction *)self launchActionURL];
    int v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_1BE24A000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to handle launch URL: %@", (uint8_t *)&v10, 0xCu);
LABEL_5:
  }
  return 1;
}

- (id)description
{
  BOOL v3 = NSString;
  char v4 = [(id)objc_opt_class() description];
  id v5 = [v3 stringWithFormat:@"<%@: %p - label: %@, url: %@, macURL: %@, userInfo: %@>", v4, self, self->_label, self->_url, self->_launchActionURL, self->_userInfo];

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUserInfo:(id)a3
{
}

- (NSURL)launchActionURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLaunchActionArguments:(id)a3
{
}

- (unint64_t)eventSource
{
  return self->_eventSource;
}

- (void)setEventSource:(unint64_t)a3
{
  self->_eventSource = a3;
}

- (unint64_t)sqlID
{
  return self->_sqlID;
}

@end