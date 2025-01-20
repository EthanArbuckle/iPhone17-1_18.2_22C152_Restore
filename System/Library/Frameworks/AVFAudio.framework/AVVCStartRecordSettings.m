@interface AVVCStartRecordSettings
- (AVVCStartRecordSettings)initWithStreamID:(unint64_t)a3 atStartHostTime:(unint64_t)a4;
- (BOOL)skipAlert;
- (int64_t)startAlert;
- (int64_t)stopAlert;
- (int64_t)stopOnErrorAlert;
- (unint64_t)startHostTime;
- (unint64_t)streamID;
- (unsigned)startAnchorPoint;
- (void)setSkipAlert:(BOOL)a3;
- (void)setStartAlert:(int64_t)a3;
- (void)setStartAnchorPoint:(unsigned int)a3;
- (void)setStartHostTime:(unint64_t)a3;
- (void)setStopAlert:(int64_t)a3;
- (void)setStopOnErrorAlert:(int64_t)a3;
- (void)setStreamID:(unint64_t)a3;
@end

@implementation AVVCStartRecordSettings

- (void)setStartAnchorPoint:(unsigned int)a3
{
  self->_startAnchorPoint = a3;
}

- (unsigned)startAnchorPoint
{
  return self->_startAnchorPoint;
}

- (void)setSkipAlert:(BOOL)a3
{
  self->_skipAlert = a3;
}

- (BOOL)skipAlert
{
  return self->_skipAlert;
}

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

- (void)setStartHostTime:(unint64_t)a3
{
  self->_startHostTime = a3;
}

- (unint64_t)startHostTime
{
  return self->_startHostTime;
}

- (void)setStreamID:(unint64_t)a3
{
  self->_streamID = a3;
}

- (unint64_t)streamID
{
  return self->_streamID;
}

- (AVVCStartRecordSettings)initWithStreamID:(unint64_t)a3 atStartHostTime:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AVVCStartRecordSettings;
  result = [(AVVCStartRecordSettings *)&v7 init];
  if (result)
  {
    result->_streamID = a3;
    result->_startHostTime = a4;
    result->_startAlert = -1;
    result->_stopAlert = -1;
    result->_stopOnErrorAlert = -1;
    result->_skipAlert = 0;
    result->_startAnchorPoint = 0;
  }
  return result;
}

@end