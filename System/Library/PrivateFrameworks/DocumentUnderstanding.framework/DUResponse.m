@interface DUResponse
- (NSArray)poem;
- (NSArray)posTags;
- (_TtC21DocumentUnderstanding10DUResponse)init;
- (_TtC21DocumentUnderstanding10DUResponse)initWithCoder:(id)a3;
- (_TtC21DocumentUnderstanding11DUDebugInfo)responseDebugInfo;
- (_TtC21DocumentUnderstanding20DUFoundInEventResult)foundInEventResult;
- (_TtC21DocumentUnderstanding24DUTopicDetectionResponse)topics;
- (_TtC21DocumentUnderstanding25DULanguageTaggingResponse)languageTags;
- (_TtC21DocumentUnderstanding26DUStructuredEntityResponse)structuredEntities;
- (_TtC21DocumentUnderstanding32DUCategoryClassificationResponse)documentCategories;
- (_TtC21DocumentUnderstanding34DUFoundInEventClassificationResult)foundInEventClassificationResult;
- (_TtC21DocumentUnderstanding36DUUserInterfaceUnderstandingResponse)userInterfaceUnderstandingResults;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDocumentCategories:(id)a3;
- (void)setFoundInEventClassificationResult:(id)a3;
- (void)setFoundInEventResult:(id)a3;
- (void)setLanguageTags:(id)a3;
- (void)setPoem:(id)a3;
- (void)setPosTags:(id)a3;
- (void)setResponseDebugInfo:(id)a3;
- (void)setStructuredEntities:(id)a3;
- (void)setTopics:(id)a3;
- (void)setUserInterfaceUnderstandingResults:(id)a3;
@end

@implementation DUResponse

- (_TtC21DocumentUnderstanding24DUTopicDetectionResponse)topics
{
  v2 = DUResponse.topics.getter();
  return (_TtC21DocumentUnderstanding24DUTopicDetectionResponse *)v2;
}

- (void)setTopics:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUResponse.topics.setter(a3);
}

- (_TtC21DocumentUnderstanding26DUStructuredEntityResponse)structuredEntities
{
  v2 = DUResponse.structuredEntities.getter();
  return (_TtC21DocumentUnderstanding26DUStructuredEntityResponse *)v2;
}

- (void)setStructuredEntities:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUResponse.structuredEntities.setter(a3);
}

- (_TtC21DocumentUnderstanding25DULanguageTaggingResponse)languageTags
{
  v2 = DUResponse.languageTags.getter();
  return (_TtC21DocumentUnderstanding25DULanguageTaggingResponse *)v2;
}

- (void)setLanguageTags:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUResponse.languageTags.setter(a3);
}

- (_TtC21DocumentUnderstanding36DUUserInterfaceUnderstandingResponse)userInterfaceUnderstandingResults
{
  v2 = DUResponse.userInterfaceUnderstandingResults.getter();
  return (_TtC21DocumentUnderstanding36DUUserInterfaceUnderstandingResponse *)v2;
}

- (void)setUserInterfaceUnderstandingResults:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUResponse.userInterfaceUnderstandingResults.setter(a3);
}

- (_TtC21DocumentUnderstanding32DUCategoryClassificationResponse)documentCategories
{
  v2 = DUResponse.documentCategories.getter();
  return (_TtC21DocumentUnderstanding32DUCategoryClassificationResponse *)v2;
}

- (void)setDocumentCategories:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUResponse.documentCategories.setter(a3);
}

- (_TtC21DocumentUnderstanding20DUFoundInEventResult)foundInEventResult
{
  v2 = DUResponse.foundInEventResult.getter();
  return (_TtC21DocumentUnderstanding20DUFoundInEventResult *)v2;
}

- (void)setFoundInEventResult:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUResponse.foundInEventResult.setter(a3);
}

- (_TtC21DocumentUnderstanding34DUFoundInEventClassificationResult)foundInEventClassificationResult
{
  v2 = DUResponse.foundInEventClassificationResult.getter();
  return (_TtC21DocumentUnderstanding34DUFoundInEventClassificationResult *)v2;
}

- (void)setFoundInEventClassificationResult:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUResponse.foundInEventClassificationResult.setter(a3);
}

- (NSArray)poem
{
  if (DUResponse.poem.getter())
  {
    sub_2367CA9F8(0, &qword_268898618);
    v2 = (void *)sub_23697B1CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)setPoem:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    sub_2367CA9F8(0, &qword_268898618);
    uint64_t v3 = sub_23697B1DC();
  }
  id v5 = self;
  DUResponse.poem.setter(v3);
}

- (NSArray)posTags
{
  if (DUResponse.posTags.getter())
  {
    type metadata accessor for PosTaggingResult();
    v2 = (void *)sub_23697B1CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)setPosTags:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    type metadata accessor for PosTaggingResult();
    uint64_t v3 = sub_23697B1DC();
  }
  id v5 = self;
  DUResponse.posTags.setter(v3);
}

- (_TtC21DocumentUnderstanding11DUDebugInfo)responseDebugInfo
{
  v2 = DUResponse.responseDebugInfo.getter();
  return (_TtC21DocumentUnderstanding11DUDebugInfo *)v2;
}

- (void)setResponseDebugInfo:(id)a3
{
  id v5 = a3;
  v6 = self;
  DUResponse.responseDebugInfo.setter(a3);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = self;
  DUResponse.copy(with:)(v6);

  sub_2367CBEE8(v6, (uint64_t)v6[3]);
  v4 = (void *)sub_23697B94C();
  sub_2367CBF2C((uint64_t)v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  DUResponse.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding10DUResponse)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding10DUResponse *)DUResponse.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding10DUResponse)init
{
  return (_TtC21DocumentUnderstanding10DUResponse *)DUResponse.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_userInterfaceUnderstandingResults));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_foundInEventClassificationResult));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_responseDebugInfo);
}

@end