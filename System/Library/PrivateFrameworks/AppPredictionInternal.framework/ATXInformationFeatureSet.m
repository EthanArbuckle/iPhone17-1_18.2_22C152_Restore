@interface ATXInformationFeatureSet
- (ATXInformationFeatureSet)initWithFeatureDictionary:(id)a3;
- (double)valueForFeature:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
@end

@implementation ATXInformationFeatureSet

- (ATXInformationFeatureSet)initWithFeatureDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXInformationFeatureSet;
  v5 = [(ATXInformationFeatureSet *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    features = v5->_features;
    v5->_features = (NSDictionary *)v6;
  }
  return v5;
}

- (double)valueForFeature:(unint64_t)a3
{
  if (a3 - 10 <= 0xFFFFFFFFFFFFFFF6)
  {
    v5 = __atxlog_handle_gi();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ATXInformationFeatureSet valueForFeature:](a3, v5);
    }
  }
  uint64_t v6 = +[ATXInformationFeatureSetBuilder stringForInfoSuggestionFeature:a3];
  v7 = [(NSDictionary *)self->_features objectForKeyedSubscript:v6];
  [v7 doubleValue];
  double v9 = v8;

  return v9;
}

- (id)dictionaryRepresentation
{
  return self->_features;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  features = self->_features;
  return (id)[v4 initWithFeatureDictionary:features];
}

- (void).cxx_destruct
{
}

- (void)valueForFeature:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXInformationFeatureSet: Unknown value passed into selector valueForFeature for ATXInfoSuggestionFeatureName %lu", (uint8_t *)&v2, 0xCu);
}

@end