@interface SystemEventsAgent
- (BOOL)connected;
- (SystemEventsAgent)init;
- (void)dealloc;
- (void)deinitializePanoramaWithCompletionHandler:(id)a3;
- (void)deregisterSync;
- (void)deregisterWithCompletionHandler:(id)a3;
- (void)disconnectedWithErr:(id)a3;
- (void)getConnectedTrackerWithCompletionHandler:(id)a3;
- (void)initializePanoramaWithCompletionHandler:(id)a3;
- (void)registerWithCallback:(SystemEventsAgent *)self connectedCallback:(SEL)a2 completionHandler:(id)a3;
- (void)registerWithCallback:(id)a3 completionHandler:;
- (void)startPanoramaCaptureWithOrientation:(unsigned __int8)a3 finishedCallback:(id)a4 completionHandler:;
- (void)stateEventWithInfo:(id)a3 connectedState:(int64_t)a4 dockState:(int64_t)a5 trackingButtonState:(int64_t)a6;
- (void)stopPanoramaCaptureWithCompletionHandler:(id)a3;
- (void)systemEventDataWithInfo:(id)a3 data:(id)a4;
- (void)updatePanoramaCaptureDirection:(unsigned __int8)a3;
@end

@implementation SystemEventsAgent

- (void)registerWithCallback:(id)a3 completionHandler:
{
  v4 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a3);
  v11 = _Block_copy(v4);
  v12 = (void *)swift_allocObject();
  v12[2] = v10;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983BE48;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26983BE50;
  v15[5] = v14;
  v16 = self;
  sub_24CF244A8((uint64_t)v9, (uint64_t)&unk_26983BE58, (uint64_t)v15);
  swift_release();
}

- (void)registerWithCallback:(SystemEventsAgent *)self connectedCallback:(SEL)a2 completionHandler:(id)a3
{
  v5 = v4;
  v6 = v3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a3);
  uint64_t v13 = _Block_copy(v6);
  v14 = _Block_copy(v5);
  v15 = (void *)swift_allocObject();
  v15[2] = v12;
  v15[3] = v13;
  v15[4] = v14;
  v15[5] = self;
  uint64_t v16 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v11, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_26983BE28;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_26983BE30;
  v18[5] = v17;
  v19 = self;
  sub_24CF244A8((uint64_t)v11, (uint64_t)&unk_26983BE38, (uint64_t)v18);
  swift_release();
}

- (void)deregisterWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26983BE08;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983BE10;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983BE18, (uint64_t)v12);
  swift_release();
}

- (BOOL)connected
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR___SystemEventsAgent_tracker) != 0;
}

- (void)deregisterSync
{
  v2 = self;
  sub_24CED90DC();
}

- (void)dealloc
{
  v2 = self;
  SystemEventsAgent.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___SystemEventsAgent_logger;
  uint64_t v4 = sub_24CF3B1C0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  sub_24CEA53DC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SystemEventsAgent_callback));
  sub_24CEA53DC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SystemEventsAgent_connectedCallback));
  swift_release();
}

- (void)stateEventWithInfo:(id)a3 connectedState:(int64_t)a4 dockState:(int64_t)a5 trackingButtonState:(int64_t)a6
{
  id v9 = a3;
  uint64_t v10 = self;
  sub_24CEDDFEC(a4, a6);
}

- (void)getConnectedTrackerWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26983BDE8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983BDF0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983BDF8, (uint64_t)v12);
  swift_release();
}

- (void)systemEventDataWithInfo:(id)a3 data:(id)a4
{
  uint64_t v4 = *(void (**)(id))((char *)&self->super.isa + OBJC_IVAR___SystemEventsAgent_callback);
  if (v4)
  {
    id v7 = a3;
    id v8 = a4;
    uint64_t v9 = self;
    sub_24CE44B30((uint64_t)v4);
    v4(v8);
    sub_24CEA53DC((uint64_t)v4);
  }
}

- (void)initializePanoramaWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26983BDC8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983BDD0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983BDD8, (uint64_t)v12);
  swift_release();
}

- (void)deinitializePanoramaWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26983BDA8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983BDB0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983BDB8, (uint64_t)v12);
  swift_release();
}

- (void)updatePanoramaCaptureDirection:(unsigned __int8)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SystemEventsAgent_panoramaController);
  if (v3) {
    *(unsigned char *)(v3 + 50) = a3;
  }
}

- (void)startPanoramaCaptureWithOrientation:(unsigned __int8)a3 finishedCallback:(id)a4 completionHandler:
{
  uint64_t v5 = v4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  uint64_t v13 = _Block_copy(v5);
  uint64_t v14 = swift_allocObject();
  *(unsigned char *)(v14 + 16) = a3;
  *(void *)(v14 + 24) = v12;
  *(void *)(v14 + 32) = v13;
  *(void *)(v14 + 40) = self;
  uint64_t v15 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v11, 1, 1, v15);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26983BD88;
  v16[5] = v14;
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_26983BD90;
  v17[5] = v16;
  v18 = self;
  sub_24CF244A8((uint64_t)v11, (uint64_t)&unk_26983BD98, (uint64_t)v17);
  swift_release();
}

- (void)stopPanoramaCaptureWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26983BD78;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983BBD0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983B880, (uint64_t)v12);
  swift_release();
}

- (void)disconnectedWithErr:(id)a3
{
  uint64_t v4 = self;
  id v5 = a3;
  sub_24CEDE230();
}

- (SystemEventsAgent)init
{
  return (SystemEventsAgent *)SystemEventsAgent.init()();
}

@end