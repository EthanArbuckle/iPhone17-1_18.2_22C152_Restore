@interface CCUIAnalyticsEventsController
- (CCUIAnalyticsEventsController)init;
- (void)analyticsLogMainViewControllerDismiss;
- (void)analyticsLogMainViewControllerPresent;
@end

@implementation CCUIAnalyticsEventsController

- (void)analyticsLogMainViewControllerPresent
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDFFEB0);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDFF6C8);
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = self;
  sub_1D7BB6B68();
  uint64_t v10 = sub_1D7BB6B78();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 0, 1, v10);
  uint64_t v11 = (uint64_t)v9 + OBJC_IVAR___CCUIAnalyticsEventsController_currentSessionIdentifier;
  swift_beginAccess();
  sub_1D7BA0284((uint64_t)v8, v11, &qword_1EBDFF6C8);
  swift_endAccess();
  sub_1D7BB6AF8();
  uint64_t v12 = sub_1D7BB6B08();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v5, 0, 1, v12);
  uint64_t v13 = (uint64_t)v9 + OBJC_IVAR___CCUIAnalyticsEventsController_sessionBeginTime;
  swift_beginAccess();
  sub_1D7BA0284((uint64_t)v5, v13, &qword_1EBDFFEB0);
  swift_endAccess();
}

- (void)analyticsLogMainViewControllerDismiss
{
  v2 = self;
  sub_1D7BA04C4();
}

- (CCUIAnalyticsEventsController)init
{
  uint64_t v3 = (char *)self + OBJC_IVAR___CCUIAnalyticsEventsController_currentSessionIdentifier;
  uint64_t v4 = sub_1D7BB6B78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = (char *)self + OBJC_IVAR___CCUIAnalyticsEventsController_sessionBeginTime;
  uint64_t v6 = sub_1D7BB6B08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AnalyticsEventsController();
  return [(CCUIAnalyticsEventsController *)&v8 init];
}

- (void).cxx_destruct
{
}

@end