@interface BlastDoorBasicTextMessageMessageTypeWrapper
- (BlastDoorBasicAudioMessage)audioMessage;
- (BlastDoorBasicEmojiTapback)emojiTapback;
- (BlastDoorBasicMessage)textMessage;
- (BlastDoorBasicTapBack)tapback;
- (BlastDoorBasicTextMessageMessageTypeWrapper)init;
- (BlastDoorBasicTypingIndicator)typingIndicator;
- (BlastDoorUnsupportedMessage)unsupported;
- (NSString)description;
- (unint64_t)type;
@end

@implementation BlastDoorBasicTextMessageMessageTypeWrapper

- (NSString)description
{
  sub_1B136C230((BlastDoorBasicTextMessageMessageTypeWrapper *)((char *)self+ OBJC_IVAR___BlastDoorBasicTextMessageMessageTypeWrapper_basicTextMessage_MessageType), v5);
  sub_1B136C230(v5, v4);
  sub_1B136C4E0((uint64_t)v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1B136C268);
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (unint64_t)type
{
  sub_1B136C230((BlastDoorBasicTextMessageMessageTypeWrapper *)((char *)self+ OBJC_IVAR___BlastDoorBasicTextMessageMessageTypeWrapper_basicTextMessage_MessageType), v4);
  sub_1B136C230(v4, v5);
  unint64_t v2 = sub_1B136F948((uint64_t)v5);
  nullsub_1(v5);
  return v2;
}

- (BlastDoorBasicTypingIndicator)typingIndicator
{
  sub_1B136C230((BlastDoorBasicTextMessageMessageTypeWrapper *)((char *)self+ OBJC_IVAR___BlastDoorBasicTextMessageMessageTypeWrapper_basicTextMessage_MessageType), v12);
  sub_1B136C230(v12, v13);
  if (sub_1B136F948((uint64_t)v13))
  {
    unint64_t v2 = 0;
  }
  else
  {
    uint64_t v3 = nullsub_1(v13);
    char v4 = *(unsigned char *)v3;
    uint64_t v5 = *(void *)(v3 + 8);
    v6 = (objc_class *)type metadata accessor for _ObjCBasicTypingIndicatorWrapper();
    v7 = (char *)objc_allocWithZone(v6);
    v8 = &v7[OBJC_IVAR___BlastDoorBasicTypingIndicator_basicTypingIndicator];
    char *v8 = v4;
    *((void *)v8 + 1) = v5;
    sub_1B136C230(v12, v11);
    nullsub_1(v11);
    v10.receiver = v7;
    v10.super_class = v6;
    swift_bridgeObjectRetain();
    unint64_t v2 = [(BlastDoorBasicTextMessageMessageTypeWrapper *)&v10 init];
  }
  return (BlastDoorBasicTypingIndicator *)v2;
}

- (BlastDoorBasicMessage)textMessage
{
  sub_1B136C230((BlastDoorBasicTextMessageMessageTypeWrapper *)((char *)self+ OBJC_IVAR___BlastDoorBasicTextMessageMessageTypeWrapper_basicTextMessage_MessageType), v19);
  sub_1B136C230(v19, v20);
  if (sub_1B136F948((uint64_t)v20) == 1)
  {
    uint64_t v2 = nullsub_1(v20);
    uint64_t v3 = *(void *)(v2 + 16);
    uint64_t v4 = *(void *)(v2 + 24);
    long long v15 = *(_OWORD *)v2;
    long long v16 = *(_OWORD *)(v2 + 48);
    uint64_t v5 = *(void *)(v2 + 64);
    uint64_t v6 = *(void *)(v2 + 88);
    v7 = (objc_class *)type metadata accessor for _ObjCBasicMessageWrapper();
    long long v13 = *(_OWORD *)(v2 + 32);
    long long v14 = *(_OWORD *)(v2 + 72);
    v8 = (char *)objc_allocWithZone(v7);
    v9 = &v8[OBJC_IVAR___BlastDoorBasicMessage_basicMessage];
    *(_OWORD *)v9 = v15;
    *((void *)v9 + 2) = v3;
    *((void *)v9 + 3) = v4;
    *((_OWORD *)v9 + 2) = v13;
    *((_OWORD *)v9 + 3) = v16;
    *((void *)v9 + 8) = v5;
    *(_OWORD *)(v9 + 72) = v14;
    *((void *)v9 + 11) = v6;
    sub_1B136C230(v19, v18);
    uint64_t v10 = *(void *)(nullsub_1(v18) + 48);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_1B12FC558(v10);
    v17.receiver = v8;
    v17.super_class = v7;
    swift_retain();
    swift_bridgeObjectRetain();
    v11 = [(BlastDoorBasicTextMessageMessageTypeWrapper *)&v17 init];
  }
  else
  {
    v11 = 0;
  }
  return (BlastDoorBasicMessage *)v11;
}

- (BlastDoorBasicTapBack)tapback
{
  sub_1B136C230((BlastDoorBasicTextMessageMessageTypeWrapper *)((char *)self+ OBJC_IVAR___BlastDoorBasicTextMessageMessageTypeWrapper_basicTextMessage_MessageType), v24);
  sub_1B136C230(v24, v25);
  if (sub_1B136F948((uint64_t)v25) == 2)
  {
    uint64_t v2 = nullsub_1(v25);
    char v3 = *(unsigned char *)v2;
    long long v18 = *(_OWORD *)(v2 + 24);
    long long v19 = *(_OWORD *)(v2 + 8);
    uint64_t v4 = *(void *)(v2 + 40);
    uint64_t v5 = *(void *)(v2 + 48);
    long long v20 = *(_OWORD *)(v2 + 88);
    long long v21 = *(_OWORD *)(v2 + 72);
    uint64_t v6 = *(void *)(v2 + 104);
    uint64_t v7 = *(void *)(v2 + 112);
    v8 = (objc_class *)type metadata accessor for _ObjCBasicTapBackWrapper();
    long long v17 = *(_OWORD *)(v2 + 56);
    v9 = (char *)objc_allocWithZone(v8);
    uint64_t v10 = &v9[OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack];
    *uint64_t v10 = v3;
    *(_OWORD *)(v10 + 8) = v19;
    *(_OWORD *)(v10 + 24) = v18;
    *((void *)v10 + 5) = v4;
    *((void *)v10 + 6) = v5;
    *(_OWORD *)(v10 + 56) = v17;
    *(_OWORD *)(v10 + 72) = v21;
    *(_OWORD *)(v10 + 88) = v20;
    *((void *)v10 + 13) = v6;
    *((void *)v10 + 14) = v7;
    sub_1B136C230(v24, v23);
    v11 = (void *)nullsub_1(v23);
    uint64_t v12 = v11[10];
    uint64_t v13 = v11[11];
    uint64_t v14 = v11[12];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1B136C45C(v12, v13, v14);
    v22.receiver = v9;
    v22.super_class = v8;
    swift_bridgeObjectRetain();
    long long v15 = [(BlastDoorBasicTextMessageMessageTypeWrapper *)&v22 init];
  }
  else
  {
    long long v15 = 0;
  }
  return (BlastDoorBasicTapBack *)v15;
}

- (BlastDoorBasicAudioMessage)audioMessage
{
  sub_1B136C230((BlastDoorBasicTextMessageMessageTypeWrapper *)((char *)self+ OBJC_IVAR___BlastDoorBasicTextMessageMessageTypeWrapper_basicTextMessage_MessageType), v16);
  sub_1B136C230(v16, v17);
  if (sub_1B136F948((uint64_t)v17) == 3)
  {
    uint64_t v2 = nullsub_1(v17);
    long long v13 = *(_OWORD *)v2;
    uint64_t v3 = *(void *)(v2 + 16);
    uint64_t v4 = *(void *)(v2 + 40);
    uint64_t v5 = *(void *)(v2 + 48);
    uint64_t v6 = (objc_class *)type metadata accessor for _ObjCBasicAudioMessageWrapper();
    long long v12 = *(_OWORD *)(v2 + 24);
    uint64_t v7 = (char *)objc_allocWithZone(v6);
    v8 = &v7[OBJC_IVAR___BlastDoorBasicAudioMessage_basicAudioMessage];
    *(_OWORD *)v8 = v13;
    *((void *)v8 + 2) = v3;
    *(_OWORD *)(v8 + 24) = v12;
    *((void *)v8 + 5) = v4;
    *((void *)v8 + 6) = v5;
    sub_1B136C230(v16, v15);
    v9 = (uint64_t *)nullsub_1(v15);
    sub_1B11F10B4(*v9);
    v14.receiver = v7;
    v14.super_class = v6;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v10 = [(BlastDoorBasicTextMessageMessageTypeWrapper *)&v14 init];
  }
  else
  {
    uint64_t v10 = 0;
  }
  return (BlastDoorBasicAudioMessage *)v10;
}

- (BlastDoorUnsupportedMessage)unsupported
{
  sub_1B136C230((BlastDoorBasicTextMessageMessageTypeWrapper *)((char *)self+ OBJC_IVAR___BlastDoorBasicTextMessageMessageTypeWrapper_basicTextMessage_MessageType), v12);
  sub_1B136C230(v12, v13);
  if (sub_1B136F948((uint64_t)v13) == 4)
  {
    uint64_t v2 = nullsub_1(v13);
    uint64_t v3 = *(void *)(v2 + 16);
    uint64_t v4 = (objc_class *)type metadata accessor for _ObjCUnsupportedMessageWrapper();
    long long v9 = *(_OWORD *)v2;
    uint64_t v5 = (char *)objc_allocWithZone(v4);
    uint64_t v6 = &v5[OBJC_IVAR___BlastDoorUnsupportedMessage_unsupportedMessage];
    *(_OWORD *)uint64_t v6 = v9;
    *((void *)v6 + 2) = v3;
    sub_1B136C230(v12, v11);
    nullsub_1(v11);
    v10.receiver = v5;
    v10.super_class = v4;
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v7 = [(BlastDoorBasicTextMessageMessageTypeWrapper *)&v10 init];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return (BlastDoorUnsupportedMessage *)v7;
}

- (BlastDoorBasicEmojiTapback)emojiTapback
{
  sub_1B136C230((BlastDoorBasicTextMessageMessageTypeWrapper *)((char *)self+ OBJC_IVAR___BlastDoorBasicTextMessageMessageTypeWrapper_basicTextMessage_MessageType), v18);
  sub_1B136C230(v18, v19);
  if (sub_1B136F948((uint64_t)v19) == 5)
  {
    uint64_t v2 = nullsub_1(v19);
    uint64_t v3 = (objc_class *)type metadata accessor for _ObjCBasicEmojiTapbackWrapper();
    uint64_t v4 = (char *)objc_allocWithZone(v3);
    uint64_t v5 = &v4[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback];
    long long v6 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)uint64_t v5 = *(_OWORD *)v2;
    *((_OWORD *)v5 + 1) = v6;
    long long v7 = *(_OWORD *)(v2 + 80);
    long long v9 = *(_OWORD *)(v2 + 32);
    long long v8 = *(_OWORD *)(v2 + 48);
    *((_OWORD *)v5 + 4) = *(_OWORD *)(v2 + 64);
    *((_OWORD *)v5 + 5) = v7;
    *((_OWORD *)v5 + 2) = v9;
    *((_OWORD *)v5 + 3) = v8;
    long long v11 = *(_OWORD *)(v2 + 112);
    long long v10 = *(_OWORD *)(v2 + 128);
    long long v12 = *(_OWORD *)(v2 + 96);
    *((void *)v5 + 18) = *(void *)(v2 + 144);
    *((_OWORD *)v5 + 7) = v11;
    *((_OWORD *)v5 + 8) = v10;
    *((_OWORD *)v5 + 6) = v12;
    sub_1B136C230(v18, v17);
    long long v13 = (void *)nullsub_1(v17);
    sub_1B14DEE44(v13);
    v16.receiver = v4;
    v16.super_class = v3;
    objc_super v14 = [(BlastDoorBasicTextMessageMessageTypeWrapper *)&v16 init];
  }
  else
  {
    objc_super v14 = 0;
  }
  return (BlastDoorBasicEmojiTapback *)v14;
}

- (BlastDoorBasicTextMessageMessageTypeWrapper)init
{
  result = (BlastDoorBasicTextMessageMessageTypeWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B136C230((BlastDoorBasicTextMessageMessageTypeWrapper *)((char *)self+ OBJC_IVAR___BlastDoorBasicTextMessageMessageTypeWrapper_basicTextMessage_MessageType), v2);
  sub_1B136C4E0((uint64_t)v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1B136C554);
}

@end