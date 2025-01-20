@interface CAMViewfinderTipManager
+ (BOOL)anyTipPendingOrAvailable;
+ (uint64_t)configure;
+ (void)resetDataStore;
- (BOOL)isPortraitOrientation;
- (BOOL)stylesTipIsValid;
- (CAMViewfinderTipManager)init;
- (uint64_t)recordDidEnterStylesSetupEvent;
- (void)setIsPortraitOrientation:(BOOL)a3;
- (void)setStylesSetupTipIsPresentable:(BOOL)a3;
- (void)startTipObservationForViewController:(id)a3 sourceItem:(id)a4;
- (void)stopTipObservation;
@end

@implementation CAMViewfinderTipManager

- (BOOL)isPortraitOrientation
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CAMViewfinderTipManager_isPortraitOrientation);
}

- (void)setIsPortraitOrientation:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CAMViewfinderTipManager_isPortraitOrientation) = a3;
}

+ (BOOL)anyTipPendingOrAvailable
{
  uint64_t v2 = sub_209C4CD08();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  strcpy(v11, "StylesSetupTip");
  v11[15] = -18;
  sub_209C265CC();
  sub_209C4CB28();
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  int v7 = v6;
  int v8 = *MEMORY[0x263F1C040];
  if (v6 == *MEMORY[0x263F1C040]) {
    goto LABEL_7;
  }
  if (v6 != *MEMORY[0x263F1C048] && v6 != *MEMORY[0x263F1C050])
  {
    sub_209C4D518();
    __break(1u);
LABEL_7:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v7 != v8;
}

- (void)startTipObservationForViewController:(id)a3 sourceItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = self;
  sub_209C244E4();
}

- (void)stopTipObservation
{
  uint64_t v2 = self;
  sub_209C25538();
}

- (void)setStylesSetupTipIsPresentable:(BOOL)a3
{
  uint64_t v3 = qword_267600600;
  uint64_t v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267600C60);
  __swift_project_value_buffer(v5, (uint64_t)qword_267602EF8);
  swift_beginAccess();
  sub_209C4CD18();
  swift_endAccess();
}

- (uint64_t)recordDidEnterStylesSetupEvent
{
  uint64_t v2 = sub_209C4CC28();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)&a1[OBJC_IVAR___CAMViewfinderTipManager_stylesTip + 8];
  v9[0] = *(void *)&a1[OBJC_IVAR___CAMViewfinderTipManager_stylesTip];
  v9[1] = v6;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F1C018], v2);
  sub_209C265CC();
  id v7 = a1;
  sub_209C4C708();
  sub_209C4CAF8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return swift_bridgeObjectRelease();
}

- (BOOL)stylesTipIsValid
{
  uint64_t v3 = sub_209C4CD08();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)&self->isPortraitOrientation[OBJC_IVAR___CAMViewfinderTipManager_stylesTip];
  v11[0] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CAMViewfinderTipManager_stylesTip);
  v11[1] = v7;
  sub_209C265CC();
  int v8 = self;
  sub_209C4CB28();
  BOOL v9 = (*(unsigned int (**)(char *, uint64_t))(v4 + 88))(v6, v3) != *MEMORY[0x263F1C040];
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v9;
}

+ (void)resetDataStore
{
}

- (CAMViewfinderTipManager)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CAMViewfinderTipManager_isPortraitOrientation) = 0;
  uint64_t v4 = (char *)self + OBJC_IVAR___CAMViewfinderTipManager_stylesTip;
  strcpy((char *)self + OBJC_IVAR___CAMViewfinderTipManager_stylesTip, "StylesSetupTip");
  v4[15] = -18;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CAMViewfinderTipManager_tipObservationTask) = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(CAMViewfinderTipManager *)&v6 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

+ (uint64_t)configure
{
  uint64_t v0 = sub_209C4CC48();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267600D28);
  sub_209C4CC68();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_209C791C0;
  sub_209C4CC38();
  sub_209C4CC58();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_209C4CD38();
  return swift_bridgeObjectRelease();
}

@end