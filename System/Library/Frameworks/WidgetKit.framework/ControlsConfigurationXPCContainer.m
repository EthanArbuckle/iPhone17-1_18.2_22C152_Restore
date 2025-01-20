@interface ControlsConfigurationXPCContainer
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC9WidgetKit33ControlsConfigurationXPCContainer)init;
- (_TtC9WidgetKit33ControlsConfigurationXPCContainer)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ControlsConfigurationXPCContainer

+ (BOOL)supportsSecureCoding
{
  return byte_1E92E56E1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E92E56E1 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_191CD3F70(v4);
}

- (_TtC9WidgetKit33ControlsConfigurationXPCContainer)initWithCoder:(id)a3
{
  return (_TtC9WidgetKit33ControlsConfigurationXPCContainer *)ControlsConfigurationXPCContainer.init(coder:)(a3);
}

- (_TtC9WidgetKit33ControlsConfigurationXPCContainer)init
{
  result = (_TtC9WidgetKit33ControlsConfigurationXPCContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end