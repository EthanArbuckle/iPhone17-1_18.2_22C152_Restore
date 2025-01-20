@interface DUDocumentHTMLData
- (BOOL)isEqual:(id)a3;
- (NSString)htmlString;
- (_TtC21DocumentUnderstanding18DUDocumentHTMLData)init;
- (_TtC21DocumentUnderstanding18DUDocumentHTMLData)initWithCoder:(id)a3;
- (_TtC21DocumentUnderstanding19DUDocumentEmailData)documentEmailData;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDocumentEmailData:(id)a3;
- (void)setHtmlString:(id)a3;
@end

@implementation DUDocumentHTMLData

- (NSString)htmlString
{
  DUDocumentHTMLData.htmlString.getter();
  if (v2)
  {
    v3 = (void *)sub_23697AF3C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setHtmlString:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_23697AF6C();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  DUDocumentHTMLData.htmlString.setter(v4, v6);
}

- (_TtC21DocumentUnderstanding19DUDocumentEmailData)documentEmailData
{
  uint64_t v2 = DUDocumentHTMLData.documentEmailData.getter();
  return (_TtC21DocumentUnderstanding19DUDocumentEmailData *)v2;
}

- (void)setDocumentEmailData:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  DUDocumentHTMLData.documentEmailData.setter(a3);
}

- (_TtC21DocumentUnderstanding18DUDocumentHTMLData)init
{
  return (_TtC21DocumentUnderstanding18DUDocumentHTMLData *)DUDocumentHTMLData.init()();
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  DUDocumentHTMLData.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding18DUDocumentHTMLData)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding18DUDocumentHTMLData *)DUDocumentHTMLData.init(coder:)(a3);
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  DUDocumentHTMLData.copy(with:)(v6);

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
  char v6 = DUDocumentHTMLData.isEqual(_:)((uint64_t)v8);

  sub_2367BAA28((uint64_t)v8, (uint64_t *)&unk_26AD8BC30);
  return v6 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21DocumentUnderstanding18DUDocumentHTMLData_documentEmailData);
}

@end