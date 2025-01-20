@interface DADeviceConnectionConfigurator
+ (DADeviceConnectionConfigurator)sharedInstance;
- (BOOL)isSessionModeOveridden;
- (int)mode;
- (int)overrideSessionMode;
- (void)overrideSessionModeWithMode:(int)a3;
- (void)setIsSessionModeOveridden:(BOOL)a3;
- (void)setOverrideSessionMode:(int)a3;
@end

@implementation DADeviceConnectionConfigurator

+ (DADeviceConnectionConfigurator)sharedInstance
{
  if (qword_100186970 != -1) {
    dispatch_once(&qword_100186970, &stru_10014C188);
  }
  v2 = (void *)qword_100186968;

  return (DADeviceConnectionConfigurator *)v2;
}

- (int)mode
{
  if ([(DADeviceConnectionConfigurator *)self isSessionModeOveridden])
  {
    return [(DADeviceConnectionConfigurator *)self overrideSessionMode];
  }
  else if (+[CBSUtilities isSSRBootIntentSet])
  {
    return 2;
  }
  else
  {
    return 0;
  }
}

- (void)overrideSessionModeWithMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(DADeviceConnectionConfigurator *)self setIsSessionModeOveridden:1];

  [(DADeviceConnectionConfigurator *)self setOverrideSessionMode:v3];
}

- (BOOL)isSessionModeOveridden
{
  return self->_isSessionModeOveridden;
}

- (void)setIsSessionModeOveridden:(BOOL)a3
{
  self->_isSessionModeOveridden = a3;
}

- (int)overrideSessionMode
{
  return self->_overrideSessionMode;
}

- (void)setOverrideSessionMode:(int)a3
{
  self->_overrideSessionMode = a3;
}

@end