@interface SUICAutoDismissalStrategy
+ (SUICAutoDismissalStrategy)strategyWithMode:(unint64_t)a3 supportedAttentionAwarenessEvents:(unint64_t)a4 deviceSupportsRaiseGestureDetection:(BOOL)a5 isWiredMicOrBTHeadsetOrWx:(BOOL)a6;
@end

@implementation SUICAutoDismissalStrategy

+ (SUICAutoDismissalStrategy)strategyWithMode:(unint64_t)a3 supportedAttentionAwarenessEvents:(unint64_t)a4 deviceSupportsRaiseGestureDetection:(BOOL)a5 isWiredMicOrBTHeadsetOrWx:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  unsigned __int8 v8 = a4;
  v10 = +[AFPreferences sharedPreferences];
  [v10 autoDismissalIdleTimeout];
  double v12 = v11;

  if (v6) {
    double v12 = 2.0;
  }
  v13 = +[AFPreferences sharedPreferences];
  [v13 autoDismissalExtendedIdleTimeout];
  double v15 = v14;

  if (a3 - 1 < 2)
  {
    _os_feature_enabled_impl();
  }
  else if (a3 && a3 != 3)
  {
    v16 = 0;
    goto LABEL_9;
  }
  v16 = (objc_class *)objc_opt_class();
LABEL_9:
  unint64_t v17 = v8 & 0x80;
  v18 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    v20 = MDModeGetName();
    int v23 = 136316418;
    v24 = "+[SUICAutoDismissalStrategy(ClassCluster) strategyWithMode:supportedAttentionAwarenessEvents:deviceSupportsRai"
          "seGestureDetection:isWiredMicOrBTHeadsetOrWx:]";
    __int16 v25 = 2112;
    v26 = v20;
    __int16 v27 = 2048;
    double v28 = v12;
    __int16 v29 = 2048;
    double v30 = v15;
    __int16 v31 = 1024;
    int v32 = v17 >> 7;
    __int16 v33 = 1024;
    BOOL v34 = v7;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s #autodismiss created autodismissal strategy for mode: %@, idleTimeout: %.1f,  extendedIdleTimeout: %.1f, deviceSupportsFaceDetection: %i, deviceSupportsRaiseGestureDetection: %i", (uint8_t *)&v23, 0x36u);
  }
  id v21 = [[v16 alloc] initWithIdleTimeout:v17 != 0 extendedIdleTimeout:v7 deviceSupportsFaceDetection:v12 deviceSupportsRaiseGestureDetection:v15];

  return (SUICAutoDismissalStrategy *)v21;
}

@end