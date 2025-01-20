@interface IDSGFTMetricsReferencePointEvent
- (IDSGFTMetricsReferencePointEvent)initWithTime:(id)a3 reason:(id)a4;
- (NSNumber)reason;
- (NSNumber)time;
- (id)description;
- (void)setReason:(id)a3;
- (void)setTime:(id)a3;
@end

@implementation IDSGFTMetricsReferencePointEvent

- (IDSGFTMetricsReferencePointEvent)initWithTime:(id)a3 reason:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IDSGFTMetricsReferencePointEvent;
  v9 = [(IDSGFTMetricsReferencePointEvent *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_time, a3);
    objc_storeStrong((id *)&v10->_reason, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"time:%@ reason:%@", v2, self->_time, self->_reason);
}

- (NSNumber)reason
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setReason:(id)a3
{
}

- (NSNumber)time
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end