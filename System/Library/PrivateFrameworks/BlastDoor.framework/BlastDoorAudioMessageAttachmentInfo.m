@interface BlastDoorAudioMessageAttachmentInfo
- (BlastDoorAudioMessageAttachmentInfo)init;
- (NSString)audioTranscription;
- (NSString)description;
- (NSString)inlineAttachmentKey;
@end

@implementation BlastDoorAudioMessageAttachmentInfo

- (NSString)description
{
  uint64_t v2 = *(void *)&self->audioMessageAttachmentInfo[OBJC_IVAR___BlastDoorAudioMessageAttachmentInfo_audioMessageAttachmentInfo
                                                  + 8];
  long long v5 = *(_OWORD *)&self->audioMessageAttachmentInfo[OBJC_IVAR___BlastDoorAudioMessageAttachmentInfo_audioMessageAttachmentInfo
                                                  + 16];
  swift_retain();
  sub_1B11E7664(v2, v5);
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v3 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)inlineAttachmentKey
{
  uint64_t v2 = *(void *)&self->audioMessageAttachmentInfo[OBJC_IVAR___BlastDoorAudioMessageAttachmentInfo_audioMessageAttachmentInfo
                                                  + 16];
  if (v2)
  {
    if (v2 == 1)
    {
      result = (NSString *)sub_1B196B120();
      __break(1u);
      return result;
    }
    uint64_t v4 = *(void *)&self->audioMessageAttachmentInfo[OBJC_IVAR___BlastDoorAudioMessageAttachmentInfo_audioMessageAttachmentInfo
                                                    + 8];
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1B196A7E0();
    sub_1B11E7748(v4, v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)audioTranscription
{
  return (NSString *)sub_1B17A78F0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAudioMessageAttachmentInfo_audioMessageAttachmentInfo);
}

- (BlastDoorAudioMessageAttachmentInfo)init
{
  result = (BlastDoorAudioMessageAttachmentInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->audioMessageAttachmentInfo[OBJC_IVAR___BlastDoorAudioMessageAttachmentInfo_audioMessageAttachmentInfo
                                                  + 8];
  uint64_t v3 = *(void *)&self->audioMessageAttachmentInfo[OBJC_IVAR___BlastDoorAudioMessageAttachmentInfo_audioMessageAttachmentInfo
                                                  + 16];
  swift_release();
  sub_1B11E7748(v2, v3);
  swift_bridgeObjectRelease();
}

@end