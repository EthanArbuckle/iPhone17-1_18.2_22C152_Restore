@interface BlastDoorFileTransferAttributeAttachmentSubtypeWrapper
- (BlastDoorAudioMessageAttachmentInfo)audioMessage;
- (BlastDoorEmojiImageAttachmentInfo)emojiImage;
- (BlastDoorFileTransferAttributeAttachmentSubtypeWrapper)init;
- (BlastDoorGeneralAttachmentInfo)unspecified;
- (BlastDoorLivePhotoAttachmentInfo)livePhoto;
- (BlastDoorStickerAttachmentInfo)sticker;
- (NSString)description;
- (unint64_t)type;
@end

@implementation BlastDoorFileTransferAttributeAttachmentSubtypeWrapper

- (NSString)description
{
  sub_1B14FA904((uint64_t)self+ OBJC_IVAR___BlastDoorFileTransferAttributeAttachmentSubtypeWrapper_fileTransferAttribute_AttachmentSubtype, (uint64_t)v5);
  sub_1B14FA904((uint64_t)v5, (uint64_t)&v4);
  sub_1B16A32B4((uint64_t)v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1B14FA9EC);
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (unint64_t)type
{
  sub_1B14FA904((uint64_t)self+ OBJC_IVAR___BlastDoorFileTransferAttributeAttachmentSubtypeWrapper_fileTransferAttribute_AttachmentSubtype, (uint64_t)v4);
  sub_1B14FA904((uint64_t)v4, (uint64_t)v5);
  unint64_t v2 = sub_1B1500CD0((uint64_t)v5);
  sub_1B1500DD8((uint64_t)v5);
  return v2;
}

- (BlastDoorGeneralAttachmentInfo)unspecified
{
  sub_1B14FA904((uint64_t)self+ OBJC_IVAR___BlastDoorFileTransferAttributeAttachmentSubtypeWrapper_fileTransferAttribute_AttachmentSubtype, (uint64_t)v12);
  sub_1B14FA904((uint64_t)v12, (uint64_t)v13);
  if (sub_1B1500CD0((uint64_t)v13))
  {
    unint64_t v2 = 0;
  }
  else
  {
    v3 = (uint64_t *)sub_1B1500DD8((uint64_t)v13);
    uint64_t v4 = *v3;
    uint64_t v5 = v3[1];
    v6 = (objc_class *)type metadata accessor for _ObjCGeneralAttachmentInfoWrapper();
    v7 = (char *)objc_allocWithZone(v6);
    v8 = &v7[OBJC_IVAR___BlastDoorGeneralAttachmentInfo_generalAttachmentInfo];
    *(void *)v8 = v4;
    *((void *)v8 + 1) = v5;
    sub_1B14FA904((uint64_t)v12, (uint64_t)v11);
    sub_1B1500DD8((uint64_t)v11);
    v10.receiver = v7;
    v10.super_class = v6;
    swift_bridgeObjectRetain();
    unint64_t v2 = [(BlastDoorFileTransferAttributeAttachmentSubtypeWrapper *)&v10 init];
  }
  return (BlastDoorGeneralAttachmentInfo *)v2;
}

- (BlastDoorEmojiImageAttachmentInfo)emojiImage
{
  sub_1B14FA904((uint64_t)self+ OBJC_IVAR___BlastDoorFileTransferAttributeAttachmentSubtypeWrapper_fileTransferAttribute_AttachmentSubtype, (uint64_t)v21);
  sub_1B14FA904((uint64_t)v21, (uint64_t)v22);
  if (sub_1B1500CD0((uint64_t)v22) == 1)
  {
    unint64_t v2 = (_OWORD *)sub_1B1500DD8((uint64_t)v22);
    v3 = (objc_class *)type metadata accessor for _ObjCEmojiImageAttachmentInfoWrapper();
    uint64_t v4 = (char *)objc_allocWithZone(v3);
    uint64_t v5 = &v4[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo];
    long long v6 = v2[1];
    *(_OWORD *)uint64_t v5 = *v2;
    *((_OWORD *)v5 + 1) = v6;
    long long v7 = v2[5];
    long long v9 = v2[2];
    long long v8 = v2[3];
    *((_OWORD *)v5 + 4) = v2[4];
    *((_OWORD *)v5 + 5) = v7;
    *((_OWORD *)v5 + 2) = v9;
    *((_OWORD *)v5 + 3) = v8;
    long long v10 = v2[9];
    long long v12 = v2[6];
    long long v11 = v2[7];
    *((_OWORD *)v5 + 8) = v2[8];
    *((_OWORD *)v5 + 9) = v10;
    *((_OWORD *)v5 + 6) = v12;
    *((_OWORD *)v5 + 7) = v11;
    long long v13 = v2[13];
    long long v15 = v2[10];
    long long v14 = v2[11];
    *((_OWORD *)v5 + 12) = v2[12];
    *((_OWORD *)v5 + 13) = v13;
    *((_OWORD *)v5 + 10) = v15;
    *((_OWORD *)v5 + 11) = v14;
    sub_1B14FA904((uint64_t)v21, (uint64_t)v20);
    v16 = (void *)sub_1B1500DD8((uint64_t)v20);
    sub_1B14DCD38(v16);
    v19.receiver = v4;
    v19.super_class = v3;
    v17 = [(BlastDoorFileTransferAttributeAttachmentSubtypeWrapper *)&v19 init];
  }
  else
  {
    v17 = 0;
  }
  return (BlastDoorEmojiImageAttachmentInfo *)v17;
}

- (BlastDoorStickerAttachmentInfo)sticker
{
  sub_1B14FA904((uint64_t)self+ OBJC_IVAR___BlastDoorFileTransferAttributeAttachmentSubtypeWrapper_fileTransferAttribute_AttachmentSubtype, (uint64_t)v10);
  sub_1B14FA904((uint64_t)v10, (uint64_t)v11);
  if (sub_1B1500CD0((uint64_t)v11) == 2)
  {
    unint64_t v2 = (const void *)sub_1B1500DD8((uint64_t)v11);
    v3 = (objc_class *)type metadata accessor for _ObjCStickerAttachmentInfoWrapper();
    uint64_t v4 = (char *)objc_allocWithZone(v3);
    memcpy(&v4[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo], v2, 0x111uLL);
    sub_1B14FA904((uint64_t)v10, (uint64_t)v9);
    uint64_t v5 = (void *)sub_1B1500DD8((uint64_t)v9);
    sub_1B14DCFF8(v5);
    v8.receiver = v4;
    v8.super_class = v3;
    long long v6 = [(BlastDoorFileTransferAttributeAttachmentSubtypeWrapper *)&v8 init];
  }
  else
  {
    long long v6 = 0;
  }
  return (BlastDoorStickerAttachmentInfo *)v6;
}

- (BlastDoorLivePhotoAttachmentInfo)livePhoto
{
  sub_1B14FA904((uint64_t)self+ OBJC_IVAR___BlastDoorFileTransferAttributeAttachmentSubtypeWrapper_fileTransferAttribute_AttachmentSubtype, (uint64_t)v13);
  sub_1B14FA904((uint64_t)v13, (uint64_t)v14);
  if (sub_1B1500CD0((uint64_t)v14) == 3)
  {
    uint64_t v2 = sub_1B1500DD8((uint64_t)v14);
    uint64_t v3 = *(void *)(v2 + 16);
    uint64_t v4 = *(void *)(v2 + 24);
    uint64_t v5 = (objc_class *)type metadata accessor for _ObjCLivePhotoAttachmentInfoWrapper();
    long long v10 = *(_OWORD *)v2;
    long long v6 = (char *)objc_allocWithZone(v5);
    long long v7 = &v6[OBJC_IVAR___BlastDoorLivePhotoAttachmentInfo_livePhotoAttachmentInfo];
    *(_OWORD *)long long v7 = v10;
    *((void *)v7 + 2) = v3;
    *((void *)v7 + 3) = v4;
    sub_1B14FA904((uint64_t)v13, (uint64_t)v12);
    sub_1B1500DD8((uint64_t)v12);
    v11.receiver = v6;
    v11.super_class = v5;
    swift_retain();
    swift_bridgeObjectRetain();
    objc_super v8 = [(BlastDoorFileTransferAttributeAttachmentSubtypeWrapper *)&v11 init];
  }
  else
  {
    objc_super v8 = 0;
  }
  return (BlastDoorLivePhotoAttachmentInfo *)v8;
}

- (BlastDoorAudioMessageAttachmentInfo)audioMessage
{
  sub_1B14FA904((uint64_t)self+ OBJC_IVAR___BlastDoorFileTransferAttributeAttachmentSubtypeWrapper_fileTransferAttribute_AttachmentSubtype, (uint64_t)v17);
  sub_1B14FA904((uint64_t)v17, (uint64_t)v18);
  if (sub_1B1500CD0((uint64_t)v18) == 4)
  {
    uint64_t v2 = sub_1B1500DD8((uint64_t)v18);
    long long v14 = *(_OWORD *)(v2 + 16);
    uint64_t v3 = *(void *)(v2 + 32);
    uint64_t v4 = *(void *)(v2 + 40);
    uint64_t v5 = (objc_class *)type metadata accessor for _ObjCAudioMessageAttachmentInfoWrapper();
    long long v13 = *(_OWORD *)v2;
    long long v6 = (char *)objc_allocWithZone(v5);
    long long v7 = &v6[OBJC_IVAR___BlastDoorAudioMessageAttachmentInfo_audioMessageAttachmentInfo];
    *(_OWORD *)long long v7 = v13;
    *((_OWORD *)v7 + 1) = v14;
    *((void *)v7 + 4) = v3;
    *((void *)v7 + 5) = v4;
    sub_1B14FA904((uint64_t)v17, (uint64_t)v16);
    uint64_t v8 = sub_1B1500DD8((uint64_t)v16);
    uint64_t v9 = *(void *)(v8 + 16);
    uint64_t v10 = *(void *)(v8 + 24);
    swift_retain();
    sub_1B11E7664(v9, v10);
    v15.receiver = v6;
    v15.super_class = v5;
    swift_bridgeObjectRetain();
    objc_super v11 = [(BlastDoorFileTransferAttributeAttachmentSubtypeWrapper *)&v15 init];
  }
  else
  {
    objc_super v11 = 0;
  }
  return (BlastDoorAudioMessageAttachmentInfo *)v11;
}

- (BlastDoorFileTransferAttributeAttachmentSubtypeWrapper)init
{
  result = (BlastDoorFileTransferAttributeAttachmentSubtypeWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B14FA904((uint64_t)self+ OBJC_IVAR___BlastDoorFileTransferAttributeAttachmentSubtypeWrapper_fileTransferAttribute_AttachmentSubtype, (uint64_t)v2);
  sub_1B16A32B4((uint64_t)v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1B14DD33C);
}

@end