@interface SensorLEDState
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC11DockKitCore14SensorLEDState)init;
- (_TtC11DockKitCore14SensorLEDState)initWithCoder:(id)a3;
- (_TtC11DockKitCore14SensorLEDState)initWithState:(int64_t)a3 brightness:(double)a4 color:(double)a5;
- (double)brightness;
- (double)color;
- (void)encodeWithCoder:(id)a3;
- (void)setBrightness:(double)a3;
- (void)setColor:(double)a3;
@end

@implementation SensorLEDState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)brightness
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore14SensorLEDState_brightness);
}

- (void)setBrightness:(double)a3
{
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore14SensorLEDState_brightness) = a3;
}

- (double)color
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore14SensorLEDState_color);
}

- (void)setColor:(double)a3
{
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore14SensorLEDState_color) = a3;
}

- (NSString)description
{
  return (NSString *)sub_24CEBE218(self, (uint64_t)a2, (void (*)(void))sub_24CEBDBDC);
}

- (_TtC11DockKitCore14SensorLEDState)initWithState:(int64_t)a3 brightness:(double)a4 color:(double)a5
{
  uint64_t v5 = OBJC_IVAR____TtC11DockKitCore14SensorLEDState_brightness;
  uint64_t v6 = OBJC_IVAR____TtC11DockKitCore14SensorLEDState_color;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore14SensorLEDState_state) = (Class)a3;
  *(double *)((char *)&self->super.super.isa + v5) = a4;
  *(double *)((char *)&self->super.super.isa + v6) = a5;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SensorLEDState();
  return [(SensorData *)&v8 init];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24CEBDEA8(v4);
}

- (_TtC11DockKitCore14SensorLEDState)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC11DockKitCore14SensorLEDState *)sub_24CEBE8BC(v3);

  return v4;
}

- (_TtC11DockKitCore14SensorLEDState)init
{
  result = (_TtC11DockKitCore14SensorLEDState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end