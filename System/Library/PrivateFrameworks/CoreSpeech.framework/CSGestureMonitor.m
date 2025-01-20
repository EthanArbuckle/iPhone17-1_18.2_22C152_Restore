@interface CSGestureMonitor
+ (id)sharedInstance;
- (BOOL)isTriggerHandheld;
- (unint64_t)dismissalTimestamp;
- (unint64_t)wakeGestureTimestamp;
- (void)setDismissalTimestamp:(unint64_t)a3;
- (void)setWakeGestureTimestamp:(unint64_t)a3;
@end

@implementation CSGestureMonitor

- (void)setDismissalTimestamp:(unint64_t)a3
{
  self->_dismissalTimestamp = a3;
}

- (unint64_t)dismissalTimestamp
{
  return self->_dismissalTimestamp;
}

- (void)setWakeGestureTimestamp:(unint64_t)a3
{
  self->_wakeGestureTimestamp = a3;
}

- (unint64_t)wakeGestureTimestamp
{
  return self->_wakeGestureTimestamp;
}

- (BOOL)isTriggerHandheld
{
  v2 = +[CSGestureMonitor sharedInstance];
  uint64_t v3 = mach_absolute_time();
  id v4 = [v2 wakeGestureTimestamp];
  if (v4 <= [v2 dismissalTimestamp])
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315138;
      v16 = "-[CSGestureMonitor isTriggerHandheld]";
      v11 = "%s Tagging as FarField as user dismissed";
      v12 = v10;
      uint32_t v13 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v15, v13);
    }
LABEL_10:
    BOOL v9 = 0;
    goto LABEL_11;
  }
  +[CSFTimeUtils hostTimeToSeconds:v3 - (void)v4];
  float v6 = v5;
  v7 = CSLogContextFacilityCoreSpeech;
  BOOL v8 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO);
  if (v6 >= 8.0)
  {
    if (v8)
    {
      int v15 = 136315394;
      v16 = "-[CSGestureMonitor isTriggerHandheld]";
      __int16 v17 = 2048;
      double v18 = v6;
      v11 = "%s Tagging as farfield as last user interaction %f secs back";
      v12 = v7;
      uint32_t v13 = 22;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (v8)
  {
    int v15 = 136315394;
    v16 = "-[CSGestureMonitor isTriggerHandheld]";
    __int16 v17 = 2048;
    double v18 = v6;
    BOOL v9 = 1;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Tagging as handheld as user interacted in last %f secs", (uint8_t *)&v15, 0x16u);
  }
  else
  {
    BOOL v9 = 1;
  }
LABEL_11:

  return v9;
}

+ (id)sharedInstance
{
  if (+[CSUtils isDarwinOS])
  {
    id v2 = 0;
  }
  else
  {
    if (qword_1002A37F0 != -1) {
      dispatch_once(&qword_1002A37F0, &stru_10024FD78);
    }
    id v2 = (id)qword_1002A37E8;
  }
  return v2;
}

@end