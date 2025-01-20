@interface NowPlayingArtworkMirrorReplicatorLayer
- (_TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer)init;
- (_TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer)initWithCoder:(id)a3;
- (_TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer)initWithLayer:(id)a3;
- (void)layoutSublayers;
@end

@implementation NowPlayingArtworkMirrorReplicatorLayer

- (void)layoutSublayers
{
  v2 = self;
  sub_255C6E4FC();
}

- (_TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer)init
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer_image) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer_imageLayer) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NowPlayingArtworkMirrorReplicatorLayer();
  return [(CAReplicatorLayer *)&v3 init];
}

- (_TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_255C80F58();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer_image) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer_imageLayer) = 0;
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  uint64_t v4 = sub_255C81418();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for NowPlayingArtworkMirrorReplicatorLayer();
  v5 = [(NowPlayingArtworkMirrorReplicatorLayer *)&v7 initWithLayer:v4];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v5;
}

- (_TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer_image) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer_imageLayer) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NowPlayingArtworkMirrorReplicatorLayer();
  return [(NowPlayingArtworkMirrorReplicatorLayer *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer_image));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MediaCoreUI38NowPlayingArtworkMirrorReplicatorLayer_imageLayer);
}

@end