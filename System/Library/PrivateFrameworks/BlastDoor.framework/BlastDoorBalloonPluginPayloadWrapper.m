@interface BlastDoorBalloonPluginPayloadWrapper
- (BlastDoorBalloonPluginPayloadWrapper)init;
- (BlastDoorCombinedPluginAttachmentInfo)combinedPluginAttachmentInfo;
- (NSData)digitalTouchBalloon;
- (NSData)handwriting;
- (NSData)linkPresentation;
- (NSData)messagesAppBalloon;
- (NSString)description;
- (unint64_t)type;
@end

@implementation BlastDoorBalloonPluginPayloadWrapper

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, type metadata accessor for BalloonPlugin.Payload, &OBJC_IVAR___BlastDoorBalloonPluginPayloadWrapper_balloonPlugin_Payload, type metadata accessor for BalloonPlugin.Payload);
}

- (unint64_t)type
{
  uint64_t v3 = type metadata accessor for BalloonPlugin.Payload(0);
  MEMORY[0x1F4188790](v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorBalloonPluginPayloadWrapper_balloonPlugin_Payload, (uint64_t)v5, type metadata accessor for BalloonPlugin.Payload);
  unint64_t EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  sub_1B17B42FC((uint64_t)v5, type metadata accessor for BalloonPlugin.Payload);
  return EnumCaseMultiPayload;
}

- (NSData)messagesAppBalloon
{
  v2 = self;
  uint64_t v3 = (void *)sub_1B17AEE00();

  return (NSData *)v3;
}

- (NSData)handwriting
{
  v2 = self;
  uint64_t v3 = (void *)sub_1B17AEFBC();

  return (NSData *)v3;
}

- (NSData)linkPresentation
{
  v2 = self;
  uint64_t v3 = (void *)sub_1B17AF2F4();

  return (NSData *)v3;
}

- (BlastDoorCombinedPluginAttachmentInfo)combinedPluginAttachmentInfo
{
  v2 = self;
  id v3 = sub_1B17AF4B4();

  return (BlastDoorCombinedPluginAttachmentInfo *)v3;
}

- (NSData)digitalTouchBalloon
{
  v2 = self;
  id v3 = (void *)sub_1B17AF6F4();

  return (NSData *)v3;
}

- (BlastDoorBalloonPluginPayloadWrapper)init
{
  result = (BlastDoorBalloonPluginPayloadWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end