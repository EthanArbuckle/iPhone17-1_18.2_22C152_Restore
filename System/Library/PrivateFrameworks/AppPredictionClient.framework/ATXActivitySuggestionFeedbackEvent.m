@interface ATXActivitySuggestionFeedbackEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXActivity)activity;
- (ATXActivitySuggestionFeedbackEvent)initWithEventDate:(id)a3 activity:(id)a4 acceptedTriggers:(id)a5 eventType:(unint64_t)a6 suggestionType:(unint64_t)a7 location:(unint64_t)a8;
- (ATXActivitySuggestionFeedbackEvent)initWithProto:(id)a3;
- (ATXActivitySuggestionFeedbackEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXActivitySuggestionFeedbackEvent:(id)a3;
- (NSArray)acceptedTriggers;
- (NSDate)eventDate;
- (NSString)description;
- (id)activityDescription;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)eventType;
- (unint64_t)location;
- (unint64_t)suggestionType;
- (unsigned)dataVersion;
@end

@implementation ATXActivitySuggestionFeedbackEvent

- (ATXActivitySuggestionFeedbackEvent)initWithEventDate:(id)a3 activity:(id)a4 acceptedTriggers:(id)a5 eventType:(unint64_t)a6 suggestionType:(unint64_t)a7 location:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v23.receiver = self;
  v23.super_class = (Class)ATXActivitySuggestionFeedbackEvent;
  v18 = [(ATXActivitySuggestionFeedbackEvent *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_eventDate, a3);
    v19->_eventType = a6;
    v19->_suggestionType = a7;
    objc_storeStrong((id *)&v19->_activity, a4);
    uint64_t v20 = [v17 copy];
    acceptedTriggers = v19->_acceptedTriggers;
    v19->_acceptedTriggers = (NSArray *)v20;

    v19->_location = a8;
  }

  return v19;
}

- (ATXActivitySuggestionFeedbackEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[ATXPBActivitySuggestionFeedbackEvent alloc] initWithData:v4];

    self = [(ATXActivitySuggestionFeedbackEvent *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXActivitySuggestionFeedbackEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = __atxlog_handle_default();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[ATXActivitySuggestionFeedbackEvent initWithProto:]((uint64_t)self, v19);
    }

    goto LABEL_7;
  }
  v5 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v6 = v4;
  v28 = (void *)[[v5 alloc] initWithTimeIntervalSinceReferenceDate:-[ATXPBActivitySuggestionFeedbackEvent date]((uint64_t)v6)];
  v7 = -[ATXPBActivitySuggestionFeedbackEvent activity]((uint64_t)v6);
  v26 = [ATXActivity alloc];
  v25 = -[ATXPBActivity modeUUID]((uint64_t)v7);
  uint64_t v24 = (int)-[ATXPBActivity type]((uint64_t)v7);
  uint64_t v23 = -[ATXPBActivity origin]((uint64_t)v7);
  v8 = -[ATXPBActivity originBundleId]((uint64_t)v7);
  v9 = -[ATXPBActivity originAnchorType]((uint64_t)v7);
  v10 = -[ATXPBActivity suggestionUUID]((uint64_t)v7);
  v11 = -[ATXPBActivity serializedTriggers]((uint64_t)v7);
  v12 = ATXDeserializeTriggers();
  uint64_t v13 = -[ATXPBActivity uiLocation]((uint64_t)v7);
  LOBYTE(v22) = -[ATXPBActivity shouldSuggestTriggers]((BOOL)v7);
  LOBYTE(v21) = 0;
  v27 = [(ATXActivity *)v26 initWithModeUUID:v25 userModeName:0 activityType:v24 origin:v23 originBundleId:v8 originAnchorType:v9 allowsSmartEntry:v21 suggestionUUID:v10 triggers:v12 location:v13 shouldSuggestTriggers:v22];

  v14 = -[ATXPBActivitySuggestionFeedbackEvent serializedAcceptedTriggers]((uint64_t)v6);
  id v15 = ATXDeserializeTriggers();
  uint64_t v16 = (int)-[ATXPBActivitySuggestionFeedbackEvent eventType]((uint64_t)v6);
  uint64_t v17 = (int)-[ATXPBActivitySuggestionFeedbackEvent suggestionType]((uint64_t)v6);
  LODWORD(v10) = -[ATXPBActivitySuggestionFeedbackEvent location]((uint64_t)v6);

  self = [(ATXActivitySuggestionFeedbackEvent *)self initWithEventDate:v28 activity:v27 acceptedTriggers:v15 eventType:v16 suggestionType:v17 location:(int)v10];
  v18 = self;
LABEL_8:

  return v18;
}

