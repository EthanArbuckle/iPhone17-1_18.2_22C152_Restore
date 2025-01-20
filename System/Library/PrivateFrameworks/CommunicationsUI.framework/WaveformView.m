@interface WaveformView
- (_TtC16CommunicationsUI12WaveformView)initWithCoder:(id)a3;
- (_TtC16CommunicationsUI12WaveformView)initWithFrame:(CGRect)a3;
- (void)setNeedsLayout;
@end

@implementation WaveformView

- (void)setNeedsLayout
{
  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType();
  [(WaveformView *)&v2 setNeedsLayout];
}

- (_TtC16CommunicationsUI12WaveformView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24A6051C8();
}

- (_TtC16CommunicationsUI12WaveformView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_localBarColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_remoteBarColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___backdropLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView);
}

@end