@interface DURawDocument
- (BOOL)isEqual:(id)a3;
- (NSArray)documentUIElements;
- (NSArray)keywords;
- (NSDate)dateCreated;
- (NSDate)dateModified;
- (NSString)abstract;
- (NSString)comment;
- (NSString)creator;
- (NSString)headline;
- (NSString)identifier;
- (NSString)inLanguage;
- (NSString)subHeadline;
- (NSString)text;
- (NSString)version;
- (NSURL)significantLink;
- (NSURL)thumbnailUrl;
- (NSURL)url;
- (_TtC21DocumentUnderstanding13DURawDocument)init;
- (_TtC21DocumentUnderstanding13DURawDocument)initWithCoder:(id)a3;
- (_TtC21DocumentUnderstanding18DUDocumentHTMLData)documentHTMLData;
- (_TtC21DocumentUnderstanding21DUDocumentMessageData)documentMessageData;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAbstract:(id)a3;
- (void)setComment:(id)a3;
- (void)setCreator:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateModified:(id)a3;
- (void)setDocumentHTMLData:(id)a3;
- (void)setDocumentMessageData:(id)a3;
- (void)setDocumentUIElements:(id)a3;
- (void)setHeadline:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInLanguage:(id)a3;
- (void)setKeywords:(id)a3;
- (void)setSignificantLink:(id)a3;
- (void)setSubHeadline:(id)a3;
- (void)setText:(id)a3;
- (void)setThumbnailUrl:(id)a3;
- (void)setUrl:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation DURawDocument

- (NSString)headline
{
  return (NSString *)sub_23690231C((uint64_t)self, (uint64_t)a2, (void (*)(void))DURawDocument.headline.getter);
}

- (void)setHeadline:(id)a3
{
}

- (NSString)subHeadline
{
  return (NSString *)sub_23690231C((uint64_t)self, (uint64_t)a2, (void (*)(void))DURawDocument.subHeadline.getter);
}

- (void)setSubHeadline:(id)a3
{
}

- (NSString)version
{
  return (NSString *)sub_23690231C((uint64_t)self, (uint64_t)a2, (void (*)(void))DURawDocument.version.getter);
}

- (void)setVersion:(id)a3
{
}

- (NSString)creator
{
  return (NSString *)sub_23690231C((uint64_t)self, (uint64_t)a2, (void (*)(void))DURawDocument.creator.getter);
}

- (void)setCreator:(id)a3
{
}

- (NSString)abstract
{
  return (NSString *)sub_23690231C((uint64_t)self, (uint64_t)a2, (void (*)(void))DURawDocument.abstract.getter);
}

- (void)setAbstract:(id)a3
{
}

- (NSString)comment
{
  return (NSString *)sub_23690231C((uint64_t)self, (uint64_t)a2, (void (*)(void))DURawDocument.comment.getter);
}

- (void)setComment:(id)a3
{
}

- (NSString)text
{
  return (NSString *)sub_23690231C((uint64_t)self, (uint64_t)a2, (void (*)(void))DURawDocument.text.getter);
}

- (void)setText:(id)a3
{
}

- (NSString)inLanguage
{
  return (NSString *)sub_23690231C((uint64_t)self, (uint64_t)a2, (void (*)(void))DURawDocument.inLanguage.getter);
}

- (void)setInLanguage:(id)a3
{
}

- (NSArray)keywords
{
  if (DURawDocument.keywords.getter())
  {
    v2 = (void *)sub_23697B1CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)setKeywords:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_23697B1DC();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  DURawDocument.keywords.setter(v4);
}

- (NSString)identifier
{
  return (NSString *)sub_23690231C((uint64_t)self, (uint64_t)a2, (void (*)(void))DURawDocument.identifier.getter);
}

- (void)setIdentifier:(id)a3
{
}

- (NSURL)url
{
  return (NSURL *)sub_236902E94((uint64_t)self, (uint64_t)a2, &qword_26AD89538, (void (*)(void))DURawDocument.url.getter, MEMORY[0x263F06EA8], MEMORY[0x263F06E88]);
}

- (void)setUrl:(id)a3
{
}

