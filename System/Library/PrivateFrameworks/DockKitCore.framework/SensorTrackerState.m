@interface SensorTrackerState
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC11DockKitCore18SensorTrackerState)init;
- (_TtC11DockKitCore18SensorTrackerState)initWithCoder:(id)a3;
- (_TtC11DockKitCore18SensorTrackerState)initWithState:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SensorTrackerState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)sub_24CE763E8(self, (uint64_t)a2, (void (*)(void))sub_24CE75DC0);
}

- (_TtC11DockKitCore18SensorTrackerState)initWithState:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore18SensorTrackerState_state) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SensorTrackerState();
  return [(SensorData *)&v4 init];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore18SensorTrackerState_state);
  id v5 = a3;
  v6 = self;
  id v7 = (id)sub_24CF3B300();
  objc_msgSend(v5, sel_encodeInteger_forKey_, v4, v7);
}

- (_TtC11DockKitCore18SensorTrackerState)initWithCoder:(id)a3
{
  return (_TtC11DockKitCore18SensorTrackerState *)SensorTrackerState.init(coder:)(a3);
}

- (_TtC11DockKitCore18SensorTrackerState)init
{
  result = (_TtC11DockKitCore18SensorTrackerState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end