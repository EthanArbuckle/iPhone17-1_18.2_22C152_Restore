@interface CEURLRecommendationAction
+ (BOOL)supportsSecureCoding;
- (CEURLRecommendationAction)initWithCoder:(id)a3;
- (CEURLRecommendationAction)initWithDictionary:(id)a3;
- (CEURLRecommendationAction)initWithIdentifier:(id)a3 actionType:(id)a4 title:(id)a5 actionURL:(id)a6;
- (NSURL)actionURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActionURL:(id)a3;
@end

@implementation CEURLRecommendationAction

- (CEURLRecommendationAction)initWithIdentifier:(id)a3 actionType:(id)a4 title:(id)a5 actionURL:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CEURLRecommendationAction;
  v12 = [(CERecommendationAction *)&v15 initWithIdentifier:a3 actionTitle:a5 actionType:a4];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_actionURL, a6);
  }

  return v13;
}

- (CEURLRecommendationAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CEURLRecommendationAction;
  v5 = [(CERecommendationAction *)&v10 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"actionUrl"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [NSURL URLWithString:v6];
      p_super = &v5->_actionURL->super;
      v5->_actionURL = (NSURL *)v7;
    }
    else
    {
      p_super = _CELogSystem();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
        -[CEURLRecommendationAction initWithDictionary:]();
      }
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CEURLRecommendationAction;
  id v4 = a3;
  [(CERecommendationAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_actionURL, @"actionURL", v5.receiver, v5.super_class);
}

- (CEURLRecommendationAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CEURLRecommendationAction;
  objc_super v5 = [(CERecommendationAction *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionURL"];
    actionURL = v5->_actionURL;
    v5->_actionURL = (NSURL *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CEURLRecommendationAction;
  id v4 = [(CERecommendationAction *)&v6 copyWithZone:a3];
  [v4 setActionURL:self->_actionURL];
  return v4;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CEURLRecommendationAction;
  v3 = [(CERecommendationAction *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" actionURL: %@", self->_actionURL];

  return v4;
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithDictionary:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse url from dictionary.", v4, v5, v6, v7, v8);
}

@end