@interface DUDocument
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
- (_TtC21DocumentUnderstanding10DUDocument)init;
- (_TtC21DocumentUnderstanding10DUDocument)initWithCoder:(id)a3;
- (_TtC21DocumentUnderstanding10DUDocument)initWithRawDocument:(id)a3 maxLength:(int64_t)a4;
- (_TtC21DocumentUnderstanding10DUDocument)initWithText:(id)a3 maxLength:(int64_t)a4;
- (_TtC21DocumentUnderstanding18DUDocumentHTMLData)documentHTMLData;
- (_TtC21DocumentUnderstanding21DUDocumentMessageData)documentMessageData;
- (id)copyWithZone:(void *)a3;
- (id)rawCopy;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DUDocument

- (NSString)headline
{
  return (NSString *)sub_2368E5310((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocument.headline.getter);
}

- (NSString)subHeadline
{
  return (NSString *)sub_2368E5310((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocument.subHeadline.getter);
}

- (NSString)version
{
  return (NSString *)sub_2368E5310((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocument.version.getter);
}

- (NSString)creator
{
  return (NSString *)sub_2368E5310((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocument.creator.getter);
}

- (NSString)abstract
{
  return (NSString *)sub_2368E5310((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocument.abstract.getter);
}

- (NSString)comment
{
  return (NSString *)sub_2368E5310((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocument.comment.getter);
}

- (NSString)text
{
  return (NSString *)sub_2368E5310((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocument.text.getter);
}

- (NSString)inLanguage
{
  return (NSString *)sub_2368E5310((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocument.inLanguage.getter);
}

- (NSArray)keywords
{
  if (DUDocument.keywords.getter())
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

- (NSString)identifier
{
  return (NSString *)sub_2368E5310((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocument.identifier.getter);
}

- (NSURL)url
{
  return (NSURL *)sub_2368E5758((uint64_t)self, (uint64_t)a2, &qword_26AD89538, (void (*)(void))DUDocument.url.getter, MEMORY[0x263F06EA8], MEMORY[0x263F06E88]);
}

- (NSURL)thumbnailUrl
{
  return (NSURL *)sub_2368E5758((uint64_t)self, (uint64_t)a2, &qword_26AD89538, (void (*)(void))DUDocument.thumbnailUrl.getter, MEMORY[0x263F06EA8], MEMORY[0x263F06E88]);
}

- (NSURL)significantLink
{
  return (NSURL *)sub_2368E5758((uint64_t)self, (uint64_t)a2, &qword_26AD89538, (void (*)(void))DUDocument.significantLink.getter, MEMORY[0x263F06EA8], MEMORY[0x263F06E88]);
}

- (NSDate)dateCreated
{
  return (NSDate *)sub_2368E5758((uint64_t)self, (uint64_t)a2, (uint64_t *)&off_26AD89548, (void (*)(void))DUDocument.dateCreated.getter, MEMORY[0x263F07490], MEMORY[0x263F073A8]);
}

- (NSDate)dateModified
{
  return (NSDate *)sub_2368E5758((uint64_t)self, (uint64_t)a2, (uint64_t *)&off_26AD89548, (void (*)(void))DUDocument.dateModified.getter, MEMORY[0x263F07490], MEMORY[0x263F073A8]);
}

- (_TtC21DocumentUnderstanding21DUDocumentMessageData)documentMessageData
{
  v2 = DUDocument.documentMessageData.getter();
  return (_TtC21DocumentUnderstanding21DUDocumentMessageData *)v2;
}

- (NSArray)documentUIElements
{
  if (DUDocument.documentUIElements.getter())
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

- (_TtC21DocumentUnderstanding18DUDocumentHTMLData)documentHTMLData
{
  v2 = DUDocument.documentHTMLData.getter();
  return (_TtC21DocumentUnderstanding18DUDocumentHTMLData *)v2;
}

- (_TtC21DocumentUnderstanding10DUDocument)init
{
}

- (_TtC21DocumentUnderstanding10DUDocument)initWithRawDocument:(id)a3 maxLength:(int64_t)a4
{
  return (_TtC21DocumentUnderstanding10DUDocument *)DUDocument.init(rawDocument:maxLength:)(a3, a4);
}

- (_TtC21DocumentUnderstanding10DUDocument)initWithText:(id)a3 maxLength:(int64_t)a4
{
  if (a3)
  {
    uint64_t v5 = sub_23697AF6C();
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  return (_TtC21DocumentUnderstanding10DUDocument *)DUDocument.init(text:maxLength:)(v5, v6, a4);
}

- (id)rawCopy
{
  v2 = self;
  v3 = (void *)DUDocument.rawCopy()();

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  DUDocument.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding10DUDocument)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding10DUDocument *)DUDocument.init(coder:)(a3);
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  DUDocument.copy(with:)(v6);

  sub_2367CBEE8(v6, v6[3]);
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
    uint64_t v5 = self;
  }
  unsigned __int8 v6 = DUDocument.isEqual(_:)((uint64_t)v8);

  sub_23680067C((uint64_t)v8);
  return v6 & 1;
}

- (void).cxx_destruct
{
}

@end