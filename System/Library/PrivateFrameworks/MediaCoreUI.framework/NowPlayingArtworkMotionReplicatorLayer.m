@interface NowPlayingArtworkMotionReplicatorLayer
- (_TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer)init;
- (_TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer)initWithCoder:(id)a3;
- (_TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer)initWithLayer:(id)a3;
- (void)layoutSublayers;
@end

@implementation NowPlayingArtworkMotionReplicatorLayer

- (_TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer)init
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer_originalContent) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for NowPlayingArtworkMotionReplicatorLayer();
  v2 = [(CAReplicatorLayer *)&v4 init];
  [(CAReplicatorLayer *)v2 setInstanceCount:2];
  return v2;
}

- (_TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer_originalContent) = 0;
  id v4 = a3;

  result = (_TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer *)sub_255C81248();
  __break(1u);
  return result;
}

- (void)layoutSublayers
{
  v2 = self;
  sub_255B8C99C();
}

- (_TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_255C80F58();
  swift_unknownObjectRelease();
  result = (_TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMotionReplicatorLayer_originalContent));
}

@end