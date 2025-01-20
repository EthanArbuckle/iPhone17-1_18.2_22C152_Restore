@interface ProxCardFlowEngine
- (_TtC21TDGSharingViewService18ProxCardFlowEngine)init;
- (void)dealloc;
- (void)handleDeviceSetupNotification:(id)a3;
@end

@implementation ProxCardFlowEngine

- (void)dealloc
{
  v2 = self;
  sub_100010BF8();
}

- (void).cxx_destruct
{
  sub_10000AFBC((uint64_t)self + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow);

  sub_100010098((uint64_t)self + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_currentStage, &qword_100046B20);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_navigationContoller));

  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_interactionEventPublisher));
  swift_release();

  swift_release();
}

- (void)handleDeviceSetupNotification:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_10001767C(v5);
}

- (_TtC21TDGSharingViewService18ProxCardFlowEngine)init
{
  result = (_TtC21TDGSharingViewService18ProxCardFlowEngine *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end