@interface CERecommendationInfo
+ (BOOL)supportsSecureCoding;
- (CERecommendationInfo)initWithCoder:(id)a3;
- (CERecommendationInfo)initWithDictionary:(id)a3;
- (NSDictionary)subtitleTemplates;
- (NSString)recommendationSpecifierSubtitle;
- (NSString)recommendationSpecifierTitle;
- (NSURL)completedRecommendationsURL;
- (NSURL)serverRecommendationsURL;
- (NSURL)serverRulesURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCompletedRecommendationsURL:(id)a3;
- (void)setRecommendationSpecifierSubtitle:(id)a3;
- (void)setRecommendationSpecifierTitle:(id)a3;
- (void)setServerRecommendationsURL:(id)a3;
- (void)setServerRulesURL:(id)a3;
- (void)setSubtitleTemplates:(id)a3;
@end

@implementation CERecommendationInfo

- (CERecommendationInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CERecommendationInfo;
  v5 = [(CERecommendationInfo *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      recommendationSpecifierTitle = v5->_recommendationSpecifierTitle;
      v5->_recommendationSpecifierTitle = v7;
    }
    else
    {
      recommendationSpecifierTitle = _CELogSystem();
      if (os_log_type_enabled(recommendationSpecifierTitle, OS_LOG_TYPE_ERROR)) {
        -[CERecommendationInfo initWithDictionary:].cold.6();
      }
    }

    v9 = [v4 objectForKeyedSubscript:@"message"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = v9;
      recommendationSpecifierSubtitle = v5->_recommendationSpecifierSubtitle;
      v5->_recommendationSpecifierSubtitle = v10;
    }
    else
    {
      recommendationSpecifierSubtitle = _CELogSystem();
      if (os_log_type_enabled(recommendationSpecifierSubtitle, OS_LOG_TYPE_ERROR)) {
        -[CERecommendationInfo initWithDictionary:].cold.5();
      }
    }

    v12 = [v4 objectForKeyedSubscript:@"recommendationsUrl"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [NSURL URLWithString:v12];
      if (v13) {
        objc_storeStrong((id *)&v5->_serverRecommendationsURL, v13);
      }
    }
    else
    {
      v13 = _CELogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CERecommendationInfo initWithDictionary:].cold.4();
      }
    }

    v14 = [v4 objectForKeyedSubscript:@"recommendationRulesUrl"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [NSURL URLWithString:v14];
      if (v15) {
        objc_storeStrong((id *)&v5->_serverRulesURL, v15);
      }
    }
    else
    {
      v15 = _CELogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CERecommendationInfo initWithDictionary:]();
      }
    }

    v16 = [v4 objectForKeyedSubscript:@"completedRecommendationsUrl"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [NSURL URLWithString:v16];
      if (v17) {
        objc_storeStrong((id *)&v5->_completedRecommendationsURL, v17);
      }
    }
    else
    {
      v17 = _CELogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[CERecommendationInfo initWithDictionary:]();
      }
    }

    v18 = [v4 objectForKeyedSubscript:@"subtitleTemplates"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = v18;
      p_super = &v5->_subtitleTemplates->super;
      v5->_subtitleTemplates = v19;
    }
    else
    {
      p_super = _CELogSystem();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        -[CERecommendationInfo initWithDictionary:]();
      }
    }
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"title: %@, subtitle: %@, recommendationsURL: %@, rulesURL: %@, completedRecommendationsURL: %@, subtitleTemplates: %@", self->_recommendationSpecifierTitle, self->_recommendationSpecifierSubtitle, self->_serverRecommendationsURL, self->_serverRulesURL, self->_completedRecommendationsURL, self->_subtitleTemplates];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CERecommendationInfo);
  [(CERecommendationInfo *)v4 setRecommendationSpecifierTitle:self->_recommendationSpecifierTitle];
  [(CERecommendationInfo *)v4 setRecommendationSpecifierSubtitle:self->_recommendationSpecifierSubtitle];
  [(CERecommendationInfo *)v4 setServerRecommendationsURL:self->_serverRecommendationsURL];
  [(CERecommendationInfo *)v4 setServerRulesURL:self->_serverRulesURL];
  [(CERecommendationInfo *)v4 setCompletedRecommendationsURL:self->_completedRecommendationsURL];
  [(CERecommendationInfo *)v4 setSubtitleTemplates:self->_subtitleTemplates];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  recommendationSpecifierTitle = self->_recommendationSpecifierTitle;
  id v5 = a3;
  [v5 encodeObject:recommendationSpecifierTitle forKey:@"title"];
  [v5 encodeObject:self->_recommendationSpecifierSubtitle forKey:@"message"];
  [v5 encodeObject:self->_serverRecommendationsURL forKey:@"recommendationsUrl"];
  [v5 encodeObject:self->_serverRulesURL forKey:@"recommendationRulesUrl"];
  [v5 encodeObject:self->_completedRecommendationsURL forKey:@"completedRecommendationsUrl"];
  [v5 encodeObject:self->_subtitleTemplates forKey:@"subtitleTemplates"];
}

