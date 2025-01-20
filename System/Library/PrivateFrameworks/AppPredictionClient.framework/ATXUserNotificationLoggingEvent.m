@interface ATXUserNotificationLoggingEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXUserNotification)notification;
- (ATXUserNotificationLoggingEvent)initWithCoder:(id)a3;
- (ATXUserNotificationLoggingEvent)initWithProto:(id)a3;
- (ATXUserNotificationLoggingEvent)initWithProtoData:(id)a3;
- (BOOL)eventCausesNotificationInactivity;
- (BOOL)eventCausesNotificationNonprominence;
- (BOOL)isDeliveredInPrioritySection;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXUserNotificationLoggingEvent:(id)a3;
- (BOOL)isReceiveEvent;
- (NSString)description;
- (NSUUID)modeUUID;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsProto;
- (id)initFromJSON:(id)a3;
- (id)initFromUserNotification:(id)a3 eventType:(int64_t)a4 timestamp:(double)a5;
- (id)initFromUserNotification:(id)a3 eventType:(int64_t)a4 timestamp:(double)a5 deliveryReason:(unint64_t)a6;
- (id)initFromUserNotification:(id)a3 eventType:(int64_t)a4 timestamp:(double)a5 deliveryReason:(unint64_t)a6 deliveryUI:(unint64_t)a7;
- (id)initFromUserNotification:(id)a3 eventType:(int64_t)a4 timestamp:(double)a5 deliveryReason:(unint64_t)a6 deliveryUI:(unint64_t)a7 modeUUID:(id)a8;
- (id)json;
- (id)jsonRepresentation;
- (id)proto;
- (int64_t)eventType;
- (unint64_t)deliveryReason;
- (unint64_t)deliveryUI;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXUserNotificationLoggingEvent

- (id)initFromUserNotification:(id)a3 eventType:(int64_t)a4 timestamp:(double)a5
{
  return [(ATXUserNotificationLoggingEvent *)self initFromUserNotification:a3 eventType:a4 timestamp:0 deliveryReason:a5];
}

- (id)initFromUserNotification:(id)a3 eventType:(int64_t)a4 timestamp:(double)a5 deliveryReason:(unint64_t)a6
{
  return [(ATXUserNotificationLoggingEvent *)self initFromUserNotification:a3 eventType:a4 timestamp:a6 deliveryReason:5 deliveryUI:a5];
}

- (id)initFromUserNotification:(id)a3 eventType:(int64_t)a4 timestamp:(double)a5 deliveryReason:(unint64_t)a6 deliveryUI:(unint64_t)a7
{
  v12 = (void *)MEMORY[0x1E4F93650];
  id v13 = a3;
  v14 = [v12 currentModeUUID];
  id v15 = [(ATXUserNotificationLoggingEvent *)self initFromUserNotification:v13 eventType:a4 timestamp:a6 deliveryReason:a7 deliveryUI:v14 modeUUID:a5];

  return v15;
}

- (id)initFromUserNotification:(id)a3 eventType:(int64_t)a4 timestamp:(double)a5 deliveryReason:(unint64_t)a6 deliveryUI:(unint64_t)a7 modeUUID:(id)a8
{
  id v14 = a3;
  id v15 = a8;
  v20.receiver = self;
  v20.super_class = (Class)ATXUserNotificationLoggingEvent;
  v16 = [(ATXUserNotificationLoggingEvent *)&v20 init];
  if (v16)
  {
    uint64_t v17 = [v14 copy];
    notification = v16->_notification;
    v16->_notification = (ATXUserNotification *)v17;

    v16->_eventType = a4;
    v16->_timestamp = a5;
    v16->_deliveryReason = a6;
    v16->_deliveryUI = a7;
    objc_storeStrong((id *)&v16->_modeUUID, a8);
  }

  return v16;
}

- (BOOL)isReceiveEvent
{
  return (self->_eventType < 0x12uLL) & (0x30001u >> self->_eventType);
}

- (BOOL)eventCausesNotificationNonprominence
{
  unint64_t eventType = self->_eventType;
  BOOL v3 = eventType > 0x11;
  uint64_t v4 = (1 << eventType) & 0x20440;
  return !v3 && v4 != 0
      || [(ATXUserNotificationLoggingEvent *)self eventCausesNotificationInactivity];
}

- (BOOL)eventCausesNotificationInactivity
{
  return (self->_eventType < 0x13uLL) & (0x4077Eu >> self->_eventType);
}

- (BOOL)isDeliveredInPrioritySection
{
  return self->_eventType == 16 && [(ATXUserNotification *)self->_notification priorityStatus] == 1;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXUserNotificationLoggingEvent *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXUserNotificationLoggingEvent *)self isEqualToATXUserNotificationLoggingEvent:v5];

  return v6;
}

