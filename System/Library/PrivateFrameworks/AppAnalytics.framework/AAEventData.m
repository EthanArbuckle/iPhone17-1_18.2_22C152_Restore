@interface AAEventData
+ (NSString)dataName;
- (AAEventData)init;
- (NSDate)eventDate;
- (NSString)appSessionID;
- (NSString)eventID;
- (NSString)eventPath;
- (NSString)sessionID;
- (id)toDict;
@end

@implementation AAEventData

- (NSString)eventID
{
  return (NSString *)sub_1A90CF1F0();
}

- (NSDate)eventDate
{
  v2 = (void *)sub_1A916AC10();

  return (NSDate *)v2;
}

- (NSString)eventPath
{
  return (NSString *)sub_1A90CF1F0();
}

- (NSString)sessionID
{
  return (NSString *)sub_1A90CF1F0();
}

- (NSString)appSessionID
{
  if (*(void *)&self->eventID[OBJC_IVAR___AAEventData_appSessionID])
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

+ (NSString)dataName
{
  v2 = (void *)sub_1A916AF60();

  return (NSString *)v2;
}

- (id)toDict
{
  id result = (id)sub_1A916B7C0();
  __break(1u);
  return result;
}

- (AAEventData)init
{
  id result = (AAEventData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___AAEventData_eventDate;
  uint64_t v4 = sub_1A916AC90();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end