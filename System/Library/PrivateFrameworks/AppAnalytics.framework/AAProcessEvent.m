@interface AAProcessEvent
- (AAJSON)json;
- (AAProcessEvent)init;
- (NSString)groupName;
- (NSString)name;
- (NSString)version;
@end

@implementation AAProcessEvent

- (NSString)name
{
  return (NSString *)sub_1A90CF1F0();
}

- (NSString)version
{
  return (NSString *)sub_1A90CF1F0();
}

- (AAJSON)json
{
  return (AAJSON *)*(id *)((char *)&self->super.isa + OBJC_IVAR___AAProcessEvent_json);
}

- (NSString)groupName
{
  if (*(void *)&self->name[OBJC_IVAR___AAProcessEvent_groupName])
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

- (AAProcessEvent)init
{
  result = (AAProcessEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end