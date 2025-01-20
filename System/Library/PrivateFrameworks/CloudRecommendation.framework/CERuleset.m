@interface CERuleset
+ (BOOL)supportsSecureCoding;
- (BOOL)ignoreClientSectionRank;
- (CERuleset)initWithCoder:(id)a3;
- (CERuleset)initWithDictionary:(id)a3;
- (NSArray)context;
- (NSArray)recommendationRules;
- (NSNumber)maxRecommendations;
- (NSString)sectionID;
- (NSString)userType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIgnoreClientSectionRank:(BOOL)a3;
- (void)setMaxRecommendations:(id)a3;
- (void)setSectionID:(id)a3;
- (void)setUserType:(id)a3;
- (void)sortRecommendationRulesUsingComparator:(id)a3;
@end

@implementation CERuleset

- (CERuleset)initWithDictionary:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CERuleset;
  v5 = [(CERuleset *)&v33 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = [v4 objectForKeyedSubscript:@"sectionID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = v7;
      sectionID = v6->_sectionID;
      v6->_sectionID = v8;
    }
    else
    {
      sectionID = _CELogSystem();
      if (os_log_type_enabled(sectionID, OS_LOG_TYPE_DEBUG)) {
        -[CERuleset initWithDictionary:].cold.5();
      }
    }

    v10 = [v4 objectForKeyedSubscript:@"maxRecommendations"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = v10;
      p_super = &v6->_maxRecommendations->super.super;
      v6->_maxRecommendations = v11;
    }
    else
    {
      p_super = _CELogSystem();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
        -[CERuleset initWithDictionary:].cold.4();
      }
    }

    v13 = [v4 objectForKeyedSubscript:@"ignoreClientSectionRank"];
    char v14 = [v13 BOOLValue];

    v6->_ignoreClientSectionRank = v14;
    v15 = [v4 objectForKeyedSubscript:@"context"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __32__CERuleset_initWithDictionary___block_invoke;
      v31[3] = &unk_2652845A8;
      v17 = (NSArray *)v16;
      v32 = v17;
      [v15 enumerateObjectsUsingBlock:v31];
      context = v6->_context;
      v6->_context = v17;
      v19 = v17;
    }
    else
    {
      v19 = _CELogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[CERuleset initWithDictionary:]();
      }
    }

    v20 = [v4 objectForKeyedSubscript:@"recommendations"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __32__CERuleset_initWithDictionary___block_invoke_20;
      v29[3] = &unk_2652845A8;
      v22 = (NSArray *)v21;
      v30 = v22;
      [v20 enumerateObjectsUsingBlock:v29];
      recommendationRules = v6->_recommendationRules;
      v6->_recommendationRules = v22;
      v24 = v22;
    }
    else
    {
      v24 = _CELogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[CERuleset initWithDictionary:]();
      }
    }

    v25 = [v4 objectForKeyedSubscript:@"userType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = v25;
      userType = v6->_userType;
      v6->_userType = v26;
    }
    else
    {
      userType = _CELogSystem();
      if (os_log_type_enabled(userType, OS_LOG_TYPE_DEBUG)) {
        -[CERuleset initWithDictionary:]();
      }
    }
  }
  return v6;
}

void __32__CERuleset_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __32__CERuleset_initWithDictionary___block_invoke_20(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [[CERecommendationRule alloc] initWithDictionary:v4];
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
  v5 = [(CERuleset *)self sectionID];
  [v4 encodeObject:v5 forKey:@"sectionID"];

  v6 = [(CERuleset *)self maxRecommendations];
  [v4 encodeObject:v6 forKey:@"maxRecommendations"];

  objc_msgSend(v4, "encodeBool:forKey:", -[CERuleset ignoreClientSectionRank](self, "ignoreClientSectionRank"), @"ignoreClientSectionRank");
  v7 = [(CERuleset *)self context];
  [v4 encodeObject:v7 forKey:@"context"];

  v8 = [(CERuleset *)self recommendationRules];
  [v4 encodeObject:v8 forKey:@"recommendationRules"];

  id v9 = [(CERuleset *)self userType];
  [v4 encodeObject:v9 forKey:@"userType"];
}

