@interface AISSignOutController
- (AISSignOutController)init;
- (void)signOutAllAccountsWithContext:(AISSignOutContext *)a3 completion:(id)a4;
@end

@implementation AISSignOutController

- (AISSignOutController)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AISSignOutController_listenerEndpoint) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AISSignOutController____lazy_storage___daemonConnection) = (Class)1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AISSignOutController();
  return [(AISSignOutController *)&v3 init];
}

- (void)signOutAllAccountsWithContext:(AISSignOutContext *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9520);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2481753D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2692DB1D8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2692D8140;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_248109968((uint64_t)v9, (uint64_t)&unk_2692D9540, (uint64_t)v14);
  swift_release();
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AISSignOutController____lazy_storage___daemonConnection);
  sub_248109E40(v3);
}

@end