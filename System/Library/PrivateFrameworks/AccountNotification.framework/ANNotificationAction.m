@interface ANNotificationAction
+ (BOOL)supportsSecureCoding;
+ (id)actionForLaunchingApp:(id)a3;
+ (id)actionForLaunchingApp:(id)a3 withOptions:(id)a4;
+ (id)actionForOpeningWebURL:(id)a3;
- (ANNotificationAction)initWithCoder:(id)a3;
- (ANNotificationAction)initWithDictionaryRepresentation:(id)a3;
- (ANNotificationAction)initWithManagedObject:(id)a3;
- (BOOL)isInternalURL;
- (NSDictionary)options;
- (NSURL)url;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)perform;
- (void)setIsInternalURL:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation ANNotificationAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)actionForOpeningWebURL:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ANNotificationAction);
  [(ANNotificationAction *)v4 setUrl:v3];

  [(ANNotificationAction *)v4 setIsInternalURL:0];
  return v4;
}

+ (id)actionForLaunchingApp:(id)a3 withOptions:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(ANNotificationAction);
  [(ANNotificationAction *)v7 setUrl:v6];

  [(ANNotificationAction *)v7 setIsInternalURL:1];
  [(ANNotificationAction *)v7 setOptions:v5];

  return v7;
}

+ (id)actionForLaunchingApp:(id)a3
{
  return +[ANNotificationAction actionForLaunchingApp:a3 withOptions:0];
}

- (ANNotificationAction)initWithManagedObject:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ANNotificationAction;
  id v5 = [(ANNotificationAction *)&v15 init];
  if (v5)
  {
    id v6 = NSURL;
    v7 = [v4 url];
    uint64_t v8 = [v6 URLWithString:v7];
    url = v5->_url;
    v5->_url = (NSURL *)v8;

    v10 = [v4 isInternal];
    v5->_isInternalURL = [v10 BOOLValue];

    uint64_t v11 = [v4 options];
    options = v5->_options;
    v5->_options = (NSDictionary *)v11;
  }
  v13 = v5;

  return v13;
}

- (ANNotificationAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ANNotificationAction;
  id v5 = [(ANNotificationAction *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_url"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_isInternalURL"];
    v5->_isInternalURL = [v8 BOOLValue];

    v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"_options"];
    options = v5->_options;
    v5->_options = (NSDictionary *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  url = self->_url;
  id v6 = a3;
  [v6 encodeObject:url forKey:@"_url"];
  id v5 = [NSNumber numberWithBool:self->_isInternalURL];
  [v6 encodeObject:v5 forKey:@"_isInternalURL"];

  [v6 encodeObject:self->_options forKey:@"_options"];
}

- (ANNotificationAction)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ANNotificationAction;
  id v5 = [(ANNotificationAction *)&v13 init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"_url"];
    if (v6)
    {
      uint64_t v7 = [NSURL URLWithString:v6];
      url = v5->_url;
      v5->_url = (NSURL *)v7;
    }
    v9 = [v4 objectForKeyedSubscript:@"_isInternalURL"];
    v5->_isInternalURL = [v9 BOOLValue];

    uint64_t v10 = [v4 objectForKeyedSubscript:@"_options"];
    options = v5->_options;
    v5->_options = (NSDictionary *)v10;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  url = self->_url;
  if (url)
  {
    id v5 = [(NSURL *)url absoluteString];
    [v3 setObject:v5 forKeyedSubscript:@"_url"];
  }
  options = self->_options;
  if (options) {
    [v3 setObject:options forKeyedSubscript:@"_options"];
  }
  uint64_t v7 = [NSNumber numberWithBool:self->_isInternalURL];
  [v3 setObject:v7 forKeyedSubscript:@"_isInternalURL"];

  uint64_t v8 = (void *)[v3 copy];
  return v8;
}

- (void)perform
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = _ANLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    url = self->_url;
    int v9 = 136315650;
    uint64_t v10 = "-[ANNotificationAction perform]";
    __int16 v11 = 1024;
    int v12 = 276;
    __int16 v13 = 2112;
    v14 = url;
    _os_log_impl(&dword_221622000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Launching URL: %@\"", (uint8_t *)&v9, 0x1Cu);
  }

  BOOL isInternalURL = self->_isInternalURL;
  id v6 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v7 = v6;
  uint64_t v8 = self->_url;
  if (isInternalURL) {
    [v6 openSensitiveURL:v8 withOptions:self->_options];
  }
  else {
    [v6 openURL:v8];
  }
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (BOOL)isInternalURL
{
  return self->_isInternalURL;
}

- (void)setIsInternalURL:(BOOL)a3
{
  self->_BOOL isInternalURL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initWithManagedObject:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  int v2 = 217;
  _os_log_error_impl(&dword_221622000, v0, OS_LOG_TYPE_ERROR, "%s (%d) \"NSObjectInaccessibleException caught inside -[ANNotificationAction initWithManagedObject:]\"", v1, 0x12u);
}

@end