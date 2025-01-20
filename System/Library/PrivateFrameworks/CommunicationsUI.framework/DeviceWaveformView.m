@interface DeviceWaveformView
- (_TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView)initWithCoder:(id)a3;
- (_TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DeviceWaveformView

- (_TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_needsFilterInLayer) = 1;
  uint64_t v5 = OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_barColor;
  v6 = self;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_whiteColor);
  v8 = (objc_class *)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_power) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_bandViews) = v8;

  result = (_TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView *)sub_24A669A68();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_24A60461C();
}

- (_TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUIP33_7D546AE62F90BDA71C61319073C0DD1B18DeviceWaveformView_barColor));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end