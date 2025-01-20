@interface AccessoryDetailsHelper
- (_TtC6HomeUI22AccessoryDetailsHelper)init;
- (void)editRoomViewControllerDidFinish:(id)a3 withNewRoom:(id)a4;
@end

@implementation AccessoryDetailsHelper

- (void)editRoomViewControllerDidFinish:(id)a3 withNewRoom:(id)a4
{
  v4 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtC6HomeUI22AccessoryDetailsHelper_roomEditorDidFinish);
  if (v4)
  {
    id v7 = a3;
    id v8 = a4;
    v9 = self;
    sub_1BE3F5604((uint64_t)v4);
    v4(a4);
    sub_1BE3B21C0((uint64_t)v4);
  }
}

- (_TtC6HomeUI22AccessoryDetailsHelper)init
{
  result = (_TtC6HomeUI22AccessoryDetailsHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1BE3B21C0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC6HomeUI22AccessoryDetailsHelper_roomEditorDidFinish));

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC6HomeUI22AccessoryDetailsHelper_suggestedAutomationsViewCoordinator);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6HomeUI22AccessoryDetailsHelper_suggestedAutomationsViewController));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC6HomeUI22AccessoryDetailsHelper_suggestedAutomationsViewRepresentable);

  swift_unknownObjectRelease();
  v4 = (char *)self + OBJC_IVAR____TtC6HomeUI22AccessoryDetailsHelper__canAddKeyToWallet;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA117058);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  v6 = (char *)self + OBJC_IVAR____TtC6HomeUI22AccessoryDetailsHelper__existingSceneCount;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA117060);
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v9)((void *)(v7 - 8), v6, v7);
  id v8 = (char *)self + OBJC_IVAR____TtC6HomeUI22AccessoryDetailsHelper__suggestedSceneCount;

  v9(v8, v7);
}

@end