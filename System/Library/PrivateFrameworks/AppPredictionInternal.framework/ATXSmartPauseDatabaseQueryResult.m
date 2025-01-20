@interface ATXSmartPauseDatabaseQueryResult
+ (id)groupByBundleId:(id)a3;
- (ATXSmartPauseDatabaseQueryResult)initWithBundleId:(id)a3 threadId:(id)a4;
- (NSString)bundleId;
- (NSString)threadId;
- (unint64_t)countLastDayNotifications;
- (unint64_t)countLastDayPositiveEngagements;
- (unint64_t)countLastFiveMinutesNotifications;
- (unint64_t)countLastFiveMinutesPositiveEngagements;
- (unint64_t)countLastHourNotifications;
- (unint64_t)countLastHourPositiveEngagements;
- (unint64_t)countLastWeekNotifications;
- (unint64_t)countLastWeekPositiveEngagements;
- (unint64_t)countNotifications;
- (unint64_t)countPositiveEngagements;
- (void)mergeWithOther:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setCountLastDayNotifications:(unint64_t)a3;
- (void)setCountLastDayPositiveEngagements:(unint64_t)a3;
- (void)setCountLastFiveMinutesNotifications:(unint64_t)a3;
- (void)setCountLastFiveMinutesPositiveEngagements:(unint64_t)a3;
- (void)setCountLastHourNotifications:(unint64_t)a3;
- (void)setCountLastHourPositiveEngagements:(unint64_t)a3;
- (void)setCountLastWeekNotifications:(unint64_t)a3;
- (void)setCountLastWeekPositiveEngagements:(unint64_t)a3;
- (void)setCountNotifications:(unint64_t)a3;
- (void)setCountPositiveEngagements:(unint64_t)a3;
- (void)setThreadId:(id)a3;
@end

@implementation ATXSmartPauseDatabaseQueryResult

- (ATXSmartPauseDatabaseQueryResult)initWithBundleId:(id)a3 threadId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ATXSmartPauseDatabaseQueryResult;
  v8 = [(ATXSmartPauseDatabaseQueryResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(ATXSmartPauseDatabaseQueryResult *)v8 setBundleId:v6];
    [(ATXSmartPauseDatabaseQueryResult *)v9 setThreadId:v7];
  }

  return v9;
}

- (void)mergeWithOther:(id)a3
{
  id v4 = a3;
  -[ATXSmartPauseDatabaseQueryResult setCountLastFiveMinutesNotifications:](self, "setCountLastFiveMinutesNotifications:", -[ATXSmartPauseDatabaseQueryResult countLastFiveMinutesNotifications](self, "countLastFiveMinutesNotifications")+ [v4 countLastFiveMinutesNotifications]);
  -[ATXSmartPauseDatabaseQueryResult setCountLastFiveMinutesPositiveEngagements:](self, "setCountLastFiveMinutesPositiveEngagements:", -[ATXSmartPauseDatabaseQueryResult countLastFiveMinutesPositiveEngagements](self, "countLastFiveMinutesPositiveEngagements")+ [v4 countLastFiveMinutesPositiveEngagements]);
  -[ATXSmartPauseDatabaseQueryResult setCountLastHourNotifications:](self, "setCountLastHourNotifications:", -[ATXSmartPauseDatabaseQueryResult countLastHourNotifications](self, "countLastHourNotifications")+ [v4 countLastHourNotifications]);
  -[ATXSmartPauseDatabaseQueryResult setCountLastHourPositiveEngagements:](self, "setCountLastHourPositiveEngagements:", -[ATXSmartPauseDatabaseQueryResult countLastHourPositiveEngagements](self, "countLastHourPositiveEngagements")+ [v4 countLastHourPositiveEngagements]);
  -[ATXSmartPauseDatabaseQueryResult setCountLastDayNotifications:](self, "setCountLastDayNotifications:", -[ATXSmartPauseDatabaseQueryResult countLastDayNotifications](self, "countLastDayNotifications")+ [v4 countLastDayNotifications]);
  -[ATXSmartPauseDatabaseQueryResult setCountLastDayPositiveEngagements:](self, "setCountLastDayPositiveEngagements:", -[ATXSmartPauseDatabaseQueryResult countLastDayPositiveEngagements](self, "countLastDayPositiveEngagements")+ [v4 countLastDayPositiveEngagements]);
  -[ATXSmartPauseDatabaseQueryResult setCountLastWeekNotifications:](self, "setCountLastWeekNotifications:", -[ATXSmartPauseDatabaseQueryResult countLastWeekNotifications](self, "countLastWeekNotifications")+ [v4 countLastWeekNotifications]);
  -[ATXSmartPauseDatabaseQueryResult setCountLastWeekPositiveEngagements:](self, "setCountLastWeekPositiveEngagements:", -[ATXSmartPauseDatabaseQueryResult countLastWeekPositiveEngagements](self, "countLastWeekPositiveEngagements")+ [v4 countLastWeekPositiveEngagements]);
  -[ATXSmartPauseDatabaseQueryResult setCountNotifications:](self, "setCountNotifications:", -[ATXSmartPauseDatabaseQueryResult countNotifications](self, "countNotifications")+ [v4 countNotifications]);
  uint64_t v5 = [v4 countPositiveEngagements];

  unint64_t v6 = [(ATXSmartPauseDatabaseQueryResult *)self countPositiveEngagements] + v5;
  [(ATXSmartPauseDatabaseQueryResult *)self setCountPositiveEngagements:v6];
}

