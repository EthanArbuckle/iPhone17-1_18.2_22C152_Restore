@interface HearingTestInterruptionManager
- (_TtC13HearingTestUI30HearingTestInterruptionManager)init;
- (void)dealloc;
- (void)sceneDidEnterBackground;
- (void)sceneWillDeactivateNotification;
@end

@implementation HearingTestInterruptionManager

- (void)dealloc
{
  v2 = self;
  sub_2513EED50();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for HearingTestInterruptionManager();
  [(HearingTestInterruptionManager *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13HearingTestUI30HearingTestInterruptionManager_interruptions));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13HearingTestUI30HearingTestInterruptionManager_interruptionQueue));
  swift_unknownObjectRelease();
  swift_release();
  sub_2513F204C((uint64_t)self + OBJC_IVAR____TtC13HearingTestUI30HearingTestInterruptionManager_noiseStatusProvider);
  sub_2513F2370((uint64_t)self + OBJC_IVAR____TtC13HearingTestUI30HearingTestInterruptionManager_currentNoiseStatus, (unint64_t *)&qword_269B36868, (uint64_t)&type metadata for NoiseStatus);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13HearingTestUI30HearingTestInterruptionManager_mockInterruptProvider));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC13HearingTestUI30HearingTestInterruptionManager_delegate;

  sub_2513A810C((uint64_t)v3);
}

- (_TtC13HearingTestUI30HearingTestInterruptionManager)init
{
  result = (_TtC13HearingTestUI30HearingTestInterruptionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)sceneDidEnterBackground
{
  v2 = self;
  sub_2513F0A9C("[%{public}s] Received UIScene.didEnterBackgroundNotification and will add the interruption.", (uint64_t)&unk_270238820, (uint64_t)sub_2513F2C50, (uint64_t)&block_descriptor_58);
}

- (void)sceneWillDeactivateNotification
{
  v2 = self;
  sub_2513F0A9C("[%{public}s] Received UIScene.willDeactivateNotification and will add the interruption.", (uint64_t)&unk_2702387D0, (uint64_t)sub_2513F2C18, (uint64_t)&block_descriptor_52);
}

@end