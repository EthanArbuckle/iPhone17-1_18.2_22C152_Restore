@interface PLAnalyticsServiceMaintenance
- (PLAnalyticsServiceMaintenance)init;
- (void)performMaintenanceWithCompletion:(id)a3;
@end

@implementation PLAnalyticsServiceMaintenance

- (PLAnalyticsServiceMaintenance)init
{
  sub_3670();
  v3 = self;
  *(Class *)((char *)&v3->super.isa + OBJC_IVAR___PLAnalyticsServiceMaintenance_pluginScheduler) = (Class)sub_3660();

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for AnalyticsServiceMaintenance();
  return [(PLAnalyticsServiceMaintenance *)&v5 init];
}

- (void)performMaintenanceWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    objc_super v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_3610;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_20A8((uint64_t)v7, v6);
  sub_35C8((uint64_t)v7);
}

- (void).cxx_destruct
{
}

@end