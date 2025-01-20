@interface AMSUserNotificationAction
- (AMSMetricsEvent)metricsEvent;
- (AMSUserNotificationAction)init;
- (AMSUserNotificationAction)initWithTitle:(id)a3;
- (AMSUserNotificationAction)initWithTitle:(id)a3 style:(int64_t)a4;
- (AMSUserNotificationAction)initWithUserInfoAction:(id)a3;
- (NSDictionary)userInfo;
- (NSString)clientIdentifier;
- (NSString)identifier;
- (NSString)systemImageName;
- (NSString)title;
- (NSURL)defaultURL;
- (NSURL)mediaApiRequestURL;
- (NSURLRequest)request;
- (id)generateUserInfoAction;
- (int64_t)style;
- (unint64_t)un_ActionOptions;
- (void)setClientIdentifier:(id)a3;
- (void)setDefaultURL:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMediaApiRequestURL:(id)a3;
- (void)setMetricsEvent:(id)a3;
- (void)setRequest:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSystemImageName:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation AMSUserNotificationAction

- (AMSUserNotificationAction)init
{
  return [(AMSUserNotificationAction *)self initWithTitle:0 style:0];
}

- (AMSUserNotificationAction)initWithTitle:(id)a3
{
  return [(AMSUserNotificationAction *)self initWithTitle:a3 style:0];
}

- (AMSUserNotificationAction)initWithTitle:(id)a3 style:(int64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AMSUserNotificationAction;
  v8 = [(AMSUserNotificationAction *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_title, a3);
    v9->_style = a4;
    v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v10 UUIDString];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v11;
  }
  return v9;
}

- (AMSUserNotificationAction)initWithUserInfoAction:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)AMSUserNotificationAction;
  v5 = [(AMSUserNotificationAction *)&v33 init];
  if (v5)
  {
    v6 = (NSDictionary *)[v4 mutableCopy];
    uint64_t v7 = [(NSDictionary *)v6 objectForKeyedSubscript:@"_AMSIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    uint64_t v9 = [(NSDictionary *)v6 objectForKeyedSubscript:@"_AMSTitle"];
    title = v5->_title;
    v5->_title = (NSString *)v9;

    uint64_t v11 = [(NSDictionary *)v6 objectForKeyedSubscript:@"_AMSStyle"];
    v5->_style = [v11 integerValue];

    v12 = [(NSDictionary *)v6 objectForKeyedSubscript:@"_AMSDefaultURL"];
    if (v12)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
      defaultURL = v5->_defaultURL;
      v5->_defaultURL = (NSURL *)v13;
    }
    v15 = [(NSDictionary *)v6 objectForKeyedSubscript:@"_AMSMetrics"];
    if (v15)
    {
      v16 = [[AMSMetricsEvent alloc] initWithUnderlyingDictionary:v15];
      [(AMSUserNotificationAction *)v5 setMetricsEvent:v16];
    }
    uint64_t v17 = [(NSDictionary *)v6 objectForKeyedSubscript:@"_AMSRequestURL"];
    v18 = (void *)v17;
    v19 = &stru_1EDCA7308;
    if (v17) {
      v19 = (__CFString *)v17;
    }
    v20 = v19;

    v21 = [MEMORY[0x1E4F1CB10] URLWithString:v20];

    if (v21)
    {
      id v32 = v4;
      v22 = [(NSDictionary *)v6 objectForKeyedSubscript:@"_AMSRequestMethod"];
      v23 = [(NSDictionary *)v6 objectForKeyedSubscript:@"_AMSRequestHeaders"];
      v24 = [(NSDictionary *)v6 objectForKeyedSubscript:@"_AMSRequestBody"];
      v25 = v24;
      if (v24)
      {
        v26 = [v24 dataUsingEncoding:4];
      }
      else
      {
        v26 = 0;
      }
      v27 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v21];
      [v27 setHTTPMethod:v22];
      [v27 setAllHTTPHeaderFields:v23];
      [v27 setHTTPBody:v26];
      uint64_t v28 = [v27 copy];
      request = v5->_request;
      v5->_request = (NSURLRequest *)v28;

      id v4 = v32;
    }
    [(NSDictionary *)v6 removeObjectForKey:@"_AMSDefaultURL"];
    [(NSDictionary *)v6 removeObjectForKey:@"_AMSIdentifier"];
    [(NSDictionary *)v6 removeObjectForKey:@"_AMSMetrics"];
    [(NSDictionary *)v6 removeObjectForKey:@"_AMSRequestBody"];
    [(NSDictionary *)v6 removeObjectForKey:@"_AMSRequestHeaders"];
    [(NSDictionary *)v6 removeObjectForKey:@"_AMSRequestMethod"];
    [(NSDictionary *)v6 removeObjectForKey:@"_AMSRequestURL"];
    [(NSDictionary *)v6 removeObjectForKey:@"_AMSStyle"];
    [(NSDictionary *)v6 removeObjectForKey:@"_AMSTitle"];
    userInfo = v5->_userInfo;
    v5->_userInfo = v6;
  }
  return v5;
}

