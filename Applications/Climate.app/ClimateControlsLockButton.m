@interface ClimateControlsLockButton
- (_TtC7Climate25ClimateControlsLockButton)init;
- (void)climateControlsLockedService:(id)a3 didUpdateLockState:(unsigned __int8)a4;
@end

@implementation ClimateControlsLockButton

- (_TtC7Climate25ClimateControlsLockButton)init
{
  result = (_TtC7Climate25ClimateControlsLockButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate25ClimateControlsLockButton_controlsLock));
}

- (void)climateControlsLockedService:(id)a3 didUpdateLockState:(unsigned __int8)a4
{
  id v5 = a3;
  v6 = self;
  sub_10008CC60();
}

@end