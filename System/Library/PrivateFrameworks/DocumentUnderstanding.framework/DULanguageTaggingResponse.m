@interface DULanguageTaggingResponse
- (NSArray)languageTags;
- (_TtC21DocumentUnderstanding11DUDebugInfo)responseDebugInfo;
- (_TtC21DocumentUnderstanding25DULanguageTaggingResponse)init;
- (_TtC21DocumentUnderstanding25DULanguageTaggingResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLanguageTags:(id)a3;
- (void)setResponseDebugInfo:(id)a3;
@end

@implementation DULanguageTaggingResponse

- (NSArray)languageTags
{
  DULanguageTaggingResponse.languageTags.getter();
  v2 = (void *)sub_23697B1CC();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setLanguageTags:(id)a3
{
  uint64_t v4 = sub_23697B1DC();
  v5 = self;
  DULanguageTaggingResponse.languageTags.setter(v4);
}

- (_TtC21DocumentUnderstanding11DUDebugInfo)responseDebugInfo
{
  v2 = DULanguageTaggingResponse.responseDebugInfo.getter();
  return (_TtC21DocumentUnderstanding11DUDebugInfo *)v2;
}

- (void)setResponseDebugInfo:(id)a3
{
  id v5 = a3;
  v6 = self;
  DULanguageTaggingResponse.responseDebugInfo.setter(a3);
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  DULanguageTaggingResponse.copy(with:)(v6);

  sub_2367CBEE8(v6, v6[3]);
  uint64_t v4 = (void *)sub_23697B94C();
  sub_2367CBF2C((uint64_t)v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  DULanguageTaggingResponse.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding25DULanguageTaggingResponse)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding25DULanguageTaggingResponse *)DULanguageTaggingResponse.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding25DULanguageTaggingResponse)init
{
  return (_TtC21DocumentUnderstanding25DULanguageTaggingResponse *)DULanguageTaggingResponse.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21DocumentUnderstanding25DULanguageTaggingResponse_responseDebugInfo);
}

@end