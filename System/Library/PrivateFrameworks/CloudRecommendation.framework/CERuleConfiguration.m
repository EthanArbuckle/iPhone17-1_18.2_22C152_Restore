@interface CERuleConfiguration
+ (BOOL)supportsSecureCoding;
- (CERecommendationInfo)recommendationInfo;
- (CERuleConfiguration)initWithCoder:(id)a3;
- (CERuleConfiguration)initWithDictionary:(id)a3;
- (NSArray)ruleset;
- (NSDictionary)thresholds;
- (NSNumber)maxRecommendationsToShow;
- (NSURL)actionURL;
- (NSURL)completedURL;
- (NSURL)dismissURL;
- (NSURL)displayURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)thresholdForKey:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActionURL:(id)a3;
- (void)setCompletedURL:(id)a3;
- (void)setDismissURL:(id)a3;
- (void)setDisplayURL:(id)a3;
- (void)setMaxRecommendationsToShow:(id)a3;
- (void)setRecommendationInfo:(id)a3;
- (void)setThresholds:(id)a3;
@end

@implementation CERuleConfiguration

- (CERuleConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)CERuleConfiguration;
  v5 = [(CERuleConfiguration *)&v40 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 objectForKeyedSubscript:@"displayUrl"];
    objc_opt_class();
    v36 = (void *)v7;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [NSURL URLWithString:v7];
      p_super = &v6->_displayURL->super;
      v6->_displayURL = (NSURL *)v8;
    }
    else
    {
      p_super = _CELogSystem();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
        -[CERuleConfiguration initWithDictionary:].cold.8();
      }
    }

    uint64_t v10 = [v4 objectForKeyedSubscript:@"dismissUrl"];
    objc_opt_class();
    v35 = (void *)v10;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = objc_msgSend(NSURL, "URLWithString:", v10, v10, v36);
      v12 = &v6->_dismissURL->super;
      v6->_dismissURL = (NSURL *)v11;
    }
    else
    {
      v12 = _CELogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[CERuleConfiguration initWithDictionary:].cold.7();
      }
    }

    v13 = [v4 objectForKeyedSubscript:@"actionUrl"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = [NSURL URLWithString:v13];
      v15 = &v6->_actionURL->super;
      v6->_actionURL = (NSURL *)v14;
    }
    else
    {
      v15 = _CELogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CERuleConfiguration initWithDictionary:].cold.6((uint64_t)v6, v15);
      }
    }

    v16 = [v4 objectForKeyedSubscript:@"completedUrl"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v17 = [NSURL URLWithString:v16];
      v18 = &v6->_completedURL->super;
      v6->_completedURL = (NSURL *)v17;
    }
    else
    {
      v18 = _CELogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[CERuleConfiguration initWithDictionary:].cold.5();
      }
    }

    v19 = [v4 objectForKeyedSubscript:@"maxTipsShown"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v19;
      v21 = &v6->_maxRecommendationsToShow->super.super;
      v6->_maxRecommendationsToShow = v20;
    }
    else
    {
      v21 = _CELogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[CERuleset initWithDictionary:].cold.4();
      }
    }

    v22 = [v4 objectForKeyedSubscript:@"thresholds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = v22;
      v24 = &v6->_thresholds->super;
      v6->_thresholds = v23;
    }
    else
    {
      v24 = _CELogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[CERuleConfiguration initWithDictionary:]();
      }
    }

    v25 = [v4 objectForKeyedSubscript:@"recommendationsInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = [[CERecommendationInfo alloc] initWithDictionary:v25];
      v27 = &v6->_recommendationInfo->super;
      v6->_recommendationInfo = v26;
    }
    else
    {
      v27 = _CELogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[CERuleConfiguration initWithDictionary:]();
      }
    }

    v28 = [v4 objectForKeyedSubscript:@"ruleset"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __42__CERuleConfiguration_initWithDictionary___block_invoke;
      v37[3] = &unk_265284840;
      v30 = v6;
      v38 = v30;
      id v39 = v29;
      v31 = v29;
      [v28 enumerateObjectsUsingBlock:v37];
      uint64_t v32 = [v31 copy];
      ruleset = v30->_ruleset;
      v30->_ruleset = (NSArray *)v32;
    }
    else
    {
      v31 = _CELogSystem();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[CERuleConfiguration initWithDictionary:]();
      }
    }
  }
  return v6;
}

