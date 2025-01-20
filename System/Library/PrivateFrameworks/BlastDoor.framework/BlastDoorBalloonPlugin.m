@interface BlastDoorBalloonPlugin
- (BOOL)has_associatedMessageRange;
- (BOOL)has_associatedMessageType;
- (BOOL)isExpirable;
- (BlastDoorBalloonPlugin)init;
- (BlastDoorBalloonPluginPayloadWrapper)payload;
- (BlastDoorEncodedAttachments)attachments;
- (NSArray)attributionInfo;
- (NSArray)participantDestinationIdentifiers;
- (NSAttributedString)content;
- (NSString)associatedMessageGUID;
- (NSString)bundleID;
- (NSString)description;
- (NSString)plainTextBody;
- (_NSRange)associatedMessageRange;
- (int64_t)associatedMessageType;
@end

@implementation BlastDoorBalloonPlugin

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, type metadata accessor for BalloonPlugin, &OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin, type metadata accessor for BalloonPlugin);
}

- (BlastDoorBalloonPluginPayloadWrapper)payload
{
  uint64_t v3 = type metadata accessor for BalloonPlugin.Payload(0);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin, (uint64_t)v5, type metadata accessor for BalloonPlugin.Payload);
  v6 = (objc_class *)type metadata accessor for _ObjCEnumBalloonPluginPayloadWrapper(0);
  id v7 = objc_allocWithZone(v6);
  sub_1B17B4094((uint64_t)v5, (uint64_t)v7 + OBJC_IVAR___BlastDoorBalloonPluginPayloadWrapper_balloonPlugin_Payload, type metadata accessor for BalloonPlugin.Payload);
  v11.receiver = v7;
  v11.super_class = v6;
  v8 = self;
  v9 = [(BlastDoorBalloonPlugin *)&v11 init];
  sub_1B17B42FC((uint64_t)v5, type metadata accessor for BalloonPlugin.Payload);

  return (BlastDoorBalloonPluginPayloadWrapper *)v9;
}

- (NSString)bundleID
{
  uint64_t v3 = type metadata accessor for BalloonPlugin(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin, (uint64_t)v6, type metadata accessor for BalloonPlugin);
  if (*(void *)&v6[*(int *)(v4 + 28) + 24])
  {
    swift_bridgeObjectRetain();
    sub_1B17B42FC((uint64_t)v6, type metadata accessor for BalloonPlugin);
    id v7 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
    return (NSString *)v7;
  }
  else
  {
    result = (NSString *)sub_1B196B120();
    __break(1u);
  }
  return result;
}

- (BOOL)isExpirable
{
  return sub_1B178E198((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin, type metadata accessor for BalloonPlugin);
}

- (NSArray)attributionInfo
{
  return (NSArray *)sub_1B17A0558(self, (uint64_t)a2, (void (*)(void))sub_1B177A97C, (void (*)(void))type metadata accessor for _ObjCAttributionInfoWrapper);
}

- (NSString)plainTextBody
{
  return (NSString *)sub_1B1797A14((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin, type metadata accessor for BalloonPlugin);
}

- (NSAttributedString)content
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin;
  if (*(void *)&v2[*(int *)(type metadata accessor for BalloonPlugin(0) + 36)]) {
    id v3 = sub_1B18BB294();
  }
  else {
    id v3 = 0;
  }
  return (NSAttributedString *)v3;
}

- (NSArray)participantDestinationIdentifiers
{
  uint64_t v3 = type metadata accessor for BalloonPlugin(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin, (uint64_t)v6, type metadata accessor for BalloonPlugin);
  if (*(void *)&v6[*(int *)(v4 + 48) + 16])
  {
    swift_bridgeObjectRetain();
    sub_1B17B42FC((uint64_t)v6, type metadata accessor for BalloonPlugin);
    id v7 = (void *)sub_1B196AAF0();
    swift_bridgeObjectRelease();
    return (NSArray *)v7;
  }
  else
  {
    result = (NSArray *)sub_1B196B120();
    __break(1u);
  }
  return result;
}

- (NSString)associatedMessageGUID
{
  uint64_t v3 = type metadata accessor for BalloonPlugin(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin, (uint64_t)v6, type metadata accessor for BalloonPlugin);
  id v7 = &v6[*(int *)(v4 + 52)];
  uint64_t v8 = *((void *)v7 + 3);
  if (v8 == 1)
  {
    result = (NSString *)sub_1B196B120();
    __break(1u);
  }
  else
  {
    uint64_t v9 = *((void *)v7 + 2);
    swift_bridgeObjectRetain();
    sub_1B17B42FC((uint64_t)v6, type metadata accessor for BalloonPlugin);
    if (v8)
    {
      v10 = (void *)sub_1B196A7E0();
      sub_1B11E7748(v9, v8);
    }
    else
    {
      v10 = 0;
    }
    return (NSString *)v10;
  }
  return result;
}

- (BOOL)has_associatedMessageRange
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin;
  return (v2[*(int *)(type metadata accessor for BalloonPlugin(0) + 48) + 16] & 1) == 0;
}

- (_NSRange)associatedMessageRange
{
  v2 = self;
  uint64_t v3 = sub_1B177B1C0();
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (BOOL)has_associatedMessageType
{
  uint64_t v3 = type metadata accessor for BalloonPlugin(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x1F4188790](v3);
  NSUInteger v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin, (uint64_t)v6, type metadata accessor for BalloonPlugin);
  NSUInteger v7 = &v6[*(int *)(v4 + 60)];
  if (v7[25])
  {
    BOOL result = sub_1B196B120();
    __break(1u);
  }
  else
  {
    BOOL v8 = (v7[24] & 1) == 0;
    uint64_t v9 = self;
    sub_1B17B42FC((uint64_t)v6, type metadata accessor for BalloonPlugin);

    return v8;
  }
  return result;
}

- (int64_t)associatedMessageType
{
  uint64_t v3 = type metadata accessor for BalloonPlugin(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x1F4188790](v3);
  NSUInteger v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin, (uint64_t)v6, type metadata accessor for BalloonPlugin);
  NSUInteger v7 = &v6[*(int *)(v4 + 60)];
  if (v7[25])
  {
    int64_t result = sub_1B196B120();
    __break(1u);
  }
  else
  {
    char v8 = v7[24];
    int64_t v9 = *((void *)v7 + 2);
    sub_1B17B42FC((uint64_t)v6, type metadata accessor for BalloonPlugin);
    if (v8) {
      return 0;
    }
    else {
      return v9;
    }
  }
  return result;
}

- (BlastDoorEncodedAttachments)attachments
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorBalloonPlugin_balloonPlugin;
  uint64_t v3 = *(void *)&v2[*(int *)(type metadata accessor for BalloonPlugin(0) + 56)];
  uint64_t v4 = (objc_class *)type metadata accessor for _ObjCEncodedAttachmentsWrapper();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR___BlastDoorEncodedAttachments_encodedAttachments] = v3;
  v8.receiver = v5;
  v8.super_class = v4;
  swift_bridgeObjectRetain();
  NSUInteger v6 = [(BlastDoorBalloonPlugin *)&v8 init];
  return (BlastDoorEncodedAttachments *)v6;
}

- (BlastDoorBalloonPlugin)init
{
  int64_t result = (BlastDoorBalloonPlugin *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end