- (id)generateUserInfoAction
{
  v3 = [(AMSUserNotificationAction *)self userInfo];
  id v4 = (void *)[v3 mutableCopy];
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v7 = v6;

  v8 = [(AMSUserNotificationAction *)self identifier];

  if (v8)
  {
    uint64_t v9 = [(AMSUserNotificationAction *)self identifier];
    [v7 setObject:v9 forKeyedSubscript:@"_AMSIdentifier"];
  }
  v10 = [(AMSUserNotificationAction *)self title];

  if (v10)
  {
    uint64_t v11 = [(AMSUserNotificationAction *)self title];
    [v7 setObject:v11 forKeyedSubscript:@"_AMSTitle"];
  }
  v12 = [(AMSUserNotificationAction *)self defaultURL];

  if (v12)
  {
    uint64_t v13 = [(AMSUserNotificationAction *)self defaultURL];
    objc_super v14 = [v13 absoluteString];
    [v7 setObject:v14 forKeyedSubscript:@"_AMSDefaultURL"];
  }
  v15 = [(AMSUserNotificationAction *)self metricsEvent];

  if (v15)
  {
    v16 = [(AMSUserNotificationAction *)self metricsEvent];
    uint64_t v17 = [v16 underlyingDictionary];
    [v7 setObject:v17 forKeyedSubscript:@"_AMSMetrics"];
  }
  v18 = [(AMSUserNotificationAction *)self request];

  if (v18)
  {
    v19 = [(AMSUserNotificationAction *)self request];
    v20 = [v19 URL];
    v21 = [v20 absoluteString];
    [v7 setObject:v21 forKeyedSubscript:@"_AMSRequestURL"];

    v22 = [(AMSUserNotificationAction *)self request];
    v23 = [v22 HTTPMethod];
    v24 = v23;
    v25 = v23 ? v23 : @"GET";
    [v7 setObject:v25 forKeyedSubscript:@"_AMSRequestMethod"];

    v26 = [(AMSUserNotificationAction *)self request];
    uint64_t v27 = [v26 allHTTPHeaderFields];
    uint64_t v28 = (void *)v27;
    uint64_t v29 = v27 ? v27 : MEMORY[0x1E4F1CC08];
    [v7 setObject:v29 forKeyedSubscript:@"_AMSRequestHeaders"];

    v30 = [(AMSUserNotificationAction *)self request];
    v31 = [v30 HTTPBody];

    if (v31)
    {
      id v32 = [NSString alloc];
      objc_super v33 = [(AMSUserNotificationAction *)self request];
      v34 = [v33 HTTPBody];
      v35 = (void *)[v32 initWithData:v34 encoding:4];
      [v7 setObject:v35 forKeyedSubscript:@"_AMSRequestBody"];
    }
  }
  v36 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AMSUserNotificationAction style](self, "style"));
  [v7 setObject:v36 forKeyedSubscript:@"_AMSStyle"];

  return v7;
}

- (unint64_t)un_ActionOptions
{
  BOOL v3 = [(AMSUserNotificationAction *)self style] == 2;
  return ([(AMSUserNotificationAction *)self style] == 3) | (unint64_t)(2 * v3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSURL)defaultURL
{
  return self->_defaultURL;
}

- (void)setDefaultURL:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSURL)mediaApiRequestURL
{
  return self->_mediaApiRequestURL;
}

- (void)setMediaApiRequestURL:(id)a3
{
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setSystemImageName:(id)a3
{
}

- (AMSMetricsEvent)metricsEvent
{
  return self->_metricsEvent;
}

- (void)setMetricsEvent:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_metricsEvent, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_mediaApiRequestURL, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_defaultURL, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end