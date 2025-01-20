@interface SNFileCopyingResult
- (NSString)filename;
- (NSURL)itemURL;
- (SNFileCopyingResult)init;
- (int64_t)fileSize;
@end

@implementation SNFileCopyingResult

- (NSString)filename
{
  sub_1DCB3CDA8();
  v2 = (void *)sub_1DCB87908();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (int64_t)fileSize
{
  return sub_1DCB3CE08();
}

- (NSURL)itemURL
{
  uint64_t v2 = sub_1DCB86A18();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DCB3CF00((uint64_t)v5);
  v6 = (void *)sub_1DCB86948();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return (NSURL *)v6;
}

- (SNFileCopyingResult)init
{
}

- (void).cxx_destruct
{
}

@end