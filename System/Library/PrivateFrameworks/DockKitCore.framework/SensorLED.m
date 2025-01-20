@interface SensorLED
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC11DockKitCore14SensorLEDState)state;
- (_TtC11DockKitCore9SensorLED)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setState:(id)a3;
@end

@implementation SensorLED

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC11DockKitCore14SensorLEDState)state
{
  return (_TtC11DockKitCore14SensorLEDState *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                      + OBJC_IVAR____TtC11DockKitCore9SensorLED_state));
}

- (void)setState:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11DockKitCore9SensorLED_state);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11DockKitCore9SensorLED_state) = (Class)a3;
  id v3 = a3;
}

- (NSString)description
{
  return (NSString *)sub_24CEBE218(self, (uint64_t)a2, (void (*)(void))sub_24CEBE288);
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11DockKitCore9SensorLED_state);
  id v6 = a3;
  v8 = self;
  v7 = (void *)sub_24CF3B300();
  objc_msgSend(v6, sel_encodeObject_forKey_, v5, v7);

  sub_24CEBECAC(v6);
}

- (_TtC11DockKitCore9SensorLED)initWithCoder:(id)a3
{
  return (_TtC11DockKitCore9SensorLED *)SensorLED.init(coder:)(a3);
}

- (void).cxx_destruct
{
}

@end