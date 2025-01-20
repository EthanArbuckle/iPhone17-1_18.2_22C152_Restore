@interface BLSHSuppressionEvent
- (BLSHSuppressionEvent)initWithCoreMotionEvent:(id)a3 timestamp:(unint64_t)a4;
- (BLSHSuppressionEvent)initWithType:(unint64_t)a3 reason:(unint64_t)a4 timestamp:(unint64_t)a5;
- (BOOL)wantsSuppression;
- (id)description;
- (unint64_t)machContinuousTimestamp;
- (unint64_t)reason;
- (unint64_t)type;
@end

@implementation BLSHSuppressionEvent

- (BLSHSuppressionEvent)initWithCoreMotionEvent:(id)a3 timestamp:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 type] == 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  uint64_t v8 = [v6 reason];

  return [(BLSHSuppressionEvent *)self initWithType:v7 reason:v8 timestamp:a4];
}

- (BLSHSuppressionEvent)initWithType:(unint64_t)a3 reason:(unint64_t)a4 timestamp:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)BLSHSuppressionEvent;
  result = [(BLSHSuppressionEvent *)&v9 init];
  if (result)
  {
    result->_type = a3;
    result->_reason = a4;
    result->_machContinuousTimestamp = a5;
  }
  return result;
}

- (BOOL)wantsSuppression
{
  return self->_type == 1;
}

- (id)description
{
  v2 = [MEMORY[0x263F29C40] builderWithObject:self];
  v3 = NSStringFromBLSAlwaysOnSuppressionType();
  [v2 appendString:v3 withName:@"type"];

  v4 = NSStringFromBLSAlwaysOnSuppressionReason();
  [v2 appendString:v4 withName:@"reason"];

  v5 = [v2 build];

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (unint64_t)machContinuousTimestamp
{
  return self->_machContinuousTimestamp;
}

@end