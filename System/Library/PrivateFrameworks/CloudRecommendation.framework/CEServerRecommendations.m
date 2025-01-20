@interface CEServerRecommendations
+ (BOOL)supportsSecureCoding;
- (CERecommendationPage)page;
- (CEServerRecommendations)initWithCoder:(id)a3;
- (CEServerRecommendations)initWithDictionary:(id)a3;
- (NSArray)recommendations;
- (NSArray)sections;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setPage:(id)a3;
- (void)setRecommendations:(id)a3;
- (void)setSections:(id)a3;
@end

@implementation CEServerRecommendations

- (CEServerRecommendations)initWithDictionary:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CEServerRecommendations;
  v5 = [(CEServerRecommendations *)&v28 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"recommendations"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __46__CEServerRecommendations_initWithDictionary___block_invoke;
      v26[3] = &unk_2652845A8;
      id v27 = v7;
      v8 = v7;
      [v6 enumerateObjectsUsingBlock:v26];
      uint64_t v9 = [v8 copy];
      recommendations = v5->_recommendations;
      v5->_recommendations = (NSArray *)v9;
    }
    else
    {
      v8 = _CELogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[CEServerRecommendations initWithDictionary:].cold.4();
      }
    }

    v11 = [v4 objectForKeyedSubscript:@"sections"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [v11 objectForKeyedSubscript:@"sectionDetails"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
        uint64_t v21 = MEMORY[0x263EF8330];
        uint64_t v22 = 3221225472;
        v23 = __46__CEServerRecommendations_initWithDictionary___block_invoke_23;
        v24 = &unk_2652845A8;
        id v25 = v13;
        v14 = v13;
        [v12 enumerateObjectsUsingBlock:&v21];
        uint64_t v15 = [v14 copy];
        sections = v5->_sections;
        v5->_sections = (NSArray *)v15;
      }
      else
      {
        v14 = _CELogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[CEServerRecommendations initWithDictionary:]();
        }
      }

      v17 = [v11 objectForKeyedSubscript:@"sectionHeader"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [[CERecommendationPage alloc] initWithDictionary:v17];
        p_super = &v5->_page->super;
        v5->_page = v18;
      }
      else
      {
        p_super = _CELogSystem();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
          -[CEServerRecommendations initWithDictionary:]((uint64_t)v5, p_super);
        }
      }
    }
    else
    {
      v12 = _CELogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[CEServerRecommendations initWithDictionary:]();
      }
    }
  }
  return v5;
}

void __46__CEServerRecommendations_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = [[CERecommendation alloc] initWithDictionary:v4];

    [*(id *)(a1 + 32) addObject:v5];
  }
  else
  {
    v6 = _CELogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46__CEServerRecommendations_initWithDictionary___block_invoke_cold_1();
    }
  }
}

void __46__CEServerRecommendations_initWithDictionary___block_invoke_23(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = [[CERecommendationSection alloc] initWithDictionary:v4];

    [*(id *)(a1 + 32) addObject:v5];
  }
  else
  {
    v6 = _CELogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46__CEServerRecommendations_initWithDictionary___block_invoke_23_cold_1();
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  recommendations = self->_recommendations;
  id v5 = a3;
  [v5 encodeObject:recommendations forKey:@"recommendations"];
  [v5 encodeObject:self->_sections forKey:@"sections"];
  [v5 encodeObject:self->_page forKey:@"page"];
}

- (CEServerRecommendations)initWithCoder:(id)a3
{
  v21[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CEServerRecommendations;
  id v5 = [(CEServerRecommendations *)&v19 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"recommendations"];
    recommendations = v5->_recommendations;
    v5->_recommendations = (NSArray *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    id v13 = [v11 setWithArray:v12];

    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"sections"];
    sections = v5->_sections;
    v5->_sections = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"page"];
    page = v5->_page;
    v5->_page = (CERecommendationPage *)v16;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[CEServerRecommendations allocWithZone:a3] init];
  [(CEServerRecommendations *)v4 setRecommendations:self->_recommendations];
  [(CEServerRecommendations *)v4 setSections:self->_sections];
  [(CEServerRecommendations *)v4 setPage:self->_page];
  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Recommendations: %@ Sections: %@ Page Details: %@", self->_recommendations, self->_sections, self->_page];
}

- (NSArray)recommendations
{
  return self->_recommendations;
}

- (void)setRecommendations:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (CERecommendationPage)page
{
  return self->_page;
}

- (void)setPage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_page, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_recommendations, 0);
}

- (void)initWithDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_debug_impl(&dword_24A2CB000, a2, OS_LOG_TYPE_DEBUG, "%@ Unable to parse page", (uint8_t *)&v4, 0xCu);
}

- (void)initWithDictionary:.cold.2()
{
  id v0 = (id)objc_opt_class();
  v1 = objc_opt_class();
  id v2 = OUTLINED_FUNCTION_0_1(v1);
  OUTLINED_FUNCTION_1_1(&dword_24A2CB000, v3, v4, "%@ Expected sections array to be of type array but found %@", v5, v6, v7, v8, v9);
}

- (void)initWithDictionary:.cold.3()
{
  id v0 = (id)objc_opt_class();
  v1 = objc_opt_class();
  id v2 = OUTLINED_FUNCTION_0_1(v1);
  OUTLINED_FUNCTION_1_1(&dword_24A2CB000, v3, v4, "%@ Expected sections to be of type dictionary but found %@", v5, v6, v7, v8, v9);
}

- (void)initWithDictionary:.cold.4()
{
  id v0 = (id)objc_opt_class();
  v1 = objc_opt_class();
  id v2 = OUTLINED_FUNCTION_0_1(v1);
  OUTLINED_FUNCTION_1_1(&dword_24A2CB000, v3, v4, "%@ Expected recommendations to be of type array but found %@", v5, v6, v7, v8, v9);
}

void __46__CEServerRecommendations_initWithDictionary___block_invoke_cold_1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_2(&dword_24A2CB000, v1, v2, "Expected recommendation object to be a dictionary, instead found a %@", v3, v4, v5, v6, 2u);
}

void __46__CEServerRecommendations_initWithDictionary___block_invoke_23_cold_1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_2(&dword_24A2CB000, v1, v2, "Expected section object to be a dictionary, instead found a %@", v3, v4, v5, v6, 2u);
}

@end