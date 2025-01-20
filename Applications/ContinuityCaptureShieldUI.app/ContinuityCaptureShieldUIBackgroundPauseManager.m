@interface ContinuityCaptureShieldUIBackgroundPauseManager
+ (id)sharedInstance;
- (void)requestDefaultScreenPauseEvent:(int64_t)a3;
- (void)requestDefaultScreenResumeEvent:(int64_t)a3;
@end

@implementation ContinuityCaptureShieldUIBackgroundPauseManager

+ (id)sharedInstance
{
  if (qword_100024090 != -1) {
    dispatch_once(&qword_100024090, &stru_10001C808);
  }
  v2 = (void *)qword_100024088;

  return v2;
}

- (void)requestDefaultScreenPauseEvent:(int64_t)a3
{
  int BoolAnswer = AVGestaltGetBoolAnswer();
  v6 = sub_10000AB00();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136316162;
    v9 = "-[ContinuityCaptureShieldUIBackgroundPauseManager requestDefaultScreenPauseEvent:]";
    __int16 v10 = 2048;
    v11 = self;
    __int16 v12 = 2048;
    int64_t v13 = a3;
    __int16 v14 = 1024;
    int v15 = BoolAnswer;
    __int16 v16 = 1024;
    int v17 = BoolAnswer;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: <%p> Called pauseEvent:%zu. Ignoring event: %d. supportsCCMultitasking:%d", (uint8_t *)&v8, 0x2Cu);
  }

  if ((BoolAnswer & 1) == 0)
  {
    v7 = +[CMContinuityCaptureXPCClientCCD sharedInstance];
    [v7 pauseSessionForEvent:a3];
  }
}

- (void)requestDefaultScreenResumeEvent:(int64_t)a3
{
  int BoolAnswer = AVGestaltGetBoolAnswer();
  v6 = sub_10000AB00();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136316162;
    v9 = "-[ContinuityCaptureShieldUIBackgroundPauseManager requestDefaultScreenResumeEvent:]";
    __int16 v10 = 2048;
    v11 = self;
    __int16 v12 = 2048;
    int64_t v13 = a3;
    __int16 v14 = 1024;
    int v15 = BoolAnswer;
    __int16 v16 = 1024;
    int v17 = BoolAnswer;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: <%p> Called resumeEvent:%zu. Ignoring event: %d. supportsCCMultitasking:%d", (uint8_t *)&v8, 0x2Cu);
  }

  if ((BoolAnswer & 1) == 0)
  {
    v7 = +[CMContinuityCaptureXPCClientCCD sharedInstance];
    [v7 resumeStreamingForEvent:a3];
  }
}

@end