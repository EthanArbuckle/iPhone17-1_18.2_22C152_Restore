@interface SharePlaySessionDetour
- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5;
- (_TtC10Blackbeard22SharePlaySessionDetour)init;
- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5;
- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
@end

@implementation SharePlaySessionDetour

- (_TtC10Blackbeard22SharePlaySessionDetour)init
{
  result = (_TtC10Blackbeard22SharePlaySessionDetour *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10Blackbeard22SharePlaySessionDetour_dynamicOfferCoordinator));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10Blackbeard22SharePlaySessionDetour_webUserInterfaceCoordinator));
  sub_248BC86B0((uint64_t)self + OBJC_IVAR____TtC10Blackbeard22SharePlaySessionDetour_state, type metadata accessor for SharePlaySessionDetour.State);
}

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1522C0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24925DE80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = a5;
  v13[5] = self;
  v13[6] = a3;
  v13[7] = a4;
  id v14 = a3;
  id v15 = a4;
  v16 = self;
  id v17 = a5;
  v18 = v16;
  id v19 = v14;
  id v20 = v15;
  sub_24912E778((uint64_t)v11, (uint64_t)&unk_269678B38, (uint64_t)v13);

  swift_release();
}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  v5 = _Block_copy(a5);
  _Block_release(v5);
  return 0;
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

@end