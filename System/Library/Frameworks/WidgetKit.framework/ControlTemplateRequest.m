@interface ControlTemplateRequest
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC9WidgetKit22ControlTemplateRequest)init;
- (_TtC9WidgetKit22ControlTemplateRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ControlTemplateRequest

+ (BOOL)supportsSecureCoding
{
  return byte_1E92E56E2;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E92E56E2 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_191CD4CB8(v4);
}

- (_TtC9WidgetKit22ControlTemplateRequest)initWithCoder:(id)a3
{
  return (_TtC9WidgetKit22ControlTemplateRequest *)ControlTemplateRequest.init(coder:)(a3);
}

- (_TtC9WidgetKit22ControlTemplateRequest)init
{
  result = (_TtC9WidgetKit22ControlTemplateRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9WidgetKit22ControlTemplateRequest_environment);
}

@end