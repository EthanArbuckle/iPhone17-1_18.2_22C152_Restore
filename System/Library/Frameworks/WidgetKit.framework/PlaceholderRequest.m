@interface PlaceholderRequest
+ (BOOL)supportsSecureCoding;
- (_TtC9WidgetKit18PlaceholderRequest)init;
- (_TtC9WidgetKit18PlaceholderRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PlaceholderRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC9WidgetKit18PlaceholderRequest)initWithCoder:(id)a3
{
  return (_TtC9WidgetKit18PlaceholderRequest *)PlaceholderRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_191CD817C(v4);
}

- (_TtC9WidgetKit18PlaceholderRequest)init
{
  result = (_TtC9WidgetKit18PlaceholderRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9WidgetKit18PlaceholderRequest_fileHandle);
}

@end