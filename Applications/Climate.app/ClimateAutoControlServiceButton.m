@interface ClimateAutoControlServiceButton
- (_TtC7Climate31ClimateAutoControlServiceButton)init;
- (void)autoClimateControlService:(void *)a3 didUpdateLevel:;
@end

@implementation ClimateAutoControlServiceButton

- (_TtC7Climate31ClimateAutoControlServiceButton)init
{
  result = (_TtC7Climate31ClimateAutoControlServiceButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate31ClimateAutoControlServiceButton_autoClimateControl));
}

- (void)autoClimateControlService:(void *)a3 didUpdateLevel:
{
  v4 = *(void (**)(void))((swift_isaMask & *a1) + 0x220);
  id v5 = a3;
  v6 = a1;
  v4();
}

@end