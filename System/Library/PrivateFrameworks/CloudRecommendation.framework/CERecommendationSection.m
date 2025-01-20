@interface CERecommendationSection
+ (BOOL)supportsSecureCoding;
- (CERecommendationSection)initWithCoder:(id)a3;
- (CERecommendationSection)initWithDictionary:(id)a3;
- (NSString)sectionFooter;
- (NSString)sectionHeader;
- (NSString)sectionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSectionFooter:(id)a3;
- (void)setSectionHeader:(id)a3;
- (void)setSectionID:(id)a3;
@end

@implementation CERecommendationSection

- (CERecommendationSection)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CERecommendationSection;
  v5 = [(CERecommendationSection *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sectionID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      sectionID = v5->_sectionID;
      v5->_sectionID = v7;
    }
    else
    {
      sectionID = _CELogSystem();
      if (os_log_type_enabled(sectionID, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendationSection initWithDictionary:]();
      }
    }

    v9 = [v4 objectForKeyedSubscript:@"sectionHeader"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = v9;
      sectionHeader = v5->_sectionHeader;
      v5->_sectionHeader = v10;
    }
    else
    {
      sectionHeader = _CELogSystem();
      if (os_log_type_enabled(sectionHeader, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendationSection initWithDictionary:]();
      }
    }

    v12 = [v4 objectForKeyedSubscript:@"sectionFooter"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = v12;
      sectionFooter = v5->_sectionFooter;
      v5->_sectionFooter = v13;
    }
    else
    {
      sectionFooter = _CELogSystem();
      if (os_log_type_enabled(sectionFooter, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendationSection initWithDictionary:]();
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
  sectionID = self->_sectionID;
  id v5 = a3;
  [v5 encodeObject:sectionID forKey:@"sectionID"];
  [v5 encodeObject:self->_sectionHeader forKey:@"sectionHeader"];
  [v5 encodeObject:self->_sectionFooter forKey:@"sectionFooter"];
}

- (CERecommendationSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CERecommendationSection;
  id v5 = [(CERecommendationSection *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sectionID"];
    sectionID = v5->_sectionID;
    v5->_sectionID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sectionHeader"];
    sectionHeader = v5->_sectionHeader;
    v5->_sectionHeader = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sectionFooter"];
    sectionFooter = v5->_sectionFooter;
    v5->_sectionFooter = (NSString *)v10;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[CERecommendationSection allocWithZone:a3] init];
  [(CERecommendationSection *)v4 setSectionID:self->_sectionID];
  [(CERecommendationSection *)v4 setSectionHeader:self->_sectionHeader];
  [(CERecommendationSection *)v4 setSectionFooter:self->_sectionFooter];
  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Section with id: %@, header: %@, footer: %@", self->_sectionID, self->_sectionHeader, self->_sectionFooter];
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (NSString)sectionHeader
{
  return self->_sectionHeader;
}

- (void)setSectionHeader:(id)a3
{
}

- (NSString)sectionFooter
{
  return self->_sectionFooter;
}

- (void)setSectionFooter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionFooter, 0);
  objc_storeStrong((id *)&self->_sectionHeader, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

- (void)initWithDictionary:.cold.1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v1, v2, "%@ Unable to parse sectionFooter from dictionary", v3, v4, v5, v6, 2u);
}

- (void)initWithDictionary:.cold.2()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v1, v2, "%@ Unable to parse sectionHeader from dictionary", v3, v4, v5, v6, 2u);
}

- (void)initWithDictionary:.cold.3()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v1, v2, "%@ Unable to parse sectionID from dictionary", v3, v4, v5, v6, 2u);
}

@end