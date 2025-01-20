@interface ProxMovieLoopPlayer
+ (Class)layerClass;
- (_TtC20HeadphoneProxService19ProxMovieLoopPlayer)initWithCoder:(id)a3;
- (_TtC20HeadphoneProxService19ProxMovieLoopPlayer)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProxMovieLoopPlayer

+ (Class)layerClass
{
  sub_100027AB4();

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10002750C();
}

- (_TtC20HeadphoneProxService19ProxMovieLoopPlayer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100027994();
}

- (_TtC20HeadphoneProxService19ProxMovieLoopPlayer)initWithFrame:(CGRect)a3
{
  result = (_TtC20HeadphoneProxService19ProxMovieLoopPlayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20HeadphoneProxService19ProxMovieLoopPlayer_player));
  id v3 = (char *)self + OBJC_IVAR____TtC20HeadphoneProxService19ProxMovieLoopPlayer_url;
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20HeadphoneProxService19ProxMovieLoopPlayer_playerLooper));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20HeadphoneProxService19ProxMovieLoopPlayer_playerLayer));
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20HeadphoneProxService19ProxMovieLoopPlayer_videoPlayer);
}

@end