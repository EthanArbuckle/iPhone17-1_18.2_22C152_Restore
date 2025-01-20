@interface CNFeatureFlagsTestDouble
- (BOOL)isFeatureEnabled:(unint64_t)a3;
- (CNFeatureFlagsTestDouble)initWithFeatureFlags:(id)a3;
- (void)setFeatureEnabled:(BOOL)a3 forFeature:(unint64_t)a4;
@end

@implementation CNFeatureFlagsTestDouble

- (CNFeatureFlagsTestDouble)initWithFeatureFlags:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNFeatureFlagsTestDouble;
  v5 = [(CNFeatureFlagsTestDouble *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    featureFlags = v5->_featureFlags;
    v5->_featureFlags = (NSMutableDictionary *)v6;

    v8 = objc_alloc_init(CNFeatureFlags);
    fallback = v5->_fallback;
    v5->_fallback = v8;

    v10 = v5;
  }

  return v5;
}

- (BOOL)isFeatureEnabled:(unint64_t)a3
{
  featureFlags = self->_featureFlags;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v7 = [(NSMutableDictionary *)featureFlags objectForKeyedSubscript:v6];

  if (v7) {
    char v8 = [v7 BOOLValue];
  }
  else {
    char v8 = [(CNFeatureFlags *)self->_fallback isFeatureEnabled:a3];
  }
  BOOL v9 = v8;

  return v9;
}

- (void)setFeatureEnabled:(BOOL)a3 forFeature:(unint64_t)a4
{
  id v8 = [NSNumber numberWithBool:a3];
  featureFlags = self->_featureFlags;
  v7 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)featureFlags setObject:v8 forKeyedSubscript:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallback, 0);

  objc_storeStrong((id *)&self->_featureFlags, 0);
}

@end