- (NSURL)thumbnailUrl
{
  return (NSURL *)sub_236902E94((uint64_t)self, (uint64_t)a2, &qword_26AD89538, (void (*)(void))DURawDocument.thumbnailUrl.getter, MEMORY[0x263F06EA8], MEMORY[0x263F06E88]);
}

- (void)setThumbnailUrl:(id)a3
{
}

- (NSURL)significantLink
{
  return (NSURL *)sub_236902E94((uint64_t)self, (uint64_t)a2, &qword_26AD89538, (void (*)(void))DURawDocument.significantLink.getter, MEMORY[0x263F06EA8], MEMORY[0x263F06E88]);
}

- (void)setSignificantLink:(id)a3
{
}

- (NSDate)dateCreated
{
  return (NSDate *)sub_236902E94((uint64_t)self, (uint64_t)a2, (uint64_t *)&off_26AD89548, (void (*)(void))DURawDocument.dateCreated.getter, MEMORY[0x263F07490], MEMORY[0x263F073A8]);
}

- (void)setDateCreated:(id)a3
{
}

- (NSDate)dateModified
{
  return (NSDate *)sub_236902E94((uint64_t)self, (uint64_t)a2, (uint64_t *)&off_26AD89548, (void (*)(void))DURawDocument.dateModified.getter, MEMORY[0x263F07490], MEMORY[0x263F073A8]);
}

- (void)setDateModified:(id)a3
{
}

- (_TtC21DocumentUnderstanding21DUDocumentMessageData)documentMessageData
{
  v2 = DURawDocument.documentMessageData.getter();
  return (_TtC21DocumentUnderstanding21DUDocumentMessageData *)v2;
}

- (void)setDocumentMessageData:(id)a3
{
  id v5 = a3;
  v6 = self;
  DURawDocument.documentMessageData.setter(a3);
}

- (NSArray)documentUIElements
{
  if (DURawDocument.documentUIElements.getter())
  {
    type metadata accessor for DUDocumentUIElement();
    v2 = (void *)sub_23697B1CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)setDocumentUIElements:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    type metadata accessor for DUDocumentUIElement();
    uint64_t v3 = sub_23697B1DC();
  }
  id v5 = self;
  DURawDocument.documentUIElements.setter(v3);
}

- (_TtC21DocumentUnderstanding18DUDocumentHTMLData)documentHTMLData
{
  v2 = DURawDocument.documentHTMLData.getter();
  return (_TtC21DocumentUnderstanding18DUDocumentHTMLData *)v2;
}

- (void)setDocumentHTMLData:(id)a3
{
  id v5 = a3;
  v6 = self;
  DURawDocument.documentHTMLData.setter(a3);
}

- (_TtC21DocumentUnderstanding13DURawDocument)init
{
  return (_TtC21DocumentUnderstanding13DURawDocument *)DURawDocument.init()();
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  DURawDocument.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding13DURawDocument)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding13DURawDocument *)DURawDocument.init(coder:)(a3);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = self;
  DURawDocument.copy(with:)(v6);

  sub_2367CBEE8(v6, (uint64_t)v6[3]);
  id v4 = (void *)sub_23697B94C();
  sub_2367CBF2C((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_23697B5DC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  char v6 = DURawDocument.isEqual(_:)((uint64_t)v8);

  sub_2367BAA28((uint64_t)v8, (uint64_t *)&unk_26AD8BC30);
  return v6 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_2368D17A8();
  sub_2368D17A8();
  sub_2368D17A8();
  sub_2368D17A8();
  sub_2368D17A8();
  sub_2368D17A8();
  sub_2368D17A8();
  swift_bridgeObjectRelease();
  sub_2368D17A8();
  sub_2367BAA28((uint64_t)self + OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_url, &qword_26AD89538);
  sub_2367BAA28((uint64_t)self + OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_thumbnailUrl, &qword_26AD89538);
  sub_2367BAA28((uint64_t)self + OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_significantLink, &qword_26AD89538);
  sub_2367BAA28((uint64_t)self + OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_dateCreated, (uint64_t *)&off_26AD89548);
  sub_2367BAA28((uint64_t)self + OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_dateModified, (uint64_t *)&off_26AD89548);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_documentMessageData));
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_documentHTMLData);
}

@end