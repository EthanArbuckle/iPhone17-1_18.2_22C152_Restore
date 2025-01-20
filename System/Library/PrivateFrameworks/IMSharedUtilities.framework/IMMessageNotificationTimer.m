@interface IMMessageNotificationTimer
- (BOOL)areDingsRemaining;
- (IMMessageNotificationTimer)initWithDate:(id)a3;
- (NSDate)date;
- (NSNumber)numberDingsLeft;
- (void)dealloc;
- (void)reduceNumberDingsLeft;
- (void)setDate:(id)a3;
@end

@implementation IMMessageNotificationTimer

- (IMMessageNotificationTimer)initWithDate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMMessageNotificationTimer;
  v4 = [(IMMessageNotificationTimer *)&v6 init];
  if (v4)
  {
    v4->_date = (NSDate *)a3;
    v4->_numberDingsLeft = (NSNumber *)&unk_1EF305940;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMMessageNotificationTimer;
  [(IMMessageNotificationTimer *)&v3 dealloc];
}

- (BOOL)areDingsRemaining
{
  return [(NSNumber *)self->_numberDingsLeft intValue] > 0;
}

- (void)reduceNumberDingsLeft
{
  if ([(NSNumber *)self->_numberDingsLeft intValue] >= 1) {
    self->_numberDingsLeft = (NSNumber *)objc_msgSend(NSNumber, "numberWithInt:", -[NSNumber intValue](self->_numberDingsLeft, "intValue") - 1);
  }
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSNumber)numberDingsLeft
{
  return self->_numberDingsLeft;
}

@end