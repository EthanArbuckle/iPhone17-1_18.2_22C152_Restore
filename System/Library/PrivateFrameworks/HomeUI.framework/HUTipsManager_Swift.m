@interface HUTipsManager_Swift
+ (HUTipsManager_Swift)sharedManager;
- (HUTipsManager_Swift)init;
- (uint64_t)warmUp;
- (void)donateAppLaunchEvent;
- (void)toggleDidInteract;
@end

@implementation HUTipsManager_Swift

+ (HUTipsManager_Swift)sharedManager
{
  if (qword_1EBA455C8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBA45538;

  return (HUTipsManager_Swift *)v2;
}

- (void)toggleDidInteract
{
  uint64_t v3 = sub_1BE9C3738();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)&self->tileQuickToggleTip[OBJC_IVAR___HUTipsManager_Swift_tileQuickToggleTip];
  v9[0] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HUTipsManager_Swift_tileQuickToggleTip);
  v9[1] = v7;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4F422A0], v3);
  sub_1BE43C218();
  v8 = self;
  sub_1BE9C36A8();
  sub_1BE9C35A8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  swift_bridgeObjectRelease();
}

- (void)donateAppLaunchEvent
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_1BE9C5038();
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA45958);
  uint64_t v7 = (void *)sub_1BE9C5518();
  sub_1BE9C2BE8();

  uint64_t v8 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = 0;
  *(void *)(v9 + 24) = 0;
  sub_1BE3CD8AC((uint64_t)v5, (uint64_t)&unk_1EA115038, v9);

  swift_release();
}

- (HUTipsManager_Swift)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___HUTipsManager_Swift_tileQuickToggleTip);
  void *v2 = 0xD000000000000017;
  v2[1] = 0x80000001BEA1FDC0;
  uint64_t v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___HUTipsManager_Swift_unanalyzedCameraClipTip);
  *uint64_t v3 = 0xD000000000000021;
  v3[1] = 0x80000001BEA1FDE0;
  uint64_t v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___HUTipsManager_Swift_homeEnergyTip);
  *uint64_t v4 = 0xD000000000000018;
  v4[1] = 0x80000001BEA1FE10;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TipsManager();
  return [(HUTipsManager_Swift *)&v6 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (uint64_t)warmUp
{
  uint64_t v0 = sub_1BE9C37B8();
  uint64_t v12 = *(void *)(v0 - 8);
  uint64_t v13 = v0;
  MEMORY[0x1F4188790](v0);
  v15 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1BE9C3788();
  uint64_t v2 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1BE9C3758();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (HFForceTipsOnboarding()) {
    sub_1BE9C3698();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA45128);
  sub_1BE9C37D8();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BEA10E20;
  sub_1BE9C3748();
  sub_1BE9C3768();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1BE9C3778();
  sub_1BE9C3798();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v14);
  uint64_t v9 = v15;
  sub_1BE9C37A8();
  sub_1BE9C37C8();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v13);
  sub_1BE9C38D8();
  return swift_bridgeObjectRelease();
}

@end