@interface FMAVPlayerView
+ (Class)layerClass;
- (NSString)accessibilityAssetName;
- (NSString)description;
- (_TtC11FMFindingUI14FMAVPlayerView)initWithCoder:(id)a3;
- (_TtC11FMFindingUI14FMAVPlayerView)initWithFrame:(CGRect)a3;
- (void)dealloc;
@end

@implementation FMAVPlayerView

+ (Class)layerClass
{
  sub_24D2BC100(0, &qword_269861E20);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC11FMFindingUI14FMAVPlayerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24D31A9AC();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI14FMAVPlayerView_assetManager);
  id v3 = self;
  objc_msgSend(v2, sel_invalidate);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for FMAVPlayerView();
  [(FMAVPlayerView *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI14FMAVPlayerView_placeholderView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI14FMAVPlayerView_playerStartedObservation));
  swift_unknownObjectRelease();
  sub_24D2BC948((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI14FMAVPlayerView_playerTimeObserver);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_24D2E44C8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11FMFindingUI14FMAVPlayerView_playingHandler));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI14FMAVPlayerView_showHideHandler);
  sub_24D2E44C8(v3);
}

- (NSString)description
{
  v2 = self;
  sub_24D316294();

  uint64_t v3 = (void *)sub_24D39CAC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC11FMFindingUI14FMAVPlayerView)initWithFrame:(CGRect)a3
{
  result = (_TtC11FMFindingUI14FMAVPlayerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (NSString)accessibilityAssetName
{
  if (*(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC11FMFindingUI14FMAVPlayerView_assetName))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_24D39CAC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

@end