- (BOOL)isEqualToATXUserNotificationLoggingEvent:(id)a3
{
  uint64_t v4 = (id *)a3;
  notification = self->_notification;
  BOOL v6 = (ATXUserNotification *)v4[1];
  if (notification == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = notification;
    BOOL v9 = [(ATXUserNotification *)v8 isEqual:v7];

    if (!v9) {
      goto LABEL_9;
    }
  }
  if (self->_eventType != v4[2])
  {
LABEL_9:
    BOOL v11 = 0;
    goto LABEL_10;
  }
  double v10 = self->_timestamp - *((double *)v4 + 3);
  if (v10 < 0.0) {
    double v10 = -v10;
  }
  BOOL v11 = v10 <= 0.1;
LABEL_10:

  return v11;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  notification = self->_notification;
  int64_t eventType = self->_eventType;
  if (eventType >= 0x1C)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
    BOOL v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v6 = off_1E5D06338[(int)eventType];
  }
  double timestamp = self->_timestamp;
  unint64_t deliveryReason = self->_deliveryReason;
  if (deliveryReason >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_deliveryReason);
    BOOL v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = off_1E5D06418[(int)deliveryReason];
  }
  unint64_t deliveryUI = self->_deliveryUI;
  if (deliveryUI >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_deliveryUI);
    BOOL v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = off_1E5D06458[(int)deliveryUI];
  }
  v12 = [(NSUUID *)self->_modeUUID UUIDString];
  id v13 = (void *)[v3 initWithFormat:@"Notification event: user notification: %@, event: %@, timestamp: %f, deliveryReason: %@, deliveryUI: %@, mode: %@", notification, v6, *(void *)&timestamp, v9, v11, v12];

  return (NSString *)v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[ATXUserNotificationLoggingEvent allocWithZone:a3];
  notification = self->_notification;
  int64_t eventType = self->_eventType;
  double timestamp = self->_timestamp;
  unint64_t deliveryReason = self->_deliveryReason;
  unint64_t deliveryUI = self->_deliveryUI;
  modeUUID = self->_modeUUID;

  return [(ATXUserNotificationLoggingEvent *)v4 initFromUserNotification:notification eventType:eventType timestamp:deliveryReason deliveryReason:deliveryUI deliveryUI:modeUUID modeUUID:timestamp];
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  id v5 = [[ATXPBUserNotificationLoggingEvent alloc] initFromJSON:v4];

  BOOL v6 = [(ATXUserNotificationLoggingEvent *)self initWithProto:v5];
  return v6;
}

- (id)jsonRepresentation
{
  v2 = [(ATXUserNotificationLoggingEvent *)self proto];
  id v3 = [v2 jsonRepresentation];

  return v3;
}

- (id)json
{
  return +[ATXJSONHelper unwrapData:self];
}

- (ATXUserNotificationLoggingEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBUserNotificationLoggingEvent alloc] initWithData:v4];

    self = [(ATXUserNotificationLoggingEvent *)self initWithProto:v5];
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
  v2 = [(ATXUserNotificationLoggingEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (ATXUserNotificationLoggingEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL v6 = [v5 notification];

      if (!v6)
      {
LABEL_14:

        goto LABEL_15;
      }
      v7 = [v5 notification];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        BOOL v9 = [ATXUserNotification alloc];
        double v10 = [v5 notification];
        BOOL v11 = [(ATXUserNotification *)v9 initWithProto:v10];

        uint64_t v12 = (int)[v5 eventType];
        [v5 timestamp];
        double v14 = v13;
        uint64_t v15 = (int)[v5 deliveryReason];
        uint64_t v16 = (int)[v5 deliveryUI];
        uint64_t v17 = [v5 modeIdentifier];
        if (v17)
        {
          id v18 = objc_alloc(MEMORY[0x1E4F29128]);
          v19 = [v5 modeIdentifier];
          objc_super v20 = (void *)[v18 initWithUUIDString:v19];
          self = (ATXUserNotificationLoggingEvent *)[(ATXUserNotificationLoggingEvent *)self initFromUserNotification:v11 eventType:v12 timestamp:v15 deliveryReason:v16 deliveryUI:v20 modeUUID:v14];
        }
        else
        {
          self = (ATXUserNotificationLoggingEvent *)[(ATXUserNotificationLoggingEvent *)self initFromUserNotification:v11 eventType:v12 timestamp:v15 deliveryReason:v16 deliveryUI:0 modeUUID:v14];
        }

        BOOL v6 = self;
        goto LABEL_14;
      }
      v21 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        -[ATXMissedNotificationRanking initWithProto:]();
      }
    }
    else
    {
      id v5 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXMissedNotificationRanking initWithProto:]();
      }
    }
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = 0;
LABEL_15:

  return v6;
}

- (id)proto
{
  id v3 = objc_opt_new();
  id v4 = [(ATXUserNotification *)self->_notification proto];
  [v3 setNotification:v4];

  [v3 setEventType:LODWORD(self->_eventType)];
  [v3 setTimestamp:self->_timestamp];
  id v5 = [(NSUUID *)self->_modeUUID UUIDString];
  [v3 setModeIdentifier:v5];

  [v3 setDeliveryReason:LODWORD(self->_deliveryReason)];
  [v3 setDeliveryUI:LODWORD(self->_deliveryUI)];

  return v3;
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  BOOL v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXUserNotificationLoggingEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXUserNotificationLoggingEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  if (v5)
  {
    self = [(ATXUserNotificationLoggingEvent *)self initWithProtoData:v5];
    BOOL v6 = self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (ATXUserNotification)notification
{
  return self->_notification;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSUUID)modeUUID
{
  return self->_modeUUID;
}

- (unint64_t)deliveryReason
{
  return self->_deliveryReason;
}

- (unint64_t)deliveryUI
{
  return self->_deliveryUI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeUUID, 0);

  objc_storeStrong((id *)&self->_notification, 0);
}

@end