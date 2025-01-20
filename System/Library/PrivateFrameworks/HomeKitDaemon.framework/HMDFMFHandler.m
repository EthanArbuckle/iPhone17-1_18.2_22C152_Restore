@interface HMDFMFHandler
+ (HMDFMFHandler)sharedHandler;
- (BOOL)isThisDesignatedFMFDevice;
- (HMDFMFHandler)init;
- (void)queryFMFStatusWithCompletion:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation HMDFMFHandler

+ (HMDFMFHandler)sharedHandler
{
  if (qword_2686D6328 != -1) {
    swift_once();
  }
  v2 = (void *)swift_retain();
  return (HMDFMFHandler *)v2;
}

- (void)startWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D95D0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2302DDE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2686D7918;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2686D7920;
  v12[5] = v11;
  swift_retain();
  sub_22F6C83BC((uint64_t)v7, (uint64_t)&unk_2686D7928, (uint64_t)v12);
  swift_release();
}

- (void)queryFMFStatusWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D95D0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2302DDE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2686D7908;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2686D8770;
  v12[5] = v11;
  swift_retain();
  sub_22F6C83BC((uint64_t)v7, (uint64_t)&unk_2686D98D0, (uint64_t)v12);
  swift_release();
}

- (BOOL)isThisDesignatedFMFDevice
{
  uint64_t v2 = *(void *)&self->findMySession[7];
  v3 = (void *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 24);
  swift_retain();
  os_unfair_lock_lock(v4);
  sub_22F580198(v3, &v6);
  os_unfair_lock_unlock(v4);
  LOBYTE(v3) = v6;
  swift_release();
  return (char)v3;
}

- (HMDFMFHandler)init
{
  swift_defaultActor_initialize();
  self->_anon_60[8] = 0;
  *(void *)self->isStarted = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686D6480);
  uint64_t v3 = swift_allocObject();
  *(_DWORD *)(v3 + 24) = 0;
  *(void *)(v3 + 16) = 0;
  *(void *)&self->findMySession[7] = v3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FindMyHandler();
  return [(HMDFMFHandler *)&v5 init];
}

@end