@interface BalanceMetricOverlayContext
@end

@implementation BalanceMetricOverlayContext

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8HealthUI27BalanceMetricOverlayContext_selectedMetric;
  uint64_t v3 = sub_1E0ECBDF0();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end