@interface AmbientNoMatchView
- (_TtC16MusicRecognition18AmbientNoMatchView)initWithCoder:(id)a3;
- (_TtC16MusicRecognition18AmbientNoMatchView)initWithFrame:(CGRect)a3;
@end

@implementation AmbientNoMatchView

- (_TtC16MusicRecognition18AmbientNoMatchView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicRecognition18AmbientNoMatchView *)sub_1000E9484(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicRecognition18AmbientNoMatchView)initWithCoder:(id)a3
{
  return (_TtC16MusicRecognition18AmbientNoMatchView *)sub_1000EA1D4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition18AmbientNoMatchView_retryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition18AmbientNoMatchView_titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicRecognition18AmbientNoMatchView_stackView);
}

@end