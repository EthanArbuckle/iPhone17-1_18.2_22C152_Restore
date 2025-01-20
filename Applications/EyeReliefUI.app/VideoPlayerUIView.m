@interface VideoPlayerUIView
- (_TtC11EyeReliefUI17VideoPlayerUIView)initWithCoder:(id)a3;
- (_TtC11EyeReliefUI17VideoPlayerUIView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation VideoPlayerUIView

- (_TtC11EyeReliefUI17VideoPlayerUIView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC11EyeReliefUI17VideoPlayerUIView_videoLayer;
  id v6 = objc_allocWithZone((Class)AVPlayerLayer);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11EyeReliefUI17VideoPlayerUIView_videoLooper) = 0;

  result = (_TtC11EyeReliefUI17VideoPlayerUIView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for VideoPlayerUIView();
  v2 = (char *)v4.receiver;
  [(VideoPlayerUIView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC11EyeReliefUI17VideoPlayerUIView_videoLayer];
  [v2 bounds];
  [v3 setFrame:];
}

- (_TtC11EyeReliefUI17VideoPlayerUIView)initWithFrame:(CGRect)a3
{
  result = (_TtC11EyeReliefUI17VideoPlayerUIView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11EyeReliefUI17VideoPlayerUIView_videoLooper);
}

@end