@interface ATXNotificationHandleSummaryMetrics
- (ATXNotificationHandleSummaryMetrics)initWithDimensions:(id)a3;
- (double)acceptedNotificationAverageHandleTime;
- (double)acceptedNotificationsPercentage;
- (double)rejectedNotificationAverageHandleTime;
- (double)rejectedNotificationsPercentage;
- (double)unhandledNotificationsPercentage;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (id)popReceiveEventForNotification:(id)a3;
- (unint64_t)acceptedNotificationCount;
- (unint64_t)notificationsReceivedCount;
- (unint64_t)rejectedNotificationCount;
- (void)handleNotificationEvent:(id)a3;
- (void)handleTelemetryResult:(id)a3;
@end

@implementation ATXNotificationHandleSummaryMetrics

- (id)metricName
{
  return @"com.apple.ModeActivity.NotificationHandling.summary";
}

- (ATXNotificationHandleSummaryMetrics)initWithDimensions:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ATXNotificationHandleSummaryMetrics;
  v3 = [(_ATXCoreAnalyticsMetric *)&v8 initWithDimensions:a3];
  v4 = v3;
  if (v3)
  {
    v3->_rejectedNotificationTotalHandleTime = 0.0;
    v3->_acceptedNotificationTotalHandleTime = 0.0;
    v3->_rejectedNotificationCount = 0;
    v3->_acceptedNotificationCount = 0;
    v3->_notificationsReceivedCount = 0;
    uint64_t v5 = objc_opt_new();
    unhandledReceivedNotifications = v4->_unhandledReceivedNotifications;
    v4->_unhandledReceivedNotifications = (NSMutableDictionary *)v5;
  }
  return v4;
}

- (double)rejectedNotificationAverageHandleTime
{
  unint64_t rejectedNotificationCount = self->_rejectedNotificationCount;
  if (rejectedNotificationCount) {
    return self->_rejectedNotificationTotalHandleTime / (double)rejectedNotificationCount;
  }
  else {
    return 0.0;
  }
}

- (double)acceptedNotificationAverageHandleTime
{
  unint64_t acceptedNotificationCount = self->_acceptedNotificationCount;
  if (acceptedNotificationCount) {
    return self->_acceptedNotificationTotalHandleTime / (double)acceptedNotificationCount;
  }
  else {
    return 0.0;
  }
}

- (double)rejectedNotificationsPercentage
{
  unint64_t notificationsReceivedCount = self->_notificationsReceivedCount;
  if (notificationsReceivedCount) {
    return (double)self->_rejectedNotificationCount / (double)notificationsReceivedCount;
  }
  else {
    return 0.0;
  }
}

- (double)acceptedNotificationsPercentage
{
  unint64_t notificationsReceivedCount = self->_notificationsReceivedCount;
  if (notificationsReceivedCount) {
    return (double)self->_acceptedNotificationCount / (double)notificationsReceivedCount;
  }
  else {
    return 0.0;
  }
}

- (double)unhandledNotificationsPercentage
{
  if (self->_notificationsReceivedCount) {
    return (double)(unint64_t)[(NSMutableDictionary *)self->_unhandledReceivedNotifications count]
  }
         / (double)self->_notificationsReceivedCount;
  else {
    return 0.0;
  }
}

- (id)coreAnalyticsDictionary
{
  v19[8] = *MEMORY[0x1E4F143B8];
  v18[0] = @"rejectedNotificationAverageHandleTime";
  v3 = NSNumber;
  [(ATXNotificationHandleSummaryMetrics *)self rejectedNotificationAverageHandleTime];
  v4 = objc_msgSend(v3, "numberWithDouble:");
  v19[0] = v4;
  v18[1] = @"acceptedNotificationAverageHandleTime";
  uint64_t v5 = NSNumber;
  [(ATXNotificationHandleSummaryMetrics *)self acceptedNotificationAverageHandleTime];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  v19[1] = v6;
  v18[2] = @"rejectedNotificationCount";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXNotificationHandleSummaryMetrics rejectedNotificationCount](self, "rejectedNotificationCount"));
  v19[2] = v7;
  v18[3] = @"acceptedNotificationCount";
  objc_super v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXNotificationHandleSummaryMetrics acceptedNotificationCount](self, "acceptedNotificationCount"));
  v19[3] = v8;
  v18[4] = @"notificationsReceivedCount";
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXNotificationHandleSummaryMetrics notificationsReceivedCount](self, "notificationsReceivedCount"));
  v19[4] = v9;
  v18[5] = @"rejectedNotificationsPercentage";
  v10 = NSNumber;
  [(ATXNotificationHandleSummaryMetrics *)self rejectedNotificationsPercentage];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  v19[5] = v11;
  v18[6] = @"acceptedNotificationsPercentage";
  v12 = NSNumber;
  [(ATXNotificationHandleSummaryMetrics *)self acceptedNotificationsPercentage];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  v19[6] = v13;
  v18[7] = @"unhandledNotificationsPercentage";
  v14 = NSNumber;
  [(ATXNotificationHandleSummaryMetrics *)self unhandledNotificationsPercentage];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  v19[7] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:8];

  return v16;
}

