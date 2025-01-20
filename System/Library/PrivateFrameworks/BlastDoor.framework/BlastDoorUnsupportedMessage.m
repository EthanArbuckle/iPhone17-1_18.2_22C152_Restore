@interface BlastDoorUnsupportedMessage
- (BlastDoorUnsupportedMessage)init;
- (NSArray)participantDestinationIdentifiers;
- (NSString)description;
@end

@implementation BlastDoorUnsupportedMessage

- (NSString)description
{
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1B17A4ECC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorUnsupportedMessage_unsupportedMessage);
}

- (BlastDoorUnsupportedMessage)init
{
  result = (BlastDoorUnsupportedMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

@end