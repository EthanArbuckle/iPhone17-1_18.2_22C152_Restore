@interface DockAccessoryHelper
- (_TtC7DockKit19DockAccessoryHelper)init;
- (void)actuatorFeedbackWithInfo:(id)a3 system:(id)a4 actuators:(id)a5 positions:(id)a6 velocities:(id)a7 timestamp:(double)a8;
- (void)batteryStateDataWithInfo:(id)a3 data:(id)a4;
- (void)disconnectedWithErr:(id)a3;
- (void)systemEventDataWithInfo:(id)a3 data:(id)a4;
- (void)trackingSummaryDataWithInfo:(id)a3 data:(id)a4;
- (void)trajectoryProgressFeedbackWithInfo:(id)a3 system:(id)a4 progress:(id)a5;
@end

@implementation DockAccessoryHelper

- (_TtC7DockKit19DockAccessoryHelper)init
{
  return (_TtC7DockKit19DockAccessoryHelper *)sub_243323668();
}

- (void)actuatorFeedbackWithInfo:(id)a3 system:(id)a4 actuators:(id)a5 positions:(id)a6 velocities:(id)a7 timestamp:(double)a8
{
  uint64_t v11 = sub_24334A6C0();
  uint64_t v12 = sub_24334A6C0();
  uint64_t v13 = sub_24334A6C0();
  id v14 = a3;
  v15 = self;
  sub_24334180C(a8, (uint64_t)v14, v11, v12, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)systemEventDataWithInfo:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24332393C((uint64_t)v6, v7);
}

- (void)batteryStateDataWithInfo:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_243323AB8((uint64_t)v6, v7);
}

- (void)trackingSummaryDataWithInfo:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_243323DA4();
}

- (void)trajectoryProgressFeedbackWithInfo:(id)a3 system:(id)a4 progress:(id)a5
{
  uint64_t v8 = sub_24334A600();
  v10 = v9;
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = self;
  sub_2433419B8(v8, v10, v12);

  swift_bridgeObjectRelease();
}

- (void)disconnectedWithErr:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_24332411C((uint64_t)a3);
}

- (void).cxx_destruct
{
  sub_243322990(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_feedbackCallback));
  sub_243322990(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_eventCallback));
  sub_243322990(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_batteryCallback));
  sub_243322990(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingSummaryCallback));
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_logger;
  uint64_t v4 = sub_24334A5B0();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end