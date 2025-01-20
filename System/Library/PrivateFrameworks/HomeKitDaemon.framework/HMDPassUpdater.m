@interface HMDPassUpdater
+ (HMDPassUpdater)shared;
- (HMDPassUpdater)init;
- (void)removeOrphanedHomeKeyMiscInfoIncludingHomeUUID:(NSUUID *)a3 withFlow:(HMFFlow *)a4 completionHandler:(id)a5;
- (void)removeOrphanedPassesWithFlow:(HMFFlow *)a3 completionHandler:(id)a4;
- (void)setExpressSettingsForPassSerialNumber:(NSString *)a3 enableNFCExpress:(BOOL)a4 enableUWB:(BOOL)a5 authData:(NSData *)a6 flow:(HMFFlow *)a7 completionHandler:(id)a8;
- (void)updatePassForHomeUUID:(NSUUID *)a3 isOnboarding:(BOOL)a4 optionsNumber:(NSNumber *)a5 flow:(HMFFlow *)a6 completionHandler:(id)a7;
@end

@implementation HMDPassUpdater

+ (HMDPassUpdater)shared
{
  if (qword_2686D63A8 != -1) {
    swift_once();
  }
  v2 = (void *)swift_retain();
  return (HMDPassUpdater *)v2;
}

- (void)updatePassForHomeUUID:(NSUUID *)a3 isOnboarding:(BOOL)a4 optionsNumber:(NSNumber *)a5 flow:(HMFFlow *)a6 completionHandler:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D95D0);
  MEMORY[0x270FA5388](v13 - 8);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(unsigned char *)(v17 + 24) = a4;
  *(void *)(v17 + 32) = a5;
  *(void *)(v17 + 40) = a6;
  *(void *)(v17 + 48) = v16;
  *(void *)(v17 + 56) = self;
  uint64_t v18 = sub_2302DDE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_2686DA9F0;
  v19[5] = v17;
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_2686DA9F8;
  v20[5] = v19;
  v21 = a3;
  v22 = a5;
  v23 = a6;
  swift_retain();
  sub_22F6C83BC((uint64_t)v15, (uint64_t)&unk_2686DAA00, (uint64_t)v20);
  swift_release();
}

- (void)removeOrphanedPassesWithFlow:(HMFFlow *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D95D0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2302DDE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2686DA9C8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2686DA9D0;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_22F6C83BC((uint64_t)v9, (uint64_t)&unk_2686DA9D8, (uint64_t)v14);
  swift_release();
}

- (void)setExpressSettingsForPassSerialNumber:(NSString *)a3 enableNFCExpress:(BOOL)a4 enableUWB:(BOOL)a5 authData:(NSData *)a6 flow:(HMFFlow *)a7 completionHandler:(id)a8
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D95D0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = _Block_copy(a8);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a3;
  *(unsigned char *)(v19 + 24) = a4;
  *(unsigned char *)(v19 + 25) = a5;
  *(void *)(v19 + 32) = a6;
  *(void *)(v19 + 40) = a7;
  *(void *)(v19 + 48) = v18;
  *(void *)(v19 + 56) = self;
  uint64_t v20 = sub_2302DDE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v17, 1, 1, v20);
  v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_2686DA9A0;
  v21[5] = v19;
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_2686DA9A8;
  v22[5] = v21;
  v23 = a3;
  uint64_t v24 = a6;
  v25 = a7;
  swift_retain();
  sub_22F6C83BC((uint64_t)v17, (uint64_t)&unk_2686DA9B0, (uint64_t)v22);
  swift_release();
}

- (void)removeOrphanedHomeKeyMiscInfoIncludingHomeUUID:(NSUUID *)a3 withFlow:(HMFFlow *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D95D0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2302DDE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2686DA968;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2686D8770;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  sub_22F6C83BC((uint64_t)v11, (uint64_t)&unk_2686D98D0, (uint64_t)v16);
  swift_release();
}

- (HMDPassUpdater)init
{
  swift_defaultActor_initialize();
  sub_2302DD3C0();
  swift_retain();
  uint64_t v3 = sub_2302DD3B0();
  uint64_t v4 = MEMORY[0x263F8EE80];
  *(void *)&self->_anon_60[8] = v3;
  *(void *)self->queue = v4;
  swift_release();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PassUpdater();
  return [(HMDPassUpdater *)&v6 init];
}

@end