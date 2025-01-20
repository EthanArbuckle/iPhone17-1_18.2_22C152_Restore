@interface ATXNotificationRankingFeatureSet
+ (BOOL)supportsSecureCoding;
- (ATXNotificationRankingFeatureSet)initWithCoder:(id)a3;
- (ATXNotificationRankingFeatureSet)initWithFeatures:(id)a3 metadata:(id)a4;
- (NSDictionary)features;
- (NSDictionary)metadata;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXNotificationRankingFeatureSet

- (ATXNotificationRankingFeatureSet)initWithFeatures:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXNotificationRankingFeatureSet;
  v8 = [(ATXNotificationRankingFeatureSet *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    features = v8->_features;
    v8->_features = (NSDictionary *)v9;

    uint64_t v11 = [v7 copy];
    metadata = v8->_metadata;
    v8->_metadata = (NSDictionary *)v11;
  }
  return v8;
}

- (double)score
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(NSDictionary *)self->_features allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) score];
        double v6 = v6 + v8;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [ATXNotificationRankingFeatureSet alloc];
  features = self->_features;
  metadata = self->_metadata;

  return [(ATXNotificationRankingFeatureSet *)v4 initWithFeatures:features metadata:metadata];
}

- (void)encodeWithCoder:(id)a3
{
  features = self->_features;
  id v5 = a3;
  [v5 encodeObject:features forKey:@"features"];
  [v5 encodeObject:self->_metadata forKey:@"metadata"];
}

- (ATXNotificationRankingFeatureSet)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v6 = [v4 decodeDictionaryWithKeysOfClass:v5 objectsOfClass:objc_opt_class() forKey:@"features"];
  if (v6 && ([v4 error], id v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    uint64_t v18 = objc_opt_class();
    double v8 = [v4 decodeDictionaryWithKeysOfClass:v18 objectsOfClass:objc_opt_class() forKey:@"metadata"];
    if (v8)
    {
      v19 = [v4 error];

      if (!v19)
      {
        self = [(ATXNotificationRankingFeatureSet *)self initWithFeatures:v6 metadata:v8];
        v16 = self;
        goto LABEL_6;
      }
    }
    v20 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationRankingFeatureSet initWithCoder:](v20, v21, v22, v23, v24, v25, v26, v27);
    }
  }
  else
  {
    double v8 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationRankingFeatureSet initWithCoder:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v16 = 0;
LABEL_6:

  return v16;
}

- (NSDictionary)features
{
  return self->_features;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_features, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end