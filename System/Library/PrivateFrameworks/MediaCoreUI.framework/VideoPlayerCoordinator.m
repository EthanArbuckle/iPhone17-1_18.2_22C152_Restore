@interface VideoPlayerCoordinator
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC11MediaCoreUIP33_8A49DC2FB69555F909B7715363263FF722VideoPlayerCoordinator)init;
- (void)didPinch:(id)a3;
- (void)didTap;
- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)videoOutput:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)videoOutput:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4;
@end

@implementation VideoPlayerCoordinator

- (void)didTap
{
  v2 = self;
  sub_255C40C6C();
}

- (void)didPinch:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_255C40F24(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_255C41124((uint64_t)v6, v7);

  return v9 & 1;
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  sub_255C42110(v6, a4);

  swift_unknownObjectRelease();
}

- (void)videoOutput:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
}

- (void)videoOutput:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v7 = self;
  sub_255C4225C((uint64_t)a3, a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (_TtC11MediaCoreUIP33_8A49DC2FB69555F909B7715363263FF722VideoPlayerCoordinator)init
{
  result = (_TtC11MediaCoreUIP33_8A49DC2FB69555F909B7715363263FF722VideoPlayerCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MediaCoreUIP33_8A49DC2FB69555F909B7715363263FF722VideoPlayerCoordinator_tapGestureRecognizer));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11MediaCoreUIP33_8A49DC2FB69555F909B7715363263FF722VideoPlayerCoordinator_pinchGestureRecognizer);
}

@end