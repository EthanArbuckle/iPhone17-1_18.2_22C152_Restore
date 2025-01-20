@interface ClimateFanContinuousStepper
- (void)fanService:(id)a3 didUpdateAutoMode:(BOOL)a4;
- (void)fanService:(id)a3 didUpdateFanLevel:(unsigned __int8)a4;
- (void)fanService:(id)a3 didUpdateOn:(BOOL)a4;
@end

@implementation ClimateFanContinuousStepper

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate27ClimateFanContinuousStepper_fan));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate27ClimateFanContinuousStepper_powerButton);
}

- (void)fanService:(id)a3 didUpdateFanLevel:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  v7 = self;
  sub_1000A1E98(v6, v4);
}

- (void)fanService:(id)a3 didUpdateOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = self;
  sub_1000A2464(v6, v4);
}

- (void)fanService:(id)a3 didUpdateAutoMode:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  sub_10009FF30();
}

@end