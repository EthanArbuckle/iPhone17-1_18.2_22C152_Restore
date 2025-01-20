@interface DUTopicDetectionResponse
- (NSArray)globalTopics;
- (NSArray)personalTopics;
- (_TtC21DocumentUnderstanding11DUDebugInfo)responseDebugInfo;
- (_TtC21DocumentUnderstanding24DUTopicDetectionResponse)init;
- (_TtC21DocumentUnderstanding24DUTopicDetectionResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setGlobalTopics:(id)a3;
- (void)setPersonalTopics:(id)a3;
- (void)setResponseDebugInfo:(id)a3;
@end

@implementation DUTopicDetectionResponse

- (NSArray)globalTopics
{
  return (NSArray *)sub_2368DD6B4((uint64_t)self, (uint64_t)a2, DUTopicDetectionResponse.globalTopics.getter);
}

- (void)setGlobalTopics:(id)a3
{
}

- (NSArray)personalTopics
{
  return (NSArray *)sub_2368DD6B4((uint64_t)self, (uint64_t)a2, DUTopicDetectionResponse.personalTopics.getter);
}

- (void)setPersonalTopics:(id)a3
{
}

- (_TtC21DocumentUnderstanding11DUDebugInfo)responseDebugInfo
{
  v2 = DUTopicDetectionResponse.responseDebugInfo.getter();
  return (_TtC21DocumentUnderstanding11DUDebugInfo *)v2;
}

- (void)setResponseDebugInfo:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUTopicDetectionResponse.responseDebugInfo.setter(a3);
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  DUTopicDetectionResponse.copy(with:)(v6);

  sub_2367CBEE8(v6, v6[3]);
  v4 = (void *)sub_23697B94C();
  sub_2367CBF2C((uint64_t)v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  DUTopicDetectionResponse.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding24DUTopicDetectionResponse)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding24DUTopicDetectionResponse *)DUTopicDetectionResponse.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding24DUTopicDetectionResponse)init
{
  return (_TtC21DocumentUnderstanding24DUTopicDetectionResponse *)DUTopicDetectionResponse.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21DocumentUnderstanding24DUTopicDetectionResponse_responseDebugInfo);
}

@end