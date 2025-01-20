@interface ModifyControlStateRequest
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC9WidgetKit25ModifyControlStateRequest)init;
- (_TtC9WidgetKit25ModifyControlStateRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ModifyControlStateRequest

+ (BOOL)supportsSecureCoding
{
  return byte_1E92E56E0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E92E56E0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_191CD360C(v4);
}

- (_TtC9WidgetKit25ModifyControlStateRequest)initWithCoder:(id)a3
{
  return (_TtC9WidgetKit25ModifyControlStateRequest *)ModifyControlStateRequest.init(coder:)(a3);
}

- (_TtC9WidgetKit25ModifyControlStateRequest)init
{
  result = (_TtC9WidgetKit25ModifyControlStateRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end