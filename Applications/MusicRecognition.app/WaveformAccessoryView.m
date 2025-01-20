@interface WaveformAccessoryView
- (CGSize)intrinsicContentSize;
- (_TtC16MusicRecognition21WaveformAccessoryView)initWithCoder:(id)a3;
- (_TtC16MusicRecognition21WaveformAccessoryView)initWithFrame:(CGRect)a3;
@end

@implementation WaveformAccessoryView

- (_TtC16MusicRecognition21WaveformAccessoryView)initWithFrame:(CGRect)a3
{
  sub_100027F58(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC16MusicRecognition21WaveformAccessoryView)initWithCoder:(id)a3
{
  sub_1000285F0(a3);
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
                     + OBJC_IVAR____TtC16MusicRecognition21WaveformAccessoryView_waveformView));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicRecognition21WaveformAccessoryView_listeningView);
}

@end