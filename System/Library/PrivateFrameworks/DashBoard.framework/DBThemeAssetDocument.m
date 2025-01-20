@interface DBThemeAssetDocument
- (NSDictionary)documentInfo;
- (NSURL)documentURL;
- (_TtC9DashBoard20DBThemeAssetDocument)init;
- (_TtC9DashBoard20DBThemeAssetDocument)initWithDocumentURL:(id)a3;
@end

@implementation DBThemeAssetDocument

- (NSURL)documentURL
{
  v2 = (void *)sub_22D85CC58();

  return (NSURL *)v2;
}

- (NSDictionary)documentInfo
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9DashBoard20DBThemeAssetDocument_documentInfo))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_22D85E448();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSDictionary *)v2;
}

- (_TtC9DashBoard20DBThemeAssetDocument)initWithDocumentURL:(id)a3
{
  uint64_t v3 = sub_22D85CCB8();
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D85CC68();
  return (_TtC9DashBoard20DBThemeAssetDocument *)DBThemeAssetDocument.init(documentURL:)((uint64_t)v5);
}

- (_TtC9DashBoard20DBThemeAssetDocument)init
{
  result = (_TtC9DashBoard20DBThemeAssetDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC9DashBoard20DBThemeAssetDocument_document;
  uint64_t v4 = sub_22D85CF38();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9DashBoard20DBThemeAssetDocument_documentURL;
  uint64_t v6 = sub_22D85CCB8();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  swift_bridgeObjectRelease();
}

@end