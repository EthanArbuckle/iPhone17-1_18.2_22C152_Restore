@interface CDPDRPDExecutor
- (CDPDRPDExecutor)init;
- (CDPDRPDExecutor)initWithSbDeleter:(id)a3 ledger:(id)a4 circleControl:(id)a5 cdpContext:(id)a6 edpController:(id)a7 isICDPEnabled:(BOOL)a8;
- (void)performRPDWithCompletionHandler:(id)a3;
@end

@implementation CDPDRPDExecutor

- (CDPDRPDExecutor)initWithSbDeleter:(id)a3 ledger:(id)a4 circleControl:(id)a5 cdpContext:(id)a6 edpController:(id)a7 isICDPEnabled:(BOOL)a8
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CDPDRPDExecutor_sbDeleter) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CDPDRPDExecutor_ledger) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CDPDRPDExecutor_circleControl) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CDPDRPDExecutor_cdpContext) = (Class)a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CDPDRPDExecutor_edpController) = (Class)a7;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CDPDRPDExecutor_isICDPEnabled) = a8;
  v11.receiver = self;
  v11.super_class = (Class)CDPDRPDExecutor;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v9 = a6;
  swift_unknownObjectRetain();
  return [(CDPDRPDExecutor *)&v11 init];
}

- (void)performRPDWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC0B4A8);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2186D1B20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  objc_super v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267BD7C90;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267BD7C98;
  v12[5] = v11;
  v13 = self;
  sub_2186BB540((uint64_t)v7, (uint64_t)&unk_267BD7CA0, (uint64_t)v12);
  swift_release();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (CDPDRPDExecutor)init
{
  result = (CDPDRPDExecutor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end