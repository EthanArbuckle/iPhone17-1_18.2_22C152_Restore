@interface CERecommendationAction
+ (BOOL)supportsSecureCoding;
- (CERecommendationAction)initWithCoder:(id)a3;
- (CERecommendationAction)initWithDictionary:(id)a3;
- (CERecommendationAction)initWithIdentifier:(id)a3 actionTitle:(id)a4 actionType:(id)a5;
- (NSString)actionIdentifier;
- (NSString)actionTitle;
- (NSString)actionType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActionIdentifier:(id)a3;
- (void)setActionTitle:(id)a3;
- (void)setActionType:(id)a3;
@end

@implementation CERecommendationAction

- (CERecommendationAction)initWithIdentifier:(id)a3 actionTitle:(id)a4 actionType:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CERecommendationAction;
  v12 = [(CERecommendationAction *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_actionIdentifier, a3);
    objc_storeStrong((id *)&v13->_actionTitle, a4);
    objc_storeStrong((id *)&v13->_actionType, a5);
  }

  return v13;
}

- (CERecommendationAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CERecommendationAction;
  v5 = [(CERecommendationAction *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      actionIdentifier = v5->_actionIdentifier;
      v5->_actionIdentifier = v7;
    }
    else
    {
      actionIdentifier = _CELogSystem();
      if (os_log_type_enabled(actionIdentifier, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendationAction initWithDictionary:]();
      }
    }

    id v9 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      actionTitle = v5->_actionTitle;
      v5->_actionTitle = v10;
    }
    else
    {
      actionTitle = _CELogSystem();
      if (os_log_type_enabled(actionTitle, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendationAction initWithDictionary:]();
      }
    }

    v12 = [v4 objectForKeyedSubscript:@"actionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = v12;
      actionType = v5->_actionType;
      v5->_actionType = v13;
    }
    else
    {
      actionType = _CELogSystem();
      if (os_log_type_enabled(actionType, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendationAction initWithDictionary:]();
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
  actionIdentifier = self->_actionIdentifier;
  id v5 = a3;
  [v5 encodeObject:actionIdentifier forKey:@"actionIdentifier"];
  [v5 encodeObject:self->_actionTitle forKey:@"actionTitle"];
  [v5 encodeObject:self->_actionType forKey:@"actionType"];
}

- (CERecommendationAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CERecommendationAction;
  id v5 = [(CERecommendationAction *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionIdentifier"];
    actionIdentifier = v5->_actionIdentifier;
    v5->_actionIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionTitle"];
    actionTitle = v5->_actionTitle;
    v5->_actionTitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionType"];
    actionType = v5->_actionType;
    v5->_actionType = (NSString *)v10;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[CERecommendationAction allocWithZone:a3] init];
  [(CERecommendationAction *)v4 setActionIdentifier:self->_actionIdentifier];
  [(CERecommendationAction *)v4 setActionTitle:self->_actionTitle];
  [(CERecommendationAction *)v4 setActionType:self->_actionType];
  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Action with id: %@, title: %@, actionType: %@", self->_actionIdentifier, self->_actionTitle, self->_actionType];
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setActionTitle:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
}

- (NSString)actionType
{
  return self->_actionType;
}

- (void)setActionType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
}

- (void)initWithDictionary:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse actionType from dictionary", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.2()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse actionTitle from dictionary", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.3()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse actionIdentifier from dictionary", v4, v5, v6, v7, v8);
}

@end