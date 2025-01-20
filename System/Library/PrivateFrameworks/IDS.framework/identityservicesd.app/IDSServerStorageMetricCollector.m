@interface IDSServerStorageMetricCollector
- (BOOL)wasPrimary;
- (IDSServerStorageMetricCollector)initWithTopic:(id)a3 isPrimary:(BOOL)a4;
- (NSString)topic;
- (double)endTime;
- (double)startTime;
- (id)awdLogger;
- (id)dictionaryMetric;
- (int64_t)linkType;
- (int64_t)messageCount;
- (void)endCollector;
- (void)incrementMessageCount;
- (void)reportMetric;
- (void)setEndTime:(double)a3;
- (void)setLinkType:(int64_t)a3;
- (void)setMessageCount:(int64_t)a3;
- (void)setStartTime:(double)a3;
- (void)setTopic:(id)a3;
- (void)setWasPrimary:(BOOL)a3;
@end

@implementation IDSServerStorageMetricCollector

- (IDSServerStorageMetricCollector)initWithTopic:(id)a3 isPrimary:(BOOL)a4
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IDSServerStorageMetricCollector;
  v6 = [(IDSServerStorageMetricCollector *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(IDSServerStorageMetricCollector *)v6 setTopic:v5];
    [(IDSServerStorageMetricCollector *)v7 setWasPrimary:1];
    v8 = +[NSDate date];
    [v8 timeIntervalSinceReferenceDate];
    -[IDSServerStorageMetricCollector setStartTime:](v7, "setStartTime:");
  }
  return v7;
}

- (id)awdLogger
{
  return +[IDSAWDLogging sharedInstance];
}

- (void)incrementMessageCount
{
  v3 = (char *)[(IDSServerStorageMetricCollector *)self messageCount] + 1;

  [(IDSServerStorageMetricCollector *)self setMessageCount:v3];
}

- (void)endCollector
{
  id v3 = +[NSDate date];
  [v3 timeIntervalSinceReferenceDate];
  -[IDSServerStorageMetricCollector setEndTime:](self, "setEndTime:");
}

- (void)reportMetric
{
  [(IDSServerStorageMetricCollector *)self endTime];
  double v4 = v3;
  [(IDSServerStorageMetricCollector *)self startTime];
  double v6 = v4 - v5;
  id v7 = objc_alloc((Class)IDSServerStorageStateMachineCompletedMetric);
  v8 = [(IDSServerStorageMetricCollector *)self topic];
  id v12 = objc_msgSend(v7, "initWithService:linkType:wasPrimary:timeTaken:numberProcessed:", v8, -[IDSServerStorageMetricCollector linkType](self, "linkType"), -[IDSServerStorageMetricCollector wasPrimary](self, "wasPrimary"), -[IDSServerStorageMetricCollector messageCount](self, "messageCount"), v6);

  v9 = +[IDSCoreAnalyticsLogger defaultLogger];
  [v9 logMetric:v12];

  objc_super v10 = [(IDSServerStorageMetricCollector *)self awdLogger];
  v11 = [(IDSServerStorageMetricCollector *)self topic];
  objc_msgSend(v10, "noteServerStorageStateMachineEndedFor:linkType:wasPrimary:timeTaken:numberProcessed:", v11, -[IDSServerStorageMetricCollector linkType](self, "linkType"), -[IDSServerStorageMetricCollector wasPrimary](self, "wasPrimary"), -[IDSServerStorageMetricCollector messageCount](self, "messageCount"), v6);
}

- (id)dictionaryMetric
{
  [(IDSServerStorageMetricCollector *)self endTime];
  double v4 = v3;
  [(IDSServerStorageMetricCollector *)self startTime];
  double v6 = v5;
  id v7 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v8 = [(IDSServerStorageMetricCollector *)self topic];
  if (v8) {
    CFDictionarySetValue(v7, @"Topic", v8);
  }
  double v9 = v4 - v6;

  objc_super v10 = +[NSNumber numberWithInteger:[(IDSServerStorageMetricCollector *)self linkType]];
  if (v10) {
    CFDictionarySetValue(v7, @"linkType", v10);
  }

  if ([(IDSServerStorageMetricCollector *)self wasPrimary]) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }
  CFDictionarySetValue(v7, @"wasPrimary", v11);
  id v12 = +[NSNumber numberWithDouble:v9];
  if (v12) {
    CFDictionarySetValue(v7, @"timeTaken", v12);
  }

  v13 = +[NSNumber numberWithInteger:[(IDSServerStorageMetricCollector *)self messageCount]];
  if (v13) {
    CFDictionarySetValue(v7, @"totalProcessed", v13);
  }

  return v7;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (BOOL)wasPrimary
{
  return self->_wasPrimary;
}

- (void)setWasPrimary:(BOOL)a3
{
  self->_wasPrimary = a3;
}

- (int64_t)messageCount
{
  return self->_messageCount;
}

- (void)setMessageCount:(int64_t)a3
{
  self->_messageCount = a3;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(int64_t)a3
{
  self->_linkType = a3;
}

- (void).cxx_destruct
{
}

@end