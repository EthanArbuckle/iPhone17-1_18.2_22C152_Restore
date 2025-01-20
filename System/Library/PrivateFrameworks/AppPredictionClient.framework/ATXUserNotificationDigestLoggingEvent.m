@interface ATXUserNotificationDigestLoggingEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXUserNotificationDigest)notificationDigest;
- (ATXUserNotificationDigestLoggingEvent)initWithCoder:(id)a3;
- (ATXUserNotificationDigestLoggingEvent)initWithNotificationDigest:(id)a3 eventType:(int64_t)a4 timestamp:(double)a5;
- (ATXUserNotificationDigestLoggingEvent)initWithProto:(id)a3;
- (ATXUserNotificationDigestLoggingEvent)initWithProtoData:(id)a3;
- (double)timestamp;
- (id)encodeAsProto;
- (id)initFromJSON:(id)a3;
- (id)json;
- (id)jsonRepresentation;
- (id)proto;
- (int64_t)eventType;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setEventType:(int64_t)a3;
- (void)setNotificationDigest:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ATXUserNotificationDigestLoggingEvent

- (ATXUserNotificationDigestLoggingEvent)initWithNotificationDigest:(id)a3 eventType:(int64_t)a4 timestamp:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXUserNotificationDigestLoggingEvent;
  v10 = [(ATXUserNotificationDigestLoggingEvent *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_notificationDigest, a3);
    v11->_eventType = a4;
    v11->_timestamp = a5;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXUserNotificationDigestLoggingEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXUserNotificationDigestLoggingEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  if (v5)
  {
    self = [(ATXUserNotificationDigestLoggingEvent *)self initWithProtoData:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXUserNotificationDigestLoggingEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXUserNotificationDigestLoggingEvent)initWithProto:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXUserNotificationDigestLoggingEvent;
  id v5 = [(ATXUserNotificationDigestLoggingEvent *)&v15 init];
  if (!v5) {
    goto LABEL_5;
  }
  if (!v4)
  {
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v13 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[ATXDigestTimeline initWithProto:]((uint64_t)v5, v13);
    }

    goto LABEL_9;
  }
  id v6 = v4;
  v7 = [ATXUserNotificationDigest alloc];
  v8 = [v6 digest];
  uint64_t v9 = [(ATXUserNotificationDigest *)v7 initWithProto:v8];
  notificationDigest = v5->_notificationDigest;
  v5->_notificationDigest = (ATXUserNotificationDigest *)v9;

  [v6 timestamp];
  v5->_timestamp = v11;
  LODWORD(v7) = [v6 eventType];

  v5->_eventType = (int)v7;
LABEL_5:
  v12 = v5;
LABEL_10:

  return v12;
}

- (ATXUserNotificationDigestLoggingEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBUserNotificationDigestLoggingEvent alloc] initWithData:v4];

    self = [(ATXUserNotificationDigestLoggingEvent *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  objc_msgSend(v3, "setEventType:", -[ATXUserNotificationDigestLoggingEvent eventType](self, "eventType"));
  [(ATXUserNotificationDigestLoggingEvent *)self timestamp];
  objc_msgSend(v3, "setTimestamp:");
  id v4 = [(ATXUserNotificationDigestLoggingEvent *)self notificationDigest];
  id v5 = [v4 proto];
  [v3 setDigest:v5];

  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  id v5 = [[ATXPBUserNotificationDigestLoggingEvent alloc] initFromJSON:v4];

  id v6 = [(ATXUserNotificationDigestLoggingEvent *)self initWithProto:v5];
  return v6;
}

- (id)jsonRepresentation
{
  v2 = [(ATXUserNotificationDigestLoggingEvent *)self proto];
  v3 = [v2 jsonRepresentation];

  return v3;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(ATXUserNotificationDigestLoggingEvent *)self jsonDict];
  id v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v5 = a3;
    id v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (ATXUserNotificationDigest)notificationDigest
{
  return self->_notificationDigest;
}

- (void)setNotificationDigest:(id)a3
{
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
}

@end