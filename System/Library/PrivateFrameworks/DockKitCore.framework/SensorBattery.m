@interface SensorBattery
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC11DockKitCore13SensorBattery)initWithCoder:(id)a3;
- (_TtC11DockKitCore21AccessoryBatteryState)state;
- (void)encodeWithCoder:(id)a3;
- (void)setState:(id)a3;
@end

@implementation SensorBattery

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC11DockKitCore21AccessoryBatteryState)state
{
  return (_TtC11DockKitCore21AccessoryBatteryState *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                             + OBJC_IVAR____TtC11DockKitCore13SensorBattery_state));
}

- (void)setState:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11DockKitCore13SensorBattery_state);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11DockKitCore13SensorBattery_state) = (Class)a3;
  id v3 = a3;
}

- (NSString)description
{
  v2 = self;
  sub_24CE75684();

  id v3 = (void *)sub_24CF3B300();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11DockKitCore13SensorBattery_state);
  id v6 = a3;
  v8 = self;
  v7 = (void *)sub_24CF3B300();
  objc_msgSend(v6, sel_encodeObject_forKey_, v5, v7);

  sub_24CEBECAC(v6);
}

- (_TtC11DockKitCore13SensorBattery)initWithCoder:(id)a3
{
  return (_TtC11DockKitCore13SensorBattery *)SensorBattery.init(coder:)(a3);
}

- (void).cxx_destruct
{
}

@end