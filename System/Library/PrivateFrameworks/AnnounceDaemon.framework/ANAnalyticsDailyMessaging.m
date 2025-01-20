@interface ANAnalyticsDailyMessaging
- (ANAnalyticsDailyMessaging)init;
- (ANRapportConnectionProvider)rapportConnection;
- (BOOL)isDeviceAnalyticsCoordinator;
- (NSDictionary)devicesCountingAnnouncements;
- (void)registerDailyRequest:(id)a3;
- (void)sendDailyRequest:(id)a3 handler:(id)a4;
@end

@implementation ANAnalyticsDailyMessaging

- (ANAnalyticsDailyMessaging)init
{
  v6.receiver = self;
  v6.super_class = (Class)ANAnalyticsDailyMessaging;
  v2 = [(ANAnalyticsDailyMessaging *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[ANRapportConnection sharedConnection];
    rapportConnection = v2->_rapportConnection;
    v2->_rapportConnection = (ANRapportConnectionProvider *)v3;
  }
  return v2;
}

- (NSDictionary)devicesCountingAnnouncements
{
  v2 = [(ANAnalyticsDailyMessaging *)self rapportConnection];
  uint64_t v3 = [v2 devices];
  v4 = [v3 activeAccessoryDevicesSupportingAnnounce];

  return (NSDictionary *)v4;
}

- (BOOL)isDeviceAnalyticsCoordinator
{
  uint64_t v3 = [(ANAnalyticsDailyMessaging *)self devicesCountingAnnouncements];
  v4 = [(ANAnalyticsDailyMessaging *)self rapportConnection];
  v5 = [v4 localDevice];

  objc_super v6 = [v3 allKeys];
  v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_25];

  if ([v3 count])
  {
    v8 = [v5 homeKitIdentifier];
    v9 = [v8 UUIDString];
    v10 = [v7 objectAtIndexedSubscript:0];
    v11 = [v10 UUIDString];
    BOOL v12 = [v9 compare:v11] == -1;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

uint64_t __57__ANAnalyticsDailyMessaging_isDeviceAnalyticsCoordinator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 UUIDString];
  objc_super v6 = [v4 UUIDString];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)registerDailyRequest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(ANAnalyticsDailyMessaging *)self rapportConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__ANAnalyticsDailyMessaging_registerDailyRequest___block_invoke;
  v7[3] = &unk_1E6BCE9A0;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 activateLinkWithOptions:2 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __50__ANAnalyticsDailyMessaging_registerDailyRequest___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained rapportConnection];
  [v2 registerDailyRequest:*(void *)(a1 + 32)];
}

- (void)sendDailyRequest:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ANAnalyticsDailyMessaging *)self rapportConnection];
  [v8 sendDailyRequest:v7 handler:v6];
}

- (ANRapportConnectionProvider)rapportConnection
{
  return self->_rapportConnection;
}

- (void).cxx_destruct
{
}

@end