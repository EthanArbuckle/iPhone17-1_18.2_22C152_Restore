@interface SignInOptionChildSetupController
- (_TtC14AppleIDSetupUI32SignInOptionChildSetupController)init;
- (void)childSetupPresenter:(id)a3 didCompleteWithResult:(id)a4;
- (void)childSetupPresenter:(id)a3 didFail:(id)a4;
- (void)setupLocationServicesWithNextTaskInfo:(AISFlowTaskInfoProtocol *)a3 completion:(id)a4;
- (void)setupPasscodeForAccount:(ACAccount *)a3 nextTaskInfo:(AISFlowTaskInfoProtocol *)a4 completion:(id)a5;
- (void)setupPerformAIDASignInWith:(NSDictionary *)a3 completion:(id)a4;
@end

@implementation SignInOptionChildSetupController

- (_TtC14AppleIDSetupUI32SignInOptionChildSetupController)init
{
  result = (_TtC14AppleIDSetupUI32SignInOptionChildSetupController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI32SignInOptionChildSetupController_childFlowPresenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI32SignInOptionChildSetupController_aidaOwnersManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI32SignInOptionChildSetupController_aidaSignInController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI32SignInOptionChildSetupController_cdpUIController));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14AppleIDSetupUI32SignInOptionChildSetupController_navController);
}

- (void)setupPerformAIDASignInWith:(NSDictionary *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269313750);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24835D5F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269315280;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269315288;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_248345748((uint64_t)v9, (uint64_t)&unk_269315290, (uint64_t)v14);
  swift_release();
}

- (void)setupPasscodeForAccount:(ACAccount *)a3 nextTaskInfo:(AISFlowTaskInfoProtocol *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269313750);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24835D5F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269315260;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269315268;
  v16[5] = v15;
  uint64_t v17 = a3;
  swift_unknownObjectRetain();
  v18 = self;
  sub_248345748((uint64_t)v11, (uint64_t)&unk_269315270, (uint64_t)v16);
  swift_release();
}

- (void)setupLocationServicesWithNextTaskInfo:(AISFlowTaskInfoProtocol *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269313750);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24835D5F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269315220;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269314B80;
  v14[5] = v13;
  swift_unknownObjectRetain();
  v15 = self;
  sub_248345748((uint64_t)v9, (uint64_t)&unk_269315240, (uint64_t)v14);
  swift_release();
}

- (void)childSetupPresenter:(id)a3 didCompleteWithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_248345A48();
}

- (void)childSetupPresenter:(id)a3 didFail:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_248345E30(v8);
}

@end