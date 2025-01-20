@interface SensorButtonState
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC11DockKitCore17SensorButtonState)init;
- (_TtC11DockKitCore17SensorButtonState)initWithCoder:(id)a3;
- (_TtC11DockKitCore17SensorButtonState)initWithState:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SensorButtonState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)sub_24CEC60D0(self, (uint64_t)a2, (void (*)(void))sub_24CEC5BB4);
}

- (_TtC11DockKitCore17SensorButtonState)initWithState:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore17SensorButtonState_state) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SensorButtonState();
  return [(SensorData *)&v4 init];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore17SensorButtonState_state);
  id v5 = a3;
  v6 = self;
  id v7 = (id)sub_24CF3B300();
  objc_msgSend(v5, sel_encodeInteger_forKey_, v4, v7);
}

- (_TtC11DockKitCore17SensorButtonState)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (_TtC11DockKitCore17SensorButtonState *)sub_24CEC6754(v3);

  return v4;
}

- (_TtC11DockKitCore17SensorButtonState)init
{
  result = (_TtC11DockKitCore17SensorButtonState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end