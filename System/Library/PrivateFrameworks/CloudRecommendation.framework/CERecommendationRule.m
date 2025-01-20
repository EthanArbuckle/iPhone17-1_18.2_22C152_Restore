@interface CERecommendationRule
+ (BOOL)supportsSecureCoding;
- (BOOL)ignoreClientRank;
- (CERecommendationRule)initWithCoder:(id)a3;
- (CERecommendationRule)initWithDictionary:(id)a3;
- (CERecommendationStringTemplate)templates;
- (CERuleCriteria)criteria;
- (NSArray)context;
- (NSNumber)lastCompletedTimeStamp;
- (NSNumber)rankingHint;
- (NSString)bundleID;
- (NSString)messageHint;
- (NSString)recommendationID;
- (NSString)titleHint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setContext:(id)a3;
- (void)setCriteria:(id)a3;
- (void)setIgnoreClientRank:(BOOL)a3;
- (void)setLastCompletedTimeStamp:(id)a3;
- (void)setMessageHint:(id)a3;
- (void)setRankingHint:(id)a3;
- (void)setRecommendationID:(id)a3;
- (void)setTemplates:(id)a3;
- (void)setTitleHint:(id)a3;
@end

@implementation CERecommendationRule

- (CERecommendationRule)initWithDictionary:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)CERecommendationRule;
  v5 = [(CERecommendationRule *)&v53 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = [v4 objectForKeyedSubscript:@"recommendationID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = v7;
      recommendationID = v6->_recommendationID;
      v6->_recommendationID = v8;
    }
    else
    {
      recommendationID = _CELogSystem();
      if (os_log_type_enabled(recommendationID, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendationRule initWithDictionary:].cold.9();
      }
    }

    v10 = [v4 objectForKeyedSubscript:@"bundleID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = v10;
      bundleID = v6->_bundleID;
      v6->_bundleID = v11;
    }
    else
    {
      bundleID = _CELogSystem();
      if (os_log_type_enabled(bundleID, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendationRule initWithDictionary:].cold.8();
      }
    }

    v13 = [v4 objectForKeyedSubscript:@"titleHint"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = v13;
      titleHint = v6->_titleHint;
      v6->_titleHint = v14;
    }
    else
    {
      titleHint = _CELogSystem();
      if (os_log_type_enabled(titleHint, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendationRule initWithDictionary:].cold.7();
      }
    }

    v16 = [v4 objectForKeyedSubscript:@"messageHint"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = v16;
      messageHint = v6->_messageHint;
      v6->_messageHint = v17;
    }
    else
    {
      messageHint = _CELogSystem();
      if (os_log_type_enabled(messageHint, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendationRule initWithDictionary:].cold.6();
      }
    }

    v19 = [v4 objectForKeyedSubscript:@"rankingHint"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v19;
      p_super = &v6->_rankingHint->super.super;
      v6->_rankingHint = v20;
    }
    else
    {
      p_super = _CELogSystem();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendationRule initWithDictionary:].cold.5();
      }
    }

    v22 = [v4 objectForKeyedSubscript:@"lastCompletedTimestamp"];
    objc_opt_class();
    v50 = v22;
    if (objc_opt_isKindOfClass())
    {
      v23 = v22;
      v24 = &v6->_lastCompletedTimeStamp->super.super;
      v6->_lastCompletedTimeStamp = v23;
    }
    else
    {
      v24 = _CELogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendationRule initWithDictionary:].cold.4();
      }
    }

    v25 = [v4 objectForKeyedSubscript:@"ignoreClientRank"];
    char v26 = [v25 BOOLValue];

    v6->_ignoreClientRank = v26;
    v27 = [CERuleCriteria alloc];
    v28 = [v4 objectForKeyedSubscript:@"criteria"];
    v29 = [(CERuleCriteria *)v27 initWithDictionary:v28];

    objc_opt_class();
    v49 = v29;
    if (objc_opt_isKindOfClass())
    {
      v30 = v29;
      v31 = &v6->_criteria->super;
      v6->_criteria = v30;
    }
    else
    {
      v31 = _CELogSystem();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendationRule initWithDictionary:]();
      }
    }

    v48 = [v4 objectForKeyedSubscript:@"templates"];
    v32 = [[CERecommendationStringTemplate alloc] initWithDictionary:v48];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = v32;
      v34 = &v6->_templates->super;
      v6->_templates = v33;
    }
    else
    {
      v34 = _CELogSystem();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendationRule initWithDictionary:]();
      }
    }

    v35 = [v4 objectForKeyedSubscript:@"context"];
    objc_opt_class();
    v47 = v32;
    if (objc_opt_isKindOfClass())
    {
      id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = __43__CERecommendationRule_initWithDictionary___block_invoke;
      v51[3] = &unk_2652845A8;
      v37 = (NSArray *)v36;
      v52 = v37;
      [v35 enumerateObjectsUsingBlock:v51];
      id v38 = v4;
      v39 = v19;
      v40 = v16;
      v41 = v13;
      v42 = v10;
      v43 = v7;
      context = v6->_context;
      v6->_context = v37;
      v45 = v37;

      v7 = v43;
      v10 = v42;
      v13 = v41;
      v16 = v40;
      v19 = v39;
      id v4 = v38;
    }
    else
    {
      v45 = _CELogSystem();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendationRule initWithDictionary:]();
      }
    }
  }
  return v6;
}

