@interface FindMyLocateSession
- (_TtC6HomeUI19FindMyLocateSession)init;
- (id)meDeviceUpdateCallback;
- (void)getActiveLocationSharingDeviceWithCompletionHandler:(id)a3;
- (void)getThisDeviceWithCompletionHandler:(id)a3;
- (void)setActiveLocationSharingDeviceToThisDeviceWithCompletionHandler:(id)a3;
- (void)setMeDeviceUpdateCallback:(id)a3;
- (void)startMonitoringPrefrenceChangesWithCompletionHandler:(id)a3;
- (void)stopMonitoringPreferenceChangesWithCompletionHandler:(id)a3;
@end

@implementation FindMyLocateSession

- (id)meDeviceUpdateCallback
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6HomeUI19FindMyLocateSession_meDeviceUpdateCallback);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BE593140;
    aBlock[3] = &block_descriptor_48;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setMeDeviceUpdateCallback:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1BE597FA4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC6HomeUI19FindMyLocateSession_meDeviceUpdateCallback);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1BE3B21C0(v7);
}

- (void)startMonitoringPrefrenceChangesWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA118420;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA118428;
  v12[5] = v11;
  v13 = self;
  sub_1BE5AF20C((uint64_t)v7, (uint64_t)&unk_1EA118430, (uint64_t)v12);
  swift_release();
}

- (void)stopMonitoringPreferenceChangesWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA118400;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA118408;
  v12[5] = v11;
  v13 = self;
  sub_1BE5AF20C((uint64_t)v7, (uint64_t)&unk_1EA118410, (uint64_t)v12);
  swift_release();
}

- (void)getActiveLocationSharingDeviceWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA1183E0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA1183E8;
  v12[5] = v11;
  v13 = self;
  sub_1BE5AF20C((uint64_t)v7, (uint64_t)&unk_1EA1183F0, (uint64_t)v12);
  swift_release();
}

- (void)getThisDeviceWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA1183C0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA1183C8;
  v12[5] = v11;
  v13 = self;
  sub_1BE5AF20C((uint64_t)v7, (uint64_t)&unk_1EA1183D0, (uint64_t)v12);
  swift_release();
}

- (void)setActiveLocationSharingDeviceToThisDeviceWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA1183B0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA113230;
  v12[5] = v11;
  v13 = self;
  sub_1BE5AF20C((uint64_t)v7, (uint64_t)&unk_1EA1167F0, (uint64_t)v12);
  swift_release();
}

- (_TtC6HomeUI19FindMyLocateSession)init
{
  return (_TtC6HomeUI19FindMyLocateSession *)FindMyLocateSession.init()();
}

- (void).cxx_destruct
{
  sub_1BE3B21C0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC6HomeUI19FindMyLocateSession_meDeviceUpdateCallback));
  swift_release();

  swift_release();
}

@end