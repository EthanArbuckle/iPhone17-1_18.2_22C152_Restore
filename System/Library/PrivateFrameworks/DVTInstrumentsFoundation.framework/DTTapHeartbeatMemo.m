@interface DTTapHeartbeatMemo
- (DTTapHeartbeatMemo)initWithTimestamp:(unint64_t)a3;
- (unint64_t)timestamp;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation DTTapHeartbeatMemo

- (DTTapHeartbeatMemo)initWithTimestamp:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DTTapHeartbeatMemo;
  result = [(DTTapHeartbeatMemo *)&v5 init];
  if (result) {
    result->_timestamp = a3;
  }
  return result;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

@end