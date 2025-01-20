@interface HSPCCHIPPartnerHomeProvider
- (id)loadData;
- (id)userFacingStringForItem:(id)a3;
@end

@implementation HSPCCHIPPartnerHomeProvider

- (id)loadData
{
  v3 = [(HSPCDataProvider *)self config];
  v4 = [v3 matterDeviceSetupRequest];

  if (v4)
  {
    v5 = [v4 topology];
    v6 = [v5 homes];
    [(HSPCDataProvider *)self setItems:v6];

    [(HSPCDataProvider *)self setLoaded:1];
    v7 = +[NAFuture futureWithNoResult];
  }
  else
  {
    v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100068D44(v8);
    }

    v9 = +[NSError hmfErrorWithCode:8];
    v7 = +[NAFuture futureWithError:v9];
  }

  return v7;
}

- (id)userFacingStringForItem:(id)a3
{
  return [a3 name];
}

@end