void __43__CERecommendationRule_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CERecommendationRule *)self recommendationID];
  [v4 encodeObject:v5 forKey:@"recommendationID"];

  v6 = [(CERecommendationRule *)self bundleID];
  [v4 encodeObject:v6 forKey:@"bundleID"];

  v7 = [(CERecommendationRule *)self titleHint];
  [v4 encodeObject:v7 forKey:@"titleHint"];

  v8 = [(CERecommendationRule *)self messageHint];
  [v4 encodeObject:v8 forKey:@"messageHint"];

  v9 = [(CERecommendationRule *)self rankingHint];
  [v4 encodeObject:v9 forKey:@"rankingHint"];

  v10 = [(CERecommendationRule *)self lastCompletedTimeStamp];
  [v4 encodeObject:v10 forKey:@"lastCompletedTimeStamp"];

  objc_msgSend(v4, "encodeBool:forKey:", -[CERecommendationRule ignoreClientRank](self, "ignoreClientRank"), @"ignoreClientRank");
  v11 = [(CERecommendationRule *)self criteria];
  [v4 encodeObject:v11 forKey:@"criteria"];

  v12 = [(CERecommendationRule *)self templates];
  [v4 encodeObject:v12 forKey:@"templates"];

  id v13 = [(CERecommendationRule *)self context];
  [v4 encodeObject:v13 forKey:@"context"];
}

