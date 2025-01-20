@interface ActivityWidgetRequest
+ (BOOL)supportsSecureCoding;
- (_TtC9WidgetKit21ActivityWidgetRequest)init;
- (_TtC9WidgetKit21ActivityWidgetRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ActivityWidgetRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC9WidgetKit21ActivityWidgetRequest)initWithCoder:(id)a3
{
  return (_TtC9WidgetKit21ActivityWidgetRequest *)ActivityWidgetRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_191BF11B0(v4);
}

- (_TtC9WidgetKit21ActivityWidgetRequest)init
{
  result = (_TtC9WidgetKit21ActivityWidgetRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9WidgetKit21ActivityWidgetRequest_descriptor;
  uint64_t v4 = sub_191CF3378();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_191B1603C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9WidgetKit21ActivityWidgetRequest_defaultPayload), *(void *)&self->_anon_0[OBJC_IVAR____TtC9WidgetKit21ActivityWidgetRequest_defaultPayload]);
  sub_191BF2B70((uint64_t)self + OBJC_IVAR____TtC9WidgetKit21ActivityWidgetRequest_metrics, type metadata accessor for ActivityMetricsDefinition);
  swift_bridgeObjectRelease();

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9WidgetKit21ActivityWidgetRequest_jindoEnvironment);
}

@end