- (id)proto
{
  v3 = objc_opt_new();
  -[ATXPBActivitySuggestionFeedbackEvent setEventType:]((uint64_t)v3, self->_eventType);
  [(NSDate *)self->_eventDate timeIntervalSinceReferenceDate];
  -[ATXPBActivitySuggestionFeedbackEvent setDate:]((uint64_t)v3, v4);
  -[ATXPBActivitySuggestionFeedbackEvent setSuggestionType:]((uint64_t)v3, self->_suggestionType);
  -[ATXPBActivitySuggestionFeedbackEvent setLocation:]((uint64_t)v3, self->_location);
  v5 = self->_activity;
  id v6 = objc_alloc_init(ATXPBActivity);
  -[ATXPBActivity setUiLocation:]((uint64_t)v6, [(ATXActivity *)v5 location]);
  -[ATXPBActivity setType:]((uint64_t)v6, [(ATXActivity *)v5 activityType]);
  v7 = [(ATXActivity *)v5 modeUUID];
  -[ATXPBActivity setModeUUID:]((uint64_t)v6, v7);

  v8 = [(ATXActivity *)v5 suggestionUUID];
  -[ATXPBActivity setSuggestionUUID:]((uint64_t)v6, v8);

  -[ATXPBActivity setOrigin:]((uint64_t)v6, [(ATXActivity *)v5 origin]);
  v9 = [(ATXActivity *)v5 originBundleId];
  -[ATXPBActivity setOriginBundleId:]((uint64_t)v6, v9);

  v10 = [(ATXActivity *)v5 originAnchorType];
  -[ATXPBActivity setOriginAnchorType:]((uint64_t)v6, v10);

  v11 = [(ATXActivity *)v5 triggers];
  v12 = ATXSerializeTriggers();
  -[ATXPBActivity setSerializedTriggers:]((uint64_t)v6, v12);

  LOBYTE(v11) = [(ATXActivity *)v5 shouldSuggestTriggers];
  -[ATXPBActivity setShouldSuggestTriggers:]((uint64_t)v6, (char)v11);
  -[ATXPBActivitySuggestionFeedbackEvent setActivity:]((uint64_t)v3, v6);

  uint64_t v13 = ATXSerializeTriggers();
  -[ATXPBActivitySuggestionFeedbackEvent setSerializedAcceptedTriggers:]((uint64_t)v3, v13);

  return v3;
}

- (id)encodeAsProto
{
  v2 = [(ATXActivitySuggestionFeedbackEvent *)self proto];
  v3 = [v2 data];

  return v3;
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

- (id)jsonDict
{
  v3 = objc_opt_new();
  double v4 = [(NSDate *)self->_eventDate description];
  [v3 setObject:v4 forKeyedSubscript:@"eventDate"];

  id v5 = [(ATXActivitySuggestionFeedbackEvent *)self activityDescription];
  [v3 setObject:v5 forKeyedSubscript:@"activity"];

  id v6 = [NSNumber numberWithUnsignedInteger:self->_eventType];
  [v3 setObject:v6 forKeyedSubscript:@"eventType"];

  v7 = [NSNumber numberWithUnsignedInteger:self->_suggestionType];
  [v3 setObject:v7 forKeyedSubscript:@"suggestionType"];

  v8 = [NSNumber numberWithUnsignedInteger:self->_location];
  [v3 setObject:v8 forKeyedSubscript:@"location"];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_acceptedTriggers, "count"));
  [v3 setObject:v9 forKeyedSubscript:@"acceptedTriggersCount"];

  return v3;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(ATXActivitySuggestionFeedbackEvent *)self jsonDict];
  double v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (NSString)description
{
  v2 = NSString;
  v3 = [(ATXActivitySuggestionFeedbackEvent *)self jsonDict];
  double v4 = [v2 stringWithFormat:@"%@", v3];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (ATXActivitySuggestionFeedbackEvent *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXActivitySuggestionFeedbackEvent *)self isEqualToATXActivitySuggestionFeedbackEvent:v5];

  return v6;
}

- (BOOL)isEqualToATXActivitySuggestionFeedbackEvent:(id)a3
{
  id v4 = a3;
  unint64_t eventType = self->_eventType;
  if (eventType == [v4 eventType]
    && (unint64_t suggestionType = self->_suggestionType, suggestionType == [v4 suggestionType]))
  {
    eventDate = self->_eventDate;
    v8 = [v4 eventDate];
    if ([(NSDate *)eventDate isEqualToDate:v8])
    {
      activity = self->_activity;
      v10 = [v4 activity];
      if ([(ATXActivity *)activity isEqual:v10])
      {
        unint64_t location = self->_location;
        BOOL v12 = location == [v4 location];
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)activityDescription
{
  v3 = NSString;
  id v4 = [(ATXActivity *)self->_activity modeUUID];
  unint64_t v5 = [(ATXActivity *)self->_activity activityType];
  unint64_t v6 = [(ATXActivity *)self->_activity location];
  BOOL v7 = [(ATXActivity *)self->_activity shouldSuggestTriggers];
  v8 = [(ATXActivity *)self->_activity triggers];
  v9 = [(ATXActivity *)self->_activity suggestionUUID];
  v10 = [(ATXActivity *)self->_activity localizedSuggestionReason];
  v11 = [v3 stringWithFormat:@"<modeUUID = %@, activityType = %lu, unint64_t location = %lu, shouldSuggestTriggers = %d, triggers = %@, suggestionUUID = %@, localizedSuggestionReason = %@>", v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (ATXActivity)activity
{
  return self->_activity;
}

- (NSArray)acceptedTriggers
{
  return self->_acceptedTriggers;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (unint64_t)suggestionType
{
  return self->_suggestionType;
}

- (unint64_t)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptedTriggers, 0);
  objc_storeStrong((id *)&self->_activity, 0);

  objc_storeStrong((id *)&self->_eventDate, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  unint64_t v6 = v4;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBActivitySuggestionFeedbackEvent proto", (uint8_t *)&v5, 0xCu);
}

@end