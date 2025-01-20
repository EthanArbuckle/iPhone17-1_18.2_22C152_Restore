@interface ActuatorFeedback
+ (BOOL)supportsSecureCoding;
- (_TtC11DockKitCore16ActuatorFeedback)init;
- (_TtC11DockKitCore16ActuatorFeedback)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ActuatorFeedback

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ActuatorFeedback.encode(with:)((NSCoder)v4);
}

- (_TtC11DockKitCore16ActuatorFeedback)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC11DockKitCore16ActuatorFeedback *)sub_24CED4104();

  return v4;
}

- (_TtC11DockKitCore16ActuatorFeedback)init
{
  result = (_TtC11DockKitCore16ActuatorFeedback *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end