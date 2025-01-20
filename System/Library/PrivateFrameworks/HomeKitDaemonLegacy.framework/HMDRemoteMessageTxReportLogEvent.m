@interface HMDRemoteMessageTxReportLogEvent
+ (id)txReportForTransport:(int)a3 latency:(double)a4;
- (HMDRemoteMessageTxReportLogEvent)initWithTransport:(int)a3 latency:(double)a4;
- (double)latency;
- (int)transportType;
@end

@implementation HMDRemoteMessageTxReportLogEvent

- (double)latency
{
  return self->_latency;
}

- (int)transportType
{
  return self->_transportType;
}

- (HMDRemoteMessageTxReportLogEvent)initWithTransport:(int)a3 latency:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HMDRemoteMessageTxReportLogEvent;
  result = [(HMMLogEvent *)&v7 init];
  if (result)
  {
    result->_transportType = a3;
    result->_latency = a4;
  }
  return result;
}

+ (id)txReportForTransport:(int)a3 latency:(double)a4
{
  v4 = [[HMDRemoteMessageTxReportLogEvent alloc] initWithTransport:*(void *)&a3 latency:a4];
  return v4;
}

@end