- (CERecommendationRule)initWithCoder:(id)a3
{
  v30[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CERecommendationRule;
  v5 = [(CERecommendationRule *)&v29 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recommendationID"];
    recommendationID = v6->_recommendationID;
    v6->_recommendationID = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v6->_bundleID;
    v6->_bundleID = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleHint"];
    titleHint = v6->_titleHint;
    v6->_titleHint = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messageHint"];
    messageHint = v6->_messageHint;
    v6->_messageHint = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rankingHint"];
    rankingHint = v6->_rankingHint;
    v6->_rankingHint = (NSNumber *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastCompletedTimeStamp"];
    lastCompletedTimeStamp = v6->_lastCompletedTimeStamp;
    v6->_lastCompletedTimeStamp = (NSNumber *)v17;

    v6->_ignoreClientRank = [v4 decodeBoolForKey:@"ignoreClientRank"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"criteria"];
    criteria = v6->_criteria;
    v6->_criteria = (CERuleCriteria *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"templates"];
    templates = v6->_templates;
    v6->_templates = (CERecommendationStringTemplate *)v21;

    v23 = (void *)MEMORY[0x263EFFA08];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
    v25 = [v23 setWithArray:v24];

    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"context"];
    context = v6->_context;
    v6->_context = (NSArray *)v26;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[CERecommendationRule allocWithZone:](CERecommendationRule, "allocWithZone:") init];
  v5->_lock._os_unfair_lock_opaque = 0;
  v6 = [(CERecommendationRule *)self recommendationID];
  [(CERecommendationRule *)v5 setRecommendationID:v6];

  uint64_t v7 = [(CERecommendationRule *)self bundleID];
  [(CERecommendationRule *)v5 setBundleID:v7];

  v8 = [(CERecommendationRule *)self titleHint];
  [(CERecommendationRule *)v5 setTitleHint:v8];

  uint64_t v9 = [(CERecommendationRule *)self messageHint];
  [(CERecommendationRule *)v5 setMessageHint:v9];

  v10 = [(CERecommendationRule *)self rankingHint];
  [(CERecommendationRule *)v5 setRankingHint:v10];

  uint64_t v11 = [(CERecommendationRule *)self lastCompletedTimeStamp];
  [(CERecommendationRule *)v5 setLastCompletedTimeStamp:v11];

  [(CERecommendationRule *)v5 setIgnoreClientRank:[(CERecommendationRule *)self ignoreClientRank]];
  v12 = [(CERecommendationRule *)self criteria];
  uint64_t v13 = (void *)[v12 copyWithZone:a3];
  [(CERecommendationRule *)v5 setCriteria:v13];

  v14 = [(CERecommendationRule *)self templates];
  uint64_t v15 = (void *)[v14 copyWithZone:a3];
  [(CERecommendationRule *)v5 setTemplates:v15];

  v16 = [(CERecommendationRule *)self context];
  uint64_t v17 = (void *)[v16 copyWithZone:a3];
  [(CERecommendationRule *)v5 setContext:v17];

  return v5;
}

- (id)description
{
  uint64_t v15 = NSString;
  id v3 = [(CERecommendationRule *)self recommendationID];
  id v4 = [(CERecommendationRule *)self bundleID];
  v5 = [(CERecommendationRule *)self titleHint];
  v6 = [(CERecommendationRule *)self messageHint];
  uint64_t v7 = [(CERecommendationRule *)self rankingHint];
  v8 = [(CERecommendationRule *)self lastCompletedTimeStamp];
  BOOL v9 = [(CERecommendationRule *)self ignoreClientRank];
  v10 = [(CERecommendationRule *)self criteria];
  uint64_t v11 = [(CERecommendationRule *)self templates];
  v12 = [(CERecommendationRule *)self context];
  uint64_t v13 = [v15 stringWithFormat:@"Recommendation Rule with id: %@, bundleID: %@, titleHint: %@, messageHint: %@, rankingHint: %@, lastCompletedTimestamp: %@, ignoreClientRank: %d, criteria: %@, templates: %@, context: %@", v3, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (NSString)titleHint
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_titleHint;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)messageHint
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_messageHint;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)rankingHint
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_rankingHint;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)recommendationID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_recommendationID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)bundleID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_bundleID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)ignoreClientRank
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_ignoreClientRank;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSNumber)lastCompletedTimeStamp
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lastCompletedTimeStamp;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (CERuleCriteria)criteria
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_criteria;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (CERecommendationStringTemplate)templates
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_templates;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)context
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_context;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setTitleHint:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  titleHint = self->_titleHint;
  self->_titleHint = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setMessageHint:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  messageHint = self->_messageHint;
  self->_messageHint = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setRankingHint:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  rankingHint = self->_rankingHint;
  self->_rankingHint = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setRecommendationID:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  recommendationID = self->_recommendationID;
  self->_recommendationID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setBundleID:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  bundleID = self->_bundleID;
  self->_bundleID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setIgnoreClientRank:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_ignoreClientRank = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setLastCompletedTimeStamp:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  lastCompletedTimeStamp = self->_lastCompletedTimeStamp;
  self->_lastCompletedTimeStamp = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setCriteria:(id)a3
{
  id v4 = (CERuleCriteria *)a3;
  os_unfair_lock_lock(&self->_lock);
  criteria = self->_criteria;
  self->_criteria = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setTemplates:(id)a3
{
  id v4 = (CERecommendationStringTemplate *)a3;
  os_unfair_lock_lock(&self->_lock);
  templates = self->_templates;
  self->_templates = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setContext:(id)a3
{
  id v4 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_lock);
  context = self->_context;
  self->_context = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_templates, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_lastCompletedTimeStamp, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_recommendationID, 0);
  objc_storeStrong((id *)&self->_rankingHint, 0);
  objc_storeStrong((id *)&self->_messageHint, 0);
  objc_storeStrong((id *)&self->_titleHint, 0);
}

- (void)initWithDictionary:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse context array from Recommendation Rule.", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.2()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse templates dictionary from Recommendation Rule.", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.3()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse criteria from dictionary.", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.4()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse lastCompletedTimestamp from dictionary.", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.5()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse rankingHint from dictionary.", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.6()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse messageHint from dictionary.", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.7()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse titleHint from dictionary.", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.8()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse bundleID from dictionary.", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.9()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse recommendationID from dictionary.", v4, v5, v6, v7, v8);
}

@end