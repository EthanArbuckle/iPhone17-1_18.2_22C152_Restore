@interface CHSystemConfiguration
- (BOOL)isCloudKitEnabled;
- (CHSystemConfiguration)init;
- (id)numberForKey:(id)a3;
- (void)handleIDSServerBagFinishedLoadingNotification:(id)a3;
@end

@implementation CHSystemConfiguration

- (CHSystemConfiguration)init
{
  v3 = +[IDSServerBag sharedInstanceForBagType:0];
  v7.receiver = self;
  v7.super_class = (Class)CHSystemConfiguration;
  v4 = [(CHSystemConfiguration *)&v7 initWithDataSource:v3];
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"handleIDSServerBagFinishedLoadingNotification:" name:IDSServerBagFinishedLoadingNotification object:v3];
  }
  return v4;
}

- (id)numberForKey:(id)a3
{
  id v4 = a3;
  v5 = [(CHSystemConfiguration *)self dataSource];
  v6 = [v5 objectForKey:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)isCloudKitEnabled
{
  v2 = [(CHSystemConfiguration *)self numberForKey:@"callhistory-cloudkit-enabled"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)handleIDSServerBagFinishedLoadingNotification:(id)a3
{
  id v4 = [(CHSystemConfiguration *)self delegateController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001DB00;
  v5[3] = &unk_1000497D0;
  v5[4] = self;
  [v4 enumerateDelegatesUsingBlock:v5];
}

@end