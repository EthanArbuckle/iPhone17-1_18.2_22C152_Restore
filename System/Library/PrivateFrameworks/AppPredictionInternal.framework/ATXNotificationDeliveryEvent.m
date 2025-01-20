@interface ATXNotificationDeliveryEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXNotificationDeliveryEvent)initWithDeliveryUI:(unint64_t)a3 suggestionUUIDs:(id)a4;
- (ATXNotificationDeliveryEvent)initWithProto:(id)a3;
- (ATXNotificationDeliveryEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXNotificationDeliveryEvent:(id)a3;
- (NSArray)suggestionUUIDs;
- (id)encodeAsProto;
- (id)json;
- (id)jsonRawData;
- (id)proto;
- (unint64_t)deliveryUI;
- (unsigned)dataVersion;
@end

@implementation ATXNotificationDeliveryEvent

- (ATXNotificationDeliveryEvent)initWithDeliveryUI:(unint64_t)a3 suggestionUUIDs:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ATXNotificationDeliveryEvent;
  v8 = [(ATXNotificationDeliveryEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_deliveryUI = a3;
    objc_storeStrong((id *)&v8->_suggestionUUIDs, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXNotificationDeliveryEvent *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXNotificationDeliveryEvent *)self isEqualToATXNotificationDeliveryEvent:v5];

  return v6;
}

- (BOOL)isEqualToATXNotificationDeliveryEvent:(id)a3
{
  v4 = a3;
  if ([v4 deliveryUI] == self->_deliveryUI)
  {
    v5 = self->_suggestionUUIDs;
    BOOL v6 = v5;
    if (v5 == (NSArray *)v4[2]) {
      char v7 = 1;
    }
    else {
      char v7 = -[NSArray isEqual:](v5, "isEqual:");
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  BOOL v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (id)jsonRawData
{
  v10[2] = *MEMORY[0x1E4F143B8];
  suggestionUUIDs = self->_suggestionUUIDs;
  if (suggestionUUIDs)
  {
    v4 = [(NSArray *)suggestionUUIDs description];
  }
  else
  {
    v4 = @"nil";
  }
  v9[0] = @"deliveryUI";
  unint64_t deliveryUI = self->_deliveryUI;
  if (deliveryUI >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_deliveryUI, v9[0]);
    BOOL v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v6 = off_1E68B3F10[(int)deliveryUI];
  }
  v9[1] = @"suggestionUUIDs";
  v10[0] = v6;
  v10[1] = v4;
  char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(ATXNotificationDeliveryEvent *)self jsonRawData];
  v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (ATXNotificationDeliveryEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBNotificationDeliveryEvent alloc] initWithData:v4];

    self = [(ATXNotificationDeliveryEvent *)self initWithProto:v5];
    BOOL v6 = self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXNotificationDeliveryEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXNotificationDeliveryEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[ATXMinimalAction initWithProto:]((uint64_t)self, v10);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  int v6 = [v5 deliveryUI];
  char v7 = [v5 suggestionUUIDs];

  v8 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_174);
  self = [(ATXNotificationDeliveryEvent *)self initWithDeliveryUI:v6 suggestionUUIDs:v8];

  v9 = self;
LABEL_8:

  return v9;
}

id __46__ATXNotificationDeliveryEvent_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (id)proto
{
  id v3 = objc_opt_new();
  [v3 setDeliveryUI:LODWORD(self->_deliveryUI)];
  id v4 = [(NSArray *)self->_suggestionUUIDs _pas_mappedArrayWithTransform:&__block_literal_global_19_0];
  id v5 = (void *)[v4 mutableCopy];
  [v3 setSuggestionUUIDs:v5];

  return v3;
}

uint64_t __37__ATXNotificationDeliveryEvent_proto__block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (unint64_t)deliveryUI
{
  return self->_deliveryUI;
}

- (NSArray)suggestionUUIDs
{
  return self->_suggestionUUIDs;
}

- (void).cxx_destruct
{
}

@end