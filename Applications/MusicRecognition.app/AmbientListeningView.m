@interface AmbientListeningView
- (_TtC16MusicRecognition20AmbientListeningView)initWithCoder:(id)a3;
- (_TtC16MusicRecognition20AmbientListeningView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AmbientListeningView

- (_TtC16MusicRecognition20AmbientListeningView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicRecognition20AmbientListeningView *)sub_10001BB84(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicRecognition20AmbientListeningView)initWithCoder:(id)a3
{
  return (_TtC16MusicRecognition20AmbientListeningView *)sub_10001C620(a3);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(AmbientListeningView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC16MusicRecognition20AmbientListeningView_listeningLayer];
  [*(id *)&v2[OBJC_IVAR____TtC16MusicRecognition20AmbientListeningView_listeningLayerView] bounds];
  [v3 setFrame:];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition20AmbientListeningView_listeningLayerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition20AmbientListeningView_listeningLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition20AmbientListeningView_listeningLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicRecognition20AmbientListeningView_cancelButton);
}

@end