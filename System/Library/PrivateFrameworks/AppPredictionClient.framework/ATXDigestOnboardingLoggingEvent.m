@interface ATXDigestOnboardingLoggingEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXDigestOnboardingLoggingEvent)initWithProto:(id)a3;
- (ATXDigestOnboardingLoggingEvent)initWithProtoData:(id)a3;
- (ATXDigestOnboardingLoggingEvent)initWithSessionUUID:(id)a3 entrySource:(int)a4 digestOnboardingOutcome:(int)a5 finalUIShown:(int)a6 didSelectShowMore:(BOOL)a7 timeTaken:(double)a8 deliveryTimes:(id)a9;
- (BOOL)didSelectShowMore;
- (NSArray)deliveryTimes;
- (NSUUID)sessionUUID;
- (double)timeTaken;
- (id)encodeAsProto;
- (id)proto;
- (int)digestOnboardingOutcome;
- (int)entrySource;
- (int)finalUIShown;
- (unsigned)dataVersion;
@end

@implementation ATXDigestOnboardingLoggingEvent

- (ATXDigestOnboardingLoggingEvent)initWithSessionUUID:(id)a3 entrySource:(int)a4 digestOnboardingOutcome:(int)a5 finalUIShown:(int)a6 didSelectShowMore:(BOOL)a7 timeTaken:(double)a8 deliveryTimes:(id)a9
{
  id v17 = a3;
  id v18 = a9;
  v22.receiver = self;
  v22.super_class = (Class)ATXDigestOnboardingLoggingEvent;
  v19 = [(ATXDigestOnboardingLoggingEvent *)&v22 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_sessionUUID, a3);
    v20->_entrySource = a4;
    v20->_digestOnboardingOutcome = a5;
    v20->_finalUIShown = a6;
    v20->_didSelectShowMore = a7;
    v20->_timeTaken = a8;
    objc_storeStrong((id *)&v20->_deliveryTimes, a9);
  }

  return v20;
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

- (ATXDigestOnboardingLoggingEvent)initWithProtoData:(id)a3
{
  id v4 = a3;
  id v5 = [[ATXPBDigestOnboardingLoggingEvent alloc] initWithData:v4];

  v6 = [(ATXDigestOnboardingLoggingEvent *)self initWithProto:v5];
  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXDigestOnboardingLoggingEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXDigestOnboardingLoggingEvent)initWithProto:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = self;
      id v31 = v4;
      id v5 = v4;
      id v6 = objc_alloc(MEMORY[0x1E4F29128]);
      v7 = [v5 sessionUUID];
      v28 = (void *)[v6 initWithUUIDString:v7];

      unsigned int v27 = [v5 entrySource];
      unsigned int v26 = [v5 digestOnboardingOutcome];
      unsigned int v25 = [v5 finalUIShown];
      unsigned int v24 = [v5 didSelectShowMore];
      [v5 timeTaken];
      double v9 = v8;
      v10 = objc_opt_new();
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v29 = v5;
      v11 = [v5 deliveryTimes];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v33 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            id v17 = objc_opt_new();
            id v18 = [v16 componentsSeparatedByString:@":"];
            v19 = [v18 objectAtIndexedSubscript:0];
            objc_msgSend(v17, "setHour:", objc_msgSend(v19, "integerValue"));

            v20 = [v18 objectAtIndexedSubscript:1];
            objc_msgSend(v17, "setMinute:", objc_msgSend(v20, "integerValue"));

            [v10 addObject:v17];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v13);
      }

      self = [(ATXDigestOnboardingLoggingEvent *)v30 initWithSessionUUID:v28 entrySource:v27 digestOnboardingOutcome:v26 finalUIShown:v25 didSelectShowMore:v24 timeTaken:v10 deliveryTimes:v9];
      v21 = self;
      id v4 = v31;
      objc_super v22 = v29;
    }
    else
    {
      objc_super v22 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        -[ATXDigestTimeline initWithProto:]((uint64_t)self, v22);
      }
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)proto
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = [(NSUUID *)self->_sessionUUID UUIDString];
  [v3 setSessionUUID:v4];

  [v3 setEntrySource:self->_entrySource];
  [v3 setDigestOnboardingOutcome:self->_digestOnboardingOutcome];
  [v3 setFinalUIShown:self->_finalUIShown];
  [v3 setDidSelectShowMore:self->_didSelectShowMore];
  uint64_t v13 = v3;
  [v3 setTimeTaken:self->_timeTaken];
  id v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_deliveryTimes;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld:%ld", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "hour"), objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "minute"));
        [v5 addObject:v11];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [v13 setDeliveryTimes:v5];

  return v13;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (int)entrySource
{
  return self->_entrySource;
}

- (int)digestOnboardingOutcome
{
  return self->_digestOnboardingOutcome;
}

- (int)finalUIShown
{
  return self->_finalUIShown;
}

- (BOOL)didSelectShowMore
{
  return self->_didSelectShowMore;
}

- (double)timeTaken
{
  return self->_timeTaken;
}

- (NSArray)deliveryTimes
{
  return self->_deliveryTimes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryTimes, 0);

  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end