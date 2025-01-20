@interface ATXDigestOnboardingSuggestionLoggingEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXDigestOnboardingSuggestionLoggingEvent)initWithProto:(id)a3;
- (ATXDigestOnboardingSuggestionLoggingEvent)initWithProtoData:(id)a3;
- (ATXDigestOnboardingSuggestionLoggingEvent)initWithSessionUUID:(id)a3 outcome:(int)a4 timeToResolution:(double)a5;
- (NSUUID)sessionUUID;
- (double)timeToResolution;
- (id)encodeAsProto;
- (id)proto;
- (int)outcome;
- (unsigned)dataVersion;
@end

@implementation ATXDigestOnboardingSuggestionLoggingEvent

- (ATXDigestOnboardingSuggestionLoggingEvent)initWithSessionUUID:(id)a3 outcome:(int)a4 timeToResolution:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXDigestOnboardingSuggestionLoggingEvent;
  v10 = [(ATXDigestOnboardingSuggestionLoggingEvent *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_sessionUUID, a3);
    v11->_outcome = a4;
    v11->_timeToResolution = a5;
  }

  return v11;
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

- (ATXDigestOnboardingSuggestionLoggingEvent)initWithProtoData:(id)a3
{
  id v4 = a3;
  id v5 = [[ATXPBDigestOnboardingSuggestionLoggingEvent alloc] initWithData:v4];

  v6 = [(ATXDigestOnboardingSuggestionLoggingEvent *)self initWithProto:v5];
  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXDigestOnboardingSuggestionLoggingEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXDigestOnboardingSuggestionLoggingEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    objc_super v13 = 0;
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
  id v5 = (objc_class *)MEMORY[0x1E4F29128];
  id v6 = v4;
  id v7 = [v5 alloc];
  v8 = [v6 sessionUUID];
  id v9 = (void *)[v7 initWithUUIDString:v8];

  uint64_t v10 = [v6 digestOnboardingSuggestionOutcome];
  [v6 timeToResolution];
  double v12 = v11;

  self = [(ATXDigestOnboardingSuggestionLoggingEvent *)self initWithSessionUUID:v9 outcome:v10 timeToResolution:v12];
  objc_super v13 = self;
LABEL_8:

  return v13;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(NSUUID *)self->_sessionUUID UUIDString];
  [v3 setSessionUUID:v4];

  [v3 setDigestOnboardingSuggestionOutcome:self->_outcome];
  [v3 setTimeToResolution:self->_timeToResolution];

  return v3;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (int)outcome
{
  return self->_outcome;
}

- (double)timeToResolution
{
  return self->_timeToResolution;
}

- (void).cxx_destruct
{
}

@end