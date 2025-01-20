@interface TTRComplicationTimelineModelEntry
- (NSDate)startDate;
- (TTRComplicationReminder)representativeReminder;
- (TTRComplicationTimelineModelEntry)initWithStartDate:(id)a3 overdueCount:(int64_t)a4 remainingDueTodayCount:(int64_t)a5 representativeReminder:(id)a6;
- (id)description;
- (int64_t)overdueCount;
- (int64_t)remainingDueTodayCount;
@end

@implementation TTRComplicationTimelineModelEntry

- (TTRComplicationTimelineModelEntry)initWithStartDate:(id)a3 overdueCount:(int64_t)a4 remainingDueTodayCount:(int64_t)a5 representativeReminder:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)TTRComplicationTimelineModelEntry;
  v12 = [(TTRComplicationTimelineModelEntry *)&v16 init];
  if (v12)
  {
    v13 = (NSDate *)[v10 copy];
    startDate = v12->_startDate;
    v12->_startDate = v13;

    v12->_overdueCount = a4;
    v12->_remainingDueTodayCount = a5;
    objc_storeStrong((id *)&v12->_representativeReminder, a6);
  }

  return v12;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(TTRComplicationTimelineModelEntry *)self startDate];
  int64_t v5 = [(TTRComplicationTimelineModelEntry *)self overdueCount];
  int64_t v6 = [(TTRComplicationTimelineModelEntry *)self remainingDueTodayCount];
  v7 = [(TTRComplicationTimelineModelEntry *)self representativeReminder];
  v8 = +[NSString stringWithFormat:@"<%@ %p: startDate=%@, overdueCount=%ld, remainingDueTodayCount=%ld, representativeReminder=%@>", v3, self, v4, v5, v6, v7];

  return v8;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (int64_t)overdueCount
{
  return self->_overdueCount;
}

- (int64_t)remainingDueTodayCount
{
  return self->_remainingDueTodayCount;
}

- (TTRComplicationReminder)representativeReminder
{
  return self->_representativeReminder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representativeReminder, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end