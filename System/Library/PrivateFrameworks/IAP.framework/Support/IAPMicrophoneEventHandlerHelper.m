@interface IAPMicrophoneEventHandlerHelper
+ (id)sharedInstance;
- (void)dealloc;
- (void)microphoneStateChangeDebouceTimeout;
- (void)microphoneStateChangedNotification;
- (void)sendMicrophoneStateChangedNotification;
@end

@implementation IAPMicrophoneEventHandlerHelper

+ (id)sharedInstance
{
  if (qword_10013BBC0 != -1) {
    dispatch_once(&qword_10013BBC0, &stru_1001220B0);
  }
  return (id)qword_10013BBB8;
}

- (void)dealloc
{
  p_stateChangeDebouceTimer = &self->_stateChangeDebouceTimer;
  if (((unint64_t)&self->_stateChangeDebouceTimer & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    if (*p_stateChangeDebouceTimer)
    {
      [(NSTimer *)*p_stateChangeDebouceTimer invalidate];
      *p_stateChangeDebouceTimer = 0;
    }
    v4.receiver = self;
    v4.super_class = (Class)IAPMicrophoneEventHandlerHelper;
    [(IAPMicrophoneEventHandlerHelper *)&v4 dealloc];
  }
}

- (void)sendMicrophoneStateChangedNotification
{
}

- (void)microphoneStateChangedNotification
{
  p_stateChangeDebouceTimer = &self->_stateChangeDebouceTimer;
  if (((unint64_t)&self->_stateChangeDebouceTimer & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    if (*p_stateChangeDebouceTimer)
    {
      [(NSTimer *)*p_stateChangeDebouceTimer invalidate];
      *p_stateChangeDebouceTimer = 0;
    }
    self->_stateChangeDebouceTimer = (NSTimer *)objc_msgSend(objc_alloc((Class)NSTimer), "initWithFireDate:interval:target:selector:userInfo:repeats:", +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 0.3), self, "microphoneStateChangeDebouceTimeout", 0, 0, 0.0);
    [+[NSRunLoop mainRunLoop] addTimer:self->_stateChangeDebouceTimer forMode:NSDefaultRunLoopMode];
    stateChangeDebouceTimer = self->_stateChangeDebouceTimer;
  }
}

- (void)microphoneStateChangeDebouceTimeout
{
  if (((unint64_t)&self->_stateChangeDebouceTimer & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    self->_stateChangeDebouceTimer = 0;
    +[IAPServer sendAudioStateChangedNotification];
  }
}

@end