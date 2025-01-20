@interface CAMSystemOverlayTipManager
+ (BOOL)anyTipPendingOrAvailable;
+ (void)configure;
+ (void)resetDataStore;
- (BOOL)isPortraitOrientation;
- (CAMSystemOverlayTipManager)init;
- (void)recordCaptureEvent;
- (void)recordMenuVisibleEvent;
- (void)recordSliderVisibleEvent;
- (void)setControlsCountParameter:(unint64_t)a3;
- (void)setIsPortraitOrientation:(BOOL)a3;
- (void)setRecordingParameter:(BOOL)a3;
- (void)setSkipTipParameter:(BOOL)a3;
- (void)setSliderVisibleParameter:(BOOL)a3;
- (void)startTipObservationForViewController:(id)a3 sourceItem:(id)a4;
- (void)stopTipObservation;
@end

@implementation CAMSystemOverlayTipManager

- (BOOL)isPortraitOrientation
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayTipManager_isPortraitOrientation);
}

- (void)setIsPortraitOrientation:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayTipManager_isPortraitOrientation) = a3;
}

+ (void)configure
{
}

+ (BOOL)anyTipPendingOrAvailable
{
  uint64_t v2 = sub_209C4CD08();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[0] = 0xD000000000000014;
  v11[1] = 0x8000000209C966E0;
  sub_209C3DA7C();
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
  sub_209C3B7F8();
}

- (void)stopTipObservation
{
  uint64_t v2 = self;
  sub_209C3C708();
}

- (void)recordSliderVisibleEvent
{
  uint64_t v2 = qword_267600670;
  uint64_t v4 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267601178);
  __swift_project_value_buffer(v3, (uint64_t)qword_267603010);
  sub_209C4CCA8();
}

- (void)recordMenuVisibleEvent
{
  uint64_t v2 = self;
  sub_209C3C894();
}

- (void)setSliderVisibleParameter:(BOOL)a3
{
}

- (void)setRecordingParameter:(BOOL)a3
{
}

- (void)setControlsCountParameter:(unint64_t)a3
{
  uint64_t v3 = qword_267600688;
  uint64_t v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267601170);
  __swift_project_value_buffer(v5, (uint64_t)qword_267603058);
  swift_beginAccess();
  sub_209C4CD18();
  swift_endAccess();
}

- (void)setSkipTipParameter:(BOOL)a3
{
}

+ (void)resetDataStore
{
}

- (CAMSystemOverlayTipManager)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayTipManager_isPortraitOrientation) = 0;
  uint64_t v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayTipManager_menuTip);
  *uint64_t v4 = 0xD000000000000014;
  v4[1] = 0x8000000209C966E0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayTipManager_tipObservationTask) = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(CAMSystemOverlayTipManager *)&v6 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

- (void)recordCaptureEvent
{
  id v0 = objc_msgSend((id)BiomeLibrary(), sel_Discoverability);
  swift_unknownObjectRelease();
  id v1 = objc_msgSend(v0, sel_Signals);
  swift_unknownObjectRelease();
  id v2 = objc_allocWithZone(MEMORY[0x263F2A0D8]);
  uint64_t v3 = (void *)sub_209C4D208();
  id v4 = objc_msgSend(v2, sel_initWithContentIdentifier_context_osBuild_userInfo_, v3, 0, 0, 0);

  id v5 = objc_msgSend(v1, sel_source);
  objc_msgSend(v5, sel_sendEvent_, v4);
}

@end