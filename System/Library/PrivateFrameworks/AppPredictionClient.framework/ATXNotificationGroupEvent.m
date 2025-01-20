@interface ATXNotificationGroupEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXNotificationGroupEvent)initWithEventType:(int64_t)a3 uuid:(id)a4 eventDate:(id)a5;
- (ATXNotificationGroupEvent)initWithProto:(id)a3;
- (ATXNotificationGroupEvent)initWithProtoData:(id)a3;
- (NSDate)eventDate;
- (NSUUID)uuid;
- (id)encodeAsProto;
- (id)json;
- (id)jsonRawData;
- (id)proto;
- (int64_t)eventType;
- (unsigned)dataVersion;
@end

@implementation ATXNotificationGroupEvent

- (ATXNotificationGroupEvent)initWithEventType:(int64_t)a3 uuid:(id)a4 eventDate:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (a3)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"ATXNotificationGroupEvent.m", 21, @"Invalid parameter not satisfying: %@", @"eventType" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"ATXNotificationGroupEvent.m", 22, @"Invalid parameter not satisfying: %@", @"eventDate" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)ATXNotificationGroupEvent;
  v13 = [(ATXNotificationGroupEvent *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_eventType = a3;
    objc_storeStrong((id *)&v13->_uuid, a4);
    objc_storeStrong((id *)&v14->_eventDate, a5);
  }

  return v14;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (id)jsonRawData
{
  v10[3] = *MEMORY[0x1E4F143B8];
  uuid = self->_uuid;
  if (uuid)
  {
    v4 = [(NSUUID *)uuid UUIDString];
  }
  else
  {
    v4 = @"nil";
  }
  v9[0] = @"eventType";
  int64_t eventType = self->_eventType;
  if (eventType >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType, v9[0]);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E5D06178[(int)eventType];
  }
  v10[0] = v6;
  v10[1] = v4;
  v9[1] = @"uuid";
  v9[2] = @"eventDate";
  v10[2] = self->_eventDate;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(ATXNotificationGroupEvent *)self jsonRawData];
  v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (ATXNotificationGroupEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBNotificationGroupEvent alloc] initWithData:v4];

    self = [(ATXNotificationGroupEvent *)self initWithProto:v5];
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
  v2 = [(ATXNotificationGroupEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXNotificationGroupEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[ATXDigestTimeline initWithProto:]((uint64_t)self, v14);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  int v6 = -[ATXPBNotificationGroupEvent eventType]((uint64_t)v5);
  id v7 = objc_alloc(MEMORY[0x1E4F29128]);
  v8 = -[ATXPBNotificationGroupEvent uuid]((uint64_t)v5);
  v9 = (void *)[v7 initWithUUIDString:v8];

  id v10 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  double v11 = -[ATXPBNotificationGroupEvent secondsSinceReferenceDate]((uint64_t)v5);

  v12 = (void *)[v10 initWithTimeIntervalSinceReferenceDate:v11];
  self = [(ATXNotificationGroupEvent *)self initWithEventType:v6 uuid:v9 eventDate:v12];

  v13 = self;
LABEL_8:

  return v13;
}

- (id)proto
{
  v3 = objc_opt_new();
  -[ATXPBNotificationGroupEvent setEventType:]((uint64_t)v3, self->_eventType);
  id v4 = [(NSUUID *)self->_uuid UUIDString];
  -[ATXPBNotificationGroupEvent setUuid:]((uint64_t)v3, v4);

  [(NSDate *)self->_eventDate timeIntervalSinceReferenceDate];
  -[ATXPBNotificationGroupEvent setSecondsSinceReferenceDate:]((uint64_t)v3, v5);

  return v3;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDate, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end