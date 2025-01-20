@interface FMR1HapticsController
- (NSString)description;
- (_TtC11FMFindingUI21FMR1HapticsController)init;
- (void)dealloc;
- (void)hapticDisplayLinkUpdateWithDisplaylink:(id)a3;
@end

@implementation FMR1HapticsController

- (_TtC11FMFindingUI21FMR1HapticsController)init
{
  return (_TtC11FMFindingUI21FMR1HapticsController *)sub_24D2FA864();
}

- (void)dealloc
{
  v2 = self;
  sub_24D2FAD28();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  sub_24D2BBFB4((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_tapHapticContext, &qword_269861850);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_singleTapSelectedHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_singleTap1HapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_singleTap2HapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_singleTap3HapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_singleTap4HapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_singleTap5HapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_connectedHapticPattern));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_scatterHapticPattern));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_aheadOffHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_armsReachHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_armsReachOffHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_preNearbyHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_nearbyHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_levelIncreaseHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_levelDecreaseHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_farNearHapticPattern));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_continuousHapticPattern));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_continuousHapticRampingFactorSpring));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC11FMFindingUI21FMR1HapticsController_playedHapticPatternHandler);
  sub_24D2E44C8(v3);
}

- (NSString)description
{
  v2 = self;
  sub_24D2FB1F8();

  uint64_t v3 = (void *)sub_24D39CAC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)hapticDisplayLinkUpdateWithDisplaylink:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D2FF590(v4);
}

@end