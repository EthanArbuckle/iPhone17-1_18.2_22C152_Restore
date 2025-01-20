@interface SRErrorUtility
+ (id)_localizedErrorString:(id)a3;
+ (id)userStringForError:(id)a3 reflectionDialogWasPlayed:(BOOL)a4;
+ (int64_t)_getUpdatedErrorCount;
+ (void)_logDummyAssistantUtteranceViewWithDialogIdentifier:(id)a3;
+ (void)resetErrorState;
@end

@implementation SRErrorUtility

+ (id)userStringForError:(id)a3 reflectionDialogWasPlayed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 domain];
  unsigned int v8 = [v7 isEqualToString:kAFAssistantErrorDomain];

  if (v8)
  {
    id v9 = [v6 code];
    CFStringRef v10 = @"ASSISTANT_TRY_AGAIN";
    CFStringRef v11 = @"clientGenerated#TryAgain";
    switch((unint64_t)v9)
    {
      case 0uLL:
      case 3uLL:
      case 7uLL:
        goto LABEL_22;
      case 1uLL:
      case 2uLL:
      case 4uLL:
        goto LABEL_7;
      case 5uLL:
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
        goto LABEL_18;
      case 6uLL:
        CFStringRef v10 = 0;
        CFStringRef v11 = @"clientGenerated#NotReady";
        goto LABEL_22;
      case 0xEuLL:
        CFStringRef v10 = @"ASSISTANT_CONNECTION_FAILED_3";
        CFStringRef v11 = @"clientGenerated#ConnectionFailed3";
        goto LABEL_22;
      default:
        if (v9 == (id)300) {
          goto LABEL_22;
        }
        if (v9 == (id)2001)
        {
LABEL_7:
          if (v4 && [v6 code] == (id)4)
          {
            CFStringRef v10 = @"ASSISTANT_TIMEOUT_ERROR_AFTER_DELAY_INTERSTITIAL";
            CFStringRef v11 = @"clientGenerated#TimeoutAfterDelayInterstitials";
          }
          else
          {
            id v13 = [a1 _getUpdatedErrorCount];
            CFStringRef v14 = @"ASSISTANT_CONNECTION_FAILED_2";
            CFStringRef v15 = @"clientGenerated#ConnectionFailed2";
            if (v13 == (id)1)
            {
              CFStringRef v15 = @"clientGenerated#ConnectionFailed1";
              CFStringRef v14 = @"ASSISTANT_CONNECTION_FAILED_1";
            }
            if (v13) {
              CFStringRef v11 = v15;
            }
            else {
              CFStringRef v11 = @"clientGenerated#ConnectionFailed0";
            }
            if (v13) {
              CFStringRef v10 = v14;
            }
            else {
              CFStringRef v10 = @"ASSISTANT_CONNECTION_FAILED_0";
            }
          }
LABEL_22:
          [a1 _logDummyAssistantUtteranceViewWithDialogIdentifier:v11];
          v17 = +[SRUIFInstrumentationManager sharedManager];
          [v17 storeClientGeneratedDUC:v11];
        }
        else
        {
LABEL_18:
          v16 = AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
            sub_1000B6D28((uint64_t)v6, v16);
          }
          CFStringRef v10 = 0;
        }
        v12 = [a1 _localizedErrorString:v10];
        break;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (void)resetErrorState
{
  id v3 = +[SiriUIPreferences sharedPreferences];
  v2 = +[NSDate distantPast];
  [v3 setPreviousSiriRequestErrorTimestamp:v2];
}

+ (int64_t)_getUpdatedErrorCount
{
  v2 = +[SiriUIPreferences sharedPreferences];
  id v3 = [v2 previousSiriRequestErrorTimestamp];
  id v4 = [v2 siriRequestErrorCount];
  [v3 timeIntervalSinceNow];
  if (v5 < 0.0) {
    double v5 = -v5;
  }
  if (v5 <= 480.0) {
    int64_t v6 = (int64_t)v4 + 1;
  }
  else {
    int64_t v6 = 0;
  }
  [v2 setSiriRequestErrorCount:v6];
  v7 = +[NSDate now];
  [v2 setPreviousSiriRequestErrorTimestamp:v7];

  return v6;
}

+ (id)_localizedErrorString:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    double v5 = [v4 assistantUILocalizedStringForKey:v3 table:0];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

+ (void)_logDummyAssistantUtteranceViewWithDialogIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[AFAnalytics sharedAnalytics];
  CFStringRef v9 = @"dialogIdentifier";
  id v10 = v3;
  double v5 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v4 logEventWithType:1429 context:v5];

  id v6 = objc_alloc_init((Class)SAUIAssistantUtteranceView);
  v7 = +[NSUUID UUID];
  unsigned int v8 = [v7 UUIDString];
  [v6 setAceId:v8];

  [v6 setDialogIdentifier:v3];
  [v4 logClientFeedbackPresented:v6];
}

@end