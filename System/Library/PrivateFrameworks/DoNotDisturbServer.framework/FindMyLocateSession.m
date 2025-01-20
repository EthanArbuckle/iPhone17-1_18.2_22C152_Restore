@interface FindMyLocateSession
- (_TtC18DoNotDisturbServer19FindMyLocateSession)init;
- (id)meDeviceUpdateCallback;
- (void)getActiveLocationSharingDeviceWithCompletionHandler:(id)a3;
- (void)setMeDeviceUpdateCallback:(id)a3;
- (void)startMonitoringPreferencesChangesWithCompletionHandler:(id)a3;
- (void)stopMonitoringPreferenceChangesWithCompletionHandler:(id)a3;
@end

@implementation FindMyLocateSession

- (id)meDeviceUpdateCallback
{
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC18DoNotDisturbServer19FindMyLocateSession_meDeviceUpdateCallback);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1D310AB00;
    aBlock[3] = &block_descriptor;
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
    v4 = sub_1D310F560;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18DoNotDisturbServer19FindMyLocateSession_meDeviceUpdateCallback);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1D310AC70(v7);
}

- (void)startMonitoringPreferencesChangesWithCompletionHandler:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD690B0);
  MEMORY[0x1F4188790]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = self;
  uint64_t v9 = sub_1D31181E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_1EA6A41C0;
  v10[5] = v8;
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA6A41C8;
  v11[5] = v10;
  v12 = self;
  sub_1D310E5B0((uint64_t)v6, (uint64_t)&unk_1EA6A41D0, (uint64_t)v11);
  swift_release();
}

- (void)stopMonitoringPreferenceChangesWithCompletionHandler:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD690B0);
  MEMORY[0x1F4188790]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = self;
  uint64_t v9 = sub_1D31181E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_1EA6A41A0;
  v10[5] = v8;
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA6A41A8;
  v11[5] = v10;
  v12 = self;
  sub_1D310E5B0((uint64_t)v6, (uint64_t)&unk_1EA6A41B0, (uint64_t)v11);
  swift_release();
}

- (void)getActiveLocationSharingDeviceWithCompletionHandler:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD690B0);
  MEMORY[0x1F4188790]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = self;
  uint64_t v9 = sub_1D31181E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_1EA6A4160;
  v10[5] = v8;
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA6A4170;
  v11[5] = v10;
  v12 = self;
  sub_1D310E5B0((uint64_t)v6, (uint64_t)&unk_1EA6A4180, (uint64_t)v11);
  swift_release();
}

- (_TtC18DoNotDisturbServer19FindMyLocateSession)init
{
  return (_TtC18DoNotDisturbServer19FindMyLocateSession *)FindMyLocateSession.init()();
}

- (void).cxx_destruct
{
  sub_1D310AC70(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18DoNotDisturbServer19FindMyLocateSession_meDeviceUpdateCallback));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

@end