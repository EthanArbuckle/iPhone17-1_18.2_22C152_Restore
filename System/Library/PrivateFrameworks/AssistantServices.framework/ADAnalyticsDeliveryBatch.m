@interface ADAnalyticsDeliveryBatch
- (ADAnalyticsDeliveryBatch)initWithDeliveryStream:(unint64_t)a3;
- (BOOL)hasFailureType;
- (BOOL)scheduledActivity;
- (NSString)serverEnvironment;
- (NSUUID)batchIdentifier;
- (id)analyticsDictionary;
- (unint64_t)deliveryStream;
- (unint64_t)outstandingCount;
- (unint64_t)payloadSize;
- (unint64_t)processedCount;
- (void)markEndTime;
- (void)markFailedWithType:(unint64_t)a3;
- (void)markStartTime;
- (void)markSucceeded;
- (void)setOutstandingCount:(unint64_t)a3;
- (void)setPayloadSize:(unint64_t)a3;
- (void)setProcessedCount:(unint64_t)a3;
- (void)setScheduledActivity:(BOOL)a3;
- (void)setServerEnvironment:(id)a3;
@end

@implementation ADAnalyticsDeliveryBatch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverEnvironment, 0);
  objc_storeStrong((id *)&self->_batchIdentifier, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

- (unint64_t)payloadSize
{
  return self->_payloadSize;
}

- (void)setScheduledActivity:(BOOL)a3
{
  self->_scheduledActivity = a3;
}

- (BOOL)scheduledActivity
{
  return self->_scheduledActivity;
}

- (void)setOutstandingCount:(unint64_t)a3
{
  self->_outstandingCount = a3;
}

- (unint64_t)outstandingCount
{
  return self->_outstandingCount;
}

- (void)setProcessedCount:(unint64_t)a3
{
  self->_processedCount = a3;
}

- (unint64_t)processedCount
{
  return self->_processedCount;
}

- (void)setServerEnvironment:(id)a3
{
}

- (NSString)serverEnvironment
{
  return self->_serverEnvironment;
}

- (unint64_t)deliveryStream
{
  return self->_deliveryStream;
}

- (NSUUID)batchIdentifier
{
  return self->_batchIdentifier;
}

- (id)analyticsDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = v3;
  serverEnvironment = self->_serverEnvironment;
  if (serverEnvironment) {
    [v3 setObject:serverEnvironment forKey:@"serverEnvironment"];
  }
  v6 = +[NSNumber numberWithUnsignedInteger:self->_deliveryStream];
  [v4 setObject:v6 forKey:@"deliveryStream"];

  v7 = +[NSNumber numberWithUnsignedInteger:self->_processedCount];
  [v4 setObject:v7 forKey:@"processed"];

  v8 = +[NSNumber numberWithUnsignedInteger:self->_outstandingCount];
  [v4 setObject:v8 forKey:@"outstanding"];

  if (self->_scheduledActivity) {
    CFStringRef v9 = @"scheduled";
  }
  else {
    CFStringRef v9 = @"opportunistic";
  }
  [v4 setObject:v9 forKey:@"type"];
  endTime = self->_endTime;
  if (endTime && self->_startTime)
  {
    -[NSDate timeIntervalSinceDate:](endTime, "timeIntervalSinceDate:");
    v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v4 setObject:v11 forKey:@"elapsed"];
  }
  v12 = +[NSNumber numberWithBool:self->_succeeded];
  [v4 setObject:v12 forKey:@"succeeded"];

  if (!self->_succeeded && [(ADAnalyticsDeliveryBatch *)self hasFailureType])
  {
    v13 = +[NSNumber numberWithUnsignedInteger:self->_failureType];
    [v4 setObject:v13 forKey:@"error"];
  }
  if (self->_hasPayloadSize)
  {
    v14 = +[NSNumber numberWithUnsignedInteger:self->_payloadSize];
    [v4 setObject:v14 forKey:@"payloadSize"];
  }
  return v4;
}

- (void)markFailedWithType:(unint64_t)a3
{
  self->_succeeded = 0;
  self->_failureType = a3;
}

- (void)markSucceeded
{
  self->_succeeded = 1;
}

- (void)markEndTime
{
  id v3 = +[NSDate date];
  endTime = self->_endTime;
  self->_endTime = v3;
  _objc_release_x1(v3, endTime);
}

- (void)markStartTime
{
  id v3 = +[NSDate date];
  startTime = self->_startTime;
  self->_startTime = v3;
  _objc_release_x1(v3, startTime);
}

- (BOOL)hasFailureType
{
  return self->_failureType != 0;
}

- (void)setPayloadSize:(unint64_t)a3
{
  self->_payloadSize = a3;
  self->_hasPayloadSize = 1;
}

- (ADAnalyticsDeliveryBatch)initWithDeliveryStream:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ADAnalyticsDeliveryBatch;
  v4 = [(ADAnalyticsDeliveryBatch *)&v8 init];
  if (v4)
  {
    uint64_t v5 = +[NSUUID UUID];
    batchIdentifier = v4->_batchIdentifier;
    v4->_batchIdentifier = (NSUUID *)v5;

    v4->_deliveryStream = a3;
  }
  return v4;
}

@end