@interface TimerCreationDelegateHandler
- (_TtC6HomeUIP33_248B7B14B6FEE0F07C50E5A087FE91DE28TimerCreationDelegateHandler)init;
- (void)timerCreationViewController:(id)a3 didCreateTimer:(id)a4;
@end

@implementation TimerCreationDelegateHandler

- (void)timerCreationViewController:(id)a3 didCreateTimer:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = a4;
  v11[5] = self;
  id v12 = a4;
  v13 = self;
  id v14 = v12;
  v15 = v13;
  id v16 = a3;
  sub_1BE3CD8AC((uint64_t)v9, (uint64_t)&unk_1EA1137E0, (uint64_t)v11);

  swift_release();
}

- (_TtC6HomeUIP33_248B7B14B6FEE0F07C50E5A087FE91DE28TimerCreationDelegateHandler)init
{
  result = (_TtC6HomeUIP33_248B7B14B6FEE0F07C50E5A087FE91DE28TimerCreationDelegateHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end