void __42__CERuleConfiguration_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = [[CERuleset alloc] initWithDictionary:v4];

    [*(id *)(a1 + 40) addObject:v5];
  }
  else
  {
    _CELogSystem();
    v5 = (CERuleset *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEBUG)) {
      __42__CERuleConfiguration_initWithDictionary___block_invoke_cold_1();
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CERuleConfiguration *)self displayURL];
  [v4 encodeObject:v5 forKey:@"displayURL"];

  v6 = [(CERuleConfiguration *)self dismissURL];
  [v4 encodeObject:v6 forKey:@"dismissURL"];

  uint64_t v7 = [(CERuleConfiguration *)self completedURL];
  [v4 encodeObject:v7 forKey:@"completedURL"];

  uint64_t v8 = [(CERuleConfiguration *)self actionURL];
  [v4 encodeObject:v8 forKey:@"actionURL"];

  v9 = [(CERuleConfiguration *)self maxRecommendationsToShow];
  [v4 encodeObject:v9 forKey:@"maxRecommendationsToShow"];

  uint64_t v10 = [(CERuleConfiguration *)self thresholds];
  [v4 encodeObject:v10 forKey:@"thresholds"];

  uint64_t v11 = [(CERuleConfiguration *)self ruleset];
  [v4 encodeObject:v11 forKey:@"ruleset"];

  id v12 = [(CERuleConfiguration *)self recommendationInfo];
  [v4 encodeObject:v12 forKey:@"recommendationsInfo"];
}

