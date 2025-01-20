@interface LocationSearchService
- (_TtC12FinanceKitUI21LocationSearchService)init;
- (void)completer:(id)a3 didFailWithError:(id)a4;
- (void)completerDidUpdateResults:(id)a3;
- (void)dealloc;
@end

@implementation LocationSearchService

- (_TtC12FinanceKitUI21LocationSearchService)init
{
  return (_TtC12FinanceKitUI21LocationSearchService *)sub_243D0F5E0();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12FinanceKitUI21LocationSearchService_completer);
  v3 = self;
  objc_msgSend(v2, sel_cancel);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for LocationSearchService();
  [(LocationSearchService *)&v4 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC12FinanceKitUI21LocationSearchService_resultsContinuation;

  sub_243D11918((uint64_t)v3);
}

- (void)completerDidUpdateResults:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A950);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_243DFEBB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = a3;
  v10[5] = v9;
  id v11 = a3;
  v12 = self;
  sub_243C26D38((uint64_t)v7, (uint64_t)&unk_268E20138, (uint64_t)v10);
  swift_release();
}

- (void)completer:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_243D116FC(v8);
}

@end