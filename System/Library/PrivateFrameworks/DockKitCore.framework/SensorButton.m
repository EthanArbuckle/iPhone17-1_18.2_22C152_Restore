@interface SensorButton
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC11DockKitCore12SensorButton)initWithCoder:(id)a3;
- (_TtC11DockKitCore17SensorButtonState)state;
- (void)encodeWithCoder:(id)a3;
- (void)setState:(id)a3;
@end

@implementation SensorButton

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC11DockKitCore17SensorButtonState)state
{
  return (_TtC11DockKitCore17SensorButtonState *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                         + OBJC_IVAR____TtC11DockKitCore12SensorButton_state));
}

- (void)setState:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11DockKitCore12SensorButton_state);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11DockKitCore12SensorButton_state) = (Class)a3;
  id v3 = a3;
}

- (NSString)description
{
  return (NSString *)sub_24CEC60D0(self, (uint64_t)a2, (void (*)(void))sub_24CEC6140);
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11DockKitCore12SensorButton_state);
  id v6 = a3;
  v8 = self;
  v7 = (void *)sub_24CF3B300();
  objc_msgSend(v6, sel_encodeObject_forKey_, v5, v7);

  sub_24CEBECAC(v6);
}

- (_TtC11DockKitCore12SensorButton)initWithCoder:(id)a3
{
  return (_TtC11DockKitCore12SensorButton *)SensorButton.init(coder:)(a3);
}

- (void).cxx_destruct
{
}

@end