+ (id)groupByBundleId:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_super v11 = objc_msgSend(v10, "bundleId", (void)v21);

        if (v11)
        {
          v12 = [v10 bundleId];
          v13 = [v4 objectForKeyedSubscript:v12];

          if (!v13)
          {
            v14 = [ATXSmartPauseDatabaseQueryResult alloc];
            v15 = [v10 bundleId];
            v16 = [(ATXSmartPauseDatabaseQueryResult *)v14 initWithBundleId:v15 threadId:0];
            v17 = [v10 bundleId];
            [v4 setObject:v16 forKeyedSubscript:v17];
          }
          v18 = [v10 bundleId];
          v19 = [v4 objectForKeyedSubscript:v18];

          [v19 mergeWithOther:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)threadId
{
  return self->_threadId;
}

- (void)setThreadId:(id)a3
{
}

- (unint64_t)countLastFiveMinutesNotifications
{
  return self->_countLastFiveMinutesNotifications;
}

- (void)setCountLastFiveMinutesNotifications:(unint64_t)a3
{
  self->_countLastFiveMinutesNotifications = a3;
}

- (unint64_t)countLastFiveMinutesPositiveEngagements
{
  return self->_countLastFiveMinutesPositiveEngagements;
}

- (void)setCountLastFiveMinutesPositiveEngagements:(unint64_t)a3
{
  self->_countLastFiveMinutesPositiveEngagements = a3;
}

- (unint64_t)countLastHourNotifications
{
  return self->_countLastHourNotifications;
}

- (void)setCountLastHourNotifications:(unint64_t)a3
{
  self->_countLastHourNotifications = a3;
}

- (unint64_t)countLastHourPositiveEngagements
{
  return self->_countLastHourPositiveEngagements;
}

- (void)setCountLastHourPositiveEngagements:(unint64_t)a3
{
  self->_countLastHourPositiveEngagements = a3;
}

- (unint64_t)countLastDayNotifications
{
  return self->_countLastDayNotifications;
}

- (void)setCountLastDayNotifications:(unint64_t)a3
{
  self->_countLastDayNotifications = a3;
}

- (unint64_t)countLastDayPositiveEngagements
{
  return self->_countLastDayPositiveEngagements;
}

- (void)setCountLastDayPositiveEngagements:(unint64_t)a3
{
  self->_countLastDayPositiveEngagements = a3;
}

- (unint64_t)countLastWeekNotifications
{
  return self->_countLastWeekNotifications;
}

- (void)setCountLastWeekNotifications:(unint64_t)a3
{
  self->_countLastWeekNotifications = a3;
}

- (unint64_t)countLastWeekPositiveEngagements
{
  return self->_countLastWeekPositiveEngagements;
}

- (void)setCountLastWeekPositiveEngagements:(unint64_t)a3
{
  self->_countLastWeekPositiveEngagements = a3;
}

- (unint64_t)countNotifications
{
  return self->_countNotifications;
}

- (void)setCountNotifications:(unint64_t)a3
{
  self->_countNotifications = a3;
}

- (unint64_t)countPositiveEngagements
{
  return self->_countPositiveEngagements;
}

- (void)setCountPositiveEngagements:(unint64_t)a3
{
  self->_countPositiveEngagements = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end