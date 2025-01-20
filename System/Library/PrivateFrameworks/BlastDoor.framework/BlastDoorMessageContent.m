@interface BlastDoorMessageContent
- (BlastDoorMessageContent)init;
- (NSAttributedString)content;
- (NSString)description;
- (NSString)plainTextBody;
- (NSString)plainTextSubject;
@end

@implementation BlastDoorMessageContent

- (NSString)description
{
  uint64_t v2 = *(void *)&self->messageContent[OBJC_IVAR___BlastDoorMessageContent_messageContent + 24];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B11F10B4(v2);
  sub_1B196A850();
  v3 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)plainTextBody
{
  return (NSString *)sub_1B17AD0C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMessageContent_messageContent);
}

- (NSString)plainTextSubject
{
  return (NSString *)sub_1B17AD14C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMessageContent_messageContent);
}

- (NSAttributedString)content
{
  if (*(void *)&self->messageContent[OBJC_IVAR___BlastDoorMessageContent_messageContent + 24]) {
    id v2 = sub_1B18BB294();
  }
  else {
    id v2 = 0;
  }
  return (NSAttributedString *)v2;
}

- (BlastDoorMessageContent)init
{
  result = (BlastDoorMessageContent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->messageContent[OBJC_IVAR___BlastDoorMessageContent_messageContent + 24];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B11ED660(v2);
}

@end