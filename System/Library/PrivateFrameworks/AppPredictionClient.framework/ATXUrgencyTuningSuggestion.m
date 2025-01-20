@interface ATXUrgencyTuningSuggestion
+ (BOOL)supportsSecureCoding;
- (ATXUrgencyTuningSuggestion)init;
- (ATXUrgencyTuningSuggestion)initWithCoder:(id)a3;
- (ATXUrgencyTuningSuggestion)initWithProto:(id)a3;
- (ATXUrgencyTuningSuggestion)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXUrgencyTuningSuggestion:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodeAsProto;
- (id)feedbackKeyComponent;
- (id)jsonRawData;
- (id)proto;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXUrgencyTuningSuggestion

- (ATXUrgencyTuningSuggestion)init
{
  v3.receiver = self;
  v3.super_class = (Class)ATXUrgencyTuningSuggestion;
  return [(ATXUrgencyTuningSuggestion *)&v3 init];
}

- (id)feedbackKeyComponent
{
  return &stru_1EFD9B408;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXUrgencyTuningSuggestion *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXUrgencyTuningSuggestion *)self isEqualToATXUrgencyTuningSuggestion:v5];

  return v6;
}

- (BOOL)isEqualToATXUrgencyTuningSuggestion:(id)a3
{
  return 1;
}

- (id)description
{
  return @"Urgency Tuning suggestion";
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = +[ATXUrgencyTuningSuggestion allocWithZone:a3];

  return [(ATXUrgencyTuningSuggestion *)v3 init];
}

- (id)encodeAsProto
{
  v2 = [(ATXUrgencyTuningSuggestion *)self proto];
  objc_super v3 = [v2 data];

  return v3;
}

- (ATXUrgencyTuningSuggestion)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[ATXPBUrgencyTuningSuggestion alloc] initWithData:v4];

    self = [(ATXUrgencyTuningSuggestion *)self initWithProto:v5];
    BOOL v6 = self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (ATXUrgencyTuningSuggestion)initWithProto:(id)a3
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
  self = [(ATXUrgencyTuningSuggestion *)self init];
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
  id v5 = [(ATXUrgencyTuningSuggestion *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXUrgencyTuningSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  BOOL v6 = [(ATXUrgencyTuningSuggestion *)self initWithProtoData:v5];
  return v6;
}

- (id)jsonRawData
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  BOOL v6 = v4;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%@: Unable to construct class from ProtoBuf object", (uint8_t *)&v5, 0xCu);
}

@end