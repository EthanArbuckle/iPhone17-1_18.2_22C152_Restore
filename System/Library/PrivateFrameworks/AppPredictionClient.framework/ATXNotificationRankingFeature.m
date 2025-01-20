@interface ATXNotificationRankingFeature
+ (BOOL)supportsSecureCoding;
- (ATXNotificationRankingFeature)initWithCoder:(id)a3;
- (ATXNotificationRankingFeature)initWithWeight:(id)a3 value:(id)a4;
- (NSNumber)value;
- (NSNumber)weight;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXNotificationRankingFeature

- (ATXNotificationRankingFeature)initWithWeight:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXNotificationRankingFeature;
  v9 = [(ATXNotificationRankingFeature *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_weight, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

- (double)score
{
  [(NSNumber *)self->_weight doubleValue];
  double v4 = v3;
  [(NSNumber *)self->_value doubleValue];
  return v4 * v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = [ATXNotificationRankingFeature alloc];
  double v5 = (void *)[(NSNumber *)self->_weight copy];
  v6 = (void *)[(NSNumber *)self->_value copy];
  id v7 = [(ATXNotificationRankingFeature *)v4 initWithWeight:v5 value:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  weight = self->_weight;
  id v5 = a3;
  [v5 encodeObject:weight forKey:@"weight"];
  [v5 encodeObject:self->_value forKey:@"value"];
}

- (ATXNotificationRankingFeature)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"weight"];
  if (v5 && ([v4 error], v6 = objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    if (v7)
    {
      v17 = [v4 error];

      if (!v17)
      {
        self = [(ATXNotificationRankingFeature *)self initWithWeight:v5 value:v7];
        v15 = self;
        goto LABEL_6;
      }
    }
    v18 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationRankingFeature initWithCoder:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  else
  {
    id v7 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationRankingFeature initWithCoder:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v15 = 0;
LABEL_6:

  return v15;
}

- (NSNumber)value
{
  return self->_value;
}

- (NSNumber)weight
{
  return self->_weight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weight, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end