@interface GameCenterViewControllerOverlay
- (_TtC12GameCenterUI31GameCenterViewControllerOverlay)init;
- (void)didDismissDashboard;
- (void)finishAndPlay:(id)a3;
- (void)finishWith:(id)a3;
- (void)quitTurnBasedMatch:(id)a3;
@end

@implementation GameCenterViewControllerOverlay

- (_TtC12GameCenterUI31GameCenterViewControllerOverlay)init
{
  return (_TtC12GameCenterUI31GameCenterViewControllerOverlay *)sub_1AF455F80();
}

- (void)didDismissDashboard
{
  v2 = self;
  sub_1AF456110();
}

- (void)finishAndPlay:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF456814(v4, (uint64_t)&unk_1F079E340, (uint64_t)&unk_1E9AC6690);
}

- (void)finishWith:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF456814(v4, (uint64_t)&unk_1F079E318, (uint64_t)&unk_1E9AC6680);
}

- (void)quitTurnBasedMatch:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF456814(v4, (uint64_t)&unk_1F079E2F0, (uint64_t)&unk_1E9AC6670);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31GameCenterViewControllerOverlay_clientProxy));

  swift_unknownObjectWeakDestroy();
}

@end