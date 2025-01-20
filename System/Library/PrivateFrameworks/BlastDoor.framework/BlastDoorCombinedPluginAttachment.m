@interface BlastDoorCombinedPluginAttachment
- (BlastDoorBalloonPluginPayloadWrapper)payload;
- (BlastDoorCombinedPluginAttachment)init;
- (BlastDoorEncodedAttachments)attachments;
- (NSString)description;
@end

@implementation BlastDoorCombinedPluginAttachment

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for CombinedPluginAttachment, &OBJC_IVAR___BlastDoorCombinedPluginAttachment_combinedPluginAttachment, (uint64_t (*)(void))type metadata accessor for CombinedPluginAttachment);
}

- (BlastDoorEncodedAttachments)attachments
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorCombinedPluginAttachment_combinedPluginAttachment);
  v3 = (objc_class *)type metadata accessor for _ObjCEncodedAttachmentsWrapper();
  v4 = (char *)objc_allocWithZone(v3);
  *(void *)&v4[OBJC_IVAR___BlastDoorEncodedAttachments_encodedAttachments] = v2;
  v7.receiver = v4;
  v7.super_class = v3;
  swift_bridgeObjectRetain();
  v5 = [(BlastDoorCombinedPluginAttachment *)&v7 init];
  return (BlastDoorEncodedAttachments *)v5;
}

- (BlastDoorBalloonPluginPayloadWrapper)payload
{
  uint64_t v3 = type metadata accessor for BalloonPlugin.Payload(0);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___BlastDoorCombinedPluginAttachment_combinedPluginAttachment;
  uint64_t v7 = type metadata accessor for CombinedPluginAttachment();
  sub_1B17B4094((uint64_t)&v6[*(int *)(v7 + 20)], (uint64_t)v5, type metadata accessor for BalloonPlugin.Payload);
  v8 = (objc_class *)type metadata accessor for _ObjCEnumBalloonPluginPayloadWrapper(0);
  id v9 = objc_allocWithZone(v8);
  sub_1B17B4094((uint64_t)v5, (uint64_t)v9 + OBJC_IVAR___BlastDoorBalloonPluginPayloadWrapper_balloonPlugin_Payload, type metadata accessor for BalloonPlugin.Payload);
  v13.receiver = v9;
  v13.super_class = v8;
  v10 = self;
  v11 = [(BlastDoorCombinedPluginAttachment *)&v13 init];
  sub_1B17B42FC((uint64_t)v5, type metadata accessor for BalloonPlugin.Payload);

  return (BlastDoorBalloonPluginPayloadWrapper *)v11;
}

- (BlastDoorCombinedPluginAttachment)init
{
  result = (BlastDoorCombinedPluginAttachment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end