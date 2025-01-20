@interface DDSTimedAnalytic
- (BOOL)success;
- (DDSTimedAnalytic)init;
- (DDSTimedAnalytic)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (double)endTime;
- (double)startTime;
- (int)lastAction;
- (unint64_t)durationInSec;
- (unint64_t)retries;
- (void)setEndTime:(double)a3;
- (void)setLastAction:(int)a3;
- (void)setRetries:(unint64_t)a3;
- (void)setStartTime:(double)a3;
- (void)setSuccess:(BOOL)a3;
- (void)updateWithAction:(int)a3;
@end

@implementation DDSTimedAnalytic

- (DDSTimedAnalytic)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDSTimedAnalytic;
  v6 = [(DDSTimedAnalytic *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_lastAction = 0;
  }

  return v7;
}

- (DDSTimedAnalytic)init
{
  return 0;
}

- (void)updateWithAction:(int)a3
{
  -[DDSTimedAnalytic setLastAction:](self, "setLastAction:");
  switch(a3)
  {
    case 1:
      [(DDSTimedAnalytic *)self startTime];
      if (v5 == 0.0)
      {
        id v9 = [MEMORY[0x1E4F1C9C8] date];
        [v9 timeIntervalSince1970];
        -[DDSTimedAnalytic setStartTime:](self, "setStartTime:");
        goto LABEL_10;
      }
      break;
    case 2:
      unint64_t v6 = [(DDSTimedAnalytic *)self retries] + 1;
      [(DDSTimedAnalytic *)self setRetries:v6];
      break;
    case 3:
      v7 = self;
      uint64_t v8 = 1;
      goto LABEL_9;
    case 4:
      v7 = self;
      uint64_t v8 = 0;
LABEL_9:
      [(DDSTimedAnalytic *)v7 setSuccess:v8];
      id v9 = [MEMORY[0x1E4F1C9C8] date];
      [v9 timeIntervalSince1970];
      -[DDSTimedAnalytic setEndTime:](self, "setEndTime:");
LABEL_10:

      break;
    default:
      return;
  }
}

- (unint64_t)durationInSec
{
  [(DDSTimedAnalytic *)self endTime];
  double v4 = v3;
  [(DDSTimedAnalytic *)self startTime];
  double v6 = v4 - v5;
  if (v6 >= 1.0 || v6 <= 0.0) {
    return (unint64_t)v6;
  }
  else {
    return 1;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (unint64_t)retries
{
  return self->_retries;
}

- (void)setRetries:(unint64_t)a3
{
  self->_retries = a3;
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

- (int)lastAction
{
  return self->_lastAction;
}

- (void)setLastAction:(int)a3
{
  self->_lastAction = a3;
}

- (void).cxx_destruct
{
}

@end