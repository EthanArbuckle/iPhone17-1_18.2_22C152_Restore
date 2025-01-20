@interface AKCAAuthEventReporter
+ (void)reportAuthEventOfType:(id)a3 success:(BOOL)a4 error:(id)a5;
@end

@implementation AKCAAuthEventReporter

+ (void)reportAuthEventOfType:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  v13 = (__CFString *)a3;
  id v7 = a5;
  if (!getenv("__OSINSTALL_ENVIRONMENT") && !getenv("__AKSYNCBUBBLE"))
  {
    v8 = +[NSMutableDictionary dictionary];
    if (v13) {
      CFStringRef v9 = v13;
    }
    else {
      CFStringRef v9 = @"No Auth Type";
    }
    [v8 setObject:v9 forKeyedSubscript:@"eventType"];
    v10 = +[NSNumber numberWithBool:v6];
    [v8 setObject:v10 forKeyedSubscript:@"wasSuccessful"];

    if (v7)
    {
      v11 = [v7 domain];
      [v8 setObject:v11 forKeyedSubscript:@"errorDomain"];

      v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 code]);
      [v8 setObject:v12 forKeyedSubscript:@"errorCode"];
    }
    if (&_AnalyticsSendEvent) {
      AnalyticsSendEvent();
    }
  }
}

@end