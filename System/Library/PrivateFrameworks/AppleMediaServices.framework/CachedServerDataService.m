@interface CachedServerDataService
+ (_TtC12amsaccountsd23CachedServerDataService)sharedService;
- (_TtC12amsaccountsd23CachedServerDataService)init;
- (void)accountAuthSyncFor:(AMSAccountIdentity *)a3 completionHandler:(id)a4;
- (void)changeAutoPlayFor:(AMSAccountIdentity *)a3 to:(BOOL)a4 completionHandler:(id)a5;
- (void)changePersonalizationFor:(AMSAccountIdentity *)a3 to:(BOOL)a4 completionHandler:(id)a5;
- (void)dataWithAccounts:(NSArray *)a3 completionHandler:(id)a4;
- (void)manualSyncFor:(AMSAccountIdentity *)a3 completionHandler:(id)a4;
- (void)performOnStartup;
- (void)queueMetricsEventFor:(NSDate *)a3 appID:(NSString *)a4 completionHandler:(id)a5;
- (void)removeDataFor:(AMSAccountIdentity *)a3 completionHandler:(id)a4;
- (void)scheduleSyncFromPushWithDsid:(unint64_t)a3 completionHandler:(id)a4;
@end

@implementation CachedServerDataService

+ (_TtC12amsaccountsd23CachedServerDataService)sharedService
{
  id v2 = sub_10000405C();
  return (_TtC12amsaccountsd23CachedServerDataService *)v2;
}

- (void)queueMetricsEventFor:(NSDate *)a3 appID:(NSString *)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_10000E8D0((uint64_t)&unk_10012F7F0, (uint64_t)v9);
}

- (void)dataWithAccounts:(NSArray *)a3 completionHandler:(id)a4
{
}

- (_TtC12amsaccountsd23CachedServerDataService)init
{
  sub_1000A2DD0();
  return result;
}

- (void)changeAutoPlayFor:(AMSAccountIdentity *)a3 to:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)changePersonalizationFor:(AMSAccountIdentity *)a3 to:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)scheduleSyncFromPushWithDsid:(unint64_t)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = self;
  sub_10000E8D0((uint64_t)&unk_10012F870, (uint64_t)v7);
}

- (void)removeDataFor:(AMSAccountIdentity *)a3 completionHandler:(id)a4
{
}

- (void)accountAuthSyncFor:(AMSAccountIdentity *)a3 completionHandler:(id)a4
{
}

- (void)performOnStartup
{
  id v2 = self;
  sub_1000A80B0();
}

- (void)manualSyncFor:(AMSAccountIdentity *)a3 completionHandler:(id)a4
{
}

- (void).cxx_destruct
{
  sub_10000D47C((uint64_t)self + OBJC_IVAR____TtC12amsaccountsd23CachedServerDataService_metrics);
}

@end