@interface TipsNextEventReporter
+ (TipsNextEventReporter)shared;
- (TipsNextEventReporter)init;
- (void)donateReceivedPhotoEventWatch;
- (void)donateSavedPhotoEventWatch;
- (void)donateSentINSendMessageIntentEvent;
- (void)donateSentMessageEvent;
- (void)donateSentSetNameAndPhotoProfileEvent;
- (void)donateSentTapbackEventWatch;
@end

@implementation TipsNextEventReporter

+ (TipsNextEventReporter)shared
{
  if (qword_1EB4A55F8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB4A55E8;

  return (TipsNextEventReporter *)v2;
}

- (void)donateSentMessageEvent
{
  uint64_t v3 = sub_1A07856F8(&qword_1EB4A5650);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1A09F41C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = 0;
  *(void *)(v7 + 24) = 0;
  *(unsigned char *)(v7 + 32) = 0;
  *(void *)(v7 + 40) = self;
  v8 = self;
  sub_1A08BE6E4((uint64_t)v5, (uint64_t)&unk_1E94FBF10, v7);

  swift_release();
}

- (void)donateReceivedPhotoEventWatch
{
  uint64_t v3 = sub_1A07856F8(&qword_1EB4A5650);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1A09F41C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = 0;
  *(void *)(v7 + 24) = 0;
  *(unsigned char *)(v7 + 32) = 1;
  *(void *)(v7 + 40) = self;
  v8 = self;
  sub_1A08BE6E4((uint64_t)v5, (uint64_t)&unk_1E94FBF08, v7);

  swift_release();
}

- (void)donateSentINSendMessageIntentEvent
{
  uint64_t v3 = sub_1A07856F8(&qword_1EB4A5650);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1A09F41C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = 0;
  *(void *)(v7 + 24) = 0;
  *(unsigned char *)(v7 + 32) = 0;
  *(void *)(v7 + 40) = self;
  v8 = self;
  sub_1A08BE6E4((uint64_t)v5, (uint64_t)&unk_1E94FBF00, v7);

  swift_release();
}

- (void)donateSavedPhotoEventWatch
{
  uint64_t v3 = sub_1A07856F8(&qword_1EB4A5650);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1A09F41C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = 0;
  *(void *)(v7 + 24) = 0;
  *(unsigned char *)(v7 + 32) = 4;
  *(void *)(v7 + 40) = self;
  v8 = self;
  sub_1A08BE6E4((uint64_t)v5, (uint64_t)&unk_1E94FBEF8, v7);

  swift_release();
}

- (void)donateSentTapbackEventWatch
{
  uint64_t v3 = sub_1A07856F8(&qword_1EB4A5650);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1A09F41C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = 0;
  *(void *)(v7 + 24) = 0;
  *(unsigned char *)(v7 + 32) = 5;
  *(void *)(v7 + 40) = self;
  v8 = self;
  sub_1A08BE6E4((uint64_t)v5, (uint64_t)&unk_1E94FBEF0, v7);

  swift_release();
}

- (void)donateSentSetNameAndPhotoProfileEvent
{
  uint64_t v3 = sub_1A07856F8(&qword_1EB4A5650);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1A09F41C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = 0;
  *(void *)(v7 + 24) = 0;
  *(unsigned char *)(v7 + 32) = 6;
  *(void *)(v7 + 40) = self;
  v8 = self;
  sub_1A08BE6E4((uint64_t)v5, (uint64_t)&unk_1E94FBEE8, v7);

  swift_release();
}

- (TipsNextEventReporter)init
{
  uint64_t v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___TipsNextEventReporter_appBundleId);
  *uint64_t v3 = 0xD000000000000013;
  v3[1] = 0x80000001A0A30C80;
  sub_1A09F39D8();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TipsNextEventReporter();
  return [(TipsNextEventReporter *)&v5 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR___TipsNextEventReporter_logger;
  uint64_t v4 = sub_1A09F39E8();
  objc_super v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end