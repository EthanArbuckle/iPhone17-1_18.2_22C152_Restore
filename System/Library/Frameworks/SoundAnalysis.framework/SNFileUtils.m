@interface SNFileUtils
+ (BOOL)addPurgeablePropertyToURL:(id)a3 error:(id *)a4;
- (SNFileUtils)init;
@end

@implementation SNFileUtils

+ (BOOL)addPurgeablePropertyToURL:(id)a3 error:(id *)a4
{
  uint64_t v4 = sub_1DCB86A18();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DCB869B8();
  swift_getObjCClassMetadata();
  sub_1DCB3B7F0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 1;
}

- (SNFileUtils)init
{
  return (SNFileUtils *)sub_1DCB3C200();
}

@end