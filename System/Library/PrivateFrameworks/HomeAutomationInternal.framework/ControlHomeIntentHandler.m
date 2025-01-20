@interface ControlHomeIntentHandler
- (_TtC22HomeAutomationInternal24ControlHomeIntentHandler)init;
- (void)confirmControlHome:(ControlHomeIntent *)a3 completion:(id)a4;
- (void)handleControlHome:(id)a3 completion:(id)a4;
- (void)resolveFiltersForControlHome:(id)a3 withCompletion:(id)a4;
- (void)resolveTimeForControlHome:(id)a3 withCompletion:(id)a4;
- (void)resolveUserTaskForControlHome:(id)a3 withCompletion:(id)a4;
@end

@implementation ControlHomeIntentHandler

- (void)resolveUserTaskForControlHome:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveFiltersForControlHome:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveTimeForControlHome:(id)a3 withCompletion:(id)a4
{
  v6 = (void (**)(void *, id))_Block_copy(a4);
  id v11 = a3;
  v7 = self;
  id v8 = objc_msgSend(v11, sel_time);
  if (v8)
  {
    v9 = v8;
    id v10 = objc_msgSend(self, sel_successWithResolvedDateComponentsRange_, v8);
    v6[2](v6, v10);
  }
  else
  {
    sub_22E168B6C(0, (unint64_t *)&unk_2685E0A40);
    id v10 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    v6[2](v6, v10);
  }

  _Block_release(v6);
}

- (void)confirmControlHome:(ControlHomeIntent *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685D9D00);
  MEMORY[0x270FA5388](v7 - 8, v8);
  id v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_22E6D0520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2685E0A78;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2685DBD28;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_22E55D254((uint64_t)v10, (uint64_t)&unk_2685DBD30, (uint64_t)v15);
  swift_release();
}

- (void)handleControlHome:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_22E56037C(v7, v8, v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (_TtC22HomeAutomationInternal24ControlHomeIntentHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ControlHomeIntentHandler();
  return [(ControlHomeIntentHandler *)&v3 init];
}

@end