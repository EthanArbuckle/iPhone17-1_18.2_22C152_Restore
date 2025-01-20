@interface ClimateVentServiceButton
- (_TtC7Climate24ClimateVentServiceButton)init;
- (void)ventService:(id)a3 didUpdateAutoMode:(BOOL)a4;
- (void)ventService:(id)a3 didUpdateCombinations:(id)a4;
- (void)ventService:(id)a3 didUpdateCurrentIndex:(unsigned int)a4;
- (void)ventService:(id)a3 didUpdateOn:(BOOL)a4;
@end

@implementation ClimateVentServiceButton

- (_TtC7Climate24ClimateVentServiceButton)init
{
  *((unsigned char *)&self->super.super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC7Climate24ClimateVentServiceButton_lockButtonToDisabledState) = 0;
  *(_DWORD *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC7Climate24ClimateVentServiceButton_currentValue) = 0;
  v2 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC7Climate24ClimateVentServiceButton_defaultSymbolName);
  void *v2 = 0xD000000000000012;
  v2[1] = 0x80000001000B7C20;

  result = (_TtC7Climate24ClimateVentServiceButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate24ClimateVentServiceButton_vent));

  swift_bridgeObjectRelease();
}

- (void)ventService:(id)a3 didUpdateCombinations:(id)a4
{
  v5 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate24ClimateVentServiceButton_vent);
  id v6 = a3;
  v8 = self;
  unsigned int v7 = [v5 currentIndex];
  *(_DWORD *)((char *)&v8->super.super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC7Climate24ClimateVentServiceButton_currentValue) = v7;
  sub_100066D70();
  sub_100066D70();
}

- (void)ventService:(id)a3 didUpdateCurrentIndex:(unsigned int)a4
{
  *(_DWORD *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC7Climate24ClimateVentServiceButton_currentValue) = a4;
  id v5 = a3;
  id v6 = self;
  sub_100066D70();
  sub_100066D70();
}

- (void)ventService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  sub_100067E04(v5);
}

- (void)ventService:(id)a3 didUpdateAutoMode:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  sub_100066D70();
}

@end