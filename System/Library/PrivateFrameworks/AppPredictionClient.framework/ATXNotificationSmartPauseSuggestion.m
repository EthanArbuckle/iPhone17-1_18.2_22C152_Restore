@interface ATXNotificationSmartPauseSuggestion
+ (BOOL)supportsSecureCoding;
- (ATXNotificationSmartPauseSuggestion)initWithCoder:(id)a3;
- (ATXNotificationSmartPauseSuggestion)initWithProto:(id)a3;
- (ATXNotificationSmartPauseSuggestion)initWithProtoData:(id)a3;
- (ATXNotificationSmartPauseSuggestion)initWithSuggestionExpiration:(id)a3 pauseDuration:(double)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXNotificationSmartPauseSuggestion:(id)a3;
- (NSDate)suggestionExpiration;
- (double)suggestionDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodeAsProto;
- (id)feedbackKeyComponent;
- (id)proto;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSuggestionDuration:(double)a3;
@end

@implementation ATXNotificationSmartPauseSuggestion

- (ATXNotificationSmartPauseSuggestion)initWithSuggestionExpiration:(id)a3 pauseDuration:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXNotificationSmartPauseSuggestion;
  v8 = [(ATXNotificationSmartPauseSuggestion *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_suggestionExpiration, a3);
    v9->_suggestionDuration = a4;
  }

  return v9;
}

- (id)feedbackKeyComponent
{
  return &stru_1EFD9B408;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXNotificationSmartPauseSuggestion *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXNotificationSmartPauseSuggestion *)self isEqualToATXNotificationSmartPauseSuggestion:v5];

  return v6;
}

- (BOOL)isEqualToATXNotificationSmartPauseSuggestion:(id)a3
{
  v4 = (id *)a3;
  [(NSDate *)self->_suggestionExpiration timeIntervalSinceReferenceDate];
  double v6 = v5;
  [v4[1] timeIntervalSinceReferenceDate];
  double v8 = v6 - v7;
  double v9 = -v8;
  if (v8 >= 0.0) {
    double v9 = v8;
  }
  if (v9 <= 300.0)
  {
    double v11 = self->_suggestionDuration - *((double *)v4 + 2);
    if (v11 < 0.0) {
      double v11 = -v11;
    }
    BOOL v10 = v11 <= 300.0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  [(NSDate *)self->_suggestionExpiration timeIntervalSinceReferenceDate];
  return (unint64_t)(self->_suggestionDuration / 300.0)
       - (unint64_t)(v3 / 300.0)
       + 32 * (unint64_t)(v3 / 300.0);
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"Smart Pause:   Expiration: %@, Duration: %f", self->_suggestionExpiration, *(void *)&self->_suggestionDuration];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[ATXNotificationSmartPauseSuggestion allocWithZone:a3];
  suggestionExpiration = self->_suggestionExpiration;
  double suggestionDuration = self->_suggestionDuration;

  return [(ATXNotificationSmartPauseSuggestion *)v4 initWithSuggestionExpiration:suggestionExpiration pauseDuration:suggestionDuration];
}

- (id)encodeAsProto
{
  v2 = [(ATXNotificationSmartPauseSuggestion *)self proto];
  double v3 = [v2 data];

  return v3;
}

- (ATXNotificationSmartPauseSuggestion)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    double v5 = [[ATXPBNotificationSmartPauseSuggestion alloc] initWithData:v4];

    self = [(ATXNotificationSmartPauseSuggestion *)self initWithProto:v5];
    double v6 = self;
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (ATXNotificationSmartPauseSuggestion)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v5 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXNotificationSmartPauseSuggestion initWithProto:]();
      }
      double v8 = 0;
      goto LABEL_17;
    }
    double v5 = v4;
    if ([v5 hasExpirationTimestamp])
    {
      double v6 = (void *)MEMORY[0x1E4F1C9C8];
      [v5 expirationTimestamp];
      double v7 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
      if ([v5 hasPauseDuration])
      {
        [v5 pauseDuration];
        self = -[ATXNotificationSmartPauseSuggestion initWithSuggestionExpiration:pauseDuration:](self, "initWithSuggestionExpiration:pauseDuration:", v7);
        double v8 = self;
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      double v9 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[ATXNotificationSmartPauseSuggestion initWithProto:]();
      }
    }
    else
    {
      double v7 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[ATXNotificationSmartPauseSuggestion initWithProto:]();
      }
    }
    double v8 = 0;
    goto LABEL_16;
  }
  double v8 = 0;
LABEL_18:

  return v8;
}

- (id)proto
{
  double v3 = objc_opt_new();
  [(NSDate *)self->_suggestionExpiration timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "setExpirationTimestamp:");
  [v3 setPauseDuration:self->_suggestionDuration];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXNotificationSmartPauseSuggestion *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXNotificationSmartPauseSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  double v6 = [(ATXNotificationSmartPauseSuggestion *)self initWithProtoData:v5];
  return v6;
}

- (NSDate)suggestionExpiration
{
  return self->_suggestionExpiration;
}

- (double)suggestionDuration
{
  return self->_suggestionDuration;
}

- (void)setSuggestionDuration:(double)a3
{
  self->_double suggestionDuration = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithProto:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v2, v3, "%@: missing pauseDuration.", v4, v5, v6, v7, 2u);
}

- (void)initWithProto:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v2, v3, "%@: missing expirationTimestamp.", v4, v5, v6, v7, 2u);
}

- (void)initWithProto:.cold.3()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v2, v3, "%@: Unable to construct class from ProtoBuf object", v4, v5, v6, v7, 2u);
}

@end