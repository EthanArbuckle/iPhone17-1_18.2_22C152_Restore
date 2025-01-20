@interface BlastDoorBasicMessage
- (BlastDoorBasicMessage)init;
- (NSArray)participantDestinationIdentifiers;
- (NSAttributedString)content;
- (NSString)description;
- (NSString)plainTextBody;
- (NSString)plainTextSubject;
@end

@implementation BlastDoorBasicMessage

- (NSString)description
{
  uint64_t v2 = *(void *)&self->basicMessage[OBJC_IVAR___BlastDoorBasicMessage_basicMessage + 40];
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1B12FC558(v2);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1B196A850();
  v3 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)plainTextBody
{
  return (NSString *)sub_1B17AD0C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicMessage_basicMessage);
}

- (NSString)plainTextSubject
{
  return (NSString *)sub_1B17AD14C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicMessage_basicMessage);
}

- (NSAttributedString)content
{
  uint64_t v2 = self;
  id v3 = sub_1B177C808();

  return (NSAttributedString *)v3;
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1B17A0404((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicMessage_basicMessage);
}

- (BlastDoorBasicMessage)init
{
  result = (BlastDoorBasicMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->basicMessage[OBJC_IVAR___BlastDoorBasicMessage_basicMessage + 40];
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B11ED650(v2);
  swift_release();
  swift_bridgeObjectRelease();
}

@end