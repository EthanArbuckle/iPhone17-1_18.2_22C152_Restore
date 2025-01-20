@interface BlastDoorEmojiImageMetadata
- (BlastDoorEmojiImageMetadata)init;
- (NSString)contentIdentifier;
- (NSString)description;
- (NSString)digitalSourceType;
- (NSString)imageCredit;
- (NSString)shortDescription;
- (int64_t)imageStrikeCount;
@end

@implementation BlastDoorEmojiImageMetadata

- (NSString)description
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)imageStrikeCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorEmojiImageMetadata_emojiImageMetadata);
}

- (NSString)contentIdentifier
{
  return (NSString *)sub_1B17AB9BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEmojiImageMetadata_emojiImageMetadata);
}

- (NSString)shortDescription
{
  return (NSString *)sub_1B179F9F0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEmojiImageMetadata_emojiImageMetadata);
}

- (NSString)imageCredit
{
  return (NSString *)sub_1B17A1678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEmojiImageMetadata_emojiImageMetadata);
}

- (NSString)digitalSourceType
{
  return (NSString *)sub_1B17ABBA4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEmojiImageMetadata_emojiImageMetadata);
}

- (BlastDoorEmojiImageMetadata)init
{
  result = (BlastDoorEmojiImageMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end