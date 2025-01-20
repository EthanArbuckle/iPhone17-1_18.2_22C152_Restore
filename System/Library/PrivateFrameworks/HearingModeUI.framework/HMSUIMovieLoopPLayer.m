@interface HMSUIMovieLoopPLayer
+ (Class)layerClass;
- (_TtC13HearingModeUI20HMSUIMovieLoopPLayer)initWithCoder:(id)a3;
- (_TtC13HearingModeUI20HMSUIMovieLoopPLayer)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation HMSUIMovieLoopPLayer

+ (Class)layerClass
{
  sub_25129A74C(0, &qword_269B2D828);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_251298A3C();
}

- (_TtC13HearingModeUI20HMSUIMovieLoopPLayer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_251299BD0();
}

- (_TtC13HearingModeUI20HMSUIMovieLoopPLayer)initWithFrame:(CGRect)a3
{
  result = (_TtC13HearingModeUI20HMSUIMovieLoopPLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_url;
  uint64_t v4 = sub_2512C3E98();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_playerLooper));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_playerLayer));
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13HearingModeUI20HMSUIMovieLoopPLayer_videoPlayer);
}

@end