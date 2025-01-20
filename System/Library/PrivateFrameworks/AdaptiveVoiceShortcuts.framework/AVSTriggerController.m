@interface AVSTriggerController
+ (id)sharedInstance;
- (AVSTriggerController)init;
- (id)displayAlertHandler;
- (void)handleAudioBufferInput:(id)a3 time:(unint64_t)a4;
- (void)keywordSpotterDidDetectKeywordWithEvent:(id)a3;
- (void)pauseListening;
- (void)resumeListening;
- (void)setDisplayAlertHandler:(id)a3;
- (void)startListening;
- (void)stopListening;
@end

@implementation AVSTriggerController

- (id)displayAlertHandler
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___AVSTriggerController_displayAlertHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247741234;
    aBlock[3] = &block_descriptor_26;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDisplayAlertHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_247747678;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___AVSTriggerController_displayAlertHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_24771614C(v7);
}

+ (id)sharedInstance
{
  swift_getObjCClassMetadata();
  v2 = (void *)static AVSTriggerController.sharedInstance()();

  return v2;
}

- (AVSTriggerController)init
{
  return (AVSTriggerController *)AVSTriggerController.init()();
}

- (void)startListening
{
  v2 = self;
  AVSTriggerController.startListening()();
}

- (void)stopListening
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F550);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_247750C18();
  uint64_t v7 = sub_247750C38();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 0, 1, v7);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v8;
  sub_247740D34((uint64_t)v5, (uint64_t)&unk_26925FC98, (uint64_t)v9);

  swift_release();
}

- (void)pauseListening
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AVSTriggerController_audioProvider);
  if (*(unsigned char *)(v2 + 80) == 1)
  {
    uint64_t v3 = *(void **)(v2 + 16);
    uint64_t v4 = self;
    objc_msgSend(v3, sel_stop);
    *(unsigned char *)(v2 + 80) = 0;
  }
}

- (void)resumeListening
{
  uint64_t v2 = self;
  sub_24773AB0C();
}

- (void)handleAudioBufferInput:(id)a3 time:(unint64_t)a4
{
  id v7 = a3;
  uint64_t v8 = self;
  v12.is_nil = (char)v8;
  uint64_t v10 = v8;
  v12.value.super.super.isa = (Class)a3;
  v12.value.super._impl = (void *)a4;
  AVSTriggerController.handleAudioBufferInput(_:time:)(v12, v9);
}

- (void).cxx_destruct
{
  swift_release();
  sub_24771614C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AVSTriggerController_displayAlertHandler));

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)keywordSpotterDidDetectKeywordWithEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  AVSTriggerController.keywordSpotterDidDetectKeyword(event:)(v4);
}

@end