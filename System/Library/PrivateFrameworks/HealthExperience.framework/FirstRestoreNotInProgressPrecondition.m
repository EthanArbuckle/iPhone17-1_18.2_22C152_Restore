@interface FirstRestoreNotInProgressPrecondition
- (NSString)description;
- (_TtC16HealthExperience37FirstRestoreNotInProgressPrecondition)init;
- (void)cloudSyncObserver:(id)a3 didFailToPopulateStatusWithError:(id)a4;
- (void)cloudSyncObserverStatusUpdated:(id)a3 status:(id)a4;
- (void)dealloc;
@end

@implementation FirstRestoreNotInProgressPrecondition

- (void)dealloc
{
  v2 = self;
  swift_retain();
  sub_1C28CC620();
  swift_release();
  sub_1C286C2A0();
  swift_retain();
  sub_1C28CC630();
  swift_release();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for FirstRestoreNotInProgressPrecondition();
  [(FirstRestoreNotInProgressPrecondition *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HealthExperience37FirstRestoreNotInProgressPrecondition_cloudSyncObserver));
  sub_1C27C0290(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16HealthExperience37FirstRestoreNotInProgressPrecondition_preconditionCompletion));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HealthExperience37FirstRestoreNotInProgressPrecondition_healthStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HealthExperience37FirstRestoreNotInProgressPrecondition_completionQueue));

  swift_release();
}

- (NSString)description
{
  v2 = self;
  sub_1C286C5C8();

  objc_super v3 = (void *)sub_1C28CD6F0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC16HealthExperience37FirstRestoreNotInProgressPrecondition)init
{
  result = (_TtC16HealthExperience37FirstRestoreNotInProgressPrecondition *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)cloudSyncObserverStatusUpdated:(id)a3 status:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1C286CF9C(v7);
}

- (void)cloudSyncObserver:(id)a3 didFailToPopulateStatusWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  _s16HealthExperience37FirstRestoreNotInProgressPreconditionC17cloudSyncObserver_32didFailToPopulateStatusWithErrorySo07HKCloudjK0C_s0R0_ptF_0();
}

@end