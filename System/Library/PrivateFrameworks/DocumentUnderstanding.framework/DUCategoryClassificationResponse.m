@interface DUCategoryClassificationResponse
- (NSArray)categories;
- (_TtC21DocumentUnderstanding11DUDebugInfo)responseDebugInfo;
- (_TtC21DocumentUnderstanding32DUCategoryClassificationResponse)init;
- (_TtC21DocumentUnderstanding32DUCategoryClassificationResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCategories:(id)a3;
- (void)setResponseDebugInfo:(id)a3;
@end

@implementation DUCategoryClassificationResponse

- (NSArray)categories
{
  DUCategoryClassificationResponse.categories.getter();
  type metadata accessor for DUCategoryResult();
  v2 = (void *)sub_23697B1CC();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setCategories:(id)a3
{
  type metadata accessor for DUCategoryResult();
  uint64_t v4 = sub_23697B1DC();
  v5 = self;
  DUCategoryClassificationResponse.categories.setter(v4);
}

- (_TtC21DocumentUnderstanding11DUDebugInfo)responseDebugInfo
{
  v2 = DUCategoryClassificationResponse.responseDebugInfo.getter();
  return (_TtC21DocumentUnderstanding11DUDebugInfo *)v2;
}

- (void)setResponseDebugInfo:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUCategoryClassificationResponse.responseDebugInfo.setter(a3);
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  DUCategoryClassificationResponse.copy(with:)(v6);

  sub_2367CBEE8(v6, v6[3]);
  uint64_t v4 = (void *)sub_23697B94C();
  sub_2367CBF2C((uint64_t)v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  DUCategoryClassificationResponse.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding32DUCategoryClassificationResponse)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding32DUCategoryClassificationResponse *)DUCategoryClassificationResponse.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding32DUCategoryClassificationResponse)init
{
  return (_TtC21DocumentUnderstanding32DUCategoryClassificationResponse *)DUCategoryClassificationResponse.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21DocumentUnderstanding32DUCategoryClassificationResponse_responseDebugInfo);
}

@end