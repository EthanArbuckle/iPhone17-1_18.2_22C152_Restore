@interface MessageServiceReachabilityDelegate
- (BOOL)isUsableForSending;
- (_TtC8iMessage34MessageServiceReachabilityDelegate)init;
- (_TtC8iMessage34MessageServiceReachabilityDelegate)initWithServiceSession:(id)a3;
- (uint64_t)maxChatParticipantsForContext:;
@end

@implementation MessageServiceReachabilityDelegate

- (BOOL)isUsableForSending
{
  sub_89A94(0, &qword_EB0B0);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v4 = self;
  id v5 = [ObjCClassFromMetadata idsAccounts];
  if (v5)
  {
    v6 = v5;
    sub_89A94(0, &qword_EB0B8);
    sub_89AD0();
    uint64_t v7 = sub_96DF0();

    sub_88D74(v7);
    LOBYTE(v6) = v8;

    swift_bridgeObjectRelease();
    LOBYTE(v5) = v6 & 1;
  }
  else
  {
    __break(1u);
  }
  return (char)v5;
}

- (_TtC8iMessage34MessageServiceReachabilityDelegate)init
{
  result = (_TtC8iMessage34MessageServiceReachabilityDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8iMessage34MessageServiceReachabilityDelegate)initWithServiceSession:(id)a3
{
  id v3 = a3;
  result = (_TtC8iMessage34MessageServiceReachabilityDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (uint64_t)maxChatParticipantsForContext:
{
  id v0 = [self sharedInstanceForBagType:1];
  NSString v1 = sub_96D20();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    sub_96EA0();

    swift_unknownObjectRelease();
  }
  else
  {

    memset(v5, 0, sizeof(v5));
  }
  sub_89BA8((uint64_t)v5, (uint64_t)v6);
  if (!v7)
  {
    sub_89C10((uint64_t)v6);
    return -1;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return -1;
  }
  if (v4 <= 10) {
    return -1;
  }
  else {
    return v4;
  }
}

@end