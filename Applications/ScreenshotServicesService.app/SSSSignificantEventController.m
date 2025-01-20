@interface SSSSignificantEventController
+ (id)sharedSignificantEventController;
- (id)_runPPTServiceRequestForScreenshot:(id)a3;
- (id)_runPPTServiceRequestForScreenshots:(id)a3;
- (void)_finishRunPPTServiceRequest:(id)a3;
- (void)_startRunPPTServiceRequest:(id)a3;
- (void)screenshotAppearAnimationBeganForScreenshot:(id)a3;
- (void)screenshotAppearAnimationEndedForScreenshot:(id)a3 userInterface:(id)a4;
- (void)screenshotUIWithScreenshots:(id)a3 beganStateChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)screenshotUIWithScreenshots:(id)a3 endedStateChangeFromState:(unint64_t)a4 toState:(unint64_t)a5 userInterface:(id)a6;
@end

@implementation SSSSignificantEventController

+ (id)sharedSignificantEventController
{
  if (qword_1000B5798 != -1) {
    dispatch_once(&qword_1000B5798, &stru_10009A2B0);
  }
  v2 = (void *)qword_1000B5790;

  return v2;
}

- (id)_runPPTServiceRequestForScreenshot:(id)a3
{
  v3 = [a3 environmentDescription];
  v4 = [v3 appleInternalOptions];
  v5 = [v4 runPPTServiceRequest];

  return v5;
}

- (id)_runPPTServiceRequestForScreenshots:(id)a3
{
  v4 = [a3 firstObject];
  v5 = [(SSSSignificantEventController *)self _runPPTServiceRequestForScreenshot:v4];

  return v5;
}

- (void)_startRunPPTServiceRequest:(id)a3
{
  self->_isRunningScreenshotPPT = 1;
}

- (void)_finishRunPPTServiceRequest:(id)a3
{
  id v4 = a3;
  v5 = +[UIApplication sharedApplication];
  v6 = [v4 testName];

  [v5 finishedIPTest:v6];
  self->_isRunningScreenshotPPT = 0;
}

- (void)screenshotAppearAnimationBeganForScreenshot:(id)a3
{
  v3 = _SSSignpostLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ScreenshotAnimation", (const char *)&unk_100093E93, buf, 2u);
  }

  id v4 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "BEGIN \"ScreenshotAnimation\"", v9, 2u);
  }

  v5 = _SSSignpostLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ScreenshotGestureToAnimationStart", (const char *)&unk_100093E93, v8, 2u);
  }

  v6 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "END \"ScreenshotGestureToAnimationStart\"", v7, 2u);
  }
}

- (void)screenshotAppearAnimationEndedForScreenshot:(id)a3 userInterface:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = _SSSignpostLog();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ScreenshotAnimation", (const char *)&unk_100093E93, buf, 2u);
  }

  v9 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "END \"ScreenshotAnimation\"", buf, 2u);
  }

  v10 = [(SSSSignificantEventController *)self _runPPTServiceRequestForScreenshot:v7];

  if (v10)
  {
    v11 = [v10 testName];
    unsigned int v12 = [v11 isEqualToString:@"TakeScreenshot"];

    if (v12)
    {
      [(SSSSignificantEventController *)self _finishRunPPTServiceRequest:v10];
    }
    else
    {
      v13 = [v10 testName];
      unsigned int v14 = [v13 isEqualToString:@"ExpandToFullscreen"];

      if (v14)
      {
        [(SSSSignificantEventController *)self _startRunPPTServiceRequest:v10];
        [v6 significantEventControllerRequestsTransitionToStateForTest:1];
      }
      else
      {
        v15 = [v10 testName];
        unsigned int v16 = [v15 isEqualToString:@"GlitchFreeHero"];

        if (v16)
        {
          if (!self->_isRunningScreenshotPPT)
          {
            id v17 = [v6 numberOfScreenshots];
            if (v17 >= [v10 numberOfRequiredScreenshots])
            {
              [(SSSSignificantEventController *)self _startRunPPTServiceRequest:v10];
              v18[0] = _NSConcreteStackBlock;
              v18[1] = 3221225472;
              v18[2] = sub_100025B8C;
              v18[3] = &unk_100099C98;
              v18[4] = self;
              id v19 = v10;
              sub_100009BE8(v18);
            }
          }
        }
      }
    }
  }
}

- (void)screenshotUIWithScreenshots:(id)a3 beganStateChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v7 = a3;
  if (a4 != a5)
  {
    if (a4 == 1)
    {
      v13 = _SSSignpostLog();
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)v15 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ScreenshotPIPMiniaturize", (const char *)&unk_100093E93, v15, 2u);
      }

      v10 = os_log_create("com.apple.screenshotservices", "Performance");
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      __int16 v14 = 0;
      v11 = "BEGIN \"ScreenshotPIPMiniaturize\"";
      unsigned int v12 = (uint8_t *)&v14;
      goto LABEL_12;
    }
    if (!a4)
    {
      v8 = +[SSSStatisticsManager sharedStatisticsManager];
      [v8 pipExpanded];

      v9 = _SSSignpostLog();
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ScreenshotPIPExpand", (const char *)&unk_100093E93, buf, 2u);
      }

      v10 = os_log_create("com.apple.screenshotservices", "Performance");
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      __int16 v16 = 0;
      v11 = "BEGIN \"ScreenshotPIPExpand\"";
      unsigned int v12 = (uint8_t *)&v16;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, v12, 2u);
LABEL_13:
    }
  }
}

- (void)screenshotUIWithScreenshots:(id)a3 endedStateChangeFromState:(unint64_t)a4 toState:(unint64_t)a5 userInterface:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (a4 != a5)
  {
    if (a4 == 1)
    {
      id v17 = _SSSignpostLog();
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)id v19 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ScreenshotPIPMiniaturize", (const char *)&unk_100093E93, v19, 2u);
      }

      __int16 v14 = os_log_create("com.apple.screenshotservices", "Performance");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "END \"ScreenshotPIPMiniaturize\"", v18, 2u);
      }
      goto LABEL_14;
    }
    if (!a4)
    {
      unsigned int v12 = _SSSignpostLog();
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ScreenshotPIPExpand", (const char *)&unk_100093E93, buf, 2u);
      }

      v13 = os_log_create("com.apple.screenshotservices", "Performance");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "END \"ScreenshotPIPExpand\"", v20, 2u);
      }

      __int16 v14 = [(SSSSignificantEventController *)self _runPPTServiceRequestForScreenshots:v10];
      v15 = [v14 testName];
      unsigned int v16 = [v15 isEqualToString:@"ExpandToFullscreen"];

      if (v16) {
        [(SSSSignificantEventController *)self _finishRunPPTServiceRequest:v14];
      }
LABEL_14:
    }
  }
}

@end