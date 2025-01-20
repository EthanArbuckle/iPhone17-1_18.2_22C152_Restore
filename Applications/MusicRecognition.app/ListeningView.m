@interface ListeningView
- (_TtC16MusicRecognition13ListeningView)initWithCoder:(id)a3;
- (_TtC16MusicRecognition13ListeningView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ListeningView

- (_TtC16MusicRecognition13ListeningView)initWithFrame:(CGRect)a3
{
  sub_10009C6DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC16MusicRecognition13ListeningView)initWithCoder:(id)a3
{
  sub_10009D6F0(a3);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10009D92C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition13ListeningView_listeningView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition13ListeningView_listeningLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition13ListeningView_cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition13ListeningView_waveformView));
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicRecognition13ListeningView_listeningLabelVerticalAnchor);
}

@end