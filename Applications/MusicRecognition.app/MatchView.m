@interface MatchView
- (_TtC16MusicRecognition9MatchView)initWithCoder:(id)a3;
- (_TtC16MusicRecognition9MatchView)initWithFrame:(CGRect)a3;
@end

@implementation MatchView

- (_TtC16MusicRecognition9MatchView)initWithFrame:(CGRect)a3
{
  sub_1000B8354(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC16MusicRecognition9MatchView)initWithCoder:(id)a3
{
  sub_1000B8EBC(a3);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition9MatchView_appleMusicButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition9MatchView____lazy_storage___stackViewTrailingAnchorWithAppleMusicButton));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicRecognition9MatchView____lazy_storage___stackViewTrailingAnchorWithoutAppleMusicButton);
}

@end