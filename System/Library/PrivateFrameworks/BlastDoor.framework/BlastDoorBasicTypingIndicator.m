@interface BlastDoorBasicTypingIndicator
- (BOOL)isFinished;
- (BlastDoorBasicTypingIndicator)init;
- (NSArray)participantDestinationIdentifiers;
- (NSString)description;
@end

@implementation BlastDoorBasicTypingIndicator

- (NSString)description
{
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isFinished
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___BlastDoorBasicTypingIndicator_basicTypingIndicator);
}

- (NSArray)participantDestinationIdentifiers
{
  if (*(void *)&self->basicTypingIndicator[OBJC_IVAR___BlastDoorBasicTypingIndicator_basicTypingIndicator])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1B196AAF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (BlastDoorBasicTypingIndicator)init
{
  result = (BlastDoorBasicTypingIndicator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end