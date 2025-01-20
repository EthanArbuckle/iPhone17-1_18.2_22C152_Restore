@interface PluginAnalytics
+ (id)sharedInstance;
- (void)_recordEvent:(id)a3 field:(id)a4 value:(id)a5;
- (void)recordSettingsChange:(id)a3 value:(id)a4;
@end

@implementation PluginAnalytics

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E214;
  block[3] = &unk_18880;
  block[4] = a1;
  if (qword_1FA68 != -1) {
    dispatch_once(&qword_1FA68, block);
  }
  v2 = (void *)qword_1FA70;

  return v2;
}

- (void)recordSettingsChange:(id)a3 value:(id)a4
{
}

- (void)_recordEvent:(id)a3 field:(id)a4 value:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v6 = v9;
  id v7 = v8;
  AnalyticsSendEventLazy();
}

@end