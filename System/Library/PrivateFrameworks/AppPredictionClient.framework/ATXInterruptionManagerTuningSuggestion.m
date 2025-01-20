@interface ATXInterruptionManagerTuningSuggestion
+ (BOOL)supportsSecureCoding;
- (ATXInterruptionManagerTuningSuggestion)initWithCoder:(id)a3;
- (ATXInterruptionManagerTuningSuggestion)initWithProto:(id)a3;
- (ATXInterruptionManagerTuningSuggestion)initWithProtoData:(id)a3;
- (ATXInterruptionManagerTuningSuggestion)initWithSuggestionType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXInterruptionManagerTuningSuggestion:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodeAsProto;
- (id)feedbackKeyComponent;
- (id)jsonRawData;
- (id)proto;
- (int)suggestionType;
- (int64_t)tuningSuggestionType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXInterruptionManagerTuningSuggestion

- (ATXInterruptionManagerTuningSuggestion)initWithSuggestionType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ATXInterruptionManagerTuningSuggestion;
  v4 = [(ATXInterruptionManagerTuningSuggestion *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_tuningSuggestionType = a3;
    v4->_suggestionType = a3;
    if (a3 == 5)
    {
      v6 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[ATXInterruptionManagerTuningSuggestion initWithSuggestionType:](v6);
      }
      goto LABEL_8;
    }
    if (!a3)
    {
      v6 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[ATXInterruptionManagerTuningSuggestion initWithSuggestionType:](v6);
      }
LABEL_8:
    }
  }
  return v5;
}

- (id)feedbackKeyComponent
{
  v2 = NSString;
  int64_t tuningSuggestionType = self->_tuningSuggestionType;
  if (tuningSuggestionType >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_tuningSuggestionType);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E5D070C0[(int)tuningSuggestionType];
  }
  v5 = [v2 stringWithFormat:@"suggestion_type:%@", v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXInterruptionManagerTuningSuggestion *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXInterruptionManagerTuningSuggestion *)self isEqualToATXInterruptionManagerTuningSuggestion:v5];

  return v6;
}

- (BOOL)isEqualToATXInterruptionManagerTuningSuggestion:(id)a3
{
  return self->_tuningSuggestionType == *((void *)a3 + 2);
}

- (unint64_t)hash
{
  return self->_tuningSuggestionType;
}

- (id)description
{
  id v3 = [NSString alloc];
  int64_t tuningSuggestionType = self->_tuningSuggestionType;
  if (tuningSuggestionType >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_tuningSuggestionType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E5D070C0[(int)tuningSuggestionType];
  }
  BOOL v6 = (void *)[v3 initWithFormat:@"Interruption Manager Tuning Suggestion:   Type: %@", v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[ATXInterruptionManagerTuningSuggestion allocWithZone:a3];
  int64_t tuningSuggestionType = self->_tuningSuggestionType;

  return [(ATXInterruptionManagerTuningSuggestion *)v4 initWithSuggestionType:tuningSuggestionType];
}

- (id)encodeAsProto
{
  v2 = [(ATXInterruptionManagerTuningSuggestion *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (ATXInterruptionManagerTuningSuggestion)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[ATXPBInterruptionManagerTuningSuggestion alloc] initWithData:v4];

    self = [(ATXInterruptionManagerTuningSuggestion *)self initWithProto:v5];
    BOOL v6 = self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (ATXInterruptionManagerTuningSuggestion)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if ([v5 hasType])
      {
        self = [(ATXInterruptionManagerTuningSuggestion *)self initWithSuggestionType:(int)[v5 type]];
        BOOL v6 = self;
LABEL_12:

        goto LABEL_13;
      }
      v7 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[ATXInterruptionManagerTuningSuggestion initWithProto:]();
      }
    }
    else
    {
      v5 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXNotificationSmartPauseSuggestion initWithProto:]();
      }
    }
    BOOL v6 = 0;
    goto LABEL_12;
  }
  BOOL v6 = 0;
LABEL_13:

  return v6;
}

- (id)proto
{
  id v3 = objc_opt_new();
  [v3 setType:LODWORD(self->_tuningSuggestionType)];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXInterruptionManagerTuningSuggestion *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXInterruptionManagerTuningSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  BOOL v6 = [(ATXInterruptionManagerTuningSuggestion *)self initWithProtoData:v5];
  return v6;
}

- (id)jsonRawData
{
  v7[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = @"suggestionType";
  int64_t tuningSuggestionType = self->_tuningSuggestionType;
  if (tuningSuggestionType >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", tuningSuggestionType, v6);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5D070C0[(int)tuningSuggestionType];
  }
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (int64_t)tuningSuggestionType
{
  return self->_tuningSuggestionType;
}

- (int)suggestionType
{
  return self->_suggestionType;
}

- (void)initWithSuggestionType:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "Created invalid 'unused' interruption management suggestion", v1, 2u);
}

- (void)initWithSuggestionType:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "Created invalid 'total' interruption management suggestion", v1, 2u);
}

- (void)initWithProto:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v2, v3, "%@: missing 'type' field on protobuf message. Failed to decode.", v4, v5, v6, v7, 2u);
}

@end