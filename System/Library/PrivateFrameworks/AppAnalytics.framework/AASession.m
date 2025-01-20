@interface AASession
- (AASession)init;
- (NSDate)startDate;
- (NSDictionary)sessionData;
- (NSString)identifier;
- (NSString)name;
- (int64_t)kind;
@end

@implementation AASession

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A916AF60();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (int64_t)kind
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___AASession_kind);
}

- (NSString)name
{
  if (*(void *)&self->identifier[OBJC_IVAR___AASession_name])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A916AF60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (NSDate)startDate
{
  v2 = (void *)sub_1A916AC10();

  return (NSDate *)v2;
}

- (NSDictionary)sessionData
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A916AEB0();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

- (AASession)init
{
  result = (AASession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___AASession_startDate;
  uint64_t v4 = sub_1A916AC90();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end