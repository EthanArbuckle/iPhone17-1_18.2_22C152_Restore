@interface BlastDoorTypingIndicator
- (BOOL)isFinished;
- (BlastDoorTypingIndicator)init;
- (BlastDoorTypingIndicator_Icon)icon;
- (NSArray)participantDestinationIdentifiers;
- (NSString)balloonPluginBundleID;
- (NSString)description;
@end

@implementation BlastDoorTypingIndicator

- (NSString)description
{
  sub_1B17B3D0C((uint64_t)self + OBJC_IVAR___BlastDoorTypingIndicator_typingIndicator, (uint64_t)v4);
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isFinished
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___BlastDoorTypingIndicator_typingIndicator);
}

- (BlastDoorTypingIndicator_Icon)icon
{
  v2 = self;
  id v3 = sub_1B17A0C50();

  return (BlastDoorTypingIndicator_Icon *)v3;
}

- (NSString)balloonPluginBundleID
{
  sub_1B17B3D0C((uint64_t)self + OBJC_IVAR___BlastDoorTypingIndicator_typingIndicator, (uint64_t)v6);
  uint64_t v2 = v8;
  if (v8 == 1)
  {
    result = (NSString *)sub_1B196B120();
    __break(1u);
  }
  else
  {
    uint64_t v3 = v7;
    swift_bridgeObjectRetain();
    sub_1B14ED89C((uint64_t)v6);
    if (v2)
    {
      v4 = (void *)sub_1B196A7E0();
      sub_1B11E7748(v3, v2);
    }
    else
    {
      v4 = 0;
    }
    return (NSString *)v4;
  }
  return result;
}

- (NSArray)participantDestinationIdentifiers
{
  if (*(void *)&self->typingIndicator[OBJC_IVAR___BlastDoorTypingIndicator_typingIndicator + 504])
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = (void *)sub_1B196AAF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
  }
  return (NSArray *)v2;
}

- (BlastDoorTypingIndicator)init
{
  result = (BlastDoorTypingIndicator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end