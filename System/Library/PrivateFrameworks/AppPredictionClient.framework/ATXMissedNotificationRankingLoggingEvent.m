@interface ATXMissedNotificationRankingLoggingEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXMissedNotificationRanking)missedNotificationRanking;
- (ATXMissedNotificationRankingLoggingEvent)initWithCoder:(id)a3;
- (ATXMissedNotificationRankingLoggingEvent)initWithMissedNotificationRanking:(id)a3 eventType:(int64_t)a4 timestamp:(double)a5;
- (ATXMissedNotificationRankingLoggingEvent)initWithProto:(id)a3;
- (ATXMissedNotificationRankingLoggingEvent)initWithProtoData:(id)a3;
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
- (void)setMissedNotificationRanking:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ATXMissedNotificationRankingLoggingEvent

- (ATXMissedNotificationRankingLoggingEvent)initWithMissedNotificationRanking:(id)a3 eventType:(int64_t)a4 timestamp:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXMissedNotificationRankingLoggingEvent;
  v10 = [(ATXMissedNotificationRankingLoggingEvent *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_missedNotificationRanking, a3);
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
  id v5 = [(ATXMissedNotificationRankingLoggingEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXMissedNotificationRankingLoggingEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  if (v5)
  {
    self = [(ATXMissedNotificationRankingLoggingEvent *)self initWithProtoData:v5];
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
  v2 = [(ATXMissedNotificationRankingLoggingEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXMissedNotificationRankingLoggingEvent)initWithProto:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXMissedNotificationRankingLoggingEvent;
  id v5 = [(ATXMissedNotificationRankingLoggingEvent *)&v15 init];
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
  v7 = [ATXMissedNotificationRanking alloc];
  v8 = [v6 missedNotificationRanking];
  uint64_t v9 = [(ATXMissedNotificationRanking *)v7 initWithProto:v8];
  missedNotificationRanking = v5->_missedNotificationRanking;
  v5->_missedNotificationRanking = (ATXMissedNotificationRanking *)v9;

  [v6 timestamp];
  v5->_timestamp = v11;
  LODWORD(v7) = [v6 eventType];

  v5->_eventType = (int)v7;
LABEL_5:
  v12 = v5;
LABEL_10:

  return v12;
}

- (ATXMissedNotificationRankingLoggingEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBMissedNotificationRankingLoggingEvent alloc] initWithData:v4];

    self = [(ATXMissedNotificationRankingLoggingEvent *)self initWithProto:v5];
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
  objc_msgSend(v3, "setEventType:", -[ATXMissedNotificationRankingLoggingEvent eventType](self, "eventType"));
  [(ATXMissedNotificationRankingLoggingEvent *)self timestamp];
  objc_msgSend(v3, "setTimestamp:");
  id v4 = [(ATXMissedNotificationRankingLoggingEvent *)self missedNotificationRanking];
  id v5 = [v4 proto];
  [v3 setMissedNotificationRanking:v5];

  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  id v5 = [[ATXPBMissedNotificationRankingLoggingEvent alloc] initFromJSON:v4];

  id v6 = [(ATXMissedNotificationRankingLoggingEvent *)self initWithProto:v5];
  return v6;
}

- (id)jsonRepresentation
{
  v2 = [(ATXMissedNotificationRankingLoggingEvent *)self proto];
  v3 = [v2 jsonRepresentation];

  return v3;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(ATXMissedNotificationRankingLoggingEvent *)self jsonDict];
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

- (ATXMissedNotificationRanking)missedNotificationRanking
{
  return self->_missedNotificationRanking;
}

- (void)setMissedNotificationRanking:(id)a3
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