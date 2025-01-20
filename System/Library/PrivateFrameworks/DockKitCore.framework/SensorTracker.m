@interface SensorTracker
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC11DockKitCore13SensorTracker)initWithCoder:(id)a3;
- (_TtC11DockKitCore18SensorTrackerState)state;
- (void)encodeWithCoder:(id)a3;
- (void)setState:(id)a3;
@end

@implementation SensorTracker

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC11DockKitCore18SensorTrackerState)state
{
  return (_TtC11DockKitCore18SensorTrackerState *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                          + OBJC_IVAR____TtC11DockKitCore13SensorTracker_state));
}

- (void)setState:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11DockKitCore13SensorTracker_state);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11DockKitCore13SensorTracker_state) = (Class)a3;
  id v3 = a3;
}

- (NSString)description
{
  return (NSString *)sub_24CE763E8(self, (uint64_t)a2, (void (*)(void))sub_24CE76458);
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11DockKitCore13SensorTracker_state);
  id v6 = a3;
  v8 = self;
  v7 = (void *)sub_24CF3B300();
  objc_msgSend(v6, sel_encodeObject_forKey_, v5, v7);

  sub_24CEBECAC(v6);
}

- (_TtC11DockKitCore13SensorTracker)initWithCoder:(id)a3
{
  return (_TtC11DockKitCore13SensorTracker *)SensorTracker.init(coder:)(a3);
}

- (void).cxx_destruct
{
}

@end