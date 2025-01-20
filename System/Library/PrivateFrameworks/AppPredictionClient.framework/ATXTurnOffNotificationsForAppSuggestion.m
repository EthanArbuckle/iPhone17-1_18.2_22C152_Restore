@interface ATXTurnOffNotificationsForAppSuggestion
+ (BOOL)supportsSecureCoding;
- (ATXTurnOffNotificationsForAppSuggestion)initWithCoder:(id)a3;
- (ATXTurnOffNotificationsForAppSuggestion)initWithProto:(id)a3;
- (ATXTurnOffNotificationsForAppSuggestion)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXTurnOffNotificationsForAppSuggestion:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodeAsProto;
- (id)feedbackKeyComponent;
- (id)jsonRawData;
- (id)proto;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXTurnOffNotificationsForAppSuggestion

- (id)feedbackKeyComponent
{
  return &stru_1EFD9B408;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXTurnOffNotificationsForAppSuggestion *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXTurnOffNotificationsForAppSuggestion *)self isEqualToATXTurnOffNotificationsForAppSuggestion:v5];

  return v6;
}

- (BOOL)isEqualToATXTurnOffNotificationsForAppSuggestion:(id)a3
{
  return 1;
}

- (id)description
{
  return @"Turn Off Notifications For App Suggestion";
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = +[ATXTurnOffNotificationsForAppSuggestion allocWithZone:a3];

  return [(ATXTurnOffNotificationsForAppSuggestion *)v3 init];
}

- (id)encodeAsProto
{
  v2 = [(ATXTurnOffNotificationsForAppSuggestion *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXTurnOffNotificationsForAppSuggestion)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[ATXPBTurnOffNotificationsForAppSuggestion alloc] initWithData:v4];

    self = [(ATXTurnOffNotificationsForAppSuggestion *)self initWithProto:v5];
    BOOL v6 = self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (ATXTurnOffNotificationsForAppSuggestion)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v6 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[ATXUrgencyTuningSuggestion initWithProto:]((uint64_t)self, v6);
    }

    goto LABEL_7;
  }
  self = [(ATXTurnOffNotificationsForAppSuggestion *)self init];
  v5 = self;
LABEL_8:

  return v5;
}

- (id)proto
{
  v2 = objc_opt_new();

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXTurnOffNotificationsForAppSuggestion *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXTurnOffNotificationsForAppSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  BOOL v6 = [(ATXTurnOffNotificationsForAppSuggestion *)self initWithProtoData:v5];
  return v6;
}

- (id)jsonRawData
{
  return (id)MEMORY[0x1E4F1CC08];
}

@end