- (CERuleConfiguration)initWithCoder:(id)a3
{
  v32[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CERuleConfiguration;
  v5 = [(CERuleConfiguration *)&v30 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayURL"];
    displayURL = v6->_displayURL;
    v6->_displayURL = (NSURL *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dismissURL"];
    dismissURL = v6->_dismissURL;
    v6->_dismissURL = (NSURL *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"completedURL"];
    completedURL = v6->_completedURL;
    v6->_completedURL = (NSURL *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionURL"];
    actionURL = v6->_actionURL;
    v6->_actionURL = (NSURL *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxRecommendationsToShow"];
    maxRecommendationsToShow = v6->_maxRecommendationsToShow;
    v6->_maxRecommendationsToShow = (NSNumber *)v15;

    uint64_t v17 = (void *)MEMORY[0x263EFFA08];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    v32[2] = objc_opt_class();
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:3];
    v19 = [v17 setWithArray:v18];

    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"thresholds"];
    thresholds = v6->_thresholds;
    v6->_thresholds = (NSDictionary *)v20;

    v22 = (void *)MEMORY[0x263EFFA08];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
    v24 = [v22 setWithArray:v23];

    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"ruleset"];
    ruleset = v6->_ruleset;
    v6->_ruleset = (NSArray *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recommendationsInfo"];
    recommendationInfo = v6->_recommendationInfo;
    v6->_recommendationInfo = (CERecommendationInfo *)v27;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[CERuleConfiguration allocWithZone:](CERuleConfiguration, "allocWithZone:") init];
  v5->_lock._os_unfair_lock_opaque = 0;
  v6 = [(CERuleConfiguration *)self displayURL];
  [(CERuleConfiguration *)v5 setDisplayURL:v6];

  uint64_t v7 = [(CERuleConfiguration *)self dismissURL];
  [(CERuleConfiguration *)v5 setDismissURL:v7];

  uint64_t v8 = [(CERuleConfiguration *)self completedURL];
  [(CERuleConfiguration *)v5 setCompletedURL:v8];

  uint64_t v9 = [(CERuleConfiguration *)self actionURL];
  [(CERuleConfiguration *)v5 setActionURL:v9];

  uint64_t v10 = [(CERuleConfiguration *)self maxRecommendationsToShow];
  [(CERuleConfiguration *)v5 setMaxRecommendationsToShow:v10];

  uint64_t v11 = [(CERuleConfiguration *)self recommendationInfo];
  [(CERuleConfiguration *)v5 setRecommendationInfo:v11];

  os_unfair_lock_lock(&v5->_lock);
  uint64_t v12 = [(CERuleConfiguration *)self thresholds];
  thresholds = v5->_thresholds;
  v5->_thresholds = (NSDictionary *)v12;

  uint64_t v14 = [(CERuleConfiguration *)self ruleset];
  uint64_t v15 = [v14 copyWithZone:a3];
  ruleset = v5->_ruleset;
  v5->_ruleset = (NSArray *)v15;

  os_unfair_lock_unlock(&v5->_lock);
  return v5;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(CERuleConfiguration *)self displayURL];
  v5 = [(CERuleConfiguration *)self dismissURL];
  v6 = [(CERuleConfiguration *)self completedURL];
  uint64_t v7 = [(CERuleConfiguration *)self actionURL];
  uint64_t v8 = [(CERuleConfiguration *)self maxRecommendationsToShow];
  uint64_t v9 = [(CERuleConfiguration *)self thresholds];
  uint64_t v10 = [(CERuleConfiguration *)self ruleset];
  uint64_t v11 = [(CERuleConfiguration *)self recommendationInfo];
  uint64_t v12 = [v3 stringWithFormat:@"Rule configuration with displayURL: %@, dismissURL: %@, completedURL: %@, actionURL: %@, maxRecommendations: %@, thresholds: %@, ruleset: %@, recommendationInfo: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (NSURL)displayURL
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_displayURL;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSURL)dismissURL
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_dismissURL;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSURL)completedURL
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_completedURL;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSURL)actionURL
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_actionURL;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)maxRecommendationsToShow
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_maxRecommendationsToShow;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSDictionary)thresholds
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_thresholds;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)ruleset
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSArray *)self->_ruleset copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)thresholdForKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = [(NSDictionary *)self->_thresholds valueForKey:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (CERecommendationInfo)recommendationInfo
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_recommendationInfo;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDisplayURL:(id)a3
{
  id v4 = (NSURL *)a3;
  os_unfair_lock_lock(&self->_lock);
  displayURL = self->_displayURL;
  self->_displayURL = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setDismissURL:(id)a3
{
  id v4 = (NSURL *)a3;
  os_unfair_lock_lock(&self->_lock);
  dismissURL = self->_dismissURL;
  self->_dismissURL = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setCompletedURL:(id)a3
{
  id v4 = (NSURL *)a3;
  os_unfair_lock_lock(&self->_lock);
  completedURL = self->_completedURL;
  self->_completedURL = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setActionURL:(id)a3
{
  id v4 = (NSURL *)a3;
  os_unfair_lock_lock(&self->_lock);
  actionURL = self->_actionURL;
  self->_actionURL = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setMaxRecommendationsToShow:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  maxRecommendationsToShow = self->_maxRecommendationsToShow;
  self->_maxRecommendationsToShow = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setRecommendationInfo:(id)a3
{
  id v4 = (CERecommendationInfo *)a3;
  os_unfair_lock_lock(&self->_lock);
  recommendationInfo = self->_recommendationInfo;
  self->_recommendationInfo = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setThresholds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendationInfo, 0);
  objc_storeStrong((id *)&self->_ruleset, 0);
  objc_storeStrong((id *)&self->_thresholds, 0);
  objc_storeStrong((id *)&self->_maxRecommendationsToShow, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_completedURL, 0);
  objc_storeStrong((id *)&self->_dismissURL, 0);
  objc_storeStrong((id *)&self->_displayURL, 0);
}

- (void)initWithDictionary:.cold.1()
{
  id v0 = (id)objc_opt_class();
  v1 = objc_opt_class();
  id v2 = OUTLINED_FUNCTION_0_1(v1);
  OUTLINED_FUNCTION_1_1(&dword_24A2CB000, v3, v4, "%@ Expected ruleset to be of type array but found: %@", v5, v6, v7, v8, v9);
}

- (void)initWithDictionary:.cold.2()
{
  id v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse recommendationInfo from rules response", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.3()
{
  id v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse thresholds from dictionary", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.5()
{
  id v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse completedURL from dictionary", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:(uint64_t)a1 .cold.6(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_1(v3);
  _os_log_error_impl(&dword_24A2CB000, a2, OS_LOG_TYPE_ERROR, "%@ Unable to parse actionURL from dictionary", v5, 0xCu);
}

- (void)initWithDictionary:.cold.7()
{
  id v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse dismissURL from dictionary", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.8()
{
  id v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse displayURL from dictionary", v4, v5, v6, v7, v8);
}

void __42__CERuleConfiguration_initWithDictionary___block_invoke_cold_1()
{
  id v0 = (id)objc_opt_class();
  id v1 = objc_opt_class();
  id v2 = OUTLINED_FUNCTION_0_1(v1);
  OUTLINED_FUNCTION_1_1(&dword_24A2CB000, v3, v4, "%@ Expected rule to be of type dictionary but found: %@", v5, v6, v7, v8, v9);
}

@end