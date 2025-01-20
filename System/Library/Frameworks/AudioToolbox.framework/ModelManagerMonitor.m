@interface ModelManagerMonitor
- (ModelManagerMonitor)init;
- (void)register_for_inference_monitor_eventsWithEventCallback:(id)a3 completionHandler:;
- (void)unregister_from_inference_monitorWithObserver:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation ModelManagerMonitor

- (void)register_for_inference_monitor_eventsWithEventCallback:(id)a3 completionHandler:
{
  v4 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F7ACA0);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a3);
  v11 = _Block_copy(v4);
  v12 = (void *)swift_allocObject();
  v12[2] = v10;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_1BB815690();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E9F7AD10;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E9F7AD18;
  v15[5] = v14;
  swift_retain();
  sub_1BB291F04((uint64_t)v9, (uint64_t)&unk_1E9F7AD20, (uint64_t)v15);
  swift_release();
}

- (void)unregister_from_inference_monitorWithObserver:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F7ACA0);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1BB815690();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E9F7ACD0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E9F7ACE0;
  v14[5] = v13;
  swift_retain();
  sub_1BB291F04((uint64_t)v9, (uint64_t)&unk_1E9F7ACF0, (uint64_t)v14);
  swift_release();
}

- (ModelManagerMonitor)init
{
  swift_defaultActor_initialize();
  swift_retain();
  sub_1BB815610();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___ModelManagerMonitor_mInferenceTask) = 0;
  uint64_t v3 = OBJC_IVAR___ModelManagerMonitor_mEventObservers;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)sub_1BB292A48(MEMORY[0x1E4FBC860]);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___ModelManagerMonitor_mCounter) = 0;
  swift_release();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ModelManagerMonitor();
  return [(ModelManagerMonitor *)&v5 init];
}

@end