- (void)handleTelemetryResult:(id)a3
{
  id v4 = a3;
  ++self->_notificationsReceivedCount;
  id v14 = v4;
  uint64_t v5 = [v4 resolution];
  uint64_t v6 = [v5 resolutionType];

  if (v6)
  {
    v7 = [v14 resolution];
    uint64_t v8 = [v7 resolutionType];

    if (v8 != 1) {
      goto LABEL_6;
    }
    ++self->_rejectedNotificationCount;
    v9 = [v14 resolution];
    v10 = [v9 resolutionTimestamp];
    v11 = [v14 receiveTimestamp];
    [v10 timeIntervalSinceDate:v11];
    self->_unint64_t rejectedNotificationCount = (unint64_t)(v12 + (double)self->_rejectedNotificationCount);
  }
  else
  {
    ++self->_acceptedNotificationCount;
    v9 = [v14 resolution];
    v10 = [v9 resolutionTimestamp];
    v11 = [v14 receiveTimestamp];
    [v10 timeIntervalSinceDate:v11];
    self->_acceptedNotificationTotalHandleTime = v13 + self->_acceptedNotificationTotalHandleTime;
  }

LABEL_6:
}

- (void)handleNotificationEvent:(id)a3
{
  id v13 = a3;
  if ([v13 isReceiveEvent])
  {
    unhandledReceivedNotifications = self->_unhandledReceivedNotifications;
    uint64_t v5 = [v13 notificationId];
    [(NSMutableDictionary *)unhandledReceivedNotifications setObject:v13 forKeyedSubscript:v5];

    ++self->_notificationsReceivedCount;
    goto LABEL_10;
  }
  uint64_t v6 = [(ATXNotificationHandleSummaryMetrics *)self popReceiveEventForNotification:v13];
  if (v6)
  {
    v7 = [v13 eventTime];
    uint64_t v8 = [v6 eventTime];
    [v7 timeIntervalSinceDate:v8];
    double v10 = v9;

    if ([v13 isAcceptEvent])
    {
      v11 = &OBJC_IVAR___ATXNotificationHandleSummaryMetrics__acceptedNotificationCount;
      double v12 = &OBJC_IVAR___ATXNotificationHandleSummaryMetrics__acceptedNotificationTotalHandleTime;
LABEL_8:
      *(double *)((char *)&self->super.super.isa + *v12) = v10 + *(double *)((char *)&self->super.super.isa + *v12);
      ++*(Class *)((char *)&self->super.super.isa + *v11);
      goto LABEL_9;
    }
    if ([v13 isRejectEvent])
    {
      v11 = &OBJC_IVAR___ATXNotificationHandleSummaryMetrics__rejectedNotificationCount;
      double v12 = &OBJC_IVAR___ATXNotificationHandleSummaryMetrics__rejectedNotificationTotalHandleTime;
      goto LABEL_8;
    }
  }
LABEL_9:

LABEL_10:
}

- (id)popReceiveEventForNotification:(id)a3
{
  unhandledReceivedNotifications = self->_unhandledReceivedNotifications;
  id v5 = a3;
  uint64_t v6 = [v5 notificationId];
  v7 = [(NSMutableDictionary *)unhandledReceivedNotifications objectForKeyedSubscript:v6];

  uint64_t v8 = self->_unhandledReceivedNotifications;
  double v9 = [v5 notificationId];

  [(NSMutableDictionary *)v8 removeObjectForKey:v9];
  return v7;
}

- (unint64_t)rejectedNotificationCount
{
  return self->_rejectedNotificationCount;
}

- (unint64_t)acceptedNotificationCount
{
  return self->_acceptedNotificationCount;
}

- (unint64_t)notificationsReceivedCount
{
  return self->_notificationsReceivedCount;
}

- (void).cxx_destruct
{
}

@end