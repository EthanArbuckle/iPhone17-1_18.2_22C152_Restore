@interface ClimateFanServiceStepper
- (void)fanService:(id)a3 didUpdateAutoMode:(BOOL)a4;
- (void)fanService:(id)a3 didUpdateFanLevel:(unsigned __int8)a4;
- (void)fanService:(id)a3 didUpdateOn:(BOOL)a4;
@end

@implementation ClimateFanServiceStepper

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate24ClimateFanServiceStepper_fan));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate24ClimateFanServiceStepper_fanButton));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate24ClimateFanServiceStepper_powerButton);
}

- (void)fanService:(id)a3 didUpdateFanLevel:(unsigned __int8)a4
{
  id v5 = a3;
  v6 = self;
  sub_100086160();
}

- (void)fanService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_10008625C();
}

- (void)fanService:(id)a3 didUpdateAutoMode:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  ClimateStepper.updatePresentation()();
}

@end