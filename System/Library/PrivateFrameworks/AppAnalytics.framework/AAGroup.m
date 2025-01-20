@interface AAGroup
- (AAGroup)init;
- (NSDate)startDate;
- (NSString)name;
@end

@implementation AAGroup

- (NSString)name
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A916AF60();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSDate)startDate
{
  v2 = (void *)sub_1A916AC10();

  return (NSDate *)v2;
}

- (AAGroup)init
{
  result = (AAGroup *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___AAGroup_startDate;
  uint64_t v4 = sub_1A916AC90();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end