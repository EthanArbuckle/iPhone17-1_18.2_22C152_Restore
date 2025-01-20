@interface ATXNotificationSuggestionInteractionEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXNotificationSuggestionInteractionEvent)initWithProto:(id)a3;
- (ATXNotificationSuggestionInteractionEvent)initWithProtoData:(id)a3;
- (ATXNotificationSuggestionInteractionEvent)initWithSuggestionType:(int64_t)a3 eventType:(int64_t)a4 suggestionUUID:(id)a5 eventDate:(id)a6;
- (BOOL)eventCausesSuggestionInactivity;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXNotificationSuggestionInteractionEvent:(id)a3;
- (NSDate)eventDate;
- (NSUUID)suggestionUUID;
- (id)encodeAsProto;
- (id)json;
- (id)jsonRawData;
- (id)proto;
- (int64_t)eventType;
- (int64_t)suggestionType;
- (unsigned)dataVersion;
@end

@implementation ATXNotificationSuggestionInteractionEvent

- (ATXNotificationSuggestionInteractionEvent)initWithSuggestionType:(int64_t)a3 eventType:(int64_t)a4 suggestionUUID:(id)a5 eventDate:(id)a6
{
  id v12 = a5;
  id v13 = a6;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"ATXNotificationSuggestionInteractionEvent.m", 25, @"Invalid parameter not satisfying: %@", @"suggestionType" object file lineNumber description];

    if (a4)
    {
LABEL_3:
      if (v12) {
        goto LABEL_4;
      }
LABEL_10:
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"ATXNotificationSuggestionInteractionEvent.m", 27, @"Invalid parameter not satisfying: %@", @"suggestionUUID" object file lineNumber description];

      if (v13) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"ATXNotificationSuggestionInteractionEvent.m", 26, @"Invalid parameter not satisfying: %@", @"eventType" object file lineNumber description];

  if (!v12) {
    goto LABEL_10;
  }
LABEL_4:
  if (v13) {
    goto LABEL_5;
  }
LABEL_11:
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"ATXNotificationSuggestionInteractionEvent.m", 28, @"Invalid parameter not satisfying: %@", @"eventDate" object file lineNumber description];

LABEL_5:
  v21.receiver = self;
  v21.super_class = (Class)ATXNotificationSuggestionInteractionEvent;
  v14 = [(ATXNotificationSuggestionInteractionEvent *)&v21 init];
  v15 = v14;
  if (v14)
  {
    v14->_suggestionType = a3;
    v14->_eventType = a4;
    objc_storeStrong((id *)&v14->_suggestionUUID, a5);
    objc_storeStrong((id *)&v15->_eventDate, a6);
  }

  return v15;
}

- (BOOL)eventCausesSuggestionInactivity
{
  return (self->_eventType < 9uLL) & (0x176u >> self->_eventType);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXNotificationSuggestionInteractionEvent *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXNotificationSuggestionInteractionEvent *)self isEqualToATXNotificationSuggestionInteractionEvent:v5];

  return v6;
}

- (BOOL)isEqualToATXNotificationSuggestionInteractionEvent:(id)a3
{
  v4 = (id *)a3;
  if (__PAIR128__([v4 eventType], objc_msgSend(v4, "suggestionType")) != *(_OWORD *)&self->_suggestionType) {
    goto LABEL_4;
  }
  suggestionUUID = self->_suggestionUUID;
  BOOL v6 = (NSUUID *)v4[3];
  if (suggestionUUID == v6)
  {

    goto LABEL_7;
  }
  v7 = v6;
  v8 = suggestionUUID;
  char v9 = [(NSUUID *)v8 isEqual:v7];

  if (v9)
  {
LABEL_7:
    [(NSDate *)self->_eventDate timeIntervalSinceReferenceDate];
    double v13 = v12;
    v14 = [v4 eventDate];
    [v14 timeIntervalSinceReferenceDate];
    BOOL v10 = vabdd_f64(v13, v15) <= 2.22044605e-16;

    goto LABEL_5;
  }
LABEL_4:
  BOOL v10 = 0;
LABEL_5:

  return v10;
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
  v12[4] = *MEMORY[0x1E4F143B8];
  v11[0] = @"suggestionType";
  int64_t suggestionType = self->_suggestionType;
  if (suggestionType >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", suggestionType, v11[0]);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E5D06960[(int)suggestionType];
  }
  v12[0] = v4;
  v11[1] = @"eventType";
  int64_t eventType = self->_eventType;
  if (eventType >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
    BOOL v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v6 = off_1E5D069B8[(int)eventType];
  }
  v12[1] = v6;
  v11[2] = @"suggestionUUID";
  v7 = [(NSUUID *)self->_suggestionUUID UUIDString];
  v11[3] = @"eventDate";
  eventDate = self->_eventDate;
  v12[2] = v7;
  v12[3] = eventDate;
  char v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v9;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(ATXNotificationSuggestionInteractionEvent *)self jsonRawData];
  v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (ATXNotificationSuggestionInteractionEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBNotificationSuggestionInteractionEvent alloc] initWithData:v4];

    self = [(ATXNotificationSuggestionInteractionEvent *)self initWithProto:v5];
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
  v2 = [(ATXNotificationSuggestionInteractionEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXNotificationSuggestionInteractionEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v15 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[ATXDigestTimeline initWithProto:]((uint64_t)self, v15);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  int v6 = -[ATXPBNotificationSuggestionInteractionEvent suggestionType]((uint64_t)v5);
  int v7 = -[ATXPBNotificationSuggestionInteractionEvent eventType]((uint64_t)v5);
  id v8 = objc_alloc(MEMORY[0x1E4F29128]);
  char v9 = -[ATXPBNotificationSuggestionInteractionEvent suggestionUUID]((uint64_t)v5);
  BOOL v10 = (void *)[v8 initWithUUIDString:v9];

  id v11 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  double v12 = -[ATXPBNotificationSuggestionInteractionEvent secondsSinceReferenceDate]((uint64_t)v5);

  double v13 = (void *)[v11 initWithTimeIntervalSinceReferenceDate:v12];
  self = [(ATXNotificationSuggestionInteractionEvent *)self initWithSuggestionType:v6 eventType:v7 suggestionUUID:v10 eventDate:v13];

  v14 = self;
LABEL_8:

  return v14;
}

- (id)proto
{
  v3 = objc_opt_new();
  -[ATXPBNotificationSuggestionInteractionEvent setSuggestionType:]((uint64_t)v3, self->_suggestionType);
  -[ATXPBNotificationSuggestionInteractionEvent setEventType:]((uint64_t)v3, self->_eventType);
  id v4 = [(NSUUID *)self->_suggestionUUID UUIDString];
  -[ATXPBNotificationSuggestionInteractionEvent setSuggestionUUID:]((uint64_t)v3, v4);

  [(NSDate *)self->_eventDate timeIntervalSinceReferenceDate];
  -[ATXPBNotificationSuggestionInteractionEvent setSecondsSinceReferenceDate:]((uint64_t)v3, v5);

  return v3;
}

- (int64_t)suggestionType
{
  return self->_suggestionType;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSUUID)suggestionUUID
{
  return self->_suggestionUUID;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDate, 0);

  objc_storeStrong((id *)&self->_suggestionUUID, 0);
}

@end