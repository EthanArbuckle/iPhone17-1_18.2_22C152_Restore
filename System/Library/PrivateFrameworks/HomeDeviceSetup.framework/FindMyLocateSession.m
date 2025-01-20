@interface FindMyLocateSession
- (_TtC15HomeDeviceSetup19FindMyLocateSession)init;
- (void)getActiveLocationSharingDeviceWithCompletionHandler:(id)a3;
- (void)setActiveLocationSharingDeviceToThisDeviceWithCompletionHandler:(id)a3;
@end

@implementation FindMyLocateSession

- (void)getActiveLocationSharingDeviceWithCompletionHandler:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C11A50);
  MEMORY[0x270FA5388]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = self;
  uint64_t v9 = sub_23EBBB2F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_268C11AA0;
  v10[5] = v8;
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_268C11AA8;
  v11[5] = v10;
  v12 = self;
  sub_23EBB9AD4((uint64_t)v6, (uint64_t)&unk_268C11AB0, (uint64_t)v11);
  swift_release();
}

- (void)setActiveLocationSharingDeviceToThisDeviceWithCompletionHandler:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C11A50);
  MEMORY[0x270FA5388]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = self;
  uint64_t v9 = sub_23EBBB2F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_268C11A60;
  v10[5] = v8;
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_268C11A70;
  v11[5] = v10;
  v12 = self;
  sub_23EBB9AD4((uint64_t)v6, (uint64_t)&unk_268C11A80, (uint64_t)v11);
  swift_release();
}

- (_TtC15HomeDeviceSetup19FindMyLocateSession)init
{
  uint64_t v3 = sub_23EBBB190();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EBBB1A0();
  MEMORY[0x270FA5388]();
  uint64_t v7 = OBJC_IVAR____TtC15HomeDeviceSetup19FindMyLocateSession_session;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F3CD10], v3);
  uint64_t v8 = self;
  sub_23EBBB1B0();
  sub_23EBBB260();
  swift_allocObject();
  *(Class *)((char *)&self->super.isa + v7) = (Class)sub_23EBBB270();
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC15HomeDeviceSetup19FindMyLocateSession_preferenceChangesTask) = 0;

  Session = (objc_class *)type metadata accessor for FindMyLocateSession();
  v11.receiver = v8;
  v11.super_class = Session;
  return [(FindMyLocateSession *)&v11 init];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end