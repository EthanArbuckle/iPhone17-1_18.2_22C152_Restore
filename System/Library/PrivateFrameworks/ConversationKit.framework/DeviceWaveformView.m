@interface DeviceWaveformView
- (_TtC15ConversationKit18DeviceWaveformView)init;
- (_TtC15ConversationKit18DeviceWaveformView)initWithCoder:(id)a3;
- (_TtC15ConversationKit18DeviceWaveformView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DeviceWaveformView

- (_TtC15ConversationKit18DeviceWaveformView)init
{
  return (_TtC15ConversationKit18DeviceWaveformView *)DeviceWaveformView.init()();
}

- (_TtC15ConversationKit18DeviceWaveformView)initWithCoder:(id)a3
{
  id v3 = a3;
  DeviceWaveformView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  DeviceWaveformView.layoutSubviews()();
}

- (_TtC15ConversationKit18DeviceWaveformView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit18DeviceWaveformView_barColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit18DeviceWaveformView_filterType));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end