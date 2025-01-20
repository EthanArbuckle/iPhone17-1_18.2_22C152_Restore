@interface BlastDoorMessage
- (BlastDoorMessage)init;
- (NSArray)attributionInfo;
- (NSArray)participantDestinationIdentifiers;
- (NSAttributedString)content;
- (NSString)description;
- (NSString)plainTextBody;
- (NSString)plainTextSubject;
@end

@implementation BlastDoorMessage

- (NSString)description
{
  uint64_t v2 = *(void *)&self->message[OBJC_IVAR___BlastDoorMessage_message + 40];
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1B12FC558(v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1B196A850();
  v3 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)plainTextBody
{
  return (NSString *)sub_1B17AD0C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMessage_message);
}

- (NSString)plainTextSubject
{
  return (NSString *)sub_1B17AD14C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMessage_message);
}

- (NSAttributedString)content
{
  uint64_t v2 = self;
  id v3 = sub_1B17A0360();

  return (NSAttributedString *)v3;
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1B17A0404((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMessage_message);
}

- (NSArray)attributionInfo
{
  return (NSArray *)sub_1B17A0558(self, (uint64_t)a2, (void (*)(void))sub_1B17A05D0, (void (*)(void))type metadata accessor for _ObjCAttributionInfoWrapper);
}

- (BlastDoorMessage)init
{
  result = (BlastDoorMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->message[OBJC_IVAR___BlastDoorMessage_message + 40];
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B11ED650(v2);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end