@interface ASCWatchApps
+ (ASCWatchApps)sharedWatchApps;
- (ASCAppOfferStateCenter)appOfferStateCenter;
- (ASCWatchApps)initWithAppOfferStateCenter:(id)a3;
- (id)reinstallAppWithID:(id)a3;
- (id)reinstallSystemAppWithBundleID:(id)a3;
@end

@implementation ASCWatchApps

+ (ASCWatchApps)sharedWatchApps
{
  if (sharedWatchApps_onceToken != -1) {
    dispatch_once(&sharedWatchApps_onceToken, &__block_literal_global_30);
  }
  v2 = (void *)sharedWatchApps_sharedWatchApps;

  return (ASCWatchApps *)v2;
}

void __31__ASCWatchApps_sharedWatchApps__block_invoke()
{
  v0 = [ASCWatchApps alloc];
  id v3 = +[ASCAppOfferStateCenter sharedCenter];
  uint64_t v1 = [(ASCWatchApps *)v0 initWithAppOfferStateCenter:v3];
  v2 = (void *)sharedWatchApps_sharedWatchApps;
  sharedWatchApps_sharedWatchApps = v1;
}

- (ASCWatchApps)initWithAppOfferStateCenter:(id)a3
{
  id v5 = a3;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v9.receiver = self;
  v9.super_class = (Class)ASCWatchApps;
  v6 = [(ASCWatchApps *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appOfferStateCenter, a3);
  }

  return v7;
}

- (id)reinstallAppWithID:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCWatchApps *)self appOfferStateCenter];
  v6 = [v5 reinstallWatchAppWithID:v4];

  return v6;
}

- (id)reinstallSystemAppWithBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCWatchApps *)self appOfferStateCenter];
  v6 = [v5 reinstallWatchSystemAppWithBundleID:v4];

  return v6;
}

- (ASCAppOfferStateCenter)appOfferStateCenter
{
  return self->_appOfferStateCenter;
}

- (void).cxx_destruct
{
}

@end