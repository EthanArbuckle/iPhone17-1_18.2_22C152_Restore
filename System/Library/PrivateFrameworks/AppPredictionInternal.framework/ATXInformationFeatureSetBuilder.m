@interface ATXInformationFeatureSetBuilder
+ (id)stringForInfoSuggestionFeature:(unint64_t)a3;
- (id)build;
- (void)appendFeature:(unint64_t)a3 value:(double)a4;
- (void)setFeatureWithName:(id)a3 toValue:(id)a4;
@end

@implementation ATXInformationFeatureSetBuilder

- (void)appendFeature:(unint64_t)a3 value:(double)a4
{
  if (a3 - 10 > 0xFFFFFFFFFFFFFFF6)
  {
    id v9 = +[ATXInformationFeatureSetBuilder stringForInfoSuggestionFeature:a3];
    v8 = [NSNumber numberWithDouble:a4];
    [(ATXInformationFeatureSetBuilder *)self setFeatureWithName:v9 toValue:v8];
  }
  else
  {
    v5 = __atxlog_handle_gi();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ATXInformationFeatureSetBuilder appendFeature:value:](a3, v5);
    }
  }
}

- (void)setFeatureWithName:(id)a3 toValue:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  features = self->_features;
  if (!features)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    id v9 = self->_features;
    self->_features = v8;

    features = self->_features;
  }
  [(NSMutableDictionary *)features setObject:v6 forKeyedSubscript:v10];
}

- (id)build
{
  v2 = [[ATXInformationFeatureSet alloc] initWithFeatureDictionary:self->_features];
  return v2;
}

+ (id)stringForInfoSuggestionFeature:(unint64_t)a3
{
  if (a3 < 0xB) {
    return off_1E68B1698[a3];
  }
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:a1 file:@"ATXInformationFeatureSetBuilder.m" lineNumber:67 description:@"Unknown value for ATXInfoSuggestionFeatureName"];

  return result;
}

- (void).cxx_destruct
{
}

- (void)appendFeature:(uint64_t)a1 value:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXInformationFeatureSetBuilder: Unknown value for ATXInfoSuggestionFeature %lu", (uint8_t *)&v2, 0xCu);
}

@end