- (CERuleset)initWithCoder:(id)a3
{
  v26[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CERuleset;
  v5 = [(CERuleset *)&v24 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sectionID"];
    sectionID = v6->_sectionID;
    v6->_sectionID = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxRecommendations"];
    maxRecommendations = v6->_maxRecommendations;
    v6->_maxRecommendations = (NSNumber *)v9;

    v6->_ignoreClientSectionRank = [v4 decodeBoolForKey:@"ignoreClientSectionRank"];
    v11 = (void *)MEMORY[0x263EFFA08];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
    v13 = [v11 setWithArray:v12];

    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"context"];
    context = v6->_context;
    v6->_context = (NSArray *)v14;

    id v16 = (void *)MEMORY[0x263EFFA08];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
    v18 = [v16 setWithArray:v17];

    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"recommendationRules"];
    recommendationRules = v6->_recommendationRules;
    v6->_recommendationRules = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userType"];
    userType = v6->_userType;
    v6->_userType = (NSString *)v21;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[CERuleset allocWithZone:](CERuleset, "allocWithZone:") init];
  v5->_lock._os_unfair_lock_opaque = 0;
  v6 = [(CERuleset *)self sectionID];
  [(CERuleset *)v5 setSectionID:v6];

  uint64_t v7 = [(CERuleset *)self maxRecommendations];
  [(CERuleset *)v5 setMaxRecommendations:v7];

  [(CERuleset *)v5 setIgnoreClientSectionRank:[(CERuleset *)self ignoreClientSectionRank]];
  v8 = [(CERuleset *)self userType];
  [(CERuleset *)v5 setUserType:v8];

  os_unfair_lock_lock(&v5->_lock);
  uint64_t v9 = [(CERuleset *)self context];
  context = v5->_context;
  v5->_context = (NSArray *)v9;

  v11 = [(CERuleset *)self recommendationRules];
  uint64_t v12 = [v11 copyWithZone:a3];
  recommendationRules = v5->_recommendationRules;
  v5->_recommendationRules = (NSArray *)v12;

  os_unfair_lock_unlock(&v5->_lock);
  return v5;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(CERuleset *)self sectionID];
  v5 = [(CERuleset *)self maxRecommendations];
  BOOL v6 = [(CERuleset *)self ignoreClientSectionRank];
  uint64_t v7 = [(CERuleset *)self context];
  v8 = [(CERuleset *)self recommendationRules];
  uint64_t v9 = [(CERuleset *)self userType];
  v10 = [v3 stringWithFormat:@"Ruleset with sectionID: %@, maxRecommendations: %@, ignoreClientSectionRank: %d, context: %@, rules: %@, userType: %@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)sectionID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_sectionID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)maxRecommendations
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_maxRecommendations;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)ignoreClientSectionRank
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_ignoreClientSectionRank;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSArray)context
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSArray *)self->_context copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSString)userType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_userType;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)recommendationRules
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSArray *)self->_recommendationRules copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)setSectionID:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  sectionID = self->_sectionID;
  self->_sectionID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setMaxRecommendations:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  maxRecommendations = self->_maxRecommendations;
  self->_maxRecommendations = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setIgnoreClientSectionRank:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_ignoreClientSectionRank = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setUserType:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  userType = self->_userType;
  self->_userType = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)sortRecommendationRulesUsingComparator:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  BOOL v6 = [(NSArray *)self->_recommendationRules sortedArrayUsingComparator:v5];

  recommendationRules = self->_recommendationRules;
  self->_recommendationRules = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendationRules, 0);
  objc_storeStrong((id *)&self->_userType, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_maxRecommendations, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

- (void)initWithDictionary:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse userType from dictionary", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.2()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse rules from dictionary", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.3()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse context from dictionary", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.4()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse maxRecommendations from dictionary", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.5()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse sectionID from dictionary", v4, v5, v6, v7, v8);
}

@end