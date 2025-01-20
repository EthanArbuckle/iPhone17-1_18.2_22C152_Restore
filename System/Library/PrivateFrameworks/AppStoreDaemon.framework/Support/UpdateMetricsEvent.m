@interface UpdateMetricsEvent
- (UpdateMetricsEvent)initWithTopic:(id)a3;
- (id)description;
@end

@implementation UpdateMetricsEvent

- (UpdateMetricsEvent)initWithTopic:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UpdateMetricsEvent;
  v3 = [(UpdateMetricsEvent *)&v7 initWithTopic:a3];
  v4 = v3;
  if (v3)
  {
    [(UpdateMetricsEvent *)v3 setEventType:@"autoUpdateMetrics"];
    self;
    if (qword_1005B0D40 != -1) {
      dispatch_once(&qword_1005B0D40, &stru_1005256F0);
    }
    id v5 = (id)qword_1005B0D48;
    [(UpdateMetricsEvent *)v4 addPropertiesWithDictionary:v5];
  }
  return v4;
}

- (id)description
{
  if (self)
  {
    double meanTimeToDiscovery = self->_meanTimeToDiscovery;
    double meanTimeToTransaction = self->_meanTimeToTransaction;
    double meanTimeToDownload = self->_meanTimeToDownload;
    double meanTimeToInstall = self->_meanTimeToInstall;
    double averageTimeBetweenPolls = self->_averageTimeBetweenPolls;
  }
  else
  {
    double meanTimeToInstall = 0.0;
    double meanTimeToTransaction = 0.0;
    double meanTimeToDiscovery = 0.0;
    double meanTimeToDownload = 0.0;
    double averageTimeBetweenPolls = 0.0;
  }
  return +[NSString stringWithFormat:@"{ meanToDiscover: %f meanToTransaction: %f meanToDownload: %f meanToInstall: %f averageTimeBetweenPolls: %f }", *(void *)&meanTimeToDiscovery, *(void *)&meanTimeToTransaction, *(void *)&meanTimeToDownload, *(void *)&meanTimeToInstall, *(void *)&averageTimeBetweenPolls];
}

- (void).cxx_destruct
{
}

@end