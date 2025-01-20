@interface AnimatedArtworkPlayerUIView
- (_TtC16MusicRecognitionP33_CD8D04CF73D338E472373D718D0990B827AnimatedArtworkPlayerUIView)initWithCoder:(id)a3;
- (_TtC16MusicRecognitionP33_CD8D04CF73D338E472373D718D0990B827AnimatedArtworkPlayerUIView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AnimatedArtworkPlayerUIView

- (_TtC16MusicRecognitionP33_CD8D04CF73D338E472373D718D0990B827AnimatedArtworkPlayerUIView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicRecognitionP33_CD8D04CF73D338E472373D718D0990B827AnimatedArtworkPlayerUIView_playerLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicRecognitionP33_CD8D04CF73D338E472373D718D0990B827AnimatedArtworkPlayerUIView_playbackLooper) = 0;
  id v4 = a3;

  result = (_TtC16MusicRecognitionP33_CD8D04CF73D338E472373D718D0990B827AnimatedArtworkPlayerUIView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(AnimatedArtworkPlayerUIView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC16MusicRecognitionP33_CD8D04CF73D338E472373D718D0990B827AnimatedArtworkPlayerUIView_playerLayer];
  if (v3)
  {
    id v4 = v3;
    [v2 bounds];
    [v4 setFrame:];

    v2 = v4;
  }
}

- (_TtC16MusicRecognitionP33_CD8D04CF73D338E472373D718D0990B827AnimatedArtworkPlayerUIView)initWithFrame:(CGRect)a3
{
  result = (_TtC16MusicRecognitionP33_CD8D04CF73D338E472373D718D0990B827AnimatedArtworkPlayerUIView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognitionP33_CD8D04CF73D338E472373D718D0990B827AnimatedArtworkPlayerUIView_playerLayer));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicRecognitionP33_CD8D04CF73D338E472373D718D0990B827AnimatedArtworkPlayerUIView_playbackLooper);
}

@end