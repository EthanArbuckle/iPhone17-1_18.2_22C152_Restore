@interface DiscoverHomeIntentHandler
- (_TtC22HomeAutomationInternal25DiscoverHomeIntentHandler)init;
- (void)confirmDiscoverHome:(DiscoverHomeIntent *)a3 completion:(id)a4;
- (void)handleDiscoverHome:(DiscoverHomeIntent *)a3 completion:(id)a4;
- (void)resolveFiltersForDiscoverHome:(DiscoverHomeIntent *)a3 withCompletion:(id)a4;
@end

@implementation DiscoverHomeIntentHandler

- (void)resolveFiltersForDiscoverHome:(DiscoverHomeIntent *)a3 withCompletion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685D9D00);
  MEMORY[0x270FA5388](v7 - 8, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_22E6D0520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2685DCF00;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2685DBD68;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_22E55D254((uint64_t)v10, (uint64_t)&unk_2685DBD70, (uint64_t)v15);
  swift_release();
}

- (void)confirmDiscoverHome:(DiscoverHomeIntent *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685D9D00);
  MEMORY[0x270FA5388](v7 - 8, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_22E6D0520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2685DCEF0;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2685DBD48;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_22E55D254((uint64_t)v10, (uint64_t)&unk_2685DBD50, (uint64_t)v15);
  swift_release();
}

- (void)handleDiscoverHome:(DiscoverHomeIntent *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685D9D00);
  MEMORY[0x270FA5388](v7 - 8, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_22E6D0520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2685DCEE0;
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

- (_TtC22HomeAutomationInternal25DiscoverHomeIntentHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DiscoverHomeIntentHandler();
  return [(DiscoverHomeIntentHandler *)&v3 init];
}

@end