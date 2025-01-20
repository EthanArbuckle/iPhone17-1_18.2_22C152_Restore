@interface AMSDAccountCachedServerDataService
+ (BOOL)isConnectionEntitled:(id)a3;
- (void)accountAuthSyncForAccountID:(id)a3 reply:(id)a4;
- (void)getDataForAccountIDs:(id)a3 reply:(id)a4;
- (void)manualSyncForAccountID:(id)a3 reply:(id)a4;
- (void)queueMetricsEventNotingExpiry:(id)a3 appID:(id)a4 reply:(id)a5;
- (void)setAutoPlayState:(BOOL)a3 forAccountID:(id)a4 reply:(id)a5;
- (void)setPersonalizationState:(BOOL)a3 forAccountID:(id)a4 reply:(id)a5;
@end

@implementation AMSDAccountCachedServerDataService

- (void)getDataForAccountIDs:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[CachedServerDataService sharedService];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100015E90;
  v9[3] = &unk_100111F98;
  id v10 = v5;
  id v8 = v5;
  [v7 dataWithAccounts:v6 completionHandler:v9];
}

- (void)queueMetricsEventNotingExpiry:(id)a3 appID:(id)a4 reply:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[CachedServerDataService sharedService];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100015DF0;
  v12[3] = &unk_100111FC0;
  id v13 = v7;
  id v11 = v7;
  [v10 queueMetricsEventFor:v9 appID:v8 completionHandler:v12];
}

+ (BOOL)isConnectionEntitled:(id)a3
{
  v3 = [a3 valueForEntitlement:@"com.apple.private.applemediaservices"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  unsigned __int8 v5 = [v4 BOOLValue];
  return v5;
}

- (void)setAutoPlayState:(BOOL)a3 forAccountID:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = +[CachedServerDataService sharedService];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100019D4C;
  v11[3] = &unk_100111FC0;
  id v12 = v7;
  id v10 = v7;
  [v9 changeAutoPlayFor:v8 to:v6 completionHandler:v11];
}

- (void)setPersonalizationState:(BOOL)a3 forAccountID:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = +[CachedServerDataService sharedService];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100019EC0;
  v11[3] = &unk_100111FC0;
  id v12 = v7;
  id v10 = v7;
  [v9 changePersonalizationFor:v8 to:v6 completionHandler:v11];
}

- (void)manualSyncForAccountID:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[CachedServerDataService sharedService];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100019FB0;
  v9[3] = &unk_100111FC0;
  id v10 = v5;
  id v8 = v5;
  [v7 manualSyncFor:v6 completionHandler:v9];
}

- (void)accountAuthSyncForAccountID:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[CachedServerDataService sharedService];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001A11C;
  v9[3] = &unk_100111FC0;
  id v10 = v5;
  id v8 = v5;
  [v7 accountAuthSyncFor:v6 completionHandler:v9];
}

@end