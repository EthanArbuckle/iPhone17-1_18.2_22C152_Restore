@interface BlastDoorLiteTextMessage
- (BlastDoorLiteTapback)tapback;
- (BlastDoorLiteTextMessage)init;
- (NSString)description;
- (NSString)plainTextBody;
- (NSUUID)threadOriginatorUUID;
- (int64_t)effect;
@end

@implementation BlastDoorLiteTextMessage

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, type metadata accessor for LiteTextMessage, &OBJC_IVAR___BlastDoorLiteTextMessage_liteTextMessage, type metadata accessor for LiteTextMessage);
}

- (NSString)plainTextBody
{
  return (NSString *)sub_1B17AD0C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorLiteTextMessage_liteTextMessage);
}

- (int64_t)effect
{
  if (self->liteTextMessage[OBJC_IVAR___BlastDoorLiteTextMessage_liteTextMessage + 8] == 14) {
    unint64_t v2 = 0;
  }
  else {
    unint64_t v2 = self->liteTextMessage[OBJC_IVAR___BlastDoorLiteTextMessage_liteTextMessage + 8];
  }
  int64_t result = sub_1B17B30A0(v2);
  if (v4) {
    __break(1u);
  }
  return result;
}

- (NSUUID)threadOriginatorUUID
{
  return (NSUUID *)sub_1B17A2A2C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorLiteTextMessage_liteTextMessage, type metadata accessor for LiteTextMessage);
}

- (BlastDoorLiteTapback)tapback
{
  unint64_t v2 = self;
  id v3 = sub_1B1786E58();

  return (BlastDoorLiteTapback *)v3;
}

- (BlastDoorLiteTextMessage)init
{
  int64_t result = (BlastDoorLiteTextMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end