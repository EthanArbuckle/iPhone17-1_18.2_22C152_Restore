@interface DDRTaskClearTelephonySettings
- (BOOL)eraseDataPlan;
- (DDRTaskClearTelephonySettings)initWithEraseDataPlan:(BOOL)a3;
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
- (void)setEraseDataPlan:(BOOL)a3;
@end

@implementation DDRTaskClearTelephonySettings

- (DDRTaskClearTelephonySettings)initWithEraseDataPlan:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DDRTaskClearTelephonySettings;
  v4 = [(DDRTaskClearTelephonySettings *)&v7 init];
  v5 = v4;
  if (v4) {
    [(DDRTaskClearTelephonySettings *)v4 setEraseDataPlan:v3];
  }
  return v5;
}

- (void)run
{
  BOOL v3 = +[NSBundle mainBundle];
  [v3 bundleIdentifier];
  v4 = (const void *)_CTServerConnectionCreateWithIdentifier();

  if (v4)
  {
    if ([(DDRTaskClearTelephonySettings *)self eraseDataPlan]) {
      _CTServerConnectionEraseAllUserProfiles();
    }
    id v5 = objc_alloc((Class)CoreTelephonyClient);
    v6 = dispatch_get_global_queue(2, 0);
    id v7 = [v5 initWithQueue:v6];

    [v7 deleteHiddenSims:&stru_100010710];
    _CTServerConnectionEraseBasebandSettings();
    CFRelease(v4);
  }
}

- (id)identifier
{
  return @"com.apple.devicedatareset.resetTelephonySettings";
}

- (double)estimatedTimeOfCompletion
{
  return 1.0;
}

- (BOOL)eraseDataPlan
{
  return self->_eraseDataPlan;
}

- (void)setEraseDataPlan:(BOOL)a3
{
  self->_eraseDataPlan = a3;
}

@end