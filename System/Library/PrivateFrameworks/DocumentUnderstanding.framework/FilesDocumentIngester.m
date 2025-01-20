@interface FilesDocumentIngester
+ (id)getEffectiveFileExtensionForURLWithFileURL:(id)a3;
+ (id)ingestDocumentFromFileWithFileURL:(id)a3;
+ (id)ingestDocumentFromMessageFileWithFileURL:(id)a3;
+ (id)openiWorkFileWithFileURL:(id)a3;
+ (id)readFromEMLWithFileURL:(id)a3;
+ (id)readFromJsonWithFileURL:(id)a3;
+ (id)readFromMessageJsonWithFileURL:(id)a3;
+ (id)readFromOfficeWithFileURL:(id)a3;
+ (id)readFromPDFWithFileURL:(id)a3;
+ (id)readFromTextWithFileURL:(id)a3;
+ (id)readFromiWorkWithFileURL:(id)a3;
- (_TtC21DocumentUnderstanding21FilesDocumentIngester)init;
@end

@implementation FilesDocumentIngester

+ (id)ingestDocumentFromFileWithFileURL:(id)a3
{
  return sub_2368C66CC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))static FilesDocumentIngester.ingestDocumentFromFile(fileURL:));
}

+ (id)ingestDocumentFromMessageFileWithFileURL:(id)a3
{
  return sub_2368C66CC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))static FilesDocumentIngester.ingestDocumentFromMessageFile(fileURL:));
}

+ (id)getEffectiveFileExtensionForURLWithFileURL:(id)a3
{
  uint64_t v3 = sub_23697A1CC();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23697A17C();
  sub_2368C58E8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v7 = (void *)sub_23697AF3C();
  swift_bridgeObjectRelease();
  return v7;
}

+ (id)readFromMessageJsonWithFileURL:(id)a3
{
  return sub_2368C66CC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))static FilesDocumentIngester.readFromMessageJson(fileURL:));
}

+ (id)readFromJsonWithFileURL:(id)a3
{
  return sub_2368C66CC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))static FilesDocumentIngester.readFromJson(fileURL:));
}

+ (id)readFromEMLWithFileURL:(id)a3
{
  return sub_2368C67C4((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))static FilesDocumentIngester.readFromEML(fileURL:));
}

+ (id)readFromPDFWithFileURL:(id)a3
{
  return sub_2368C67C4((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))static FilesDocumentIngester.readFromPDF(fileURL:));
}

+ (id)readFromOfficeWithFileURL:(id)a3
{
  return sub_2368C67C4((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))static FilesDocumentIngester.readFromOffice(fileURL:));
}

+ (id)readFromiWorkWithFileURL:(id)a3
{
  return sub_2368C66CC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))static FilesDocumentIngester.readFromiWork(fileURL:));
}

+ (id)openiWorkFileWithFileURL:(id)a3
{
  return sub_2368C67C4((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_2368C6244);
}

+ (id)readFromTextWithFileURL:(id)a3
{
  return sub_2368C67C4((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))static FilesDocumentIngester.readFromText(fileURL:));
}

- (_TtC21DocumentUnderstanding21FilesDocumentIngester)init
{
  return (_TtC21DocumentUnderstanding21FilesDocumentIngester *)FilesDocumentIngester.init()();
}

@end