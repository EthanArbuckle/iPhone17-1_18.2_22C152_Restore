@interface ATXUnifiedModeStreamModeEventProvider
- (BOOL)isEventFromProvider:(id)a3;
- (id)aggregationEventsFromEvent:(id)a3;
- (id)biomePublisherWithBookmark:(id)a3;
- (id)dateIntervalFromEvent:(id)a3;
@end

@implementation ATXUnifiedModeStreamModeEventProvider

- (id)biomePublisherWithBookmark:(id)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-2419200.0];
  v5 = objc_opt_new();
  [v4 timeIntervalSinceReferenceDate];
  v6 = objc_msgSend(v5, "sessionPublisherFromStartTime:");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__ATXUnifiedModeStreamModeEventProvider_biomePublisherWithBookmark___block_invoke;
  v9[3] = &unk_1E68B5DC0;
  v9[4] = self;
  v7 = [v6 filterWithIsIncluded:v9];

  return v7;
}

BOOL __68__ATXUnifiedModeStreamModeEventProvider_biomePublisherWithBookmark___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 inferredActivityType];
  [*(id *)(a1 + 32) mode];
  return v3 == ATXActivityTypeFromMode();
}

- (BOOL)isEventFromProvider:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)aggregationEventsFromEvent:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ATXUnifiedModeStreamModeEventProvider *)self isEventFromProvider:v4])
  {
    v5 = [(ATXUnifiedModeStreamModeEventProvider *)self dateIntervalFromEvent:v4];
    if (v5)
    {
      v6 = [ATXModeEvent alloc];
      v7 = [v5 startDate];
      v8 = [v5 endDate];
      v9 = [(ATXModeEvent *)v6 initWithStartDate:v7 endDate:v8];

      v12[0] = v9;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)dateIntervalFromEvent:(id)a3
{
  id v4 = a3;
  if ([(ATXUnifiedModeStreamModeEventProvider *)self isEventFromProvider:v4])
  {
    v5 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v6 = v4;
    id v7 = [v5 alloc];
    [v6 startTime];
    v8 = objc_msgSend(v7, "initWithTimeIntervalSinceReferenceDate:");
    id v9 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v6 endTime];
    double v11 = v10;

    v12 = (void *)[v9 initWithTimeIntervalSinceReferenceDate:v11];
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v12];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end