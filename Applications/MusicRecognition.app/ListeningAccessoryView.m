@interface ListeningAccessoryView
- (CGSize)intrinsicContentSize;
- (_TtC16MusicRecognition22ListeningAccessoryView)initWithCoder:(id)a3;
- (_TtC16MusicRecognition22ListeningAccessoryView)initWithFrame:(CGRect)a3;
@end

@implementation ListeningAccessoryView

- (_TtC16MusicRecognition22ListeningAccessoryView)initWithFrame:(CGRect)a3
{
  sub_10005F8AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC16MusicRecognition22ListeningAccessoryView)initWithCoder:(id)a3
{
  sub_10005FE88(a3);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = 1.0;
  double v3 = 1.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition22ListeningAccessoryView_listeningView));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicRecognition22ListeningAccessoryView_imageView);
}

@end