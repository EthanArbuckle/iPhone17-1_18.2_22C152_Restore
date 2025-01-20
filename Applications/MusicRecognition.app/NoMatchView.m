@interface NoMatchView
- (_TtC16MusicRecognition11NoMatchView)initWithCoder:(id)a3;
- (_TtC16MusicRecognition11NoMatchView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NoMatchView

- (_TtC16MusicRecognition11NoMatchView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicRecognition11NoMatchView *)sub_1000C77EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicRecognition11NoMatchView)initWithCoder:(id)a3
{
  return (_TtC16MusicRecognition11NoMatchView *)sub_1000C82E4(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000C8418();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition11NoMatchView_noMatchLabel));

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicRecognition11NoMatchView_noMatchLabelVerticalAnchor);
}

@end