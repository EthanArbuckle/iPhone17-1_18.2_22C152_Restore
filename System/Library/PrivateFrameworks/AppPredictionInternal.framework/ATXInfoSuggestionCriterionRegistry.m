@interface ATXInfoSuggestionCriterionRegistry
- (ATXInfoSuggestionCriterionRegistry)init;
- (BOOL)isSourceIdentifierRegistered:(id)a3;
- (id)availableCriterionIdentifiersForSourceIdentifier:(id)a3;
- (int64_t)confidenceLevelForCriterion:(id)a3 sourceIdentifier:(id)a4;
@end

@implementation ATXInfoSuggestionCriterionRegistry

- (ATXInfoSuggestionCriterionRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXInfoSuggestionCriterionRegistry;
  v2 = [(ATXInfoSuggestionCriterionRegistry *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4AF08] dictionaryWithLegacyPathForClass:objc_opt_class()];
    registry = v2->_registry;
    v2->_registry = (NSDictionary *)v3;
  }
  return v2;
}

- (BOOL)isSourceIdentifierRegistered:(id)a3
{
  uint64_t v3 = [(NSDictionary *)self->_registry objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (int64_t)confidenceLevelForCriterion:(id)a3 sourceIdentifier:(id)a4
{
  registry = self->_registry;
  id v6 = a3;
  v7 = [(NSDictionary *)registry objectForKeyedSubscript:a4];
  v8 = [v7 objectForKeyedSubscript:v6];

  int64_t v9 = [v8 unsignedIntegerValue];
  return v9;
}

- (id)availableCriterionIdentifiersForSourceIdentifier:(id)a3
{
  uint64_t v3 = [(NSDictionary *)self->_registry objectForKeyedSubscript:a3];
  BOOL v4 = [v3 allKeys];

  return v4;
}

- (void).cxx_destruct
{
}

@end