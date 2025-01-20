@interface CERecommendationPage
+ (BOOL)supportsSecureCoding;
- (CEImageIcon)icon;
- (CERecommendationPage)initWithCoder:(id)a3;
- (CERecommendationPage)initWithDictionary:(id)a3;
- (NSString)subTitle;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIcon:(id)a3;
- (void)setSubTitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CERecommendationPage

- (CERecommendationPage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CERecommendationPage;
  v5 = [(CERecommendationPage *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"pageTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      title = v5->_title;
      v5->_title = v7;
    }
    else
    {
      title = _CELogSystem();
      if (os_log_type_enabled(title, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendationPage initWithDictionary:]();
      }
    }

    v9 = [v4 objectForKeyedSubscript:@"pageSubtitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = v9;
      subTitle = v5->_subTitle;
      v5->_subTitle = v10;
    }
    else
    {
      subTitle = _CELogSystem();
      if (os_log_type_enabled(subTitle, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendationPage initWithDictionary:]();
      }
    }

    v12 = [v4 objectForKeyedSubscript:@"icon"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[CEImageIcon alloc] initWithDictionary:v12];
      p_super = &v5->_icon->super.super;
      v5->_icon = v13;
    }
    else
    {
      p_super = _CELogSystem();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendationPage initWithDictionary:]();
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
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_subTitle forKey:@"subtitle"];
  [v5 encodeObject:self->_icon forKey:@"icon"];
}

- (CERecommendationPage)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CERecommendationPage;
  id v5 = [(CERecommendationPage *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subTitle = v5->_subTitle;
    v5->_subTitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
    icon = v5->_icon;
    v5->_icon = (CEImageIcon *)v10;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[CERecommendationPage allocWithZone:a3] init];
  [(CERecommendationPage *)v4 setTitle:self->_title];
  [(CERecommendationPage *)v4 setSubTitle:self->_subTitle];
  [(CERecommendationPage *)v4 setIcon:self->_icon];
  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Page with title: %@, subtitle: %@, icon: %@", self->_title, self->_subTitle, self->_icon];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (void)setSubTitle:(id)a3
{
}

- (CEImageIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithDictionary:.cold.1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v1, v2, "%@ Unable to parse icon from dictionary", v3, v4, v5, v6, 2u);
}

- (void)initWithDictionary:.cold.2()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v1, v2, "%@ Unable to parse subtitle from dictionary", v3, v4, v5, v6, 2u);
}

- (void)initWithDictionary:.cold.3()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v1, v2, "%@ Unable to parse title from dictionary", v3, v4, v5, v6, 2u);
}

@end