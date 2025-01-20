@interface _ACSBatteryServiceOptions
- (_ACSBatteryServiceOptions)init;
- (_ACSBatteryServiceOptions)initWithValues:(id)a3;
@end

@implementation _ACSBatteryServiceOptions

- (_ACSBatteryServiceOptions)init
{
  v2 = self;
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____ACSBatteryServiceOptions_storage) = (Class)sub_247EAEFB0(MEMORY[0x263F8EE78]);

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for BatteryServiceOptions();
  return [(_ACSBatteryServiceOptions *)&v4 init];
}

- (_ACSBatteryServiceOptions)initWithValues:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____ACSBatteryServiceOptions_storage) = (Class)sub_247EBC3D0();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BatteryServiceOptions();
  return [(_ACSBatteryServiceOptions *)&v5 init];
}

- (void).cxx_destruct
{
}

@end