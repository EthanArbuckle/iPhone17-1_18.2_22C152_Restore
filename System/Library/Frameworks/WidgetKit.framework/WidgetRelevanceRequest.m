@interface WidgetRelevanceRequest
+ (BOOL)supportsSecureCoding;
- (_TtC9WidgetKit22WidgetRelevanceRequest)init;
- (_TtC9WidgetKit22WidgetRelevanceRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WidgetRelevanceRequest

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_191B888BC(v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC9WidgetKit22WidgetRelevanceRequest)initWithCoder:(id)a3
{
  return (_TtC9WidgetKit22WidgetRelevanceRequest *)WidgetRelevanceRequest.init(coder:)(a3);
}

- (_TtC9WidgetKit22WidgetRelevanceRequest)init
{
  result = (_TtC9WidgetKit22WidgetRelevanceRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9WidgetKit22WidgetRelevanceRequest_archiveFileHandle);
}

@end