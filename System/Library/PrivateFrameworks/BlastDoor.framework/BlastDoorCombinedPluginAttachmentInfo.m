@interface BlastDoorCombinedPluginAttachmentInfo
- (BlastDoorCombinedPluginAttachmentInfo)init;
- (NSData)encryptionKey;
- (NSData)signature;
- (NSString)description;
- (NSString)ownerID;
- (NSURL)attachmentURL;
- (unint64_t)expectedFileSize;
@end

@implementation BlastDoorCombinedPluginAttachmentInfo

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for CombinedPluginAttachmentInfo, &OBJC_IVAR___BlastDoorCombinedPluginAttachmentInfo_combinedPluginAttachmentInfo, (uint64_t (*)(void))type metadata accessor for CombinedPluginAttachmentInfo);
}

- (NSURL)attachmentURL
{
  return (NSURL *)sub_1B17A61FC(self, (uint64_t)a2, (void (*)(void))sub_1B178036C);
}

- (NSData)signature
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorCombinedPluginAttachmentInfo_combinedPluginAttachmentInfo;
  v3 = (uint64_t *)&v2[*(int *)(type metadata accessor for CombinedPluginAttachmentInfo() + 20)];
  uint64_t v4 = *v3;
  unint64_t v5 = v3[1];
  sub_1B11F1108(*v3, v5);
  v6 = (void *)sub_1B1969DB0();
  sub_1B11ED78C(v4, v5);
  return (NSData *)v6;
}

- (NSString)ownerID
{
  uint64_t v3 = type metadata accessor for CombinedPluginAttachmentInfo();
  uint64_t v4 = v3 - 8;
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorCombinedPluginAttachmentInfo_combinedPluginAttachmentInfo, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for CombinedPluginAttachmentInfo);
  if (*(void *)&v6[*(int *)(v4 + 32) + 24])
  {
    swift_bridgeObjectRetain();
    sub_1B17B42FC((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for CombinedPluginAttachmentInfo);
    v7 = (void *)sub_1B196A7E0();
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

- (unint64_t)expectedFileSize
{
  return sub_1B17A6748((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorCombinedPluginAttachmentInfo_combinedPluginAttachmentInfo, (uint64_t (*)(void))type metadata accessor for CombinedPluginAttachmentInfo);
}

- (NSData)encryptionKey
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorCombinedPluginAttachmentInfo_combinedPluginAttachmentInfo;
  uint64_t v3 = (uint64_t *)&v2[*(int *)(type metadata accessor for CombinedPluginAttachmentInfo() + 32)];
  uint64_t v4 = *v3;
  unint64_t v5 = v3[1];
  sub_1B11F1108(*v3, v5);
  v6 = (void *)sub_1B1969DB0();
  sub_1B11ED78C(v4, v5);
  return (NSData *)v6;
}

- (BlastDoorCombinedPluginAttachmentInfo)init
{
  result = (BlastDoorCombinedPluginAttachmentInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end