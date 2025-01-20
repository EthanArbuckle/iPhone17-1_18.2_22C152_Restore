@interface DUStructuredEntityResponse
- (NSArray)structuredEntities;
- (_TtC21DocumentUnderstanding11DUDebugInfo)responseDebugInfo;
- (_TtC21DocumentUnderstanding26DUStructuredEntityResponse)init;
- (_TtC21DocumentUnderstanding26DUStructuredEntityResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setResponseDebugInfo:(id)a3;
- (void)setStructuredEntities:(id)a3;
@end

@implementation DUStructuredEntityResponse

- (NSArray)structuredEntities
{
  if (DUStructuredEntityResponse.structuredEntities.getter())
  {
    type metadata accessor for DUStructuredEntity();
    v2 = (void *)sub_23697B1CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)setStructuredEntities:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    type metadata accessor for DUStructuredEntity();
    uint64_t v3 = sub_23697B1DC();
  }
  v5 = self;
  DUStructuredEntityResponse.structuredEntities.setter(v3);
}

- (_TtC21DocumentUnderstanding11DUDebugInfo)responseDebugInfo
{
  v2 = DUStructuredEntityResponse.responseDebugInfo.getter();
  return (_TtC21DocumentUnderstanding11DUDebugInfo *)v2;
}

- (void)setResponseDebugInfo:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUStructuredEntityResponse.responseDebugInfo.setter(a3);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = self;
  DUStructuredEntityResponse.copy(with:)(v6);

  sub_2367CBEE8(v6, v6[3]);
  v4 = (void *)sub_23697B94C();
  sub_2367CBF2C((uint64_t)v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  DUStructuredEntityResponse.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding26DUStructuredEntityResponse)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding26DUStructuredEntityResponse *)DUStructuredEntityResponse.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding26DUStructuredEntityResponse)init
{
  return (_TtC21DocumentUnderstanding26DUStructuredEntityResponse *)DUStructuredEntityResponse.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21DocumentUnderstanding26DUStructuredEntityResponse_responseDebugInfo);
}

@end