- (CERecommendationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CERecommendationInfo;
  id v5 = [(CERecommendationInfo *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    recommendationSpecifierTitle = v5->_recommendationSpecifierTitle;
    v5->_recommendationSpecifierTitle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    recommendationSpecifierSubtitle = v5->_recommendationSpecifierSubtitle;
    v5->_recommendationSpecifierSubtitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recommendationsUrl"];
    serverRecommendationsURL = v5->_serverRecommendationsURL;
    v5->_serverRecommendationsURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recommendationRulesUrl"];
    serverRulesURL = v5->_serverRulesURL;
    v5->_serverRulesURL = (NSURL *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"completedRecommendationsUrl"];
    completedRecommendationsURL = v5->_completedRecommendationsURL;
    v5->_completedRecommendationsURL = (NSURL *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v17 = [v4 decodeDictionaryWithKeysOfClass:v16 objectsOfClass:objc_opt_class() forKey:@"subtitleTemplates"];
    subtitleTemplates = v5->_subtitleTemplates;
    v5->_subtitleTemplates = (NSDictionary *)v17;
  }
  return v5;
}

- (NSString)recommendationSpecifierTitle
{
  return self->_recommendationSpecifierTitle;
}

- (void)setRecommendationSpecifierTitle:(id)a3
{
}

- (NSString)recommendationSpecifierSubtitle
{
  return self->_recommendationSpecifierSubtitle;
}

- (void)setRecommendationSpecifierSubtitle:(id)a3
{
}

- (NSURL)serverRecommendationsURL
{
  return self->_serverRecommendationsURL;
}

- (void)setServerRecommendationsURL:(id)a3
{
}

- (NSURL)serverRulesURL
{
  return self->_serverRulesURL;
}

- (void)setServerRulesURL:(id)a3
{
}

- (NSURL)completedRecommendationsURL
{
  return self->_completedRecommendationsURL;
}

- (void)setCompletedRecommendationsURL:(id)a3
{
}

- (NSDictionary)subtitleTemplates
{
  return self->_subtitleTemplates;
}

- (void)setSubtitleTemplates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleTemplates, 0);
  objc_storeStrong((id *)&self->_completedRecommendationsURL, 0);
  objc_storeStrong((id *)&self->_serverRulesURL, 0);
  objc_storeStrong((id *)&self->_serverRecommendationsURL, 0);
  objc_storeStrong((id *)&self->_recommendationSpecifierSubtitle, 0);
  objc_storeStrong((id *)&self->_recommendationSpecifierTitle, 0);
}

- (void)initWithDictionary:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_24A2CB000, v0, v1, "Could not find subtitleTemplates in dictionary.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_24A2CB000, v0, v1, "Could not find completedRecommendationsUrl from dictionary.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_24A2CB000, v0, v1, "Could not find recommendationRulesUrl from dictionary.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_24A2CB000, v0, v1, "Could not find recommendationsUrl from dictionary.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_24A2CB000, v0, v1, "Could not find recommendationSpecifierSubtitle from dictionary.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_24A2CB000, v0, v1, "Could not find recommendationSpecifierTitle from dictionary.", v2, v3, v4, v5, v6);
}

@end