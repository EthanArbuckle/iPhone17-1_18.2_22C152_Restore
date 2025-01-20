@interface CSVoiceTriggerFirstPassMetrics
+ (CSVoiceTriggerFirstPassMetrics)CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:(unint64_t)a3 firstPassInfoProcessedTime:(unint64_t)a4;
- (NSNumber)firstPassInfoGeneratedTime;
- (NSNumber)firstPassInfoProcessedTime;
- (id)_initWithFirstPassInfoGeneratedTime:(unint64_t)a3 firstPassInfoProcessedTime:(unint64_t)a4;
@end

@implementation CSVoiceTriggerFirstPassMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstPassInfoProcessedTime, 0);
  objc_storeStrong((id *)&self->_firstPassInfoGeneratedTime, 0);
}

- (NSNumber)firstPassInfoProcessedTime
{
  return self->_firstPassInfoProcessedTime;
}

- (NSNumber)firstPassInfoGeneratedTime
{
  return self->_firstPassInfoGeneratedTime;
}

- (id)_initWithFirstPassInfoGeneratedTime:(unint64_t)a3 firstPassInfoProcessedTime:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CSVoiceTriggerFirstPassMetrics;
  v6 = [(CSVoiceTriggerFirstPassMetrics *)&v12 init];
  if (v6)
  {
    uint64_t v7 = +[NSNumber numberWithUnsignedLongLong:a3];
    firstPassInfoGeneratedTime = v6->_firstPassInfoGeneratedTime;
    v6->_firstPassInfoGeneratedTime = (NSNumber *)v7;

    uint64_t v9 = +[NSNumber numberWithUnsignedLongLong:a4];
    firstPassInfoProcessedTime = v6->_firstPassInfoProcessedTime;
    v6->_firstPassInfoProcessedTime = (NSNumber *)v9;
  }
  return v6;
}

+ (CSVoiceTriggerFirstPassMetrics)CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:(unint64_t)a3 firstPassInfoProcessedTime:(unint64_t)a4
{
  id v4 = [[CSVoiceTriggerFirstPassMetrics alloc] _initWithFirstPassInfoGeneratedTime:a3 firstPassInfoProcessedTime:a4];
  return (CSVoiceTriggerFirstPassMetrics *)v4;
}

@end