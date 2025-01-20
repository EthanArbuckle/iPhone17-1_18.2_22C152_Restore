@interface AVVCConfigureAlertBehaviorSettings
- (AVVCConfigureAlertBehaviorSettings)initWithStreamID:(unint64_t)a3;
- (int64_t)startAlert;
- (int64_t)stopAlert;
- (int64_t)stopOnErrorAlert;
- (unint64_t)streamID;
- (void)setStartAlert:(int64_t)a3;
- (void)setStopAlert:(int64_t)a3;
- (void)setStopOnErrorAlert:(int64_t)a3;
- (void)setStreamID:(unint64_t)a3;
@end

@implementation AVVCConfigureAlertBehaviorSettings

- (void)setStopOnErrorAlert:(int64_t)a3
{
  self->_stopOnErrorAlert = a3;
}

- (int64_t)stopOnErrorAlert
{
  return self->_stopOnErrorAlert;
}

- (void)setStopAlert:(int64_t)a3
{
  self->_stopAlert = a3;
}

- (int64_t)stopAlert
{
  return self->_stopAlert;
}

- (void)setStartAlert:(int64_t)a3
{
  self->_startAlert = a3;
}

- (int64_t)startAlert
{
  return self->_startAlert;
}

- (void)setStreamID:(unint64_t)a3
{
  self->_streamID = a3;
}

- (unint64_t)streamID
{
  return self->_streamID;
}

- (AVVCConfigureAlertBehaviorSettings)initWithStreamID:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVVCConfigureAlertBehaviorSettings;
  result = [(AVVCConfigureAlertBehaviorSettings *)&v5 init];
  if (result)
  {
    result->_streamID = a3;
    result->_startAlert = -1;
    result->_stopAlert = -1;
    result->_stopOnErrorAlert = -1;
  }
  return result;
}

@end