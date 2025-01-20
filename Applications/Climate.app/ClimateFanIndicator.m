@interface ClimateFanIndicator
- (void)fanService:(id)a3 didUpdateAutoMode:(BOOL)a4;
- (void)fanService:(id)a3 didUpdateFanLevel:(unsigned __int8)a4;
- (void)fanService:(id)a3 didUpdateOn:(BOOL)a4;
@end

@implementation ClimateFanIndicator

- (void).cxx_destruct
{
  sub_100026DD0((uint64_t)self + OBJC_IVAR____TtC7Climate19ClimateFanIndicator_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate19ClimateFanIndicator_fan));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate19ClimateFanIndicator_fanButton));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate19ClimateFanIndicator_defaultProgressViewColorConfig);
  v4 = *(void **)&self->super.super.autoModeLabel[OBJC_IVAR____TtC7Climate19ClimateFanIndicator_defaultProgressViewColorConfig];
  v5 = *(void **)&self->super.super.action[OBJC_IVAR____TtC7Climate19ClimateFanIndicator_defaultProgressViewColorConfig];
  swift_bridgeObjectRelease();

  v6 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate19ClimateFanIndicator_autoModeGlyph);
}

- (void)fanService:(id)a3 didUpdateFanLevel:(unsigned __int8)a4
{
  id v6 = a3;
  v7 = self;
  sub_100062FAC(v6, a4);
}

- (void)fanService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  sub_100062AF8();
}

- (void)fanService:(id)a3 didUpdateAutoMode:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_100063350(v6, a4);
}

@end