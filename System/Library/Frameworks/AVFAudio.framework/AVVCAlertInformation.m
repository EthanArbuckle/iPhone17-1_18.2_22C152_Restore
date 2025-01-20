@interface AVVCAlertInformation
- (AVVCAlertInformation)initWithAlertType:(int)a3 mode:(int64_t)a4 endTime:(unint64_t)a5;
- (int)type;
- (int64_t)mode;
- (unint64_t)alertEndTime;
- (void)setAlertEndTime:(unint64_t)a3;
- (void)setMode:(int64_t)a3;
- (void)setType:(int)a3;
@end

@implementation AVVCAlertInformation

- (void)setAlertEndTime:(unint64_t)a3
{
  self->_alertEndTime = a3;
}

- (unint64_t)alertEndTime
{
  return self->_alertEndTime;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)type
{
  return self->_type;
}

- (AVVCAlertInformation)initWithAlertType:(int)a3 mode:(int64_t)a4 endTime:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AVVCAlertInformation;
  result = [(AVVCAlertInformation *)&v9 init];
  if (result)
  {
    result->_type = a3;
    result->_mode = a4;
    result->_alertEndTime = a5;
  }
  return result;
}

@end