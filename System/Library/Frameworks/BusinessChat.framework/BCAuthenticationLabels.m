@interface BCAuthenticationLabels
+ (BOOL)supportsSecureCoding;
- (BCAuthenticationLabels)initWithCoder:(id)a3;
- (BCAuthenticationLabels)initWithDictionary:(id)a3;
- (BCAuthenticationLabels)initWithTitle:(id)a3 subtitle:(id)a4 action:(id)a5;
- (NSDictionary)dictionaryValue;
- (NSString)action;
- (NSString)subtitle;
- (NSString)title;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BCAuthenticationLabels

- (BCAuthenticationLabels)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BCAuthenticationLabels;
  v5 = [(BCAuthenticationLabels *)&v22 init];
  if (v5)
  {
    v6 = LogCategory_Daemon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v4;
      _os_log_impl(&dword_228C26000, v6, OS_LOG_TYPE_DEFAULT, "BCAuthenticationLabels: initWithDictionary %@", buf, 0xCu);
    }

    v7 = [v4 objectForKeyedSubscript:@"title"];
    v8 = [MEMORY[0x263EFF9D0] null];
    if (v7 == v8)
    {
      v9 = 0;
    }
    else
    {
      v9 = [v4 objectForKeyedSubscript:@"title"];
    }

    v10 = [v4 objectForKeyedSubscript:@"subtitle"];
    v11 = [MEMORY[0x263EFF9D0] null];
    if (v10 == v11)
    {
      v12 = 0;
    }
    else
    {
      v12 = [v4 objectForKeyedSubscript:@"subtitle"];
    }

    v13 = [v4 objectForKeyedSubscript:@"action"];
    v14 = [MEMORY[0x263EFF9D0] null];
    if (v13 == v14)
    {
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v15 = [v4 objectForKeyedSubscript:@"action"];
    }

    title = v5->_title;
    v5->_title = v9;
    v17 = v9;

    subtitle = v5->_subtitle;
    v5->_subtitle = v12;
    v19 = v12;

    action = v5->_action;
    v5->_action = (NSString *)v15;
  }
  return v5;
}

- (BCAuthenticationLabels)initWithTitle:(id)a3 subtitle:(id)a4 action:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BCAuthenticationLabels;
  v12 = [(BCAuthenticationLabels *)&v15 init];
  if (v12)
  {
    v13 = LogCategory_Daemon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v10;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl(&dword_228C26000, v13, OS_LOG_TYPE_DEFAULT, "BCAuthenticationLabels: initWithTitle: %@, subtitle: %@, action: %@", buf, 0x20u);
    }

    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v12->_subtitle, a4);
    objc_storeStrong((id *)&v12->_action, a5);
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_subtitle forKey:@"subtitle"];
  [v5 encodeObject:self->_action forKey:@"action"];
}

- (BCAuthenticationLabels)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BCAuthenticationLabels;
  id v5 = [(BCAuthenticationLabels *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    action = v5->_action;
    v5->_action = (NSString *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)dictionaryValue
{
  v3 = objc_opt_new();
  [v3 setObject:self->_title forKeyedSubscript:@"title"];
  [v3 setObject:self->_subtitle forKeyedSubscript:@"subtitle"];
  [v3 setObject:self->_action forKeyedSubscript:@"action"];
  id v4 = (void *)[v3 copy];

  return (NSDictionary *)v4;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end