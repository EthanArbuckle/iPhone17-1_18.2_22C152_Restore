@interface WeatherDaemonDecommissioner
- (WeatherDaemonDecommissioner)init;
- (void)decomissionDaemonWithCompletion:(id)a3;
@end

@implementation WeatherDaemonDecommissioner

- (void)decomissionDaemonWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  DaemonDecommissioner.decomissionDaemon(with:)((uint64_t)sub_1000067C8, v5);

  swift_release();
}

- (WeatherDaemonDecommissioner)init
{
  return (WeatherDaemonDecommissioner *)DaemonDecommissioner.init()();
}

- (void).cxx_destruct
{
}

@end