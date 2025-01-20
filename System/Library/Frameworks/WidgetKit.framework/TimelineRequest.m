@interface TimelineRequest
+ (BOOL)supportsSecureCoding;
- (_TtC9WidgetKit15TimelineRequest)init;
- (_TtC9WidgetKit15TimelineRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TimelineRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC9WidgetKit15TimelineRequest)initWithCoder:(id)a3
{
  return (_TtC9WidgetKit15TimelineRequest *)TimelineRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_191CA1128(v4);
}

- (_TtC9WidgetKit15TimelineRequest)init
{
  result = (_TtC9WidgetKit15TimelineRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9WidgetKit15TimelineRequest_fileHandle);
}

@end