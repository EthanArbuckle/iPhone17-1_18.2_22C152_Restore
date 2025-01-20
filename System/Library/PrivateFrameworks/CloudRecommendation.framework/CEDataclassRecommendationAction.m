@interface CEDataclassRecommendationAction
+ (BOOL)supportsSecureCoding;
- (CEDataclassRecommendationAction)initWithCoder:(id)a3;
- (CEDataclassRecommendationAction)initWithDictionary:(id)a3;
- (CEDataclassRecommendationAction)initWithIdentifier:(id)a3 title:(id)a4 dataclasses:(id)a5;
- (NSArray)dataclasses;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDataclasses:(id)a3;
@end

@implementation CEDataclassRecommendationAction

- (CEDataclassRecommendationAction)initWithIdentifier:(id)a3 title:(id)a4 dataclasses:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CEDataclassRecommendationAction;
  v10 = [(CERecommendationAction *)&v13 initWithIdentifier:a3 actionTitle:a4 actionType:@"EnableDataclass"];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_dataclasses, a5);
  }

  return v11;
}

- (CEDataclassRecommendationAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CEDataclassRecommendationAction;
  v5 = [(CERecommendationAction *)&v14 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"dataclassesToEnable"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __54__CEDataclassRecommendationAction_initWithDictionary___block_invoke;
      v12[3] = &unk_265284818;
      id v13 = v7;
      v8 = v7;
      [v6 enumerateObjectsUsingBlock:v12];
      uint64_t v9 = [v8 copy];
      dataclasses = v5->_dataclasses;
      v5->_dataclasses = (NSArray *)v9;
    }
    else
    {
      v8 = _CELogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[CEDataclassRecommendationAction initWithDictionary:]();
      }
    }
  }
  return v5;
}

uint64_t __54__CEDataclassRecommendationAction_initWithDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CEDataclassRecommendationAction;
  id v4 = a3;
  [(CERecommendationAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_dataclasses, @"dataclasses", v5.receiver, v5.super_class);
}

- (CEDataclassRecommendationAction)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CEDataclassRecommendationAction;
  objc_super v5 = [(CERecommendationAction *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"dataclasses"];
    dataclasses = v5->_dataclasses;
    v5->_dataclasses = (NSArray *)v9;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CEDataclassRecommendationAction;
  id v4 = [(CERecommendationAction *)&v7 copyWithZone:a3];
  objc_super v5 = v4;
  if (v4) {
    [v4 setDataclasses:self->_dataclasses];
  }
  return v5;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CEDataclassRecommendationAction;
  v3 = [(CERecommendationAction *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" dataclasses: %@", self->_dataclasses];

  return v4;
}

- (NSArray)dataclasses
{
  return self->_dataclasses;
}

- (void)setDataclasses:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithDictionary:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse dataclasses from dictionary", v4, v5, v6, v7, v8);
}

@end